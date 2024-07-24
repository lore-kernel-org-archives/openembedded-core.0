Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C04C3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 06:51:27 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web10.5179.1721803882117041240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 23:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=lAcl8wyI;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3646; q=dns/txt; s=iport;
  t=1721803882; x=1723013482;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q1IVyKzA+67SAvN/YVZoJVm7HPwwYdjAubKCdzY7PoQ=;
  b=lAcl8wyIQEXxDHzrHQiqv6RfOVNd1SIbAKj8CKE0eSgtSu9pIeRJuOIR
   BA5EZw/J1coYXNzzOaReqpH1hS8Sg6Nj5eceUP7eD2QRUU5IZCChpwJ9y
   SVJS7GaTfJXxFU5hC55E41gxlLqUZwAjx+FDnUnLcUtsWqOVNXogK05Sd
   g=;
X-CSE-ConnectionGUID: igiUrkziQQKAdIFSdsetjw==
X-CSE-MsgGUID: bHUmFX/DQ36OCNLWJm3QnQ==
X-IPAS-Result: =?us-ascii?q?A0ABAACAo6BmmJxdJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBFgUBAQEBCwGBcVJ6AoEKEkiIIQOETl+IcAOeDoElA1YPA?=
 =?us-ascii?q?QEBDQEBLgcPBAEBhQYCiTgCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEFAQEFA?=
 =?us-ascii?q?QEBAgEHBRQBAQEBAQEBATcFDjuFdQ2GXQEBAQEDAREoPwwEAgEIEQQBAR8QJ?=
 =?us-ascii?q?woXAQUIAgQBDQUIGoJeAYJkAwGiRQGBQAKKKHiBNIEB4B0YgTABiDwBhTxPh?=
 =?us-ascii?q?EQnG0CBTYFXeYE3OD6CYQWBXwWEDoIvBIFkhEWEKIkAhHJpBAUHhDhXD4Jcg?=
 =?us-ascii?q?VaCOyYLjX9UexwDWSECEQFVExcLPh0CFgMbFAQwDwkLJikGOQISDAYGBlkyC?=
 =?us-ascii?q?QQjAwgEA0IDIHERAwQaBAsHd4FxgTQEE0eBNwaJVwqBeoEtKYFJJoENF4J3g?=
 =?us-ascii?q?TWBHQKCXIFrDGGHdmKBD4E+gWABSYJ+SySDRIIcHUADC209NQYOGwUEgTUFq?=
 =?us-ascii?q?TmEAwENL1EoHUE3BwMyMAlEHsVjCiiDbIwSjTGIKBeFW6RhmG0goyGFIgIEA?=
 =?us-ascii?q?gQFAg8BAQaBZzqBW3AVO4JnCUkZD1iNYh+IVsZmeDsCBwsBAQMJimoBAQ?=
IronPort-PHdr: A9a23:J9Ey+h1qLv1i30SwsmDPmlBlVkEcU/3cJAUZ7N8gk71RN//l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:iKk9MqDybxyBrBVW/wTjw5YqxClBgxIJ4kV8jS/XYbTApDJwgzxWz
 WsWWm6HMvvca2LzfNF2YNyx/BxXvZfVmtBlOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4SGcYZtCCeB+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357hUmthh
 fuo+5eDYAD/h2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEwvpvMVs1L4whw8VeDUBgz
 vADJSwPcUXW7w626OrTpuhEnM8vKozgO5kS/ywmxjDCBvFgSpfGK0nIzYYHh3Fr2YYfRrCHO
 pRxhTlHNHwsZzVDPF4YD54klc+jh2L0dHtTr1f9Sa8fuTOIllUggOKxWDbTUtaqeMB7rgG0n
 zmY2E/fJi44MYemzwPQpxpAgceUwHukA9hNfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVuY98gzIl+zf4h2SAS4PSTsphMEaWNEeRDMr6
 0WKjdLQPB9GvJy7cn6G+6uWsmbnUcQKFlMqaSgBRAoDxtDspoAvkx7CJuqP9obr1bUZ/hmun
 1i3QDgCulkFsSIcO0yGEb3vmTmgoN3CSRQ4o1iRVWO+5QQ/b4mgD2BJ1bQ5xagdRGp6ZgDd1
 JThpyR4xLtUZX1qvHfWKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9bI2a3P
 x6I5VgMusI70J6WgUlfPtzZ5yMCkPeIKDgZfqqPBjazSsErLVbcrXsGibC4gjq8zRhEfV4D1
 WezKpv0Ui1AVsyLPRK9RvwW1vcw1zsiyGbIDZH9xFLP7FZtTCD9dFvxC3PXNrpRxPrd+G39q
 o8DX+PUkE83eLOlPUHqHXs7cApiwY4TX86m8qS6t4erf2JbJY3WI6WMm+N8I9M4xcy4VI7gp
 xmAZ6OR83Km7VXvIgSRYXclY7TqNauTZ1piVcDwFT5EA0QeXLs=
