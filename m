Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4390660859
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 21:40:56 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id m4so6658707vsa.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 13:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VkMjEFVP5BDOQ1iGszzBPqsXpvlJj8srva6qHQ/uL6c=;
	b=hcYqlIEjqpigCvcMbZOtSsC7zrusVv20SK6+l6hbCCsKDdBJ4iFyLR/nUznWf9Xnq8
	6mW3MZf9TM3S9EDbPmKsxo/A4qAdSD/HM6zpzFVHfkKhSG5P/LNBrS0GE60SWqEIOWNS
	dVL2Yxbd7wK1xWKQz9NZ4zBKJiFYO2ywKokd/Rm4oVIH6aMbcU9F1E7iFD8VmkzXPZ61
	TFgsRsl2Q2H5DhZDSDeL5ThvTIo/tOV6oZMlA8layMJpUlsW7tcNC5HHvaObLQ2aW+Bj
	WVLbjVoQxS9We7FLtCEQoPmyclNl9Ux/e9Ss9pPvEvZG2Sr569yNhmpsam+LsiJ8/+fo
	U5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VkMjEFVP5BDOQ1iGszzBPqsXpvlJj8srva6qHQ/uL6c=;
	b=l6PcpiNxbwANlOfVVlQkKEOQAdi9voAHKzswspmk92mitRUaAMXHJ6dY7MZPF9ZC2V
	BPOfVAosGKtoz1dzDk6IK02vFmSw4tt5bYtSmU21c7eOcElquAKhIe+4sp1i3ru73nqE
	E3ug18Cbf9wm1LLUkWLBMuScyYncPakdXCXMylmFanx+G3odUWecwjKKgQGNrtzevbYT
	rZ2MvQZc8Ub1th5tLpOOzgFVRuYitn+w5LUhLl/oD6+1L2UV2NVDS7KD0P7pl3vzWYSe
	wVidatgCi4L4b9+cKUFdQCnWaPkq9DG2IaAv4+xuykMp6ko+IpMQRBQDW2G40VWfnBll
	NIQw==
X-Gm-Message-State: APjAAAWAtw8gkr5WuZY2FHXU1GCEOYaBHGpe38FAK6AR7JqmJTbc3XQ5
	LvnkVQCTT7GOuDGBN0ABIK+xLWLJqsI6kHv00N4=
X-Google-Smtp-Source: APXvYqxtzum1hNHYAPXPH3QB1DO8FIOYsRDUia1GM4fOJky66VFcThRLJ72IpOf7MUXB5yRhUdsroNhTW33uKymbNNs=
X-Received: by 2002:a67:f51a:: with SMTP id u26mr27109538vsn.11.1582580456926; 
	Mon, 24 Feb 2020 13:40:56 -0800 (PST)
MIME-Version: 1.0
References: <20200122071934.60789-1-alex.kiernan@gmail.com>
	<15178a56a7fff6877d13b52312ffc8b898a60f3f.camel@linuxfoundation.org>
	<CAO5Uq5RVPgtaxUzny-iPCA5L5mBPUW6dmxb0xWRA_c0HSqZF9w@mail.gmail.com>
	<CAJ86T=U8DeE1FeOu5X5y--GEGOANVrs7feHGha_kf_TaUdSKnw@mail.gmail.com>
	<CAO5Uq5SkNGJxnk7L5_dg2OwHh8HC9jcJ+fC34mdaTfgp82cbAA@mail.gmail.com>
In-Reply-To: <CAO5Uq5SkNGJxnk7L5_dg2OwHh8HC9jcJ+fC34mdaTfgp82cbAA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 24 Feb 2020 13:40:45 -0800
Message-ID: <CAJ86T=WrZupO_F0AMcDNayKBMDVzsOSoDGTV6A8-pNhq=GeBAw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxcrypt: Enable static builds
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
X-List-Received-Date: Mon, 24 Feb 2020 21:40:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 21, 2020 at 8:35 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Tue, Jan 28, 2020 at 8:07 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Tue, Jan 28, 2020 at 4:48 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > >
> > > Let me have a look at that - what got me here was trying to get a
> > > static busybox so I could OSTree's tests to pass, which all turned out
> > > to be way harder than I expected; this was just one of the things I
> > > tripped over.
> >
> > Busybox shouldn't need to link with libxcrypt if USE_BB_CRYPT is
> > enabled (which it is in OE's default Busybox defconfig).
> >
> > There's a long standing bug in Busybox whereby crypt.h gets included
> > unconditionally (instead of being guarded by #if ENABLE_USE_BB_CRYPT
> > etc) so the Busybox recipe still needs to depend on virtual/crypt but
> > it's only a compile time dependency.
>
> It looks like that might've been fixed:
>
> 4767a5375e66 libbb: include <crypt.h> only if necessary

Yes, looks like a fix in the Busybox master branch (not in any release
yet though).

> If I drop virtual/crypt, I still get the same link time failure to
> find crypt, which I think we're getting because this test
> https://git.busybox.net/busybox/tree/Makefile.flags#n149 passes:
>
> CRYPT_AVAILABLE := $(shell echo 'int main(void){return 0;}'
> >crypttest.c; $(CC) $(CFLAGS) -lcrypt -o /dev/null crypttest.c
> >/dev/null 2>&1 && echo "y"; rm crypttest.c)
>
> Not quite sure how that can pass tbh...

It looks like that test should just be skipped completely if Busybox
is configured to use its own internal libcrypt? Probably something to
raise on the Busybox mailing list rather than here.

> This ugly hack avoids needing a static crypt:>
> diff --git a/meta/recipes-core/busybox/busybox.inc
> b/meta/recipes-core/busybox/busybox.inc
> index 1a82f23b0f3a..7335a846038f 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -18,7 +18,7 @@ BUSYBOX_SPLIT_SUID ?= "1"
>  export EXTRA_CFLAGS = "${CFLAGS}"
>  export EXTRA_LDFLAGS = "${LDFLAGS}"
>
> -EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH}
> CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}'
> HOSTCPP='${BUILD_CPP}'"
> +EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH}
> CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}'
> HOSTCPP='${BUILD_CPP}' CRYPT_AVAILABLE=n"

That's going to break for anyone who has their own busybox config with
CONFIG_USE_BB_CRYPT disabled.

>  PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog
> ${PN}-mdev ${PN}-hwclock"
>
> Not sure how to get that integrated nicely...
>
> --
> Alex Kiernan

