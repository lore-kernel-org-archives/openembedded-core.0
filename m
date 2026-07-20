Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852F2C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 11:34:58 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6881.1784547290937959007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 04:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SkGgbVOn;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9651; q=dns/txt;
  s=iport01; t=1784547290; x=1785756890;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=Ss7wOK9HGfsGRiuDnrj+nzhYdX2MyNvjfdiqpf6VPto=;
  b=SkGgbVOnhmmfelP8cN+fY0E9OcfxhvXivc/CLwMjOeGca95DxtYIeX52
   dsaUPzVAwROL1em3dg54fJ66H2FhlUiaAig1TITGzySDos3P3yUqedEw3
   VbbxV9rzXKnd1Bpt7qDTFjivZapouH1DqkBocww2WHQEaEnPWnOBEyOME
   QIlyMFCpbk54h8Piu/KSJwzxESGHSLKJdu6QmZX8oYrpN7fr15gLFkziG
   NiXhAAtQWaZRq8bmpF/b/twXkrD/Q5m4mN59xFMXoA/9luoV1nWFCRXg8
   9/3ZGMdohO2usqKVyDxfMMamCkjk4vk2UDymn/8HyoCWwKCC+zoeA6SiK
   w==;
X-CSE-ConnectionGUID: W71P2BtjRrWEn8SoS8XxcA==
X-CSE-MsgGUID: cXxPtR7ER0S9hmg+JeEB/A==
X-IPAS-Result: =?us-ascii?q?A0B0AwD5Bl5q/5H/Ja1agS6BK4E9MVOBCAKBIUkDiCADh?=
 =?us-ascii?q?SuGWIIhA5dEhlcUgWAKDwEBAQ0BAS4BGwcEAQGFBQKNUwImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBEXcCAQgRBAEBA?=
 =?us-ascii?q?RUZJwodCAIEAQkJCBqCYYIdFkEDAQIOBrEDAYE9AooqeIE0gQGDWgUJAgJAA?=
 =?us-ascii?q?dwKFYE4hT+DARsBAQUlSWyCXYEiGAGEfCcbG4FygRVCgmk+gQWBXAECAQGBF?=
 =?us-ascii?q?hIBCwcBIz2DVoIwBIIiehIbg1qBYYwQUnIiAyYzLAFVExcLBwWBIxAzAyAKL?=
 =?us-ascii?q?y0CFA0iDxoFLR1wDCcSDx0XFh5YGwcFEiAqQUUjAxQ7PzgLQwWBVwKCBU4jH?=
 =?us-ascii?q?wM5f4EvdUp3LWoCEBdKOCSCEgKBOwIHAwttPTcGDhkDBIE1BYxQB1sjgyBRB?=
 =?us-ascii?q?gIES4EdGA8fk0ePQYF8jGSTZIEzCiiDdYp7gSaNPogyF4VbpRGZCCONZ5Vgh?=
 =?us-ascii?q?S4CBAIEBQIQAQEGgWg8aT8fCgEHcBWDIgkKDDQZD5QigxSBLcN/eQIBAwotA?=
 =?us-ascii?q?QEHAgcOAwuBaJAAgX4BAQ?=
