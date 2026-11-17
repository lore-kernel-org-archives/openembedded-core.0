Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16501.1794918273689625524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 04:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZfhFYT0n;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12726; q=dns/txt;
  s=iport01; t=1794918273; x=1796127873;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=Z+iqlmyUw/fc0pU7wej44ax2gvF/np4PLfJkZpdjl/w=;
  b=ZfhFYT0npnNf64tRUl/wBOXGYn9A0MPLhr4E1QdwxQKF+bq1rfUJV+cI
   nT6UYs3VzdCk1jTUZxQqI+gpFklRqUdGmmg2uAaCBUKuxYxdgv4klYfzT
   SAPf424E0ReedHofNVO8+VmwlNSbheqW9B9st48GM7t1xL3jp5BfhOWJp
   ulDDY/t8dZ4pJGEgVqhyGmn9yT/UD2kCRiH/Bs6hdPJYIwtetoyV2pGlI
   i35O9EXMaGOfXWylbsd4mOmRRoOA34bJi2mYsHySeEA/+GHvYdR9O0cc7
   UOtBUQI6lKQa9spXtxYpUMlaKrUQnJHItv2qD45iuXD+mF4yIVQnkBA9k
   g==;
X-CSE-ConnectionGUID: krFmKbyQTgSQjhzZotiWrw==
X-CSE-MsgGUID: Y3VG912sRFqj4S6SxK/Dow==
X-IPAS-Result: =?us-ascii?q?A0CdAwAVR/xq/5H/Ja1agS6BK4E9MVOBCQKBERJJiCMDh?=
 =?us-ascii?q?SuGWYIhA4tlkkGBfg8BAQENAi4BFQ0EAQGFBQKOHwImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgEBAQEDARF3AgEIEQMBAQEBL?=
 =?us-ascii?q?iAHCh0IAgQBEggSCIJhgh0WBwM3AwECDq5FcwKKHXiBNIEBg1sFCQJD2RwNg?=
 =?us-ascii?q?mYUAYE4hUKDAAQbAQEFJklsgl2BIxgBhH0nGxuBcoEVQoJqPoEFgRpCBBiBH?=
 =?us-ascii?q?Sseg3aCMASCInoSG4E5gQIJjA0BAYFPh1pSciIDJjMsAVUTFwsHBYElEDMDK?=
 =?us-ascii?q?i8tI0sFLR1wDCcSKRcRHlgbBgUSICpAQ1uBEoEFXYErKF4CH0YtFYF2AoJRg?=
 =?us-ascii?q?SNdAgFJQQ4HRVMJJT4FEkckIggSCQETGiwKgRo1PAkmPxUMWwwLGgUaRwgCC?=
 =?us-ascii?q?wIMdCgREBMdHiQvBRomPhsKgQ4nIG09NwYPGQMEgTUFkjMHW4MGEgGBDQErT?=
 =?us-ascii?q?4ECAykXAgouGJMTJIJqjDOBfIIhikOUKHEKKIN5in6BJo0+ggCGMheEBJQak?=
 =?us-ascii?q?lQLmH0jgjaLMYQKkVcIhSYCBAIEBQIRAQEGgWg8gVlwFYMiCUoZD44MIhaIc?=
 =?us-ascii?q?8IVeQIJMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-PHdr: A9a23:FkyuaBWfgFxQy63vfSmcFJarrtDV8K3PAWYlg6HPw5pUeailupP6M
 1OavLNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:oQ8DCK0Sreva1XRXRvbD5Ytwkn2cJEfYwER7XKvMYLTBsI5bpzwOn
 GcbD2qHb6yJZGTwKd4iPYTk90tSuZbcyIdkTwpu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmctbTpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGD1sYOK4S699LDlp39
 /wKGjcRby+ZmLfjqF67YrEEasULNsLnOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUidC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjeS9bouFJo3aLSlTtnfDm
 E2Xpj7iOD8DNoCklwGV0TWAgfCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1bfDWkfRTkHY9sj3CMreQEXO
 payt4qBLRRksaaeTjSW8bL8kN94EXF9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:mvMK5avdVPbqMRarPVUYTBQD7skCf4Aji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwR5VoIUmxyXcH2/huAV7CZnirhILGFvAY0WKP+UyFJ8S6zJ8g6U
 4CSdkwNDSTNykBsS+S2mDReLhQoqjjzEnrv5ai854Hd3ANV0gU1XYANu/tKDwOeOApP+tfKL
 OsouB8i36Lf3MRYs6nBn8DcdTiirTw/q7OUFotPTJizBOBow+JxdfBfiSw71MzQjlPybAt/S
 z/lRDl5qKsive/yhXN/W7e5ZZblbLau5V+7cq35fQ9G3HJsEKFdY5hU7qNsHQeu+e08msnl9
 HKvlMJI9lzw2m5RBD0nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxri7VY6tt0U6t
 MJ44vZjesUMfrzplW42zH6bWAsqqNymwtlrQcntQ0bbWLZUs4JkWVQxjIMLH5KJlOK1GluKp
 gfMCib3ocWTXqqK1bEo2Jo3NugGl43HhuAXww+n/b96UkMoJi8pHFomfD2WRw7hcgAo5Uo3Z
 W2Do140L5JVcMYdqR7GaMIRta2EHXERVbWPHuVOkmPLtBNB5vhke+/3FwO3pDjRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOthTAWn+0UzjhwtxXo8ERgMyweJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR/vuN3HnF4pF1xD3H5NSNX4dWssIvctTYSPFnuvbbonx8uDLevfaI7TgVT4iR2PkG3
 MGGCP+Ic1Rh3rbLEMQQCKhLE8FVnaPia6YSpKqjdT74LJ9Q7Fxjg==