IronPort-HdrOrdr: A9a23:Aq4wcaEV+RdHgjStpLqFlJLXdLJyesId70hD6qkvc203TiXIra
 CTdaogtCMc0AxhJk3I+ertBEGBKUmsk6KdkrNhTItKOzOW+VdATbsSo7cKrAeQYREWmtQtsZ
 uINpIOd+EYbmIKzfoSgjPIburIqePvmMvH9IWuqkuFDzsaF52IhD0JczpzZ3cGPzWucqBJbK
 Z0iPA3wAZIUE5nHfiTNz0uZcSGjdvNk57tfB4BADAayCTmt1mVwY+/OSK1mjMFXR1y4ZpKyw
 X4egrCiZmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoTJ4JYczBgBkF5MWUrHo6mt
 jFpBkte+5p7WnKQ22zqRzxnyH9zTcV7WP4w1PwuwqnnSW5fkN/NyNyv/MeTvLr0Tt4gDi66t
 MS44utjesRMfoHplWn2zGHbWAxqqP+mwtTrQdatQ0sbWJZUs4TkWTal3klTKvp20nBmd0a+O
 UCNrCo2N9GNVyddHzXpW9p3ZilWWkyBA6PRgwYttWSyCU+pgE186I0/r1Vop47zuN2d7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUPhvAQODl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P0bjE9eH0pFH+g3EBG+9QTPuwMdD4IURgMyxeJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR+TuKGP/cLw5lzEWm6MiYEX2fPdlzOrTAWj+1v4jAreawdDmTA==
X-Talos-CUID: 9a23:Ae8vI2AP7LLhTwf6Eyho9XMOGdIkS0T+5XvxDXS0Emt1SqLAHA==
X-Talos-MUID: 9a23:wwyvbwuiiPY88LGbNs2njhFfMelYpIiXUx4qurMihOuBbhV2AmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 06:51:21 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 46O6pL98016725
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 06:51:21 GMT
X-CSE-ConnectionGUID: wBv5AKnCRSyi+2BdG7fANg==
X-CSE-MsgGUID: QKLn3fJKT0ySxUnzsZxtPg==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.09,232,1716249600"; 
   d="scan'208";a="24226598"
Received: from mail-dm6nam04lp2041.outbound.protection.outlook.com (HELO NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 06:51:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YY9NwZD7Co2yt8FgdfF5klXTrV7VpOPvW+vHBz2zBkrpy/P+HkYr7DTjrrbxlkw1AaeAJdsN8IMK4T9ZJKASXzr6PdhrY2U84JPXhJf+LPIQH0Zf3agsOWuvwHFX85DmMtXySYsnQZJsmxg6ucUtCJ/aoR2VfsYgcbUkreCyTJqrTWe1xWb8CWXuw7dDKn2o2jYHDlpB9ygmUkBmHmq2RgdsHCpl9944tPF/6WcndO/EnHnLGJ9MkncbwX2QRBxBVkutXHtQ/GYx2SL0VGnEMEFXQkmFxsARsGXLyW75IImoX4VT7WWr/phPK2MQBX4O36HvTPPrtzvXSKygoznWCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1IVyKzA+67SAvN/YVZoJVm7HPwwYdjAubKCdzY7PoQ=;
 b=Zl5wglQd1+Uk6v8Dw70nVP3KRgUKEfgmanBYeTBpNZtOb78zph77W9qv4JGoGWE0oXvd9nyiKNe0gr2w0VLV1AzIjGgKBKaPwEZh38YjHyKy0aVIsZUZE+Gf2B2W/C7YJl4N3dP6JLrSeK61OdDfRdsnyaffVBhCkxjmpzzCvhpQsf0BBsYw680dwrv00gta/tzJZKa6EHzK+2ndyCRrQXWGnx+hHyUYWER0o8cz273gbaXfd31M+OommPjV7ByNZP6NaCl2hs3frt1Yr1y2aISE/OgPcXijJcDfsEWHfgd5SBfzKvaTLi1b/b7S4MwSY4A9yGb2Bnx0XiyYOddPkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 by PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Wed, 24 Jul
 2024 06:51:18 +0000
Received: from SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::bfd2:64e6:d85f:4896]) by SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::bfd2:64e6:d85f:4896%3]) with mapi id 15.20.7762.020; Wed, 24 Jul 2024
 06:51:18 +0000