IronPort-PHdr: A9a23:chJlkh3Uz1ktGfaSsmDPmlBlVkEcU/3cJAUZ7N8gk71RN/jl9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:NZl0l6x2UG77cxvaHxt6t+dsxyrEfRIJ4+MujC+fZmUNrF6WrkVTy
 jcWDW/VafzfN2b2fIonbNyw9BwD68TQz9NjGlRsrFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraDpMtspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJH5pZLVC0Pp1O3tx2
 PpIEzc2PiCTjMvjldpXSsE07igiBNPgMIVavjRryivUSK52B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPnWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCxYYqJK4bXHps9ckCwr
 VLWx3jDXTwgbOfOyT+KsVChq8WItHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9dAfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:XsCrnarabgTySCDHrvXF+VgaV5siLNV00zEX/kB9WHVpm5Oj5q
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
X-Talos-CUID: 9a23:/Dc1Y2MNyGDbbu5DZ3Y+zBQ+BsIfaELwyifrJHToOXZiYejA
X-Talos-MUID: 9a23:BWRPjwv+f+1YTXLYic2njwFyDNtSvImUUHtckZAJ+OuJGAY3EmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:34:50 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id D00AF18000475
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:34:49 +0000 (GMT)
X-CSE-ConnectionGUID: mjxmmCReTXKVrQD+yicQuQ==
X-CSE-MsgGUID: GHvyIRz/ShW4qDAJ6tNCHw==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208,217";a="88771519"
Received: from mail-southcentralusazon11013046.outbound.protection.outlook.com (HELO SA9PR02CU001.outbound.protection.outlook.com) ([40.93.196.46])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:34:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgr88nLoZ2rJnAPHVscrq0TYF+EDhng7l/pwSsI1iBdKneKcpW5qICwSR5eqIyklDz+heFM4lH2AJ8oG/RIeMNqLqHG1XRF03H31noRf1dchNNmG5uocEodJ8IBurDLfTQogAr9VyU6VAWdFm109oAyBhAdki6cGU/BmMSG749AdwuYXzir9rArk7Lcf163d16ZxYiugHP6SFqEM4cfg0p4+1i1DYx6exsPweQB6p3z1R0ImXR0Wd7rpv8fpKdCAa+R6dboQL2wSO9cXT5rzdDbX2QcpASd6h1bbswHZqMcKLrnlkB9ADRKy/6L1xK4YtDODxrqtqdx+1loXP9Dm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ss7wOK9HGfsGRiuDnrj+nzhYdX2MyNvjfdiqpf6VPto=;
 b=ExNN9bm4g1yBdHTlTHwkbIT1XS5srZylsU7B0nexAclwbCzKx+l7fALWP4rxVTCgjabdNHVGpKWSasVZ8TgZGh9/HNMA6xINTSPKxB2o+5GKqupt3E42jd0zYqZWCueOVT6RvYzjEy5Moxky4EYyTj9yomJtseDcVmrH4OsA+yshc77kVjRNU4JVdt0obYfXSLrpl/Tdf5VAO8TIzIzUlC2+8QKswJMQulo0mWV6er5BptglgPXfuH+4EGr4ZrY+yIsKIOt0tVgBGYp0n+ymfNIK/iVsnPjNHyUuC0g4M1aeDfq1j3BEs9SnfbT2ZwQvWyph7RcpNihmN/JToVPgqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 SA1PR11MB8857.namprd11.prod.outlook.com (2603:10b6:806:46b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.27; Mon, 20 Jul
 2026 11:34:47 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 11:34:47 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/5] curl: ignore CVE-2026-4873
Thread-Topic: [OE-core][wrynose][PATCH 1/5] curl: ignore CVE-2026-4873
Thread-Index: AQHdGDlVuafNe+U6oEi+W1QwkXk4PbZ2Rpj/
Date: Mon, 20 Jul 2026 11:34:47 +0000
Message-ID: 
 <DM4PR11MB61893CF41B1EA33238B839A6C4C32@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260720105647.2451180-1-deeratho@cisco.com>
 <DK3CUBQXME2E.3GE5VN0QYZB4J@smile.fr>
