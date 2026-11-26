Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10069.1795681353560224730
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 00:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aSL/h2g7;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13272; q=dns/txt;
  s=iport01; t=1795681353; x=1796890953;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=WdELv7qZYhjwH1wxLu3gYF4igPiw834wrQJ5uNP1il8=;
  b=aSL/h2g7FE/dtsA2nPT8kVn01/xgNbExCd2+bZMBwQ1Yk0yzcDY5o48W
   dmdwDbVw5xPCj6+tlnkRF7lb/sBwC8OJACawHM9mYOANhN1SRl/JdHBUv
   8Ww2f7EO/EXagqrHXyklBltnaZbUFdEeVE7xbBKqeKBEL4aMSDwzQLFB1
   iHfqNIymcW2wAT5OukT4k9QKaecmSN0tSZHy2Bjn1G1rWdjA1y9Je1tIr
   wy9OL3ojSlm3Og3ZYXjBtay/iuW4SeVO7gRrc3zFuK6x3Tjr7mTaTeUnq
   rvkLnsByckHQSgtWPT6ZG6beZAfFUZ3S43O6iCG9EGXBMNTPEvB2KlP+Y
   Q==;
X-CSE-ConnectionGUID: imIceRL3TAaDq6S2H03pcA==
X-CSE-MsgGUID: N5kLEurtT6Sgi9euT4tUEQ==
X-IPAS-Result: =?us-ascii?q?A0BmAgBa6wdr/4sQJK1aHgEBCxIMZYEgC4E9MVMWdYERE?=
 =?us-ascii?q?kmIIwOFK4h6A54pgX4PAQEBDQIuARUNBAEBhD9GAo4jAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQEBAQMBERUkAS0QAgEIE?=
 =?us-ascii?q?QMBAQEvJwodCAIEAQkEBQgBGYJhgh1XAwECDqx2cwKKHXiBATOBAYJmQwExB?=
 =?us-ascii?q?ggCQ9wDAQsUAYE4hQg6gx8BASuBNYJegSMYARuEYycbG4FygRVCeYFxPoEFg?=
 =?us-ascii?q?VwBAQKBYB4eg1iCMASCInoSG4E5HmSMEQEBgUmIXFJyIgMmMywBVRMXCwcFg?=
 =?us-ascii?q?SUQMwMgCi8tAhQNIg8aBS0dcAwnEikXER5YGwYFEiAqQEMwK4ESgQNdgSsoX?=
 =?us-ascii?q?QECH0YtFYF1AoJRgSNdAgFJQQ4HRVMJJT4FEkckIggSCQETGiwKgRo1PAkmP?=
 =?us-ascii?q?xUMWwwLGgUaRwgCCwIMdCgREBMdHCQvBRkmPBsKgQwnHR4ZDgIpBhYhC0NtP?=
 =?us-ascii?q?TcGDxkDBIE1BZMwYoMdPVEBKgGCOgOTAI98R4E1oX0KKIN5jCSNPogyF4QEj?=
 =?us-ascii?q?RSZWwuYfSONZ5sQAgQCBAUCEQEBBoFoPIFHCwdwFYMiCUoZD44uFoNggX+DF?=
 =?us-ascii?q?MkneQIBCDIBAQcCBw4DC4FokX4BAQ?=
IronPort-PHdr: A9a23:z/dJ1BzrTE64FIbXCzPsngc9DxPP8539OgoTr50/hK0LLuKo/o/pO
 wrU4vA+xFPKXICO8/tfkKKWqKHvX2Uc/IyM+G4Pap1CVhIJyI0WkgUsDdTDCBjTJ//xZCt8F
 8NHPGI=