From: "Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)"
	<dnagodra@cisco.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
Thread-Topic: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
Thread-Index: AQHa3YRHiRZeDkJzN0OXxSVyh6EHW7IFa/cAgAABQJA=
Date: Wed, 24 Jul 2024 06:51:18 +0000
Message-ID: 
 <SN7PR11MB6971246F61B1A502B2D20391D4AA2@SN7PR11MB6971.namprd11.prod.outlook.com>
References: <20240724044505.3345411-1-dnagodra@cisco.com>
 <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7752e62c-f1d5-4219-bb5f-b6b6692dea0c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-07-24T06:25:03Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6971:EE_|PH7PR11MB5861:EE_
x-ms-office365-filtering-correlation-id: bb5d7617-91d8-45c9-c55d-08dcabad0522
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?46HhsyYYVDkvuNM9ht4WDKLuC4jRNkuCD4vIRxYYrP4tnRL1PACPEbBhNy9E?=
 =?us-ascii?Q?3sX/1ME2ktkMBOgbbGJlN/ICMJFO3o/Labr6UbWfA3IxyrEiGCqfSg3ML0mD?=
 =?us-ascii?Q?NUp5Ivy2WnaIeQEbyv+Ta1E/SyJCp8hQCpidMmj5hs77YPg08GKUaWAJ3wf4?=
 =?us-ascii?Q?+slp0EZmsffZ3LyJc0vX83P2Iuv4m4HBi1oY2J9AD1g+/izo9Pg6xymc7H5C?=
 =?us-ascii?Q?7YLfW6Ti4QT74RsYjhe0ikLYolsFi8pqqnGpGtgDoEBgcKQ8McHrBbI47bNz?=
 =?us-ascii?Q?IKCCgAiaA1zfFCt5MnOVY/uA4/BbkWVP5FkeakRvKN3//cavOeDVtu9mmXpV?=
 =?us-ascii?Q?n9jgMKRl0dVFvgOkiHwYGxS0IMUqABWErh+MFpsaa0Erz5RyXoAy7HPlHfcQ?=
 =?us-ascii?Q?WyNg58V0PGioymFEbv3Vhyo85kA4QbgRypPXnkGskS5LJpkqSX2YH+N+OVQg?=
 =?us-ascii?Q?ZvMaTViaS0Dk5oChrYq2n74EPGwVIa/nxnOTUShlRizEUHuWL+9HGWeeZ4mk?=
 =?us-ascii?Q?15gfl338ZTdkxSp0wPbjmG+R5YJiCmlyuFu7fSewxI8udLqrVdCXKfJcP1n3?=
 =?us-ascii?Q?MlXfMtll9ARHNSGCIpWvepj2e3KfbfjvwrhFz+9ya/1LyA/zwjOBwK3ERKEY?=
 =?us-ascii?Q?fJ6OqGQS+PHUflu72ngabzZr3rPrdXNY+luqePVecLckkrHr3R74bqbcXpr5?=
 =?us-ascii?Q?zegOSIWWlCivPST41KhT0pry1G/5fjBK6QmoGSa3d58Ymf+cDbD+bYDQ/Qbq?=
 =?us-ascii?Q?zCSLf+EYRNuqmtP21P7n3YHxHP7Q5jK6PzTOCRkFWkFkRdR0fUTmbMNKzGl6?=
 =?us-ascii?Q?G4v6RXgoshR7qimCr9usoK1w9+hsBnAo/88Gc6tHjH633vz8v2dkTjAPztJV?=
 =?us-ascii?Q?1U/U5DTJpDIVLm6/6+WVuQOx54evdi0kFIFBVCHylwlKnyTHYhDHqXcBqC+4?=
 =?us-ascii?Q?AWs4Y5fErPdX+Css/PjR/WqZbCy30eGZioTS04JXKoq7YmKtl3t9pM8tZ8Pd?=
 =?us-ascii?Q?mn2kNvwxiqB0gR6UAbDYIytgFilSg0P7Oo+zynxEXBa1pkZ/cX2/K3rjPa0+?=
 =?us-ascii?Q?6BhoiOZ0Q0WrCTDo79i/JwCfG1WBlFfwkto2F6qgAqnxll4ZSc+IpGp050Vu?=
 =?us-ascii?Q?MmG9AYbN6bQt9Lj8rZoEVVVZ25se1YoaUj7u8JunUDMk+hEHxNetrCYoFjTh?=
 =?us-ascii?Q?cB0Fy3Op1PXy2QSNl+AFtOQuTcx2fY8lrhgzroffkCj2YgOu3utkPMevjwKC?=
 =?us-ascii?Q?E/9/CvJKRx9dMEuf1JhV51kv5RMJhhxfKhWKh5EOTrTyAJegsTvwiQPRlTcF?=
 =?us-ascii?Q?6WDID057TNRKZRk+ZAuT/H8GPUuHcirY2YswXYrtikeJ/Fra4NLl+gBiHIEq?=
 =?us-ascii?Q?dRyf2Fozq3Nl/14Jjtpwa9y04e5psMX4lNeo+3Bf24lJki68sw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hmaGrAYhStRRYR+PqSHmGVp4ZTQXnrB2Vj0yr7zMk1fnlT08NulLit4ce0Kw?=
 =?us-ascii?Q?8E99wqdwXPZPF8KrtxPs/p1AQhsegmoeT34OO+6TKIkj/hI9Kgvt8ubVRWZj?=
 =?us-ascii?Q?8W4gGkF6FwOCv4QL9ZNgdi9t0HgkYFdPEZXYKimQ3/eh2VITUAM8z1VYdbmj?=
 =?us-ascii?Q?Y+d6yZDRaE6Kla/H3X5Hd57XRJNOnNbCkTYRHLwZ/RfTXIfN4LD1hyzVAEE5?=
 =?us-ascii?Q?b6zEcPR3TgLZSOsZnY1p5AODXEWHaMUJSRSxSc/JMkuP6PgpDuLHrB5+61FD?=
 =?us-ascii?Q?KP0MimQJHiS9nsHP9fR6U3LAh11rhXOntQCU3y7/EifXBLOsLaVISP4hVPiK?=
 =?us-ascii?Q?hvpR+J67JeY3kAHRedaWp5qX2rqu73OJrkxS6CWtxhGwVFgBbnr4K0d7Vcuy?=
 =?us-ascii?Q?hqxZ2+S+xe4cEU5CYO+rJvWnnIcLr+L5aL/2+NXFHO4cuWV6XpvqNDtvpmSN?=
 =?us-ascii?Q?nyKOgjKXZiCO6UYNE1S94gfqSrDF8m0mXdy08ZBP3wbqTR16G62JU49DbloR?=
 =?us-ascii?Q?ENIRSeYxzx0gFJgwapRwuE41/dcob1MZuktWXkYlR4eR4pN+hVNZmf8ZvQ3H?=
 =?us-ascii?Q?m/d/MEpuWPyli+AS503kSXnZs7yZuqq8VV8VzlVAYQCXWrj6IspDOf/LFfQj?=
 =?us-ascii?Q?rKZTDP/aTbxkCEAfJiuZLrk0Pbz+JewBJ5oBtYbV+9CFYvEYh1Zti7jkrXGJ?=
 =?us-ascii?Q?4c+0c3FX8hJaFd17bhoZMLthtPlK1EKXdi8xIhxI5+2cP+8U3zS03LRMm9RJ?=
 =?us-ascii?Q?g/d8aOVpBa+QqaxZzvLW4DV85k28xLuyazyf5P9GzA3W4YY+uKhs+VrSSnBJ?=
 =?us-ascii?Q?A+YqRbF/OLQ4y97MWMFg77xIU0n1SuMQTG3PiSMBncQ2ihg+BaAJwpR6pROq?=
 =?us-ascii?Q?yc82p9YGKWjCdQMvZfmtbmG/FzhaYxSog+uT9sgA/ItaklCsVm8dYCTaTMke?=
 =?us-ascii?Q?P8HCszRVHHJESLEjTGsAFz4JLYEDnaq7arXzxdSh6QlDRLaTS9/SvHdXRTl+?=
 =?us-ascii?Q?7GG46JzCuZyCHF5g2alGYrF96NmCtXXjzFf9NA+tGxxUvJQqbbMKa8+M7ucl?=
 =?us-ascii?Q?b1UIMpjsB/t33nAEoYAuGofaKLf5qvmDEkSSEl3Pk6E2j1sywc74J7MZ9Kop?=
 =?us-ascii?Q?HzXhyM+WDbvt93FYMdlyiYT2qnnjL3RV7nVgLpxZJ7mBrLvkqkTIi0yef5TY?=
 =?us-ascii?Q?Urpf022Z9ksj8cLEbtnAG+TDqhxwqLuNjazcndhyiudcU7pxgkY7PpHDS6hw?=
 =?us-ascii?Q?WeOfLSj3MVuN6vhOU8Gr2mLgxEsu5OXPBOvV7pdcTol6CfUxhZ3Kik/pKmuI?=
 =?us-ascii?Q?AXcB+Eqf6pmwYICV5AdGdOmwEUet6OahpreU863PTC+3VNa4FEGRCk22YW0s?=
 =?us-ascii?Q?zxjH3Pv2v+bSM1ABoaHkcs73ldrB+5KlDXPR+1gWQi96RjQ8ywhaK/LK66bm?=
 =?us-ascii?Q?+QWQv/rcHOHgcETMkdZsFTbPezeb9LcP+uKtQ+nomb2RFlqtk0mNfBpqv5IX?=
 =?us-ascii?Q?o8MTG0pUwYYgczJkw1kB4ygfthMFxCVW7EBZ5XemLuDiBRekmbSvL4YS51Jd?=
 =?us-ascii?Q?WbLLNJJx8PtvGy5i6Cw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5d7617-91d8-45c9-c55d-08dcabad0522
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2024 06:51:18.3505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 25lAFacOOF32MCXHL+mUgYUL8xqgJ/0jF2JMp2aBj8HthKV3OUiP49n9azQwSJrS0wGnOfk85DyL0R87pvtb3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5861
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 06:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202429