In-Reply-To: <DK3CUBQXME2E.3GE5VN0QYZB4J@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|SA1PR11MB8857:EE_
x-ms-office365-filtering-correlation-id: e62a94bd-d08e-41ec-d3f6-08dee652e74d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|4143699003|3023799007|8096899003|13003099007|38070700021|10067099003|56012099006|11063799006|6133799003;
x-microsoft-antispam-message-info: 
 5lwqzuVNvgYP0m4oD5Qbfp6AstdFsr+e3bXB7H31JKpHyK+No1IDHO0AhwjRUBhwUvpckMttWYIweLno/tHMGM38a4j9yX+gBi1FeCBHwRQzFnUaNMt5TWePwikAr3RdQbbOOswE/G7jiRZ9Em3UbRVUitS4DKzta1mSTkyyUQJYSmTu6/LMKKgDw3Hn31J8QbzXiV1gDcBR615DxIho3l6o/kej/7xlvifCUXS1be3ynbLUiDvBJfiQu0oHBvo+Hu9GcULJ+COGatgwMbg7Pn5PjRjlQBWfUKNKfyneQqh55DJTkYY6D7UsZtFzN/n8OVg4gpoXCSPexsi4fWG5GUUhN29TvqxqFf7Esa/PP9Cu3vNahKwMoaA9iklk5mr8gpHWYEXYNXqcHPTOatCIpkkhlLM+9GeMZz5BAhnqz9skzxIsmiNaIca64MGg6jrzO9rXHAlLcxNv60r8gcCHXsTYe5/tkcxy4vBkAdae6LBAAzhb9lt9vQxJY6xjMHeGZkJNnVA+4xzasyAn8gjXrL+7jlhSx3CzCWg/wGgDJKUGUpBWjKmMY6LBhlwaOQ6YxJ0yb+GDrqNo6VzEX6SZpYEYrJxbVWRW7KbBITXEjbUAWpKSdnYWhRslhj8X4fQrh+2zrV3bbqBkwam9TK4cLI8v2FyjQ6nnZ6SAASTwiDA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(3023799007)(8096899003)(13003099007)(38070700021)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?EtZC6dBfVWZ0FwWvGO8Sl+sXRYhkOzHEcA/nfPc24GRAnsOd6nMruMq1Je?=
 =?iso-8859-1?Q?GL2KQJZSFJJ1wGrx34s0B//aabTFkyYxvEexkRFUeI1E6S/zzdhXblQFu5?=
 =?iso-8859-1?Q?70WfdrjtiL6B8VVNiDpsYxYlHR7IZ1YiroKzF9CudqrsdcwtBdIF6mmxDA?=
 =?iso-8859-1?Q?2e3egKQjib7rB4Tt895kuL5H1FK2whbzt8ROmEUAzhQJkUk84F927NYmAI?=
 =?iso-8859-1?Q?07l2vHDA0LozKvaVpKelV9Nq+y2CZ4qyAJRM86qtx8z15Dv5MSEku1tTkU?=
 =?iso-8859-1?Q?MwhXxaI6n1cJW0e/t4lkSjLNEkM7avNldp46lQJJtNSFj9dXCwaUYGVisf?=
 =?iso-8859-1?Q?pgCZxdz3uBcU9/Rdt/yVgrle4AtDEarkeyxuGY26XQF93AhdUDyiQrQ/Dc?=
 =?iso-8859-1?Q?mfZCizAEcsTMCnBNRE6qvfsiuOkIK0EwoTKfcAefiaSZAfdjUbI22i1v8L?=
 =?iso-8859-1?Q?+6AGtmQlRxHbMQxyuJS/VmLvF0M9wJ6Y+ZgRLCzEhVTAi2aubIwzPyMkrx?=
 =?iso-8859-1?Q?7AxSR3HLlb0t1FXc6SupfofepRxixJ+1lzBa9+bnNV6qepN/IBxt8OIw3J?=
 =?iso-8859-1?Q?Hgv6S+MRJhHxGEdo8heNOBxPRyU+MGCTG0u90BlYE4vwwau+0CGATuHXku?=
 =?iso-8859-1?Q?3/PAdRIL+Ob3uDr0dxNsv1a8xbxQug8E3LGt6MDOQBFLC4bBOjF8uLPuh/?=
 =?iso-8859-1?Q?QrTvxP92MYdo7Sior+y8JiiZa/zGd2trynPDo0fFfGZeAIgx8//t25eDBG?=
 =?iso-8859-1?Q?Ocvxki7+zmRVmz/HHCzUKklbKyhnQBegCChNJq1agDkvjnyQ1DM7wvf6U2?=
 =?iso-8859-1?Q?YEn+iusMOtR914ns478CSQAZyFMVS874pzVx+v9KuN8KGmRrCwxZ9iShz8?=
 =?iso-8859-1?Q?seZGJ9vCtSa5k5PrTXZjohgiXU0YdI015L2IWFDwJPNffrV1y4vC4LQYMR?=
 =?iso-8859-1?Q?o2mF0xvTj4u2BKGHpXBJ0itxErnDbNu+Hh8w/ff6cW+ggliK5+zWIAeArw?=
 =?iso-8859-1?Q?sAg6j2ZVDX9gL6W7+JXt5xlKu37gzh7VhOqAJ7u5DjlbMqPbYqlZ/Q7mKU?=
 =?iso-8859-1?Q?EX9N749TuSJs0ko/4BsV630PVIc2wznd84lryqx7aVAeT+Dglrmt8kxusk?=
 =?iso-8859-1?Q?lbMJlpXOnU5rDQc6KLhix7YLa+zq5lvPNMdJMp2aWb8IDJBb6Xrhulfraq?=
 =?iso-8859-1?Q?t0yEma1bUPCBifUScuWWNSZNV8GH2MO8fXLyLPpK60L27CVZCoUJAHHVl1?=
 =?iso-8859-1?Q?Zpw217rzkAmnY9hYc0nLbl9Y/VE1pp41tVXyinDiwim+k8nC6/Croo3/KD?=
 =?iso-8859-1?Q?tZXxCGT8mOTZUHFfoAKk77kxETOKqnBLVidUJWzxIs32dEYYJScivrYqYS?=
 =?iso-8859-1?Q?3oISXKKwVfurc96vKMIiL5/NK/CbwEl1wV+T860VSaSlXaQRwYlbs7fOVa?=
 =?iso-8859-1?Q?b71z7UDTEAnIWWNVJaH+s3xAk9d87QJAO0YIGAKQa+vRhsfAWAKygxCwEP?=
 =?iso-8859-1?Q?mtYEO6xVOtkufG/U7DnBptdSMb9V0S+xJt5UH+dhdDNxinTcO4YUwcliWZ?=
 =?iso-8859-1?Q?Cdysf7/G6n14hl5NE+EvtXTG8kBvpeR5X1FQQ4HegU2msBvZatgvbySZ10?=
 =?iso-8859-1?Q?TVbj34WYmWsWdtUnpEhnBiEadoph6HMo/NFDoFcZtFifq3JvTKccXzrw+J?=
 =?iso-8859-1?Q?/GFmyUvik6+8sLVubLZhH9+6My143Ypb7ct3AZXkGdkjBF2H70uRqVNqOP?=
 =?iso-8859-1?Q?dpZi0j+TfB7P9LuVphPKEVuqb0XTK6FhPSul4d2p33aB+E?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB61893CF41B1EA33238B839A6C4C32DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	noreKNE03hD6VqE/ahAOwUlyKmeCb9mEBGrbq6uuCwodU/HyaYXszGwLJmAux4t+EliPqlKxsxAsjVppuxaS/XOvRaQZX6QcXvwfA4zVpKw1pzr11y7mV00KLK29UJ4YlpjIrv3EQegm6RGkhA/4Z6pSSY5pB6yqn6ZZIf60nAXh3WytFTAoTPapxzIXtrR60bSqoCe4lMDg4xygU4Ef+q1+MbJ8fJIqr3kLmtwRyGesNNm8XyJaUYwWiquKcv95BNOYjdAfJk91JUirkwWtu86fqNGsmIPgANlj4YlgpWX37rLAIldRFMENx4QsBpBtviw6mbGs23RoKGc7se8Ibw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62a94bd-d08e-41ec-d3f6-08dee652e74d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 11:34:47.5432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PW37+okv7xVX1OmFhC+btFeSVHa7qhufsY60N9W4qoJMaJV0O5oaQBIMYNWmp5wTK1X2fM9lWW5t5TDOWBkDvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8857
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-4.cisco.com [72.163.7.165];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241369

