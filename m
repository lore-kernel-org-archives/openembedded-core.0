Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8414F7487D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 12:02:13 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id r25-v6so8385653lfd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 05:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iogsmlQObHR3qzNonh/+Z0kdBkftRMUniCP8ZNuSPuo=;
	b=iFj9GZfRxBJ7MAD5pfVM8N+zkFmPFGE9UgDuo4sRvU0tzfAzfr5L5ctB1IJNxPqXIp
	9KC0E/HxDjPpPdvjaTMkN4/Srn9IQL05Ol/cuWusk6sPSbKCtgMxaDUISwKdGHF36MxY
	UkiJ3ULsjjVUhfr+cjLu2lWPUIDkjcnP+mIfk/c5X1ZMV4s/Ze27GdAJ+Qb3ZdL2wrMb
	+3WycIEGUXFrp6WPh0e4Vb3dalb8zpYe85cNmwoRvI/F04H5OeYYO6OO84xUAuWYmr/m
	uoZd+p+xNewQ/vzc2ODg2jI5Pkj+bsSO7exmp/0arbT6miiIwj1UpfsnljG5FnpT3Mx6
	OY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iogsmlQObHR3qzNonh/+Z0kdBkftRMUniCP8ZNuSPuo=;
	b=Vu5O9tZq3jwiNETMbHuhyGIKV+n4z2gQgKUVoQ4XGpIAvHggLWURglJ6omT329JbOy
	hhdHB84pArRGuBb9nPGNU34Rvl8xwUghZMw4mgbzQuLqGlOiS6imD0+QfijD2PFRudaA
	f1MZEEyY+k5fkIG9rkwRbSj3o0MRaSo6vsOwprbrGJBtYadXP5eAQ5Ww5rT4VvLR7qky
	i15lS7H8PFFwuVtUEGrKGja25x4KTCFOL8nGVRr1HwI5saldCAZ9e89IrgswmvmHbWqX
	7OFJQH8EzxbnX9IL4J8hJ93ofrkuivzQVGRGz8hnbHqbzOetb3uhYOmH0QRMkD1sgh1H
	UhTw==
X-Gm-Message-State: ALKqPwdHGO4zN0gt0aauLMbbjSgDx21y1hEtbpmZ0xkAVGX0DC731EnF
	+zKIo3EZ9KbtM5CJo3Vig83/n/X60bM+b5vqZiDXzw==
X-Google-Smtp-Source: AB8JxZosm7BhYvHt7qduMe9TSWOx/zEPLZ5uUWrp9rwlG4vDx90XKnKAG5c/Yuymku2MadRlU2vpKXZPduxtolgT1fU=
X-Received: by 2002:a19:ccc3:: with SMTP id
	c186-v6mr18123526lfg.82.1526558534065; 
	Thu, 17 May 2018 05:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20180517085704.28799-1-ricardo.ribalda@gmail.com>
	<20180517133916.0c6b0a9c@t460p>
In-Reply-To: <20180517133916.0c6b0a9c@t460p>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 17 May 2018 14:01:57 +0200
Message-ID: <CAPybu_0Uprq-Qitz_ER3rfp01MfD4RXDw3LtmHj-3rMG=TNVVA@mail.gmail.com>
To: obi@opendreambox.org
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] apt: Port apt-file to busybox readlink
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
X-List-Received-Date: Thu, 17 May 2018 12:02:14 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Andreas

Yes, I agree. But until that happen we can fix the bug with a one liner
that works for coreutils and busybox without risking program relaying on
the wrong behaviour of busybox
On Thu, May 17, 2018 at 1:39 PM Andreas Oberritter <obi@opendreambox.org>
wrote:

> Dear Ricardo,

> On Thu, 17 May 2018 10:57:04 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> > Redlink from busybox and coreutils behave differently on missing files.
> > This leads to apt-key miss-behaving and also segure apt-get

> wouldn't it be more appropriate to improve the behavior of busybox?

> Best regards,
> Andreas


