Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36668.1795586746785584886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=liwHljjL;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7854; q=dns/txt;
  s=iport01; t=1795586746; x=1796796346;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=EI/fdRhormHsQSNepQYxVi4MWLN6AADK/QrShsgMoSg=;
  b=liwHljjLged++pZc6zIlvCSTg7RVZN2JHOzJz0OtwpFVfMCzL0fvXGI6
   4SfRwkGJ/AV2M8ZeojuR7Bv+9t1iaeOos8marHpoSw78GqW+KrbyhgdgY
   kmTpgAqgJCHrThBMb6KHlJ7Y8mipgXqAoCTc3OBy1L+Ry4MfNrvqiK14c
   l10t8Gn4VZ5lcIGtfZdrVQJKVyMOmZx7HI17jc/WVRFJLEjMKJJHpe+jW
   7roATP3HIKk09YMIIr4A/aCgBSLhivmOuRVxdTj9YS8Jl3LuCquRNHzjY
   JqNyGLbwOoXw09TmSsMi4kDNh0Sh5dECKfcsPaCcDWC8xr01wgegk5w1s
   Q==;
X-CSE-ConnectionGUID: GUiuC4ltST2EXtuzt51gJA==
X-CSE-MsgGUID: 0c+uO30zQrWTGabe/HXhuw==
X-IPAS-Result: =?us-ascii?q?A0DDAwDeeQZr/4z/Ja1aHgEBCxIMZYEgC4E9ATBTgQkCg?=
 =?us-ascii?q?RESSQSIHwOFK4ZZgiEDnimBfg8BAQENAi4BFQ0EAQGFBQKOIgImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgEBAQEDARE5AT0CA?=
 =?us-ascii?q?QgRBAEBAS4nCh0IAgQBEggagmGCHRZBAwECDq5ScwKKHXiBNIEBgykBPwEBQ?=
 =?us-ascii?q?9wPFYE4hUKDBBsBAQUmSWyCXoEjGAGEficbG4FygVeCaj6BBYFcAQECAReBH?=
 =?us-ascii?q?SuEFIIwBIIiehIbgjsJjAgBAYFJiFJSciIDJjMsAVUTFwsHBYElEDMDIAovL?=
 =?us-ascii?q?QIUDSIPGgUtHXAMJxIpFxEeWBsGBRIgKkBDMCuBEoEDXYErKF4CH0YtFYF1A?=
 =?us-ascii?q?oJRgSNdAgFJQQ4HRVMJJT4FEkckIggSCQETGiwKgRo1PAkmPxUMWwwLGgUaR?=
 =?us-ascii?q?wgCCwIMdCgREBMdHCQvBRkmPBsKgQwnHR4ZDgIpBhYhCzRtPTcGDxkDBIE1B?=
 =?us-ascii?q?ZMnB1uDG4EPK0+BRB+KX4hoj0CjeQoog3mKfoEmjT6IMheEBIFXiz2ZWguYf?=
 =?us-ascii?q?SONZ5U8JSGFDQIEAgQFAhEBAQaBaDyBKB8LB3AVO4IzAQEyCQpAGQ+SJIF/g?=
 =?us-ascii?q?xTJJ3kCAQgyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-PHdr: A9a23:u/HHTR/vkZvYqv9uWBDoyV9kXcBvk6//MghQ7YIolPcXNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8EqaQ==