--_000_DM4PR11MB61893CF41B1EA33238B839A6C4C32DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I have sent the v2 of this curl patch series as below:

  1.
https://lists.openembedded.org/g/openembedded-core/topic/120357095
  2.
https://lists.openembedded.org/g/openembedded-core/topic/120357098
  3.
https://lists.openembedded.org/g/openembedded-core/topic/120357102
  4.
https://lists.openembedded.org/g/openembedded-core/topic/120357099
  5.
https://lists.openembedded.org/g/openembedded-core/topic/120357100

Thanks for your review.

Regards,
Deepak

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Monday, July 20, 2026 4:47 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 1/5] curl: ignore CVE-2026-4873

On Mon Jul 20, 2026 at 12:56 PM CEST, Deepak Rathore via lists.openembedded=
.org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> - CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated w=
ith
>   clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
>   transfer.
> - In wrynose, these protocols are optional PACKAGECONFIG entries and are =
not
>   enabled by default in curl_8.19.0.bb, so record this CVE as configurati=
on-not-applicable
>   for the default recipe configuration.
>
> Reference:
> - https://curl.se/docs/CVE-2026-4873.html
> - https://nvd.nist.gov/vuln/detail/CVE-2026-4873
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>

Hello,

All that series should be tagged v2 with a changelog where appropriate:
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#tak=
ing-patch-review-into-account