> >
> > root@qt5122:~# apt-key exportall
> > touch: : No such file or directory
> >
> > W: An error occurred during the signature verification. The repository
is not updated and the previous index files will be used. GPG error:
http://release.qtec.com:5022/qtec/europa/deb/qt5122 ./ Release: At least
one invalid signature was encountered.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > ---
> > v2: Add missing signed-off-by
> >
> >  meta/recipes-devtools/apt/apt.inc             |  1 +
> >  ...t-Fix-apt-file-with-busybox-readlink.patch | 41 +++++++++++++++++++
> >  2 files changed, 42 insertions(+)
> >  create mode 100644
meta/recipes-devtools/apt/apt/0001-apt-Fix-apt-file-with-busybox-readlink.patch
> >
> > diff --git a/meta/recipes-devtools/apt/apt.inc
b/meta/recipes-devtools/apt/apt.inc
> > index f1cde3068d..995bfc45ee 100644
> > --- a/meta/recipes-devtools/apt/apt.inc
> > +++ b/meta/recipes-devtools/apt/apt.inc
> > @@ -13,6 +13,7 @@ SRC_URI = "
http://archive.ubuntu.com/ubuntu/pool/main/a/${BPN}/${BPN}_${PV}.tar.
> >             file://disable-test.patch \
> >
file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
> >             file://0001-apt-1.2.12-Fix-musl-build.patch \
> > +           file://0001-apt-Fix-apt-file-with-busybox-readlink.patch \
> >             "
> >  SRC_URI[md5sum] = "ce8f9ab11f4fd0a08ec73eaffd75c8f0"
> >  SRC_URI[sha256sum] =
"fa1311a9ce00e72379a0a3bc6d240ba30c0968cfbbb3472859e50b99e24e9598"
> > diff --git
a/meta/recipes-devtools/apt/apt/0001-apt-Fix-apt-file-with-busybox-readlink.patch
b/meta/recipes-devtools/apt/apt/0001-apt-Fix-apt-file-with-busybox-readlink.patch
> > new file mode 100644
> > index 0000000000..684e3b1626
> > --- /dev/null
> > +++
b/meta/recipes-devtools/apt/apt/0001-apt-Fix-apt-file-with-busybox-readlink.patch
> > @@ -0,0 +1,41 @@
> > +From 3e0804f7882088186f47ff3c3c9e60998a1d93a0 Mon Sep 17 00:00:00 2001
> > +From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > +Date: Thu, 17 May 2018 10:42:44 +0200
> > +Subject: [PATCH] apt: Fix apt-file with busybox readlink
> > +
> > +Busybox readlink behaves diferently that coreutils readlink:
> > +
> > +root@qt5122:~# touch /tmp/this_file_exist
> > +root@qt5122:~# busybox readlink -f /tmp/this_file_exist
> > +/tmp/this_file_exist
> > +root@qt5122:~# readlink -f /tmp/this_file_exist
> > +/tmp/this_file_exist
> > +
> > +root@qt5122:~# readlink -f /tmp/this_file_does_not_exist
> > +/tmp/this_file_does_not_exist
> > +root@qt5122:~# busybox readlink -f /tmp/this_file_does_not_exist
> > +root@qt5122:~#
> > +
> > +This patch make apt-file compatible with busybox readlink
> > +
> > +Upstream-Status: Inappropriate [OE specific]
> > +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > +---
> > + cmdline/apt-key.in | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/cmdline/apt-key.in b/cmdline/apt-key.in
> > +index eab5805..421c981 100644
> > +--- a/cmdline/apt-key.in
> > ++++ b/cmdline/apt-key.in
> > +@@ -313,6 +313,7 @@ merge_all_trusted_keyrings_into_pubring() {
> > +     # does the same as:
> > +     # foreach_keyring_do 'import_keys_from_keyring'
"${GPGHOMEDIR}/pubring.gpg"
> > +     # but without using gpg, just cat and find
> > ++    touch "${GPGHOMEDIR}/pubring.gpg"
> > +     local PUBRING="$(readlink -f "${GPGHOMEDIR}/pubring.gpg")"
> > +     rm -f "$PUBRING"
> > +     touch "$PUBRING"
> > +--
> > +2.17.0
> > +



-- 
Ricardo Ribalda

