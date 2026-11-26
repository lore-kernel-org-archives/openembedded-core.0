Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10068.1795681343845373621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 00:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=k2HzYpgU;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=25038; q=dns/txt;
  s=iport01; t=1795681343; x=1796890943;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=cELBXREnepttUlltNYjNiX9OLbMSkm1OYoKpAyiO0V0=;
  b=k2HzYpgUOgLnwY59t/YLCLhbBjyvepTCGndkhfu3YvZkPfwgW9Lx1kc8
   s3Inn/HiENOGyBlIPAzN4FOxjJAJOyIhD6TQIUJq9fUqZ7Yi75/f1zZOi
   IIQl5PonXvr79+Tr9A1/GIYvpvuXb8s9tkDv6UfgtI1hz5l1DLi7eY7gb
   pUoNfPRxpqKngJeSGuV5Dd3Z3Hixexss5Tv6mUXNVKTudEDvFBAS3UZw9
   QQTHcLHNwEC1lbft8JdtiVSyNSLhhPtKsAqhDQ0x3OYNpCWC0MvXGBz3I
   eIhGYDGuT97P0x2+tpEgHluockHYTNMtwvOd4CBr0Clf0VdqaSzDyyxXm
   A==;
X-CSE-ConnectionGUID: dBZb9CwqQ/OJ1+kqfStxkg==
X-CSE-MsgGUID: soAeDKAyRRyyENN5rrCRqA==
X-IPAS-Result: =?us-ascii?q?A0AcAABa6wdr/4r/Ja1aHAEBAQEBAQcBARIBAQQEAQFlg?=
 =?us-ascii?q?RcHAQELAYE8MVMWdYEREkmIIwOETF+IegOeKYF+DwEBAQ0CLgEVDQQBAYQ/R?=
 =?us-ascii?q?gKOIwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QE?=
 =?us-ascii?q?gEBAQEDAREVJAEtEAIBCBEDAQEBLycKHQgCBAEJBAUIARmCYYIdVwMBAg6sd?=
 =?us-ascii?q?nMCih14gQEzgQGCZkMBMQYIAkPcAwELFAGBOAGFBzqDHwEBK4E1gl6BIxgBG?=
 =?us-ascii?q?4NoeycbG4FygRVCghdTPoEFgVwBAQKBYB4eg1iCMASCInoSG4E5HmSMEQEBg?=
 =?us-ascii?q?UmIXFJyIgMmMywBVRMXCwcFgSUQMwMgCi8tAhQNIg8aBS0dcAwnEikXER5YG?=
 =?us-ascii?q?wYFEiAqQEMwK4ESgQNdgSsoXQECH0YtFYF1AoJRgSNdAgFJQQ4HRVMJJT4FE?=
 =?us-ascii?q?kckIggSCQETGiwKgRo1PAkmPxUMWwwLGgUaRwgCCwIMdCgREBMdHCQvBRkmP?=
 =?us-ascii?q?BsKgQwnHR4ZDgIpBhYhC0NtPTcGDxkDBIE1BZMwYoMdgQ4BKgGBBUA/Ixaif?=
 =?us-ascii?q?EeBNaF9CiiDeYwkjT6IMheEBI0UmVsLmH0jjWebEAIEAgQFAhEBAQaBaDxGg?=
 =?us-ascii?q?QELB3AVgyIJShkPjisDFoNggX+DFMkneQIBCDIBAQcCBw4DC4FokX4BAQ?=
IronPort-PHdr: A9a23:fx2ALRVOiy6lfqpwgGH0kANfpRvV8K3PAWYlg6HPw5pUeailupP6M
 1OaubNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:p+j8ZKg9TSVr4p416hayHAnAX161OxEKZh0ujC45NGQN5FlHY01je
 htvCj+HO/bea2rwfN9+adnk/UtUsJHcmNNmSQRr+XgxEnljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUU0NR9UEpR7
 MVfDxJULROaidmq0LG0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQd/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9J4HTH5sKxRvGz
 o7A13/+Kxw2F/WO8wCU41+KoLLVhwjBQatHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmcHY909v8hwTjsvv
 rOUo+7U6fVUmOT9YVqW96yfqnW5Pi19EIPITXZsodctizU7nLwOsw==
IronPort-HdrOrdr: A9a23:amP6u61ExGSoKajPZCmq/gqjBY9xeYIsimQD101hICG9Lfbo9P
 xGzc566farslcssSkb6K690cm7LU819fZOkO8s1MSZLXjbUQqTXc5fBOTZskfd8kHFh4pgPO
 JbAtdD4b7LfBZHZKTBkXSF+r8bqbHtntHL9ILjJjVWPH1Xgspbnn5E43OgYzZLrX59dOIE/f
 Snl616jgvlU046Ku68AX4IVfXCodrkqLLKCCRtOzcXrCO1oXeN8rDVLzi0ty1ybxp/hZsy+2
 nMlAL0op6kr+y6zRHk0WrS5YR9mdfqyNdPbfb8y/T9LA+Cti+YIKBaH5GStjE8p++irHwwls
 PXnhsmN8Nvr1vMY2Ccu3LWqkrd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vet7zL
 lA0wuixthq5FL77WHADurzJlZXf3mP0DwfeCko/iViuL4lGftsREokjRto+dk7bXnHAcscYZ
 lT5YnnlYVrmBWhHjDkl1gq5sCwVXIuGRrDaE0DtsuJlwVyphlCvhElLAh1pAZdyHr7IKM0ut
 jsI+BmkqpDQdQRar84DOAdQdGvAmiIWh7UNnmOSG6XXp3vFki946If2o9Fr92CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlO/grWSGuwUDzxwoUGjqIJ9oHUVf7uK2mOWVoum8yvr7EWBdDaQe
 +6PNZTD+X4JWXjFI5V10n1WoVUK3MZTMoJ0+xLFm6ms4bOMMnnp+bbePHcKP7kFislQHr2Bj
 8ZUD36NKx7nwmWs7/D8W7ssl/WCzvCFMhLYd3n1vlWzJJILYFFuBUUj1Oij/v7WwGqmpZGCH
 dDHA==