Can you resend it with the v2 tag? You can use -v2 if you use git-send-emai=
l.

Adding these tags/changelog helps me a lot when tracking patch status.

Thanks!
--
Yoann Congal
Smile ECS


--_000_DM4PR11MB61893CF41B1EA33238B839A6C4C32DM4PR11MB6189namp_
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
I have sent the v2 of this curl patch series as below:</div>
<ol start=3D"1" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:f=
alse,&quot;orderedStyleType&quot;:1}" style=3D"margin-top: 0px; margin-bott=
om: 0px; list-style-type: decimal;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); margin=
-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation"><a href=3D"https://list=
s.openembedded.org/g/openembedded-core/topic/120357095" id=3D"OWA2a8293f2-f=
ad1-ebd7-bda4-1ea052314ee7" class=3D"OWAAutoLink">https://lists.openembedde=
d.org/g/openembedded-core/topic/120357095</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/topic/120357098">https://lists.openembedded.org/g/openembedde=
d-core/topic/120357098</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/topic/120357102">https://lists.openembedded.org/g/openembedde=
d-core/topic/120357102</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/topic/120357099">https://lists.openembedded.org/g/openembedde=
d-core/topic/120357099</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/topic/120357100">https://lists.openembedded.org/g/openembedde=
d-core/topic/120357100</a></div>
</li></ol>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks for your review.</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Deepak</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembedde=
d.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, July 20, 2026 4:47 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 1/5] curl: ignore CVE-2026-487=
3</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Mon Jul 20, 2026 at 12:56 PM CEST, Deepa=
k Rathore via lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; - CVE-2026-4873 affects curl before 8.20.0 when a connection negotiate=
d with<br>
&gt;&nbsp;&nbsp; clear-text IMAP, POP3, or SMTP can later be reused for a T=
LS-required<br>
&gt;&nbsp;&nbsp; transfer.<br>
&gt; - In wrynose, these protocols are optional PACKAGECONFIG entries and a=
re not<br>
&gt;&nbsp;&nbsp; enabled by default in curl_8.19.0.bb, so record this CVE a=
s configuration-not-applicable<br>
&gt;&nbsp;&nbsp; for the default recipe configuration.<br>
&gt;<br>
&gt; Reference:<br>
&gt; - <a href=3D"https://curl.se/docs/CVE-2026-4873.html" id=3D"OWAe9234aa=
a-4308-7eef-7bd6-9d8b181ca00b" class=3D"OWAAutoLink" data-auth=3D"NotApplic=
able">
https://curl.se/docs/CVE-2026-4873.html</a><br>
&gt; - <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-4873" id=3D"OWA=
7519baa2-e28d-8207-644d-7151fbb54c3f" class=3D"OWAAutoLink" data-auth=3D"No=
tApplicable">
https://nvd.nist.gov/vuln/detail/CVE-2026-4873</a><br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
<br>
Hello,<br>
<br>
All that series should be tagged v2 with a changelog where appropriate:<br>
<a href=3D"https://docs.yoctoproject.org/dev/contributor-guide/submit-chang=
es.html#taking-patch-review-into-account" id=3D"OWAbf9179a3-b761-1d5c-ac57-=
51c64a5e292c" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://doc=
s.yoctoproject.org/dev/contributor-guide/submit-changes.html#taking-patch-r=
eview-into-account</a><br>
<br>
Can you resend it with the v2 tag? You can use -v2 if you use git-send-emai=
l.<br>
<br>
Adding these tags/changelog helps me a lot when tracking patch status.<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_DM4PR11MB61893CF41B1EA33238B839A6C4C32DM4PR11MB6189namp_--

