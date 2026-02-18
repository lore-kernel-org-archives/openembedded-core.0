Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98F9E9A03E
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 07:21:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7131.1771399306833559713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 23:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=hhSPxK+p;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771399307; x=1802935307;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ZyMXb3S7Xwf/2yIU8C3BxiKHNDCR4ZL6XOs68oU/+nc=;
  b=hhSPxK+pDmtF3M/DQnyoM7l8vT2JyHupyAXgjWq9L+Fe2pzP6Xl3F4IW
   EV2AGfWGt61NP8tJrBgEsmhIVA/uChFju+hAIXbBcnikAZZrJ2kqiKQOI
   x58tbZouUBJBMbOURkB5ZNQ3simjVmXkxmS3CIzzodVwm8ChSDBuv82pM
   p0hWN3ebjcHTdr2opGCqr9vAdKI4uo49t3dtz2sRdHrKcFNeBWX06eA6R
   z4VUV2mw1ci7UaDQ5ms53VECb3vYPntp6H4EqRi9YaVOvke2c5APH8dBU
   WvZTTwjc1oXPPkgw3AkEXQeJq3+Owd46YBTmf67Ui0Wj0VCaKaoMu+vcu
   w==;
X-CSE-ConnectionGUID: 4FmqczbaSyyunEXu37O5qQ==
X-CSE-MsgGUID: hGYZm3YDR/eFb8ajf1iqYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83579309"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="83579309"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 23:21:46 -0800
X-CSE-ConnectionGUID: 7p0esMC1Qq+fbeLZ+eskAA==
X-CSE-MsgGUID: 44SZCqfER++42D/ACkTTSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="218646583"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 23:21:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 23:21:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 23:21:45 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 23:21:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7acELYh4+ajgyWD/X65cKVqtaTr/AYGUZghWwSSsDtIvTW8Hx/LHpt3n4RmvNRB0slJS7yHVjJEU8oIo8HXe34W6aPGh2kZQarlN2b/IrUUVMVkw/tGU4HDFQCS1rv5vEhvKrCvPaYECx461Fj2l/7qMzWSgiYUXmnElFllr+1eaUqJjETNbbKkoPeGWr8X6BmgNuIkUDJhorHxXBqHcfz4dFs+8FffDRDXgo4MfYyDo+rLeWiHAQuTWJJ+HtfiuqtyHYoiUwwg5WwgGnwZaOJvIOFeQ1hyIlV8V/SO9yiMrYfrBWgEGLfgZDJuE6nPYi9ohWaYgPKuKr8M2nVqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyMXb3S7Xwf/2yIU8C3BxiKHNDCR4ZL6XOs68oU/+nc=;
 b=pnvGCjwvw7WLJQUNuFt98XRh8JUZKCuLAhFq7zvfyTKZrDGjR+/7abRy2P56ZGpren7/0iDIYg6Uv07/BXFsOXd16+v+L8HcejbmshKjCZOXQR1GQGrfoOh/fTiaVaMTxNFi4Kl2Pf2cg31VY7GG/m27DuBu+lGxSxZCqaG3rXkx7O8OTbe7U1tlV2P06Ml69L6qV8et4JK+5nlCbECOPNwceji7pT0WiUxhfiWmvAk2eO5wWKpzzRerZ8haJS6Fu9A65pTL4jNaOpQECQGqIL9ewRuPdXzd9Mqd+e8bHrptHRtva3LcxDxe0rHWZZCLe9mx6Zo+KWHT40mFSqm7Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 07:21:42 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 07:21:42 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.16.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.16.rc2)