X-Talos-CUID: =?us-ascii?q?9a23=3Aibrm+Wl+9gZFw+6IWfTtfbWpKbLXOXH3/n2BCFC?=
 =?us-ascii?q?hMCFOauTWSkaew790kMU7zg=3D=3D?=
X-Talos-MUID: 9a23:rAZmwAuPIUwxiCzGnM2nnzZLOetLyrWUMlEcvLMg5tOeHhZpEmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Nov 2026 08:22:22 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id A3E8D180001D2
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:22:22 +0000 (GMT)
X-CSE-ConnectionGUID: bU0ZkMaBTf6nvF1PqsTTdA==
X-CSE-MsgGUID: uuIwuXmnRS+QIJ7+QPR2uw==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,234,1787011200"; 
   d="scan'208,217";a="100444653"
Received: from mail-southcentralusazon11012047.outbound.protection.outlook.com (HELO SN4PR2101CU001.outbound.protection.outlook.com) ([40.93.195.47])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Nov 2026 08:22:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbP0OkPRfhObPvOfDYBGrXtKn74cutlXptjid1jWKGt9RMxchwV1FZJ9tJzEF/bVkg0B/QHrIGQhs4L0USiisMgc0TfUGcvgyeoOEYTS3RZ9sEC9TX2J8ziUzKWOdJkkIPHfGiw9pEcm8SIivUTa3zKT36MsEXXC6qydA9qzfTpcmz4g812QfcjBXtFNCDQsLRGHjREpbavxdEXT4LkRltpHcXyX0hr88ruvtXQrHF8otQiR++x5gvhBWbuRZvkV6wsGTZn0oDi3dWF+T/Xs1CIhIfhXaPBW2EI5yTqE6JSzc2gvChwRmY52ZciZe8iRJdn6PXjFZhng/hWdKF0aKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cELBXREnepttUlltNYjNiX9OLbMSkm1OYoKpAyiO0V0=;
 b=R3YTZ1VCgvlE+SwPwDDR/JEBMop+W5ueWyQ1L8PS9sElO27TkW5ipC7rv+AgS8Oz/5E7ZtnN+C4fPV2mUcWpJ+CfKzHKZD0NgcZZcVv79VGExJUjZwQOJnnTzpyaPoFH/LObs85Y4yUrJgIPUx3dc6rbWFTvwSWCCyUUpHlkTPBBAxcSlI3iBd3xWrkGeQvpiAtdJ2gkE1Y9JutQ+2YjWUTJsERVZYvKiyfag83y1F4UDedmVGMaMz6Rh1Y/gZMsF09qcKpiKaNQfrOAc//1Js2GYfqsgDA1NMVW9UipnK9EoCR3TtGWXKznUPhl/Db62UhrPPcsC+RkeiIPJyYMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 by DS0PPFC7FC39169.namprd11.prod.outlook.com (2603:10b6:f:fc02::50c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 08:22:20 +0000
Received: from PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340]) by PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340%6]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 08:22:20 +0000
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<devanshp@cisco.com>
To: "joaomarcos.costa@bootlin.com" <joaomarcos.costa@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	"yoann.congal@smile.fr" <yoann.congal@smile.fr>
Subject: RE: [OE-core] [scarthgap][PATCH v2 2/3] sqlite3: fix CVE-2026-119374
Thread-Topic: [OE-core] [scarthgap][PATCH v2 2/3] sqlite3: fix CVE-2026-119374
Thread-Index: AQHdfO0YlHxXEsdk1EKW2GWCFewvy7dAA93j
Date: Thu, 26 Nov 2026 08:22:18 +0000
Message-ID: <PH0PR11MB76168073E822F62E03F0484AD3422@PH0PR11MB7616.namprd11.prod.outlook.com>
References: <20261125145239.4173659-1-joaomarcos.costa@bootlin.com>
 <20261125145239.4173659-3-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261125145239.4173659-3-joaomarcos.costa@bootlin.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7616:EE_|DS0PPFC7FC39169:EE_