IronPort-Data: A9a23:jT0R26vOsOSdvWvQdtRevYki8efnVA5fMUV32f8akzHdYApBsoF/q
 tZmKWzVMqmMYjOhco8gbIyy9hxX65SBzdYwTwNk/Co1F3kVgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvZ9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw++NWCmx00
 ackATkhd0643cLum6qwY7w57igjBJGD0II3s3Vky3TdSP0hW52GG/+M7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWYQZ/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9K4TaFZ4LwBnAz
 o7A10KkATU3KcaD9WS+/XP9i/LzwT/GdbtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmQHY909v8hwTjsvv
 rOUo+7U6fVUmOT9YVqW96yfqnW5Pi19EIPITXRsodctizU7nLwOsw==
IronPort-HdrOrdr: A9a23:mv+vJasPmeh8XRXTrUhv2TRS7skCS4Aji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwRpVoIUmxyXZ0ibNhW4tKLzOWyVdATbsSorcKrAeQYREWmtQtsZ
 uINpIOd+EYbmIKw/oSgjPIburIqePvmMvH9IWuqkuFDzsaF52IhD0JczpzZ3cGPzWucqBJbK
 Z0iPA3wAaISDA8VOj+LH8DWOTIut3Mk7zbQTNuPXQawTjLpwmFrJrhHTal/jp2aV5y6IZn3X
 nOkgT/6KnmiPem1x/a2VbU6pRdiPHhxtFACMHksLlVFtzrsGmVTbUkf4fHkCE+oemp5lpvus
 LLuQ0cM8N67G6UVn2poDP2sjOQkwoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx86q
 RWxGiU3qAnTy8o3R6NouQgZSsa0XZckkBS19L7SEYvCLf2XYUh6bD3OnklSKvoUhiKs7zPW9
 MefP00rMwmAm9yKUqp/lVH8ZiLQmk5GAuATwwpv8yY1CUToVVCpnFonvD2Whw7hc4Ao14u3Z
 WYDo140L5JVcMYdqR7GaMIRta2EHXERVbWPHuVOkmPLtBMB5vhke++3FwO3pDgRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOthTAWn+0UzjhwtxXo8ERgMyxeJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR/vuN3HnF4pF1xD3H5NSNX4dWssIvctTYSPCnuvbbonx8uDLevfaI7TgVT4iR2PkG3
 MGGCP+Ic1Rh3rbE0MQQCKhLU8FVnaPiq6YSpKqitQ72cwILMlWvgAelFS+4dvjE0wxjkUfRj
 oLHI/a
X-Talos-CUID: =?us-ascii?q?9a23=3AwXDPK2odRz2AiF1SkdLQc2vmUcEgU3bQ9lOLH2a?=
 =?us-ascii?q?xJX83c+e1EQSI84oxxg=3D=3D?=
X-Talos-MUID: 9a23:FwqlqwoTPdwQFwPpIZgezxc/N+NF/r6yNB42npRXttS4aTBNFg7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Nov 2026 08:22:32 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 8C80418000146
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:22:32 +0000 (GMT)
X-CSE-ConnectionGUID: /4ej9VDETfSTSY6PsOrOzQ==
X-CSE-MsgGUID: hO1xBjVxRla4p3cciCplCw==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,234,1787011200"; 
   d="scan'208,217";a="93792637"
