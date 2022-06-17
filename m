Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F238C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 16:51:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.32.1655484654149698904
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 09:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CdR04im4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id g4so6461409wrh.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=3RYDTTM4AT4pZUr8a/RI8eVw1+YitiRA8QJgTs72EtI=;
        b=CdR04im4hVstthFpiIo/4HEtrkBHqpFiMqsA8fu4DgItlPL5pfw6NeNETSO7/MPNIz
         nfYun2urZhq//ZKUcWmwzy3uQyAPXqkI3ecuW5qX1EcjP3KH1SamvQLqbEp4PZZ3QXpk
         +OJ9nY0jVk7GphlZPKCWyhO/qf9fvmj7fpdi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=3RYDTTM4AT4pZUr8a/RI8eVw1+YitiRA8QJgTs72EtI=;
        b=judURINaP8LE26KXAmwaxtIdCHJmtKRMBlwhIJYIvTN9pFgv+3T/kPNcSVZxhLa3oP
         /48GdUJ7WvnK8GDskvU90IBdQ6Qd+z+8eytPN65q4gNtvnag+c3ui6OIGWAs78/tPPMJ
         15Pi2CAYxJofMuQ7r7J6Z4V77c+kJ7t3GilSwmah9ojfJDUDziX77baEyYYbLPDle8GK
         9lz8Vh3/MPZqj1WsOs4aEUKbT/00xvcIbY4b6ZDHnkerpZ2aRPxitX/9S1IQsKFX9KJq
         Gr4EHuMGR/xyy+Kq4AMUHfplkGxzE4597TO4TaRq74j/sJMtW4BVaBxty/aG1QPhUfbE
         ZCcg==
X-Gm-Message-State: AJIora8seEmFMKixC5s6V5BHGj/OfYT3bGhsS4tvXRvXjLuO2SEk1UvD
	iAuaq5ovKidGJqjDLGDbkMwSBg==
X-Google-Smtp-Source: 
 AGRyM1sShi5Ab1GDf8AC+xSsiMWtpi/42biVb5pp/f6XCV2CNjHcDgosms2KU2UIdeH51oZRsYCFjg==
X-Received: by 2002:adf:fb06:0:b0:21a:3dc9:f12d with SMTP id
 c6-20020adffb06000000b0021a3dc9f12dmr4638832wrr.204.1655484652606;
        Fri, 17 Jun 2022 09:50:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:589d:bba2:5904:ccba?
 ([2001:8b0:aba:5f3c:589d:bba2:5904:ccba])
        by smtp.gmail.com with ESMTPSA id
 x24-20020a7bc218000000b003942a244ee7sm5950379wmi.44.2022.06.17.09.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 09:50:51 -0700 (PDT)
Message-ID: 
 <3b113e342f6f03c2200bbb1477139334b055fa05.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 3/7] insane.bbclass: Make do_qa_staging
 check shebangs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paulo Neves <ptsneves@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2022 17:50:50 +0100
In-Reply-To: <20220614151105.1890454-3-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
	 <20220614151105.1890454-1-ptsneves@gmail.com>
	 <20220614151105.1890454-3-ptsneves@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 16:51:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167028

On Tue, 2022-06-14 at 17:11 +0200, Paulo Neves wrote:
> As reported in the bug report [1], there was no check for shebang
> sizes on native scripts and now this is fixed.
>=20
> The path scope of the qa_staging was increased from just checking
> libdir to all the relevant SYSROOT_DIRS.
>=20
> It is possible to skip this check through INSANE_SKIP.
>=20
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11053
>=20
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  meta/classes/insane.bbclass | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 9ca84bace9..b2951a48fe 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -630,6 +630,11 @@ def qa_check_staged(path,d):
>          bb.note("Recipe %s skipping qa checking: pkgconfig" % d.getVar('=
PN'))
>          skip_pkgconfig =3D True
> =20
> +    skip_shebang_size =3D False
> +    if 'shebang-size' in skip:
> +        bb.note("Recipe %s skipping qa checkking: shebang-size" % d.getV=
ar('PN'))
> +        skip_shebang_size =3D True
> +
>      # find all .la and .pc files
>      # read the content
>      # and check for stuff that looks wrong
> @@ -651,6 +656,13 @@ def qa_check_staged(path,d):
>                          error_msg =3D "%s failed sanity test (tmpdir) in=
 path %s" % (file,root)
>                          oe.qa.handle_error("pkgconfig", error_msg, d)
> =20
> +            if not skip_shebang_size:
> +                errors =3D {}
> +                package_qa_check_shebang_size(path, "", d, None, errors)
> +                for e in errors:
> +                    oe.qa.handle_error(e, errors[e], d)
> +
> +
>  # Run all package-wide warnfuncs and errorfuncs
>  def package_qa_package(warnfuncs, errorfuncs, package, d):
>      warnings =3D {}
> @@ -1139,7 +1151,9 @@ addtask do_package_qa_setscene
> =20
>  python do_qa_staging() {
>      bb.note("QA checking staging")
> -    qa_check_staged(d.expand('${SYSROOT_DESTDIR}${libdir}'), d)
> +    sysroot_destdir =3D d.expand('${SYSROOT_DESTDIR}')
> +    for sysroot_dir in d.expand('${SYSROOT_DIRS}').split():
> +        qa_check_staged(sysroot_destdir + sysroot_dir, d)
>      oe.qa.exit_with_message_if_errors("QA staging was broken by the pack=
age built above", d)
>  }


I'm a little worried about the performance implications of this, we're
going from scanning files in libdir to scanning nearly all files in the
sysroots, reading from many of them. In isolation that doesn't seem
much but I suspect the IO will impact builds overall.

That leaves me a little torn on this change :/

Cheers,

Richard


