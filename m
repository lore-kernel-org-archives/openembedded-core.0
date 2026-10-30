Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8474.1793356305425528807
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=h3b0+H0c;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14446; q=dns/txt;
  s=iport01; t=1793356305; x=1794565905;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=2zYgJ47j4YufgpqW4GdSoPP8rofZnX4WjHp8qo4R8ZY=;
  b=h3b0+H0cZpC9Xq1DF5hVoeEVrWO051LQTA2StYnC2Z27CzFg44iCyaF9
   QOA2A2Km7KRaKpgUOdOLVQ9P8/uJ4rVq8mk0zVslfN3hiUlR33QNk58Ce
   CYXskFNJcXFl0DFygD6uG6m/XD2OBemTepCxhhnl/lqeEuOVJ6JRtQyjL
   T44pnbyT5F9l/fTJnFs7btO28guGIawDVym0JVNFXk5h+rsXP7GcS2YAv
   zGu2gJpFCzjNt65+ABWZ/mt0TP44BsRmnz/DdWlgSOpl/jF40vBoMUb2O
   KPYGK8nRt/8aSFniK/FEjxrFafyXfNYbK4YPydzoKVu11Ozh9hcpUCUC5
   g==;
X-CSE-ConnectionGUID: Pgo49uH3QX+f23nIJ1jGhA==
X-CSE-MsgGUID: GFUQMA5qTDmAWW8il3Eheg==
X-IPAS-Result: =?us-ascii?q?A0CFAwDMcORq/5X/Ja1aHgEBCxIMZYEgC4E9MVOBCQKBE?=
 =?us-ascii?q?RJJiCMDhSuGWYIhA54dFIFqDwEBAQ0CLgEVDQQBAYUFAo4cAiY0CQ4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQEBAQMBSgE9AgEIE?=
 =?us-ascii?q?QMBAQEBFRknCh0IAgQBEgiCe4IdFkEDAQIOBqt6AoodeIE0gQGDKQE/AgJAA?=
 =?us-ascii?q?dwPFAGBOIVAgx4BASuBNYJdgSMYARuEYicbG4FygVeCMTg+gQWBXAIBAYEXH?=
 =?us-ascii?q?iseH4NWgjAEgiJ6EhuBPx5lCYwiAQGHblJyIgMmMywBVRMXCwcFgSUQMwMgC?=
 =?us-ascii?q?i8tAhQNIg8aBS0dcAwnEg8dFxEeWBsGBRIgKkFDMCuBGYEHXYErKWECH0YtF?=
 =?us-ascii?q?YF2AoJRgSNdAgFJQQ4HRVMJJT4FEkckIggSCQETGi4LgRo1PAkmQRUMZAsaB?=
 =?us-ascii?q?RpICAILAgx2KBEQEx4gJjIEAx4jbT03Bg8ZAwSBNQWRBgdbghxxAVoHGhMBG?=
 =?us-ascii?q?w4CTyxxERYgCpMAJo9Xo3cKKIN3jCONPogyF4VbpRWZCCONZ5VohSYCBAIEB?=
 =?us-ascii?q?QIQAQEGgWg8gVlwFYMiCRY0GQ+OLhaDYIVBf8d6eQIBCDIBAQcCBw4DC4Foh?=
 =?us-ascii?q?GGLHwImB4FPAQE?=
IronPort-PHdr: A9a23:pRjo7R3BGd4nlJEHsmDPmlBlVkEcU/3cJAUZ7N8gk71RN/jl9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:1KU8b6j6HXrVwVQiMgxSqwcnX161OxEKZh0ujC45NGQN5FlHY01je
 htvDTrXOP/fN2L0c9Eibou0oEMFv8CEnddiHlc//n89EC9jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/nb8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUg9eErUHxur
 sUoaz5XNRaipbu077KSH7wEasQLdKEHPasFsX1miDWcBvE8TNWaGePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgZ/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9J4DQGpUKwRfIz
 o7A10vXPyg/HYGG9RaA202T1u7Lxg77VY1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2QHY909v8hwTjsvv
 rOUo+7U6fVUmOT9YVqW96yfqnW5Pi19EIPITXZsodctizU7nLwOsw==
