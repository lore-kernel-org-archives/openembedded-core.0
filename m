Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D18C001DB
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 13:02:57 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.84529.1691931770024426516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 06:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MAMLA6st;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso31183785e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691931768; x=1692536568;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AC+Cl3QAkMs3JGDXW0odOBKlOBp7bbdBPFl4W+drqOo=;
        b=MAMLA6st09v0S8GNuUlCV8Ue4pqJ9vpEdMjuw9tfUF/kxzP50BLa/MqOIV27HvuHXS
         +MAdvzBWEIxvgDLoAMMqPKx0pq7J0mWrJMooPE0y0eg9aBP/JR1gMZvSwOUKw7WaGeg1
         Ytdh/oPSNKmyh8UNZEJwsfydiMVxjAYYyQqPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691931768; x=1692536568;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AC+Cl3QAkMs3JGDXW0odOBKlOBp7bbdBPFl4W+drqOo=;
        b=Flib1MLhk0RHiIGFOJoEKXUn2hNG0q67OAk44KCsI563Ogoh+v8gnfmhjtmUoMsBcH
         xtDLttg0w/aWrTwYvcZc5PZDC9k9HiYTKRVaCAZHDzyr075P5YHCc1qYhIFM6rxBn/yn
         +gNCcNoYh0mpXhXqMkP5+d8KeVk9WdJt+vgOndjCrnHkeMSO8UYGL078aFJzAhtxd1Ds
         +VxG7tPrmVvvjFSh5TiOSUx4NwVkFOtvS65CLQxfkQ9VU9/CJccAfpCHCMgxi7iF1g+B
         0ScRDieDcFA4R1nr1sJgfqMZxky/z7znHQIv7kpG1/VMfHoTgGFZEYF3gxxYSjk2Fsm4
         C5aQ==
X-Gm-Message-State: AOJu0YzOEDHJUOfWk8mDJTqaN7R7mSAEWMC7Icelu/nhd9JpRiPD8HdM
	DPuQuQ4ztOklcq37p0C8Tf5SQA==
X-Google-Smtp-Source: AGHT+IHzyRdy3A97Xg1/kAv4bcoI06K7+ybS34cYR64/hZdCH0hJ+5tyt+K3eCB+b2fHkbn4X19KFg==
X-Received: by 2002:a5d:410e:0:b0:317:6846:2344 with SMTP id l14-20020a5d410e000000b0031768462344mr5264098wrp.34.1691931768279;
        Sun, 13 Aug 2023 06:02:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:17a:7286:2cf2:8a86? ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id b2-20020adfde02000000b0031416362e23sm11344843wrm.3.2023.08.13.06.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 06:02:47 -0700 (PDT)
Message-ID: <227c69b15bc3e2060c35b5a4e941b34e7c3907d4.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for dunfell on Sun 13 Aug
 2023 02:00:01 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Sun, 13 Aug 2023 14:02:46 +0100
In-Reply-To: <20230813122807.DCBD7106C78@builder.sakoman.com>
References: <20230813122807.DCBD7106C78@builder.sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 13:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185882

On Sun, 2023-08-13 at 02:28 -1000, Steve Sakoman wrote:
> Branch: dunfell
>=20
> New this week: 5 CVEs
> CVE-2023-29409 (CVSS3: 5.3 MEDIUM): go:go-native https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2023-29409 *
> CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3180 *
> CVE-2023-3817 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3817 *
> CVE-2023-4016 (CVSS3: 5.5 MEDIUM): procps https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-4016 *
> CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4135 *
>=20
> Removed this week: 0 CVEs
>=20
> Full list:  Found 110 unpatched CVEs

Something doesn't add up since:

https://autobuilder.yocto.io/pub/non-release/patchmetrics/

shows a fall?

Cheers,

Richard

