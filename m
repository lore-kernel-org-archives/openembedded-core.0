Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8141BCD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 11:39:58 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9531.1778153997613942432
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 04:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=P5FC1vFi;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6136; q=dns/txt;
  s=iport01; t=1778153997; x=1779363597;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=zsO+xS4DTt/ORpq9yNq256YEdWYzJ7gkSTSxRry8l40=;
  b=P5FC1vFiUDUnypCghC6a5PAURAdOKGMi61JCu6lbtO1YoqnsAP/eaPrb
   Re+VccGsi5U7BenOn37u2KrDmHL2Eb9DOGhTEGJqD0REzdOY7E/+YHGtd
   bgftRnJQpLmib6i0DK3Vmce8PD5zOU4qWWmZZ3l624sVZKjKb/kNrIfWe
   6QiHO0cAfqJ/NPyPo/Me+WH1IOGOeaOCq6mqvChweZw4eZXyDLAkKSoK+
   0ZFkFDky8PvEMSuxqmNvjK3enC6mYNuhEp0zbnvAoLO6Xxjk6nKaanT4B
   05wKbt3huObznu9+5kHy3dxQByHtNLG99c6WurFaYa7NPaSRHfiyeSsbv
   A==;
X-CSE-ConnectionGUID: uT25MG6FTNGR70Yd9CvZdw==
X-CSE-MsgGUID: SI2nbUYIQBmBD51oH3RjGg==
X-IPAS-Result: =?us-ascii?q?A0ClAwBQefxp/40QJK1agS6BK4E9MVOBBgKBDxJJiCMDh?=
 =?us-ascii?q?SyIeQOXQ4ZXFIFhCg8BAQEOAS4BCBoEAQGFBgKNMgImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPAQyGWgEBAQEDARFnEAIBCBEEAQEBL?=
 =?us-ascii?q?icKHQgCBA4FCBqCYYIdFkADAQKqcAGBPQKKKniBNIEB4DGBTYUFOoMZAQEqg?=
 =?us-ascii?q?TWCXYEhUYRCJxsbgXKBV4I3MT6CYQQBgTQPCxE8g1eCLwSCInoUHYI7gzSBZ?=
 =?us-ascii?q?IcWUnIiAyYzLAFVExcLBwWBI0MDKi8tI0sFLR2BIyEdFxUfWBsHBRIhKm5MZ?=
 =?us-ascii?q?SxcGgMDDSEkEVk/OAtJBYEZWQKCHhlfIywDTnsDC209NxQbAwSBNQWJXgdWH?=
 =?us-ascii?q?Q+CRoENRiBMRB5ABpNgA48SgXyMY5UXCiiDdIweiAQHVoRdiDIXhASBV6UQm?=
 =?us-ascii?q?QYigjamPgIEAgQFAhABAQaBaDyBWXAVgyIJShkPjl+IV8IAeQIBOgIHAgcNA?=
 =?us-ascii?q?wuRaAImB4FOAQE?=
IronPort-PHdr: A9a23:Hcij/RSQqCWKYBcx7I3gHDOX8tpso47LVj580XJvo6hFfqLm+IztI
 wmDo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:RSsiW6ihVjBrcPpdwqd80OU4X161OBEKZh0ujC45NGQN5FlHY01je
 htvXz2HOK2DamWketsnbNjj8htV6p/XzYc1Swdtr3xmEy5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeEULOZ82QsaDxMtvrc8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUFxrwqJE4Q2
 8A+BwpSNiGP1smo8r6kH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbH+PB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTYz/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKJJY3XFJ8EwxbwS
 mTuxEWjBBsnBf2m4z+v3i/1gc+UpyHUV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cEnhKaccts4k9QjlCO
 kK1ou4FzAdH6dW9YXmc7byT6zi1PEAowaUqPEfokSNtDwHfnbwO