x-ms-office365-filtering-correlation-id: f3510168-0b10-4fcc-1b39-08df4b96641f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|4143699003|6133799003|12006099003|261009223327099003|261009221227099003|261009223027099003|261009221727099003|261009220027099003|22082099003|18002099003|13003099007|8096899003|260925021311599003|260925021911599003|260925022911599003|10067099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|38070700021;
x-microsoft-antispam-message-info: aUh+f58UUxXu5wk4yoRoGc6dj8itNvrPIhDJ45jOvsYWv8Qgh+cIHYq6CBVrpHGEfhwbsSQPBD89Womotbnee1CTiiKtuyeVQAbCqE9JoNJshNHwQo7yXewhF74Mob6CxQcAOExpEUf18kWUBOAqtEldmIl8oN11y0aDXqdhOqovRopLJ7MfDmTJhIwP/Dinp0puds+7wbIr3bzl9FEix7/6VFpoyFD/g2QWVmwk7H1GFqgmV5vMq8g40Jacyiy+f/m/3qNQOfYxfVUXhjRM3G2B7+Nvpd4XTGL0BevFz4AFoxmAr+7Upjtl4APMf68C3fsK+0RaLRTGCASVp+gxD3Bq11Tllftr2FDJ1dABhI+ec2ACCSgxn9QydKPOwTQB1j6GOM7zowjWmRHWgDzWi8FVL58ZboWbg0sPTBcoknh8yvAYwiOd5NEVTsSjX2FNf47y7O8r6qdCO4is5vjjX+qNSuATT9/eNW9UAeXxBUMDaEtkn6jRMvEbq77rILkMf0QFm6tla5WmKgj+NFdAkreRaaYL0zlPZb8TzO5kGyDQqIuanQSe3qLbyeSMGSNFsBdly90rhsWTvyGFbW5kCOEECd/MkMyCEeSLQbuwtTIdLbwTBAEO+GAXRu4vNe65m197qW+LgPYxX1FoJidn4KYcP7wmx6/BBvymb+KkBfA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7616.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(6133799003)(12006099003)(261009223327099003)(261009221227099003)(261009223027099003)(261009221727099003)(261009220027099003)(22082099003)(18002099003)(13003099007)(8096899003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5ikZtR1MppbXVTFsT4a1ZhSXi/vzsFyuvz0NqpslimEKf5Q8eA6RgI6hb2?=
 =?iso-8859-1?Q?SCal/jN98ARVRKJ5WxqaepZzxpPCPFMd8uW9jf3RbuoVIr8+9LzsHYx/5w?=
 =?iso-8859-1?Q?kyWpvER1L7Sfg2fjdmGk+7szbTfGr5itoa0M83Ku2HHBFPVZ5qF3C5hOwA?=
 =?iso-8859-1?Q?fnOKQ5xVWTkR655SQWIWN5p8ftZuSoOle/q6Ji9IJuxpQuaj8nlFz1Xe27?=
 =?iso-8859-1?Q?JfzDLH3d2ncBDsI71e8dXSGrGzeN68qzj+djP+3z9UDBAYH0bltUobTswe?=
 =?iso-8859-1?Q?N40UWXkABSoLw7Q6NVICjTg6yJOL+GKO9j5Mv1uZgIpcUYktRorh8CH9x+?=
 =?iso-8859-1?Q?eiDEudjTpkNW0KeCuVipu8Id18efSYlG6QOJ4Oh8dLAmZe+SrThndthVM4?=
 =?iso-8859-1?Q?Y03RY1mnJOu5CNVpRXP1HirBO3m8dKAWaUkywlcM8sxhgEhzNcw0P9rKTI?=
 =?iso-8859-1?Q?P//4g4Ck7IUnaLBRS4oqKSmZydYPcpSLBKNCbBf1n0EuLt123xzrJy8Y9v?=
 =?iso-8859-1?Q?dvlyPN2x9B6GrTczqopAtLAvHR0OtjPKHK6ck0BNvy7fo5I3EF4aL4hEYh?=
 =?iso-8859-1?Q?MoPMgBXL9XEAoO+F42GKViW1LG7BY2Z+LAI2fudf2notntXR/eoNmElo6e?=
 =?iso-8859-1?Q?ovuk5uP8ck2RwD96hPHxIcn3O4sEolsFtKqg47IIJbrqQDwXe08PZ8CQrq?=
 =?iso-8859-1?Q?KlQa2UuwOAa/pTbj0shfwmC3aLf7llDnk4gHeVJkFJnB1Ec5X+z2oUHLjC?=
 =?iso-8859-1?Q?VhfAbMjbi0pit8SfeB50YzXGH7aU1WePyRo9fEzx45qqqPdJ8925JXGmWp?=
 =?iso-8859-1?Q?05HQe+XLsm2puBkuHx+cNHV9JQIfdI8E7ymOdLC52haY3eabvwlkBkyINJ?=
 =?iso-8859-1?Q?DD6LHdkTk35y3+BArIdevg0RFiHZAD277q2uhJ2qJycSaXvOZ3Gz6bxmik?=
 =?iso-8859-1?Q?cZx72+ln21VsdhrWHV39u4/TH9yvIo0GNM8tbyo9uTbLo8bneFXn3/MjY6?=
 =?iso-8859-1?Q?Zh4uyb3YKMm9jdJ8GT+UNgPMikJVQvYCQtCYU5GXdlLlsdFhk+h9vx4TRF?=
 =?iso-8859-1?Q?GLSnTm4IMUFkvEY8GDj1IP+gwp6IQtrGyAFSDckQBz7UrCKdOFKMHaPkxh?=
 =?iso-8859-1?Q?ixRJDGsA1ijwUIGvgtB+fAWZ/F6YdeUiAfNNHiXO+vZseDJT0srm1HJ/aV?=
 =?iso-8859-1?Q?YjknYLj4ZCvTqIRAKgTKTi0VNYU2ubK5rvCs0KhSZkMU5ZWZU8t9ngj3FQ?=
 =?iso-8859-1?Q?9bgIKchVB3wAo0DwGfZdWPcBJa1eAEO12I8HU6iBescUfJL47TvyIuTo1c?=
 =?iso-8859-1?Q?6d2QEgnpaf3qUH5woAM69ly/OUy7utzBgoJhHNvGiCwKR7VKliV+sX6pkT?=
 =?iso-8859-1?Q?WEwf55wOmiypgASnc5ZiEVrYZs0NXIWioj+MiIkPAuvyD6h2HIESPJBdhU?=
 =?iso-8859-1?Q?JS9V/M1yAyM5Q2hagrd2p+a7ogFHZrOfl2PGu/rQHEIQzLQcrK2Wx9qZ6C?=
 =?iso-8859-1?Q?I4aYy7EqssQ2s4f3GaxWeioOx2EwupNjx5BtHJU2BlfyF1pg1fJZmCloYT?=
 =?iso-8859-1?Q?928ENq1FrniRqi5/x/HY5U0qrcp2kI/8EIrhUXOS3V8dQxxqDKxCOe/TSp?=
 =?iso-8859-1?Q?GwjscoVt0DZfcI4k2WTbneUlH4QOggvlvcbkfXbcatkGNQuSHuOBaguIhv?=
 =?iso-8859-1?Q?+eRxiCk1EiOxvJaza5LUszYHYfDkqCn8iLqU1j2z4WLivWsmuc5u7tzOfb?=
 =?iso-8859-1?Q?LSRL5guwpAdFDlL4aRjoL+alg2iIFI7ZIk9i4MohUprNw4VnWgevixUVGz?=
 =?iso-8859-1?Q?q87CogtveIykmh+oKRdKICVPYiXzrA0=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB76168073E822F62E03F0484AD3422PH0PR11MB7616namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KzzJdxE2O3g7Rqr79444JwmaZVUsW/ML4KbJJWp1gsO39NqhVDz28hcsbJRUoF/ufa89WQBwEG3VChzYE+YEUHKsxO9HZC7okN+Yter7MZ9KaWx2mX0hYVzpqJMJ64fPeH3haIICqc1fIVGzMYHNf37tw8aldsS0yzeGu7Oc+qp3TKOppLW3xxcSs/Sdf6oFG9hTd+Wr5YahVvooSZcNrjoCPrpTtw3E8poNkeS+djuzBnrqyVCcKu9O3w7Gn2dt0pkNqlDOzBWQXDJYg6nMqTAsaG4w1DfirSnD7URX/mcIlI/QqEDESf/rb9VVALYxRukHQL8NhLIh2ytkHsjs4g==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7616.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3510168-0b10-4fcc-1b39-08df4b96641f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 08:22:18.2326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z588XTU16/wIf77JUHUCiJNeSGpZomGlKFgDSq2yKjoTZVFLTs2+dRpoYuAJnoyKEtfY3Zgzt2ssSKmiBryRFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPFC7FC39169
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-4.cisco.com [72.163.7.165];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251286

--_000_PH0PR11MB76168073E822F62E03F0484AD3422PH0PR11MB7616namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jo=E3o and Yoann,

Could you add a Backport Changes: section to the inner CVE-2026-119374.patc=
h header? The upstream fix changes ext/fts5/fts5_index.c, while this backpo=
rt applies it to sqlite3.c. Please also explain why ext/fts5/test/fts5corru=
ptB.test, manifest, and manifest.uuid are omitted.

Thanks,
Devansh
________________________________
From: Joao Marcos Costa via openembedded-core <joaomarcos.costa=3Dbootlin.c=
om@lists.openembedded.org>
Sent: Wednesday, 25 November 2026 14:52:38
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: thomas.petazzoni@bootlin.com <thomas.petazzoni@bootlin.com>; yoann.cong=
al@smile.fr <yoann.congal@smile.fr>; Jo=E3o Marcos Costa (Schneider Electri=
c) <joaomarcos.costa@bootlin.com>
Subject: [OE-core] [scarthgap][PATCH v2 2/3] sqlite3: fix CVE-2026-119374

This vulnerability, marked as High [1], was fixed upstream [2] since
3.54.0.

Backport the fix to sqlite v3.45.3.

Some function/macro definitions are required to compile the backported
code, and they are provided in the *-pre*.patch files.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-119374
[2] https://github.com/sqlite/sqlite/commit/d9de6eedbe918c074c7556400fa21df=
5960704d9

Signed-off-by: Jo=E3o Marcos Costa (Schneider Electric) <joaomarcos.costa@b=
ootlin.com>
---
 .../sqlite/sqlite3/CVE-2026-119374-pre1.patch | 48 +++++++++++++
 .../sqlite/sqlite3/CVE-2026-119374-pre2.patch | 63 +++++++++++++++++
 .../sqlite/sqlite3/CVE-2026-119374.patch      | 67 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  3 +
 4 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre=
1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre=
2.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.pat=
ch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre1.patch=
 b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre1.patch
new file mode 100644
index 0000000000..9392163008
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre1.patch
@@ -0,0 +1,48 @@
+From f9e6373f9cbd1d10d01441a03def5fa08b4202d1 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.costa=
@bootlin.com>
+Date: Wed, 25 Nov 2026 14:49:35 +0100
+Subject: [PATCH] sqlite3.c: add sqlite3Fts5ConfigErrmsg helper
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This function was introduced at [1], and it is required by the backport pa=
tch for CVE-2026-119374.
+
+Please note this is a partial backport, whose sole purpose is to include
+sqlite3Fts5ConfigErrmsg()'s definition.
+
+[1] https://github.com/sqlite/sqlite/commit/2ec78c0e4bab11ce288a830c3a13fe=
34a9224c4a
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/2ec78c0=
e4bab11ce288a830c3a13fe34a9224c4a]
+
+Signed-off-by: Jo=E3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ sqlite3.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 88b1810..1bf28ac 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -239370,6 +239370,21 @@ struct Fts5SegIter {
+   u8 bDel;                        /* True if the delete flag is set */
+ };
+
++void sqlite3Fts5ConfigErrmsg(Fts5Config *pConfig, const char *zFmt, ...){
++  va_list ap;                     /* ... printf arguments */
++  char *zMsg =3D 0;
++
++  va_start(ap, zFmt);
++  zMsg =3D sqlite3_vmprintf(zFmt, ap);
++  if( pConfig->pzErrmsg ){
++    *pConfig->pzErrmsg =3D zMsg;
++  }else{
++    sqlite3_free(zMsg);
++  }
++
++  va_end(ap);
++}
++
+ /*
+ ** Array of tombstone pages. Reference counted.
+ */
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre2.patch=
 b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre2.patch
