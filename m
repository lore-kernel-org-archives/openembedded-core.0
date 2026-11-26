Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10064.1795681320308497702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 00:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lTzNq234;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11565; q=dns/txt;
  s=iport01; t=1795681320; x=1796890920;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=ScBmkywDi3D7znlR+D88Q7WJlB7ZPwXUKHw2qNnfn28=;
  b=lTzNq234dVBKSdWaAWi4erZjkB5cU7p/A2crITyvaooSa74AOjJuw9hs
   Fda5sl3inrooNQaf3OeWvm6LGDTxwPb2Lc0twB9qbZl4om/o1UPC5dNXL
   IjdW+T/7U1ukggsDvQfa+zDvYCnwieci60dcbbFsNQO+n7Y1RQb59YNdz
   ppx3kI9uhSQtOBmpGAPjFHnnoPR4eT+bCfCz/BGtbkCOfeD2DaIZeTNvv
   PAEMIAFLGqzKmO6neouvdndosnqZ/+m5Ehx28XvrIJtytujGgT2cTPcju
   rWKC+hOvuBlS0ZvLnMf0Q78fmBMC8jzdCxMGE33n0k0jNdlof7yK+VuvK
   g==;
X-CSE-ConnectionGUID: Rodu+sdERIe4LXCpfDOWhQ==
X-CSE-MsgGUID: rdCr7BXGQQauABLDyZGvSg==
X-IPAS-Result: =?us-ascii?q?A0BoAgDl6wdr/4sQJK1aHgEBCxIMZYEgC4E9MVMWdYERE?=
 =?us-ascii?q?kmIIwOFK4h6A54pFIFqDwEBAQ0CLgEVDQQBAYQ/RgKOIwImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgEBAQEDAREVJAEtEAIBC?=
 =?us-ascii?q?BEDAQEBFhknCh0IAgQBCQQFCAEZgmGCHVcDAQIOrHZzAoodeIEBM4EBgykBP?=
 =?us-ascii?q?wJD3AMBCxQBgTiFCDqDHwEBK4E1gl6BIxgBG4RjJxsbgXKBFUKCaj6BBYFcA?=
 =?us-ascii?q?QECgRcOOx4eAYNXgjAEgiJ6EhuBOR5kjBEBAYFJiFxSciIDJjMsAVUTFwsHB?=
 =?us-ascii?q?YElEDMDIAovLQIUDSIPGgUtHXAMJxIpFxEeWBsGBRIgKkBDMCuBEoEDXYErK?=
 =?us-ascii?q?F0BAh9GLRWBdQKCUYEjXQIBSUEOB0VTCSU+BRJHJCIIEgkBExosCoEaNTwJJ?=
 =?us-ascii?q?j8VDFsMCxoFGkcIAgsCDHQoERATHRwkLwUZJjwbCoEMJx0eGQ4CKQYWIQtDb?=
 =?us-ascii?q?T03Bg8ZAwSBNQWTMGKDHYEOASoBgj2ifEeBNaF9CiiDeYwkjT6IMheEBI0Um?=
 =?us-ascii?q?VsLmH0jjWebEAIEAgQFAhEBAQaBaDyBRwsHcBWDIglKGQ+OLhaDYIF/gxTJJ?=
 =?us-ascii?q?3kCAQgyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-PHdr: A9a23:RYtIqB8UaxMZ3P9uWBDoyV9kXcBvk7zwOghQ7YIolPcXNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8EqaQ==
IronPort-Data: A9a23:/mRzP6t1vNpDtfuPa3lagDH8QufnVA1fMUV32f8akzHdYApBsoF/q
 tZmKWCOOK6IMTb3Ldtwadi/8E9XsMfWzddqTFRvqyoxRS5GgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvZ9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwwOF7HCJV+
 dEiCT1RSiCon+ya5427c7w57igjBJGD0II3s3Vky3TdSP0hW52GG/+M7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWYQZ/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9K4TbHZwExx7Hz
 o7A1371KQtFHuyw8AOM71uGosPerwzlY41HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmQHY909v8hwTjsvv
 rOUo+7U6fVUmOT9YVqW96yfqnW5Pi19EIPITXFaJefZy7EPeL0Osy8=
