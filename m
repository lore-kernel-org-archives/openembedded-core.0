Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6A077AF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 16:54:55 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id i34so67581955qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 09:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RM/1mChcL1gTZ9y0KAhpO2UTKOLJEwA5z5cmClALs7c=;
	b=sEX2dIcGyZYaRZfsdtp86JjXscwZEUT6I+5gdqItmn3n1jNasL2hWsIspyhBB6q35b
	5zvMG63fnNX/CKVveBp/ebOvcC9ioiEx1eyqvN/lL3vqnhNIFbFOhHHpRzQxA9fsx6rU
	irKlgw+OfoT88uGhOtE48MxgkmKLqlWgOjYG5hp42eW0UEh/5TAI98uUbk/Nxb0KbG5U
	T4djFniWd3IFew+JH7sijrS2eao9Y/iYpKanrvMYugaP8X2FHioeoDQ/FIJ6pAcUMWdK
	vh0J9ebFZz3lUs3bxqPER8F2A6mI5gQxfT6yefY8U1jWf6NGTHdYJade30ilcYNDnwDM
	pAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RM/1mChcL1gTZ9y0KAhpO2UTKOLJEwA5z5cmClALs7c=;
	b=ZxIQTz4zGnc9xyiWCqGejNjoD8KfDJCX8AYUhJa4fcD73gPoIq2DUlMeGJTfU8MoHn
	4vyHfr4Wo32hJYyx0KpgrB8Yuik5pZF+iG3r5WNnfSgsHWzqKuDWdLc/lzqtMezPXcTi
	qi25gHNsOCPUqtYs1aeOfwroI0K3Gur6xtO5omPSruXYbcDvcv9aHxvTfh7lyivvCffI
	YktvgR6H4tk3FjpiLHiT8fjmmWpcJ5wNqg/wiz0i3bSdQpuTAjvHYe0yDTbHN2nMH59I
	pg2e4mY/kj2iHkoOzBUCYyPhha/T0v7tWHb1FcMD/ztmhOsq1ur0kDQIhm66G0NgViuH
	lKjQ==
X-Gm-Message-State: AFeK/H2Y/uFd1FqmHnY6ZgE7W9CySkvkLyjlZK6E7yrOTzjA0o9YIMD/N1cIJXxCYMGbWH9sM6pVeVdxBHyCH7d7
X-Received: by 10.200.33.182 with SMTP id 51mr9855893qty.65.1489769696960;
	Fri, 17 Mar 2017 09:54:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 17 Mar 2017 09:54:36 -0700 (PDT)
In-Reply-To: <CAHiDW_GWfg73izumSztPm6ipSvz+_EHPM1ugD88CuNFbSnPi_Q@mail.gmail.com>
References: <1489426850-26058-1-git-send-email-jose.a.lamego@linux.intel.com>
	<CAHiDW_GWfg73izumSztPm6ipSvz+_EHPM1ugD88CuNFbSnPi_Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Mar 2017 16:54:36 +0000
Message-ID: <CAJTo0LZXMNMOwXMjriGCKO+RwGtxc+4AE_2xpiQthZ8ksCHzTw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python*-git: Upgrade to version 2.1.3
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
X-List-Received-Date: Fri, 17 Mar 2017 16:54:56 -0000
Content-Type: multipart/alternative; boundary=001a113c641895b998054af009f8

--001a113c641895b998054af009f8
Content-Type: text/plain; charset=UTF-8

On 14 March 2017 at 08:41, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> M3 freeze was scheduled for Feb 28, more than two weeks ago. I think all
> version upgrades after that should have clear justification in the commit
> message or cover letter.
>

Agreed, is there a good reason to merge this (security problems, for
example) or should this wait until 2.4 opens?

Ross

--001a113c641895b998054af009f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2017 at 08:41, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"=
mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>M3 freeze was=
 scheduled for Feb 28, more than two weeks ago. I think all version upgrade=
s after that should have clear justification in the commit message or cover=
 letter.</div><div></div></blockquote></div><br>Agreed, is there a good rea=
son to merge this (security problems, for example) or should this wait unti=
l 2.4 opens?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a113c641895b998054af009f8--
