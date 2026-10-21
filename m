Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4531.1792557926382925265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 21:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FBxi59Vl;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15355; q=dns/txt;
  s=iport01; t=1792557926; x=1793767526;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=LOAqAmTA8zrKt0gKmBpzohknMANR4mOijBqWJb/NQ6Q=;
  b=FBxi59VlKmfUzAISmJgyrDwhMhJCnUu6tQYZ7rK1JUQ2rXu9U83Y5Bs+
   Yo1r8CGVAbNm7SYzcE9U1OCkceykQ17CI13DJKzUqqbCYChrs+5o6+KWo
   s/7FxXoVYpKI+b9kafl9v+651y7GgILWgmncBBsZL0+2rStfXG0WOBrII
   l44d+1QSzTYiWrHW41SObL6NrboN6Zt1J7g/XotBCxfhiqDVM+8smw4Vh
   QAuuVUb4dCA4LpfKd+5dIcwEQPsZ0eaaMAs0zjb8FHjdFzgGPHTpibJ7t
   y0GyyUt3Put9Na1SGs98AcCWZ8ShzvHtSKMX5WLTjLJfTVAfnrU4ktmhA
   Q==;
X-CSE-ConnectionGUID: YJCig/JoS9CIUsxqCC8ytQ==
X-CSE-MsgGUID: /Lpndn3STmy8ifh8js+8mA==
X-IPAS-Result: =?us-ascii?q?A0CDBABLQthq/5QQJK1agS6BK4E9ATBTgQkCgRESSYgjA?=
 =?us-ascii?q?4UrhlmCIQOeHBSBag8BAQENAi4BCBoEAQGFBQKOFQImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgEBAQEDAUoBGyICAQgRBAEBA?=
 =?us-ascii?q?R0RJwodCAIEARIIgnuCHRZBAwECqkUCih14gTSBAYMpAd0SFYE4hUCDAxsBA?=
 =?us-ascii?q?QUmSWyCXYEjGYR8JxsbgXKBV4JpPoJhBAGBNA8chBOCMASCInoSG4JCCpNhU?=
 =?us-ascii?q?nIiAyYzLAFVExcLBwWBJRAzAyAKLy0CFA0iDxoFLR1wDCcSDx0XER5YGwYFE?=
 =?us-ascii?q?iAqQUMyK4EZIxk2a4EJXYErKWECH0YtFYICAoJRgSNdAgFJQQ4HRVMJJT4FE?=
 =?us-ascii?q?kcmIggSCQETGi4LgRo4PAkoQRUMXAsMGgUbTQgCCwIJB4EBGm09NwYPGQMEg?=
 =?us-ascii?q?TUFkHIHW4IVcoEPBx4oLYFEGTKTG49Bo3cKKIN2inyBJo0+iDIXhVulFJkII?=
 =?us-ascii?q?6NHI4ULAgQCBAUCEAEBBoFoPIFZcBWDIglKGQ+XN8gceQIBOgEBBwIHDgMLg?=
 =?us-ascii?q?WiQAIF+AQE?=
IronPort-PHdr: A9a23:8gI1bxUgNUrFWv9lFuspxOTBG+fV8K3PAWYlg6HPw5pHdqClupP6M
 1OavLNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:qkoO+6t1fPybhv/qmLePA5AXiufnVAhfMUV32f8akzHdYApBsoF/q
 tZmKT2BP6mOM2P2KdwlPN/i9x4DvpGDyoI2Gwtp+yA0QX4WgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvrZ8Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwy8RcAG4J1
 /sjeRssUwuTnsmdkKOnc7w57igjBJGD0II3s3Vky3TdSP0hW52GGvyM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgd/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIqKJoPXGZgMwS50o
 EqB23z/DhdBD+Ca2GqE/HL8hPSMzSbSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzFdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ22JW9QnOG/bDSpjS3URX550dbDcPYZWPpO+Xenbw=