IronPort-HdrOrdr: A9a23:M5kxD6mP3gi7ImiIkEQ8Y3ivCVDpDfMsiWdD5ihNYBxZY6Wkfp
 +V7ZcmPE7P6Ar5BktApTnZAtj/fZq9z/JICYl4B8bFYOCUghrYEGgC1/qs/9SOIVyFygcw79
 YFT0E6MqyOMbEYt7e13ODbKadc/DDvysnB7omurQYJcegpUdAd0+4TMHfjLqQCfng8OXNPLu
 vl2iMonUvGRV0nKu6AKj0uWe/Fq9fXlJTgTyInKnccgjWmvHeD0pK/NwKX8Cs/flp0rIsKwC
 zoggb57qKsv7WBzAPA12jc1pJSmNHw4NpODs6Bh6EuW3TRYwCTC7hJavmnhnQYseuv4FElnJ
 3nuBE7Jfl+7HvXYyWcvQbt8xOI6kds11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 Nw2X6DvZY/N2KDoM293amMa/hZrDvynZMQq59Us5WZa/pGVFZll/1awKqSKuZZIMu10vF9LA
 AkNrCt2B8fSyLoU5mehBgu/PWcGlIuAxyBXk8O/uaR0zRQgTRF6nFw/r1Eop/Fn6hNF6WtII
 //Q/lVfL0idL5lUYttQOgGWse5EWrLXFbFN3+TO03uEOUdN2vKsIOf2sR+2AiGQu1B8HIJou
 WLbHpI8WopP07+A8yH25NGthjLXWWmRDzojsVT/YJwtLHwTKfidXTrciFjr+Kw5/EERsHLUf
 e6P5xbR/flMGv1AI5MmwnzQYNbJ3USWNAc/tw7R1WNqMTWLZCCjJ2XTN/DYL72VTo0UGL2BX
 UOGDD1OcVb90iuHmT1hRDAMkmdM3AXPagAZpQy09Jjv7TlbLc8xzT9oW7Jkv22FQ==
X-Talos-CUID: 9a23:kLrkAWNf9YLzmO5DRRU9qWs7RO4ZVFLnky/hLx6TF1RlV+jA
X-Talos-MUID: 9a23:eZMiBwt2H1KknLFk9s2nvxA4Ms1V0oWXIkUnvchfvOnfDy5fNGLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 May 2026 11:39:56 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 6A581180004BF
	for <openembedded-core@lists.openembedded.org>; Thu,  7 May 2026 11:39:56 +0000 (GMT)
X-CSE-ConnectionGUID: RY7uCLGOSRajCaHpYyHimw==
X-CSE-MsgGUID: D6udP9O0SrCPzFFjBetfxg==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,221,1770595200"; 
   d="scan'208,217";a="80420428"
