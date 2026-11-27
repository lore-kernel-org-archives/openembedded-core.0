Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12760.1795769105049078580
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 00:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ULZO/Adz;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14171; q=dns/txt;
  s=iport01; t=1795769105; x=1796978705;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=ARKm0ZVKiEsK8QKSFgRliu9t5XA6JNE3weMj5onc36k=;
  b=ULZO/AdzVosTdwekVsSKWJZ05o5VdTq79AWB43DgihGETnAjAvx0V3LN
   ftoEpSLrjWFkYXRM887Qyr2JC4YDzWNvrT18qHyyvMGnIF7huySlWCmAN
   mCoVRdOw8UlE51XEAiKqL/TRo3g5ELxuPuJKzqqnBdRPjpphddv6+ku6p
   z64Zc8HF0JVdSBcNlE4PiYEcrhUcpt0FDrh9ww+StjJBahBGRkIEVv0MD
   izTroZ04BcdcWEvKU6IK2DG/GY1qCWzERBYAed1kxu4QGeBgJlUtesnR9
   EcNCpIE+a9hoCIi68zwXqduJWiQr/ZRZCgeDgLsaohqIeTWe1VM1w7I4j
   Q==;
X-CSE-ConnectionGUID: 19bGDxEzTKGUFQs+wvmJdA==
X-CSE-MsgGUID: qZbtHEbMTeyCe8D6YlpwGQ==
X-IPAS-Result: =?us-ascii?q?A0B6AwA/Qglr/4z/Ja1agS6BK4E9MVOBCQKBERJJiCMDh?=
 =?us-ascii?q?SuGWYIhA4ETnRYUgWoPAQEBDQIuARUNBAEBhQUCjiMCJjQJDgECBAMCAwEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAQEBAwERFSQBPQIBCBEDA?=
 =?us-ascii?q?QEBAS4nCh0IAgQBEggagmGCHRZBAwECDgatdXMCih14gQEzgQGDKQExBQkCA?=
 =?us-ascii?q?kAB3A8UAYE4hUKDBBsBAStJbIJegSMYAYR+JxsbgXKBFUKCMjg+gQWBXAIBA?=
 =?us-ascii?q?RiBDRAPHB6DdoIwBIIiehIbgTmBAgmMBgEBgUiIV1JyIgMmMywBVRMXCwcFg?=
 =?us-ascii?q?SUQMwMqLy0jSwUtHXAMJxIpFxEeWBsGBRIgKkBDW4ESgQNbgSsmXgIfRC0Vg?=
 =?us-ascii?q?XYCglGBI10CAUZBDgdFUwklPgUSRyQiCBIJARMaLAqBGjU8CSY/FQxbDAsaB?=
 =?us-ascii?q?RpHCAILAgxyKBEQEx0cJC8FFyY8GweBDCcdGxcOAigGFSELQ209NwYPGQMEg?=
 =?us-ascii?q?TUFkyZigxwBYC0BExYBAU+BLxUqIQiSe49YgXyhfQoog3mMJI0+iDIXhASNF?=
 =?us-ascii?q?IcGklWZCCONZ5ViCDGEdQIEAgQFAhEBAQaBaDyBWXAVgyIJFjQZD5IkhROBL?=
 =?us-ascii?q?cd6eQIJMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-PHdr: A9a23:cOvMxhMXjoRBc2VMQnEl6nc2WUAX0o4cdiYP4ZYhzrVWfbvmotLpP
 VfU4rNmi1qaFYnY6vcRk+PNqOigQm0P55+drWoPOIJBTR4LiMga3kQgDceJBFe9LavCZC0hF
 8MEX1hgl0w=
IronPort-Data: A9a23:GEa7I6nY29UlR/MPo62nExbo5gzaJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKXmmDPa6NamX3c95zYIuw9ksO6pPVyNVgHAFvqi9nF1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsf3b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdRJ8MlbEUxcy
 d83FR40dVOcmeeUzJvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKIJ4XSHJoOxxvwS
 mTu5lbzHjE3PvmjxCuu/yKA2N7LhTzUYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6dW9YXmc7byT6zi1PEAowaUqPEfokSNtDwHfnbwO
