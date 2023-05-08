Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AEFC77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 19:15:41 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.118278.1683573331155812743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 May 2023 12:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jY7VUyRh;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-76c524a7c8eso35700739f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 12:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683573330; x=1686165330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TghL4XQox8ANDppsRAorhqUAOybciMcr2zzwVDfFeg8=;
        b=jY7VUyRhTVOmuIusmscMYl1WgumAQzNoHfBNEC5pznjkJGoMyJyXtF+hNsTDUO/kQ9
         084Xf6nxhnEH4KClmuCVrJR3XfLUL1+X0VxYy2R/IOFR//VMTtjR4fUghbtYXnEIsTbR
         tDuL1aS9oGlZdgekVvBt6PvXRpXC/Jf1QvOvl5kFMtnxzFh4HHsYYgArPNN0t1Ks807s
         LZstFgwVI9nLv4xZ0ChYcJYlSjv+b3ybshLlPMQjhq+gphxDg4cl8WxvlH4HL3fC1MoH
         tJ0N0ifU5H1qm182TgviIWod7AWS7u7GOuiabyt3OVzx0Ix7qfTEZUWHX2KJ3Z9Izi2d
         QMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683573330; x=1686165330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TghL4XQox8ANDppsRAorhqUAOybciMcr2zzwVDfFeg8=;
        b=at9UaVefObT5blEjOoa/w1iuAQjf8kTZMQJNURPWskkJe9OG7mh1mmmOjy9oI5q5/H
         33C1SwPuSWZPJQvh1bknKXZGovZuD6AJN4KCFlg1hZr2ElYdtsP/LYrJPa/Vn4RZMqo6
         xqrGCdiwf8ieqks3zbhpEPp2BzxbA/xvzD69zPFP/j5j3Z6qQ1IEMouaqHT3HrMwhifs
         y12BGuaeIJ7OD2LGbV06tJjjTNWYX9AQzFGMCJcqOGrrMMQr7ssYL5knJl83Vathx+p2
         XV6l/3JnecIKwygwBy23uHzINNcdKwileuOMVRlnA6ck++L8wK2kbOmH3kdXCEjmz5Sh
         dPFw==
X-Gm-Message-State: AC+VfDxDuw2S8TExrmU+M90uShWR4sQka44dtOz0Fz9w/s3nmB1MDNN0
	v09FqpaI6ZMAwWdymDSm4lebT4UxurN5KojRQ2Q=
X-Google-Smtp-Source: ACHHUZ5B07AQ+opXZP/D1+gcF+dQ3TioIIQldvgaWg79k8MY0DlkF/p5Tcbw7vprXlGQD8+cdLXNMivN5UVZh39giqE=
X-Received: by 2002:a5e:9806:0:b0:763:5f38:6e36 with SMTP id
 s6-20020a5e9806000000b007635f386e36mr8121140ioj.9.1683573330333; Mon, 08 May
 2023 12:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230508170423.3555574-1-max.oss.09@gmail.com>
In-Reply-To: <20230508170423.3555574-1-max.oss.09@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 8 May 2023 15:15:19 -0400
Message-ID: <CADkTA4M0VZ0DG_iTh=Oz5wJ_vquDP-sUpbiCghs8oyPUa-+iGQ@mail.gmail.com>
Subject: Re: [OE-core][Patch 1/1] perf: add libtraceevent packageconfig
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 19:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181027

On Mon, May 8, 2023 at 1:05=E2=80=AFPM Max Krummenacher <max.oss.09@gmail.c=
om> wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> With kernel 6.4-rc1 commit 6898e60f709b ("perf build: If libtraceevent
> isn't present error the build") having libtraceevent is a required
> dependency unless building it with 'NO_LIBTRACEEVENT=3D1'. Older kernels
> did print a warning and build perf with reduced functionality.
>

We might also consider bringing libtraceevent into core, since there
is an in-kernel provider.
Since perf is now erroring when it isn't present, they clearly
consider it fairly core
functionality (even if it can be disabled).

> Add a libtraceevent packageconfig which if not present builds with
> NO_LIBTRACEEVENT=3D1 and if present depends on the meta-openembedded
> provided libtraceevent.
> Fixup the to be called pkg-config as $(CROSS_COMPILE)pkg-config doesn't
> exist.
>

The pkg-config changes need to be a separate commit.

It is interesting that these are needed, as we have been using
packageconfig variables
with core for quite some time now.

But looking more closely, it does appear that we are mainly just
setting the NO_*
flags, and not using pkg-config to locate libs and flags. and libraceevent =
is
exposing the issue. If that is true, it is worth logging that in the
commit log, so
we can understand why it is only needed now.

I had to convince myself that we aren't tangling up the host versus native
pkg-config in perf (since it already acknowledges the difference with the
CROSS_COMPILE prefix to pkg-config) .. and I did confirm that we want the
target pkg-config settings for this, which pkg-config will be picking up.

(for the main kernel builds, we override pkg-config to point to host settin=
gs,
but that isn't the use in perf at the moment).

Bruce

> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index 2f28d16fba..110711f4ac 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -27,6 +27,7 @@ PACKAGECONFIG[jvmti] =3D ",NO_JVMTI=3D1"
>  PACKAGECONFIG[audit] =3D ",NO_LIBAUDIT=3D1,audit"
>  PACKAGECONFIG[manpages] =3D ",,xmlto-native asciidoc-native"
>  PACKAGECONFIG[cap] =3D ",,libcap"
> +PACKAGECONFIG[libtraceevent] =3D ",NO_LIBTRACEEVENT=3D1,libtraceevent"
>  # Arm CoreSight
>  PACKAGECONFIG[coresight] =3D "CORESIGHT=3D1,,opencsd"
>
> @@ -87,6 +88,7 @@ EXTRA_OEMAKE =3D '\
>      perfexecdir=3D${libexecdir} \
>      NO_GTK2=3D1 \
>      ${PACKAGECONFIG_CONFARGS} \
> +    PKG_CONFIG=3Dpkg-config \
>      TMPDIR=3D"${B}" \
>      LIBUNWIND_DIR=3D${STAGING_EXECPREFIXDIR} \
>  '
> @@ -287,6 +289,7 @@ do_configure:prepend () {
>          sed -i 's,CC =3D $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/perf/Makef=
ile.perf
>          sed -i 's,AR =3D $(CROSS_COMPILE)ar,#AR,' ${S}/tools/perf/Makefi=
le.perf
>          sed -i 's,LD =3D $(CROSS_COMPILE)ld,#LD,' ${S}/tools/perf/Makefi=
le.perf
> +        sed -i 's,PKG_CONFIG =3D $(CROSS_COMPILE)pkg-config,#PKG_CONFIG,=
' ${S}/tools/perf/Makefile.perf
>      fi
>      if [ -e "${S}/tools/lib/api/Makefile" ]; then
>          sed -i 's,CC =3D $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/lib/api/Ma=
kefile
> --
> 2.35.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181022): https://lists.openembedded.org/g/openembedde=
d-core/message/181022
> Mute This Topic: https://lists.openembedded.org/mt/98765780/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

