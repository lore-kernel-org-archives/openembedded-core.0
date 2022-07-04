Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881D1C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 14:19:31 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.72562.1656944364152207107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rlQkDlUd;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id c13so11872847eds.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3VhzLe5ZThCbgPyFsEdjHGXHJ78/ve4h7ZBI8v9pEE4=;
        b=rlQkDlUdOF09Y47kZSuyt8ama+ATD61W/B6jeNJduCN3L2kl3ikLHj0aHW9vdZRWFD
         iscr6S7e7TjI90jj6Zpuw8y8va6WUFp81RQ5pr3nX1Jbs0YYUSLt/CvvNmqKPO5uvAhF
         nxuC66m7O6E/e3t4EVRtsy/S7tm2KHQijlqjHwSS+nc1h1cTuWs0pC/qR88GWsfuP6QO
         YoDS0EsM871pydWja3Y/6YhLyUP2mzBCO+Gj/CPBR9d9o+cjBe+o4zZmb+IQpQ0vGRDh
         LumOPW+rY0MIpqcU0GSgSZwklVxATQ16TzD2B+M8RIUpSAAcX/qMODgmoAoNAvDhVexC
         60pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3VhzLe5ZThCbgPyFsEdjHGXHJ78/ve4h7ZBI8v9pEE4=;
        b=oL4X4mKguninJDjnIzRDRU2aHQ+wtJ0k6XAcyF4wAuxU/WUnqq5W9x+Ar38+eOTuFr
         Z1uNCHGeWlIQ7b/bheP9k4pXvkxQQe9Dzd7YGvJ90k3V85g+NHiA3nFqYukk5t3uWWBv
         8AdjlJNnskyFYX76nRy2hcXwrCPG0whZkB+MHVLOy3nDYszYPtU304Y4pYNqEdWyEUiL
         wTJg0KfGBAH3dNXtSRDuyOrs24IJDm0pFPIyK+0p9DKtodPQtBApt3tl51VjgG9ieNnT
         Jf1rwTWlsb7WGhECiESe0cqWrqtHsLEJ1dfuwjAvX/dxwDCx6TaawSaIziYxi/zhLzfI
         Czow==
X-Gm-Message-State: AJIora8lMQSkxM/xvSuw81905QuMpvvi2YLD6XB9t7oCvn6l+uuUY0hf
	0WPNNhiLr9XKyTtVaipxIIVfwyoFZLEAyGkzVCGAUg==
X-Google-Smtp-Source: 
 AGRyM1sCtJsv8u7zZuQ4dNvt5eqtVr9p4VgjZtpEhzwR4oh/9KT2TUK3Ha3JSp2DOArjMrN1qA+Tpz/Q6HHVxrIchs8=
X-Received: by 2002:a05:6402:5409:b0:42a:a643:4eb8 with SMTP id
 ev9-20020a056402540900b0042aa6434eb8mr39137355edb.71.1656944362270; Mon, 04
 Jul 2022 07:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220704124511.16872-1-Neetika.Singh@kpit.com>
In-Reply-To: <20220704124511.16872-1-Neetika.Singh@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 4 Jul 2022 04:19:10 -1000
Message-ID: 
 <CAOSpxda_xvUbXMZUOoxQbQ86gZ3701KGwZVcGaSO-wCQkNLkaA@mail.gmail.com>
Subject: Re: [OE-core] [meta-java][dunfell] [PATCH] xerces-j: Upgrade to
 2.12.2
To: Neetika.Singh@kpit.com
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 14:19:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167615

Since this is a patch for meta-java it should be sent to:
openembedded-devel@lists.openembedded.org

Also, it shouldn't be tagged for [oe-core], just [meta-java]

Steve

On Mon, Jul 4, 2022 at 2:45 AM Neetika.Singh via
lists.openembedded.org <Neetika.Singh=3Dkpit.com@lists.openembedded.org>
wrote:
>
> From: Neetika Singh <Neetika.Singh@kpit.com>
>
> As per below links CVE-2022-23437 is fixed by upgrade of
> xerces-j version to 2.12.2.
> https://bugs.gentoo.org/show_bug.cgi?id=3DCVE-2022-23437
> https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D743111a72f39a1b24f=
87bd1b2fc32ef707b41407
>
> Hence upgrade the version.
>
> Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
> ---
>  .../xerces-j/{xerces-j_2.11.0.bb =3D> xerces-j_2.12.2.bb}   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename recipes-core/xerces-j/{xerces-j_2.11.0.bb =3D> xerces-j_2.12.2.bb=
} (88%)
>
> diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerc=
es-j/xerces-j_2.12.2.bb
> similarity index 88%
> rename from recipes-core/xerces-j/xerces-j_2.11.0.bb
> rename to recipes-core/xerces-j/xerces-j_2.12.2.bb
> index fda6fe4..bc2780e 100644
> --- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
> +++ b/recipes-core/xerces-j/xerces-j_2.12.2.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
>                      file://LICENSE.serializer.txt;md5=3Dd229da563da18fe5=
d58cd95a6467d584 \
>                     "
>
> -SRC_URI =3D "http://archive.apache.org/dist/xerces/j/Xerces-J-src.${PV}.=
tar.gz"
> +SRC_URI =3D "http://archive.apache.org/dist/xerces/j/source/Xerces-J-src=
.${PV}.tar.gz"
>
>  # CVE only applies to some Oracle Java SE and Red Hat Enterprise Linux v=
ersions.
>  # Already fixed with updates and closed.
> @@ -20,7 +20,7 @@ SRC_URI =3D "http://archive.apache.org/dist/xerces/j/Xe=
rces-J-src.${PV}.tar.gz"
>  # https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542
>  CVE_CHECK_WHITELIST +=3D "CVE-2018-2799"
>
> -S =3D "${WORKDIR}/xerces-2_11_0"
> +S =3D "${WORKDIR}/xerces-2_12_2"
>
>  inherit java-library
>
> @@ -63,7 +63,7 @@ do_compile() {
>
>  }
>
> -SRC_URI[md5sum] =3D "d01fc11eacbe43b45681cb85ac112ebf"
> -SRC_URI[sha256sum] =3D "f59a5ef7b51bd883f2e9bda37a9360692e6c5e439b98d9b6=
ac1953e1f98b0680"
> +SRC_URI[md5sum] =3D "41dde3c515fca8d307416123bc07a739"
> +SRC_URI[sha256sum] =3D "6dd1ebd4c88e935c182375346cd7365514bd8dd2ad2f30f0=
d0b05257bab34ee8"
>
>  BBCLASSEXTEND =3D "native"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167604): https://lists.openembedded.org/g/openembedde=
d-core/message/167604
> Mute This Topic: https://lists.openembedded.org/mt/92163687/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