IronPort-HdrOrdr: A9a23:8Y9FiK6ZKCLERUZfeQPXwcGCI+orL9Y04lQ7vn2ZFiYlEfBwxv
 rPoB1E737JYW4qKQ4dcLC7VJVoMkmsi6KdgLNhcYtKMzOWw1dAQLsSibcKhgeQZxEWldQtmp
 uIEZIOcuEYZGIS5a2VkWvIdurIguP3jZxA7t2uqUuFODsaE52ImD0JczpzfHcGIzVuNN4SLr
 bZzMxBoDarZHQQaeqGJlRtZYL+juyOvqjLJTodCTAayCTmt16VwY+/PwmT3x8YXT8K+rE/7G
 jDnTX+46Woo9u7xhXf22K71eUZpDLm8LR+Lf3JrvJQBiTniw6uaogkcaaFpioJrOam70tvuM
 XQoj87Vv4Dq0/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBv4REaRHUgnBQ/+2UkZ
 g7nV5xhaAnSS8orx6NoOQgkCsa0HZclEBS1NL7SUYvCLf2JoUh9bD3t3klYavoVBiKmLzPVt
 MeTf301bJxbU6QaWzfsy1ExdyhWWl2IzK9K3Jy4fB8F1Nt7S1EJ4xy/r1Eop8NmahNOKVs9q
 DKNL9lm6pJSdJTZaVhBP0ZSc/yEWDVRwnQWVjiamgPOZt3ck4lkaSHqIkd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmL0IdQ+h7ATW2hVXC1o/suqqRRq/n5Xv7mICeDQFchn4+ppOgeGNTSX7
 K2NIhNC/HuIGPyEcJC3hH4WZNVNX4COfdl8OoTShaLuIbGO4fqvuvUfLLaI6fsCy8tXiflDn
 4KTFHIVbN9B4CQKwjFaTTqKgfQkxbEjOBN+YDhjp0u9LQ=
X-Talos-CUID: =?us-ascii?q?9a23=3AtIQShWu6+u0NYXEhUyyckdoN6It8I3fy4Gf9MXO?=
 =?us-ascii?q?bJltHcabWVkGV2q9Nxp8=3D?=
X-Talos-MUID: 9a23:lKqrdQhXJ/iHFsBqNwn30MMpLfVi/4SDAmUxnIQttpmoax10IyiytWHi
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Nov 2026 08:45:04 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id DA7E218000631
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 08:45:03 +0000 (GMT)
X-CSE-ConnectionGUID: utXLxliBS7mkWSi/GcvT4g==
X-CSE-MsgGUID: h3jBjcsUS7GMLKG1BSsmHA==
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,236,1787011200"; 
   d="scan'208,217";a="75378274"
