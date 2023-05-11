Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE33C77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 06:45:44 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.52943.1683787534485452453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 23:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=VfIlvxxv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30786c6082dso3871900f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 23:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683787533; x=1686379533;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0IV8oeINYGhiR9PzvkEfSFe7A0+3yy0ogkLfwIeYXY=;
        b=VfIlvxxv0/fanWbqO8kSI31W1IMTKhUgh43ebWWoJYyCdrBrotuXInPqgf8CREq2Zz
         lfg9kbMpKa3osULzx5vHQW59aLqu3ptGzzwDTbOswdK077HGDURlwscpOWJQf3e5+KMi
         ea5fUIE9X8JDAvJcJPVF/oNUAwFgYarv2cTaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683787533; x=1686379533;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T0IV8oeINYGhiR9PzvkEfSFe7A0+3yy0ogkLfwIeYXY=;
        b=VEI/xsTVHNwNK2e/Ao0YKFyuRX+ZpAD3+ykMUnvlFigJ/fnW/jFgfUctbQinzOuJrw
         c+UpEXdr8c8OdHM/BqcE09FGXjUXCUn3VuTnpaP8pM3jYJtgeJyVauottncHNWuM7r4j
         HpYMbudrLCrFCixFyiq5zjuWU38tZGoRPeFSk4CiZiP8l1+Biugw4XZ5FCrdEuCpAWtG
         d2h1x7S860UbZoCLWBDzoA8L3wlUKvzfIVZEi3VUSE+NpgQc3CE5S1zRgOaSrXc8GUeq
         aPDUqpDA+ij/zhodys2sCTjnzQ99cOn8vnl7HzONbL5O8ksHMeRAHwGWMSlOZ6GA8YkT
         y9qg==
X-Gm-Message-State: AC+VfDxFyrfdSsA7trQvDzM2dAhwfoaWRZ0wS6Ypt6PDB7CBqlebMRTD
	odSjFLBZ/mbbO3sRNAfSVjmWVA==
X-Google-Smtp-Source: ACHHUZ7N6L+WDOEuWgc6auxle5Ct56QPcJ0EcjviGVUUC5kJHAc++rQ2n/s9QfuD0yC/Q4IV8x9y9g==
X-Received: by 2002:a5d:6ac5:0:b0:306:3429:1833 with SMTP id u5-20020a5d6ac5000000b0030634291833mr13918960wrw.46.1683787532856;
        Wed, 10 May 2023 23:45:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b4cd:cc57:565e:2ba8? ([2001:8b0:aba:5f3c:b4cd:cc57:565e:2ba8])
        by smtp.gmail.com with ESMTPSA id q4-20020a5d61c4000000b003063772a55bsm19347892wrv.61.2023.05.10.23.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 23:45:32 -0700 (PDT)
Message-ID: <6a8a10462e054202a15f61861971143ec087bd09.camel@linuxfoundation.org>
Subject: Re: [qa-build-notification] [yocto] QA notification for completed
 autobuilder build (yocto-3.1.25.rc1)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: qa-build-notification@lists.yoctoproject.org, 
	"yocto@lists.yoctoproject.org"
	 <yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 11 May 2023 07:45:31 +0100
In-Reply-To: <BY5PR11MB41521E38F41C12F81E3F65D9A1749@BY5PR11MB4152.namprd11.prod.outlook.com>
References: 
	<01010187f0684a61-a44a1bd4-eb39-4d58-87dc-002340211ee7-000000@us-west-2.amazonses.com>
	 <BY5PR11MB41521E38F41C12F81E3F65D9A1749@BY5PR11MB4152.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 06:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181129

On Thu, 2023-05-11 at 03:38 +0000, Jing Hui Tham wrote:
> Hi All,
> =20
> QA for yocto-3.1.25.rc1 is completed. This is the full report for this re=
lease: =20
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree=
/?h=3Dintel-yocto-testresults
> =20
> =3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
> No high milestone defects.
> =20
> No new issue found.=20

Since this was a green build with no issues found, I can approve this,
thanks!

Cheers,

Richard