IronPort-HdrOrdr: A9a23:VySmU6+0uLb4CKlgKcJuk+HRdr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBepTnhAsW9qADnhOBICOgqTPuftWbdyRCVxe1ZnO/fKnjbalHDH41mpO
 hdmspFeafN5DFB5K6QjnjbYrMdKZu8gd2VbIzlvhFQpHRRGtldBnBCe3+m+yNNNW57LKt8Pq
 CxouBAoD2tc2kWaMOUOlkpNtKom/T70LjdTVojHRAI1Cmi5AnE1JfKVzSI1BYXVD1ChYwl7X
 XElALB4KCiueGQyxPX1WPfhq4m1ucJzOEtOOW8zuwubhn8gAehY4psH5eYuioune2p4FE21P
 HRvhYJJa1ImjPsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhLhebgDS5yMbzZJBOe
 NwriCkXqhsfFf9dRfGlp/1vtZR5wyJSE8Z4KsuZrpkINIjgfFq3NQiFQhuYeY99WrBmfAa+a
 9VfYDhzccTV0+GZHbEuWQq6tmtUnMvWiqieCE5y5eoO/w8pgEl86Per/ZvxEvp+P8GOup5zv
 WBPaJymL5USMgKKap7GecaWMOyTnfAWBTWLQupUB/a/Yw8SjvwQqTMkf0IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnL2JFQ6BjCTGi0QDyok6hlltVEk6y5QKCuPTyISVgoncflq/IDAtfDU/
 L2PJ5NGffsIWbnBI4M1QzjXJtZL2UYTaQuy5wGckPLptiOJpzht+TdfvqWLL3xESw8Ume6GX
 cHVCibHrQ30qlqYA6OvPH8YQKYRqWkx+MDLEHzxZln9LQw
X-Talos-CUID: 9a23:u+X8zW7MewJlSC1MPNsszEETRpE4Uibk/DTeeRS+KEQwSpKVYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AYcqH6w8dvtf5XvRDH8yKIayQf+hG3p2LIR0Urbk?=
 =?us-ascii?q?Dkva7ZS10YBqdgTviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Oct 2026 10:31:44 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 25682180001DE
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:31:44 +0000 (GMT)
X-CSE-ConnectionGUID: HBuovw/bRlif/efZ91+FxA==
X-CSE-MsgGUID: NhiZYWZGSLqPYKiPkxrlgA==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,186,1787011200"; 
   d="scan'208,217";a="97533242"
Received: from mail-southcentralusazon11012036.outbound.protection.outlook.com (HELO SN4PR2101CU001.outbound.protection.outlook.com) ([40.93.195.36])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Oct 2026 10:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaOI48pnXW5imCA8ZfIvIsHV3NXzdd8LUA54pMhs2iKAeGCmcLUJlx2nSTT4OjzL8tu40KSgQDSvnRUV+zLWGdYnNhiTrx1G+9XWau0SbcZb0aTg1tKEXjK2fiWDG2MFwyDJA59JAUihqQOE2oxOCxogYODNX0r0HPKjSqJxzKfUnFBa6MFOtPWWyl31v2A/F8yF+jrwCnbpkGfVhWLIuGTGGKEmDgndI/zRmyDA3Q29ocnhLMdjPbewctcs5H4lsOLMivTy1e80nGZjemdOkQTcLyDXPLKq4xAKMOG8vH4zUC8gCgkr4ebu3FHyEgtAdp1e+Nlk+eemn/uXsm8/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zYgJ47j4YufgpqW4GdSoPP8rofZnX4WjHp8qo4R8ZY=;
 b=dnNdMu3o6zSqMpErt+s0wIF1GiiSif4883zkTJqylIFf1gXTI6dPD5MfqWaVWHASHQdCyquYwS14bM5n/0DmmatgdrODhrJ3mcYp0CSf3cZLdwYhwV7eYwmMrQiu1T0ZiVt2J+aGrX8N7lV3MuNY9NrX8WSkC5lBvJv2NFipP3wHJ7RSySNn9z+m+tlN4WS1y9OUZEO3ok+ZJpFWKOihGifncEX5jKwSDFe7w5mvA6679WDZ/2DPWyFFh9r/zSMoTnulHCPFGl6UWQM2PXGEwheZUuY+Jp7cuGQS47Dace76VHV46yrCGp/bFFIE+g+z4UrrL4FXXYbiImrU5zA4Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 by IA0PR11MB7330.namprd11.prod.outlook.com (2603:10b6:208:436::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:31:42 +0000
Received: from PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340]) by PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 10:31:42 +0000
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<devanshp@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2 5/8] curl: fix CVE-2026-8927
Thread-Topic: [OE-core][scarthgap][PATCH v2 5/8] curl: fix CVE-2026-8927
Thread-Index: AQHdaFYQkkWxe/VOS0WEP3+n/YGfTLcV37Nb
Date: Fri, 30 Oct 2026 10:31:42 +0000
Message-ID: <PH0PR11MB761654423DFF3F2219CCDCA2D36D2@PH0PR11MB7616.namprd11.prod.outlook.com>
References: <20261016130439.603118-1-devanshp@cisco.com>
 <DMI367I27X8Y.1QCWB126HTJ6L@smile.fr>