Received: from mail-westus3azon11012062.outbound.protection.outlook.com (HELO PH8PR06CU001.outbound.protection.outlook.com) ([40.107.209.62])
  by rcdn-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Nov 2026 08:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSTBNPp49jRNd0nI5iZhkVrTPTzB8n32rix+dLZrxK47E45Bw4g40ZNJymSbgw8mJpCLYbZ89fvb4GC65Kdi66jCd4Z0pcsg8paIndajDlWHkisJr2KhHA1vR2cDftctEUoge7ZurJ7PgXPzIl/f/JuD0jKLgTeBeh6MDpf+rCfN9uC5l+PL5TeKMm3DXWPqucoztHf+Y5t1xkbDBOSu3frsRgrvRdkDmvJht7hwyaE9u9C5W6LrJyb6Ark0zhcqpVGWZQHp/6+W43LwLtqP9ya6YD+8ncLLnOh9NOcQOfSvrL7YZv8jPOzYyo0xyZaZc71khODJXfSPBYfjGI35FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARKm0ZVKiEsK8QKSFgRliu9t5XA6JNE3weMj5onc36k=;
 b=VJqSI3fRCtzgHYqAB2kODZDIq8LPFoQteIedXhpsZvQsj+9UJLDcrxHqU2mEV3zdUygq63+vy9t8zMLzX76walZv6WVuKXrzcKJNgEmw+FysSpHbeBxqCiIDjrD1K1d1eqUHs0KqRPkSmkd6CAFu952155yDExIbDRlmRZmAxqJ9C7u8yDdFh2bdiftgSehOjckdF2KyggJ41pljH/Rr3r92dJy5ks8fAEZr+nSZPiVCJu/7HF3ELJLnJE+2vDMHTtcM10yZnaouObzZMwenzL/l7v3BVkAg3+GybACOho2zGtclRO8fT2y4Oq63wq673SitTFKVMDN8sFLebjT0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 by DSWPR11MB9581.namprd11.prod.outlook.com (2603:10b6:8:36e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 08:45:01 +0000
Received: from PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340]) by PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340%6]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 08:45:01 +0000
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<devanshp@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][scarthgap][PATCH 1/4] curl: Fix CVE-2026-8927
Thread-Topic: [OE-Core][scarthgap][PATCH 1/4] curl: Fix CVE-2026-8927
Thread-Index: AQHdfAbIy+6hXOv8xUqNSi21Qyzuvrc9XYHK
Date: Fri, 27 Nov 2026 08:45:01 +0000
Message-ID: <PH0PR11MB761653F60B93298285B44100D3442@PH0PR11MB7616.namprd11.prod.outlook.com>
References: <20261120130414.822854-1-devanshp@cisco.com>
 <20261120130414.822854-2-devanshp@cisco.com>
 <DN3ELESNX6PF.3L73PUZP0X5PE@smile.fr>
