Return-Path: <madmarri@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA601C83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 04:32:39 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web10.13386.1752813149801956865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 21:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Pr7JZdQ3;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: madmarri@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10271; q=dns/txt;
  s=iport01; t=1752813149; x=1754022749;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=SaV7yvjeApCXPHZ/AWkgYrikJ4IusL1yopDJ5ghOI8o=;
  b=Pr7JZdQ3KFSer3ZmJzdU/2AYDauFeI4tJgbpJWzEYY+RqXk5wJ+InYN3
   MJx22lGcrhoqabw95QwpysyldHBakmLywbQhCpo8n7kCzYDV7N1OUqBx+
   aKhWCsXyB3sMh79apv0frqAe4I7K7GxVdtBtaRte5T5Y+4nWI1q8TBdsJ
   WK74fYo6uGufQsS+YovCwASeXxHu91hC7sS4+K8QgUueQClB8RXhmVrSi
   vSCrYMHSKkjS9Kt64zPv/BoJ5McjsZsdW1ji43OumnMWP9GX58ILAwMbd
   /Ae6dQEo2YmA3+/BodK6Qao8MEAEODOLid76CpdyqCZritxP3Q6NaNkQ4
   Q==;
X-CSE-ConnectionGUID: hcD6JuB7TBitUbcueRbZYg==
X-CSE-MsgGUID: AnS0BTP/Qf6EVnkB9N1s2Q==
X-IPAS-Result: =?us-ascii?q?A0ASAAAkzXlo/4oQJK1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUAlgRoGAQEBCwGBQAEwUgd3AoEcSYggA4RNX4h2A5dCglGEBYF/DwEBA?=
 =?us-ascii?q?Q0CLgEOFAQBAYUHAowRAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4V7AQyGWgEBAQEDAREVUhACAQgRAwEBAR4RJwodCAIEDgUIG?=
 =?us-ascii?q?oJhghwWPAMBEAalFwGBQAKJWho3eIEBM4EBg1oFCQJD23IGGIExAYhQASqBM?=
 =?us-ascii?q?4QOAYR3JxsbgXKBV3kugUE+gQWBXAEEgTQrHoN1gi8EgQ6BFIECFB2DR4ZzT?=
 =?us-ascii?q?oU2BQYGgQVGhixSciIDJjMsAVUTFwsHBYEgQwMqNDEjSwUtHYEnfoQYhCgrT?=
 =?us-ascii?q?4IidYF5Wj+DVBIMBm0PBoEYGkoCAgIFAkNFdEADC209NxQbBQSBNQWRCRdCg?=
 =?us-ascii?q?yYBgQMKASsiLQt3QhmTERQQAUF3jh6jdAoog3SMHo09iDEXhASNEplTmQYii?=
 =?us-ascii?q?WeDf5sMAgQCBAUCEAEBBoFoPIFHCwdwFTuCZwlJGQ+OLRaDXoF/gxS7DHg8A?=
 =?us-ascii?q?gcLAQEDCYZIhmmBfQEB?=
IronPort-PHdr: A9a23:R4XLLBUHhDdDigcHfDM2q3YZt6rV8K3PAWYlg6HPw5pUeailupP6M
 1Oav7NmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:OKUdtKAF92fYyxVW/3Hiw5YqxClBgxIJ4kV8jS/XYbTApDIi1DcOn
 zRJDTrUO/3eNGqmf9lzb4mz8UpQ6JTdmtdiOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZuCCaF/H9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357gXWthh
 fuo+5eCYAD8hGYvWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEw/5CUmMrF9Ik0OdrPGtF6
 PEiIgI8YUXW7w626OrTpuhEj8AnKozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxAMmoHgBfoO3WjPn8SAZ47lf2yh1H0ciZTrxSeoq9fD237kVQsj+S2aIaIEjCMbexTpR6ym
 lqBxmqnLy8cN/bO72OeqEv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvOS6AeCDW9CRTlEADA7iPILqfUR/
 gbht/viBCdkt/ueTnf1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:tf8dM6wnPDzvPaTjXXgTKrPxaugkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ5+xoWJPtfZvdnaQFh7X5To3SLTUO2VHYYr2KgrGSuQEIdxeOktK1kJ
 0QDJSWa+eATGSS7/yKnTVQeuxIqLLogcLY4Ns2jU0dMT2CAJsQljuRfzzraXGeMzM2fabReq
 DsgfavjgDQCkg/X4CQPFVAde7FoNHAiZLhZjA7JzNP0mOzpALtwoTXVzyD0Dkjcx4n+9ofGG
 7+/DDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijsohzAXvUjZ5Sy+BQO5M2/4lcjl9
 fB5z06Od5o1n/Xdmap5TPwxgjb1io04XOK8y7bvZKjm729eNsJMbsHuWtrSGqe16PmhqAk7E
 t/5RPci3OQN2KZoM2y3amSa/ggrDvFnZNrq59gs5UYa/pfVFeUxrZvoX+81/w7bXjHAIxLKp
 gaMOjMoPlRal+UdHbfoy1mx8GtRG06GlOcTlEFodH96UkaoJlV9TpS+CUkpAZLyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZQ2PLtBJB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8Wo/YVjnB8GC1IBCthrNXGK+VzLwzdw23ek0hpTsAL7wdSGTQlEnlMWt5/0ZH83AQv
 62fIlbBvfyRFGeUbqhHzeOEqW6BUNuJvH94OxLL25mivi7XbHXig==