IronPort-HdrOrdr: A9a23:3Pk7c6OUW8BgUcBcT/z255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UgssREb9expOMG7MBXhHO1OkPgs1NaZLUbbUQSTXftfBOfZslnd8mjFh5FgPM
 RbAuZD4b/LfCVHZK/BiWHSfadDsby6GeKT9JvjJhxWPHhXgtRbnnxE43GgYzVLrWd9dP0EPa
 vZzPBq4xCnfnMaZNm6AH4qY8jvzuegqLvWJTQ9K1oC8gehsROEgYSWLzGomjsOWTJGxrkvtV
 PCjxH44aubtfS6wA/31mPY7Zha8eGRi+erAvbituElbhHXziq4boVoXLOP+Bovpvu01VosmN
 7Q5z89IsVa8RrqDyKIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FcyHe91ErsLhHoe
 B2NiOixt9q5CH77WPADuvzJldXf42P0CMfeNso/jhiuE0lGedsRMIkjRho+dw7bVLHAcgcYZ
 pT5YfnlbZrWGLfSWzFtW9yx9HpdHEyEhCaBnUmgKWuomJrdLQT9TpF+CTZ9U1wqa4VWt1K4f
 /JPb9vk6wLRsgKbbhlDONEWsevDHfRKCi8el56DG6XXJ3vAUi94KLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwbrBdeV1JNG/xjRSCHlNA6dhv129tx8oPnxVbDrOSqMRBQnlNahuewWBoneV+
 yoMJxbDvf/JS/lGJpP3Qf5R55OQENuHfE9q5I+QRaDs8jLIorluqjSd+vSPqPkFXI+Vmb2Eh
 I4LXHOzQV7nzaWs1PD8W/ssinWCznC1IM1FLKf5OQawpUMMIpX2zJl+2hRzvv7XQF/jg==
X-Talos-CUID: =?us-ascii?q?9a23=3AjmKzoGpJOXeu9FmGW6058o3mUfoifmCe13v9GW6?=
 =?us-ascii?q?1VUJZY6WbZXiv+Joxxg=3D=3D?=
X-Talos-MUID: 9a23:bcLurglz0Y7RLzqWyjlZdnp4OOxyvI6eJ3k0mIgvke2oJB5fJQyS2WE=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Nov 2026 08:21:54 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id F41A11800022C
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:21:53 +0000 (GMT)
X-CSE-ConnectionGUID: rgz4j6RCRDqcCnapH2qxaw==
X-CSE-MsgGUID: 2XUF+ehCSHCifg6KMmlq0g==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,234,1787011200"; 
   d="scan'208,217";a="93972889"
Received: from mail-northcentralusazon11012059.outbound.protection.outlook.com (HELO CH5PR02CU005.outbound.protection.outlook.com) ([40.107.200.59])
  by alln-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Nov 2026 08:21:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/RAXeC+LbqOevi1N0KZx0Ce5iPcY6JJ3ZVAHQNL7JEAIu52V/mYx03xJ5oIdBlZsKVBmfUI3pyOJRMANWHE8IQveCCnWKgOCyDXT9X0df2Knxh/t931HGBGR17b5PO+/HoiMkRfKoWrgudS6LTYu0RbIrQcwGbKizSG4wGWAVkfREUp6qRqV9fJAh/unGYBs7H9ZKWbUUhqeRqW8HoOMKE9ogVcnpQe/AOD4sP1uiTZVrNfqXEefbF6GKQRVmWlqc75BzokeEcouFsyyQCAr65sOELwMCHlkBX74N1DVpXcv2I2ttCU9giPyuZZcFa1JaDjJfgEAH9mrizwSp6qBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScBmkywDi3D7znlR+D88Q7WJlB7ZPwXUKHw2qNnfn28=;
 b=qvY5JpPQr+Zn8grf/dxoDZIo63WP0J5A7fTRCRBkmimeHgbq724RqG/TwQV1926UJ8BUDjqsxYNMe6KeRKsBq29pG5Z8G4HXLHv74QaiwuIyAqn95UNRxBW5tBjcr3+0gxgs4zDbafi0vS24fqoIOnVf+ezoyF94ExOcxpM7C2vyzdw9q4hVCycWYqFgC1L1n2t/XbdWfLB5/DOWRsXXpkeIBXnY4gsX1lBHOBdEmT6gzZOgTD/H9LjvVUgpQuiOGIG0lO62VmKA9H2C37QUC877g1LkmeATLmOkfiwsFlD9+7ZC28zIg/vwXKmat1aNh4sExwZr5tP2cle73kmZ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 by DS0PPFC7FC39169.namprd11.prod.outlook.com (2603:10b6:f:fc02::50c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 08:20:51 +0000
Received: from PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340]) by PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340%6]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 08:20:51 +0000
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<devanshp@cisco.com>
To: "joaomarcos.costa@bootlin.com" <joaomarcos.costa@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	"yoann.congal@smile.fr" <yoann.congal@smile.fr>
Subject: RE: [OE-core] [scarthgap][PATCH v2 1/3] sqlite3: fix CVE-2026-119373
Thread-Topic: [OE-core] [scarthgap][PATCH v2 1/3] sqlite3: fix CVE-2026-119373
Thread-Index: AQHdfO0KmdmntJqYPE+IEAPy7l+tYrdAA80J
Date: Thu, 26 Nov 2026 08:20:51 +0000
Message-ID: <PH0PR11MB7616D086D123CA668099DA27D3422@PH0PR11MB7616.namprd11.prod.outlook.com>
References: <20261125145239.4173659-1-joaomarcos.costa@bootlin.com>
 <20261125145239.4173659-2-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261125145239.4173659-2-joaomarcos.costa@bootlin.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7616:EE_|DS0PPFC7FC39169:EE_