new file mode 100644
index 0000000000..dec6044002
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre2.patch
@@ -0,0 +1,63 @@
+From 1fec121608ced287baed5feabc646d74c93abec6 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.costa=
@bootlin.com>
+Date: Wed, 25 Nov 2026 14:58:50 +0100
+Subject: [PATCH] sqlite3.c: add fts5IndexCorrupt* helpers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+These macros/functions were introduced at [1], and they are required by th=
e backport patch for CVE-2026-119374.
+
+Please note this is a partial backport, whose sole purpose is to include
+the definitions for FTS5_CORRUPT_ROWID, FTS5_CORRUPT_ITER, and
+FTS5_CORRUPT_IDX.
+
+[1] https://github.com/sqlite/sqlite/commit/fe182f74b28db7db54656a19de9706=
9e1ac69470
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/fe182f7=
4b28db7db54656a19de97069e1ac69470]
+
+Signed-off-by: Jo=E3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ sqlite3.c | 29 +++++++++++++++++++++++++++++
+ 1 file changed, 29 insertions(+)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 1bf28ac..354f416 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -239385,6 +239385,35 @@ void sqlite3Fts5ConfigErrmsg(Fts5Config *pConfi=
g, const char *zFmt, ...){
+   va_end(ap);
+ }
+
++static int fts5IndexCorruptRowid(Fts5Index *pIdx, i64 iRowid){
++  pIdx->rc =3D FTS5_CORRUPT;
++  sqlite3Fts5ConfigErrmsg(pIdx->pConfig,
++      "fts5: corruption found reading blob %lld from table \"%s\"",
++      iRowid, pIdx->pConfig->zName
++  );
++  return SQLITE_CORRUPT_VTAB;
++}
++#define FTS5_CORRUPT_ROWID(pIdx, iRowid) fts5IndexCorruptRowid(pIdx, iRow=
id)
++
++static int fts5IndexCorruptIter(Fts5Index *pIdx, Fts5SegIter *pIter){
++  pIdx->rc =3D FTS5_CORRUPT;
++  sqlite3Fts5ConfigErrmsg(pIdx->pConfig,
++      "fts5: corruption on page %d, segment %d, table \"%s\"",
++      pIter->iLeafPgno, pIter->pSeg->iSegid, pIdx->pConfig->zName
++  );
++  return SQLITE_CORRUPT_VTAB;
++}
++#define FTS5_CORRUPT_ITER(pIdx, pIter) fts5IndexCorruptIter(pIdx, pIter)
++
++static int fts5IndexCorruptIdx(Fts5Index *pIdx){
++  pIdx->rc =3D FTS5_CORRUPT;
++  sqlite3Fts5ConfigErrmsg(pIdx->pConfig,
++      "fts5: corruption in table \"%s\"", pIdx->pConfig->zName
++  );
++  return SQLITE_CORRUPT_VTAB;
++}
++#define FTS5_CORRUPT_IDX(pIdx) fts5IndexCorruptIdx(pIdx)
++
+ /*
+ ** Array of tombstone pages. Reference counted.
+ */
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch b/me=
ta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
new file mode 100644
index 0000000000..34afed81b4
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
@@ -0,0 +1,67 @@
+From 9145df76941bd1de6ad146346269b6fcac762233 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.costa=
@bootlin.com>
+Date: Wed, 4 Nov 2026 17:07:06 +0100
+Subject: [PATCH] Fix a problem in fts5 secure-delete code that could lead =
to a
+ buffer overrun when dealing with a strategically corrupted database. Prob=
lem
+ reported by YEONBA.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+FossilOrigin-Name: 9cd4f9e9205c5a5096388397a39349db9ff5377d19095c6b20388ff=
799969c31
+
+CVE: CVE-2026-119374
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/d9de6ee=
dbe918c074c7556400fa21df5960704d9]
+
+Signed-off-by: Jo=E3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ sqlite3.c | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 354f416..9f4fe9d 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -244286,31 +244286,36 @@ static void fts5DoSecureDelete(
+     const int nMove =3D nPg - iNextOff;     /* Number of bytes to move */
+     int nShift =3D iNextOff - iOff;         /* Distance to move them */
+
++    int nNewPg =3D 0;
+     int iPrevKeyOut =3D 0;
+-    int iKeyIn =3D 0;
++    i64 iKeyIn =3D 0;
+
+     memmove(&aPg[iOff], &aPg[iNextOff], nMove);
+     iPgIdx -=3D nShift;
+-    nPg =3D iPgIdx;
++    nNewPg =3D iPgIdx;
+     fts5PutU16(&aPg[2], iPgIdx);
+
+     for(iIdx=3D0; iIdx<nIdx; /* no-op */){
+       u32 iVal =3D 0;
+       iIdx +=3D fts5GetVarint32(&aIdx[iIdx], iVal);
+       iKeyIn +=3D iVal;
++      if( iKeyIn>nPg ){
++        FTS5_CORRUPT_IDX(p);
++        break;
++      }
+       if( iKeyIn!=3DiDelKeyOff ){
+         int iKeyOut =3D (iKeyIn - (iKeyIn>iOff ? nShift : 0));
+-        nPg +=3D sqlite3Fts5PutVarint(&aPg[nPg], iKeyOut - iPrevKeyOut);
++        nNewPg +=3D sqlite3Fts5PutVarint(&aPg[nNewPg], iKeyOut - iPrevKey=
Out);
+         iPrevKeyOut =3D iKeyOut;
+       }
+     }
+
+-    if( iPgIdx=3D=3DnPg && nIdx>0 && pSeg->iLeafPgno!=3D1 ){
++    if( p->rc=3D=3DSQLITE_OK && iPgIdx=3D=3DnNewPg && nIdx>0 && pSeg->iLe=
afPgno!=3D1 ){
+       fts5SecureDeleteIdxEntry(p, iSegid, pSeg->iLeafPgno);
+     }
+
+-    assert_nc( nPg>4 || fts5GetU16(aPg)=3D=3D0 );
+-    fts5DataWrite(p, FTS5_SEGMENT_ROWID(iSegid,pSeg->iLeafPgno), aPg, nPg=
);
++    assert_nc( nNewPg>4 || fts5GetU16(aPg)=3D=3D0 );
++    fts5DataWrite(p, FTS5_SEGMENT_ROWID(iSegid,pSeg->iLeafPgno), aPg, nNe=
wPg);
+   }
+   sqlite3_free(aIdx);
+ }
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.45.3.bb
index e7c5bcdac4..1ff7c4f2ee 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -11,6 +11,9 @@ SRC_URI =3D "http://www.sqlite.org/2024/sqlite-autoconf-$=
{SQLITE_PV}.tar.gz \
            file://CVE-2025-70873.patch \
            file://CVE-2026-11822_CVE-2026-11824.patch \
            file://CVE-2026-119373.patch \
