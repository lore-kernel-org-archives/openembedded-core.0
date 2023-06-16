Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAF8EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 08:37:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.3956.1686904615201994211
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 01:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=RPl8/TE0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f8cc04c287so3142725e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 01:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686904613; x=1689496613;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfIrl0kR+yVcMFHQ00i0DQ6lQ3rVoawsJl2onDafFWA=;
        b=RPl8/TE0Y6r+13sksDucnNT0HhYwyJUF20p+zNY6lR6Tf/GdhL0JC8c7qTazACtFW8
         boTK2RLzQjqP+j0ECIsLrpOFq5pzSZ5c1giIcjBIaPmfVJ4VCrEL+xlymGiZ1sjA5kIp
         px1m1+0WNKD2HyQBXV4IIf8+zq9l9qHDLE06Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686904613; x=1689496613;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gfIrl0kR+yVcMFHQ00i0DQ6lQ3rVoawsJl2onDafFWA=;
        b=Ap7F8ltToExot/p2+BYlHiEpQxbZWBqPSwd+SeuEWLYHEClN736+5B1Tuyrd7hDLHK
         mkEFLpYYSVeNT1UyFun6XHu5CVOEhTemxHBFccHr/0Ed/oX4m0P3cEmTTygea24EWUc/
         lus+alA6zoVkprJJGb122nkd1iAaXAfmo4apHYaUrDTNTiqNIRtvI+R+TGz9u9Y4iQaH
         6T/yHWH2jQJrawK3mvZSiWODPkke85PWlVvTvyz5zypcpCVtZ15c9sDvX+YN6vsjSFF5
         /dsfvFtGNA5g23G1V2LvJEurNvtidowyA00yhbvUCyiaYtltHa0SAdNzNKTMsfgcmN1l
         ziyw==
X-Gm-Message-State: AC+VfDwQr8AlpNOhthVRy5u4/53873QeYnCdAzJs/yAoVsZfgwVrptkR
	jR+EhfnZ2PM5UVTp1bhvxi3v0A==
X-Google-Smtp-Source: ACHHUZ7MwzXYoVMVtUo6wh+cK/QDcdEornjfM1EtBRhMKRhdFxO5ZjYujE0EoCeuE9fWcSBp7SxNQQ==
X-Received: by 2002:adf:e6cf:0:b0:30a:d083:d22d with SMTP id y15-20020adfe6cf000000b0030ad083d22dmr805063wrm.24.1686904613096;
        Fri, 16 Jun 2023 01:36:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b814:609:2b03:c353? ([2001:8b0:aba:5f3c:b814:609:2b03:c353])
        by smtp.gmail.com with ESMTPSA id k7-20020adfe3c7000000b0030fce98f40dsm9128662wrm.42.2023.06.16.01.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 01:36:52 -0700 (PDT)
Message-ID: <7f7e7896f21211c149f8722fa0315639163e6a89.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] baremetal-helloworld: Update SRCREV to fix
 entry addresses for ARM architectures
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2023 09:36:51 +0100
In-Reply-To: <20230609221242.2961719-1-alejandro@enedino.org>
References: <20230609221242.2961719-1-alejandro@enedino.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 08:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183006

On Fri, 2023-06-09 at 16:12 -0600, Alejandro Hernandez Samaniego wrote:
> Update to the latest SRCREV to bring fixes using the proper entry
> addresses for ARM architectures [1], as well as fixing a race condition
> in the Makefile during assembly [2].
>=20
> Fix url in case automatic redirects stop working.
>=20
> [1] https://github.com/ahcbb6/baremetal-helloqemu/commit/602e82aee7ae95ee=
50eedb7f40c4a225ec5a3fb9
> [2] https://github.com/ahcbb6/baremetal-helloqemu/commit/ea7f59b02467ed1f=
b36c3b4c6d5cabe702df26ec
>=20
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
> ---
>  .../baremetal-example/baremetal-helloworld_git.bb             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld=
_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.=
bb
> index 82b2901d51..4182372057 100644
> --- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> +++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> @@ -4,10 +4,10 @@ DESCRIPTION =3D "These are introductory examples to sho=
wcase the use of QEMU to ru
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39346640a23c701e4f459e05f56f4=
449"
> =20
> -SRCREV =3D "22016ecbb9fb6c5f3a7a06698aea7ff8a701c166"
> +SRCREV =3D "ea7f59b02467ed1fb36c3b4c6d5cabe702df26ec"
>  PV =3D "0.1+git${SRCPV}"
> =20
> -SRC_URI =3D "git://github.com/aehs29/baremetal-helloqemu.git;protocol=3D=
https;branch=3Dmaster"
> +SRC_URI =3D "git://github.com/ahcbb6/baremetal-helloqemu.git;protocol=3D=
https;branch=3Dmaster"
>  UPSTREAM_VERSION_UNKNOWN=3D"1"
> =20
>  S =3D "${WORKDIR}/git"

I think there is a build race in here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1609/ste=
ps/14/logs/stdio

Fatal error: can't create build/hello_baremetal_aarch64.o: No such file
or directory

so perhaps racing on the creation of build/ ?

Cheers,

Richard