Received: from mail-southcentralusazon11012066.outbound.protection.outlook.com (HELO SN4PR2101CU001.outbound.protection.outlook.com) ([40.93.195.66])
  by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Nov 2026 08:22:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqMGXT9woq8k7YHfIrGV9v+cVa4UyXXEdumL6Lvb1fopho5JhCzy0zVIXVySYXIYnlTS57x6uiAZMRB9AFI+7JBDuzz/UDQoNEPl3wLPy1uHCjJaXfimyxp5Faf7Wsaij4h3u+d3pt+gsnkK7m9EErPVrumM8Sdf5geTr/eC9r006wlndDXnpvZDpKEWkeGrp3RhiDYN7U/cjkgDO6Nwiz7Dt81nCytCLXwokGBiziMhRJ+lJ37ratCMFlomlG9wrEWSC/v+jStWDj/Juw7nVX9h3QlrF6B7vXERtyjZyORcwLuEI2b5wkApmQkF6n25HFV7sDiZYZvT05bvKK7l2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdELv7qZYhjwH1wxLu3gYF4igPiw834wrQJ5uNP1il8=;
 b=IXOIapm4kULFa2rkKKagVr0GdzEkOzoocqODeqg6BoD/9t1/Nv+p6vw5H3seANTbsI8XBkVO+GrPSPJ5gzd3JG2LbzzbqAF/JfDkbg1Y846Xs8Wwkdt7ELMAQSFhX4kGmO2ysESDH8JfD4V0aopwvfah5TNp31lfEjsg+c9+zWodaZYijkT7mKxdov0G+3/vSDvwKWIDLpyJ+VZ/GMLbvp9QEa70Rr7TkunVrbrvn7dZJRIR/MBLzO/cJobjXNv7ozJhIsZ6Aerus9mja6WNVkTqUJStOB+iab3YtRxCd/7k/M7P1eiUbxhCA8cu+VtnpLwxne91e/XMnOenxCNXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 by DS0PPFC7FC39169.namprd11.prod.outlook.com (2603:10b6:f:fc02::50c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 08:22:30 +0000
Received: from PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340]) by PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340%6]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 08:22:30 +0000
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<devanshp@cisco.com>
To: "joaomarcos.costa@bootlin.com" <joaomarcos.costa@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	"yoann.congal@smile.fr" <yoann.congal@smile.fr>
Subject: RE: [OE-core] [scarthgap][PATCH v2 3/3] sqlite3: fix CVE-2026-119379
Thread-Topic: [OE-core] [scarthgap][PATCH v2 3/3] sqlite3: fix CVE-2026-119379
Thread-Index: AQHdfO0HwGehT5dw80SQuSb0vOHlkbdAA+J4
Date: Thu, 26 Nov 2026 08:22:30 +0000
Message-ID: <PH0PR11MB7616C0DB999DA88F6ECE091BD3422@PH0PR11MB7616.namprd11.prod.outlook.com>
References: <20261125145239.4173659-1-joaomarcos.costa@bootlin.com>
 <20261125145239.4173659-4-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261125145239.4173659-4-joaomarcos.costa@bootlin.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7616:EE_|DS0PPFC7FC39169:EE_