+           file://CVE-2026-119374-pre1.patch \
+           file://CVE-2026-119374-pre2.patch \
+           file://CVE-2026-119374.patch \
 "
 SRC_URI[sha256sum] =3D "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270=
a5ee9a38191531"

--
2.55.0


--_000_PH0PR11MB76168073E822F62E03F0484AD3422PH0PR11MB7616namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div>Hi Jo=E3o and Yoann,<br>
<br>
Could you add a Backport Changes: section to the inner CVE-2026-119374.patc=
h header? The upstream fix changes ext/fts5/fts5_index.c, while this backpo=
rt applies it to sqlite3.c. Please also explain why ext/fts5/test/fts5corru=
ptB.test, manifest, and manifest.uuid
 are omitted.<br>
<br>
Thanks,<br>
Devansh</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri=
, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> Joao Marc=
os Costa via openembedded-core &lt;joaomarcos.costa=3Dbootlin.com@lists.ope=
nembedded.org&gt;<br>
<b>Sent:</b> Wednesday, 25 November 2026 14:52:38<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> thomas.petazzoni@bootlin.com &lt;thomas.petazzoni@bootlin.com&gt=
;; yoann.congal@smile.fr &lt;yoann.congal@smile.fr&gt;; Jo=E3o Marcos Costa=
 (Schneider Electric) &lt;joaomarcos.costa@bootlin.com&gt;<br>