In-Reply-To: <DMI367I27X8Y.1QCWB126HTJ6L@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7616:EE_|IA0PR11MB7330:EE_
x-ms-office365-filtering-correlation-id: 0ea23abb-bfa1-4d12-713e-08df3670fd2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|18002099003|22082099003|8096899003|13003099007|38070700021|56012099006|11063799006|4143699003|261028144727099003|261026135527099003|261026121527099003|261026140227099003|261026130827099003|261022115727099003|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003;
x-microsoft-antispam-message-info: djt5MCCwW+b5fSvPjxQ5Q1yze8yjjheFSfKZFHOAGerN6q0Ck8p8hgR2V6atwt6FFxr/N+/GROTjTZPJIqzWFLjfmlGbJ5hj+iNoU24Idk3qB+A4gXYRmOil6ObI0c6aTQUThc3BgC1VWXloh+STnRLCqt/JOtxAW+FT5p1A+Jzm5Hz/kkaoOuyEjDctJOefchctPT+E0fXlOuC/jSz6V9VStFKC3O4JrLJrmw/w4Nvz4HJ0ZI2Cg5WIL5i8w5pF+T0aDYawYpk4LKzDyosi2p0nhAdC7qNG6ZBX5u+dfluKNDFkckxL4NrCT17LghIwPkKmau0SGe4fy5XyX1HqCd6annUve49Ll3EiE0u4hJ18PwVjRcvskxr2lNFge2swk3Qj4qJ1Q4tSUaRm1m6+M03pZCSwANjjdLWaNHb8yBATYD1XhyqyxVel8Kj5r8Y8dYRsehfWX1+u1/WPkaq3/uXYJV/ydF58bKRYfXjuS4Rs7T81JDcLDmYO+u6RGED2MjYPvE6a9pGGXZvL/F43QQhQVX5BixbjFcvB8nl5wwzJgpxuuv4a20Z+ray9pWFesMQSKssF0No44Ss6B+MXHA4hO8+K27ephgu1u60Bz60kSzsBO8PxkUDxmgmSu5d2RMyuw+PJSK4ZywU+ajP18M3/CmiDxImJEkkiZYVHBn4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7616.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(8096899003)(13003099007)(38070700021)(56012099006)(11063799006)(4143699003)(261028144727099003)(261026135527099003)(261026121527099003)(261026140227099003)(261026130827099003)(261022115727099003)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Sk5Sflkzd7ei0soaf0R43wDz9LS82VI3RCWdTsqBvj5Ihi4m3ftb8cu4?=
 =?Windows-1252?Q?KK0qxpEuZ7sEz9PEBL5XG3h9zr7zvHU65l43vPXMmmwLKL6hUPBUpHUJ?=
 =?Windows-1252?Q?iAO+kyO2zslzwtPMEg6rOKuxKMTicwAgvsfVBggqmcQvbnH1SyPiDMZ6?=
 =?Windows-1252?Q?m6P0DUoZ0jbbBu04MiBrQB6HHz1zFc1J+1N1POtLhomlUjR1iwQzSMGd?=
 =?Windows-1252?Q?CUuDR2UAohMaonU5ydNn9qFbsH6LWOo3UU1QV5zV4azW/tHSESMnNe2P?=
 =?Windows-1252?Q?UqmTwbcQPWvlTfgXqZKOX+eWTNPvK9TWowEeIwKq5dklr2wuUQTuP5B5?=
 =?Windows-1252?Q?VBEDxKMbB/iw3VI6cAtjpPRBYYGb5bijCgKjgs2jVD3UYWJxfTgnuKUW?=
 =?Windows-1252?Q?DfN0o9G8MoNcJrufDYH4AUI6S1m5A25q/Urf0NRfyjGpLcBhrV1PKYkY?=
 =?Windows-1252?Q?ttchWWkXFhU3GxdFuUjFAjrDfa/1iPXX7EjU4pjMer3OeIfmyIUSKd9y?=
 =?Windows-1252?Q?mSD3m5wDgmSBH5E11DGuE8dr/9DW8SCQvTVX7ElsLHjz6Ig2bJ+oBafZ?=
 =?Windows-1252?Q?UKahCyKZtiYJ/qrqpX38B2mAt3DRV1YR9RGZS9SuIzj22s5YK/zuT3K7?=
 =?Windows-1252?Q?EAqmoDPqcUn5pxZvcaBG2bV4CNfjs+hBtVTIyf2JLAq4ve5kLf/q/nYA?=
 =?Windows-1252?Q?VFjtPUGu0bi2pgH53Krflozqlmg5fRxhhz91e/WLG080LsMVwoDGCUMo?=
 =?Windows-1252?Q?FQStC7Ard8IYpwAEWCB0L0MdFa6ZaOzvv8deaeiZytBDeFPuz4msvPIa?=
 =?Windows-1252?Q?x8do93qM9eW/1fR4484Rnj6mztZVrsdEhAuAqoXmPjGWBip8LqXOIcMO?=
 =?Windows-1252?Q?1yrqXNcczn9ilV74Bc/DgLu5KKuObGT8e0UlqxnfeIp8s9V5ENlDEitN?=
 =?Windows-1252?Q?9/yFpQwMX814hrT1dQZlewc6ZJHR6svBSDzdFZ7ANiT1ZJeou2sn5hP8?=
 =?Windows-1252?Q?kplCF4Dkv1X/07ZLnU5C31tHL2dc3hbTiJVAilMlCrO1f8EFQWkxvm+o?=
 =?Windows-1252?Q?rdbL01aRmbSonMyPvv9QCA2Kxa9KrTTFPpS2tkV5JKw4WII7yZVxkZu5?=
 =?Windows-1252?Q?EFnpqlhbsBnuWjVDzf5krYW+8u1GVLKiz/wlSBc3ZPT3QiCNs9rcW7qq?=
 =?Windows-1252?Q?apqzhMya4h6DCh4FUDFk4PGW5njlVYOO82v7YfG98xYn7qG/P79HVmTK?=
 =?Windows-1252?Q?tcdEa9nPOQ/HfCG+LXrLJxiPreof8BKmTYI0P1yjBzExnyIzUp1Jv+uX?=
 =?Windows-1252?Q?iyrwjE6Jib/slDxDhSam8/JCjFiwW1F7PkdmJrS4t2PhqH01nPV6WWyC?=
 =?Windows-1252?Q?mzC7KntTD+yi/vm62jC4T6frf3UgljUoLyNz0X5iI6geksg75qE7Eljs?=
 =?Windows-1252?Q?tX/rXdtHJAx6z8PDhVx6PFolFFuVCrepvFCS0v5uNTLEBghkeRvoHLcO?=
 =?Windows-1252?Q?LMrpfRm/jsj06d9FbT/NXj9g0DCIuZUU8P2svNu5uiCCpw1UjIy1TgrN?=
 =?Windows-1252?Q?Fm7opzjmeC8oy0uam5KYx5g8FUTUXqsqrzAAFJOl/vA2pTebqElAk6+G?=
 =?Windows-1252?Q?Q8Vpf8tHOJ/TiF16cCn/3cEmemQPhuNxZJpzXXLkhmkO3yQTGkfSrvsH?=
 =?Windows-1252?Q?Ql1s7298XGUuqVhhMmDWJsV1ssTRVleDNoClcrMlHd7PqZNLL0Ey06ir?=
 =?Windows-1252?Q?NzSefuP3BOfj5yaeU3pTAOAxFATfWfoV072EgQzRpohiGWvERdes3pV+?=
 =?Windows-1252?Q?aB+eS5CXF8YLHapn3Ee6fXv6ltPgFpAWJc+mmPLUfA7nNSX6?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB761654423DFF3F2219CCDCA2D36D2PH0PR11MB7616namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 5vdfYuCeAHKXl90/PcIY6/1DVisOoZj85u9UUW0hvLiEfz5SFDfB5tpzVDbFZm9J7/411czJGO2Jhz6XYWTqG1L4ZGxACdNR5+iiX17MwTIq6N6XDka+9xFNd742RQe3U/GehKlRRNoExm5gNb6O2R+9xQ1ZlLLZ+LATsswKmrCiaH3TalGAqMisa5kr5TB2SO6LLF2DEq5/QSO6pIyoPVfokGOi2+hD8rPZbiw8iOcII/BHP+xreV1OahqAPzSeeSy6ChaFrw+fHLYuGUbb5udSnaJiQZIffWzNUojzYeQZFWhZ1OQoGQSl44bKI5ktiXVG58ovU5W4VwGfDLQ+iQ==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7616.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea23abb-bfa1-4d12-713e-08df3670fd2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 10:31:42.1575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M4XPMggAIN3VvOWIgeEssFUk3XPcqeHyncmX+Oa/U4oehY2sMpXkJ7cfdUd7xwKuEUEUgOFhMsRRErZRCNoiSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7330
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-4.cisco.com [72.163.7.165];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249014

