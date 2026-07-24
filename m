Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF16C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 12:58:50 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18587.1784897921686213499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 05:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=biI8p0F8;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5830; q=dns/txt;
  s=iport01; t=1784897921; x=1786107521;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=O/01bj/mhZsbHMNL0AoffV9jVGuhv4xIN3UmWmqOGr8=;
  b=biI8p0F8nOKrUiSuD0eRZAjbiZA5HyzX840OOZ/XWjZn1qUH8MO+DI2V
   1ApyjIRniqCyjp1bMZS7I6C2fKhkPAUYrHuDuk0AMJP9A+aIw5sRR5X9m
   rWmAlqPLbinSIi2ZMra1i0Skaa6cuFm0o7pODkrG1bWmsDzXcI9W2rTnf
   3fSuTmIoYk/uwE0/Ukj8ElI30lBOhJr0FMBAVWmYWWBAYIjvrI5OXgr/y
   eZ9CT15biTmtfzSJhFujzr1Z0lUWlIdIUfs7azdrQiuIHGszLzgmi80LY
   ecovVBhi5Tm8/2tqdyYizovvFovaKCmBUGn9Xyrd7GR8Mu++V23d5marj
   w==;
X-CSE-ConnectionGUID: k+U5w4oLTwuYGgJ8BuS2Pw==
X-CSE-MsgGUID: AfBxJupKQBmwk2ww0pWesg==
X-IPAS-Result: =?us-ascii?q?A0BzAwDdYGNq/5T/Ja1aHgEBCxIMZYEgC4E9ATBTgQgCg?=
 =?us-ascii?q?SFJiCMDhSuGWIIhA54bgXQKDwEBAQ0BAS4BDhQEAQGFBQKNXwImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBETkBPQIBC?=
 =?us-ascii?q?BEEAQEBLicKHQgCBAEJCQgagmGCHRZBAwECDga2eAGBPQKKKniBNIEBgygBM?=
 =?us-ascii?q?QUJAgJAAdwKFYE4hT+DARsBAQUlSWyCXYEiGAGEfCcbG4FygRVCgmk+gQWBX?=
 =?us-ascii?q?AECAQGBNCuEE4IwBIIiehIbg0mBYYxwUnIiAyYzLAFVExcLBwWBIxAzAyAKL?=
 =?us-ascii?q?y0CFA0iDxoFLR1wDCcSDx0XFh5YGwcFEiAqQUUjAxQtNjgLQwWBVwKBeD8jH?=
 =?us-ascii?q?wM5f4EvdUp3LWoCEBdKOCSCFIE6AoE3AwttPTcGDhkDBIE1BY0EB1sjgyFXA?=
 =?us-ascii?q?gRLgR0YLpNHj0Gjdwoog3WKe4EmjT6IMheFW6URmQgjjWeVYIUuAgQCBAUCE?=
 =?us-ascii?q?AEBBoFoPIFHCwdwFYMiCRY0GQ+UIoMUgS3FVnkCAToBAQcCBw4DC4FokACBf?=
 =?us-ascii?q?gEB?=
IronPort-PHdr: A9a23:qu5EWxFPv19p1ycuZT4yl51GfhMY04WdBeZdwoAsh7QLdbys4NG+e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HTTDA==
IronPort-Data: A9a23:34Ybpq5LZ/I7edysMUTVrQxRtGPGchMFZxGqfqrLsTDasY5as4F+v
 jEZCm+EbP2MM2P1f98lbdzn8U0DvsSEmNVmS1M5/CpmZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1Ot/rcwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ePs4lp/krBkVy6
 uEpBz8vPjqevLiO3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEfUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeMJ4TVG5QFwi50o
 Erv8U7pIAwCF+W1zCWGqG2z3vfwkDj0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ22JW9QnOG/bDSpjS3URX550dYDcPYZWPpO+Xenbw=
