Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409BFC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 19:36:23 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.29909.1656617775243138300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ShfRkqBm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so208614wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=+EWoXWAMyLGXPh6nhf9lhvIugTXSEhopD8DI4u2SprY=;
        b=ShfRkqBm4NbYdVBFhwbCS/4D33BQymVnc68y2vzWk3utNSAp+5Yy2BUyL6W3fOSZ1w
         NG3i9WX22ZZIbZEt+eFrXIIPIzr1qat1SGmvWnlUVRdKk8eJtIsk826aIWEHW0igaY9h
         Br91XAfYKuHQRSN2XResNg49pqvv4L6kvc3Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=+EWoXWAMyLGXPh6nhf9lhvIugTXSEhopD8DI4u2SprY=;
        b=W6XM3Omo5CgfXGpwSZkNKjlvb1DV0ZIc0Whiz7yF0SkJuLYY2d/UtMz0fYxEgUeL7F
         43Tq5YzSKYxNFtgONpMz4drCYg5HXNXGEKKKMgUs9OKYfnog6SbQ4vRWwBydMyA3+vvT
         eLQz5xQ+TlQEHbIlN+uFrOnTKlimOoAZhTQCacN3K5u2u7zjIAYLXQ8jL41/yRBvKOrN
         7zt10DqmhC2H3eSt0rchMB77RyoCt0je+icPeCrqrpArGsZbXuEHLY46kv7lEIdj1N4L
         8iXZL+8pvoECSacGVFz+FgA6SOrBBv6sUY8VrPKBg+1dfj8v5SuDjEZrh+ICwpnGTvDh
         duaQ==
X-Gm-Message-State: AJIora+QgJcbsFswI16ToEO5CVl9L0WtqkIw3Gpyy+yGp5Rf8pD34Obf
	O3HjS4vr+nII/s2xXlCL4B7jGT6KzVAzmw==
X-Google-Smtp-Source: 
 AGRyM1usIo074qNu30SQNAOY74Y+H5uiFHtTcO6c0oLTS3JFbQ21nNfLf7EWlFVCi8j87hik+rJuZQ==
X-Received: by 2002:a05:600c:34c9:b0:3a0:5072:9abe with SMTP id
 d9-20020a05600c34c900b003a050729abemr11690120wmq.8.1656617773547;
        Thu, 30 Jun 2022 12:36:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a49f:615b:a613:6a47?
 ([2001:8b0:aba:5f3c:a49f:615b:a613:6a47])
        by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c510f00b003971fc23185sm3831367wms.20.2022.06.30.12.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 12:36:12 -0700 (PDT)
Message-ID: 
 <93a6ffcf36c1293f57c77d027a7112bccbd9cd91.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] packagegroup-core-ssh-dropbear: Add
 openssh-sftp-server
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2022 20:36:11 +0100
In-Reply-To: 
 <CAOSpxdbBwbBCHFxvFCvww=+J+v7PB0T7ENBHAGy4iZt3Jcm3Fg@mail.gmail.com>
References: <16FB9273F36F7F78.24408@lists.openembedded.org>
	 <7bdfec55599094a196f35ce4e84e651b8179d120.camel@linuxfoundation.org>
	 <CAOSpxdbBwbBCHFxvFCvww=+J+v7PB0T7ENBHAGy4iZt3Jcm3Fg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 19:36:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167442

On Thu, 2022-06-30 at 07:13 -1000, Steve Sakoman wrote:
> On Mon, Jun 27, 2022 at 9:14 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Fri, 2022-06-24 at 14:45 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > Seems sad to have to do this but openssh is moving to use sftp instea=
d
> > > of scp to move files. This means scp from Fedora 36 will no longer be
> > > able to move files to/from a dropbear based image. This breaks a numb=
er
> > > of our key QA tests and I suspect will cause users pain too.
> > >=20
> > > The sftp server from openssh is small and standalone so adding it to
> > > the packagegroup seems to be the best way to preserve user sanity. If
> > > people really don't want it, they can just use dropbear instead of th=
e
> > > packageground.
> > >=20
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  .../packagegroups/packagegroup-core-ssh-dropbear.bb             | 2 =
+-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dr=
opbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.=
bb
> > > index 4f844ad9255..b969ab7ca01 100644
> > > --- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.=
bb
> > > +++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.=
bb
> > > @@ -3,4 +3,4 @@ PR =3D "r1"
> > >=20
> > >  inherit packagegroup
> > >=20
> > > -RDEPENDS:${PN} =3D "dropbear"
> > > +RDEPENDS:${PN} =3D "dropbear openssh-sftp-server"
> >=20
> >=20
> > If we want kirkstone or dunfell to work on Fedora 36 we're going to
> > need this. Unfortunately it will break images with -dev packages in
> > them.
> >=20
> > The fixes for master for that are not appropriate for
> > kirkstone/dunfell, they're quite invasive for master.
> >=20
> > As such you may need to disable the -dev package dependencies for
> > dropbear/openssh, something like:
> >=20
> > RDEPENDS:openssh-dev[nodeprrecs] =3D "1"
> > RDEPENDS:dropbear-dev[nodeprrecs] =3D "1"
> >=20
> > in the appropriate places. I mention this now whilst I remember the
> > context!
>=20
> Any hints as to the "appropriate places"? ;-)
>=20
> I assumed you meant the openssh and dropbear recipes:
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> index f306b1245a..2178c4868f 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> @@ -162,6 +162,8 @@ FILES:${PN}-keygen =3D "${bindir}/ssh-keygen"
>=20
>  RDEPENDS:${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
>  RDEPENDS:${PN}-sshd +=3D "${PN}-keygen
> ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit
> pam-plugin-loginuid', '', d)}"
> +RDEPENDS:openssh-dev[nodeprrecs] =3D "1"
> +
>  RRECOMMENDS:${PN}-sshd:append:class-target =3D "\
>      ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
>  "
> diff --git a/meta/recipes-core/dropbear/dropbear.inc
> b/meta/recipes-core/dropbear/dropbear.inc
> index 78f9f9adbd..a93d247caa 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -9,6 +9,7 @@ LICENSE =3D "MIT & BSD-3-Clause & BSD-2-Clause & PD"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D25cf44512b7bc8966a48b6b1a9b76=
05f"
>=20
>  DEPENDS =3D "zlib virtual/crypt"
> +RDEPENDS:dropbear-dev[nodeprrecs] =3D "1"
>  RPROVIDES:${PN} =3D "ssh sshd"
>  RCONFLICTS:${PN} =3D "openssh-sshd openssh"
>=20
>=20
> but I still get failures on do_populate_sdk:
>=20
> Error:
>  Problem: package dropbear-dev-2020.81-r0.core2_64 requires dropbear =3D
> 2020.81-r0, but none of the providers can be installed
>   - package dropbear-2020.81-r0.core2_64 conflicts with openssh
> provided by openssh-8.9p1-r0.core2_64
>   - package openssh-8.9p1-r0.core2_64 conflicts with dropbear provided
> by dropbear-2020.81-r0.core2_64
>   - package openssh-dev-8.9p1-r0.core2_64 requires openssh =3D 8.9p1-r0,
> but none of the providers can be installed
>   - conflicting requests

I'm confused between the different branches. I think you'll need:

RDEPENDS_${PN}-dev =3D ""

in both those recipes to break the main dependency. Whether you nee the
RRECOMMENDS chain breaking I'm less sure but for dunfell it would be:

RRECOMMENDS_dropbear-dev[nodeprrecs] =3D "1"

Cheers,

Richard