IronPort-HdrOrdr: A9a23:ygikQq2jrYIeeZDuO94hCAqjBbtxeYIsimQD101hICG9Lfbo9P
 xGzc566farslcssSkb6K+90cm7LU80hqQFn7X5XI3SEDUO11HYV72KgbGSpwEIXheOitK1tp
 0QPJSWaueAd2SS5PySiGLXYrRQpeVvsprY+Ns2pE0dKz2CHpsQlzuRfTzra3GeKjM2YqYRJd
 633OYCjTymfngcc8S8AVc4f8Wrnbf2vaOjSyQrQzo85iezrR7A0tPHOind8gYVUjtJz7tnym
 7Yjgz/6JyktvGw2jXc22XQ45k+oqqu9jJEPqOxo/lQDg+pphejZYxnVbHHlisyuvuT5FEjl8
 SJiws8PuxogkmhPl2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZSB3E8EAt1esMk5
 6jnljp9aa/Pymw2BgV1OK4EC2CUXDE50bKpNRjykC3l7FuMYO547ZvpH+9W61wbR4SoLpXYN
 WGSvuspcp+QBe9c23TuHVpzZiHW3Q+GQrDf2050/bliAS/WBtCvhYlLAt1pAZbyHowJqM0lN
 jsI+BmkqpDQdQRar84DOAdQdGvAmiIWh7UNnmOSG6XX53vFki94qIf2o9FrN2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlO/grWSGuwUDzxwoUGjqIJ94HUVf7uK2mOWVoum8yvr7EWBdDaQe
 +6PNZTD+X4JWXjFI5V10n1WoVUK3MZTMoJ0+xLEW6ms4bOMMnnp+bbePHcKP7kFislQHr2Bj
 8ZUD36NKx7nzaWs7/D8W/ssl/WCzjCFMhLYdrnFsAouf0wCrE=
X-Talos-CUID: =?us-ascii?q?9a23=3AD15Sy2qmYeka5hL19feuraPmUfEHWXzSi1XXGB6?=
 =?us-ascii?q?TKFtyWKS+Yg+B5Joxxg=3D=3D?=
X-Talos-MUID: 9a23:uke5LAbhyVyFfeBT8Bv0gj1kb/xU5rX+CU4NwZcd+JmBHHkl
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Oct 2026 04:45:25 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 3F72A180003B8
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 04:45:25 +0000 (GMT)
X-CSE-ConnectionGUID: LSag1ewZS4e/HetE4AZIng==
X-CSE-MsgGUID: DdMqTts+RHqJDibQnhR6ow==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,169,1787011200"; 
   d="scan'208,217";a="90102820"