IronPort-Data: A9a23:io8YaKI/Ps/cVRBwFE+RiZQlxSXFcZb7ZxGr2PjKsXjdYENS1zFVy
 zQcC22CbqvfazD2eYskPdnlpE9T7J7Xy9JkHAsd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1BMUArFtEc5t1LW0x+6
 eEKNG1UYTKq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEyojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsjeCwb4OIIYLiqcN9xk3bu
 0Wdp3bAGC4mG9WVxH2lwnKxmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MuECSB3MPSXhKb9lOWNIKeAHGH
 2ShxrvBLTduq7aSD3ma89+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:6rmoPKr9bXeHe8s070sQx10aV5siLNV00zEX/kB9WHVpm5Oj5q
 OTdaUgtSMc1gxxZJh5o6H+BEDhex/hHO1OkPcs1NaZLUXbUQSTXfpfBOfZslnd8mjFh5JgPM
 RbAudD4b/LfCJHZK/BiWHSfadDsby6GeKT9JrjJhxWPGdXgtRbnn9E43GgYzRLrWd9dP0EPa
 vZzPBq4xCnfnMaZNm6AH4qY8jvzuegqLvWJTQ9K1oC8gehsROEgYSWLzGomjsOWTJGxrkvtV
 PCjxH44aubtfS6wA/31mPY7Zha8eGRhOerAvbituElbhHXziq4boVoXLOP+Bovpvu01VosmN
 7Q5z89IsVa8RrqDyGIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FcyHe91ErsLhHoe
 F2NiOixthq5CH77WDADuvzJlZXf42P0DwfeNso/jliuE0lGeZsRMIkjRto+dw7bVPHAcgcYZ
 lT5YfnlbdrWGLfSWzFtW9yx9HpdHEyEhCaBnUmgKWuomNrdLQT9TpE+CTZ9U1wrq7UR/R/lp
 f5G7Utm7dUQsAMa6VhQO8HXMusE2TIBQnBKWSIPD3cZeo60l/22tfKCY8OlamXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO9hzWWm2yUTnk18kbvvFCy/DBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTB/P4N2PhFYtAwgW7UZhPLnsVVtETp78AKhizi9OOLpevuv3Qcf7VKraoGTE4WnnnCn
 9GRzT3LNUo1DHcZpY5ummnZ5rAQD2KwXsrKtmpwwE68vl5CrFx