Thread-Index: AQHcn2P/fOsZuyzCX0W5udpuUN6sqLWGqPdQgACqZgCAALwfkA==
Date: Wed, 18 Feb 2026 07:21:41 +0000
Message-ID: <SN7PR11MB70183475F1C84EB7F1C340F8F46AA@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019c6759c149-effcd63a-6c4d-496b-9059-b54370d7c341-000000@us-west-2.amazonses.com>
 <SN7PR11MB70181409902E431E5217A0F4F46DA@SN7PR11MB7018.namprd11.prod.outlook.com>
 <DGHIB7MWHIHG.19IPAQZIA9X0X@smile.fr>
In-Reply-To: <DGHIB7MWHIHG.19IPAQZIA9X0X@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|MN0PR11MB6011:EE_
x-ms-office365-filtering-correlation-id: b6536c1a-f4be-41dd-6bfb-08de6ebe5d33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|7053199007|7142099003|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?N3Y4ZTNpL3FHQU85b1NhdW8zVkJ4N3d6VXB0eEg5NmoyY0doT25KNEVMRmR3?=
 =?utf-8?B?SXUzWWpLNUNCcS9tNWVMVGp0ZTdQcGxmQmRlZDdUZjN3NUJOOUd5b2syOVBl?=
 =?utf-8?B?V01QTnZ5OU1ScXhPS0NMMkVSc1J2d05xYkRmL3BoL0Myd2tORnlRdHBFY2c0?=
 =?utf-8?B?OTh6aUlqNGNPNE1tZU1VQWlETmR2RExiVmZ0ZkZ2d25qRjlSVkFRSXFiRXFG?=
 =?utf-8?B?d0VCNGY3dWpDdzZ0QXk5TUI0YUJ2cGdTTnMrcjFrUDc0cEw1cjRxbVVLMXJM?=
 =?utf-8?B?VG9PSzE4SXRYMXAzMEdka1k4b05uY0ZaVGI3QmV4MHpnUVozajRLV1Y3b2tV?=
 =?utf-8?B?T3NIeGczRno3dk9tTjRxVkQwZEU0RE10ZHJNNXB5ODRiMWpvRnk2b3doMGFC?=
 =?utf-8?B?R0ZhNU9xK2FEVStLblNoUkM0VEIzUW5oaVR5Uk5tWGpxZFd6KzhCbUh3dkg4?=
 =?utf-8?B?Zm8zRXk2QUxtQzNFTFllWXcwaTF2N1k4U2dyM0VVSkIwZ2RqSXRTSlhFZnZs?=
 =?utf-8?B?R21wSDZVanhTV2grRmM1ejczbWUyaFRZZ09pR21xdmpvM0hYQXg4L2hNT3Fi?=
 =?utf-8?B?TTBZaHErRDNRa3MrcnBpV2FZR2cyZlUwMUdqSGdUOHpyNVBjM3BINzVQU0NW?=
 =?utf-8?B?MStndCs4NlhkcEY5dVY3Mk40c091dWlYaVBjay8vUmIybUQvRm5janVaL2JZ?=
 =?utf-8?B?c2szMzFUekwzU2tIRFhqUFQrTjZvL1l2MEI2NGJiUTF0bURiUW4rV1VjYkJD?=
 =?utf-8?B?RlV4US9ZcUlDdHdDVWZsM3pONzlIR05UWHRaSHo1Z3Z2VTJqcEd0SWJpVUE1?=
 =?utf-8?B?NThNSUM0QnFLQzJLcU8rWk1vVVdVNWdya3c1V0ptSGNkVnowOEFySHNWalMx?=
 =?utf-8?B?a21LV3UwZWRaS3NaNUs0NHRlUUk4NGRmb003Y3BEamhYQkhQRitvaDM3TnlX?=
 =?utf-8?B?UzR6M2VIYWFNOTNXQlNBQjlDMHlsZm1UdnFueWh3RE5xYlVZL05JSFArWFBE?=
 =?utf-8?B?WjRCKzFMb3hMOFpGK3ZXMXM2TmhkeE5CeDREU1Q4NHBTaDZacXVJMFFHaGtO?=
 =?utf-8?B?QldBK3R6NmJ5ZmRuejVmb1FYWFQxZXFWVzF1MEYzcUZldVZUT2dINm5hVW9l?=
 =?utf-8?B?QVpVbjRidlMySE40blpYMXErenFlVTk1TFVYaVYrVzRSYlJzT3o3TzV1MGJD?=
 =?utf-8?B?ZldTeTNlWGRuRFJCeFB3UTFkMnJzNU1nVGhaSTlyZmVYZ1N3eU5yQzZwQkpP?=
 =?utf-8?B?cjc4bUdMQUplNGYzVC9IREp0QWxZcCtIWUJmWmpGbVk4WHBFQ1dUODZ5UHpZ?=
 =?utf-8?B?QjUyLzVwUGxKczE0Wis1ajZmS2duejF4bWNONFp2aGxyK2dDNGR6dUNUTnJw?=
 =?utf-8?B?a3hHdCtxVGNIZmVJV0FUTllqeXUyNVBDclQrakxJdmcyZGMrc0M5WFlOMmRu?=
 =?utf-8?B?MlVrYVA0OWgva2FnaXZIc0pYcmNWdHB1cjBzTUJTOGlYUjgzeFU5NEk4a1Fa?=
 =?utf-8?B?Y3lkQUdjR1RCTnRhU3poMXR5Mi9mUmVUdUZzUHNqZTZPSXZOMUR2TEIrd3FU?=
 =?utf-8?B?QlZEUFN0dk5pOXcya1RUbWVFWHZiMzM4TDd3UVd0UUc1S3hIZUhsUTU5UEVB?=
 =?utf-8?B?R2RjUE9wQ2dSS1lIWnZRT3VnNUNRMEsxa1BBU0llWU44Q2pVZ1d6cmNRY29C?=
 =?utf-8?B?SzhILy9MZUZDQlRoTzExSTRDTzc4bjdPM0h6QWxnU0IvWWl6WE1YRnhCWElY?=
 =?utf-8?B?akc2KzRoOTVnTHp6M2pQazhjdWlTUWlXNXA0eWoxMlAyZmhUMFBPNmgzRURH?=
 =?utf-8?B?d2RtditoSzFibGV5cDJKU0xMZGQvOTdIL1oyc0dvbnhHTjk2amcwSVU3c1pU?=
 =?utf-8?B?eUY4d1lQVzlnMmFJOUkzMnZmSlhCQnpxUWJRN3pscEI5bStSeHBhOVhFd3Q1?=
 =?utf-8?B?QWNtS2RkcE1saG92VlZpWTRSN3RKYWs1ZzRicklsL3Y2ZmVZRnZ3QXVxMnU4?=
 =?utf-8?B?YjdnVFdhSWpTb2poOWQ3MnJuNUd3emxHWk9kbmdBWE11Zis2Q2VJL1k5RUVn?=
 =?utf-8?B?SW9DVy9GVzZLNUdidDdJZGUreVFOSXVUOEMxMzJhaEVCQlhiMlo4OUZuZjln?=
 =?utf-8?Q?MvitPN2bcKm/b8Y0aJ5aDVOZl?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(7053199007)(7142099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWRBWVBZLzMvNDNDOVJCc0RDa0VLNGU4QVNxQ3RrWXRyVnZLUENyeU5hUnNa?=
 =?utf-8?B?cHJ6Ti9iUzZoOHdwOW4zTUhob05XcHFKNXJub0dKcjd4T0QrdlNFRnFKVXdE?=
 =?utf-8?B?K2ZIOGpXWjRwQWQ2NVppallZRDlOK2xLZld5NVBoVWVoTmVWZHB5OWxjM2FK?=
 =?utf-8?B?MU1ubnoySXltcFNDa2UyRi9COXZrZ3g0UEdWa2FmZnExY2lyU3dHUWVuckpF?=
 =?utf-8?B?UmNnUGh0SVNWdm4wVmZ3ZEhhYkhIc3RYZ3FDRGpKMzEzMG9CWW5uMVF5SXVW?=
 =?utf-8?B?aDZFYTUyMG0xMXZ4bDdjeTNrRTJhTnhlN1QzM3VabWNxaXk5UzRhYW5ENGxS?=
 =?utf-8?B?U3VtYVEyb2Vwd2lva0RSb1dXMzdmRXg3dkE1aG1RbkRsR0FUNmtDTXBTZlhw?=
 =?utf-8?B?MGJscTBwYzRONi9UaXRqR1J2ZXd4aU9ZN3FSZXdvbENOL0ZSTFVvdUxHeVRn?=
 =?utf-8?B?UldNZno4Y1dPM0dXbGE4ZnVXVFR1VzVDMngvYXFGcm9QUVE4R21pNnpoaHJy?=
 =?utf-8?B?bVR1dGRrSU5RdnFnNmJaODdUK09KankrSGRjY1ZaOG5rN2hSNHd2RThtV1l1?=
 =?utf-8?B?dmYxSlY4TnFlNnRscVkyOWh4WlRxV0NBUjNBUnFaY3lHcGg5ZGhsT2l3V2FB?=
 =?utf-8?B?Q3FZekkwakpKdzM2cUZTMnJBamExV295RStaUzM1VVlBV21TeG1uYnFMNmFM?=
 =?utf-8?B?ZG1FUW16T2ozdWhUcG90eWRLcXBjQiszU2RUWVhwNXQrWDlCb2lmcDI5d0gy?=
 =?utf-8?B?TGpjZEd3dkYyMldWL2d0UThVaThOSHo5VzZJc3lmdjIyemJ2dDBIUHhjakEx?=
 =?utf-8?B?VytZUnJrNk9BOU4wUkJwRHJpeUxJazkwNVAvWFV4ZlhrcEl4OUxXTVNKZUFn?=
 =?utf-8?B?dHJhaTBibkRHTFdpekhiNkVxZnZTa1VWdS9wYVlnMU5UeHpRWEFiclpPdG50?=
 =?utf-8?B?RGh5bGl5RDN2dThEZUc3eXR2RlhyN3lFcjZqQzBHMU5QQitYMStLQjQvZHRu?=
 =?utf-8?B?MTJxV21DMzV0eW9GVVA1UXkwaFJmMERTbkRSbzRXSTZpUU5mYjZxK3VsMGto?=
 =?utf-8?B?S2xDM082ZnBqSDd4bldzTW9BSzVNNXRJYjZYZDZFZnRFM2RSYlY1U3M0aU9K?=
 =?utf-8?B?Z1hrSzVndWVJa0c4MUJ1cm5sM2o1Vm4wcFBTQ2diUHZxa28zK0VqUVA4bmJG?=
 =?utf-8?B?bUpxQUNwbFJUQlpLK0Y0RGlpUUYzaUxKWUtjU0JMY0lRTHRzZmVuTjRXdjJx?=
 =?utf-8?B?M0tzNFBBTlhIN2lqQ1JQRS9iUXJYbEV1eWxGYWJYZzhTYWd0Q09qRm9QWjdL?=
 =?utf-8?B?WGlSOVhrNHErL1NMc3dtZlpXdlo4Z29lZ0p2SHFTZEZ0aDZ6K1NIQVMwOVhZ?=
 =?utf-8?B?UEF3WHRJcHJ5MVNVZjh1QjFpeEZUbEdJaHBzcmlkakFJOXFWc1JNK2t2Umth?=
 =?utf-8?B?SmE5bmhZTVJYbUV3ZGxIZ2tkVkhza2hxMmFtUVZTNWdWcGdZVmRVZ2lBQll6?=
 =?utf-8?B?TGJhcFYrRjhQSTJYTmNrMEN5TTRYTjRRYlRLRGh4NzlZcUc4dkozUW8zVEJ2?=
 =?utf-8?B?ZTEvczFsVS84Q0JiY3dROFJHbXBxRXRTN0tIM243WmNVTlp3N0lkQmF2bFND?=
 =?utf-8?B?THlkTzF5MDNaa3VBeXRGVGZCblNFVDBsUEpJWXUzWUNadWdvM3Q1SzduNjdi?=
 =?utf-8?B?M2xGdXB3K3RDRzRtaTRMWmtNNFUrN1Q2eHJoSEJqNWdGWGo4TzVhVlVURUk3?=
 =?utf-8?B?aE9qK3dMY2xvQnhnVXJkd0NPNUg4NzY0YUV3Q3JhSzFVWjJsTmxOK1NycG4x?=
 =?utf-8?B?NFQ0ZnROZVBEd3N6UDRUczIyN3ZodzZpVjI5ZitIWmY4dXk1OXowbFVOUE81?=
 =?utf-8?B?OElCWEhUZE9iMWVwSldwRW1JSGlZQ0ZRbWQyMkI3Ny94ZzlqNDNvVnB3blU0?=
 =?utf-8?B?RVEydnFDRXNoM2t5ZWNNYzJRSUEreFMyd0t4WWV2Qzk1WE9iTS9pZThWOW10?=
 =?utf-8?B?YTZyMERYN2NZeitmR1VaNllxREhEL25jTEVDcGhwdFdzTXZENTAyTDhvcUFK?=
 =?utf-8?B?YlltQ3hySm83Y2RoL3JlMjBlSlJSdWVJS3pBSVdta1pTM3hFVkRwaFlYNDBC?=
 =?utf-8?B?WFdsSXhKVjJkSEFCVXE0RUNqdmVCSmhFTjlmTFlSa1JuekJhOUcxd3EvU1R2?=
 =?utf-8?B?NDdwOUQwemhQTTZrZ0FuMUN5L2NWaDA5OSt1WW5ER1ZwM25meFYrcktUQTBr?=
 =?utf-8?B?THVYTFNWbUx0L21LK0R5VW94UThGd1BDR1E0MGNobCs5WFNuOENwb3RSTzNT?=
 =?utf-8?B?UHRhYURhSjRmNFlnakZJak1BWmtHQ0tUdk1aQUM2dVZpdXNNZnRlUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6536c1a-f4be-41dd-6bfb-08de6ebe5d33
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 07:21:41.9545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j10+h7yCO/g9Npiz66LJCWsx+DIffd3n6/1SlPaxPLI8raae4jbvLrlVMSAdOuq+4MrE0FF1VrZ+rc4FFDT7xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6011
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 07:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231284

R290IGl0Lg0KVGhhbmtzICENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHFh
LWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC1ub3Rp
ZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFlvYW5uIENvbmdh
bCB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KU2VudDogMTggRmVicnVhcnkgMjAyNiAwMToz
OA0KVG86IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnOyBZb2N0
by1tYWlsaW5nLWxpc3QgPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+OyBvcGVuZW1iZWRk
ZWQtY29yZSA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IFBva3li
dWlsZCBVc2VyIDxwb2t5YnVpbGRAeW9jdG9wcm9qZWN0Lm9yZz4NClN1YmplY3Q6IFJlOiBbcWEt
YnVpbGQtbm90aWZpY2F0aW9uXSBRQSBub3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVp
bGRlciBidWlsZCAoeW9jdG8tNS4wLjE2LnJjMikNCg0KT24gVHVlIEZlYiAxNywgMjAyNiBhdCAx
MTowMyBBTSBDRVQsIERlYmFsIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIEdob3NoIHdyb3Rl
Og0KPiBIaSBhbGwsDQo+DQo+IEludGVsIGFuZCBXUiBZUCBRQSBpcyBwbGFubmluZyBmb3IgUUEg
ZXhlY3V0aW9uIGZvciBZUCBidWlsZCB5b2N0by01LjAuMTYucmMyLiBXZSBhcmUgcGxhbm5pbmcg
dG8gZXhlY3V0ZSB0aGUgZm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KPg0KPg0KPiBP
RVFBLW1hbnVhbCB0ZXN0cyBmb3IgZm9sbG93aW5nIG1vZHVsZToNCj4gT0UtQ29yZQ0KPiBCU1At
aHcNCj4NCj4NCj4gUnVudGltZSBhdXRvIHRlc3QgZm9yIGZvbGxvd2luZyBwbGF0Zm9ybXM6DQo+
DQo+IE1pbm5vd0JvYXJkIFR1cmJvdCAtIDMyYml0DQo+IE1ldGVvciBMYWtlLVANCj4gQWxkZXIg
TGFrZS1TDQo+IFJhcHRvciBMYWtlLVANCj4gQmVhZ2xlYm9uZQ0KPg0KPg0KPiBFVEEgZm9yIGNv
bXBsZXRpb246IDI1LzAyLzIwMjYuDQoNCkhlbGxvLA0KDQpBIHVzZXIgcmVwb3J0ZWQgYSBidWls
ZCBmYWlsdXJlIG9uIFVidW50dSAyMC4wNDogcHNldWRvLW5hdGl2ZSBkb2VzIG5vdCBidWlsZCB3
aXRoIHRoZSBkZWZhdWx0IFVidW50dSAyMC4wNCBrZXJuZWwgaGVhZGVycy4gSSd2ZSBkZXZlbG9w
ZWQgYSBmaXggZm9yIHBzZXVkbyBhbmQgSSdtIGN1cnJlbnRseSB0ZXN0aW5nIGl0IGZvciBzY2Fy
dGhnYXAgb24gQUIuIEJ1dCBpdCBtaWdodCB0YWtlIHNvbWUgdGltZSB0byBnZXQgbWVyZ2VkLg0K
DQpUaGlzIHByb2JsZW0gKGFuZCBldmVudHVhbCBmaXgpIHNob3VsZCBub3QgaW52YWxpZGF0ZSB5
b3VyIG9uLXRhcmdldCBhbmQgbWFudWFsIHRlc3RzLg0KDQpSZWdhcmRzLA0KPg0KPg0KPiBCZXN0
IHJlZ2FyZHMsDQo+IERlYmFsIEdob3NoDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIA0K
PiA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFs
ZiBPZiBQb2t5YnVpbGQgDQo+IFVzZXIgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU2Vu
dDogMTYgRmVicnVhcnkgMjAyNiAyMjoxOA0KPiBUbzogeW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZw0KPiBDYzogcWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcN
Cj4gU3ViamVjdDogW3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBj
b21wbGV0ZWQgDQo+IGF1dG9idWlsZGVyIGJ1aWxkICh5b2N0by01LjAuMTYucmMyKQ0KPg0KPg0K
PiAgICAgQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tNS4wLjE2LnJjMikgd2FzIGNvbXBs
ZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXIgYW5kIGlzIGF2YWlsYWJsZSBhdDoNCj4NCj4NCj4gICAg
ICAgICBodHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by01LjAuMTYu
cmMyDQo+DQo+DQo+ICAgICBCdWlsZCBVUkw6IA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3Rv
cHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8yOS9idWlsZHMvMzIyDQo+IDgNCj4NCj4g
ICAgIEJ1aWxkIGhhc2ggaW5mb3JtYXRpb246IA0KPg0KPiAgICAgYml0YmFrZTogMTAxMTg3ODVl
NGE2NzBiY2U0OTgwZTEwNDRjMDg4OGE4YjZlODRhZg0KPiBtZXRhLWFnbDogODYxMTkxNzMzNWY2
ZDFmNWIyOWVhNDk1YzhmNGMyYzkxNDE4M2U4YQ0KPiBtZXRhLWFybTogYTgxYzE5OTE1YjViOWU3
MWVkMzk0MDMyZTlhNTBmZDA2OTE5ZTFjZA0KPiBtZXRhLWF3czogMWE5NjA1YjZjNDc4N2JmMjBm
YzkwYzg4MDFjMzY4MjI3NjBiNGJjOQ0KPiBtZXRhLWNsYW5nOiA2MTMzNjI1MjNmM2JmODVmZjQ4
NjJlMmYxZjAwMTEzYjhkMjAyOGJlDQo+IG1ldGEtaW50ZWw6IDVkMTUzZTM1YjRlNzUyNTA1ZWZl
YWUzNjhmMTg4ZmFjNWUzMWNmMzMNCj4gbWV0YS1taW5ndzogYmQ5ZmVmNzFlYzAwNWJlM2MzYTZk
N2Y4Yjk5ZDgxMTZkYWY3MGM0Zg0KPiBtZXRhLW9wZW5lbWJlZGRlZDogN2E1MDc1Y2VmNzdiNWY3
YWY0NTRlOTg2OGUxZDAwMTlmMmZkMTM5NA0KPiBtZXRhLXFjb206IGVjODBhMzZiY2UxMWQ4MTgy
YjRiYjJhNmZhMDM1OWFkZmVjY2RlMGENCj4gbWV0YS12aXJ0dWFsaXphdGlvbjogOGIxNTQzZTEy
MWRlZGEyNDQ1ZjgwZjc0ZDg1YzEwMzE2ZDViMzFmNA0KPiBtZXRhLXlvY3RvOiA5YmI2ZTZlOGIw
MTZhMGM5ZGZlMjkwMzY5YTZlZDkxZWY0MDIwNTM1DQo+IG9lY29yZTogYTFmNGFlNGU1NjliYzBl
MzZjMjdjMWU0NjUxZTUwMmU1NGQ2M2IyOA0KPiBwb2t5OiAxZDU0ZDFjNDczNmExMTRlMWNlY2Jl
ODVhMDMwNmUzODE0ZDVjZTcwDQo+IHlvY3RvLWRvY3M6IDM2OWYzMzA3MzY4ZWFlYTYwNTk4M2U4
MDA0NzM3N2ZkMTllYmQ2YmYNCj4NCj4NCj4gICAgIA0KPiBUaGlzIGlzIGFuIGF1dG9tYXRlZCBt
ZXNzYWdlIGZyb20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxkZXINCj4gR2l0OiBnaXQ6Ly9n
aXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0by1hdXRvYnVpbGRlcjINCj4gRW1haWw6IHJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4NCj4NCj4gICAgICANCj4NCj4NCj4NCj4NCj4N
Cj4NCj4NCj4gDQoNCg0KLS0NCllvYW5uIENvbmdhbA0KU21pbGUgRUNTDQoNCg0KDQotPS09LT0t
PS09LT0tPS09LT0tPS09LQ0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRv
IHRoaXMgZ3JvdXAuDQpWaWV3L1JlcGx5IE9ubGluZSAoIzY1Nyk6IGh0dHBzOi8vbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLW5vdGlmaWNhdGlvbi9tZXNzYWdlLzY1Nw0KTXV0ZSBU
aGlzIFRvcGljOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTE3ODQxOTIxLzk5
NzYxMjcNCkdyb3VwIE93bmVyOiBxYS1idWlsZC1ub3RpZmljYXRpb24rb3duZXJAbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZw0KVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zy9nL3FhLWJ1aWxkLW5vdGlmaWNhdGlvbi9sZWF2ZS8xNDQyNjk5OS85OTc2MTI3LzQ0MDMzNDU1
L3h5enp5IFtkZWJhbC5naG9zaEBpbnRlbC5jb21dDQotPS09LT0tPS09LT0tPS09LT0tPS09LQ0K
DQoNCg==

