Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6F66870703
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 16:28:20 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id i13so1832145qae.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 09:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cRcCpxKVhRrWoVKId+un+0OrJVVLm3Q6OYzScUWuXso=;
	b=QXChUinD5If5KZGMkFmzD3KPYESkU7C18H/K/xgGulIWaD4h6gIvfITBS+uESI5UFU
	o3RWuKYd+CIjGMYhr8m2I+Fb8GMjfRdLWQqEi5Y8kgD+Hfw8dHnbDDffvFEv88jQLLD4
	WWvy6uhQCnujl3jTEn6pihMVHMriHNyMFiMjFMVh++zdDJENsBQ/TIEGl1K7Fa3ov0x4
	MjBAYREkjnSC62+pjZflKMrw393y2eKG4ec4d5x65uJJraKyvD60vSG/fTc4OrL8jyij
	gRINLLqUjddEiM+k+a0XJEMKFffeK5lEjR67+R/hqAtU7r+BQySahT1Fb6eSxIl2ijNO
	O4Yg==
X-Gm-Message-State: ALoCoQnWKcSXs6+vQeoPMVV5ADgBuDjdG4q2P9oGZ5rmYpjuibuXI4VVKFKbCHo//5iwLyAyFFFe
X-Received: by 10.140.105.67 with SMTP id b61mr1385020qgf.87.1412958501758;
	Fri, 10 Oct 2014 09:28:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Fri, 10 Oct 2014 09:28:01 -0700 (PDT)
In-Reply-To: <20141010153034.GK18916@piout.net>
References: <20141010153034.GK18916@piout.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Oct 2014 17:28:01 +0100
Message-ID: <CAJTo0LZ5-QW2mE5NMM14UvbmfguHGajOimxPrbSEp-EMjfNqEg@mail.gmail.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Issue with pkgconfig and ncurses
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
X-List-Received-Date: Fri, 10 Oct 2014 16:28:22 -0000
Content-Type: text/plain; charset=UTF-8

On 10 October 2014 16:30, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> I tracked down the issue: when configuring alsa-utils, configure tries
> to use pkg-config to fin CFLAGS/LDFLAGS for ncurses. This was failing so
> it is falling back to use ncursesw5-config which points cflags and
> ldflags to the x86_64 sysroot.

http://patchwork.openembedded.org/patch/80727/ is an existing fix for
this, but it never got merged.  I've queued it locally and hopefully
we can push it into 1.7.

Ross

