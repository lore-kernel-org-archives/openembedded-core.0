Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A548C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 14:21:48 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.49991.1654006904848805513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 07:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B+7Hbx5+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id x17so9851713wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=0KWz6UW/yF2RCVNUONqM6c5cPYNaxEckhBcyV4kLeyk=;
        b=B+7Hbx5++BFz59HMMmkmirx64SLF48YdOxJ8GZXjBU9aPs7GW9O0aPLBM8IDoyhv6c
         dlP1JMw76yqtewV0PdFzrrKjaPFswrV+BGrnEL+yAA55UBg8bjeB8zlBweJbvdT6/yYu
         mWjyl4JK9hpS19mFXHaYbxl/M3M6CSZLWjbbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=0KWz6UW/yF2RCVNUONqM6c5cPYNaxEckhBcyV4kLeyk=;
        b=ikbJDr2oFu4dT7QtZSib/1wvvmY/JkKWqPKUHva8pcvqRGV2hMRK7AWWHyNBUmY8Ve
         ElWILuSeaKTcSU0Ydoit0wPinlqZ4NcMmukk2TpETkapWI//h/ca+I4J2X1qZctHrvHy
         7j2MeXhlksjsduooMJI2K/X3p/CvSHbgBA2xh2VD0goD19IgPGTQcLIWKB0+bJCLkeqI
         KXVNYxISGPzH4k3Z+TZICfVfjh0N0NyhHJIxnErBM78DbWTWhgxO1I4LmZWJeqPDtxWv
         7hx2Saqn4FFk13MD6alMQEOLwz7h5O4iC/USV56c13rXuAO9Bvb4nQhNPrbtDlpN/bjq
         05wg==
X-Gm-Message-State: AOAM532XKFJ/RFpcjYilOQth02sc1lBau5IP7HTzETQl1iAfx6NDFT9Q
	mm+QpOwOAOP4u4D9+aPq2kGeK3JRJCIgFLG/
X-Google-Smtp-Source: 
 ABdhPJym6bIlK6Mben8RITa76ISI06v0ggJ16temOycePAywnlLIjzO0sIqzsjQoUOyqb9eVunKB1A==
X-Received: by 2002:a5d:624e:0:b0:210:a42:f29d with SMTP id
 m14-20020a5d624e000000b002100a42f29dmr22050905wrv.615.1654006903276;
        Tue, 31 May 2022 07:21:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d16:2159:4370:b82e?
 ([2001:8b0:aba:5f3c:d16:2159:4370:b82e])
        by smtp.gmail.com with ESMTPSA id
 2-20020a056000154200b0020e615bab7bsm12037607wry.7.2022.05.31.07.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 07:21:42 -0700 (PDT)
Message-ID: 
 <116102a880d732f3ea406a61fc77d44f66aa9d02.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/2] nghttp2: unbreak do_populate_sdk
From: richard.purdie@linuxfoundation.org
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2022 15:21:42 +0100
In-Reply-To: <20220524144924.252281-1-f_l_k@t-online.de>
References: <20220524144924.252281-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 14:21:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166313

On Tue, 2022-05-24 at 16:49 +0200, Markus Volk wrote:
> Error:
>  Problem 1: package nghttp2-dev-1.47.0-r0.corei7_64 requires nghttp2 =3D =
1.47.0-r0, but none of the providers can be installed
>   - conflicting requests
>   - nothing provides nghttp2-client >=3D 1.47.0 needed by nghttp2-1.47.0-=
r0.corei7_64
>   - nothing provides nghttp2-server >=3D 1.47.0 needed by nghttp2-1.47.0-=
r0.corei7_64
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-support/nghttp2/nghttp2_1.47.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/recipe=
s-support/nghttp2/nghttp2_1.47.0.bb
> index 58ce08084d..051a6e4ecb 100644
> --- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
> +++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
> @@ -21,7 +21,7 @@ EXTRA_OECMAKE =3D "-DENABLE_EXAMPLES=3DOFF -DENABLE_APP=
=3DOFF -DENABLE_HPACK_TOOLS=3DOFF
> =20
>  PACKAGES =3D+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
> =20
> -RDEPENDS:${PN} =3D "${PN}-client (>=3D ${PV}) ${PN}-proxy (>=3D ${PV}) $=
{PN}-server (>=3D ${PV})"
> +RRECOMMENDS:${PN} =3D "${PN}-client (>=3D ${PV}) ${PN}-proxy (>=3D ${PV}=
) ${PN}-server (>=3D ${PV})"
>  RDEPENDS:${PN}:class-native =3D ""
>  RDEPENDS:${PN}-proxy =3D "openssl python3-core python3-io python3-shell"
> =20

I'm not sure this is correct as if the dependencies are incorrect we
shouldn't be making then RRECOMMENDS? What is the real issue here?

Cheers,

Richard