IronPort-HdrOrdr: A9a23:IZNAqaH/p6B/W5KypLqF4ZLXdLJyesId70hD6qkvc203TiXIra
 CTdaogtCMc0AxhJ03I+ertBEDyewKjyXcV2/hcAV7MZnichILFFvAH0WKm+UydJ8SczJ8T6U
 4DSdkFNDSYNzET5qiKgnjcLz9j+qj7zEnCv5a5854Zd3ATV0gW1XYBNu/0KDwQeCB2QbACON
 634M1BqzC8eXIRQPiaKxA+NdTrlpngrr6jRQQJKSIGxWC14A+A2frXAhKY1hARX3d1x6s+8W
 /Kqgr95q+ymfC2wB3R2gbontprcd3apedrNYipsIw4Oz/sggGnaMBKQLuZpg04p+mp9RIDjM
 TMiw1IBbUy11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFst6g55DeBex0TtigDg86t
 MI44uqjesSMfryplW72zEObWAtqqOAmwtmrQfUtQ0HbWJRUs4IkWVVxjIlLH5JJlOL1GlgKp
 guMOjsoNBLbFidc3fV+kNrwNCqQzAPOy3ueDlYhiRQuAImwUyQCCAjtZYidntszuNPd7BUo+
 vDKahmj7dIU4sfar98Hv4IRY+tBnXKWg+kChPYHb3LLtBPB5v2ke++3JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTcmDxodC/BzBSHi0GW2F8LAS27Fp/rnnALb7OyyKT14j18OmvvUEG8XeH/
 K+IohfDfPvJXbnXYxJwwr9UZ9PLmR2arxehv8rH1aV5s7bIIzjseLWNP7VObr2CD4hHnjyB3
 MSNQKDUvmoLnrbLUMQrCKhL08FIHaPj66YOJKqitQu9A==
X-Talos-CUID: =?us-ascii?q?9a23=3A6tXfimk5za31gJevMdqscKw2PAvXOX6e8SrPf0i?=
 =?us-ascii?q?cNXl0eZKaaw+65Zg+q9U7zg=3D=3D?=
X-Talos-MUID: 9a23:peavNQrCZIgm5zBls9QezxhsHtdK/ryNMWoIjpZcpNbcLRN9IDjI2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Jul 2026 12:58:40 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id C6B1818000147
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 12:58:40 +0000 (GMT)
X-CSE-ConnectionGUID: engyuae3QB6TZh+K8IyJxQ==
X-CSE-MsgGUID: bFeBx1B4TsORzT+u/fheRg==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,182,1779148800"; 
   d="scan'208,217";a="89405604"
Received: from mail-eastus2azon11011009.outbound.protection.outlook.com (HELO BN8PR05CU002.outbound.protection.outlook.com) ([52.101.57.9])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Jul 2026 12:58:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdCBv9OrLH12wz8yb7LBzQ0U4Q82cbZsAG/o3+ynacshr/lax5ZMLSucsPayCZdjjtxXGEQZW3vvK+dIIDer7k8NGrunHwe132vbmhKZOcSOj8hlDM5iXH0lTbCdEPUi6E9o2IQDmTCDxwRJrwefyWq2m/f5SsUQcdu5D9BvVDesqDzCH/ErE88n3LxbCVTO4qedkviLkcMzvqDMfqtQqaFExxN8tjvikUL2l9tlqt5lyjGhoK/vJbt2/slohbvhjgJX7mDS18StVUH0UO814DIy//TBAMlWggi6YdKYvT4Tre+jMlNN6HvsBk0WHUrxBOYjLYweAkNJDOGKMMbZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/01bj/mhZsbHMNL0AoffV9jVGuhv4xIN3UmWmqOGr8=;
 b=RYdqZ93UosiFiAmW83uvenxNG74cqKXHSeouhiR4UNS8+IgOS5dx28u1M/7Ull3DzDTqOeMzaNiqLtCLte0PE759J1DxpmDfiHhFfs9/w3DpezFeJjShQH2yL0oOaP2WjuoU5PSdtY7Skt6hVmqBb9N0P3waGgxRiwXwdtTbYbOEFay89X9a+TW0HSpxZk0FhaULFrFhFr68u2wytBTUHh+6iAEZxHNqFOb7nmwwqLkaFNO11gL1PI+9qVrk5jzYi3UUYSIxP5FaTi+ZCywYLXKCJ62wKs+WfLeeeJ7AR4LopSkGKGIj+sN4GGCF4AySEHxhHnhflgRVkPZqvUP1Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 SA1PR11MB5778.namprd11.prod.outlook.com (2603:10b6:806:23f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 12:58:37 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 12:58:37 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH 1/7] curl: ignore CVE-2026-4873
