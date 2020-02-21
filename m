Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7505B616CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 16:35:31 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id p8so2095302iln.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 08:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pZnzksxwuWZ9Qc2sJrIt+oNwmXEYTrxBm3W0y/4mn94=;
	b=jwU8k/SudElbvQGAYO9KeFZxIOPm2z0C+Y6w7hqpLhVED2fc9gA8vXXKQeY0Q+9NFS
	Zk0gDbFInvJkDash7yRQNKYfg5kVhFBk12lnjxy6vD26U39ubaZQ6Hguu3CUgbofnCcH
	Ligl6kIDvvxzFaNNu8s2BkcCUzQqgQufHstHKDxxSB85seFkBxGv1J0tBZP4loaKVitz
	ZOrJs+rl6ITgFpzHE32PM/z9Ljzb6ItSatN8PvX8TWzOo/+SCCLX0Q1o2MvakIMoHNHv
	xXT4ORGeYR8Ylw/uD2MUORk1dRa8qq/Qg0xEuWaQwRH6Qs34/bhndr5Jw1GoS6MTp0Ua
	+hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pZnzksxwuWZ9Qc2sJrIt+oNwmXEYTrxBm3W0y/4mn94=;
	b=H1SBX+r1V/yZTUO5Vag83yVVi/pHZVKeUooAjymbzpGjVamkCwtza/izetZbsHZq5s
	1QHv9+4rEbnuR1L3P4u69JwhwrakUXZqsTalWqlSMgVdZqF5rpVimu2Y4e20csA3Equk
	7aWANrqanoWZ8G+r7ptd5pM1kbqxIG1XEYftgKBFB7siTdlU54SDV2HFooUF+oMsxC4P
	b55qcZibCc/soFC1lUaqLdntFxElG5pXnNdwB6zfcgaSYtDOo/L1gydRMvIqgyL7yZIS
	byY0VWq8F1Xkntb9ejK3gKvptXo/AWkK37rmTHyLqbVvk/Dw1XdXL0FO8fkiF6jq4kHs
	eLYA==
X-Gm-Message-State: APjAAAUkH+jCK+BBS6KpOOstq/bUNN53vTjciiVxxhVR1Wqbn14nMQkV
	yER6F+7+tcqeGAYzI77xb4L5wkWPs6EzIt4b10I=
X-Google-Smtp-Source: APXvYqxRhS+8ZLD5dLVFgsL9nKByKKjyA9NIAUhbISLn6efqiOiO58x0S+nF7wJ6GO4GRSH+DQuQvSGfWeNk9qFcoWE=
X-Received: by 2002:a92:af08:: with SMTP id n8mr36906162ili.217.1582302932435; 
	Fri, 21 Feb 2020 08:35:32 -0800 (PST)
MIME-Version: 1.0
References: <20200122071934.60789-1-alex.kiernan@gmail.com>
	<15178a56a7fff6877d13b52312ffc8b898a60f3f.camel@linuxfoundation.org>
	<CAO5Uq5RVPgtaxUzny-iPCA5L5mBPUW6dmxb0xWRA_c0HSqZF9w@mail.gmail.com>
	<CAJ86T=U8DeE1FeOu5X5y--GEGOANVrs7feHGha_kf_TaUdSKnw@mail.gmail.com>
In-Reply-To: <CAJ86T=U8DeE1FeOu5X5y--GEGOANVrs7feHGha_kf_TaUdSKnw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 21 Feb 2020 16:35:21 +0000
Message-ID: <CAO5Uq5SkNGJxnk7L5_dg2OwHh8HC9jcJ+fC34mdaTfgp82cbAA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Fri, 21 Feb 2020 16:35:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 28, 2020 at 8:07 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Jan 28, 2020 at 4:48 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > Let me have a look at that - what got me here was trying to get a
> > static busybox so I could OSTree's tests to pass, which all turned out
> > to be way harder than I expected; this was just one of the things I
> > tripped over.
>
> Busybox shouldn't need to link with libxcrypt if USE_BB_CRYPT is
> enabled (which it is in OE's default Busybox defconfig).
>
> There's a long standing bug in Busybox whereby crypt.h gets included
> unconditionally (instead of being guarded by #if ENABLE_USE_BB_CRYPT
> etc) so the Busybox recipe still needs to depend on virtual/crypt but
> it's only a compile time dependency.

It looks like that might've been fixed:

4767a5375e66 libbb: include <crypt.h> only if necessary

If I drop virtual/crypt, I still get the same link time failure to
find crypt, which I think we're getting because this test
https://git.busybox.net/busybox/tree/Makefile.flags#n149 passes:

CRYPT_AVAILABLE := $(shell echo 'int main(void){return 0;}'
>crypttest.c; $(CC) $(CFLAGS) -lcrypt -o /dev/null crypttest.c
>/dev/null 2>&1 && echo "y"; rm crypttest.c)

Not quite sure how that can pass tbh...

This ugly hack avoids needing a static crypt:

diff --git a/meta/recipes-core/busybox/busybox.inc
b/meta/recipes-core/busybox/busybox.inc
index 1a82f23b0f3a..7335a846038f 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -18,7 +18,7 @@ BUSYBOX_SPLIT_SUID ?= "1"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"

-EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH}
CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}'
HOSTCPP='${BUILD_CPP}'"
+EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH}
CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}'
HOSTCPP='${BUILD_CPP}' CRYPT_AVAILABLE=n"

 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog
${PN}-mdev ${PN}-hwclock"

Not sure how to get that integrated nicely...

-- 
Alex Kiernan