>-----Original Message-----
>From: Marko, Peter <Peter.Marko@siemens.com>
>Sent: Wednesday, July 24, 2024 12:04 PM
>To: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)
><dnagodra@cisco.com>; openembedded-core@lists.openembedded.org
>Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
>Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
>"Unpatched" status
>
>-----Original Message-----
>From: openembedded-core@lists.openembedded.org <openembedded-
>core@lists.openembedded.org> On Behalf Of Dhairya Nagodra via
>lists.openembedded.org
>Sent: Wednesday, July 24, 2024 6:45
>To: openembedded-core@lists.openembedded.org
>Cc: xe-linux-external@cisco.com; Dhairya Nagodra <dnagodra@cisco.com>
>Subject: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
>"Unpatched" status
>
>> - The 'upstream-wontfix' is to be used when the CVE is accepted by the
>>   upstream, but they are not planning to fix it.
>> - If the version used in Yocto is vulnerable, it should not have
>>   "Ignored" status. The package is still exploitable by the CVE.
>> - Also, when the status is exported out of the SDK, it would be
>>   incorrect to put it under Ignored catgory.
>
>The purpose of this entry is to remove meaningless CVEs from reports so th=
at
>users don't spend countless hours over and over again on analyzing "open"
>CVEs if they were already closed upstream.