Thread-Topic: [OE-core] [scarthgap] [PATCH 1/7] curl: ignore CVE-2026-4873
Thread-Index: AQHdB7TJZMccWK0WR0m75Lbwhab5KLZ7NqGAgAGSEs4=
Date: Fri, 24 Jul 2026 12:58:37 +0000
Message-ID: 
 <DM4PR11MB61898C52F42198EF138C1A0FC4CF2@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260629104801.972184-1-adongare@cisco.com>
 <DK5YVWWYT9N8.1NLJXFMIU67G1@smile.fr>
In-Reply-To: <DK5YVWWYT9N8.1NLJXFMIU67G1@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|SA1PR11MB5778:EE_
x-ms-office365-filtering-correlation-id: d157bb3f-7321-49d9-4776-08dee98346ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|10067099003|4143699003|6133799003|56012099006|3023799007|8096899003|22082099003|18002099003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 G5FI2Gqhxf7Pi25ccskgEJPEvtmV9dhLM35XU5lzfUAgPBF9QZlKB44+UX+tO0CinG0xtC7lokcuPEPMlvoaxLrYNQUSpJblY5rCF4WwjpJJ4/9SiAbRfKIt+blcmpboD5gWaf/dCPOtKxn2QcN+ZcIq43WLOdqTyW7XiBOUtQDGj8i6poeLD7qH8jZyDU22WBSoify5TWnj0qisMNugXZRDbyvn9B5DYsOlQwJC//rn3NyGdWV96F42pAn9w02FJgJWIicewGU99QeNAeOUoRj0ToKYcBN+g/SJiTAPyqT8A2M4RMVOmyc+aR3WNK/JTuNhhmJc5zJh/oQZjOI/3BrH7cwr5QQxtur0VZPSv5P7RXYBkKp/F0LnbM3ovSxc5TQIPN56rgGtZ6zxxTR6ubd4D4ATd989iwAnMVtYBtJWQm+nco/OJbXMIlzutY7tLqgO7qphxU6dzlOURTmO5DWnz9p9uuIJMAWUf0btNnl6fbvYG27sZzczdM7OTdn8wmXe6KHJCCvP/MzJvCkuGLNuCH7lFT+JiliQX8dwGYwT0PWVy3U3MrcfoAzZOGfFYFY74X35iNUtEnfsXSUSpvUqRcW7RU22/1PJGylsl7yr+90a4qq5mmU8IeoCUEHny9cDhwkMfgQaJa7ar4LS35U8J8FyTDOpolZt5HFHt3Y=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(10067099003)(4143699003)(6133799003)(56012099006)(3023799007)(8096899003)(22082099003)(18002099003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LgVW771wuFB6xUtkWEt3qvPXFuRZ29EoLZa87oc7TQoHkUhEBIA6f2dN3zQ/?=
 =?us-ascii?Q?INHyQfJFevPuq++oWii91tMpy2YM3ll+XC8r9p8wedmj896YpOsw6XdNkuQ8?=
 =?us-ascii?Q?WvpvHDfrE43nqLHetAhGmL7+gBy6WcDFQR0xobgCA5qStJNfL/TF/aU16pSD?=
 =?us-ascii?Q?F0OrjGJEl6yLkuMgl1Pxn+AB11KhrAfkekF0zKoGu4B+MnjJk2ELdjuJGY1j?=
 =?us-ascii?Q?1RICSI3uXrmu16WwIsXbXlr5QRopRRAymTuaioaWF88YQL1yFx7VDXgAMuuk?=
 =?us-ascii?Q?3iFTFqWAozgHc3D0EM02/ttNPbJs/oNeXJYQ4gGdxNtiSGkwLOlWMgifvlF8?=
 =?us-ascii?Q?k2rSTFzRNLesD4D4DAfeDyYiNuBnFhIyr1c1iEQmyIBCjP7aKYtEDPSz12Wg?=
 =?us-ascii?Q?EZb9LWxPyvgKuq8r03S75Xrhz7u3ye+M/9SYPxu3GV5efCR3jQqXZqJETBnP?=
 =?us-ascii?Q?CM1ZiVdfUu+UPjzmD71T5mNhnJjL5lrV9Te5+ePo5cCjQUpo1qtJZX4l+awV?=
 =?us-ascii?Q?qY2CihGQeCOskE2UphiTiLG+EO+mZE82V+e2mzE5CPQXSBK4vOdbexrb8TYj?=
 =?us-ascii?Q?yWkoGhNQAlnPIbLNGSxZMovgIDbZ/2ouf1PMDSBxCIH52f0k9B5HGfufv+Cl?=
 =?us-ascii?Q?/Fz568ZuxeGmYv0sXqYSiTE1Mi7oKE1Bkr2u/Au7vRm0OhFK1brgQbjyGSzu?=
 =?us-ascii?Q?SB2HJztitTTozX0s2Q2bqWYcYN06YSU9LixfQEMZK4BN8EELCIHrsw2VpChT?=
 =?us-ascii?Q?pjgBgNxI7jY5TCzE9zOczWwk44As/4G0Dg5x6T8/Qu0ET0jrLHKN/5yzkC6P?=
 =?us-ascii?Q?9Wc4LTlMpQ5kKlgcb/tBoge6jFHhAdrI6ppGfkfeiCsh1Zpcpradu2rLP7yT?=
 =?us-ascii?Q?GW/fOYLjCS74iacR3GzSlRuFGs59zaNUAiK2bzX+4B0fK8Mx4qxWe/nsbDba?=
 =?us-ascii?Q?AIYoYbPH4IZ9/SAHbj2c3lFBX9LSvapPsVbUcwkAFHefba26k0iOG0I4HZfx?=
 =?us-ascii?Q?/VPujwBvxV8Sk/xRTjR5wzjGvOA3Ma+8QY8eivRMys1o0o6e9C1m78kdKCi+?=
 =?us-ascii?Q?t9zk4wc0RNaQXj+69KyohcpznHnpbXS4URllcY61l0PUmxyN8jPipUP076a4?=
 =?us-ascii?Q?MnQPULaw+qoftod237FUypEDVCzVdBiB6oVu4YPvWXrgNhjhmvKzDkiwNqYl?=
 =?us-ascii?Q?osaaVofNccFkoXx2C3xeH9yTXpwYhASHdniplCTyUA8tHVaebJrEm/8G8/W4?=
 =?us-ascii?Q?osddANAyAyh/fLWXBei242hYUHMN+4K1qejoKZwEHxPgDqGsXUgWJZtdv+aP?=
 =?us-ascii?Q?kdf15MyQ/aN3miiJ9mf+A5iRJxT1+Se/P0JBTScUVHOQkrfSlRcYWZfrSOTc?=
 =?us-ascii?Q?NYrBF3DZkZ6EIPPThYJvNPcSx2LaX1b1q5aPzjdbpxjewHJxMLJdEHh67FrT?=
 =?us-ascii?Q?cyAnDzWch6GpbgFX7RQAjyh0+5jpVgMWlXsVoc44bjfg5LmU2+doSgFRg9v9?=
 =?us-ascii?Q?SmoHBHd0xstn9FrWLQLNMoSFRsIMJD4qvLH/MhRX2KdUU9gDl2plXUFr0vO0?=
 =?us-ascii?Q?b+tCiKACoG9Lo5DtH+FRsaaeq1QeOZVWO5B7AM1JumayRNFv1JtTS9QjruWl?=
 =?us-ascii?Q?C5Oo3R53jeFTk6Kr3xqMu5sskEA8dNFgd8VbCBCAHROsyvqLNDsOjeWxHXlw?=
 =?us-ascii?Q?zjthx/UIvU6h8elNmwwDtFvJs08ePHwBzYSZRvSWqeuhQydg?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB61898C52F42198EF138C1A0FC4CF2DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	fO+X4chDO07ILtFDpQ1++IPGkejUKnB8239c3zEsclSctAygQPz6bUIigbKDi6rlFcXXsetoYpybZlLL3SavT67hqnbbMQTDOxg8UMHjBudkOrCJAPUKt625Cgjy2EzUvmMGW4vPlS6QSad00h+TcR8Q5G56JYqNoq0wGsGKeyayd65iTRMxpzh1M8cH/cgE0KGrKksEATvr3vkGXI95E/S3Sb5CaVtrpzfEBBMDHQUzBHctI4kUqvXrIWQc5MQR3gOD+68rJBTkPXtBAs3TWg4YYXlRcVap3lBohLF1ZIdZXLkPBzvqy0XrTQOc4RhRj3FSIGWqdhCSk6wbteMTuw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d157bb3f-7321-49d9-4776-08dee98346ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 12:58:37.2460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: APinzPEjoIae1bJMxQ6LE072+SdlK3y6reFV8Fair2HBay0Q2q8y3ZyVcnV3wJENuoHmLZZkjE+yRMgHzvnj+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5778
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-4.cisco.com [72.163.7.165];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 12:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241931