In-Reply-To: <DN3ELESNX6PF.3L73PUZP0X5PE@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7616:EE_|DSWPR11MB9581:EE_
x-ms-office365-filtering-correlation-id: 32525bcd-c0d8-479d-f4f8-08df4c62b9aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|11063799006|4143699003|261009223027099003|18002099003|22082099003|3023799007|13003099007|8096899003|56012099006|10067099003|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261026130827099003|261026135527099003|261021133027099003|261021130227099003|261021123027099003|261021135927099003|261021121427099003|261022105027099003|261022113327099003|261022075727099003|261022115727099003|38070700021;
x-microsoft-antispam-message-info: 5DaA1HMyJc5MlAmQGVIh8mQXfI656UV/tgiGjdh+eDEQ0nzN/2hHRmdBjjEqqhAJR1nV+TG093D/5xoR8BcYTMg88ft2bvFmy2nLYuM9srKOvLSzwVKCrHSQ8QIoxPbFcTUrpgLUdudCElUghytj+EnT86ZuwccGz7JNZUIB4aqwt4B4X2fkI52OJdv+c8sLr/1HTysmy+v5Gq5txGbMSyNlzWLI8yPODeyhOulDwyAJYjwRR+G0bpXozt2DP1gNv3Lo+uLE6QXp2udXfYlwWyaTr+NlcIJHYFGQAjkBU1PZYEVmxcUPUWZqK3yugOnCOM3em/fy3kpj7fQFL0tetyvWogP0cVtjb2+OOPHaS2t9p3f8ZsXERUxHiLC2El79zdQEQ6JIvqn313nEXMiZ9LBik9bb86Pq2uFRzAhAiSdjsBGz/x96dx83NO2vmjwxpm4FAB0iY+vNF3KU6NFB8kcPn7j0n00k0TD2c4Gn9Mv7mnZRv8/4Wj1vdnY7+7mquT6CfzhIKPctVz3P50qos9SQw7X1aFmVbq1WyszinxzN9hBYD9R2vs6MIfYp+ZmHe56E2S19FSkUUg3aRSuC9kt9vea/WGy5DnOhLnvkRIsIsiVZ8FXTifwKRkOX97jNAFmkeRwcPOQ8681NP2w2AH5aoFLnykDbxylvxACXKdY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7616.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(4143699003)(261009223027099003)(18002099003)(22082099003)(3023799007)(13003099007)(8096899003)(56012099006)(10067099003)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261026130827099003)(261026135527099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021135927099003)(261021121427099003)(261022105027099003)(261022113327099003)(261022075727099003)(261022115727099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?55H03ZhrBgGykUWEXSVl8wku6al9xvXEInedMaIDo8b7tL7kxVMFmtMeSO?=
 =?iso-8859-1?Q?pWr1KJu+/oc3yI6b8Km32oIVD+F6dStw6mKfWPQWQ0nyNmR219kTDIELvV?=
 =?iso-8859-1?Q?8S6z9GWhMKQ7m72HZVPtmKRWsRVlC9Q9WeagvfYktCnauzYJEpIdcvPxG2?=
 =?iso-8859-1?Q?uMlqJBUd9Bsa9gwePCLGkbNda7qAwmjrm2PXRmVZKe6Z6LKB6Av+2b1jFe?=
 =?iso-8859-1?Q?5KN4RQpmV4OzN8XpoX9gU02Q6Z0N2ySZdCwCIDpjwrn18mG41jx2Z5h0p/?=
 =?iso-8859-1?Q?7zCw94n1lvonmHkTseXx9jC5EmuvCfNFGOYKLk+ewm/ZCdV8jNUx4ClTAE?=
 =?iso-8859-1?Q?B8jMhk2avheutDNuBQNsP0pQ8y4d7nlY5uP9AspBEUqfPi82Vd5LrSv5Wf?=
 =?iso-8859-1?Q?t83wY1wReZycVkF+RrQUx9DWY+GIQcvPjH4x48R1knKSqZkpLo0u9RUnRd?=
 =?iso-8859-1?Q?0AwPAYOgF2kJJZeE7+Vc7PVze0gNeEy4ItHfQSB5OOKvCVGeoJrLq/CR7U?=
 =?iso-8859-1?Q?9jjel2q5gz8eTdi0xeLLBvF0xwAB7ILulIG2c+/SUzwrDbWfk1L9ozisPj?=
 =?iso-8859-1?Q?o1micSETdD5jstkpr0Al0o+TU5xk5E0l4VvSQpyAmeABTcMhJfIjAyrQpt?=
 =?iso-8859-1?Q?brOI6LwTUaPj6waM3cGZ5DOAX08V6b6jGqK6pIMokj21n/ddludoZSLNj8?=
 =?iso-8859-1?Q?f7hrNodVJc3LydHXn0+93a3jdOTujFvBK2WHOjvRiYY4wjo2NJ85MK/ofJ?=
 =?iso-8859-1?Q?0T9lFHb8a+wP7QIdQrEhF0kI2q4HDy9YcFKOFJGhwAWOUZhghr0sioZ/Oq?=
 =?iso-8859-1?Q?ASYyf307BLhSwP1SrjieYkgWRCgCptvk3ErTIaeIEvSq8Q0VMoGA0mJG/H?=
 =?iso-8859-1?Q?bq2ygSoVzV+lBc3wG+gbNWSqAq9/7JHyiJEY+w9S3/vgUfIaAmooIAuVbU?=
 =?iso-8859-1?Q?UTn9iYFdvTLU8WrKJrsxS4iuBmhBOV4d9AMQ73Os/Sa+WpAx7iiYXmk4Kd?=
 =?iso-8859-1?Q?IsVVFl2G2ujPCgkbZB5S+BLvsBtiyi5Zqe4D0YMUstOST0rOXxLXLjlLFv?=
 =?iso-8859-1?Q?XGFj6G6HBI+C49vSE8Kid+TgqtptMsU/GtGD2djy3yHrr57yMWlDVIja3p?=
 =?iso-8859-1?Q?r/zH7524ojCn/9Mpigg5oN8gDLWXRQHnBgW76p8uVRy8DZmResuAx/MS1C?=
 =?iso-8859-1?Q?9YBcDp5uDwWHFSGGO1WZ6osRmhag0EEI4ttZIohl9zbNdSGbS4Bzdr5e/R?=
 =?iso-8859-1?Q?aTK1aOG9XpbUZj4zktDQ+nq6EmnFR+J/isy7wydVSQi6LPlfoam5tXUqc9?=
 =?iso-8859-1?Q?FrMYuKoUz6codtqTfEzbJ4TCcgGXJdULgXMvSvlOQNRu9cyxOELUfmW0p1?=
 =?iso-8859-1?Q?eUZmgyqXrFnLII2Wt1AhSShU2hGo26BtEPEKJiLCvClFrLLmmrX9VuA+sw?=
 =?iso-8859-1?Q?AjzQ54m2M68gtUSH1KiNZEX/Qsv77ZBg8ExJQpoSXPXYklkX480b08eGE2?=
 =?iso-8859-1?Q?QjJvmGo9DAOp/5dd7lE+5kVzCkHTIpmME9hP7l6nJ6+9GVP/gx03TBcwYs?=
 =?iso-8859-1?Q?iwpXv/vcVFndxXxRTOxStpfiP4kDdnm8M/IRayppafbf2QHGLAkI0+9nfV?=
 =?iso-8859-1?Q?wYzjMDV8Qj92mHIrooi0lQYBiot0GZIok2B4BXhol0CWOKFKcgcqapBkVK?=
 =?iso-8859-1?Q?QuX3XuSbngvdgNV0oYjMs6LeEjlCrmWNuZkbDJCso4bhhmkAHamwX7GFHd?=
 =?iso-8859-1?Q?iRFgb65sIwcbeOHDQ+LgEDMLtJrioOShAbEvD+KspOM195?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB761653F60B93298285B44100D3442PH0PR11MB7616namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bfCRQgI/cxPPhrVZzRCz55Cce/yx01fsiIq10S70kkYBt36sejiTftjbl4yyBPyxNSCG2NbMRdA0Cg4Do6vn18fqU8bv8otXtZzedE0hxgXEpwA+E/RDgfqQ5qd40lvdMtML7XOid8fUNbk9lbWDLm36y6n+8IGo2a527fPwwb8hICdNxv3VB3O251KyxuwlQmNp3LMTmAlTYhKhllipc+Lb6DslHhbBNOJbNLESi+Q1j6LScC8emDcUCYcIhvZrqBxc4o1veCkRmpAasf0txwOY6xK4cKp0x1uu6lVzVSHkJaecWr0Z3BVTDp/WQWhScsGDPmiYq7OGQC4w6vBKAg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7616.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32525bcd-c0d8-479d-f4f8-08df4c62b9aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 08:45:01.5299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5x9luqdhlLunctmG74Lw39CmPajxYFtlY/Sd40/NgmPzV+lTXSQTyC2DsRgNaqUxOe3KwKLGqYE2HyiFwSgsrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9581
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-5.cisco.com [72.163.7.169];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 08:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251356

--_000_PH0PR11MB761653F60B93298285B44100D3442PH0PR11MB7616namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello yoann,
Thank you for the review

________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Tuesday, 24 November 2026 16:57:27
To: Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco) <dev=
anshp@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-co=
re@lists.openembedded.org>
Subject: Re: [OE-Core][scarthgap][PATCH 1/4] curl: Fix CVE-2026-8927

