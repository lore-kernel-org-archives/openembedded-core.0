Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08484E80A8A
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 01:37:08 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.5195.1695865022961170412
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 18:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FgudGso8;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1dcead29b3eso4662877fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 18:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695865022; x=1696469822; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWMpZFERPoD+RbH6JEVWLTi8N8ISRA1snP678OIMX3U=;
        b=FgudGso8Lc6WkVcbddEFHC/zsqr754FpGMHxh2g5RZEgs8csKR2FQXxdPQIsJ0RDjz
         1iZq3m76+wlx0U8NKXyCpqWmpgzCqKcU9RIGWbGVd8iVxyl9hegqauFaWxxSLWw0brZD
         eNJJ9Q1rYlE6wJnW10VVy7UYCPEuotTzoq7lqLRmvtE8EAUY7mrpElxK6ujn79DDjRIl
         EZtaEB/ZdSS2sjzwDdWsH9r+Jb0O+C3XAJnodPCb2cuisi236QvXAuuo6zHoGhaFBdoX
         ku0DGlK2tUyZ6C+nAHIuYruVaf/kl5jJJp5vKVFo2OM8SkglhV9FWNw0H6cZLBIwh+0C
         lvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695865022; x=1696469822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWMpZFERPoD+RbH6JEVWLTi8N8ISRA1snP678OIMX3U=;
        b=Fcq4YIveSb4IP67oR1XICs9erz77CI178DYzoDwN3L9R6e2FRngBVwydtWTOJj2TIp
         ri3etj7A/CB5aDTiHxgFF1QiCoJ5qe6zB5g5EFIVcb7SB3vCn+Az0Ik5srr+iXdDo9+w
         +bheirtdM30kOn0gcmuQzwH1clyXqg+U/C1+EGHBCrYN4zHYoD1w/LbtsBJCpGpTebYt
         QlXZedbI29SkeE2WBg92RKneNtXjGJxFXHqwO+t9O6di1EGSsB+PQvypGPGUzuiAOynM
         sMfBdynJEUanX7sjpwJmx4B8kgoB8Kag6XQGXY1Ee1Hm+mfuXLEe2GExoKzJabWdWVx1
         2YNA==
X-Gm-Message-State: AOJu0YxXiq/FMXEbW5uafqVdEfnINOio+HTtovhUcMvWI0APPclWq5k/
	dqtvQVbnspF2xb2pO9Gq7TwSKOdhWJOKjos4gsU=
X-Google-Smtp-Source: AGHT+IFrnYxeTr3rAMfvPyxW9X/Zpj4QFYKi8aLdA4cbBZw55is1n5LjmY/qGhMy1XAENU00gonqzzF+7sXRSWlBYcg=
X-Received: by 2002:a05:6870:1584:b0:1bb:cb02:7b97 with SMTP id
 j4-20020a056870158400b001bbcb027b97mr4584310oab.37.1695865021975; Wed, 27 Sep
 2023 18:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230927101243.269982-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20230927101243.269982-1-Deepthi.Hemraj@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Sep 2023 18:36:35 -0700
Message-ID: <CAMKF1srg+PDvifTPbZZWiibsO25R8Vs+uc+eh+aZMDy=70zxZw@mail.gmail.com>
Subject: Re: [OE-core] [][PATCH] glibc: stable 2.38 branch updates.
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Umesh.Kalappa@windriver.com, Naveen.Gowda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 01:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188347

Please rebase this change on top of latest master, seeing patching issues s=
ee
https://errors.yoctoproject.org/Errors/Details/738684/

On Wed, Sep 27, 2023 at 3:14=E2=80=AFAM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Below commits on glibc-2.38 stable branch are updated.
> 0e1ef6779a (HEAD -> release/2.38/master, origin/release/2.38/master) manu=
al/jobs.texi: Add missing @item EPERM for getpgid
> d94461bb86 string: Fix tester build with fortify enable with gcc < 12
> 63250e9c57 iconv: restore verbosity with unrecognized encoding names (bug=
 30694)
> 00ae4f10b5 getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806=
)
> b25508dd77 CVE-2023-4527: Stack read overflow with large TCP responses in=
 no-aaaa mode
> 89da8bc588 NEWS: Add the 2.38.1 bug list
> d3ba6c1333 elf: Move l_init_called_next to old place of l_text_end in lin=
k map
> 750f19526a elf: Remove unused l_text_end field from struct link_map
> a3189f66a5 elf: Always call destructors in reverse constructor order (bug=
 30785)
> 7ae211a01b elf: Do not run constructors for proxy objects
> 92201f16cb libio: Fix oversized __io_vtables
> 5bdef6f27c io: Fix record locking contants for powerpc64 with __USE_FILE_=
OFFSET64
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index a907444f50..f5ebbb2ee6 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.38/master"
>  PV =3D "2.38+git"
> -SRCREV_glibc ?=3D "1aed90c9c8f8be9f68b58e96b6e4cd0fc08eb2b1"
> +SRCREV_glibc ?=3D "0e1ef6779a90bc0f8a05bc367796df2793deecaa"
>  SRCREV_localedef ?=3D "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188296): https://lists.openembedded.org/g/openembedde=
d-core/message/188296
> Mute This Topic: https://lists.openembedded.org/mt/101614434/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