<b>Subject:</b> [OE-core] [scarthgap][PATCH v2 2/3] sqlite3: fix CVE-2026-1=
19374</span>
<div>&nbsp;</div>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">This vulnerability, mar=
ked as High [1], was fixed upstream [2] since<br>
3.54.0.<br>
<br>
Backport the fix to sqlite v3.45.3.<br>
<br>
Some function/macro definitions are required to compile the backported<br>
code, and they are provided in the *-pre*.patch files.<br>
<br>
[1] <a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-119374">https://nv=
d.nist.gov/vuln/detail/cve-2026-119374</a><br>
[2] <a href=3D"https://github.com/sqlite/sqlite/commit/d9de6eedbe918c074c75=
56400fa21df5960704d9">
https://github.com/sqlite/sqlite/commit/d9de6eedbe918c074c7556400fa21df5960=
704d9</a><br>
<br>
Signed-off-by: Jo=E3o Marcos Costa (Schneider Electric) &lt;joaomarcos.cost=
a@bootlin.com&gt;<br>
---<br>
&nbsp;.../sqlite/sqlite3/CVE-2026-119374-pre1.patch | 48 +++++++++++++<br>
&nbsp;.../sqlite/sqlite3/CVE-2026-119374-pre2.patch | 63 +++++++++++++++++<=
br>
&nbsp;.../sqlite/sqlite3/CVE-2026-119374.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 67 +++++++++++++++++++<br>
&nbsp;meta/recipes-support/sqlite/sqlite3_3.45.3.bb |&nbsp; 3 +<br>
&nbsp;4 files changed, 181 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-11937=
4-pre1.patch<br>
&nbsp;create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-11937=
4-pre2.patch<br>
&nbsp;create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-11937=
4.patch<br>
<br>
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre1.patch=
 b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre1.patch<br>
new file mode 100644<br>
index 0000000000..9392163008<br>
--- /dev/null<br>
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre1.patch<br>
@@ -0,0 +1,48 @@<br>
+From f9e6373f9cbd1d10d01441a03def5fa08b4202d1 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D &lt;joaomarcos.co=
sta@bootlin.com&gt;<br>
+Date: Wed, 25 Nov 2026 14:49:35 +0100<br>
+Subject: [PATCH] sqlite3.c: add sqlite3Fts5ConfigErrmsg helper<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+This function was introduced at [1], and it is required by the backport pa=
tch for CVE-2026-119374.<br>
+<br>
+Please note this is a partial backport, whose sole purpose is to include<b=
r>
+sqlite3Fts5ConfigErrmsg()'s definition.<br>
+<br>
+[1] <a href=3D"https://github.com/sqlite/sqlite/commit/2ec78c0e4bab11ce288=
a830c3a13fe34a9224c4a">
https://github.com/sqlite/sqlite/commit/2ec78c0e4bab11ce288a830c3a13fe34a92=
24c4a</a><br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/sqlite/sqlite/com=
mit/2ec78c0e4bab11ce288a830c3a13fe34a9224c4a">https://github.com/sqlite/sql=
ite/commit/2ec78c0e4bab11ce288a830c3a13fe34a9224c4a</a>]<br>
+<br>
+Signed-off-by: Jo=E3o Marcos Costa &lt;joaomarcos.costa@bootlin.com&gt;<br=
>
+---<br>
+ sqlite3.c | 15 +++++++++++++++<br>
+ 1 file changed, 15 insertions(+)<br>
+<br>
+diff --git a/sqlite3.c b/sqlite3.c<br>
+index 88b1810..1bf28ac 100644<br>
+--- a/sqlite3.c<br>
++++ b/sqlite3.c<br>
+@@ -239370,6 +239370,21 @@ struct Fts5SegIter {<br>
+&nbsp;&nbsp; u8 bDel;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* True if the delete flag is set */<br>
+ };<br>
+<br>
++void sqlite3Fts5ConfigErrmsg(Fts5Config *pConfig, const char *zFmt, ...){=
<br>
++&nbsp; va_list ap;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ... pr=
intf arguments */<br>
++&nbsp; char *zMsg =3D 0;<br>
++<br>
++&nbsp; va_start(ap, zFmt);<br>
++&nbsp; zMsg =3D sqlite3_vmprintf(zFmt, ap);<br>
++&nbsp; if( pConfig-&gt;pzErrmsg ){<br>
++&nbsp;&nbsp;&nbsp; *pConfig-&gt;pzErrmsg =3D zMsg;<br>
++&nbsp; }else{<br>
++&nbsp;&nbsp;&nbsp; sqlite3_free(zMsg);<br>
++&nbsp; }<br>
++<br>
++&nbsp; va_end(ap);<br>
++}<br>
++<br>
+ /*<br>
+ ** Array of tombstone pages. Reference counted.<br>
+ */<br>
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre2.patch=
 b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre2.patch<br>