--_000_DM4PR11MB61898C52F42198EF138C1A0FC4CF2DM4PR11MB6189namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I am working on this and will send v2 of this series after rebase.

Regards,
Deepak
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Thursday, July 23, 2026 6:28 PM
To: Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) <adon=
gare@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-cor=
e@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH 1/7] curl: ignore CVE-2026-4873

On Mon Jun 29, 2026 at 12:47 PM CEST, Anil Dongare -X (adongare - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> - CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated w=
ith
>   clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
>   transfer.
> - In scarthgap, these protocols are optional PACKAGECONFIG entries and ar=
e not
>   enabled by default in `curl_8.7.1.bb`.
> - Record this CVE as configuration-not-applicable for the default recipe
>   configuration instead of carrying the upstream fix unconditionally.
>
> Reference:
> - https://curl.se/docs/CVE-2026-4873.html
> - https://nvd.nist.gov/vuln/detail/CVE-2026-4873
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>

Hello,

This series fails to apply on the latest scarthgap.

Can you rebase and send a v2?

Thanks!
--
Yoann Congal
Smile ECS


--_000_DM4PR11MB61898C52F42198EF138C1A0FC4CF2DM4PR11MB6189namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I am working on this and will send v2 of this series after rebase.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Deepak</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Yoann Congal via lists.openembedded.org &lt;yoann.congal=3Dsmile.fr@=
lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, July 23, 2026 6:28 PM<br>
<b>To:</b> Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco=
) &lt;adongare@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;=
openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap] [PATCH 1/7] curl: ignore CVE-2026=
-4873</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon Jun 29, 2026 at 12:47 PM CEST, Anil Dongare=
 -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedde=
