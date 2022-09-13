Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EDEC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 09:46:58 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.2725.1663062417803768839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 02:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RiIrFqsp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id bj14so19812708wrb.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 02:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=h0WkGIwgwva0YYixqJDzJ85TTYdsaFa4J9T90eCCDn4=;
        b=RiIrFqspEpZsgwEICiuiE5CnCNZEWmAPBZFKJCgzJwDlEFDoyMyLC/QG9y+JY9e+ph
         Nwt+OLustFI7QpMbY4Sd3kq2zE8a+LSO03S4XYTs/sZ31srpRFh4zeCudy6mRDyUROqY
         mLGn7X4ezoPKBxlUcbMfOw7FOJG4FySS6B7CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=h0WkGIwgwva0YYixqJDzJ85TTYdsaFa4J9T90eCCDn4=;
        b=OAtQugV+0lQ2Fjx8lzhPPBBX8KEm5H+vqs+fC6EXPOaXjVV8mFG+Bh1dT17VEzE3Wx
         i96afHkYxH68qxqiQLj5HXoNMmBh/TRRcqAwJJDOU81R+wDPwvcV6aZROiMQnfiqpzSa
         PL7VQNOQxxlM0hh7NcE9V1yePUYMrtp2EfL9lwEkRRGRmMyCRtg53Y+t2IXAXU39Izx4
         p3YPBQ0TvIG9jFZcWQbOZF8n35wQm9E6/J4F7mU/SubiK+Bi79S9Szow0x8LlW6/XzdG
         SEYzws0+wUJe6Tl4/iHImdRoxWHxLQOb5QS9Lz4ISLPfkkxbgrFkLl/NVLlZz4nPUSIU
         a/lw==
X-Gm-Message-State: ACgBeo2eioj0GyRWbtMZCfLXz7FX/HN7USlNrYxw10ptwjMWD5sBNcVe
	aqe8Ymjd56BMlCWc8fcVIBV5pg==
X-Google-Smtp-Source: 
 AA6agR4pu7aT3ORltGz1Tmmo9ico4WCVzzUmGn/qxqiYSw0siQoro1ish+IV/zNhTMMJSxp+zQz05g==
X-Received: by 2002:adf:fa81:0:b0:224:f260:2523 with SMTP id
 h1-20020adffa81000000b00224f2602523mr17526074wrr.26.1663062416198;
        Tue, 13 Sep 2022 02:46:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b740:75b6:5b77:5982?
 ([2001:8b0:aba:5f3c:b740:75b6:5b77:5982])
        by smtp.gmail.com with ESMTPSA id
 a3-20020adffac3000000b0022878c0cc5esm9980699wrs.69.2022.09.13.02.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 02:46:55 -0700 (PDT)
Message-ID: 
 <84e67e60448d5606462ed4a645b6aa4e4f26643d.camel@linuxfoundation.org>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 11 Sep 2022
 04:00:01 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Date: Tue, 13 Sep 2022 10:46:54 +0100
In-Reply-To: <54a93e27-ba69-ae00-bf9d-dfa8b051b3a3@gmail.com>
References: <20220911140238.1ECB1960B01@nuc.router0800d9.com>
	 <54a93e27-ba69-ae00-bf9d-dfa8b051b3a3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 09:46:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170564

On Mon, 2022-09-12 at 18:45 -0700, Khem Raj wrote:
> On 9/11/22 7:02 AM, Steve Sakoman wrote:
>=20
> > CVE-2021-3521 (CVSS3: 4.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2021-3521 *
> > CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2021-35937 *
> > CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2021-35938 *
> > CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2021-35939 *
> > CVE-2021-4158 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-4158 *
> > CVE-2022-1354 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-1354 *
> > CVE-2022-1355 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-1355 *
>=20
> there is a patch on ml for this.

These were merged and we also upgraded tiff to 4.4.0 which then dropped
the patches. 4.4.0 should contain those fixes but the CPE entry
upstream doesn't have version constraints. We probably need to contact
them to fix that.

Cheers,

Richard