X-Talos-CUID: 9a23:SJLaQmwP7Wy7HhkpYNHrBgUUEex7UGD3k0v6IlOFA210RYefe26frfY=
X-Talos-MUID: 9a23:AlKDCQljr9ouO3O3jvwjdnpLMvwwyZiWT3kDz7g4vcquZAopIG2k2WE=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Jul 2025 04:32:28 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id BA162180003CC
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 04:32:28 +0000 (GMT)
X-CSE-ConnectionGUID: A4CRVsKfRtKMYfuY+/mxlA==
X-CSE-MsgGUID: 3HTZ3rNMQg6P5/6lz6ta+Q==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.16,320,1744070400"; 
   d="scan'208,217";a="35003263"
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Jul 2025 04:32:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a10M/d3iP5H9DEIO8nVpg1QXEKAcVqgXuTEvOiTF0nhhZQgj6g/jB6g7sTWCnlAlCpxM6LwEj6kvvDRv8Oyxy3llyXOCsyXfBZZEV5P3OCEIn9TdziCHautdl4G8kYoOz44jN+X4b0svwWhcw7MlNDYNolFQWqIA/75dv63uEgP56QscOKtDZDBED4ESEoMOYc8MHm53k+wVKMHV3tLESDDzU/sPA24tTVO5XJOV7N6dGIVP/jnoIAfBBpiyM/7w0JBk1m89wCgIe6w6jpLVkd2pJIiAgG6Uo3oX2WCvCsuheFIx6vQ2JeS17GxfB7Kv4V++8k4Z2Ze3qGgJbn9ZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaV7yvjeApCXPHZ/AWkgYrikJ4IusL1yopDJ5ghOI8o=;
 b=ox8+bmNgeu/O8PPz1VhblLOjmkVOpNH8fcjkLKgv3FxzR6FWD/A1OKZtpbk0yC8pNb1dbB+mwi4VVNBO5XGH2BLTnactEEKVZBehH/nNUPdvOTKjJgJm9I9e2KBTlwB1A0Gj9Oinr7ioKboY3+aVFN+suJzxMDpXPgHuJZ87O0q9viG+/JbRWkcff9ei8/HFfoultoK+PIO8yv5ZNhOVNnY+Dh64gPNj0MXI5G4yM7N+z0e+npykmHNZzQRqkSjm1yai+Q3oQDLQTELxhJkjmNMvt1ShPBpkQLQL/nESkZ/Bf6immv4cILNz4K2brnNdOQIyxjHsvXn89HrCQzNG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SJ0PR11MB5677.namprd11.prod.outlook.com (2603:10b6:a03:37e::22)
 by SA2PR11MB5113.namprd11.prod.outlook.com (2603:10b6:806:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 04:32:25 +0000
Received: from SJ0PR11MB5677.namprd11.prod.outlook.com
 ([fe80::d83d:c581:8bef:dbd0]) by SJ0PR11MB5677.namprd11.prod.outlook.com
 ([fe80::d83d:c581:8bef:dbd0%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 04:32:25 +0000
From: "Madhu Marri -X (madmarri - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<madmarri@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] qemu 8.2.7: Fix CVE-2024-8354
Thread-Topic: [OE-core] [scarthgap] [PATCH] qemu 8.2.7: Fix CVE-2024-8354
Thread-Index: AQHbfug04FMZtTerwEupWqnGUlRyM7Q4O+Qi
Date: Fri, 18 Jul 2025 04:32:25 +0000
Message-ID: 
 <SJ0PR11MB5677445C35FFE9413CA754DACD50A@SJ0PR11MB5677.namprd11.prod.outlook.com>
References: <20250214135554.1137043-1-madmarri@cisco.com>
In-Reply-To: <20250214135554.1137043-1-madmarri@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5677:EE_|SA2PR11MB5113:EE_
x-ms-office365-filtering-correlation-id: bdc987e6-8ddf-49ab-8623-08ddc5b41868
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?WBMH0QjkcHmGbnhRsOoYX8z72Ex68xcg17O8Lc78//Lf0g2pzO2IiNl4cYP1?=
 =?us-ascii?Q?whsw3FRjtJCDa4Z92c0A4aKcfzSLxpv+/xmiP9zGvA0jbq6npJND0MGVffN8?=
 =?us-ascii?Q?PzLcDJFVYjC7YCV/cmUyE6XJp016NTTYEmgp8K+hYoYxk0PaLoa2NYxeGleW?=
 =?us-ascii?Q?CN+aeZi5xiv94hyuUlmHp9COtQhhMGwNF2zKyvIJCBcFgIPGNpO+c1TDTvnG?=
 =?us-ascii?Q?qX7D7TXLS4yevnEr37WD3TF3NdaZuKbpaiNXnR4g+08nFBx5nXKKoDBTnfhR?=
 =?us-ascii?Q?cR4NEou8+WY4Lazwp2SbQ8Q0I+SsxW+8vwAg3pnxPhmx7MorceLAiFFRVqIR?=
 =?us-ascii?Q?Vdyyidw0m28R4iZJmjzhlts+dkw6YqE99reFGRt16tnDqEIfpW7DgkuEjsyP?=
 =?us-ascii?Q?m9q8oLKF3+f4WLdQVHJtGQRoh7JGf2tE473nkD9bnrm2MqNaN6Glx8IawTTu?=
 =?us-ascii?Q?0m+lw/1udFR7OM7DrOP6OisO96KDq6OM9OH3PlQDfc18q/HVpyJZsER3Evzp?=
 =?us-ascii?Q?O+bWzd5H4WzsRVLdQRnAzIahCrmAjODM1NWTYtlwVKILisN4FKi9ZTLtuR7k?=
 =?us-ascii?Q?N6WSZvf+jORxnsdcVsjedH+/9aoDqWsTiZU+6LLQMqUkNtQTjFfXJP2M/7q1?=
 =?us-ascii?Q?JkDyCDhKp3QnPFB5dafi6MfN5cue/GlgIFTdDS/eCcaFQzRSMQGk34x26qx4?=
 =?us-ascii?Q?i7aHHb6wshoGZ+2tU04QJuPXvp3ueesZZjbr8x+KmumeAlgJ9SwsSpqmtbSF?=
 =?us-ascii?Q?mhrJklwoS1LVCrv/DAGmPhpdk4VNaF0dh9U9iRiT4q3TQIhAMT+BP54bOXAx?=
 =?us-ascii?Q?S72FOS6LO0JxJV4lVfWAA0RP4oK7dXUHJTuexv11hgf/rhJPmV1+0PEymUtx?=
 =?us-ascii?Q?Trb+FkX/g1e8OS04NAd6z1gxoel8+2GVwu+LM0U9mwNh5c08cdn8Uweg/6mH?=
 =?us-ascii?Q?nYtfz7zD+3mZWAd3cEyhmqoI4v7ms6CDfMewrAVj177mng1VLh6a/i+NNEJo?=
 =?us-ascii?Q?ztZOUGn5s89FKPiYR83Z1xXPvjngaCy2h3FhrUITTi3hR0Cvo/hD/7jGFOhV?=
 =?us-ascii?Q?MB9lH7wsAoRG2Z4oUFqMRlmqODuXLiKdl3YYUCJQGd2AuO1obD2MIkXocHNe?=
 =?us-ascii?Q?CQREyWWeyVm5O9YsAkfv7GBl39EYNA1YwWpPhpdkrdKf0sSSkr+Jquk7Dfee?=
 =?us-ascii?Q?pQ+atLOj60j6qM+Y//+JH36zaFFcgZ8PnBlTMLXwXQiPI9pjUKbxadGtay3N?=
 =?us-ascii?Q?QXyQD6h5VNsLRhZ4gRqXGhvx/71GfcLpBE/hteXlkVZ3Ya2BHt/tMRa5oUc1?=
 =?us-ascii?Q?Weg/PiTcWeY5xWh130SwGSHyzSH7rmc1+wkh7LP68RSRfUr8vAgBySu0rxsK?=
 =?us-ascii?Q?sg8hkJqPPZBpyYUVq9fceO5Sflz3miHhjfyMmPq+w2/uRff5CcPgsjkcUDHt?=
 =?us-ascii?Q?eiKMAf4hJ8GbmL56lKzJQeVzSXFbOBv1?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?itFcOZ+t3dDxec5HNwsBJ7ae0qpJSkOWfag9DPyPNXXmuJACLkId7c107Bwx?=
 =?us-ascii?Q?wG72wCQZGOQOjEPB0jLiCRRXozmhLmaRMOY3vftuhBPN7w84PPveSlCJl6vQ?=
 =?us-ascii?Q?hPzP7e7wQ9Ub/rwNMRLz/1hE4hRLCOdPX6KeQ46QOE7dmj4JXoNNeD2/v8Zq?=
 =?us-ascii?Q?Y2y/rTU5TmHRHykM3O1xS9yuTVxXD8sc5zKmMiDiwKub+3hgsHqFWv94EEtZ?=
 =?us-ascii?Q?rJyaArwFq13ete3FixOZi/GJeBQK5SZZ+chUVGWLp9+0huMUz/7UfYnpHABL?=
 =?us-ascii?Q?BQ6edVkZt2u3OeXFMfnO9xqPHiw1lZwBQxt18qP2RxFeHWf/Ab76uL6yzUWf?=
 =?us-ascii?Q?VCTFY+J2VodPv6F5FEl8H16PXsIrK4GbZR5Q0MRospbm/4jbzVxN5jbyNj+y?=
 =?us-ascii?Q?CYllSpRn8Z7M46bD+ReBR6MMXr6/QOv+RYo6h4K46c1Htm34eXsIFEJJTims?=
 =?us-ascii?Q?iSOIlB4me1EK2qGJGO/C5MC1BfosEXPspY07eVpw2mpIwqSIVuPNkbFaiV/S?=
 =?us-ascii?Q?AXRVWUlRqDf0yUjZW9Y5A36BrAifhUOwSx10pqqSffaVUJusgB/rYpN9CI5N?=
 =?us-ascii?Q?eK9+Rv449sUzGmN+X9b/yMmCqu0aEB5qZg5kJhOKMZAjaOdmCaQXrvA5ARJw?=
 =?us-ascii?Q?fcgSBKOta8H/OlmA18om2ujg3YhQUG7ybn+lY7U0y6kDCjKTwQ5R+Ildi8ju?=
 =?us-ascii?Q?VRcKYdYqDx+RPvn8TmhSs1Y7PTNz9BJwZ/2gty8XmOE0XqSOE1npeJauOOuf?=
 =?us-ascii?Q?v17v5SaTglfAsf4toCRgZLm5LDJiefRetWdLjPghpseD0qw4aEEg+dwFq7Bp?=
 =?us-ascii?Q?eDREgddyDjwSIbnx9X/OqSZOaY8WDr1iJilE1bD0+oyeQ3kwK/SG6it+ksy6?=
 =?us-ascii?Q?SRLPlr+n9ss+xNGaRf+40KWcxEl5uuLgRsHfMvSXzqgcJJo7knpxFdPEpZI0?=
 =?us-ascii?Q?j40990dixAXCVun0PVucsllpe3HwXmrvQUbabauZhX3YEKB5WiEg4UJ3OsD7?=
 =?us-ascii?Q?R6V4yuzBFO5YBKC9CxVyZLc04c8+l+TaRUGc0jgpJGcZczd2Pa8KToA0Vc8W?=
 =?us-ascii?Q?bI/YA4WPOswgej93t9mdRibiwbAnOixkqcooPVSg9JVygjrZCQa1Arcs1mXY?=
 =?us-ascii?Q?48bT8C5FHjyOchZ8hhUpF1bKWugt+IYBpv4YAF/QFEYF244w7C3H7lvFOQFd?=
 =?us-ascii?Q?tvElkGvVEQ/KzPOeAdvdY1fToxJsSdVN+7XM/7pp34Yftym2/SakcG+uEUkZ?=
 =?us-ascii?Q?HAQgnDGp7cIC3+2C5QSYyerb9b+s3TYdvWkyM+P8XcYHNtrnJwILKRuMoikk?=
 =?us-ascii?Q?7NZHLXoiIVMvcqvjvs89MeRAZE9uetfow8/soTM8ALgRngAXpSHy/JlCvd1K?=
 =?us-ascii?Q?zfgmaM4+SAWyxB7gPch1S0XrbKNfTCVEX1+c3tDne6AmHchvvmxZ+ph3PD6C?=
 =?us-ascii?Q?VoJEZNVN6Cl6YAhuazXQFz92ZzxcVCLvAPdNkjYe0CSku3f32OPmFnPFxuRI?=
 =?us-ascii?Q?OaGzou5X+BCnPfXlJ0bYRmrGcTow+SKmx92fkuhnsAF4GrAuuU4XK73dXoTe?=
 =?us-ascii?Q?H9OzZ6skvDBrVKy2mr8=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB5677445C35FFE9413CA754DACD50ASJ0PR11MB5677namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc987e6-8ddf-49ab-8623-08ddc5b41868
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 04:32:25.0649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jTMv5b3PVH4AFwdi2wJMEf/tG/ViNOKIRvgxQCBqG2TB3NWg2CaTub+fEujUia/ewmZB1NSdM2j1UlHndjFFlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5113
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 04:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220570

--_000_SJ0PR11MB5677445C35FFE9413CA754DACD50ASJ0PR11MB5677namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Could you please help in review this patch.

Best Regards
Madhu
________________________________
From: Madhu Marri <madmarri@cisco.com>
Sent: Friday, February 14, 2025 7:25 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>; Madhu Mar=
ri -X (madmarri - E INFOCHIPS PRIVATE LIMITED at Cisco) <madmarri@cisco.com=
>
Subject: [OE-core] [scarthgap] [PATCH] qemu 8.2.7: Fix CVE-2024-8354

Upstream Repository: https://gitlab.com/qemu-project/qemu.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-8354
Type: Security Fix
CVE: CVE-2024-8354
Score: 5.5

Signed-off-by: Madhu Marri <madmarri@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2024-8354.patch             | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 4dc6c104c7..b967b45b6b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,6 +40,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
            file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self=
-.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+          file://CVE-2024-8354.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch b/meta/rec=
ipes-devtools/qemu/qemu/CVE-2024-8354.patch
new file mode 100644
index 0000000000..6595803341
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
@@ -0,0 +1,42 @@
+From f84399128601942228f3decfa4304d86c3fc1a10 Mon Sep 17 00:00:00 2001
+From: Madhu Marri <madmarri@cisco.com>
+Date: Thu, 13 Feb 2025 12:19:44 +0000
+Subject: [PATCH] usb: Check USB_TOKEN_SETUP in usb_ep_get(CVE-2024-8354)
+
+USB_TOKEN_SETUP packet not being handled in usb_ep_get function.
+This causes the program to hit the assertion that checks for only
+USB_TOKEN_IN or USB_TOKEN_OUT, leading to the failure and core
+dump when the USB_TOKEN_SETUP packet is processed.
+
+Added a check for USB_TOKEN_SETUP to avoid triggering an assertion
+failure and crash.
+
+CVE: CVE-2024-8354
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2548
+
+Upstream-Status: Submitted [qemu-devel@nongnu.org]
+Signed-off-by: Madhu Marri <madmarri@cisco.com>
+---
+ hw/usb/core.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/hw/usb/core.c b/hw/usb/core.c
+index 975f76250a..df2aec5aca 100644
+--- a/hw/usb/core.c
++++ b/hw/usb/core.c
+@@ -741,6 +741,12 @@ struct USBEndpoint *usb_ep_get(USBDevice *dev, int pi=
d, int ep)
+     if (ep =3D=3D 0) {
+         return &dev->ep_ctl;
+     }
++
++    if (pid =3D=3D USB_TOKEN_SETUP) {
++        /* Do not handle setup packets here */
++        return &dev->ep_ctl;
++    }
++
+     assert(pid =3D=3D USB_TOKEN_IN || pid =3D=3D USB_TOKEN_OUT);
+     assert(ep > 0 && ep <=3D USB_MAX_ENDPOINTS);
+     eps =3D (pid =3D=3D USB_TOKEN_IN) ? dev->ep_in : dev->ep_out;
+--
+2.44.1
+
--
2.44.1


--_000_SJ0PR11MB5677445C35FFE9413CA754DACD50ASJ0PR11MB5677namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Team,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Could you please help in review this patch.&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Best Regards</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Madhu&nbsp;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Madhu Marri &lt;madma=
rri@cisco.com&gt;<br>
<b>Sent:</b> Friday, February 14, 2025 7:25 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external(mailer list) &lt;xe-linux-external@cisco.com&g=
t;; Madhu Marri -X (madmarri - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;ma=
dmarri@cisco.com&gt;<br>
<b>Subject:</b> [OE-core] [scarthgap] [PATCH] qemu 8.2.7: Fix CVE-2024-8354=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Upstream Repository: <a href=3D"https://gitlab.com=
/qemu-project/qemu.git">
https://gitlab.com/qemu-project/qemu.git</a><br>
<br>
Bug Details: <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-8354">htt=
ps://nvd.nist.gov/vuln/detail/CVE-2024-8354</a><br>
Type: Security Fix<br>
CVE: CVE-2024-8354<br>
Score: 5.5<br>
<br>
Signed-off-by: Madhu Marri &lt;madmarri@cisco.com&gt;<br>
---<br>
&nbsp;meta/recipes-devtools/qemu/qemu.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;.../qemu/qemu/CVE-2024-8354.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 42 +++++++++++++++++++<br>
&nbsp;2 files changed, 43 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patc=
h<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc<br>
index 4dc6c104c7..b967b45b6b 100644<br>
--- a/meta/recipes-devtools/qemu/qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/qemu.inc<br>
@@ -40,6 +40,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://download.qemu.=
org/${BPN}-${PV}.tar.xz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch"=
>
file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://qemu-guest-agent.init">file://qemu-guest-agent.init</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://qemu-guest-agent.udev">file://qemu-guest-agent.udev</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2024-8354.patch">file://CVE-2024-8354.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&=
quot;<br>
&nbsp;<br>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch b/meta/rec=
ipes-devtools/qemu/qemu/CVE-2024-8354.patch<br>
new file mode 100644<br>
index 0000000000..6595803341<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch<br>
@@ -0,0 +1,42 @@<br>
+From f84399128601942228f3decfa4304d86c3fc1a10 Mon Sep 17 00:00:00 2001<br>
+From: Madhu Marri &lt;madmarri@cisco.com&gt;<br>
+Date: Thu, 13 Feb 2025 12:19:44 +0000<br>
+Subject: [PATCH] usb: Check USB_TOKEN_SETUP in usb_ep_get(CVE-2024-8354)<b=
r>
+<br>
+USB_TOKEN_SETUP packet not being handled in usb_ep_get function.<br>
+This causes the program to hit the assertion that checks for only<br>
+USB_TOKEN_IN or USB_TOKEN_OUT, leading to the failure and core<br>
+dump when the USB_TOKEN_SETUP packet is processed.<br>
+<br>
+Added a check for USB_TOKEN_SETUP to avoid triggering an assertion<br>
+failure and crash.<br>
+<br>
+CVE: CVE-2024-8354<br>
+Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/2548">h=
ttps://gitlab.com/qemu-project/qemu/-/issues/2548</a><br>
+<br>
+Upstream-Status: Submitted [qemu-devel@nongnu.org]<br>
+Signed-off-by: Madhu Marri &lt;madmarri@cisco.com&gt;<br>
+---<br>
+ hw/usb/core.c | 6 ++++++<br>
+ 1 file changed, 6 insertions(+)<br>
+<br>
+diff --git a/hw/usb/core.c b/hw/usb/core.c<br>
+index 975f76250a..df2aec5aca 100644<br>
+--- a/hw/usb/core.c<br>
++++ b/hw/usb/core.c<br>
+@@ -741,6 +741,12 @@ struct USBEndpoint *usb_ep_get(USBDevice *dev, int pi=
d, int ep)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (ep =3D=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &amp;dev-&gt;ep_ct=
l;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (pid =3D=3D USB_TOKEN_SETUP) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Do not handle setup packets=
 here */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &amp;dev-&gt;ep_ctl;<br=
>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; assert(pid =3D=3D USB_TOKEN_IN || pid =3D=3D USB_=
TOKEN_OUT);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; assert(ep &gt; 0 &amp;&amp; ep &lt;=3D USB_MAX_EN=
DPOINTS);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; eps =3D (pid =3D=3D USB_TOKEN_IN) ? dev-&gt;ep_in=
 : dev-&gt;ep_out;<br>
+-- <br>
+2.44.1<br>
+<br>
-- <br>
2.44.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ0PR11MB5677445C35FFE9413CA754DACD50ASJ0PR11MB5677namp_--