Received: from mail-bl2pr08cu00100.outbound.protection.outlook.com (HELO BL2PR08CU001.outbound.protection.outlook.com) ([40.93.4.8])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 May 2026 11:39:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWt6CO55USwcVKg/lF2S3APho3p/hK4ppkDqOvXH8iAuCsN00EfR0BlCMfOXbiO+bXCWe76DKfmPZktVoLbjsQWvNBSnWm21COV/4K5sEip+ghGVEAQR4KlLZNHYcAHgZQ233zpsaa1/fxggsB64Wwl0uBc7jm7dek6wegAUJTuoeYo7kW8kjsPLqVB15c2IQP73IHIi2okWMzDbEvhfU00ssElef9/jBSQ5aHp68boM3uw+C9PNA6UFI59jRJwX6LaicMuXg5+C+4mVfBjiiGZNAMFvkjWq2jLZurLa7oq8CF8NiFyE3lf0pdb2sOETKjxtF5rEGcMw6/eH/W2jBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsO+xS4DTt/ORpq9yNq256YEdWYzJ7gkSTSxRry8l40=;
 b=YHQfpP+wo2Hb/2YfetrSH9jr4ZMoj1RbimxLZvfublQbvQKi5DGjkZk5ZfuVgJTWS3S7eyZrGpOwg+Fztd0A6U7qBUKwFkU8D4OSTKZe2kTC/v9EDIcfEgJnmywMzPzIA7LDQVeUnAUd2F1wodAq8NRaIEkKXoz9YsYLnGEIYvu7DpNgxGNbuBlp3y6TQYji6XrERXjXNDeJ8oz2kFyeXkdWtON2BXHg3BDEx4OjmRevbJ9kKrDouuJ8pl4UM6RqlnsPCY/HySwCW75ZnJbhx2UH+0WNLsB+hXLk3Y2HHg32OPJ3VQD/4TgBx8gpQQTpex4D87mq2d4P+EshLmJbdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 DS7PR11MB6173.namprd11.prod.outlook.com (2603:10b6:8:9b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Thu, 7 May 2026 11:39:53 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 11:39:52 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "Viral Chavda (vchavda)" <vchavda@cisco.com>, Yoann Congal
	<yoann.congal@smile.fr>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Inquiry Regarding Package Upgrade Approach vs. Manual
 CVE Fixes in LTS Releases
Thread-Topic: [OE-core] Inquiry Regarding Package Upgrade Approach vs. Manual
 CVE Fixes in LTS Releases
Thread-Index: AQHcsfycPqcLW92Kh0u7xE5N1441srWw83gAgFHTuo0=
Date: Thu, 7 May 2026 11:39:52 +0000
Message-ID: 
 <DM4PR11MB6189C2259D0CAC50D124C689C43C2@DM4PR11MB6189.namprd11.prod.outlook.com>
References: 
 <DM4PR11MB61899D3F758D2B3C7BAA9361C444A@DM4PR11MB6189.namprd11.prod.outlook.com>
 <eb249cdc0bfb57d3e0ef4cb20dafffe7896c408b.camel@linuxfoundation.org>
In-Reply-To: 
 <eb249cdc0bfb57d3e0ef4cb20dafffe7896c408b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|DS7PR11MB6173:EE_
x-ms-office365-filtering-correlation-id: b1af6c63-36d1-4e56-dfc0-08deac2d5aad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|3613699012|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 gSEMkRhXvyFBIkk9opXvUt32Add62L22QYiUbeo7wez0fAHvb3k0XUp84Z/u99Vzkg+7wRmCVkxR4zof3wEdywE1NW1v4dCHnbNDfPfMFBC45kED+SgZgx/XEZa0LPHCuBSyQ3euYpPI2IzmO2UyCCRiPdpVK956b4yse+SdwgDryV+XK7TDMNsKQJaAtl0BiwZO07ntllobOe7pO2g7cTo4wc5lTC31uj26CNQ7kSqMxT5mSJQ3E3euFlQcoC7ZDS5sj1fmfPsmt3SQUPjgNWUO4VvJpIEmpqIQYFF+q+UanJuD4gOn/SoseRgE8Wc7ieehCCwmYRWCGtrBReUoP4SstsPFUihMjiCiDQB3JEUmaj74hNtViuQBT+sECe3/LKnXjLlPeu+QInqMmJGA0ScIqgy6GJ3dfVMpcoyVVyvG7ksBzBo2UNcDe82H6G4x/6D96T26UktH1L8sYt4fRx8M/1xwB+7SxcNoMW1JXggB78OyDhiXDP8fOnvKGLQ9fSv1ll9ztYj7p99XdgOt74jryR81EPEk4HT77fwGOT9vBrGti9zmTnbJYY4ASRbEdprVHUtTVbjdJFTNIOOuBFC0/ZUFK2ltEXkwDZyFL8NbvIQN4ilzK8k462jjIceCgiWbE24jykLcs0aw3sIXMcuLbrsrZS3kgJZP84RFlnj8iOstGDdBpnoJEifFEP2qdl7q2tKq7F5v0pgN4DMrDe1LlW3PoV7wgGXBfZ+cxNroCwSPhlzS5+cZmdS6oPSPzI9z3qjaqgjoq8N9mMvyhzt115GO8ONcbEjR65bzPNs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(3613699012)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?lJBeDkcAmRGOAgZnISybp4pqjAhwkUkjOsG06V7ymMjtfZ0HMo2YwPSr35?=
 =?iso-8859-1?Q?+prmYqG4UGGCvuEMk/7m5Omnj84a8q9+AOlyMXDH456kQpzYgvGGsJLzti?=
 =?iso-8859-1?Q?sHX/WJ9KLwYAJFNH323b5UT27tZcl3Bbk9+PQpgwSeVMrTZi9VV6+lH+Xc?=
 =?iso-8859-1?Q?wQRsQ3idJOF3E6tA8uvZux0bCczRuwkIBV8CpdYH38z5ARXztHeao+k4pk?=
 =?iso-8859-1?Q?jkGXrS99yk/k3sUwJnQIC+5eQjOw+72BAesjSnbjQ3aHf23vV1P6a8jZJX?=
 =?iso-8859-1?Q?66/Pe30y1f9POZ1gyntOuJDqGxwhuT4KzH1KamDHmnLMLmQYze88e4Kixq?=
 =?iso-8859-1?Q?wEGAq3ayc0rRsj7nDZg0Hq+APD6UaRGGbrcIs1FoJaszdU1qK1Z3kusNtq?=
 =?iso-8859-1?Q?GCXurvuQmr9PNS0Dt/6I2IZD75X7qRMeJ9OEaWd4aYaZtInniI/hpLEO+P?=
 =?iso-8859-1?Q?MQh4wm+afPh3fWWJrMHS6/1wBQzjNON9qmiIztjD1yU43g5O6jMLeGpkvW?=
 =?iso-8859-1?Q?meLvmyopKFSzAgkcQXf8n6z+IPCCHRafIX6bgWDpitF8HeBGGz86Ntc6St?=
 =?iso-8859-1?Q?PQEviHdTQKYNlhYjNkx++vj84woHdRlvsrwyBD1DRcUlIOW8vlrJ3FeCag?=
 =?iso-8859-1?Q?pTsblAllwjgreqZTkYIPRfqIPL5lCVPQ1fo83PS4pTLB3jALwlQLztMlkn?=
 =?iso-8859-1?Q?8M27DVhFaPwhlGanuG73Gywxcrkgi1ylFcnsLw0lbpP6cnMx/teP8U/EU5?=
 =?iso-8859-1?Q?MzF6Df9YToEzQY5YGaLIZJ0zBs1sBYgxlwIwbY7GbU/pfSvRDxYNGFokWr?=
 =?iso-8859-1?Q?zeOnL4UDipneO3yLCRXkLbD738XecJTjmQgqzwREgAwTEYdAf2nPgoH/76?=
 =?iso-8859-1?Q?6ugogT6zq6akM7TSY1aKmwdqgAIGbu7A3Yz6nfqYLmiWt8QVc7TYcVM1EI?=
 =?iso-8859-1?Q?s/JUDlGBJ0EpwBduQ1yzWj09sKpO4wwr/Ec1Ky3BtbDTaL1uATcbVgvBAJ?=
 =?iso-8859-1?Q?4JO37VKnKzKxNgh5LqQ9eBycI6HmjWAxsJXFWS9TJalRnjwUnqoY/439KK?=
 =?iso-8859-1?Q?N1eCyC7qN6dqIANixt6c1QbiBiOJNakiUCGbb0e1ABesOf0IwBKtyJMgaW?=
 =?iso-8859-1?Q?nrZjZ1KZF0iJxgorEKpi6V3QHRA6B68mbSRYUrKI/3Ve9qtm5E/jpDrBmB?=
 =?iso-8859-1?Q?p+bDF5EEqvzZoXDaXIyiVuGbcs/NVuNptRbAxxl8ul8joTChaw8Cx33yek?=
 =?iso-8859-1?Q?bme1L618QJ7T/PiUJMCv0fTRrkKPB7jwqOiLfKTMZkUun9sZd0HiXBb/43?=
 =?iso-8859-1?Q?qqX1Jc6cXIrD9ndL6Si9Oc5eVszGEVMNQA3C46tf/BJpQLneCTfLMyZf3+?=
 =?iso-8859-1?Q?d04S+5Fu/sYGteWbRMcYvvQZR5SfVEXa3RrzGafOi2AwPvX4CxDPa6gvDE?=
 =?iso-8859-1?Q?itZubfqx9PkvaI8Lwhet0OW+96bKKIPTLcNjLnjI2AORSaCF0pqIoEr1O7?=
 =?iso-8859-1?Q?exxzgjocR3xUNIe/gwSNAzx4YukoxQWIeAlHBIuRbU3yj1eRLOJnFaSGs3?=
 =?iso-8859-1?Q?zXgkCkkOb6zNaisyVnAtlLtrcTuUc7RyDOnW26dPpPxb877RNCZwownVgJ?=
 =?iso-8859-1?Q?PQiLuLJHr5RoVKrS9VYkurrE9wsskigB1xq245PNw6mdkOroh0QOKoEgwG?=
 =?iso-8859-1?Q?sMudWP7BZdDcGcvLdlgz0djv5Ri43rDYs1hFSIF3xnKFm4WPCciWTCkvVB?=
 =?iso-8859-1?Q?txgkOtTPGuPUGdu9K8C2qQbChz/6+LyWHc+oVwwW18eV+e?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB6189C2259D0CAC50D124C689C43C2DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Kep4Onp9VoxnsCeTb1tIA1NYL52YGQ44yzxbKV9PZ/YFvoBkPvkOEOg6zP8JLg280beBuxJQKf0b4QBRw8+4CCYOT0gnPe4Z1FUph0bHFgeCGwCHjGcS5Vb1PSjehOQmv8/Pfp+Rdmopeb5Byv8Pz7XnImIZXGoGzD5fXhpjQo6N4WEkTtEL1ZlDk5JASqG7+atjxObMnhUeFJ4qz1CHBwU7KVhPuwHsDkKm2ioT9KMCY3l7UwigKU8wUJHQ4f51SdlwmX1Cs1Tr3w0VPjXkP4N17v9l53zVKZQUt3IvWnC8j6ZVTYYhd0RT7+vYr1woQhBIsPyY79mHuosygANnfg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1af6c63-36d1-4e56-dfc0-08deac2d5aad
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 11:39:52.7035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pMTrZbb3yfpoJ32AZy04GEOcr0SV66eqXdaRZwpveeAIEB1k+t1i2ytFthzDZRawyebHUTpdyJjqvA7mwpkjUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6173
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-4.cisco.com [72.163.7.165];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 11:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236580

--_000_DM4PR11MB6189C2259D0CAC50D124C689C43C2DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Richard,
Thank you for the update.
I have two questions:

  1.  You mentioned that runltp has been removed upstream; however, I see i=
t is still included in the Wrynose release. Is there a plan for its complet=
e removal from Wrynose?
  2.  Is there any plan to support kirk in the Scarthgap LTS release?

Thank you for your clarification.
Kind regards,
Deepak
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Richard Purdie via lists.openembedded.org <rich=
ard.purdie=3Dlinuxfoundation.org@lists.openembedded.org>
Sent: Monday, March 16, 2026 3:30 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>; Yoann Congal <yoann.congal@smile.fr>
Cc: Viral Chavda (vchavda) <vchavda@cisco.com>
Subject: Re: [OE-core] Inquiry Regarding Package Upgrade Approach vs. Manua=
l CVE Fixes in LTS Releases

On Thu, 2026-03-12 at 08:45 +0000, Deepak Rathore via lists.openembedded.or=
g wrote:
> I am currently working for Cisco where our team focuses primarily on:
>  * CVE fixing for OSS packages
>  * Package upgrades
>  * LTP execution and validation

I would note that we're going to have to drop support for LTP in the
next week before feature freeze.

Upstream have removed runltp and switched to kirk. We have no support
for this. I have repeatedly asked for help in switching but have not
received any, a such we likely need to remove ltp for the next LTS.

Cheers,

Richard

--_000_DM4PR11MB6189C2259D0CAC50D124C689C43C2DM4PR11MB6189namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Hi Richard,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thank you for the update.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
I have two questions:</div>
<ol start=3D"1">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); line-h=
eight: 20px;">
You mentioned that <code>runltp</code>&nbsp;has been removed upstream; howe=
ver, I see it is still included in the Wrynose release. Is there a plan for=
 its complete removal from Wrynose?</li><li style=3D"font-family: Aptos, Ap=