d.org wrote:<br>
&gt; From: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt;<br>
&gt; - CVE-2026-4873 affects curl before 8.20.0 when a connection negotiate=
d with<br>
&gt;&nbsp;&nbsp; clear-text IMAP, POP3, or SMTP can later be reused for a T=
LS-required<br>
&gt;&nbsp;&nbsp; transfer.<br>
&gt; - In scarthgap, these protocols are optional PACKAGECONFIG entries and=
 are not<br>
&gt;&nbsp;&nbsp; enabled by default in `curl_8.7.1.bb`.<br>
&gt; - Record this CVE as configuration-not-applicable for the default reci=
pe<br>
&gt;&nbsp;&nbsp; configuration instead of carrying the upstream fix uncondi=
tionally.<br>
&gt;<br>
&gt; Reference:<br>
&gt; - <a href=3D"https://curl.se/docs/CVE-2026-4873.html">https://curl.se/=
docs/CVE-2026-4873.html</a><br>
&gt; - <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-4873">https://n=
vd.nist.gov/vuln/detail/CVE-2026-4873</a><br>
&gt;<br>
&gt; Signed-off-by: Anil Dongare &lt;adongare@cisco.com&gt;<br>
<br>
Hello,<br>
<br>
This series fails to apply on the latest scarthgap.<br>
<br>
Can you rebase and send a v2?<br>
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB61898C52F42198EF138C1A0FC4CF2DM4PR11MB6189namp_--

