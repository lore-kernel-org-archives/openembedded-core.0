Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4019CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 13:22:54 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43055.1782134567601110464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 06:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0A22SEjb;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so31859975e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782134566; x=1782739366; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWlwKMvQMCrG7HRtjk+JWLOLyDoeBpLw5XFdmp5VXLM=;
        b=0A22SEjbadJHNqdDGE9GzR0bw350yApXY1KyrmJnPGQTS55iu5pj4CA/SZhGnmKHW1
         hOoMSYFAfaaHjhzuOvdyWCUvX5v7vbSC0WYEgqJro3lm5Po3jL8PH0/KsNocBhPH+GJ6
         f5CNpgHbVlu48gQ3g/Mx90OnRgU1l+H4jhlz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134566; x=1782739366;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vWlwKMvQMCrG7HRtjk+JWLOLyDoeBpLw5XFdmp5VXLM=;
        b=hYuCcp+lnRrc0+5IxN+4jd4+U+9vai6V0KOGHrySMJgq5vPNU4LOn31idKsq53685q
         JP8WHr3OQCGqsY16H/4YFgasRbj7JzIS1tVddS465VMOUbH5kSGEc1U0m+ETdHfUZCF0
         V/U3+2J2E4zvsd91/vtm6Mk8mSc+pO9MRHzpty5hkvvqViXnkQShtF4O9yi5HegIXwT1
         MysWHbLaKTmPL0ZT/QGdvZHaDXVXM07cGx2C5oIls/vbynPpBS5cMnMunzTrjTcA4ybH
         O7xsOGKcd4OHx//V26Mb5H9ZPjNxXrDgkSRPKsHBangbKFuHO/bxQCXd/JEuRf0We4Yj
         P+TQ==
X-Forwarded-Encrypted: i=1; AFNElJ87EwCrVocs3Ztnzc8J0lH7HXF8Q6zXzfKD4i/oVqIh3z/O51RfIN4qRK09d6fS4vauxIQ4Xyu6gtDNkSH7F34u+A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywcvh9m+KC1ZaOOR2hXV3PcKj5DpmXWjcUylscK6hTkBv87toW0
	PpcppfBp3VOIpv16mLr3KDA0r5HN5OqdM2GMzpPOpli2ahP6ThiRdhxoVLnreRmlgPc=
X-Gm-Gg: AfdE7ckUfOwMfi4FYT1C/oGSgs1ASO0E6dr3+FjhjTZ+wVKB5DInJbPQFFkZ63Bbty0
	C9F2niQAVtY354XhpdqVv0q2UMPLHl9p29Wtte8mRNrxY4pS72ttb8XA1rly1iJOPhMA8oQV7UV
	PtI0dM57oy6wKNG5uQgQikZI9ExTqgBLNZcaKhfIU0mH4i05DKlqDgPlioyuXzsgpaWHp1qsNK6
	yeKoW4c57wLyVA8olQIjnb2O2myYeHqCCuicD5+LfrV5/ZskImhHjdQVH7YNZcumfKHdKaBFa0r
	dkd7qk6z2SOLrDIT9FPojaLnxrj6CCsYPagw2u83wCb5txXjz+HHrnHDdze04tXe625qv2rhaAU
	pEWyyJ2T5VmWhIckNjEZjoUZMg8azmIP5K9sxjEd6dlsawDPISzFYtP+pLSJf+fSpF/Gw1E9tBP
	N5t0xZehH8v0Ml1R9R/hUqFAFFI7058ISMDDF9oBNSEsUGcLPaFA8rYtYDj+0qSDASRFmgD7lq1
	q/T
X-Received: by 2002:a05:600c:a07:b0:492:2c87:3d34 with SMTP id 5b1f17b1804b1-4924233ef9dmr205721635e9.15.1782134565714;
        Mon, 22 Jun 2026 06:22:45 -0700 (PDT)