tos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-size: 11pt; color: rgb(0, 0, 0); line-height: 20px;">
Is there any plan to support <b>kirk</b>&nbsp;in the <b>Scarthgap LTS</b>&n=
bsp;release?</li></ol>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thank you for your clarification.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Kind regards,<br>
Deepak<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fo=
nt-size: 12pt;"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded=
-core@lists.openembedded.org&gt; on behalf of Richard Purdie via lists.open=
embedded.org &lt;richard.purdie=3Dlinuxfoundation.org@lists.openembedded.or=
g&gt;<br>
<b>Sent:</b>&nbsp;Monday, March 16, 2026 3:30 PM<br>
<b>To:</b>&nbsp;Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED a=
t Cisco) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.o=
rg &lt;openembedded-core@lists.openembedded.org&gt;; Yoann Congal &lt;yoann=
.congal@smile.fr&gt;<br>
<b>Cc:</b>&nbsp;Viral Chavda (vchavda) &lt;vchavda@cisco.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] Inquiry Regarding Package Upgrade Approa=
ch vs. Manual CVE Fixes in LTS Releases
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Thu, 2026-03-12 at 08:45 +0000, Deepak R=
athore via lists.openembedded.org wrote:<br>
&gt; I am currently working for Cisco where our team focuses primarily on:<=
br>
&gt; &nbsp;* CVE fixing for OSS packages<br>
&gt; &nbsp;* Package upgrades<br>
&gt; &nbsp;* LTP execution and validation<br>
<br>
I would note that we're going to have to drop support for LTP in the<br>
next week before feature freeze.<br>
<br>
Upstream have removed runltp and switched to kirk. We have no support<br>
for this. I have repeatedly asked for help in switching but have not<br>
received any, a such we likely need to remove ltp for the next LTS.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</body>
</html>

--_000_DM4PR11MB6189C2259D0CAC50D124C689C43C2DM4PR11MB6189namp_--

