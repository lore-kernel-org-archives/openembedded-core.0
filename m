Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF81BC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 17:04:30 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.40955.1656695063436044730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 10:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H6pR4hxo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id m184so1680549wme.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 10:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=lkX6tFxQN72MShWP9hqZUGW8BLj5tEgZ3EwFz2VW7UA=;
        b=H6pR4hxoBIwCFrqu+xShHQpWYSAfuUXt+IilgAz2O0bodeP/0mKkywYRBUA4VuLy3o
         TrCpHz5c5b0nhXtPjac44JpmVq9TP7HSIhS4In/AUmtwMCamaPy37Tz0gVybzs1niK23
         pLbT+s52AdHQ/LAE0z3kyfM5FSoaRDouySnSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=lkX6tFxQN72MShWP9hqZUGW8BLj5tEgZ3EwFz2VW7UA=;
        b=ZWQwJv605thT9JGWWFkKZSnPgyXS+TdKa4qdCNpTcmYujeBStw998KG0VBaNkOFaqU
         bSi+oEF13S3pPelf/ceg38Ya7+oJj6nVBsGU37cr9k+H6My2MmWfzppA9ahqVvs13pOA
         r4TAzZqz5WjlmNNGpwjnyBVmFtOo8HhCPZwrI5BLbbDUygNK7dOpJczj5R1YoYYUXsz0
         ctpiw8DiDUP2U89bqJOYIgqIxyPjTjuTthjVmYRuovHryh0vsmAlllsw8TSwaXRBxadE
         p2dEv1UTmKWySFi3Jowc+zqn6FN1OsGZdc8jc8nqeVs/czyA104IAl2iLs2LTZmnA4q/
         SwSg==
X-Gm-Message-State: AJIora+WoCwcZxChY+dN/5XOWHSKVJdQW0NeGG+XFlP7IvpCJpwkdfDE
	5H2HrgtOhEsaXmBOGrG7rGfjgA==
X-Google-Smtp-Source: 
 AGRyM1v6wagIHz306nSXjbv7+zEwnzOSSZynOhgZ43K0kHStWwTieZkPFt/M2yfa+8fv4x8j3DNnBQ==
X-Received: by 2002:a05:600c:4a09:b0:3a1:88f3:8ae9 with SMTP id
 c9-20020a05600c4a0900b003a188f38ae9mr6342247wmp.177.1656695061690;
        Fri, 01 Jul 2022 10:04:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a49f:615b:a613:6a47?
 ([2001:8b0:aba:5f3c:a49f:615b:a613:6a47])
        by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c19d400b0039c4f53c4fdsm9279835wmq.45.2022.07.01.10.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 10:04:13 -0700 (PDT)
Message-ID: 
 <591d5a5d5ac1e43e8595965f473c1b97a445086a.camel@linuxfoundation.org>
Subject: Re: [OE-Core][master][kirkstone][PATCH] ruby: Add ruby-native
 dependency for nativesdk class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ranjitsinh.rathod@kpit.com, openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Date: Fri, 01 Jul 2022 18:04:12 +0100
In-Reply-To: <20220629113459.8666-1-ranjitsinh.rathod@kpit.com>
References: <20220629113459.8666-1-ranjitsinh.rathod@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 17:04:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167538

On Wed, 2022-06-29 at 17:04 +0530, Ranjitsinh Rathod via
lists.openembedded.org wrote:
> We need to add ruby-native dependency for nativesdk class too
> to fix the compilation issue

This commit message is backwards. There is no nativesdk BBCLASSEXTEND
for ruby so you can't need the ruby-native dependency for it.

> Earlier this dependency is part of DEPENDS variable but the below
> commit removes it from DEPENDS and add only for
> DEPENDS_append_class-target which triggers the failure in
> nativesdk-ruby:do_compile task
> Link: https://git.yoctoproject.org/poky/commit/?h=3Ddunfell&id=3D6060b500=
b952754c595fdf5de5de35c886e0e1d5

No, that commit didn't break anything since there isn't a BBCLASSEXTEND
here. There is also no mention in your patch that you're adding it?

You need to say why we need a BBCLASSEXTEND here. The DEPENDS change
would logically follow from that.

Cheers,

Richard

>=20
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
> ---
>  meta/recipes-devtools/ruby/ruby.inc      | 1 +
>  meta/recipes-devtools/ruby/ruby_3.1.2.bb | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/=
ruby/ruby.inc
> index ebff5efd1f..efa40331e0 100644
> --- a/meta/recipes-devtools/ruby/ruby.inc
> +++ b/meta/recipes-devtools/ruby/ruby.inc
> @@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5b8c87559868=
796979806100db3f3805 \
>=20
>  DEPENDS =3D "zlib openssl libyaml gdbm readline libffi"
>  DEPENDS:append:class-target =3D " ruby-native"
> +DEPENDS:append:class-nativesdk =3D " ruby-native"
>=20
>  SHRT_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
>  SRC_URI =3D "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.=
tar.gz \
> diff --git a/meta/recipes-devtools/ruby/ruby_3.1.2.bb b/meta/recipes-devt=
ools/ruby/ruby_3.1.2.bb
> index 38ba46731b..a9e6765939 100644
> --- a/meta/recipes-devtools/ruby/ruby_3.1.2.bb
> +++ b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
> @@ -104,4 +104,4 @@ FILES:${PN}-ptest:append:class-target =3D "\
>      ${libdir}/ruby/${SHRT_VER}.0/*/-test- \
>  "
>=20
> -BBCLASSEXTEND =3D "native"
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.17.1
>=20
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167373): https://lists.openembedded.org/g/openembedde=
d-core/message/167373
> Mute This Topic: https://lists.openembedded.org/mt/92062913/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ri=
chard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