--_000_PH0PR11MB761654423DFF3F2219CCDCA2D36D2PH0PR11MB7616namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
Thanks, that makes sense. I=92ll fold the Digest feature-detection change i=
nto the main CVE patch, add the explanation, and remove the separate depend=
ency patch and recipe entry in v3.
Do the other patches in v2 look good, or are further changes needed? I=92d =
like to address all feedback together before sending v3 to avoid multiple r=
evisions of the series.
Regards,
Devansh
________________________________
From: Yoann Congal via openembedded-core <yoann.congal=3Dsmile.fr@lists.ope=
nembedded.org>
Sent: Friday, October 30, 2026 15:34
To: Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco) <dev=
anshp@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-co=
re@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v2 5/8] curl: fix CVE-2026-8927

On Fri Oct 16, 2026 at 3:04 PM CEST, Devansh Patel -X (devanshp - E INFOCHI=
PS PRIVATE LIMITED at Cisco) wrote:
> From: Devansh Patel <devanshp@cisco.com>
>
> This patch applies the upstream fix as referenced in [3], using the
> commits shown in [1] and [2].
>
> [1] https://github.com/curl/curl/commit/1968b32afd8e41fbb87f8911d15c552c6=
b705385
> [2] https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57=
aacb567
> [3] https://curl.se/docs/CVE-2026-8927.html
>
> The test adaptations account for these earlier upstream changes:
> [4] https://github.com/curl/curl/commit/6cf3d7b1b161bc45501d17b401225befe=
3c43943
> [5] https://github.com/curl/curl/commit/a186ecf4bf0c8ebb3a9a826155b339216=
4ec257a
>
> Validation: ptests passed (866 tests, no failures). The release build
> skips test1647 because debug support is disabled. A native debug build
> with stunnel passed test1647 with the test compatibility changes below.
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>
> Changes in v2:
> - Rebase onto stable/scarthgap-review
> - Explain the test.h macro requirements in the backport changes.
> - Adapt CONNECT normalization and the expected error for curl 8.7.1.
> - Record target ptest and native debug validation.
>
>  .../curl/curl/CVE-2026-8927-dependent.patch   |  39 ++
>  .../curl/curl/CVE-2026-8927.patch             | 390 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
>  3 files changed, 431 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927-dependen=
t.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch=
 b/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch
> new file mode 100644
> index 0000000..d05699d
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch
> @@ -0,0 +1,39 @@
> +From a07fc9a9855848da48a4533b85153c681ae1b1a0 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Fri, 25 Apr 2025 08:16:13 +0200
> +Subject: [PATCH] tests/buildinfo: former "disabled" now provides more in=
fo
> +
> +This tool now contains ON/OFF information about features in the build.
> +This way, runtests gets both positive and negative feature presence with
> +this. Allows for more flexibility and avoids having to duplicate the
> +names.
> +
> +Closes #17180
> +
> +CVE: CVE-2026-8927
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/1968b32af=
d8e41fbb87f8911d15c552c6b705385]
> +
> +Backport Changes:
> +- Add only the Digest feature flag needed by the tests. Keep the old
> +  disabled helper, which clears this flag when Digest is disabled.
> +  Leave out the buildinfo rename and other feature-reporting changes.
> +
> +(cherry picked from commit 1968b32afd8e41fbb87f8911d15c552c6b705385)
> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
> +---
> + tests/runtests.pl | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/tests/runtests.pl b/tests/runtests.pl
> +index ddfab20e86..b40df554b2 100755
> +--- a/tests/runtests.pl
> ++++ b/tests/runtests.pl
> +@@ -637,6 +637,8 @@ sub checksystemfeatures {
> +             $feature{"Kerberos"} =3D $feat =3D~ /Kerberos/i;
> +             # SPNEGO enabled
> +             $feature{"SPNEGO"} =3D $feat =3D~ /SPNEGO/i;
> ++            # Digest auth enabled unless disabled by build
> ++            $feature{"digest-auth"} =3D 1;
> +             # CharConv enabled
> +             $feature{"CharConv"} =3D $feat =3D~ /CharConv/i;
> +             # TLS-SRP enabled

Reading the code more closely, I think it would make more sense to fold
this CVE-2026-8927-dependent.patch into CVE-2026-8927.patch with the
proper explanation (Like you did with the CONNECT line).

I generally don't like squashing patches like this but in those 2 cases,
I think this is the better option (the runtests.pl patch does not look
like the upstream patch anymore, and the CONNECT line is buried in a
very long cleanup patch).

Thanks!
--
Yoann Congal
Smile ECS


--_000_PH0PR11MB761654423DFF3F2219CCDCA2D36D2PH0PR11MB7616namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks, that makes sense. I=92ll fold the Digest feature-detection change i=
nto the main CVE patch, add the explanation, and remove the separate depend=
ency patch and recipe entry in v3.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Do the other patches in v2 look good, or are further changes needed? I=92d =
like to address all feedback together before sending v3 to avoid multiple r=
evisions of the series.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 color: rgb(0, 0, 0);">
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 11pt;">Regards,<br>
Devansh</span><span style=3D"font-family: Calibri, Arial, Helvetica, sans-s=
erif; font-size: 12pt;"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal via openembedded-core &lt;yoann.congal=3Dsmile.fr=
@lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, October 30, 2026 15:34<br>
<b>To:</b> Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) &lt;devanshp@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt=
;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH v2 5/8] curl: fix CVE-2026-8=
927 </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Fri Oct 16, 2026 at 3:04 PM CEST, Devans=
h Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt; From: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix as referenced in [3], using the<br=
>
&gt; commits shown in [1] and [2].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/curl/curl/commit/1968b32afd8e41fbb87=
f8911d15c552c6b705385" id=3D"OWAab7a2809-e50c-58e6-583b-d208866ca645" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/curl/curl/commit/1968b32afd8e41fbb87f8911d15c552c6b70538=
5</a><br>
&gt; [2] <a href=3D"https://github.com/curl/curl/commit/5c225384b8d52c67ce8=
259c6e4203bc57aacb567" id=3D"OWA5389be46-d21e-7df9-a13e-ccf32b767a35" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57aacb56=
7</a><br>
&gt; [3] <a href=3D"https://curl.se/docs/CVE-2026-8927.html" id=3D"OWAbdab8=
733-19f2-210a-9114-2cd8b556976e" class=3D"OWAAutoLink" data-auth=3D"NotAppl=
icable">
https://curl.se/docs/CVE-2026-8927.html</a><br>
&gt;<br>
&gt; The test adaptations account for these earlier upstream changes:<br>
&gt; [4] <a href=3D"https://github.com/curl/curl/commit/6cf3d7b1b161bc45501=
d17b401225befe3c43943" id=3D"OWAc1495dc5-bf38-59e9-8166-a6ab4015eb75" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/curl/curl/commit/6cf3d7b1b161bc45501d17b401225befe3c4394=
3</a><br>
&gt; [5] <a href=3D"https://github.com/curl/curl/commit/a186ecf4bf0c8ebb3a9=
a826155b3392164ec257a" id=3D"OWA9bddef12-b2b5-f3fe-25ec-7cf31f4fe3dd" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/curl/curl/commit/a186ecf4bf0c8ebb3a9a826155b3392164ec257=
a</a><br>
&gt;<br>
&gt; Validation: ptests passed (866 tests, no failures). The release build<=
br>
&gt; skips test1647 because debug support is disabled. A native debug build=
<br>
&gt; with stunnel passed test1647 with the test compatibility changes below=
.<br>
&gt;<br>
&gt; Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Changes in v2:<br>
&gt; - Rebase onto stable/scarthgap-review<br>
&gt; - Explain the test.h macro requirements in the backport changes.<br>
&gt; - Adapt CONNECT normalization and the expected error for curl 8.7.1.<b=
r>
&gt; - Record target ptest and native debug validation.<br>
&gt;<br>
&gt;&nbsp; .../curl/curl/CVE-2026-8927-dependent.patch&nbsp;&nbsp; |&nbsp; =
39 ++<br>
&gt;&nbsp; .../curl/curl/CVE-2026-8927.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 390 ++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/curl/curl_8.7.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 +<br>
&gt;&nbsp; 3 files changed, 431 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927-=
dependent.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.=
patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.pa=
tch b/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..d05699d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch<br>
&gt; @@ -0,0 +1,39 @@<br>
&gt; +From a07fc9a9855848da48a4533b85153c681ae1b1a0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;daniel@haxx.se&gt;<br>
&gt; +Date: Fri, 25 Apr 2025 08:16:13 +0200<br>
&gt; +Subject: [PATCH] tests/buildinfo: former &quot;disabled&quot; now pro=
vides more info<br>
&gt; +<br>
&gt; +This tool now contains ON/OFF information about features in the build=
.<br>
&gt; +This way, runtests gets both positive and negative feature presence w=
ith<br>
&gt; +this. Allows for more flexibility and avoids having to duplicate the<=
br>
&gt; +names.<br>
&gt; +<br>
&gt; +Closes #17180<br>
&gt; +<br>
&gt; +CVE: CVE-2026-8927<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/co=
mmit/1968b32afd8e41fbb87f8911d15c552c6b705385" id=3D"OWAef395399-b4b7-813a-=
d3dc-766a35255b8c" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https:=
//github.com/curl/curl/commit/1968b32afd8e41fbb87f8911d15c552c6b705385</a>]=
<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- Add only the Digest feature flag needed by the tests. Keep the old<=
br>
&gt; +&nbsp; disabled helper, which clears this flag when Digest is disable=
d.<br>
&gt; +&nbsp; Leave out the buildinfo rename and other feature-reporting cha=
nges.<br>
&gt; +<br>
&gt; +(cherry picked from commit 1968b32afd8e41fbb87f8911d15c552c6b705385)<=
br>
&gt; +Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt; +---<br>
&gt; + tests/runtests.pl | 2 ++<br>
&gt; + 1 file changed, 2 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/tests/runtests.pl b/tests/runtests.pl<br>
&gt; +index ddfab20e86..b40df554b2 100755<br>
&gt; +--- a/tests/runtests.pl<br>
&gt; ++++ b/tests/runtests.pl<br>
&gt; +@@ -637,6 +637,8 @@ sub checksystemfeatures {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; $feature{&quot;Kerberos&quot;} =3D $feat =3D~ /Kerberos/i;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; # SPNEGO enabled<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; $feature{&quot;SPNEGO&quot;} =3D $feat =3D~ /SPNEGO/i;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #=
 Digest auth enabled unless disabled by build<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $=
feature{&quot;digest-auth&quot;} =3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; # CharConv enabled<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; $feature{&quot;CharConv&quot;} =3D $feat =3D~ /CharConv/i;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; # TLS-SRP enabled<br>
<br>
Reading the code more closely, I think it would make more sense to fold<br>
this CVE-2026-8927-dependent.patch into CVE-2026-8927.patch with the<br>
proper explanation (Like you did with the CONNECT line).<br>
<br>
I generally don't like squashing patches like this but in those 2 cases,<br=
>
I think this is the better option (the runtests.pl patch does not look<br>
like the upstream patch anymore, and the CONNECT line is buried in a<br>
very long cleanup patch).<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH0PR11MB761654423DFF3F2219CCDCA2D36D2PH0PR11MB7616namp_--