X-Talos-CUID: 9a23:mnEjhW3mMFB7UDI89rYtj7xfNf0kb1aByGvrHxWVOXp0WqHIEFCy0fYx
X-Talos-MUID: 9a23:rj8HIARjZqJERxOORXS0j3J/E5ww8Z20N3wimJ8L/Om0NTFvbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:05:45 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id A455F18000615
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 06:05:45 +0000 (GMT)
X-CSE-ConnectionGUID: ctbsMV+BTyORSFrIxJEV4A==
X-CSE-MsgGUID: SfV7wREmQA2AyhVJBERxeQ==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208,217";a="76762955"
Received: from mail-westusazon11010015.outbound.protection.outlook.com (HELO BYAPR05CU005.outbound.protection.outlook.com) ([52.101.85.15])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:05:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPguevmCy1DkNaqEynpjKWfpLxppuARf8MIZlzUpVbWVT+65KzL1U4XuXGrLn0QuY5viY65pQNtLtEWWiTPx5aMKYuuhIWLc6cOCjIaBxkjwLdfrEx5bzcs20MnDqUwrRtEDB17c2svtbdFwTON7qEoqiIOWjM5tYKiOb8xpG0dmv5AE0ovOkqsrwe0CoxgqTAuveNAi1xG8XiigjEQDmUlPHtEp5wvmgSUAu424S2nFMH4zFBjIeiGB1hWrUQ7y1g3j00M4v6wHXUZXaTllqFH7MfqtNs+MupgBeb43wXPnMYzXrbfzErz9kwSRIwkbIkrvXSP3aPTXUqJIZU8zXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI/fdRhormHsQSNepQYxVi4MWLN6AADK/QrShsgMoSg=;
 b=k9kFTmJej+qt4kECcyFWzEFBjxYpLCIcfXVlu9oyWbgui8u7boJQYQCwX/Oa9BUysr0XBqeqhtDNqznEGVV49Bhxpjhmz1X8bhAaOROOEj7BvkNvM6O/Mz6TJMChoL2wcAHc2a2p4n2RwQ+OxphmP+AMRYyaBisDRCYJS4o8mgPtUSZPXVSRtYYJbOeZ0d0LxYkn8CeYWjW/PntQ3Qh8QM/JOj1Nay05jXDXgTIjhnC1ooQq6t6XenE/1xyTl7J/eSxjkI4/hvGX9yd70VG6/zJ9vdx7JkUkTw21/VzLmYG7F2loNBHllJqkqEkf+W7lEBofu9Qq+7Aj5vNcYWThJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7)
 by DM3PR11MB8682.namprd11.prod.outlook.com (2603:10b6:8:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 06:05:41 +0000
Received: from PH0PR11MB5952.namprd11.prod.outlook.com
 ([fe80::baf6:8034:a18e:56e1]) by PH0PR11MB5952.namprd11.prod.outlook.com
 ([fe80::baf6:8034:a18e:56e1%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 06:05:41 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/1] openssh: fix CVE-2026-106587
Thread-Topic: [OE-core][scarthgap][PATCH 1/1] openssh: fix CVE-2026-106587
Thread-Index: AQHdXSIbdTyaaCtejkqfhtI6E/I8mrc3zRGAgAa9300=
Date: Wed, 25 Nov 2026 06:05:41 +0000
Message-ID: <PH0PR11MB59523693866FD2C33C8F61EDAD432@PH0PR11MB5952.namprd11.prod.outlook.com>
References: <20261016035448.3083867-1-hthakar@cisco.com>
 <20261016035448.3083867-2-hthakar@cisco.com>
 <DN0EXVAABCIP.YDZIYTDBHKP0@smile.fr>
In-Reply-To: <DN0EXVAABCIP.YDZIYTDBHKP0@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5952:EE_|DM3PR11MB8682:EE_
x-ms-office365-filtering-correlation-id: 537df494-0c30-4300-cd66-08df4aba2298
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|13003099007|8096899003|11063799006|56012099006|261026121527099003|4143699003|261026140227099003|261028144727099003|261009223027099003|261021121427099003|261022105027099003|261102123227099003|261022113327099003|261022075727099003|38070700021|10067099003;
x-microsoft-antispam-message-info: deTGr9mM4PcbRsUH2YLXhYvJbH4rEFwHry8Llb+Sofbk3wsCar+gD2l5q2yflXbbAAQK9JQqcGj8omhUmyoa5wsSmG/kBg7RN2lbPekhC4PACii+3NUELtA3aoElpAwbtSP4oVxUjteqUirrhY7Y05FmPpcQxc1e369whZ4z4iKdYhKOKlv3FtOSOG16dzq3YQGCextH1iZyqW4go0lyLHbYm3+PdYC3wibhi+lUCjWyz/H5AWIfSZ1arRDtcX6TTqY3XT3TBwve+dSuYTPDURtYQM8MSe/ZGnafLlU4jVlUicTg8FBEfr1WI259qyMzkdHyRRXZux9I4AJwmbuK9zUoFB05VNnhhFuBh1nHyXsBvXWoUaGZTr4taW5pzDeiesRNXXGumBHLaTZl+M+4/LR+dnFR1daVAKw4YjPsAnQiee2uFwsFZTXvOa8bLRbqlVqNGYXNanriGL9FK3LdgaV6yIroZoLL1RfkHtqe9NbwwazBnbuNxzK/P6UBQUcbSnSP9z8o8kMqM5hbN2S4A254kS5tNhV1MAw50r1c39/0xodrHRQmFuRMOYLVMsse+1RbzORjsRGxA/iJUn5HIekmRzVxFusloGa7TRm69yQzAzSnCtm2nRxM8X9EldrdUa9iq3hJ/lXIzzMY5JV3FcVi5JNBZilWyO9f0mqmI28=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(13003099007)(8096899003)(11063799006)(56012099006)(261026121527099003)(4143699003)(261026140227099003)(261028144727099003)(261009223027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261022113327099003)(261022075727099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BocARu4ojMyYLntSy9AejiKmNZrzn3K/aiNpao0pxSkKzMQT+/2HW/Y7rg4b?=
 =?us-ascii?Q?xyeL83ziI30R+lumPFgIetnyssC8QXlisHnR/O2vdd4GVXYv1H3VxOLKjCae?=
 =?us-ascii?Q?sXze+LeP3SkyPYho/auxWnt5/UnGN2JtydIueIiVhLeGa4hQFrmk/DZURniU?=
 =?us-ascii?Q?hqDhznlfW2hZC5sEiS6sf3PTpEleuumn+XzRQicNbfzD5vcjLB/EL11cGBTf?=
 =?us-ascii?Q?NnEvxa+vyKESRbe1azfflEATZGK0r6q4Daw9gU6+TFWDLbotJyvY91+FRf0f?=
 =?us-ascii?Q?LoA1ZBUffDvP/X0iDveiIvG+swByUiqbjAwYyLI68gTxUY1i7e59jcXRk4Vx?=
 =?us-ascii?Q?R4wrfKBixuk4WlE5qMfZbmK8afCr87x4qUxltDzOAbiOs7D866Pl81IEKCWi?=
 =?us-ascii?Q?s5wFrydhbrE67x4nAviwW7q9yW0JVDxahlCzynvqXO4SsChRL3/8nAkxJ2DI?=
 =?us-ascii?Q?2Dx16ku3E2FHk9KNxbjC3rDoW5BTe8BZW0FFdOeiDs0dk7BJLhWnUgOceVrS?=
 =?us-ascii?Q?30Jf00yvMqnJ+JapnJ1r0vpg1J2Wd7DgMHbNLrlvwgy8X0mGqvdmQlKdyXSX?=
 =?us-ascii?Q?Mf/c164Pkf8EXZhPoxEq2NEvN9byOtY3hFHz/edBpXkKLUquAjOE/YCbOy43?=
 =?us-ascii?Q?U/wSLi6lqZyEKe995+xYAZZgsvV/CqWSuMM0xZ1g4fZ/2CtmcC3SVMSOl3Ua?=
 =?us-ascii?Q?mV+Pwzl0V6jRjGn8Th/f54fGgEU8yyncfz9bjNKWEsdvFax0FC30zqHkEUiW?=
 =?us-ascii?Q?Fj2MrcNHgYFfXDaOjH+lYwiDauqym3dMhiTuJfktMOn5tLjT13MLk/DiMzXd?=
 =?us-ascii?Q?2osUX5frADbxIH0NsBMK/Wq746IhMfIMMLMgrbqNNapfxirI6hzTZetV6iAY?=
 =?us-ascii?Q?YG7LXJaBywXVwFgnyed1X1xIP5R/8jOSWNaMg8QJonPd4+QbZrWNvk3HdVNR?=
 =?us-ascii?Q?SUvYvTRihF6zrDX8ibqkAdqwD3LS57sqc4ktsfl7d+V+PpdoOkMCKpMDpC25?=
 =?us-ascii?Q?QwKrRd6XxFJQnPV1dUjXpPc2PEGe5renzxnxDjW1TRVIusfxg9+5TJkRzTUN?=
 =?us-ascii?Q?q0sbBky78g5OswVcly1gD5W+ra2O+krOitsSibMpZkg4H8Tvn3ikmovFmHV4?=
 =?us-ascii?Q?KGUGiyDgAEd5Fnr5ZGQjNFd9V299p9AC8fzmJmEfBZh0AOsEkXt+jU2cI8Bi?=
 =?us-ascii?Q?lYBZht7fffEWXnGY0mRiM9n9yQDVtHUm5CbkLYphkv0Oo5Ez9xnrtLNc1J0u?=
 =?us-ascii?Q?AcQX/vG5PFO47Lg328Zkkajy7mQoP7MR/87hpN2F3gav9Q64BA2yNmbmJ7a9?=
 =?us-ascii?Q?bP7VT8BT9iWYTFn9K2VCj2S5cuycDmneiqZ7LZEESyL4pHvdQcvUPHUe/3p0?=
 =?us-ascii?Q?Y9Jljx1rSguZJuHMGqlo/tOINqgnu5CTzZphV4ba5xeRccZCqRivpK0WXe4B?=
 =?us-ascii?Q?vMQfphodktpwWAUBiCvRoG1n56LjgCoGVAsF6nmj41Dxo6jJQgf/h4rrFfkD?=
 =?us-ascii?Q?AmLuwKRiVVvANBMpiscV4USIY+H2o/BJ6atJV/vX5+h8TVPhMDBUiNm1iFQL?=
 =?us-ascii?Q?y973ycTNP7AsPvTrqbEHSZvg8dBe5RQLOR3Y05mVJNn8QHafMOZjWKZnZVax?=
 =?us-ascii?Q?+Na2btwj5/8RwsPJ6iusCeWNlNXSVEkTqogkcoOJMFobhvNa5VdiT/xUf4iC?=
 =?us-ascii?Q?9aRzmzrnWpBqwdZ6E+uVSnDMKgMnOqpXBZVwByPeqpO0Gan1?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB59523693866FD2C33C8F61EDAD432PH0PR11MB5952namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iHDPcY0pn8zfQ3qPoU70NxNUCzi85Jl2OZcf6hfPaDMyEkjy9h81ksvSf5xscsz6BRLT5k6HELS5/rhNErVD+os6Bu2yNsNSwzYZCLMCKlnR1g7ppnL3bsN3r+QKRYtM2fj+lTtikWrE3wPZXI86wgdN4i9aLkOXR+y2Mflkm5N6XpUlHqBkLOEMBOrk0VzQrzsOGiq44piOLO5S3rHj9d+kdqlugr9yT+kD1LvOWjeyWRJsIEfJQScKN+qMfYkW+wm6HMLr87EZaNkL01qRbEpqmlwRis+Ss9aFtD1mBLELlU/q1H3JKIoUBc47FRl6IjRB1nWAKJOmPgdw2Y1uHA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 537df494-0c30-4300-cd66-08df4aba2298
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 06:05:41.4543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CfQ//JqKE0HTvMMQ6wSrJm3dthm5dWmYdD2oq7g0QcUD6co8vYViW3M6wKgPB5nhYFiObo72G2qVdiHTJ2e3sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8682
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-1.cisco.com [72.163.7.162];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 06:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251162

--_000_PH0PR11MB59523693866FD2C33C8F61EDAD432PH0PR11MB5952namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
The corresponding backport series for blacksail has now been submitted upst=
ream [1].
As requested, I have also resubmitted the patch for scarthgap [2]. Could yo=
u please review the updated series?
[1] https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D53833
[2] [scarthgap] openssh: fix CVE-2026-106587 - Patchwork<https://patchwork.=
yoctoproject.org/project/oe-core/patch/20261125060245.3720245-1-hthakar@cis=
co.com/>
Regards,
Hetvi

________________________________
From: Yoann Congal via openembedded-core <yoann.congal=3Dsmile.fr@lists.ope=
nembedded.org>
Sent: 21 November 2026 04:35
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@=
lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/1] openssh: fix CVE-2026-106587

On Fri Oct 16, 2026 at 5:54 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1]..
>
> [1] https://github.com/openssh/openssh-portable/commit/526fd2771342f36142=
099bec82c49ce0457c5016
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-106587
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../openssh/openssh/CVE-2026-106587.patch     | 76 +++++++++++++++++++
>  .../openssh/openssh_9.6p1.bb                  |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-10=
6587.patch

Hello,

This patch is blocked pending a blacksail backport:
See equivalent wrynose thread from Mon, 09 Nov 2026:
https://lore.kernel.org/all/DMQR3DP72ES8.3KANJDXOTSO63@smile.fr/
I will now drop this patch. Please send a new submission if the above
situation changes.

Regards,
--
Yoann Congal
Smile ECS


--_000_PH0PR11MB59523693866FD2C33C8F61EDAD432PH0PR11MB5952namp_
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
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
The corresponding backport series for blacksail has now been submitted upst=
ream [1].</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
As requested, I have also resubmitted the patch for scarthgap [2]. Could yo=
u please review the updated series?</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
[1] <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?ser=
ies=3D53833" id=3D"OWAea120a23-304c-ec57-f9c1-2dede66ad39c" class=3D"x_OWAA=
utoLink" title=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?=
series=3D53833" data-auth=3D"NotApplicable" data-rich-text-autolink=3D"" da=
ta-linkindex=3D"0" style=3D"margin: 0px;">
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D53833</a>=
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
[2] <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/202=
61125060245.3720245-1-hthakar@cisco.com/" id=3D"OWA44f3d7a7-7ef3-2516-3fd7-=
5752973129b2" class=3D"OWAAutoLink">
[scarthgap] openssh: fix CVE-2026-106587 - Patchwork</a></div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Hetvi</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal via open=
embedded-core &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> 21 November 2026 04:35<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;op=
enembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 1/1] openssh: fix CVE-2026-1=
06587</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri Oct 16, 2026 at 5:54 AM CEST, Hetvi Thakar =
-X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.=
org wrote:<br>
&gt; From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix as referenced in [2],<br>
&gt; using the commit shown in [1]..<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/openssh/openssh-portable/commit/526f=
d2771342f36142099bec82c49ce0457c5016">
https://github.com/openssh/openssh-portable/commit/526fd2771342f36142099bec=
82c49ce0457c5016</a><br>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-106587">https=
://nvd.nist.gov/vuln/detail/CVE-2026-106587</a><br>
&gt;<br>
&gt; Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../openssh/openssh/CVE-2026-106587.patch&nbsp;&nbsp;&nbsp;&nbsp=
; | 76 +++++++++++++++++++<br>
&gt;&nbsp; .../openssh/openssh_9.6p1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
1 +<br>
&gt;&nbsp; 2 files changed, 77 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE=
-2026-106587.patch<br>
<br>
Hello,<br>
<br>
This patch is blocked pending a blacksail backport:<br>
See equivalent wrynose thread from Mon, 09 Nov 2026:<br>
<a href=3D"https://lore.kernel.org/all/DMQR3DP72ES8.3KANJDXOTSO63@smile.fr/=
">https://lore.kernel.org/all/DMQR3DP72ES8.3KANJDXOTSO63@smile.fr/</a><br>
I will now drop this patch. Please send a new submission if the above<br>
situation changes.<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB59523693866FD2C33C8F61EDAD432PH0PR11MB5952namp_--