On Fri Nov 20, 2026 at 2:04 PM CET, Devansh Patel via openembedded-core wro=
te:
> From: Devansh Patel <devanshp@cisco.com>
>
> This patch applies the upstream fix commit as referenced in [1],
> and the public CVE advisory is referenced in [2].
>
> [1] https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57=
aacb567
> [2] https://curl.se/docs/CVE-2026-8927.html
> [3] https://www.cve.org/CVERecord?id=3DCVE-2026-8927
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  .../curl/curl/CVE-2026-8927.patch             | 87 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
>  2 files changed, 88 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-8927.patch
> new file mode 100644
> index 0000000..a8b07a5
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-8927.patch
> @@ -0,0 +1,87 @@
> +From d4e71ad3aed07542606d9c4afdf6884eccdb3a26 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 18 May 2026 23:47:11 +0200
> +Subject: [PATCH] url: detect proxy changes read from environment
> +
> +When a proxy is set from an environment variable, detect if that proxy
> +is not the same as previously and flush state.
> +
> +Verified by test1647: verify changing proxy with env variables and make
> +sure Digest state is flushed in the second use
> +
> +Closes #21666
> +
> +CVE: CVE-2026-8927
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/5c225384b=
8d52c67ce8259c6e4203bc57aacb567]
> +
> +Backport Changes:
> +- Use the 8.7.1 free()/strdup() names and include vauth/vauth.h.
> +  Keep the parsed proxy string until the existing out cleanup so the
> +  upstream Digest-state comparison can still read it.
> +- Omit tests/data/Makefile.am, tests/data/test1647,
> +  tests/libtest/Makefile.inc and tests/libtest/lib1647.c.
> +  The test-only feature-detection dependency is therefore unnecessary.
> +
> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
> +---
> + lib/url.c     | 13 ++++++++++++-
> + lib/urldata.h |  1 +
> + 2 files changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/url.c b/lib/url.c
> +index 9e1ca03..fe76397 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -79,6 +79,7 @@
> + #include "share.h"
> + #include "content_encoding.h"
> + #include "http_digest.h"
> ++#include "vauth/vauth.h"
> + #include "http_negotiate.h"
> + #include "select.h"
> + #include "multiif.h"
> +@@ -331,6 +332,9 @@ CURLcode Curl_close(struct Curl_easy **datap)
> +   Curl_wildcard_dtor(&data->wildcard);
> +   Curl_freeset(data);
> +   Curl_headers_cleanup(data);
> ++#ifndef CURL_DISABLE_DIGEST_AUTH
> ++  free(data->state.envproxy);
> ++#endif
> +   free(data);
> +   return CURLE_OK;
> + }
> +@@ -2535,7 +2539,6 @@ static CURLcode create_conn_helper_init_proxy(stru=
ct Curl_easy *data,
> +     curl_proxytype ptype =3D (curl_proxytype)conn->http_proxy.proxytype=
;
> +     if(proxy) {
> +       result =3D parse_proxy(data, conn, proxy, ptype);
> +-      Curl_safefree(proxy); /* parse_proxy copies the proxy string */

This removed line is not in upstream patch. Are you sure you don't want
to move it instead? Removing a free() sounds like a memory leak...

> +       if(result)
> +         goto out;
> +     }
> +@@ -2554,6 +2557,14 @@ static CURLcode create_conn_helper_init_proxy(str=
uct Curl_easy *data,
> +       result =3D CURLE_UNSUPPORTED_PROTOCOL;
> +       goto out;
> + #else
> ++#ifndef CURL_DISABLE_DIGEST_AUTH
> ++      if(!Curl_safecmp(data->state.envproxy, proxy)) {
> ++        /* proxy changed */
> ++        Curl_auth_digest_cleanup(&data->state.proxydigest);
> ++        free(data->state.envproxy);
> ++        data->state.envproxy =3D strdup(proxy);

Have you checked that proxy can't be NULL here (on curl 8.7.1)?

My review LLM wrote that it could and that sounds plausible to me:
| Warning: The guard is different. 8.7.1 tests
| `conn->http_proxy.host.rawalloc` where upstream tests
| `conn->http_proxy.peer`.
|
| Upstream always parses the pre-proxy into socks_proxy, so `proxy` is
| never NULL at that point.
|
| In 8.7.1, parse_proxy() puts a schemeless CURLOPT_PRE_PROXY
| ("host:1080", scheme guessed as http, default PROXYTYPE) into http_proxy
| and leaves `proxy` NULL. If the same handle used an HTTP proxy earlier,
| Curl_safecmp(envproxy, NULL) returns false, the code calls strdup(NULL)
| and segfaults.

Can you check please?

Regards,
--
Yoann Congal
Smile ECS


--_000_PH0PR11MB761653F60B93298285B44100D3442PH0PR11MB7616namp_
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
<div style=3D"direction: ltr; font-family: Aptos, Aptos_MSFontService, -app=
le-system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rg=
b(0, 0, 0);" class=3D"elementToProof">
Hello yoann,&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_MSFontService, -app=
le-system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rg=
b(0, 0, 0);" class=3D"elementToProof">
Thank you for the review&nbsp;</div>
<div id=3D"ms-outlook-mobile-body-separator-line" class=3D"elementToProof">
<div style=3D"direction: ltr; font-family: Aptos, Aptos_MSFontService, -app=
le-system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature" class=3D"elementToProof"></div>
<hr style=3D"display: inline-block; width: 98%;" class=3D"elementToProof">
<div id=3D"x_divRplyFwdMsg" class=3D"elementToProof">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Tuesday, 24 November 2026 16:57:27<br>
<b>To:</b> Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) &lt;devanshp@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt=
;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-Core][scarthgap][PATCH 1/4] curl: Fix CVE-2026-8927=
</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">On Fri Nov 20, 202=
6 at 2:04 PM CET, Devansh Patel via openembedded-core wrote:<br>
&gt; From: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix commit as referenced in [1],<br>
&gt; and the public CVE advisory is referenced in [2].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/curl/curl/commit/5c225384b8d52c67ce8=
259c6e4203bc57aacb567" data-auth=3D"NotApplicable" id=3D"OWAc1b9ab06-068f-a=
914-5f40-95019d3173ed" class=3D"OWAAutoLink">
https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57aacb56=
7</a><br>
&gt; [2] <a href=3D"https://curl.se/docs/CVE-2026-8927.html" data-auth=3D"N=
otApplicable" id=3D"OWA6ffb8371-ad75-70d1-7397-de34edab6454" class=3D"OWAAu=
toLink">
https://curl.se/docs/CVE-2026-8927.html</a><br>
&gt; [3] <a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2026-8927" data-=
auth=3D"NotApplicable" id=3D"OWAb40657c4-081e-1f38-dcbb-5d67f3a505b3" class=
=3D"OWAAutoLink">
https://www.cve.org/CVERecord?id=3DCVE-2026-8927</a><br>
&gt;<br>
&gt; Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../curl/curl/CVE-2026-8927.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 87 +++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/curl/curl_8.7.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 88 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.=
patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927.patch b/meta=
/recipes-support/curl/curl/CVE-2026-8927.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..a8b07a5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2026-8927.patch<br>
&gt; @@ -0,0 +1,87 @@<br>
&gt; +From d4e71ad3aed07542606d9c4afdf6884eccdb3a26 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;daniel@haxx.se&gt;<br>
&gt; +Date: Mon, 18 May 2026 23:47:11 +0200<br>
&gt; +Subject: [PATCH] url: detect proxy changes read from environment<br>
&gt; +<br>
&gt; +When a proxy is set from an environment variable, detect if that prox=
y<br>
&gt; +is not the same as previously and flush state.<br>
&gt; +<br>
&gt; +Verified by test1647: verify changing proxy with env variables and ma=
ke<br>
&gt; +sure Digest state is flushed in the second use<br>
&gt; +<br>
&gt; +Closes #21666<br>
&gt; +<br>
&gt; +CVE: CVE-2026-8927<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/co=
mmit/5c225384b8d52c67ce8259c6e4203bc57aacb567" data-auth=3D"NotApplicable" =
id=3D"OWAe7616cf4-db66-3809-cffe-427e384f8c14" class=3D"OWAAutoLink">https:=
//github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57aacb567</a>]=
<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- Use the 8.7.1 free()/strdup() names and include vauth/vauth.h.<br>
&gt; +&nbsp; Keep the parsed proxy string until the existing out cleanup so=
 the<br>
&gt; +&nbsp; upstream Digest-state comparison can still read it.<br>
&gt; +- Omit tests/data/Makefile.am, tests/data/test1647,<br>
&gt; +&nbsp; tests/libtest/Makefile.inc and tests/libtest/lib1647.c.<br>
&gt; +&nbsp; The test-only feature-detection dependency is therefore unnece=
ssary.<br>
&gt; +<br>
&gt; +Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br>
&gt; +---<br>
&gt; + lib/url.c&nbsp;&nbsp;&nbsp;&nbsp; | 13 ++++++++++++-<br>
&gt; + lib/urldata.h |&nbsp; 1 +<br>
&gt; + 2 files changed, 13 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/url.c b/lib/url.c<br>
&gt; +index 9e1ca03..fe76397 100644<br>
&gt; +--- a/lib/url.c<br>
&gt; ++++ b/lib/url.c<br>
&gt; +@@ -79,6 +79,7 @@<br>
&gt; + #include &quot;share.h&quot;<br>
&gt; + #include &quot;content_encoding.h&quot;<br>
&gt; + #include &quot;http_digest.h&quot;<br>
&gt; ++#include &quot;vauth/vauth.h&quot;<br>
&gt; + #include &quot;http_negotiate.h&quot;<br>
&gt; + #include &quot;select.h&quot;<br>
&gt; + #include &quot;multiif.h&quot;<br>
&gt; +@@ -331,6 +332,9 @@ CURLcode Curl_close(struct Curl_easy **datap)<br>
&gt; +&nbsp;&nbsp; Curl_wildcard_dtor(&amp;data-&gt;wildcard);<br>
&gt; +&nbsp;&nbsp; Curl_freeset(data);<br>
&gt; +&nbsp;&nbsp; Curl_headers_cleanup(data);<br>
&gt; ++#ifndef CURL_DISABLE_DIGEST_AUTH<br>
&gt; ++&nbsp; free(data-&gt;state.envproxy);<br>
&gt; ++#endif<br>
&gt; +&nbsp;&nbsp; free(data);<br>
&gt; +&nbsp;&nbsp; return CURLE_OK;<br>
&gt; + }<br>
&gt; +@@ -2535,7 +2539,6 @@ static CURLcode create_conn_helper_init_proxy(s=
truct Curl_easy *data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; curl_proxytype ptype =3D (curl_proxytype)con=
n-&gt;http_proxy.proxytype;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if(proxy) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D parse_proxy(data, con=
n, proxy, ptype);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Curl_safefree(proxy); /* parse_proxy =
copies the proxy string */<br>
<br>
This removed line is not in upstream patch. Are you sure you don't want<br>
to move it instead? Removing a free() sounds like a memory leak...<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(result)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +@@ -2554,6 +2557,14 @@ static CURLcode create_conn_helper_init_proxy(=
struct Curl_easy *data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D CURLE_UNSUPPORTED_PRO=
TOCOL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
&gt; + #else<br>
&gt; ++#ifndef CURL_DISABLE_DIGEST_AUTH<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!Curl_safecmp(data-&gt;state.envpr=
oxy, proxy)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* proxy changed */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Curl_auth_digest_cleanup(=
&amp;data-&gt;state.proxydigest);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(data-&gt;state.envpr=
oxy);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;state.envproxy =
=3D strdup(proxy);<br>
<br>
Have you checked that proxy can't be NULL here (on curl 8.7.1)?<br>
<br>
My review LLM wrote that it could and that sounds plausible to me:<br>
| Warning: The guard is different. 8.7.1 tests<br>
| `conn-&gt;http_proxy.host.rawalloc` where upstream tests<br>
| `conn-&gt;http_proxy.peer`.<br>
|<br>
| Upstream always parses the pre-proxy into socks_proxy, so `proxy` is<br>
| never NULL at that point.<br>
|<br>
| In 8.7.1, parse_proxy() puts a schemeless CURLOPT_PRE_PROXY<br>
| (&quot;host:1080&quot;, scheme guessed as http, default PROXYTYPE) into h=
ttp_proxy<br>
| and leaves `proxy` NULL. If the same handle used an HTTP proxy earlier,<b=
r>
| Curl_safecmp(envproxy, NULL) returns false, the code calls strdup(NULL)<b=
r>
| and segfaults.<br>
<br>
Can you check please?<br>
<br>
Regards,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH0PR11MB761653F60B93298285B44100D3442PH0PR11MB7616namp_--