x-ms-office365-filtering-correlation-id: bde9a373-e4da-49ed-bc7e-08df4b966a21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|4143699003|12006099003|261009223027099003|22082099003|18002099003|3023799007|13003099007|8096899003|260925021311599003|260925021911599003|260925022911599003|10067099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261021135927099003|261021123027099003|261021121427099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info: NLZlnGhHIsenX/7bPJCHS7yUSTGrlzifVmdLJ14YOWMBA/1tnE+hTQbvDJ++XX5f4pYM/JPIIi38JBw0UT2aZtc7ebjQvQ7cElrG6fnzmdJqd99C4NUUKTgT2i7Ja8HEZldHt5ZKMSJlkm38UrgeJrrTIc8jxxpoxeZu4VVyKNBSrTYh0vCh1RUrVdo2TSe0cdZma1jtsgtz1FRu4ibjkARLOTDgMIBkzkn30xlDL8y2oFk2aUqGBy3dQVEqYy0L1FD2+8Z+ZpxSWLMhT+VxPLpG2Am+MDG4IsI44mzOIBs55AFGcP325oanKQ+uceFbWJcxVQ65iKf6qVSWwkKDgydHhV/V0c/MWWFRFN3ypGK3mD9SRQenquE33fiAt817sZZFri/xuypNPA0g/z1Ks650qUguMeFAVsksiLivjypO2yq25G0DFC5o+cFi0k5S4bug2olEvf9ZAacyQoqSa7TTfQ2BkdTxDcY9uusvJfS7LpNhYUlpeyu+pPMIj1zrQz/hqr8dJLM6/3GfaNcnQ+CuVfdlPOeS1+H4oXdHz/kfK+fWmwwwyMIE9w082TXJAxNLY3eYjdMhKmsCa7Q8Jvzw52UpuUkKepl5+FBwFMiWK8l/2LF4anLsh08Uuc2GuuOZg9A1OSp85KLERp/2NbZohWx+/B/nlxjVufa4NOQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7616.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(12006099003)(261009223027099003)(22082099003)(18002099003)(3023799007)(13003099007)(8096899003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261021135927099003)(261021123027099003)(261021121427099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2JfytewkyIuD6KyjUShIX73AZfbe6SaY7Q/IPIknGSPEOxQy09NNA7ZPNQ?=
 =?iso-8859-1?Q?wKxR3/Wq3I9DzpBKyzk9JW2rJcS9YYdm9HN4vISqrT6ZpVjyvxLqA14NAd?=
 =?iso-8859-1?Q?wF1KMjHRkxJWEqccL9IQrSqjLEnahs6QuLBPYb7o+yAnoleG7crbK4SUvN?=
 =?iso-8859-1?Q?dd+4pJFOsUUCCGly5dGuX6cvC8YYiPrmDjBkBeBhzMse+H3cu/BIfGXVLr?=
 =?iso-8859-1?Q?atckVtAN+4CxYXK+KFESRZTXSLRuQ7zC90j3NRhy3MS6a2Kkjf81ZWpSfx?=
 =?iso-8859-1?Q?TL3kqBZYvE+nqj/eUNIDPnJDc8ytk5HnYyLpQexczXfz0Y/mIbeN7tRy1K?=
 =?iso-8859-1?Q?YcEJrkg/9jIFnYaMc9IndFNbWBr/MaQR1YxiKWi7V1x+H6uHLH5BA2jbqm?=
 =?iso-8859-1?Q?2inKYMz3rd0bDQcl+qFTSAX/+fEzKucRe5GeoLL0UmmbSzx+F9Hc+U9nHQ?=
 =?iso-8859-1?Q?LJsOEA37v/xW14XECM/e+zCe3N7CqHALfjNvCzbBrCa6Doy3Zuuzi7Jd4r?=
 =?iso-8859-1?Q?t9aIvBndswHk5fYCoKl3ReK6RhHKlyqwF2eR03vnvedzCosscAluZlAiRx?=
 =?iso-8859-1?Q?ZNWV+W8pMjd7uppBS7sNfIS9FcJ+u1LC4bWNTmtY4uc0qRYDUDeVtxh0hz?=
 =?iso-8859-1?Q?1JmA2GdPZUwOIUUePbwtgr0Fl4FhzbhsLcXRPw2I2Tc02DBZU5Fwgh5i2E?=
 =?iso-8859-1?Q?PpqLnyW95Yt4aEpOr98yOSNknaF1W0cqTVZq/EQh83PL91iLrDq0V6uVsh?=
 =?iso-8859-1?Q?istN5VR20+hai2eM1cdx5hvNxqTT0vp/lgCcC9QU8EHR7ljV5FUpNe9NIA?=
 =?iso-8859-1?Q?gRSbQ3KHfLGfdXMosVzao+dp4ZwUWjd6Be9mpYtKmZ3OoWCRxTnq7ueJxs?=
 =?iso-8859-1?Q?i8BHMhzEqcJ+MHlMivfYXJ5H79wlTfW5Qsg6dhEq0Ia0EDxPEOOFWXDL1K?=
 =?iso-8859-1?Q?UI8K1rNPIrbJmiCyav+/Hoh+KLTGMMJYo2rHwFRHQUqGBuHTE6T+SLfqNy?=
 =?iso-8859-1?Q?ReSkUpv1Ndn6Fknh5V8E8XU9JoFhm8X0uYvvWjwHxN/kDRoiAKRNUQaTrz?=
 =?iso-8859-1?Q?oMRiSWS9COHX4Pqmt+s5LXlYGxnLrUIsuIQiPYJ+Ubi2m+ceoVx4IJHWjp?=
 =?iso-8859-1?Q?+e9gDhbTDpNjHqpHFSkLvl65ObJoQuXVME+7sUZnHHHFV/5F/7J0wwm04e?=
 =?iso-8859-1?Q?54iCJV113svv6TUoe2dDCuuGoLhLrYEi9CES7UiJQjP6eFyX1LpL9cYG8L?=
 =?iso-8859-1?Q?HvGGFImSJwyWVJA5ocASI17jMNXD/az5GZ13U9yyerAP0yZSgwinY5lTVH?=
 =?iso-8859-1?Q?vjWALR9JnpMIclyKFO5DPwsvJ10xP6MlColnlcBNG9N8e971XXn3hpJXC5?=
 =?iso-8859-1?Q?Gpu1xTjd7/Ft8a8fHy5x5HxhVvSUM2//iC1ENyjyfw8x0BJ6Tb+Yd2mRiZ?=
 =?iso-8859-1?Q?9HH/mfIOeu9kOC2jof58pp0IJn4VGXs47NfSGq/atThEP34D/m1/md0clp?=
 =?iso-8859-1?Q?vc6unnsPAoIAo01/IrS/XSZL0keGFrPOmWaR3bYsanl8/2cga9cI7gVAX5?=
 =?iso-8859-1?Q?cGtPuMbwC+VzvY+F1tkTG7Qqv8YIkD8jxYWjCgHjgLTJ0Dib1B+6WkUSLj?=
 =?iso-8859-1?Q?pyGLXav+TJ7UI0FEQKiBQ5JvHYvegj7FrUvhixj9RxisSLgQX/rs7RJ/d3?=
 =?iso-8859-1?Q?VY7hvk5QTBvbrkZiiSaU/b9TbMhp0oCvf4l+gZ4J2fYb7UPw3zyj4kCBXe?=
 =?iso-8859-1?Q?bC/LpHGAldWZYhEDiSGnfcCcBoCI1BnEkOL5EV9qSHLYFNurlD3Apwn50/?=
 =?iso-8859-1?Q?QoYqO7Df5nq6IgxabLTrOZ67HLiHCCY=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB7616C0DB999DA88F6ECE091BD3422PH0PR11MB7616namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PkrbSJIVXWfmgT0hB3sGFO5r6hd6fbcESA/JQMOaw0peAGkQpMPvMt+wk+o3pH1K97pLdbLQRogkk8YSVzqzY2pqBGQxPghujxCn+YhFP4EHU2vpovZIgdLga3LqyaY+3BxV62LEVX9XEL+bdQdYthguTEHKgC8H0t6ctQ8g+zZxVeS+OpO2fEtiCzKInz1d47kQif+p7NMPxWJynvAbFTOBv9AEKSQoFy5fMpJ1q0BDD17PpLTerV/uSyPh5wEU5EBIdjBnE0BdWXJGIxicqKGwf2EBv6ubJ39jx5HKPD5xUfRlJBF1fp0VwULOTZN+pAwJoLPpBfYMQrr/i7/H2Q==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7616.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde9a373-e4da-49ed-bc7e-08df4b966a21
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 08:22:30.7119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jogpYYuzcwECpW/njesxBaOwZHS2XpBYCTY/61ZErM4TIqIi7ynWLSnbkNplwjM5rt7KSURYZlky2S8JXH/VKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPFC7FC39169
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-4.cisco.com [173.37.147.252];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251287

--_000_PH0PR11MB7616C0DB999DA88F6ECE091BD3422PH0PR11MB7616namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jo=E3o and Yoann,

Could you add a Backport Changes: section to the inner CVE-2026-119379.patc=
h header? The upstream fix changes ext/session/sqlite3session.c, while this=
 backport applies it to sqlite3.c. Please also explain why ext/session/sess=
ioncorrupt.test, manifest, and manifest.uuid are omitted.

Thanks,
Devansh
________________________________
From: Joao Marcos Costa via openembedded-core <joaomarcos.costa=3Dbootlin.c=
om@lists.openembedded.org>
Sent: Wednesday, 25 November 2026 14:52:39
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: thomas.petazzoni@bootlin.com <thomas.petazzoni@bootlin.com>; yoann.cong=
al@smile.fr <yoann.congal@smile.fr>; Jo=E3o Marcos Costa (Schneider Electri=
c) <joaomarcos.costa@bootlin.com>
Subject: [OE-core] [scarthgap][PATCH v2 3/3] sqlite3: fix CVE-2026-119379

This vulnerability, marked as High [1], was fixed upstream [2] since
3.54.0.

Backport the fix to sqlite v3.45.3.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-119379
[2] https://github.com/sqlite/sqlite/commit/64459c87cc702d600704fb77ee40ca1=
782398a52

Signed-off-by: Jo=E3o Marcos Costa (Schneider Electric) <joaomarcos.costa@b=
ootlin.com>
---
 .../sqlite/sqlite3/CVE-2026-119379.patch      | 70 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.pat=
ch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch b/me=
ta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
new file mode 100644
index 0000000000..32fdbbc5d2
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
@@ -0,0 +1,70 @@
+From 56618802689fc81664d5e461da93026998a6b6bb Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.costa=
@bootlin.com>
+Date: Thu, 5 Nov 2026 12:06:23 +0100
+Subject: [PATCH] Avoid a buffer overrun when processing a strategically
+ corrupted changeset. Report [bugs:/info/2026-08-16T10:15:25Z |
+ 2026-08-16T10:15:25Z].
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+FossilOrigin-Name: 3f57024aecea0f3b565ed823cf94b085031c481fd6323c1f2e4319a=
53500864f
+
+CVE: CVE-2026-119379
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/64459c8=
7cc702d600704fb77ee40ca1782398a52]
+
+Signed-off-by: Jo=E3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ sqlite3.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 2b1e6b9..88b1810 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -228393,9 +228393,9 @@ static int sessionChangesetApply(
+   int schemaMismatch =3D 0;
+   int rc =3D SQLITE_OK;             /* Return code */
+   const char *zTab =3D 0;           /* Name of current table */
+-  int nTab =3D 0;                   /* Result of sqlite3Strlen30(zTab) */
+   SessionApplyCtx sApply;         /* changeset_apply() context object */
+   int bPatchset;
++  int bNew =3D 0;                   /* True for first entry of new table =
*/
+
+   assert( xConflict!=3D0 );
+
+@@ -228411,15 +228411,16 @@ static int sessionChangesetApply(
+   if( rc=3D=3DSQLITE_OK ){
+     rc =3D sqlite3_exec(db, "PRAGMA defer_foreign_keys =3D 1", 0, 0, 0);
+   }
+-  while( rc=3D=3DSQLITE_OK && SQLITE_ROW=3D=3Dsqlite3changeset_next(pIter=
) ){
++  while( rc=3D=3DSQLITE_OK && SQLITE_ROW=3D=3DsessionChangesetNext(pIter,=
 0, 0,&bNew) ){
+     int nCol;
+     int op;
+     const char *zNew;
+
+     sqlite3changeset_op(pIter, &zNew, &nCol, &op, 0);
+
+-    if( zTab=3D=3D0 || sqlite3_strnicmp(zNew, zTab, nTab+1) ){
++    if( bNew ){
+       u8 *abPK;
++      bNew =3D 0;
+
+       rc =3D sessionRetryConstraints(
+           db, pIter->bPatchset, zTab, &sApply, xConflict, pCtx
+@@ -228454,7 +228455,6 @@ static int sessionChangesetApply(
+           rc =3D SQLITE_NOMEM;
+           break;
+         }
+-        nTab =3D (int)strlen(zTab);
+         sApply.azCol =3D (const char **)zTab;
+       }else{
+         int nMinCol =3D 0;
+@@ -228506,7 +228506,6 @@ static int sessionChangesetApply(
+             sApply.bStat1 =3D 0;
+           }
+         }
+-        nTab =3D sqlite3Strlen30(zTab);
+       }
+     }
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.45.3.bb
index 1ff7c4f2ee..9dceb63d98 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "http://www.sqlite.org/2024/sqlite-autoconf-$=
{SQLITE_PV}.tar.gz \
            file://CVE-2026-119374-pre1.patch \
            file://CVE-2026-119374-pre2.patch \
            file://CVE-2026-119374.patch \
+           file://CVE-2026-119379.patch \
 "
 SRC_URI[sha256sum] =3D "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270=
a5ee9a38191531"

--
2.55.0


--_000_PH0PR11MB7616C0DB999DA88F6ECE091BD3422PH0PR11MB7616namp_
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
Could you add a Backport Changes: section to the inner CVE-2026-119379.patc=
h header? The upstream fix changes ext/session/sqlite3session.c, while this=
 backport applies it to sqlite3.c. Please also explain why ext/session/sess=
ioncorrupt.test, manifest, and manifest.uuid
 are omitted.<br>
<br>
Thanks,<br>
Devansh</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri=
, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> Joao Marc=
os Costa via openembedded-core &lt;joaomarcos.costa=3Dbootlin.com@lists.ope=
nembedded.org&gt;<br>
<b>Sent:</b> Wednesday, 25 November 2026 14:52:39<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> thomas.petazzoni@bootlin.com &lt;thomas.petazzoni@bootlin.com&gt=
;; yoann.congal@smile.fr &lt;yoann.congal@smile.fr&gt;; Jo=E3o Marcos Costa=
 (Schneider Electric) &lt;joaomarcos.costa@bootlin.com&gt;<br>
<b>Subject:</b> [OE-core] [scarthgap][PATCH v2 3/3] sqlite3: fix CVE-2026-1=
19379</span>
<div>&nbsp;</div>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">This vulnerability, mar=
ked as High [1], was fixed upstream [2] since<br>
3.54.0.<br>
<br>
Backport the fix to sqlite v3.45.3.<br>
<br>
[1] <a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-119379">https://nv=
d.nist.gov/vuln/detail/cve-2026-119379</a><br>
[2] <a href=3D"https://github.com/sqlite/sqlite/commit/64459c87cc702d600704=
fb77ee40ca1782398a52">
https://github.com/sqlite/sqlite/commit/64459c87cc702d600704fb77ee40ca17823=
98a52</a><br>
<br>
Signed-off-by: Jo=E3o Marcos Costa (Schneider Electric) &lt;joaomarcos.cost=
a@bootlin.com&gt;<br>
---<br>
&nbsp;.../sqlite/sqlite3/CVE-2026-119379.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 70 +++++++++++++++++++<br>
&nbsp;meta/recipes-support/sqlite/sqlite3_3.45.3.bb |&nbsp; 1 +<br>
&nbsp;2 files changed, 71 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-11937=
9.patch<br>
<br>
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch b/me=
ta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch<br>
new file mode 100644<br>
index 0000000000..32fdbbc5d2<br>
--- /dev/null<br>
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch<br>
@@ -0,0 +1,70 @@<br>
+From 56618802689fc81664d5e461da93026998a6b6bb Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D &lt;joaomarcos.co=
sta@bootlin.com&gt;<br>
+Date: Thu, 5 Nov 2026 12:06:23 +0100<br>
+Subject: [PATCH] Avoid a buffer overrun when processing a strategically<br=
>
+ corrupted changeset. Report [bugs:/info/2026-08-16T10:15:25Z |<br>
+ 2026-08-16T10:15:25Z].<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+FossilOrigin-Name: 3f57024aecea0f3b565ed823cf94b085031c481fd6323c1f2e4319a=
53500864f<br>
+<br>
+CVE: CVE-2026-119379<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/sqlite/sqlite/com=
mit/64459c87cc702d600704fb77ee40ca1782398a52">https://github.com/sqlite/sql=
ite/commit/64459c87cc702d600704fb77ee40ca1782398a52</a>]<br>
+<br>
+Signed-off-by: Jo=E3o Marcos Costa &lt;joaomarcos.costa@bootlin.com&gt;<br=
>
+---<br>
+ sqlite3.c | 9 ++++-----<br>
+ 1 file changed, 4 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/sqlite3.c b/sqlite3.c<br>
+index 2b1e6b9..88b1810 100644<br>
+--- a/sqlite3.c<br>
++++ b/sqlite3.c<br>
+@@ -228393,9 +228393,9 @@ static int sessionChangesetApply(<br>
+&nbsp;&nbsp; int schemaMismatch =3D 0;<br>
+&nbsp;&nbsp; int rc =3D SQLITE_OK;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Return code */<br>
+&nbsp;&nbsp; const char *zTab =3D 0;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; /* Name of current table */<br>
+-&nbsp; int nTab =3D 0;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Result of sqli=
te3Strlen30(zTab) */<br>
+&nbsp;&nbsp; SessionApplyCtx sApply;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* changeset_apply() context object */<br>
+&nbsp;&nbsp; int bPatchset;<br>
++&nbsp; int bNew =3D 0;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* True for first=
 entry of new table */<br>
+<br>
+&nbsp;&nbsp; assert( xConflict!=3D0 );<br>
+<br>
+@@ -228411,15 +228411,16 @@ static int sessionChangesetApply(<br>
+&nbsp;&nbsp; if( rc=3D=3DSQLITE_OK ){<br>
+&nbsp;&nbsp;&nbsp;&nbsp; rc =3D sqlite3_exec(db, &quot;PRAGMA defer_foreig=
n_keys =3D 1&quot;, 0, 0, 0);<br>
+&nbsp;&nbsp; }<br>
+-&nbsp; while( rc=3D=3DSQLITE_OK &amp;&amp; SQLITE_ROW=3D=3Dsqlite3changes=
et_next(pIter) ){<br>
++&nbsp; while( rc=3D=3DSQLITE_OK &amp;&amp; SQLITE_ROW=3D=3DsessionChanges=
etNext(pIter, 0, 0,&amp;bNew) ){<br>
+&nbsp;&nbsp;&nbsp;&nbsp; int nCol;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; int op;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; const char *zNew;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; sqlite3changeset_op(pIter, &amp;zNew, &amp;nCol, =
&amp;op, 0);<br>
+<br>
+-&nbsp;&nbsp;&nbsp; if( zTab=3D=3D0 || sqlite3_strnicmp(zNew, zTab, nTab+1=
) ){<br>
++&nbsp;&nbsp;&nbsp; if( bNew ){<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 *abPK;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bNew =3D 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D sessionRetryConstraints(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; db, pIter-&gt=
;bPatchset, zTab, &amp;sApply, xConflict, pCtx<br>
+@@ -228454,7 +228455,6 @@ static int sessionChangesetApply(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D SQLITE=
_NOMEM;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nTab =3D (int)strlen(zTab);<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sApply.azCol =3D (const c=
har **)zTab;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }else{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int nMinCol =3D 0;<br>
+@@ -228506,7 +228506,6 @@ static int sessionChangesetApply(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
Apply.bStat1 =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nTab =3D sqlite3Strlen30(zTab)=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.45.3.bb<br>
index 1ff7c4f2ee..9dceb63d98 100644<br>
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb<br>
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb<br>
@@ -14,6 +14,7 @@ SRC_URI =3D &quot;http://www.sqlite.org/2024/sqlite-autoc=
onf-${SQLITE_PV}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-119374-pre1.patch">file://CVE-2026-119374-pre1.patch</a=
> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-119374-pre2.patch">file://CVE-2026-119374-pre2.patch</a=
> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-119374.patch">file://CVE-2026-119374.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-119379.patch">file://CVE-2026-119379.patch</a> \<br>
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

--_000_PH0PR11MB7616C0DB999DA88F6ECE091BD3422PH0PR11MB7616namp_--