I understand the need to remove the meaningless CVEs from the report and pr=
evention of re-analysing the CVEs.
And for that exact reason we have the CVE_STATUS, the CVEs would be reporte=
d as vulnerable or "open" yes, but the previous analysis would also be pres=
ent in CVE_STATUS.
This should give the context to the person and not requiring them to re-ana=
lyse the CVE.

Also, I would re-iterate the point that when the status of CVEs is exported=
 out of the SDK, they would be falsely reported under 'Ignored' category.

>If you look at comments of entries using this category (7 in oe-core scart=
hgap)
>these CVEs are more or less irrelevant.
>
>So this patch is from my point of view step in the wrong direction.
>If you really need to show these due to your CVE handling process, you can
>easily override this variable assignment in your own layer.
>
>>
>> Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
>> ---
>>  meta/conf/cve-check-map.conf | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/conf/cve-check-map.conf
>> b/meta/conf/cve-check-map.conf index b9df41a6f3..7ff53f5601 100644
>> --- a/meta/conf/cve-check-map.conf
>> +++ b/meta/conf/cve-check-map.conf
>> @@ -15,6 +15,8 @@ CVE_CHECK_STATUSMAP[unpatched] =3D "Unpatched"
>>  CVE_CHECK_STATUSMAP[vulnerable-investigating] =3D "Unpatched"
>>  # use when CVE fix is not compatible to the current version and cannot =
be
>backported.
>>  CVE_CHECK_STATUSMAP[cannot-backport] =3D "Unpatched"
>> +# use when upstream acknowledged the vulnerability but does not plan
>> +to fix it CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Unpatched"
>>
>>  # used for migration from old concept, do not use for new
>> vulnerabilities  CVE_CHECK_STATUSMAP[ignored] =3D "Ignored"
>> @@ -26,5 +28,3 @@ CVE_CHECK_STATUSMAP[disputed] =3D "Ignored"
>>  CVE_CHECK_STATUSMAP[not-applicable-config] =3D "Ignored"
>>  # use when vulnerability affects other platform (e.g. Windows or
>> Debian)  CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
>> -# use when upstream acknowledged the vulnerability but does not plan
>> to fix it -CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Ignored"