x-ms-office365-filtering-correlation-id: 0a3580f2-cfd3-496e-a0ad-08df4b962f06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|4143699003|12006099003|261009223027099003|22082099003|18002099003|13003099007|8096899003|260925021311599003|260925021911599003|260925022911599003|10067099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info: IDUKoDa89kcpQ9H5MQDwnfdFBtqtQK4w2R8sNCNgDSFk9NJ5Kwzu5RLm4WL77BaaWKJEs6h3oy/Bnx4LwAT9d6eoPxxbrOlekhzB8xUWMAYFSjMat+t92fDZL8FDyd/joimqykYwTttnlhDCPOg5qZo7bSdVhfEbW3kRtDIwRZpFMdqnsdRILdRcaegSsDckbRgGTAIuU8qckz9IY/OdWQfJgNEb2SOANySfz2qWkG4voRKZs+jXcA40elln/Nj29DCuGDkkqqF+wib52/vogJMGpsbIQ/UVKkmnRsUbpSf51gj/L80V+sWahDEKgu6/k8l3EQN/xcM+Mf0gVKrXVUZ2xRMMI3wPoTTrlvJfAIos46APc0QFkQQCobrQsbYLuirTr8MTAfDstux2IvaesDLxwBKTUnnq9hBVKb+sb2lPsQ7GvB/dm74+jOeXFwyFNSiYjDztXB7cWaBIrL+ZlCQzp5rxTu5pvD72mGg/Y1Rpajt8fvYX2lso2J3Vox1nFS8+lFcwClo76HusjBCAMVPC+t9UONuLCY0u/EMJH9/lzoUE8GQPnf96BF1gKsE+2O6WZW/opJ5/z7fSrXDaX9BvE0QdCZ9tHEbWOevHnbmVbVr6cJ2pnbJDjWYwkeQlEJ3PDO9jWNJgi8gdw7Rj5aiCDnZjIPtHuGYdysP+n1Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7616.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(12006099003)(261009223027099003)(22082099003)(18002099003)(13003099007)(8096899003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NLWlaaC2skYOR+Ue5lTXXFjjbIDvOdizr/sQB0WF9uej0l4l1Dk3Za4PKg?=
 =?iso-8859-1?Q?u+2JakH3nM0esp10XaARuEge4OGM3mwvslw0/Vd4qYee4rhxm5+fzCGF6E?=
 =?iso-8859-1?Q?zzemEG0QSopz6FVAlMDd8H3hUHDyBJCg+sVgkNBNFe49eor1PzR6+q9PjR?=
 =?iso-8859-1?Q?4Zokiu9x85/IUDp8Yr4UbPv5r7SdhxMG1ZKP7yCkmBZ1j+Gvre/U19Radp?=
 =?iso-8859-1?Q?L3NfHuUath6d/c/N4+6KLjCCwtYi9pc0hH1jW3RLeg+4nPdURDjg1bOyS9?=
 =?iso-8859-1?Q?oqdh7574X6drbSCfgldOLN6y3X156Vy9f19cep69wSAk3Rp4+IJa5KAkuv?=
 =?iso-8859-1?Q?FAZIL2VHXLLo5odeoNWnYsfbIaMajGNvvRjXPj2NzEM4W5uqTrTXN442hb?=
 =?iso-8859-1?Q?V6Fm5Mu6p8qX01cV13N06gbNVTGetvnwP3rY20/uvHKThW5EwudDtcjEaE?=
 =?iso-8859-1?Q?KrXz2gum/VwAy5H9ZF6MDXhEXd4Eakl1rlxamDEmMCpbPivZ4nbfwe3e3G?=
 =?iso-8859-1?Q?8Vc0V3ZxibFVNoKrapfRRox7myjeMi36wH6WJ+uZa6OUxueoF/E4tn7XoC?=
 =?iso-8859-1?Q?odhyLL5PYMkhCDZpv1EdAJhuJv4jxqDwakdRPVbI6tQMYW/s0oQKFvFnXE?=
 =?iso-8859-1?Q?uBYeyMavGrAHa0K+3XkH+hQW1vPDSY5ij/38lxYy7aYuh6cPHAqgD9+SHn?=
 =?iso-8859-1?Q?GYU5xmKDTSbX4QdvW7CBfYg0FRDgr5ZSew6wnKRwZwV5LfTpqvJqYEfnha?=
 =?iso-8859-1?Q?Yg+Xe2duEKWQjSvxx3oDAqKEkzYxQWri9mB2KEzqwKn02ccd//eGc9JqIS?=
 =?iso-8859-1?Q?sJJlSdFruMtDrZjvaNHJNAGNVN/d8/o9SnJNwb2OUgSyp4aUrAZIdW+EZ0?=
 =?iso-8859-1?Q?P+Xy/8aOBZ+0ceds/EKmSRa6LDg5Rsd4e2lqRtnTfpeea76skzRZjXraCJ?=
 =?iso-8859-1?Q?JZv6FQHzab141cAwZ8Ld2pBJEtjc9Ze9/7eyf4W6VzpATTOwGvW7LCLam+?=
 =?iso-8859-1?Q?dNrkR6bFsFFJZ+NsCMDU0knCPqKn42VW+hgT0Kqxm1metKvGnNWW07dLFz?=
 =?iso-8859-1?Q?0PZ5lLHQNhRfVNwsnrq/iB86it8S+QFFGpQOzSSP9UuC3OQcr5JY7Ygo0I?=
 =?iso-8859-1?Q?SwD/iNCPk1cAbZogAGTABEKEWQKqkPgQtq92K/RP9JnhdoeqWig3N6GHvl?=
 =?iso-8859-1?Q?q3CGJkEJ9awcH06n1T1/qU51vmIEOaqAEtou7qYxFv/PtKxD4cEdLQwxpK?=
 =?iso-8859-1?Q?/4F1jz+pasT+QibibHcJxJc5SL6boGk+i9zeSauKiykZ3nLLqgOZiG/cbh?=
 =?iso-8859-1?Q?cssKmcnSjDhXVzqWIMBhY3O09fm+nBKO1OFZv0b2RR/jPwAgFl5UjWtRKa?=
 =?iso-8859-1?Q?N1aHyCHDlbmfdBtoS26NqsmkJdDrPQAmqhLDM4Jt8WMxyu9pK4j3+dor4I?=
 =?iso-8859-1?Q?+R7zTMGCoX04RpXutT6fzHEBSMIZiBxOUFYtjUWSvM+dCiE+Kn9ayLCrU5?=
 =?iso-8859-1?Q?GNDjd+0BmC5WSst9BnqzqnZlWBMaeNO2adWjk1pzc5tQhmdtYCCWN4khNB?=
 =?iso-8859-1?Q?08Mijztq3MVgb0CXCQEBZsmOTYjOJgitbbIlomTtUCn/lremqqQgc6BWU3?=
 =?iso-8859-1?Q?CNe7kFqY1MC5t+dyRjoCc6LRHZAAypswcIrQVcUbM/ZA6KAvhwRVJ/QohU?=
 =?iso-8859-1?Q?wezImGtfg5Jh4N02TcSprt4ROmdIiXo4FPX3AihYaEtKhy2xd9Xxw2figq?=
 =?iso-8859-1?Q?5hfwYCcptPP10K3KDoKWMA49arcE52aDLiSdUlSq2Z8GVZK+Tg2zCE7Zb5?=
 =?iso-8859-1?Q?va1dtFqplcydHdHme+PHj6aRWkBEtRk=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB7616D086D123CA668099DA27D3422PH0PR11MB7616namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dha3QbvatDPmdcJGBdx0Ky149QlfS29zR5GKX7gBYYEaX2gqZA8+vmGgod6O5W0bQMVWxv7KAhHxCo10RLA3p41KMD4Iw5YevREB9orXnrnlrSbCOfrqy0afdiodkmjMA+Vjg/23A5vMoHK9O1SJeJo6c70+9oO2B48mGT9zz6s6DBJc0p9ToUqu7q9hYKh6dIbUMjpnJxphHsLzArjwLadH8gBj5JPd0aGMKOuGGtRiRv5/xcQ+xY7DtDjJ6RpNOG7DEclT/xqiQxHZfgfh4LDmWmMkNQAY1rpQg8x7NGs6CLGRhs3xs3XUkPXazfAWiDrcVu6OKQRMSp4+wmhN8Q==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7616.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3580f2-cfd3-496e-a0ad-08df4b962f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 08:20:51.5667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RcXr+B2+Tciii+u4jnYCfVwR6YIUaBu+Bl3Q3AwF/DdSjG7O/C1NxpC45Hl9AIR29XnZF19ewRbIlvw6eDhBtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPFC7FC39169
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-1.cisco.com [173.37.147.229];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251285

--_000_PH0PR11MB7616D086D123CA668099DA27D3422PH0PR11MB7616namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jo=E3o and Yoann,

Could you add a Backport Changes: section to the inner CVE-2026-119373.patc=
h header? The upstream fix changes ext/fts5/fts5_index.c, while this backpo=
rt applies it to sqlite3.c. Please also explain why ext/fts5/test/fts5prefi=
x2.test, manifest, and manifest.uuid are omitted.

Thanks,
Devansh
________________________________
From: Joao Marcos Costa via openembedded-core <joaomarcos.costa=3Dbootlin.c=
om@lists.openembedded.org>
Sent: Wednesday, 25 November 2026 14:52:37
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: thomas.petazzoni@bootlin.com <thomas.petazzoni@bootlin.com>; yoann.cong=
al@smile.fr <yoann.congal@smile.fr>; Jo=E3o Marcos Costa (Schneider Electri=
c) <joaomarcos.costa@bootlin.com>
Subject: [OE-core] [scarthgap][PATCH v2 1/3] sqlite3: fix CVE-2026-119373

This vulnerability, marked as High [1], was fixed upstream [2] since
3.54.0.

Backport the fix to sqlite v3.45.3.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-119373
[2] https://github.com/sqlite/sqlite/commit/e1c9934f9f11a499029abb020ea715a=
08970da80

Signed-off-by: Jo=E3o Marcos Costa (Schneider Electric) <joaomarcos.costa@b=
ootlin.com>
---
 .../sqlite/sqlite3/CVE-2026-119373.patch      | 48 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  3 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.pat=
ch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch b/me=
ta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
new file mode 100644
index 0000000000..ff89746e6c
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
@@ -0,0 +1,48 @@
+From ab37658e91b4a19923eb930a9e2ee62b561a4ec6 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.costa=
@bootlin.com>
+Date: Wed, 4 Nov 2026 16:38:46 +0100
+Subject: [PATCH] In fts5, account for the possibility of negative docids w=
hen
+ allocating a buffer to store the results of merging detail=3Dnone prefix =
lists.
+ Fix for report [bugs:/info/2026-08-04T08:49:27Z | 2026-08-04T08:49:27Z].
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+FossilOrigin-Name: a7f8c92f623e9cbe8a61266d949916acc9e5110c94dff4aa6fd1ad2=
ea8a60d4e
+
+CVE: CVE-2026-119373
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e1c9934=
f9f11a499029abb020ea715a08970da80]
+
+Signed-off-by: Jo=E3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ sqlite3.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 6acf46a..2b1e6b9 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -244805,7 +244805,7 @@ static void fts5MergeRowidLists(
+   (void)nBuf;
+   memset(&out, 0, sizeof(out));
+   assert( nBuf=3D=3D1 );
+-  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n);
++  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n + 9);
+   if( p->rc ) return;
+
+   fts5NextRowid(p1, &i1, &iRowid1);
+@@ -244813,12 +244813,12 @@ static void fts5MergeRowidLists(
+   while( i1>=3D0 || i2>=3D0 ){
+     if( i1>=3D0 && (i2<0 || iRowid1<iRowid2) ){
+       assert( iOut=3D=3D0 || iRowid1>iOut );
+-      fts5BufferSafeAppendVarint(&out, iRowid1 - iOut);
++      fts5BufferSafeAppendVarint(&out, (u64)iRowid1 - (u64)iOut);
+       iOut =3D iRowid1;
+       fts5NextRowid(p1, &i1, &iRowid1);
+     }else{
+       assert( iOut=3D=3D0 || iRowid2>iOut );
+-      fts5BufferSafeAppendVarint(&out, iRowid2 - iOut);
++      fts5BufferSafeAppendVarint(&out, (u64)iRowid2 - (u64)iOut);
+       iOut =3D iRowid2;
+       if( i1>=3D0 && iRowid1=3D=3DiRowid2 ){
+         fts5NextRowid(p1, &i1, &iRowid1);
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.45.3.bb
index 975f3bdab8..e7c5bcdac4 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -10,6 +10,7 @@ SRC_URI =3D "http://www.sqlite.org/2024/sqlite-autoconf-$=
{SQLITE_PV}.tar.gz \
            file://CVE-2025-7709.patch \
            file://CVE-2025-70873.patch \
            file://CVE-2026-11822_CVE-2026-11824.patch \
-          "
+           file://CVE-2026-119373.patch \
+"
 SRC_URI[sha256sum] =3D "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270=
a5ee9a38191531"

--
2.55.0


--_000_PH0PR11MB7616D086D123CA668099DA27D3422PH0PR11MB7616namp_
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
Could you add a Backport Changes: section to the inner CVE-2026-119373.patc=
h header? The upstream fix changes ext/fts5/fts5_index.c, while this backpo=
rt applies it to sqlite3.c. Please also explain why ext/fts5/test/fts5prefi=
x2.test, manifest, and manifest.uuid
 are omitted.<br>
<br>
Thanks,<br>
Devansh</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri=
, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> Joao Marc=
os Costa via openembedded-core &lt;joaomarcos.costa=3Dbootlin.com@lists.ope=
nembedded.org&gt;<br>
<b>Sent:</b> Wednesday, 25 November 2026 14:52:37<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> thomas.petazzoni@bootlin.com &lt;thomas.petazzoni@bootlin.com&gt=
;; yoann.congal@smile.fr &lt;yoann.congal@smile.fr&gt;; Jo=E3o Marcos Costa=
 (Schneider Electric) &lt;joaomarcos.costa@bootlin.com&gt;<br>
<b>Subject:</b> [OE-core] [scarthgap][PATCH v2 1/3] sqlite3: fix CVE-2026-1=
19373</span>
<div>&nbsp;</div>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">This vulnerability, mar=
ked as High [1], was fixed upstream [2] since<br>
3.54.0.<br>
<br>
Backport the fix to sqlite v3.45.3.<br>
<br>
[1] <a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-119373">https://nv=
d.nist.gov/vuln/detail/cve-2026-119373</a><br>
[2] <a href=3D"https://github.com/sqlite/sqlite/commit/e1c9934f9f11a499029a=
bb020ea715a08970da80">
https://github.com/sqlite/sqlite/commit/e1c9934f9f11a499029abb020ea715a0897=
0da80</a><br>
<br>
Signed-off-by: Jo=E3o Marcos Costa (Schneider Electric) &lt;joaomarcos.cost=
a@bootlin.com&gt;<br>
---<br>
&nbsp;.../sqlite/sqlite3/CVE-2026-119373.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 48 +++++++++++++++++++<br>
&nbsp;meta/recipes-support/sqlite/sqlite3_3.45.3.bb |&nbsp; 3 +-<br>
&nbsp;2 files changed, 50 insertions(+), 1 deletion(-)<br>
&nbsp;create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-11937=
3.patch<br>
<br>
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch b/me=
ta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch<br>
new file mode 100644<br>
index 0000000000..ff89746e6c<br>
--- /dev/null<br>
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch<br>
@@ -0,0 +1,48 @@<br>
+From ab37658e91b4a19923eb930a9e2ee62b561a4ec6 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D &lt;joaomarcos.co=
sta@bootlin.com&gt;<br>
+Date: Wed, 4 Nov 2026 16:38:46 +0100<br>
+Subject: [PATCH] In fts5, account for the possibility of negative docids w=
hen<br>
+ allocating a buffer to store the results of merging detail=3Dnone prefix =
lists.<br>
+ Fix for report [bugs:/info/2026-08-04T08:49:27Z | 2026-08-04T08:49:27Z].<=
br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+FossilOrigin-Name: a7f8c92f623e9cbe8a61266d949916acc9e5110c94dff4aa6fd1ad2=
ea8a60d4e<br>
+<br>
+CVE: CVE-2026-119373<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/sqlite/sqlite/com=
mit/e1c9934f9f11a499029abb020ea715a08970da80">https://github.com/sqlite/sql=
ite/commit/e1c9934f9f11a499029abb020ea715a08970da80</a>]<br>
+<br>
+Signed-off-by: Jo=E3o Marcos Costa &lt;joaomarcos.costa@bootlin.com&gt;<br=
>
+---<br>
+ sqlite3.c | 6 +++---<br>
+ 1 file changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/sqlite3.c b/sqlite3.c<br>
+index 6acf46a..2b1e6b9 100644<br>
+--- a/sqlite3.c<br>
++++ b/sqlite3.c<br>
+@@ -244805,7 +244805,7 @@ static void fts5MergeRowidLists(<br>
+&nbsp;&nbsp; (void)nBuf;<br>
+&nbsp;&nbsp; memset(&amp;out, 0, sizeof(out));<br>
+&nbsp;&nbsp; assert( nBuf=3D=3D1 );<br>
+-&nbsp; sqlite3Fts5BufferSize(&amp;p-&gt;rc, &amp;out, p1-&gt;n + p2-&gt;n=
);<br>
++&nbsp; sqlite3Fts5BufferSize(&amp;p-&gt;rc, &amp;out, p1-&gt;n + p2-&gt;n=
 + 9);<br>
+&nbsp;&nbsp; if( p-&gt;rc ) return;<br>
+<br>
+&nbsp;&nbsp; fts5NextRowid(p1, &amp;i1, &amp;iRowid1);<br>
+@@ -244813,12 +244813,12 @@ static void fts5MergeRowidLists(<br>
+&nbsp;&nbsp; while( i1&gt;=3D0 || i2&gt;=3D0 ){<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if( i1&gt;=3D0 &amp;&amp; (i2&lt;0 || iRowid1&lt;=
iRowid2) ){<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert( iOut=3D=3D0 || iRowid1&gt;iOu=
t );<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fts5BufferSafeAppendVarint(&amp;out, iRowi=
d1 - iOut);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fts5BufferSafeAppendVarint(&amp;out, (u64)=
iRowid1 - (u64)iOut);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iOut =3D iRowid1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fts5NextRowid(p1, &amp;i1, &amp;iRowi=
d1);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }else{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert( iOut=3D=3D0 || iRowid2&gt;iOu=
t );<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fts5BufferSafeAppendVarint(&amp;out, iRowi=
d2 - iOut);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fts5BufferSafeAppendVarint(&amp;out, (u64)=
iRowid2 - (u64)iOut);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iOut =3D iRowid2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( i1&gt;=3D0 &amp;&amp; iRowid1=3D=
=3DiRowid2 ){<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fts5NextRowid(p1, &amp;i1=
, &amp;iRowid1);<br>
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.45.3.bb<br>
index 975f3bdab8..e7c5bcdac4 100644<br>
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb<br>
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb<br>
@@ -10,6 +10,7 @@ SRC_URI =3D &quot;http://www.sqlite.org/2024/sqlite-autoc=
onf-${SQLITE_PV}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-7709.patch">file://CVE-2025-7709.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-70873.patch">file://CVE-2025-70873.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-11822_CVE-2026-11824.patch">file://CVE-2026-11822_CVE-2=
026-11824.patch</a> \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-119373.patch">file://CVE-2026-119373.patch</a> \<br>
+&quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;b2809ca53124c19c60f42bf627736eae011afdcc=
205bb48270a5ee9a38191531&quot;<br>
&nbsp;<br>
--<br>
2.55.0<br>
<br>
</div>
</body>
</html>

--_000_PH0PR11MB7616D086D123CA668099DA27D3422PH0PR11MB7616namp_--