Received: from localhost (2a01cb001331aa00ae343d7f26e6048e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:ae34:3d7f:26e6:48e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f56aasm26024098f8f.6.2026.06.22.06.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:22:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 15:22:44 +0200
Message-Id: <DJFLZ8SDPJN5.LR8IL72HOUH6@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <git-patches@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>, <sana.kazi@bmwtechworks.in>
Subject: Re: [OE-core] [poky][scarthgap][PATCH] nptl: open threads comm with
 O_WRONLY|O_CLOEXEC
X-Mailer: aerc 0.20.0
References: <20260622050835.985725-1-git-patches@bmwtechworks.in>
In-Reply-To: <20260622050835.985725-1-git-patches@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239295

On Mon Jun 22, 2026 at 7:08 AM CEST, Sana Kazi via lists.openembedded.org w=
rote:
> From: Sana Kazi <sana.kazi@bmwtechworks.in>
>
> pthread_setname_np opens the thread's comm file using O_RDWR, but the
> function only ever writes to it.  This causes two distinct problems:
>
> 1. Missing O_CLOEXEC: the file descriptor is not marked close-on-exec,
> so it remains open across fork+exec.  A child process that audits
> its inherited file-descriptor set will encounter an unexpected /proc
> fd it did not open and may treat this as a security violation and
> abort.
> 2. Unnecessary O_RDWR: requesting read+write access when only write
> access is needed can cause open() to fail under security policies
> that permit writing to /proc/<tid>/comm but deny reading it.
>
> Fix both issues by replacing O_RDWR with O_WRONLY|O_CLOEXEC
> Similarly, updated pthread_getname_np to use O_CLOEXEC.
>
> Signed-off-by: Sana Kazi <sana.kazi@bmwtechworks.in>
> ---

I see you sent that for master and scarthgap, but don't forget wrynose.
I can't take that for scarthgap until there is an equivalent fix in
wrynose.

Regards,

>  .../glibc/glibc/0024-fix-fd-leaks.patch       | 61 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0024-fix-fd-leaks.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0024-fix-fd-leaks.patch b/meta=
/recipes-core/glibc/glibc/0024-fix-fd-leaks.patch
> new file mode 100644
> index 0000000000..633e52a8f9
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0024-fix-fd-leaks.patch
> @@ -0,0 +1,61 @@
> +From 1cba6073e500c7bde9322a2f536fc0c308846c61 Mon Sep 17 00:00:00 2001
> +From: Sana Kazi <Sana.Kazi@bmwtechworks.in>
> +Date: Mon, 15 Jun 2026 16:37:59 +0200
> +Subject: [PATCH] nptl: open threads comm with O_WRONLY|O_CLOEXEC
> +
> +pthread_setname_np opens the thread's comm file using O_RDWR, but the
> +function only ever writes to it.  This causes two distinct problems:
> +
> +1. Missing O_CLOEXEC: the file descriptor is not marked close-on-exec,
> +   so it remains open across fork+exec.  A child process that audits
> +   its inherited file-descriptor set will encounter an unexpected /proc
> +   fd it did not open and may treat this as a security violation and
> +   abort.
> +
> +2. Unnecessary O_RDWR: requesting read+write access when only write
> +   access is needed can cause open() to fail under security policies
> +   that permit writing to /proc/<tid>/comm but deny reading it.
> +
> +Fix both issues by replacing O_RDWR with O_WRONLY|O_CLOEXEC
> +
> +Similarly, updated pthread_getname_np to use O_CLOEXEC.
> +
> +Bug-Id: 34192[https://sourceware.org/bugzilla/show_bug.cgi?id=3D34192]
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
> +Reviewed-by: Florian Weimer <fweimer@redhat.com>
> +---
> + nptl/pthread_getname.c | 2 +-
> + nptl/pthread_setname.c | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dpatch;h=3D1cba6073e500c7bde9322a2f536fc0c308846c61]
> +
> +diff --git a/nptl/pthread_getname.c b/nptl/pthread_getname.c
> +index da23a13ba5..5261993d1f 100644
> +--- a/nptl/pthread_getname.c
> ++++ b/nptl/pthread_getname.c
> +@@ -44,7 +44,7 @@ __pthread_getname_np (pthread_t th, char *buf, size_t =
len)
> +   char fname[sizeof (FMT) + 8];
> +   sprintf (fname, FMT, (unsigned int) pd->tid);
> +=20
> +-  int fd =3D __open64_nocancel (fname, O_RDONLY);
> ++  int fd =3D __open64_nocancel (fname, O_RDONLY | O_CLOEXEC);
> +   if (fd =3D=3D -1)
> +     return errno;
> +=20
> +diff --git a/nptl/pthread_setname.c b/nptl/pthread_setname.c
> +index 62f4964fcc..f9a528c3d8 100644
> +--- a/nptl/pthread_setname.c
> ++++ b/nptl/pthread_setname.c
> +@@ -46,7 +46,7 @@ __pthread_setname_np (pthread_t th, const char *name)
> +   char fname[sizeof (FMT) + 8];
> +   sprintf (fname, FMT, (unsigned int) pd->tid);
> +=20
> +-  int fd =3D __open64_nocancel (fname, O_RDWR);
> ++  int fd =3D __open64_nocancel (fname, O_WRONLY | O_CLOEXEC);
> +   if (fd =3D=3D -1)
> +     return errno;
> +=20
> +--=20
> +2.43.7
> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
> index 7958d64eed..4681ac427d 100644
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> @@ -55,6 +55,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
>             file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bi=
nar.patch \
>             file://0023-qemu-stale-process.patch \
>             file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patc=
h \
> +           file://0024-fix-fd-leaks.patch \
>  "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"


--=20
Yoann Congal
Smile ECS