Received: from mail-westus2azon11010070.outbound.protection.outlook.com (HELO CO1PR03CU002.outbound.protection.outlook.com) ([52.101.46.70])
  by alln-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Oct 2026 04:45:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXhvzbgY4RMNWOeBvqfsRdWqrbT7ye3+SoOmn7FXtqfjiCm3bRHRIwgJegUU/tuVnNVKKtq1UpNY1jNI2+LOgJcLG1RVvuHuS2XwqRwiy5oPWDxMML9G+J53YyFqJSXSaSDHBy01l8OdBMU5oZ8zTOi1gfERGtU5Q3XgNv1kYCse88ks/nqxmCThec1gH4EjFtzus9TodcFoqXrK/f8pXSB9IpyRpkLVDTPaRjM2yk0PLVz2E5LlgA8KEQMMCwTBOJvDjJnkJNIKO85jcoe1HBhZSHZ6/anRPRcmExInNFKivIs8jTE6qKC94Hsl7oKYiduqMnKq+ToMh1t9dM129A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOAqAmTA8zrKt0gKmBpzohknMANR4mOijBqWJb/NQ6Q=;
 b=bQZujxjtYl+k5v8cjc49F9kRP+SY5baBa7pkyQpRBgaXO8FP0RW7v/AOPhpHqzVsL2JxrgY4UTc65Kij0lsud/F236dsAE8kpo2OgSdOe0u3K1XgHw2W0FGZ5moytq4ooOF3qRtNAwo2LKKHhszS+eIQpF+pAYFW6IItIUAlXvBAZ36DmvjIeTHVyA2Am3qt5uBYEFMCBdMEhEZSBfGMQDjQhohco2wTxXDdFOYyPjqP4iyPCKwrv4p8ZhSZXYm2sMvh7E4dsiscAOeyH7WCjThhcISQMloWKKLh/j1xJGx1sbiwzU9ine64Hd2KxJIaZ77hJDtTI+6xkg1kYFVOgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 by PH8PR11MB9723.namprd11.prod.outlook.com (2603:10b6:510:3a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 04:45:23 +0000
Received: from MW3PR11MB4585.namprd11.prod.outlook.com
 ([fe80::f24d:4165:33b5:d7dc]) by MW3PR11MB4585.namprd11.prod.outlook.com
 ([fe80::f24d:4165:33b5:d7dc%5]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 04:45:23 +0000
From: "Yogita Urade -X (yurade - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<yurade@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 0/27] python3-git: Security fixes
Thread-Topic: [OE-core][wrynose][PATCH 0/27] python3-git: Security fixes
Thread-Index: AQHdYH8QK6Hp6adOTkSC68/j9XIvxLcHbAju
Date: Wed, 21 Oct 2026 04:45:23 +0000
Message-ID: <MW3PR11MB4585BBE477EEEB911CBF0F5DDE662@MW3PR11MB4585.namprd11.prod.outlook.com>
References: <20261016054106.210444-1-yurade@cisco.com>
 <DM9LM8QRRKOE.3C49LIEPEZUK1@smile.fr>
In-Reply-To: <DM9LM8QRRKOE.3C49LIEPEZUK1@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4585:EE_|PH8PR11MB9723:EE_
x-ms-office365-filtering-correlation-id: ae30b249-f3d6-4ec2-afc4-08df2f2e1e41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003|8096899003;
x-microsoft-antispam-message-info: oRacdpSHnjA59KbFvfivhWFT1/G/uFlDGe+EePJ9o9DTXOVtBiCbt8RNC+Ak2PSSvP0bPW3CNNaE99JjXXxT+y11palVoPc8+/PdgjM0FissLL9BmXvw2TORZ907eeRvt56z1IGkfuJgZNXHjFZaQ0TKHgV95HTVfCrqYJ+nB8K3SHRI3XrfSwC44kN2FZ/W2ngiyODTTK8ep8uT9e153dehCYZ2oGNMTiyZcB1tOdGfPZRyxTxw+UN29OwxvCP6KyVKNDHfghBtIMDmLJqA2Kp/mt18tpYY7i++U+cm8kopRj2/DGyywBFR2D4sF5QK5nwDl1MExLi/olnMx8ACahIPP/aVFtEgiiiQy8E14kRbL/y96XwYQ3z8LWhv/QP35AhW+xLeiEz89JV9Zl4C9ghmzQ6qNKIDMuDfZ1Ud2RAn/elsQLkxd5tsivHtBp/IC6Q+ipVwWriQuzLWX4NC5hXXhK+F+1O5QNW6fgKA3Ze+9T9rV7t84vCzrT9PBD74jhlTmP+6ZHpFDjbvCtn6v4WZBqfPgrVX9IjniZkeL1iVdTmzNujil6HudHNbf/WqXTVj7RZTvSJyRuOCVMLKo40nFBT+XN/VN8kTJ0yAXGDqdiiGAVUtwz9YhiVPlBNMjtZcZi6QYQjQIWHHq5zDO990F6EcBkXQU3E9XXgUY92ZAQxq0t6Zjk5w/d66r0tKxHo1tISJnCNy46qL8tsrQG0UrRQs+bIwOCtWmD90BPs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4585.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WxEWXmkwBC430t0jH1qJQESteiGDO0keYK3dmtHjcF4Vh+N03RAgLwzND76w?=
 =?us-ascii?Q?FXiZlOdbtAg4xhpPQ1TNzrR1LKqnxhN1wZoPCBYcaxw0gzidzmNtREEO/lUK?=
 =?us-ascii?Q?nOd9JDT7RDEoKwOtjd5hRuea6cSk4szFd3X0VcIXO0bjI2B601GCqAPR/Mey?=
 =?us-ascii?Q?105yd7ea8TMcL1ICt4aKyzANJ2z8V5sV07jFGndWoU9eE0Off2jTr3hJjG75?=
 =?us-ascii?Q?s0ox/VM1x/wfztnp3y5XFbSIXaq8k8rS1d9K6X1Oc72hMA5zBFsBI/xkrLUL?=
 =?us-ascii?Q?zXytMSkYtfReexRGO7Mgf9pv9b7P8/5o8y2va1wMJ3+q6QLKdD/spFIee4sh?=
 =?us-ascii?Q?gBF6j8DiUjptui7Owzp92GIP25aGJPil8ogVRsWyJBh6FcCfj9GXa8LbBg0G?=
 =?us-ascii?Q?l3fipwDcz6pTFghIxFyttEjqXDUUKiRTroCfwYNP3H5Asvu+y1niEiyJFPka?=
 =?us-ascii?Q?3WygSxf26C022n3J45egRjcMy01CwWjtwNnk7DzMupqnx8b1a2+uJXd2oeic?=
 =?us-ascii?Q?aWuGgueNLBeKWmlOLlNq1mXGOp0i62u1j250Lc0yyLi/O3a2QfQNMRUX3zyf?=
 =?us-ascii?Q?WDLru2uO2aTS5W4XqKsGbCAso1gO0rpL0gLh8YNYw2WvIc6B+7S2bilzPWMZ?=
 =?us-ascii?Q?N+ZKYxik18uCQLkjNlLfmSnX1k8yok1vKx/aYAJ/CSJaXm+RpR94f85bZpFm?=
 =?us-ascii?Q?RJ4Ju1cd7YzZ/SinNufzD+XMzIUFZYt5Ku9/trwQizqmp+8H+tH4t2w4lqxR?=
 =?us-ascii?Q?otcj+Gnv0wxB4gqPdXNMALAAOQl3TpW5/8Uc1Prd8pmFAVkx9HLb+BQMpey5?=
 =?us-ascii?Q?K+6zpk2C7ajjECsXbSGcAvV3I4v1GT498QB51E5QOhUIT391WMbjYEjO+3Dj?=
 =?us-ascii?Q?+wbFIr0FZbywdYxG7r4n/Tfni0VDp2Z0xwqtHYheTbe/rg3rBjsKIvsPMwm4?=
 =?us-ascii?Q?TrP7CEyH5bhckg96G/HUHENfDRUJBcQpRRl2IKbgEta4vs5iwbE/VgcuQWIx?=
 =?us-ascii?Q?z57j8Fowi4NM1ISsOMGRdHHLwuZsm9PsElHSnPVFX+diAUPFIPc/vrAghGbV?=
 =?us-ascii?Q?Km+lQsVhY2RTW64Txcev3FesUHAIUvvnp/E/UADF4zAkjq4hauSGIBbVbxog?=
 =?us-ascii?Q?OhrVf5POFfjB7ZdZvvjQTtyr0ZN8VoGK/pFWLenLmqqbnDzFAttUnF01EYRw?=
 =?us-ascii?Q?YETdnVvJnK3vOD/5wUqjIxHJhEcYsfDR9zp77K5MWwUvKMDE51sCpCOhE+Vd?=
 =?us-ascii?Q?fTfam8UMqgigCZDjoNMJG2AljuxRa/nYcsyx1yfmLASUVZJFQdtXJcvHVOeX?=
 =?us-ascii?Q?p3NummcSqblvecev8AVEd1VkzuHm/jcB1z6uzfUIjKDGnbE5ykiTlupKlxSZ?=
 =?us-ascii?Q?5WMQj7cYnGPdJDlCQa8NTXYvly9ZkruQIwhQhi6fhh2gPTODp2ENzT12lx24?=
 =?us-ascii?Q?+uQpufSdlH2nrU/FJyfNhLjiBWEfEezXwqv5D/8d5pB9IMAMykc6d6m/hcH5?=
 =?us-ascii?Q?8T1GxX0oyJAEwjVJK8ZVvA6PpEznulSqvecwnhPSbAzpjLZzUNLGBqLp9GnH?=
 =?us-ascii?Q?JO7g4ZlLtiIZ/tp6oZt/lxE8BB6wiPLBF3XtGM/gi/Jbq5emYcH/16xMk43R?=
 =?us-ascii?Q?S7IZ386yKM1Gsu+SzM4eeqfyGRqcKpxOwYes3qGSooYTm+lnG6Ygve3ISyWC?=
 =?us-ascii?Q?NtWBHuMlbguKuEulSTe+60TfPi3qeR3IZt/8woVIKF/v6n0b?=
Content-Type: multipart/alternative;
	boundary="_000_MW3PR11MB4585BBE477EEEB911CBF0F5DDE662MW3PR11MB4585namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lV481FbhtpKwDFrrN23NIau7yFxMfmOC53NLCqH4qpeosQtNA0r5UCXmD82HEsKugkkORPC4Hdz+o2uf5IzsfyYvwXWH4j5xmmibf1HU6qBsrbL09OqlVwl4xmsd/zpXk1ApdhE5MLeVQ2I5mHLf3RALe3fc6OkIzEe/hmffQrVT7yurnTgzEUOTzrPHOnlJtueJYAPX1LBFSUefEcx4s28B0SzwToKwpyE017/DBPy9jH3Z3VXiwa03MsxWMcn5ku66vTPcHwvB+XRj5fdKX1uePtkMAJaYCn7QRN4N6vMbRlsWJuz+RVtk3znwAkH7lQbKHWQ4gAI+AN/b9X1q5g==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4585.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae30b249-f3d6-4ec2-afc4-08df2f2e1e41
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 04:45:23.2057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pu2z4WvjhbpTeah+yhXLKgxwKBRBuBKCj0qqtzH5vpxQpJMiNM4+SUeo3E0yL60BF54uXDV8Heeh0RDikCLTOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9723
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-1.cisco.com [173.37.147.229];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 04:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248348

--_000_MW3PR11MB4585BBE477EEEB911CBF0F5DDE662MW3PR11MB4585namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the review and for pointing out these issues.

I'll review the entire series again, address the concerns regarding the ups=
tream changes, metadata removals, and CVE references, and resend an updated=
 version once everything has been verified.

Sorry for the extra review round.

Regards,
Yogita

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: 20 October 2026 16:07
To: Yogita Urade -X (yurade - E INFOCHIPS PRIVATE LIMITED at Cisco) <yurade=
@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@li=
sts.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 0/27] python3-git: Security fixes

On Fri Oct 16, 2026 at 7:40 AM CEST, Yogita Urade -X (yurade - E INFOCHIPS =
PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> Backport 27 GitPython security fixes covering 28 CVEs to the python3-git
> 3.1.43 recipe on wrynose. The series adds the fixes as patches and update=
s
> the recipe to apply them.
>
> CVE-2026-78678 and CVE-2026-78679 are addressed together. The CVE-2026-76=
222
> fix includes a regression correction and follow-up patch, and the CVE-202=
6-87819
> fix is carried in two patches. The patches retain upstream references.
>
> Yogita Urade (27):
>   python3-git: fix CVE-2026-67326
>   python3-git: fix CVE-2026-67323
>   python3-git: fix CVE-2026-67325
>   python3-git: fix CVE-2026-67324
>   python3-git: fix CVE-2026-67322
>   python3-git: fix CVE-2026-69097
>   python3-git: fix CVE-2026-73625
>   python3-git: fix CVE-2026-73623
>   python3-git: fix CVE-2026-73624
>   python3-git: fix CVE-2026-73622
>   python3-git: fix CVE-2026-73621
>   python3-git: fix CVE-2026-73620
>   python3-git: fix CVE-2026-73619
>   python3-git: fix CVE-2026-76221
>   python3-git: fix CVE-2026-76220
>   python3-git: fix CVE-2026-76219
>   python3-git: fix CVE-2026-76218
>   python3-git: fix CVE-2026-76217
>   python3-git: fix CVE-2026-76222
>   python3-git: fix CVE-2026-78678 CVE-2026-78679
>   python3-git: fix CVE-2026-78677
>   python3-git: fix CVE-2026-78676
>   python3-git: fix CVE-2026-78675
>   python3-git: fix CVE-2026-87817
>   python3-git: fix CVE-2026-87818
>   python3-git: Fix CVE-2026-87819
>   python3-git: fix CVE-2026-100689
>
>  .../python/python3-git/CVE-2026-100689.patch       |  90 +++++
>  .../python/python3-git/CVE-2026-67322.patch        | 167 +++++++++
>  .../python/python3-git/CVE-2026-67323.patch        | 356 +++++++++++++++=
++++
>  .../python/python3-git/CVE-2026-67324.patch        | 101 ++++++
>  .../python/python3-git/CVE-2026-67325_p1.patch     |  49 +++
>  .../python/python3-git/CVE-2026-67325_p2.patch     |  50 +++
>  .../python/python3-git/CVE-2026-67326.patch        | 108 ++++++
>  .../python/python3-git/CVE-2026-69097.patch        |  48 +++
>  .../python/python3-git/CVE-2026-73619.patch        |  58 +++
>  .../python/python3-git/CVE-2026-73620.patch        | 130 +++++++
>  .../python/python3-git/CVE-2026-73621.patch        |  72 ++++
>  .../python/python3-git/CVE-2026-73622.patch        |  60 ++++
>  .../python/python3-git/CVE-2026-73623.patch        |  53 +++
>  .../python/python3-git/CVE-2026-73624.patch        | 139 ++++++++
>  .../python/python3-git/CVE-2026-73625.patch        |  59 +++
>  .../python/python3-git/CVE-2026-76217.patch        | 179 ++++++++++
>  .../python/python3-git/CVE-2026-76218.patch        |  94 +++++
>  .../python/python3-git/CVE-2026-76219.patch        | 155 ++++++++
>  .../python/python3-git/CVE-2026-76220.patch        |  67 ++++
>  .../python/python3-git/CVE-2026-76221.patch        |  44 +++
>  .../python3-git/CVE-2026-76222-regression.patch    |  39 ++
>  .../python/python3-git/CVE-2026-76222_p1.patch     | 120 +++++++
>  .../python/python3-git/CVE-2026-76222_p2.patch     |  47 +++
>  .../python/python3-git/CVE-2026-78675.patch        |  47 +++
>  .../python/python3-git/CVE-2026-78676.patch        |  54 +++
>  .../python/python3-git/CVE-2026-78677.patch        |  86 +++++
>  .../CVE-2026-78678_CVE-2026-78679.patch            | 181 ++++++++++
>  .../python/python3-git/CVE-2026-87817.patch        | 394 +++++++++++++++=
++++++
>  .../python/python3-git/CVE-2026-87818.patch        |  55 +++
>  .../python/python3-git/CVE-2026-87819_p1.patch     |  77 ++++
>  .../python/python3-git/CVE-2026-87819_p2.patch     | 139 ++++++++
>  meta/recipes-devtools/python/python3-git_3.1.43.bb |  31 ++
>  32 files changed, 3349 insertions(+)
>
> --
> 2.35.6

Hello,

I only review the 6 firsts patches and I already found basic issues:
* Unneeded changes from upstream
* Removed metadata
* Wrong CVE references

I'll stop my review here and hold the series until you review it
yourself under those comments.

Same goes for the scarthgap one.

This is a really long series, I have to ask a higher standard than usual
in order to not spent all my time reviewing it.

Regards,
--
Yoann Congal
Smile ECS


--_000_MW3PR11MB4585BBE477EEEB911CBF0F5DDE662MW3PR11MB4585namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
Thanks for the review and for pointing out these issues.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I'll review the entire series again, address the concerns regarding the ups=
tream changes, metadata removals, and CVE references, and resend an updated=
 version once everything has been verified.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Sorry for the extra review round.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Yogita</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Yoann Congal via lists.openembedded.org &lt;yoann.congal=3Dsmile.fr@=
lists.openembedded.org&gt;<br>
<b>Sent:</b> 20 October 2026 16:07<br>
<b>To:</b> Yogita Urade -X (yurade - E INFOCHIPS PRIVATE LIMITED at Cisco) =
&lt;yurade@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;open=
embedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 0/27] python3-git: Security fi=
xes</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri Oct 16, 2026 at 7:40 AM CEST, Yogita Urade =
-X (yurade - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.o=
rg wrote:<br>
&gt; Backport 27 GitPython security fixes covering 28 CVEs to the python3-g=
it<br>
&gt; 3.1.43 recipe on wrynose. The series adds the fixes as patches and upd=
ates<br>
&gt; the recipe to apply them.<br>
&gt;<br>
&gt; CVE-2026-78678 and CVE-2026-78679 are addressed together. The CVE-2026=
-76222<br>
&gt; fix includes a regression correction and follow-up patch, and the CVE-=
2026-87819<br>
&gt; fix is carried in two patches. The patches retain upstream references.=
<br>
&gt;<br>
&gt; Yogita Urade (27):<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-67326<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-67323<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-67325<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-67324<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-67322<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-69097<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-73625<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-73623<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-73624<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-73622<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-73621<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-73620<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-73619<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-76221<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-76220<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-76219<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-76218<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-76217<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-76222<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-78678 CVE-2026-78679<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-78677<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-78676<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-78675<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-87817<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-87818<br>
&gt;&nbsp;&nbsp; python3-git: Fix CVE-2026-87819<br>
&gt;&nbsp;&nbsp; python3-git: fix CVE-2026-100689<br>
&gt;<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-100689.patch&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 90 +++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-67322.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 167 +++++++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-67323.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 356 +++++++++++++++++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-67324.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 101 ++++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-67325_p1.patch&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 49 +++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-67325_p2.patch&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 50 +++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-67326.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 108 ++++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-69097.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 48 +++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-73619.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 58 +++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-73620.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 130 +++++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-73621.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 72 ++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-73622.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 60 ++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-73623.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 53 +++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-73624.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 139 ++++++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-73625.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 59 +++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-76217.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 179 ++++++++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-76218.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 94 +++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-76219.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 155 ++++++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-76220.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 67 ++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-76221.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 44 +++<br>
&gt;&nbsp; .../python3-git/CVE-2026-76222-regression.patch&nbsp;&nbsp;&nbsp=
; |&nbsp; 39 ++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-76222_p1.patch&nbsp;&nbsp;&nbsp;=
&nbsp; | 120 +++++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-76222_p2.patch&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 47 +++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-78675.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 47 +++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-78676.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 54 +++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-78677.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 86 +++++<br>
&gt;&nbsp; .../CVE-2026-78678_CVE-2026-78679.patch&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 181 ++++++++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-87817.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 394 +++++++++++++++++++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-87818.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 55 +++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-87819_p1.patch&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 77 ++++<br>
&gt;&nbsp; .../python/python3-git/CVE-2026-87819_p2.patch&nbsp;&nbsp;&nbsp;=
&nbsp; | 139 ++++++++<br>
&gt;&nbsp; meta/recipes-devtools/python/python3-git_3.1.43.bb |&nbsp; 31 ++=
<br>
&gt;&nbsp; 32 files changed, 3349 insertions(+)<br>
&gt;<br>
&gt; --<br>
&gt; 2.35.6<br>
<br>
Hello,<br>
<br>
I only review the 6 firsts patches and I already found basic issues:<br>
* Unneeded changes from upstream<br>
* Removed metadata<br>
* Wrong CVE references<br>
<br>
I'll stop my review here and hold the series until you review it<br>
yourself under those comments.<br>
<br>
Same goes for the scarthgap one.<br>
<br>
This is a really long series, I have to ask a higher standard than usual<br=
>
in order to not spent all my time reviewing it.<br>
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

--_000_MW3PR11MB4585BBE477EEEB911CBF0F5DDE662MW3PR11MB4585namp_--
