Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4878D2A539
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 17:45:08 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.29251.1729100705168379006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 10:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PrsQS2YT;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5eb51947b44so71398eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 10:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729100704; x=1729705504; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DB9SsHvSijf2JXgoFlPabo1gnpwJoUcrnEPC131ejFQ=;
        b=PrsQS2YTfPw6c9gSY1cw9kmlHSPLl0gUggyK4S8EURQvE6L/uVbB4VJOvEvvRVWmEb
         2jPTaaAmkKYX/ZTCCinrHa4kaE/0X95IImrV4sHyyC1pTsF51+9q1FzIj7f6lWKe4MTa
         Fhg4cGgN8lhNqr5xO1rEUtWJ9IEmgDpVL1MRFswlpgrGGxZifMUgu5D+PlJhxRCx1xdI
         XD6/DL0fcGEWsUUjz43KvDl/NgMqLjb2neK4ja8UShUzItnKrjyWYF1i5tHY1QyX1Ibj
         SQbHa63wV0CJY/C6wh4P6lg3m9U40rXq1Z1kPCdovTPHCkbOeO0GeDOoZ2udOBLvH2Ro
         cynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729100704; x=1729705504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DB9SsHvSijf2JXgoFlPabo1gnpwJoUcrnEPC131ejFQ=;
        b=vRDb7i4lm72KvM6b6Ke4gRz2jwjpKFWfylQPwjZOU0YPTyYegyBm7VoXaAFuvBRZyX
         dbFXe+0+MlFR32FJqFhrv4wRS6GEwY7UMtZyT67D7igyu8ZBvGEV6gcC3S2KGZoSZhvP
         6ccnhu+PRIVLKtvQ8QoPtFRqJOtgDgPdQPZviQ0hJEKYBprM6kObnE5qbvEhKRUX6CFM
         gPLsGM3eC4dnhQVn7xzV9AJeivNbPvcOmvkpQDHTGh9A9xBH9KlDCoEbrPKgg90hA/we
         HqEyqXEOtzmKaRBcNxHG81NyUqiL8lN6wyZbgvZlBlHaMAJGJxE+T0cxNig5ekgME2RR
         I7vQ==
X-Gm-Message-State: AOJu0Yzi6kQtWW+Vi+u2fJzRtf7szSFHgWt88UoXpk+ust+7MB/zNN14
	v3V1ISSnXsNg/c7SrZwW3xB0Ci9yKUKPMfqQec/oDOeXVCdxaMjmLTjljpf0Wso6nNxa7sairt8
	ewjTCxTHtySqqvBMBXo2KX+bSg0U=
X-Google-Smtp-Source: AGHT+IGaY7CR7Ro4ldJCrMV639EA+ves6j/LVkWqfUUORhtzyM2bKhWZGuJkWxgm6Laop9L6oREgBeXtvsnXC6bB5BM=
X-Received: by 2002:a05:6820:2914:b0:5e5:c55e:ac90 with SMTP id
 006d021491bc7-5eb58c0fd1amr3722147eaf.3.1729100704279; Wed, 16 Oct 2024
 10:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241016171652.5138-1-mail2szahir@gmail.com>
In-Reply-To: <20241016171652.5138-1-mail2szahir@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Oct 2024 10:44:37 -0700
Message-ID: <CAMKF1srPcTWCJz4azwEmZeoP4fNZaYm2smzUVW3k5fhg+_KGGQ@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] alsa-lib: enabling ptest for alsa-lib component
To: mail2szahir@gmail.com
Cc: openembedded-core@lists.openembedded.org, zahir.basha@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 17:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205970

On Wed, Oct 16, 2024 at 10:17=E2=80=AFAM aszh07 via lists.openembedded.org
<mail2szahir=3Dgmail.com@lists.openembedded.org> wrote:
>
> This change adds ptest for alsa-lib.
>
> 1) Removed the test suite execution 'make check-TESTS' call using 'sed' c=
ommand.
>
> 2) Compiled the test directory source code using "oe_runmake check" comma=
nd.
>
> 3) Copied all the required binaries into PTEST_PATH using do_install_ptes=
t()
>  function.
>
> Signed-off-by: aszh07 <mail2szahir@gmail.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../alsa/alsa-lib_1.2.12.bb                   | 23 +++++++++++++++++--
>  meta/recipes-multimedia/alsa/files/run-ptest  | 14 +++++++++++
>  3 files changed, 36 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-multimedia/alsa/files/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index 4a48188562..f0ffe11347 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -5,6 +5,7 @@
>  #
>  PTESTS_FAST =3D "\
>      acl \
> +    alsa-lib \
>      apr-util \
>      attr \
>      babeltrace \
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb b/meta/recip=
es-multimedia/alsa/alsa-lib_1.2.12.bb
> index d9136052b7..1aa19dac6d 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb
> @@ -9,10 +9,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b9107=
6e631dd8edb7424769c7 \
>                      file://src/socket.c;md5=3D285675b45e83f571c6a957fe4a=
b79c93;beginline=3D9;endline=3D24 \
>                      "
>
> -SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
> +SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
> +           file://run-ptest \
> +         "
>  SRC_URI[sha256sum] =3D "4868cd908627279da5a634f468701625be8cc251d84262c7=
e5b6a218391ad0d2"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
>
>  EXTRA_OECONF +=3D " \
>      ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d=
)} \
> @@ -42,3 +44,20 @@ RREPLACES:alsa-conf =3D "alsa-conf-base"
>  RCONFLICTS:alsa-conf =3D "alsa-conf-base"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +do_compile_ptest() {
> +        sed -i 's/^.*$(MAKE) $(AM_MAKEFLAGS) check-TESTS.*$/ /' ${S}/tes=
t/lsb/Makefile.in

Can we do this sed operation as a patch and apply it unconditionally,
since it's only editing
tests makefile, it seems harmless for the rest of the component.

> +        oe_runmake check
> +}
> +
> +do_install_ptest:append() {
> +    for f in control client_event_filter namehint
> +    do
> +        install -m 0755 "${B}/test/.libs/$f" "${D}${PTEST_PATH}";
> +    done
> +
> +    for f in config midi_event
> +    do
> +        install -m 0755 "${B}/test/lsb/.libs/$f" "${D}${PTEST_PATH}";
> +    done
> +}
> diff --git a/meta/recipes-multimedia/alsa/files/run-ptest b/meta/recipes-=
multimedia/alsa/files/run-ptest
> new file mode 100644
> index 0000000000..8fbf9f140a
> --- /dev/null
> +++ b/meta/recipes-multimedia/alsa/files/run-ptest
> @@ -0,0 +1,14 @@
> +#!/bin/sh
> +set -eux
> +
> +for t in config control midi_event client_event_filter client_event_filt=
er
> +do
> +    if "./$t" > "alsa-lib_$t.log" 2>&1
> +    then
> +        echo "PASS: $t"
> +    else
> +        echo "FAIL: $t"
> +        cat "alsa-lib_$t.log"
> +    fi
> +    rm "alsa-lib_$t.log"
> +done
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205969): https://lists.openembedded.org/g/openembedde=
d-core/message/205969
> Mute This Topic: https://lists.openembedded.org/mt/109048136/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

