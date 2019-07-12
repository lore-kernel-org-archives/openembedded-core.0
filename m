Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 13DF57F0BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 16:43:54 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id 44so8694847qtg.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5uvmGiGOsyM9zsrgP2xnJZMfSRL3JneyKUAMB6cX4tc=;
	b=gXfQrWlZLsq/bfHyVMDeo/v7M+8ZnsE2zkpQlvmP93ukADNLuRw6l3ZvBtAm/Y/LkP
	48rBuheC55Y2HTXzXKn7rFuiefUlbMFgBm04qd9GSF4KvqM22Yd9hcPZTIq5joVbJVMt
	+KMNQbB+DLgNUQo4t3NKl+Scuu/ysWEOnR9JgpqHAkLFGVA7U7eUhhE7JSy2lPTZgMhQ
	qdP7XWwL2HLfkYFd0/q77/x71MJbMOiL9G1+UiN5Dkx9pkA31mnmhgCYSc7HRRKuJDua
	echYK1H2XHBOYAdwsvuky8yersWd02oSnWPbFLnZ9KAc3tTpjRyvQw0Ue5nsyvMzRtKO
	lNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5uvmGiGOsyM9zsrgP2xnJZMfSRL3JneyKUAMB6cX4tc=;
	b=h5LzwbRKaWToCAStSEJVlNMy9YNXW7SU0Muxb+zLiF+AuIhjAn0c/2QYxqEc+AU1cz
	zauXF/aS+qs6M7nbKfDO02xl7iONXiabGfzWqD2A9MywS4e8d9LXR3GuneI+2x0twQ+J
	R5Nv/KoXL/bPQIACWX3O7SqFl3wsHunBBr0py0Ar+RVNHTnNcrkYTq7SnH9NSjKp8BkD
	XT17L5Wb0eSGfGIIaYBX3koPqgYj2IJQwYJvS4E/38c4uwK04RC0/KBnFJOMKYE8K/A6
	v4e7ixs8albeVdfa8P/lThM25c+Iv34lKYZq/4WxQy8jYWt3noehXWelJn+i8b7wA8bj
	SceA==
X-Gm-Message-State: APjAAAVA1cBu92bPc1PUh1xFXFI8xBVA0I/jGdDXZvOtSjWN0EU1G0bB
	nHADra0A1ewBgh6y2QNP2ixSwb4lMvosJsKWm/Xtib8d
X-Google-Smtp-Source: APXvYqzDpcTc/M/J4X61xnKECgAfzqW4orPDOQpPdE4dAhEkiz+WHU7CPKWAL0AmAwRMvOGZWloMnTJgqfItsiFVVd4=
X-Received: by 2002:ac8:525a:: with SMTP id y26mr7162876qtn.378.1562949835767; 
	Fri, 12 Jul 2019 09:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190711235423.23013-1-ross.burton@intel.com>
	<CAMKF1srPCffyPSbQ+_QAd-3rDh4=X8TgDyp0abTPT0fS+9WBhg@mail.gmail.com>
	<CAJTo0LZMEU=45FdVhO0dejvd-KoSbQUM70sz-MasxB22TBiD_g@mail.gmail.com>
In-Reply-To: <CAJTo0LZMEU=45FdVhO0dejvd-KoSbQUM70sz-MasxB22TBiD_g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Jul 2019 09:43:29 -0700
Message-ID: <CAMKF1sqGCtpi2YdZ7gnZ6UKve=s6K2jsAotJMEA3pvSwkaT5SA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ninja: use Python 3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jul 2019 16:43:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 12, 2019 at 12:50 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Fri, 12 Jul 2019 at 01:54, Khem Raj <raj.khem@gmail.com> wrote:
> > Maybe we should encode it in interpreter section inside configure.py
> > itself and upstream it.
>
> I've filed a bug (https://github.com/ninja-build/ninja/issues/1601) to
> see if they have any strong reasons to stick with python instead of
> python3.

OK so they are oblivious to python version which is great, I wish whole python
world was like that
>
> Ross

