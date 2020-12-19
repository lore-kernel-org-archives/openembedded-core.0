Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.92.70.84])
 by mx.groups.io with SMTP id smtpd.web11.12273.1608400407134740909
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 09:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Wp3QD+CV;
 spf=pass (domain: outlook.com, ip: 40.92.70.84, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVkY2WVUd5ZVUFIJZoThryda4SJsYUxlvZnt+L3ZEnAvalNlbrEPSmoyUUgXY+dn3bBV/Dt8RpoEdRGkycIGKv/gmY6okZTt2iQyOwi1zrolAOGNyNOl/bXvCudFh1JMigF7Z04d/O4RYNAoStwORd2dJc+GnYkjwCBP28Ux8mRTDn/XVJC3aFPmIaSBHQCrrmXcULgaD8+odfd7Xbq98bpJPUl+6fuua3MI9ScSkGdvsZYYHhJZVLIZuy1DJiShTQ/yJqST8wgeCIcrHQlwt0Pb8iVYbRVkcF9UPWOR2nILhgHrIRj7yFvbl1JMVu4YQvNT7sKpXwvOfeF0i7puug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHZiQU0RAi0wt/RjSiwsTUTfDLIVcPVRPqJF4xNz6L8=;
 b=f8RJwvTg+ddLwhH0MdMZdyqqwaT4fPrVXAcxTAb/sgGZW9L8zhCOWCpyDaqCXGhX+h+QCyI1AmWzMsDR7hq2Wl7bucO/4MBVjTJ8CPQWo0uX8h4aJkt0NDVi5k0ruHR3662spsHqPHcQGEUxd2khhEQzEvcDcmXQUsJh7NeM9rXVGgjKt93l6NH9tM6ncXTuCmAO92zAOqHU4guWF2+UO92zN0DkJHzNzRmd3M3DhDz3wXen/z8WD23ZEuYcSxOBiUjsDEgsRRvIhhNB2sYMLqEKEjdS7/mZUzI9bStf8Tv8pgnxWseUCRvOeulx1cu9c+qUiC4AvS8RoFshHrfEWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHZiQU0RAi0wt/RjSiwsTUTfDLIVcPVRPqJF4xNz6L8=;
 b=Wp3QD+CVY84/OJoQS2vToAWMg9SkxtOWKaYowWUniKgRtyTBLP0OeQVYSAnB1VvJAFwJy+sWqQfqECqgsmCdipo/SONnpfS9yt9TIKLFXR1I8ayiRllMv9PASr1Q+2nhNF2bEqul164Wi9Xsi5v71v52FcCIjxD/H4WTGTMtrNBzCMM/UmHazXPYNTeDx1dfHC+jxlu1Q4Ygpw+GxBIIhTMxKd5uI/m9eok5eYUrX+BYkkeMCKwMlFqGlVJcU1t1RJImM4TpWp4robHNI4hW+CIMmeI4jkPTGu9R6e67OqBbUr7ceBASlYEkTfaFL8pAN0bQBN7lnC4JN6sXah93Vg==
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2a01:111:e400:7e08::45) by
 AM5EUR03HT181.eop-EUR03.prod.protection.outlook.com (2a01:111:e400:7e08::384)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Sat, 19 Dec
 2020 17:53:25 +0000
Received: from DBBPR09MB4748.eurprd09.prod.outlook.com
 (2a01:111:e400:7e08::4d) by AM5EUR03FT021.mail.protection.outlook.com
 (2a01:111:e400:7e08::105) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Sat, 19 Dec 2020 17:53:25 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:A9BFF8F969304C3ADBCAA93E1F63AA39687E1330E26E932F453DD4954948EA82;UpperCasedChecksum:E7744646E97328BD445BD2EC5D98E84CD7E733F06B4A7738C61A88F3181E8BDF;SizeAsReceived:8835;Count:47
Received: from DBBPR09MB4748.eurprd09.prod.outlook.com
 ([fe80::8196:ade4:3e4:3dba]) by DBBPR09MB4748.eurprd09.prod.outlook.com
 ([fe80::8196:ade4:3e4:3dba%5]) with mapi id 15.20.3654.025; Sat, 19 Dec 2020
 17:53:25 +0000
Subject: Re: [OE-core] [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
To: Shachar Menashe <shachar@vdoo.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <AM0PR08MB361713C43176BFA1C7295477C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
 <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <DBBPR09MB474859DDE9CBC3963BBFDA67A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
Date: Sat, 19 Dec 2020 18:53:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
X-TMN: [6hwtaEL/R9nQRJhpRaYgMpWpKdFJzMQO]
X-ClientProxiedBy: AS8PR04CA0061.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::6) To DBBPR09MB4748.eurprd09.prod.outlook.com
 (2603:10a6:10:20a::11)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <4595a66d-9a83-1df3-1ae2-f4df9a247204@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (79.215.6.90) by AS8PR04CA0061.eurprd04.prod.outlook.com (2603:10a6:20b:313::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29 via Frontend Transport; Sat, 19 Dec 2020 17:53:24 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 30fa11b8-2c02-4983-5bae-08d8a446fbbc
X-MS-TrafficTypeDiagnostic: AM5EUR03HT181:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s1mVQR4kyezqnf3ccjm5VIUeasMRRuoCdLgTuJQC3I94Rz06NjfvKjU3Wfn4p/766DLL/Dprx7HcorqMH3DRRJV0y/ecAqvjclJAzpD7Jps1x8t/A4rJ0WpAZ87396QhsqFh6E5YzCS9ECVtCgtecxHp2+HrTb+dv+AFGAQvtksvlSLFC0OpDbcFIs9h26vtVCJrJhGH26pRUtsqg7irGMgpV+JYVjOZIhvnteGTrtVeKFB+jh7QBFaah9+k7abt
X-MS-Exchange-AntiSpam-MessageData: 
	tD9ClWjkI2lKjLDk4nlIxvBmJhkV1xeEpamKx0Zee4qHlgmf7SItSiZ+NYO8fC3qmI3sU2EOXAyCby8d3gAtwWlDIFKS+WlQ9r8B4jG6tTQUDEmRW4bujDC4crtgyLH4mY/CodV3/sAANtXbOmLcIQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2020 17:53:25.0120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fa11b8-2c02-4983-5bae-08d8a446fbbc
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT181
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.12.20 18:36, Richard Purdie wrote:
>   PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
> +PACKAGECONFIG[no-tls1] = "no-tls1"
> +PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
>   
>   B = "${WORKDIR}/build"
>   do_configure[cleandirs] = "${B}"
> @@ -52,6 +54,10 @@ EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
>   CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
>   CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
>   
> +# Disable deprecated crypto algorithms
> +# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)
> +DEPRECATED_CRYPTO_FLAGS = " no-ssl no-idea no-psk no-rc2 no-rc4 no-rc5 no-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
> +
 From my perspective this breaks backward compatibility, so I would 
rather have them all that as optional PACKAGECONFIG fields (which also 
does make it easier for ppl, still relying on one of those algorithms, 
for whatever reason, to re-enable them) - with the current approach all 
one could do is to override it with a bbappend - and tbh letting ppl 
have bbappends for this recipe, doesn't sound like the best idea in the 
long run to "enforce" any kind of "security" or "hardening"
>   do_configure () {
>   	os=${HOST_OS}