X-Talos-CUID: =?us-ascii?q?9a23=3AGPczYWiuDmlvlWBum9Qe6QqBCDJucWfzyVTaMna?=
 =?us-ascii?q?EBl1QSr2He1iM+Zx+jJ87?=
X-Talos-MUID: 9a23:iNVMwQlTFHjLoE5wnyNudnpTb/lHsv30E3ojiJdagJe/JQ83FzCC2WE=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Nov 2026 12:24:32 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 775DB1800045F
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:24:32 +0000 (GMT)
X-CSE-ConnectionGUID: u8ghvZNvSW6cByFjeY1iKQ==
X-CSE-MsgGUID: K8oSMIl/Sm+s0UDSIviaKQ==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,218,1787011200"; 
   d="scan'208,217";a="75587105"
Received: from mail-eastus2azon11011019.outbound.protection.outlook.com (HELO BN8PR05CU002.outbound.protection.outlook.com) ([52.101.57.19])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Nov 2026 12:24:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2/cySBuLpxXb5698cB0r4XNLQWpRclIbgVnJDC/pcDQwo3G5+Q9vjq8WhK7A+5juyWFmthErYfpjtOaF7X1rceukpySzZigKzo3GuFm+h9ki3USq6z52szaCgBikhyQoGt2PjH/BJpOI4Lf+d6QG/yucq7QGXPCVVLh6uXeTaWQSPAcXz8iPwLdj6w8H87zZQxR0q6eqmhQ7CXgE8nNXerrwtoYF2haO4CS3DwXEFphltfcJ/g1zr+xFFAyHpi/FHweLjsf4WjQITMx256G8ag4GT/P0kISzc4BI2pMCrzKjAhlx49ch/vRWV2VVPe83FV3XwdD3GVCMrEOiwciCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+iqlmyUw/fc0pU7wej44ax2gvF/np4PLfJkZpdjl/w=;
 b=Ysw98ra4AsJB/9EZuKJqbC+LeIZW11imQ4OuevgB/ntTq2XUc4Fiq/Q0+R3xaHtuPRdlyOU5pfAVnfne0tbnYzDBvIvjDaDtsI2j8kwZReEhR1QhcvaET2IdE/HkkEvTb9jqdfXwVe8BRrwOiKQcWUjRAYeX2pFOxk/AmKlPQjMRS513p4FcGCNmlpN0z500HQNHlwq/aNTgo02KReGmc5KKuhb5+R7mCbsbFxdVhsn6XzvRksYYXo1m99jkAQ41/AyDbxMC/U+LqHoGyu7k3Nec0//BPTeu7eE0rw51+AZeWp+18n9VfMg9ZG2xmnL4OZfDIS+nglGioQ59s9qwBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7)
 by SAWPR11MB9734.namprd11.prod.outlook.com (2603:10b6:806:4ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 12:24:30 +0000
Received: from PH0PR11MB5952.namprd11.prod.outlook.com
 ([fe80::baf6:8034:a18e:56e1]) by PH0PR11MB5952.namprd11.prod.outlook.com
 ([fe80::baf6:8034:a18e:56e1%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 12:24:30 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] glibc: fix CVE-2026-84243
Thread-Topic: [OE-core][wrynose][PATCH] glibc: fix CVE-2026-84243
Thread-Index: AQHddEDPuIRnAC2rjEGDjk9MBaYz9rcyNH3+
Date: Tue, 17 Nov 2026 12:24:30 +0000
Message-ID: <PH0PR11MB5952D10E604057B6FD0C74EFAD7B2@PH0PR11MB5952.namprd11.prod.outlook.com>
References: <20261112062448.3128219-1-hthakar@cisco.com>
 <DMUZMMCVZLAH.ZKUKO9RWIJCM@smile.fr>
In-Reply-To: <DMUZMMCVZLAH.ZKUKO9RWIJCM@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5952:EE_|SAWPR11MB9734:EE_
x-ms-office365-filtering-correlation-id: 2a6453f4-2e08-490a-3bac-08df44a5bacf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|10067099003|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261022113327099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|13003099007|8096899003;
x-microsoft-antispam-message-info: oxM+hJhw11jSyBrsk20Bzdmz7ms43pHbniRDAAvbGLYnUg35CULvT/W6ujdEAGiwRFBvJnmNwR1BDoWju03O/Yb9DXvRw63Sk5mESfwDc4DNhmSCyK2eR3/sfHvwDaCb7PpPbP32aC0QsnIMUAri2xL6OPuwuoqpOid2U/GhQJDfAGp5EtX55yxrhTXBVk4vsLIVIllJCSJiu6/6z/Kb3SyYqSHjxMnt8LTPOAgzaq0YM3zOHTGUZgYEHSrcflvJfh0F3RUV49UFnU3yOWQnH0VOh4l7tkXD1PSZc753SJ15hJKLa/ci19IJhhwAYjM1Cv58sbB7/U+5b8EzKqEHoksFJa41pbAZs3H1SGVyCMTLSCndA6x26L4GxAbtRn0Il9FxhIG72YMY4KKYz7WxryTmMpu4hLZZzNnjUYoUdCxaN3GC+f0cT9kS7BlO/EU265juR6YtG6lFy1Oj41CPtoPsmDhEJdUo9QdXE2ZuZ+wbOa7V8yi4WLucS9e+K6FG2TEKRTK+SOljBDhw/t7uibv+xY33x7DRkunf9CkE9En5CkLhmdIlztJ/6zZnPnjQ4WnIMkJMMdvkP6mLsu7ZLSdUhfSJiw/1+GuY4p4ZSJbmZGoXLQkO7+Dk+pOuom0wx1ngC+e8SzrdG/wBWytUigaxKpign751++L9CfF7sEg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261022113327099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zBMM1ygDGaD0esPRdezRMiCAVFJ4tV8fxEk3iCdk2oNqs45f0RLMGuT4rM?=
 =?iso-8859-1?Q?aB67SNRqPhj16SE/ZuTV9W4KcHbvErK+B7N0+G+GxCZM0X2C2ZHGh+mu9r?=
 =?iso-8859-1?Q?CArTNVkIL2ROq63LWMByWCjyy4Ogxl5HIhkSLV0iuNxNRp/Yg1FrU4at+E?=
 =?iso-8859-1?Q?t57a13Vz38NTAG2OANlfCe3gE+bY9T10L6lAcFF6W8tqTiQ1Ata7ZOOe1G?=
 =?iso-8859-1?Q?qjxbssUiJHpSsejfZe92tXglAA3RSW8OPBmT4Wi5FMGQHeX3yiFddwNzYz?=
 =?iso-8859-1?Q?2nqUchoIlE43D3GxeVvlTWbCnLZsA4sS6HxDQpEPJAxrfu5a7K56Nr1KkO?=
 =?iso-8859-1?Q?t8vt2eOG4906d9q9n6WiDFGKzjtxt+hallrfV/yt9RdqvBcscV6RmerMl2?=
 =?iso-8859-1?Q?ulhhCCunvbOH27tgMEheRN4Xqx6cQAAC5bFxp5FOv/yBujogLQKw1GYekG?=
 =?iso-8859-1?Q?e2SBQ7KrHmMckhzEOJiMBOgxqt+Db/tyjsYYTbbJF/lvFAoyHYXjyVknop?=
 =?iso-8859-1?Q?/22mOyNHqykGmJZeAdm7gG6GihtJVdyZZHijl20AEG++uIzYelTgdb4fOc?=
 =?iso-8859-1?Q?GGJNZAQurkyIf+qrM+C1/uUo+xxosFqw4XrKgGcht8DQM5O4AB1Sf4j2dx?=
 =?iso-8859-1?Q?5gTWD3dFknEarlFSGrhhe/y+Pyy7aV953ThSAeQCXzbjbSDtG4mpvM/AT1?=
 =?iso-8859-1?Q?qONMUHjzCCLQUsABc5AH5LlVZu98EUA+UQNFiHxRKXFB/qDNEAi9ZUuwPk?=
 =?iso-8859-1?Q?C1IllqfJn0XlpbEA6i7MWbd4kBz7Ac3GRwn5BWwvlwlXLYy/nOJCflFtI4?=
 =?iso-8859-1?Q?3C/xc1EBhGp4UsQ9TL7Qst4wDAximd1weTXC86JuCPJcenZ4oC6LtwiVAf?=
 =?iso-8859-1?Q?apCcbzTD9Zq5ZrSrsLPyDTPVt/3e8MvKxAdu7W+OpPm3fv06fnDsqGxpqA?=
 =?iso-8859-1?Q?DKsO+CXOKkEWEi34l4KeG9zbEgdHAkyJf+eoYGoZ6rjVyvwZT4tkz7Sl4v?=
 =?iso-8859-1?Q?t+Cn1FMSnaf+yfGy8O4ZkvTmsr22k9rnpWf2i9a/jJVqNZbEPK4MvW9gbX?=
 =?iso-8859-1?Q?KpDCHwp6y4/w39+CWtXjRA1NECdjKfzU0kCtlZnyEoOQf5qVtGV+0SwlsC?=
 =?iso-8859-1?Q?WcSNYz+Wy0SaD63QkQGBVcKEFaCafdn5ddEHZwkFspZnfXvLgav7GS1v5f?=
 =?iso-8859-1?Q?saWY0hkJwBkN0kLgpAMCbFlT+bcN34wZjAQMeBmSwqUAI67phMpJqHBrWS?=
 =?iso-8859-1?Q?EXl/I5x3X2WId2BUyAw8IcAQNT5/Z+XH2WxIfU07ClGRF5sJjADUgclJZt?=
 =?iso-8859-1?Q?KO+GgEB3tXsnymKlYl+7OxL0bGD2EP3phX499Df3yps7JqBYklDT3zCMGG?=
 =?iso-8859-1?Q?3eCCuQpCz1vzNpFmumbikX33PpWHbGXAbGcy3pNxvS23abij8anUZZ1WGS?=
 =?iso-8859-1?Q?SP1OXfvY/qomMUhgCdGdZGGmiYhMbDBVdjtx5j5suobCXzqdCzcz4R6xFM?=
 =?iso-8859-1?Q?y7+Nbhlsv8hecGQqsOwCv00dfrZ1ow4JGaVWtehN0ifYHTrKQ/HHlSDiJr?=
 =?iso-8859-1?Q?8z9VQgbLwG/uKSpHjrl4dvauHhZD9xTYmEq2IhN/bBPTBEWyveNRa2ezag?=
 =?iso-8859-1?Q?siFNPHfS4tY/z3ogWzR7/o+kRl/DAsC/byPW8WNMGuqoHbwe9GOMX2MIWm?=
 =?iso-8859-1?Q?IdoHLT/viXtCGl7x9aIynBFxh7mw1ab8oupnKLBZxHQDpgN6u7DAVRuHR0?=
 =?iso-8859-1?Q?2NvIcY4bj3tiwhy2QPt0fvQMmgiLTSZ2sB41q+VV2JiZzP?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5952D10E604057B6FD0C74EFAD7B2PH0PR11MB5952namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tcKXjIr8rKXd4uaJ0UsGSvyiTzFGlBnh1dtd6tZ7P7qfY067HCrSrqY0DAzuANbpSALbUDw+0vHo234kAKfEU2STe7UY0+7nK8b2JSwm61A0uqa4i6PUsqMO2YE4rEMAZ6YWG8kNAxAVn3+rcubq0wTiFh9yWP5auWXAa9PzgS2GSMCUL+E6SomO7Qdc18NeZF9sEWl6StL0F6uyraXqG/dfo3iUWk7quu1r+Qpugym6itcTXrr4931CecgxPcpIg5Cal3rvAN10NVyrWegitKK65k8RDG30/14SVz3j9kHKdL1+1ib40H1jUXN40qLZ0InstUmIFt5wESFrvKFJdQ==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6453f4-2e08-490a-3bac-08df44a5bacf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 12:24:30.4147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G+nMWx4OhkNZ6CyPpvX1DEQ1aKnh7OWfK2bAIhudAK9ZayO1lc3VYBOllORXDlwxmyL6lipiVQmJku8cCRglqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9734
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-1.cisco.com [72.163.7.162];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250437

--_000_PH0PR11MB5952D10E604057B6FD0C74EFAD7B2PH0PR11MB5952namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
Thanks for pointing this out.
I will update the recipe to the latest revision of the upstream 2.43 branch=
 and submit the revised patch.
Regards,
Hetvi

________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Saturday, November 14, 2026 19:32
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@=
lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] glibc: fix CVE-2026-84243

On Thu Nov 12, 2026 at 7:24 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS =
PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> Backport the upstream fix [1] for the LANGUAGE directory traversal
> reported in [2]. Reject locale entries containing path separators or
> equal to ".." for all programs, while retaining valid entries in
> colon-separated LANGUAGE lists.
>
> Keep the upstream regression test and adapt its Makefile integration
> to the 2.43 layout. Omit only the NEWS entry for the later release.
>
> [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D03067f3c5e39=
aec5ec250a44bc1b395a1afd45e8
> [2] https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob_plain;f=3Dadvisori=
es/GLIBC-SA-2026-0025
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../glibc/glibc/CVE-2026-84243.patch          | 194 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.43.bb         |   1 +
>  2 files changed, 195 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-84243.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch b/meta/re=
cipes-core/glibc/glibc/CVE-2026-84243.patch
> new file mode 100644
> index 00000000000..d64c7fea1d7
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch
> @@ -0,0 +1,194 @@
> +From 03067f3c5e39aec5ec250a44bc1b395a1afd45e8 Mon Sep 17 00:00:00 2001
> +From: Avinal Kumar <avinal.xlvii@gmail.com>
> +Date: Mon, 2 Nov 2026 17:18:03 -0300
> +Subject: [PATCH] intl: Restrict path traversal when using LANGUAGE env v=
ar [BZ
> + #17142, CVE-2026-84243]
> +
> +The fix for CVE-2014-0475 (Bug 17137) added valid_locale_name() in
> +locale/findlocale.c to reject locale names containing ".." path
> +components.  However, the LANGUAGE environment variable processing in
> +intl/dcigettext.c was not covered by that fix.  An attacker who can
> +set LANGUAGE (e.g. via SSH AcceptEnv) can force any gettext-using
> +program to load a crafted .mo file from an arbitrary filesystem
> +location via directory traversal.  A crafted .mo file can crash the
> +program through out-of-range offsets or through format-string
> +translations that consume more arguments than the caller passes,
> +causing undefined behaviour in *printf.  glibc cannot fully protect
> +against the latter at the gettext level.  The safety of .mo files
> +normally relies on them being produced by msgmerge and msgfmt -c and
> +installed in read-only locations; path traversal bypasses this trust
> +model.
> +
> +Remove the ENABLE_SECURE gate from the IS_PATH_WITH_DIR check so it
> +applies to all binaries, not just SUID/SGID ones, and extend it to
> +also reject the bare ".." entry which contains no directory separator
> +but still names the parent directory.
> +
> +Add tst-gettext-path-traversal to verify that locale names containing
> +path separators or equal to ".." are rejected by the LANGUAGE processing=
 loop.
> +
> +This fixes bug 17142 and CVE-2026-84243.
> +
> +CVE: CVE-2026-84243
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dgli=
bc.git;h=3D03067f3c5e39aec5ec250a44bc1b395a1afd45e8]
> +
> +Backport Changes:
> +- Omit the NEWS hunk for the later 2.45 release section, which is absent
> +  from the 2.43 branch.
> +- Adjust intl/Makefile context for the 2.43 layout, retaining the upstre=
am
> +  test registration, catalog and locale prerequisites, and OBJPFX flag.
> +
> +Suggested-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> +Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
> +Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> +Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

Hello,

If I'm not mistaken upstream backported this patch to the 2.43 branch in
commit 45e49b1ea2e5 ("intl: Restrict path traversal when using LANGUAGE
env var [BZ #17142, CVE-2026-84243]").

I think we should update to the tip of the 2.43 branch instead.

Regards,
--
Yoann Congal
Smile ECS


--_000_PH0PR11MB5952D10E604057B6FD0C74EFAD7B2PH0PR11MB5952namp_
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
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks for pointing this out.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
I will update the recipe to the latest revision of the upstream 2.43 branch=
 and submit the revised patch.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Hetvi</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Saturday, November 14, 2026 19:32<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;op=
enembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH] glibc: fix CVE-2026-84243 </d=
iv>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Thu Nov 12, 2026 at 7:24 AM CET, Hetvi T=
hakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-=
core wrote:<br>
&gt; From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt;<br>
&gt; Backport the upstream fix [1] for the LANGUAGE directory traversal<br>
&gt; reported in [2]. Reject locale entries containing path separators or<b=
r>
&gt; equal to &quot;..&quot; for all programs, while retaining valid entrie=
s in<br>
&gt; colon-separated LANGUAGE lists.<br>
&gt;<br>
&gt; Keep the upstream regression test and adapt its Makefile integration<b=
r>
&gt; to the 2.43 layout. Omit only the NEWS entry for the later release.<br=
>
&gt;<br>
&gt; [1] <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=
=3D03067f3c5e39aec5ec250a44bc1b395a1afd45e8" id=3D"OWAabe0d051-d761-46b6-1f=
78-1129b174e7e2" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D03067f3c5e39aec5ec=
250a44bc1b395a1afd45e8</a><br>
&gt; [2] <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob_plai=
n;f=3Dadvisories/GLIBC-SA-2026-0025" id=3D"OWAf1d59f6e-5f61-f06b-f0a8-200a8=
2cde56a" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob_plain;f=3Dadvisories/GLI=
BC-SA-2026-0025</a><br>
&gt;<br>
&gt; Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../glibc/glibc/CVE-2026-84243.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 194 ++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-core/glibc/glibc_2.43.bb&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 195 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-84243.=
patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch b/meta=
/recipes-core/glibc/glibc/CVE-2026-84243.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..d64c7fea1d7<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch<br>
&gt; @@ -0,0 +1,194 @@<br>
&gt; +From 03067f3c5e39aec5ec250a44bc1b395a1afd45e8 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Avinal Kumar &lt;avinal.xlvii@gmail.com&gt;<br>
&gt; +Date: Mon, 2 Nov 2026 17:18:03 -0300<br>
&gt; +Subject: [PATCH] intl: Restrict path traversal when using LANGUAGE en=
v var [BZ<br>
&gt; + #17142, CVE-2026-84243]<br>
&gt; +<br>
&gt; +The fix for CVE-2014-0475 (Bug 17137) added valid_locale_name() in<br=
>
&gt; +locale/findlocale.c to reject locale names containing &quot;..&quot; =
path<br>
&gt; +components.&nbsp; However, the LANGUAGE environment variable processi=
ng in<br>
&gt; +intl/dcigettext.c was not covered by that fix.&nbsp; An attacker who =
can<br>
&gt; +set LANGUAGE (e.g. via SSH AcceptEnv) can force any gettext-using<br>
&gt; +program to load a crafted .mo file from an arbitrary filesystem<br>
&gt; +location via directory traversal.&nbsp; A crafted .mo file can crash =
the<br>
&gt; +program through out-of-range offsets or through format-string<br>
&gt; +translations that consume more arguments than the caller passes,<br>
&gt; +causing undefined behaviour in *printf.&nbsp; glibc cannot fully prot=
ect<br>
&gt; +against the latter at the gettext level.&nbsp; The safety of .mo file=
s<br>
&gt; +normally relies on them being produced by msgmerge and msgfmt -c and<=
br>
&gt; +installed in read-only locations; path traversal bypasses this trust<=
br>
&gt; +model.<br>
&gt; +<br>
&gt; +Remove the ENABLE_SECURE gate from the IS_PATH_WITH_DIR check so it<b=
r>
&gt; +applies to all binaries, not just SUID/SGID ones, and extend it to<br=
>
&gt; +also reject the bare &quot;..&quot; entry which contains no directory=
 separator<br>
&gt; +but still names the parent directory.<br>
&gt; +<br>
&gt; +Add tst-gettext-path-traversal to verify that locale names containing=
<br>
&gt; +path separators or equal to &quot;..&quot; are rejected by the LANGUA=
GE processing loop.<br>
&gt; +<br>
&gt; +This fixes bug 17142 and CVE-2026-84243.<br>
&gt; +<br>
&gt; +CVE: CVE-2026-84243<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/gitw=
eb.cgi?p=3Dglibc.git;h=3D03067f3c5e39aec5ec250a44bc1b395a1afd45e8" id=3D"OW=
A220f24d4-08ce-113a-a71a-8a641d917e4a" class=3D"OWAAutoLink" data-auth=3D"N=
otApplicable">https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3D03067=
f3c5e39aec5ec250a44bc1b395a1afd45e8</a>]<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- Omit the NEWS hunk for the later 2.45 release section, which is abs=
ent<br>
&gt; +&nbsp; from the 2.43 branch.<br>
&gt; +- Adjust intl/Makefile context for the 2.43 layout, retaining the ups=
tream<br>
&gt; +&nbsp; test registration, catalog and locale prerequisites, and OBJPF=
X flag.<br>
&gt; +<br>
&gt; +Suggested-by: Adhemerval Zanella &lt;adhemerval.zanella@linaro.org&gt=
;<br>
&gt; +Signed-off-by: Avinal Kumar &lt;avinal.xlvii@gmail.com&gt;<br>
&gt; +Reviewed-by: Adhemerval Zanella &lt;adhemerval.zanella@linaro.org&gt;=
<br>
&gt; +Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
<br>
Hello,<br>
<br>
If I'm not mistaken upstream backported this patch to the 2.43 branch in<br=
>
commit 45e49b1ea2e5 (&quot;intl: Restrict path traversal when using LANGUAG=
E<br>
env var [BZ #17142, CVE-2026-84243]&quot;).<br>
<br>
I think we should update to the tip of the 2.43 branch instead.<br>
<br>
Regards,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH0PR11MB5952D10E604057B6FD0C74EFAD7B2PH0PR11MB5952namp_--
