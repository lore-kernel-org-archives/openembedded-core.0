Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652E2C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 06:45:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.52597.1683787499268125982
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 23:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=gSVGKDHW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30789a4c537so3730125f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 23:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683787497; x=1686379497;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soXk1ftjqks5ye8+sCoiyQMx5ySz5nFlFq3nQ2xHTm0=;
        b=gSVGKDHWUW9Uf1z84I7mhgOxs0ACKqIkWroPhVbFtEvdqv8mSw81+f25e+f39LA0kN
         sDl9ed0FQ5aFt8U2ugLsvvcg781HiMRS6ItRINIEBWNmUnPAa1KwNcSTQe+YL3dcM65z
         P6C7ibibLYvWDTO1/mfRASZ3yJJWYw+qYxHIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683787497; x=1686379497;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=soXk1ftjqks5ye8+sCoiyQMx5ySz5nFlFq3nQ2xHTm0=;
        b=E5C06vGTiYZrloocuKKQta8R9qhPb/a8nX16WC24iIi7eDHdRssOulKytlds/3M9Wr
         L3WmHVFFTEI82Y2v5vb9ivBRca14d2h6Sn3Tu1HKw3UQExvRnPmvJ7fvlBA9wnzA7udg
         I4aKW5Juv2urnnUeGqCM3kFaqxlnvwDUql6gPouguufvg+ViHDH/cbamy4NWVXuYAerr
         3mC6sjNvdipX/YIuZ/sdHjsBfasMokhcm3ySCeEk9ywQGQNEalYpzUL7q5HfCO9oEbVM
         E4JIiUqU2vmtgGiHVi/qc2/pnugC+KTVdBHqDjtozGOSRU+SGQ3ZS6agf+0NQiV24iUF
         dnwg==
X-Gm-Message-State: AC+VfDxGLPCDkYqXXAgFBX8GJU2rVAsqJUBPa4nOW6vN79yRRob+YNbp
	G6OL7JwC8w9Vk1VKHv5mgbNBM3XGezSHwHfWfd4=
X-Google-Smtp-Source: ACHHUZ7YilfjZ+3DjOQMRcef6lbyujWOXdptUcG8bbQh1HHW4JlJAJnejqk2pHoeLApsrLFhU0drZg==
X-Received: by 2002:a5d:460c:0:b0:2f2:9198:f0f with SMTP id t12-20020a5d460c000000b002f291980f0fmr14742879wrq.10.1683787497406;
        Wed, 10 May 2023 23:44:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b4cd:cc57:565e:2ba8? ([2001:8b0:aba:5f3c:b4cd:cc57:565e:2ba8])
        by smtp.gmail.com with ESMTPSA id f12-20020a7bcc0c000000b003f17848673fsm24825572wmh.27.2023.05.10.23.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 23:44:57 -0700 (PDT)
Message-ID: <5a540e27ff798ce1de3b5798698b135273943eb1.camel@linuxfoundation.org>
Subject: Re: [qa-build-notification] [yocto] QA notification for completed
 autobuilder build (yocto-4.1.4.rc1)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: qa-build-notification@lists.yoctoproject.org, 
	"yocto@lists.yoctoproject.org"
	 <yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 11 May 2023 07:44:56 +0100
In-Reply-To: <BY5PR11MB4152D2BB7102679D32A5D638A1719@BY5PR11MB4152.namprd11.prod.outlook.com>
References: 
	<01010187ce7c37c5-f4e60d10-4dab-47e5-be4e-3e4e6d4cf058-000000@us-west-2.amazonses.com>
	 <BY5PR11MB4152D2BB7102679D32A5D638A1719@BY5PR11MB4152.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 06:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181128

On Mon, 2023-05-08 at 02:55 +0000, Jing Hui Tham wrote:
> Hi All,
> =20
> QA for yocto-4.1.4.rc1 is completed. This is the full report for this rel=
ease: =20
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree=
/?h=3Dintel-yocto-testresults
> =20
> =3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
> No high milestone defects.
> =20
> No new issue found.=20

Approved from the TSC, thanks!

Cheers,

Richard