new file mode 100644<br>
index 0000000000..dec6044002<br>
--- /dev/null<br>
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374-pre2.patch<br>
@@ -0,0 +1,63 @@<br>
+From 1fec121608ced287baed5feabc646d74c93abec6 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D &lt;joaomarcos.co=
sta@bootlin.com&gt;<br>
+Date: Wed, 25 Nov 2026 14:58:50 +0100<br>
+Subject: [PATCH] sqlite3.c: add fts5IndexCorrupt* helpers<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+These macros/functions were introduced at [1], and they are required by th=
e backport patch for CVE-2026-119374.<br>
+<br>
+Please note this is a partial backport, whose sole purpose is to include<b=
r>
+the definitions for FTS5_CORRUPT_ROWID, FTS5_CORRUPT_ITER, and<br>
+FTS5_CORRUPT_IDX.<br>
+<br>
+[1] <a href=3D"https://github.com/sqlite/sqlite/commit/fe182f74b28db7db546=
56a19de97069e1ac69470">
https://github.com/sqlite/sqlite/commit/fe182f74b28db7db54656a19de97069e1ac=
69470</a><br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/sqlite/sqlite/com=
mit/fe182f74b28db7db54656a19de97069e1ac69470">https://github.com/sqlite/sql=
ite/commit/fe182f74b28db7db54656a19de97069e1ac69470</a>]<br>
+<br>
+Signed-off-by: Jo=E3o Marcos Costa &lt;joaomarcos.costa@bootlin.com&gt;<br=
>
+---<br>
+ sqlite3.c | 29 +++++++++++++++++++++++++++++<br>
+ 1 file changed, 29 insertions(+)<br>
+<br>
+diff --git a/sqlite3.c b/sqlite3.c<br>
+index 1bf28ac..354f416 100644<br>
+--- a/sqlite3.c<br>
++++ b/sqlite3.c<br>
+@@ -239385,6 +239385,35 @@ void sqlite3Fts5ConfigErrmsg(Fts5Config *pConfi=
g, const char *zFmt, ...){<br>
+&nbsp;&nbsp; va_end(ap);<br>
+ }<br>
+<br>
++static int fts5IndexCorruptRowid(Fts5Index *pIdx, i64 iRowid){<br>
++&nbsp; pIdx-&gt;rc =3D FTS5_CORRUPT;<br>
++&nbsp; sqlite3Fts5ConfigErrmsg(pIdx-&gt;pConfig,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;fts5: corruption found reading blob =
%lld from table \&quot;%s\&quot;&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iRowid, pIdx-&gt;pConfig-&gt;zName<br>
++&nbsp; );<br>
++&nbsp; return SQLITE_CORRUPT_VTAB;<br>
++}<br>
++#define FTS5_CORRUPT_ROWID(pIdx, iRowid) fts5IndexCorruptRowid(pIdx, iRow=
id)<br>
++<br>
++static int fts5IndexCorruptIter(Fts5Index *pIdx, Fts5SegIter *pIter){<br>
++&nbsp; pIdx-&gt;rc =3D FTS5_CORRUPT;<br>
++&nbsp; sqlite3Fts5ConfigErrmsg(pIdx-&gt;pConfig,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;fts5: corruption on page %d, segment=
 %d, table \&quot;%s\&quot;&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pIter-&gt;iLeafPgno, pIter-&gt;pSeg-&gt;iS=
egid, pIdx-&gt;pConfig-&gt;zName<br>
++&nbsp; );<br>
++&nbsp; return SQLITE_CORRUPT_VTAB;<br>
++}<br>
++#define FTS5_CORRUPT_ITER(pIdx, pIter) fts5IndexCorruptIter(pIdx, pIter)<=
br>
++<br>
++static int fts5IndexCorruptIdx(Fts5Index *pIdx){<br>
++&nbsp; pIdx-&gt;rc =3D FTS5_CORRUPT;<br>
++&nbsp; sqlite3Fts5ConfigErrmsg(pIdx-&gt;pConfig,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;fts5: corruption in table \&quot;%s\=
&quot;&quot;, pIdx-&gt;pConfig-&gt;zName<br>
++&nbsp; );<br>
++&nbsp; return SQLITE_CORRUPT_VTAB;<br>
++}<br>
++#define FTS5_CORRUPT_IDX(pIdx) fts5IndexCorruptIdx(pIdx)<br>
++<br>
+ /*<br>
+ ** Array of tombstone pages. Reference counted.<br>
+ */<br>
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch b/me=
ta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch<br>
new file mode 100644<br>
index 0000000000..34afed81b4<br>
--- /dev/null<br>
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch<br>
@@ -0,0 +1,67 @@<br>
+From 9145df76941bd1de6ad146346269b6fcac762233 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D &lt;joaomarcos.co=
sta@bootlin.com&gt;<br>
+Date: Wed, 4 Nov 2026 17:07:06 +0100<br>
+Subject: [PATCH] Fix a problem in fts5 secure-delete code that could lead =
to a<br>
+ buffer overrun when dealing with a strategically corrupted database. Prob=
lem<br>
+ reported by YEONBA.<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+FossilOrigin-Name: 9cd4f9e9205c5a5096388397a39349db9ff5377d19095c6b20388ff=
799969c31<br>
+<br>
+CVE: CVE-2026-119374<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/sqlite/sqlite/com=
mit/d9de6eedbe918c074c7556400fa21df5960704d9">https://github.com/sqlite/sql=
ite/commit/d9de6eedbe918c074c7556400fa21df5960704d9</a>]<br>
+<br>
+Signed-off-by: Jo=E3o Marcos Costa &lt;joaomarcos.costa@bootlin.com&gt;<br=
>
+---<br>
+ sqlite3.c | 17 +++++++++++------<br>
+ 1 file changed, 11 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/sqlite3.c b/sqlite3.c<br>
+index 354f416..9f4fe9d 100644<br>
+--- a/sqlite3.c<br>
++++ b/sqlite3.c<br>
+@@ -244286,31 +244286,36 @@ static void fts5DoSecureDelete(<br>
+&nbsp;&nbsp;&nbsp;&nbsp; const int nMove =3D nPg - iNextOff;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Number of bytes to move */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; int nShift =3D iNextOff - iOff;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Distance to move them */<br>
+<br>
++&nbsp;&nbsp;&nbsp; int nNewPg =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; int iPrevKeyOut =3D 0;<br>
+-&nbsp;&nbsp;&nbsp; int iKeyIn =3D 0;<br>
++&nbsp;&nbsp;&nbsp; i64 iKeyIn =3D 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; memmove(&amp;aPg[iOff], &amp;aPg[iNextOff], nMove=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; iPgIdx -=3D nShift;<br>
+-&nbsp;&nbsp;&nbsp; nPg =3D iPgIdx;<br>
++&nbsp;&nbsp;&nbsp; nNewPg =3D iPgIdx;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; fts5PutU16(&amp;aPg[2], iPgIdx);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; for(iIdx=3D0; iIdx&lt;nIdx; /* no-op */){<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 iVal =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iIdx +=3D fts5GetVarint32(&amp;aIdx[i=
Idx], iVal);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iKeyIn +=3D iVal;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( iKeyIn&gt;nPg ){<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FTS5_CORRUPT_IDX(p);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( iKeyIn!=3DiDelKeyOff ){<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int iKeyOut =3D (iKeyIn -=
 (iKeyIn&gt;iOff ? nShift : 0));<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nPg +=3D sqlite3Fts5PutVarint(=
&amp;aPg[nPg], iKeyOut - iPrevKeyOut);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nNewPg +=3D sqlite3Fts5PutVari=
nt(&amp;aPg[nNewPg], iKeyOut - iPrevKeyOut);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iPrevKeyOut =3D iKeyOut;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp; if( iPgIdx=3D=3DnPg &amp;&amp; nIdx&gt;0 &amp;&amp; pS=
eg-&gt;iLeafPgno!=3D1 ){<br>
++&nbsp;&nbsp;&nbsp; if( p-&gt;rc=3D=3DSQLITE_OK &amp;&amp; iPgIdx=3D=3DnNe=
wPg &amp;&amp; nIdx&gt;0 &amp;&amp; pSeg-&gt;iLeafPgno!=3D1 ){<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fts5SecureDeleteIdxEntry(p, iSegid, p=
Seg-&gt;iLeafPgno);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp; assert_nc( nPg&gt;4 || fts5GetU16(aPg)=3D=3D0 );<br>
+-&nbsp;&nbsp;&nbsp; fts5DataWrite(p, FTS5_SEGMENT_ROWID(iSegid,pSeg-&gt;iL=
eafPgno), aPg, nPg);<br>
++&nbsp;&nbsp;&nbsp; assert_nc( nNewPg&gt;4 || fts5GetU16(aPg)=3D=3D0 );<br=
>
++&nbsp;&nbsp;&nbsp; fts5DataWrite(p, FTS5_SEGMENT_ROWID(iSegid,pSeg-&gt;iL=
eafPgno), aPg, nNewPg);<br>
+&nbsp;&nbsp; }<br>
+&nbsp;&nbsp; sqlite3_free(aIdx);<br>
+ }<br>
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.45.3.bb<br>
index e7c5bcdac4..1ff7c4f2ee 100644<br>
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb<br>
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb<br>
@@ -11,6 +11,9 @@ SRC_URI =3D &quot;http://www.sqlite.org/2024/sqlite-autoc=
onf-${SQLITE_PV}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-70873.patch">file://CVE-2025-70873.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-11822_CVE-2026-11824.patch">file://CVE-2026-11822_CVE-2=
026-11824.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-119373.patch">file://CVE-2026-119373.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-119374-pre1.patch">file://CVE-2026-119374-pre1.patch</a> \<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-119374-pre2.patch">file://CVE-2026-119374-pre2.patch</a> \<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-119374.patch">file://CVE-2026-119374.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;b2809ca53124c19c60f42bf627736eae011afdcc=
205bb48270a5ee9a38191531&quot;<br>
&nbsp;<br>
--<br>
2.55.0<br>
<br>
</div>
</body>
</html>

--_000_PH0PR11MB76168073E822F62E03F0484AD3422PH0PR11MB7616namp_--
