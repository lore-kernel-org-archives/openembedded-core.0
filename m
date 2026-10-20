Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.850.1792473409406612841
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 22:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=e7esqcIm;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12158; q=dns/txt;
  s=iport01; t=1792473409; x=1793683009;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=+cCWp0YBLKfEosFPlQJRbQuGaXAytjYTikt/ou/9S5Y=;
  b=e7esqcImZDNRGWKHPreXsp0RoixHVq/8QsKl/gZILNAfMLYMnpqXX6wj
   CMLOPHBY44zCzAzChqKCaIklJrN0j6sBAn/PxAfiuOl3Idity3vuLKW6H
   H1IulOBAYW0Hy4NkTfhjWvOXKuyNwGPyfOBB06qH5yIYAYuhxir3dBBDf
   tbq3U8/hsdCGzi3yxAIIQ43aW8JQOtyB7PgRKo2j6gM6oErLBzomGqB5n
   zfF1L8xHMxTe9Q7c/3GC7ZvXM+5W9xOoXMMVVNZONdpeJk9l2jl+1Cj6a
   y/A5SjhspeKztzv5b2WqdEBQ0X2yJew/wxoTaNCtZV/rcboZgQ/qTRjHm
   g==;
X-CSE-ConnectionGUID: rXymvB+ZRhGDOj7PR6hFqg==
X-CSE-MsgGUID: D6PxAoDXTPGrnUz/tL507A==
X-IPAS-Result: =?us-ascii?q?A0BwAwDg99Zq/48QJK1agS6BK4E9ATBTgQkCgSNJiCMDh?=
 =?us-ascii?q?SuGWIIhA5FKjFKBdAoPAQEBDQIuARUNBAEBhQUCjhUCJjQJDgECBAMCAwEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAQEBAwGBCAIBCBEEAQEBL?=
 =?us-ascii?q?icKHQgCBAESCIJ7gh0WQQMBAg6ufAKKHXiBNIEBg2MB3FgVgTiDEYF1OoMDG?=
 =?us-ascii?q?wEBK0lsgl2BIzSEYScbG4FygVeCaT6CYQQBF4EdK4QTgjAEgg0VehIbgkJKg?=
 =?us-ascii?q?0GKY4YGUnIiAyYzLAFVExcLBwWBJRAzAyAKLy0CFA0QEg8EFgUtHXAMJxIPH?=
 =?us-ascii?q?RcRHlgbBgUSICpBQzIrgVo8Ixk2eoEJXoErKWECDhdGLhWCBwKCVIEjXQIBS?=
 =?us-ascii?q?UEOB0VTCSU+BRJHJiIIEgkBExowC4EbODwJKEEXDGUODB0FIVEIAgsCCQdNH?=
 =?us-ascii?q?m09NwYPGQMEgTUFkVUHWx6BdQEtRYEOASsiLYFsD5MXAQmPT0ejMAoog3aMI?=
 =?us-ascii?q?o0+iDIXhVulFJkII41nlWACIRaEdQIEAgQFAhABAQaBaDyBWXAVO4JnCUoZD?=
 =?us-ascii?q?44uFohzx3t5AgEIMgIHAgcOAwuRaIF+AQE?=
IronPort-PHdr: A9a23:5mNgGRRQB4FZDShVNxcd/iXt79pso47LVj580XJvo7tKdqLm+IztI
 wmCo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:XPdSmK/LVVl/goXmNk2DDrUD2X+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2IbCmyHOvvcYDCkftB2OoXl9E8HvJ6Bm9VlGwdvqnhEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtFs/LrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2ksDZwd5Mw0M1tO2
 tA/Km81VE6Dqfu5lefTpulE3qzPLeHiOIcZ/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cOHWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OiyYIOOJY3SHa25mG60+
 FrW1mPVMi0iG8aZ9CjC7lbx3rDmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7HQGMFVTVGLtchsafaWAAX6
 7NApPuwbRRHu7yOQnXb/bCRxQ5e8wBMRYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:ufafnq3HtqI3zLhyGPTN7QqjBbtxeYIsimQD101hICG9Lfbo9P
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
X-Talos-CUID: =?us-ascii?q?9a23=3Az9C/R2m4BXF7eMqqntzVtvBsga7XOWft3XLOCQy?=
 =?us-ascii?q?KM2ZGZJqXFmeqpqNKisU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AylAZrw9ZH4w8cT0SVGkk33uQf+s227SHD2w9ra0?=
 =?us-ascii?q?poc+5J2tsH2rF0x3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Oct 2026 05:16:48 +0000
Received: from alln-opgw-5.cisco.com (alln-opgw-5.cisco.com [173.37.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 4C03C180000B4
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 05:16:48 +0000 (GMT)
X-CSE-ConnectionGUID: h2GiOlLfQcisu8VrrTvbEw==
X-CSE-MsgGUID: 51bxV5gIQVCFxL5XzECqAw==
Authentication-Results: alln-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,168,1787011200"; 
   d="scan'208,217";a="69496606"
Received: from mail-northcentralusazon11012056.outbound.protection.outlook.com (HELO CH5PR02CU005.outbound.protection.outlook.com) ([40.107.200.56])
  by alln-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Oct 2026 05:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJDPCmM9hOtQMhSmDfi2LWJd2JsaMaltrv0MpZwmEK0UykGOawUD+VcTvFdoXBT9pWeOsVgvMLpW3bY7WdpVSaSzIAAIylYCy7Nr8dXt2IkiQcWLPv9axOrcqv313JrjONVrVgJV5cWHqrenf1BlaE+V+2IvRNlq6IhEcu3U242D3dW6wxS+Nikp+v1cGckUc1ruf/24uF4UJrb07UyhsCPizkl27fJ6Kpbkw52DAoYcTEYYLqOaGo6jYoOekCKn4aBxSRi/LtKSAW/Bk1GL2f6GEm9xhUQO3lgosiFyUIXFEiaopaEc5GOWSOVLAsn1M909L7RL2edu6EnOLw09mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cCWp0YBLKfEosFPlQJRbQuGaXAytjYTikt/ou/9S5Y=;
 b=hJdmmOePgwZsqKrHsZ7k4C3k9TFIbgQJCttTGED48/uORLH7oFEOHGPvMlXusR2yGOPRIz2B28J07qouXAIlHuYheIZT6TKPpeX1t30pnUM/bYzHpH40oBMUbz5g6pn8sVm8DphMV1MxQDD8dopGi/xnNoIJYGztW4HiRmx6hqSOk2Rca5mdLgmNoqhkTjCRFwbrwgziDDJlny3i3Zi4V7LqTWTHrzghTYkdylAK4lFX6Rq8UaDs8LdmPdMsYdQm8h/6e/iC/m2jra+m8UXNTIp90e9F2vL/iGso38MncCV1ihp4jEa8f1rD6aTxgVGOfVvWI89YAKRtO94SIap9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 by CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Tue, 20 Oct
 2026 05:16:46 +0000
Received: from PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f]) by PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f%5]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 05:16:45 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches from
 u-boot
Thread-Topic: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches from
 u-boot
Thread-Index: AQHdS4frhCCAqvcIU0uOsV0baGdy0rb/TigAgAa+x6o=
Date: Tue, 20 Oct 2026 05:16:45 +0000
Message-ID: <PH7PR11MB8598B39DBADCDF5C628594DDAD672@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20260923173850.21338-1-peter.marko@siemens.com>
 <DM5RBD9MJT2O.2M12R8AMW5OLY@smile.fr>
In-Reply-To: <DM5RBD9MJT2O.2M12R8AMW5OLY@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8598:EE_|CY8PR11MB7169:EE_
x-ms-office365-filtering-correlation-id: f6a828eb-7c61-435c-dabb-08df2e6955b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003|8096899003|13003099007;
x-microsoft-antispam-message-info: QvcxhinOzG7xRsruc6ZP7RR8oE1PNMemmlisK/DiEPN5eF4uOUkJIRWPcuGPp5COpDTtUOo+bVedDo5fCcy8GHXpoO5c3101A0Db7BHDiGAJ+0gF6v9wU/rtuNDKvRbrlpzPxwE8K9HseVsc2/YVcexXZOs9MVt32sJp5i+IakAS3YRMcwDoiyFOes5XScHraO38yao9QfgJRabNmS6F7qINoO2ds6m3CA2ykwwLLH8DEVI9vvUFJQ2bj7oFqUw25vfHIoI94DkY8/4qx0hHo42HvvH0FewpcF/DeONOBzyCiQd41wU08ek1HO243ffWFKzeu/qyM06BqcaaVXPmFxFnUbuXpyvPOtvPWg7L3AzV+QNiHW7KCfebtpDwzTdMB/qVoWpWpGc3KxJCt4FCwrmeuSWtkaYNTSt6kDhpyZ2a5OqzVw36FQL2Um5gYkexMNKfVIy/Y1pYJDEwa6o21P1y9BxfKhkCxePrPt6MUJcMlm86CM7HiTlekpxYJjvBkFP0PeVqycfUQ7AeF4u2x6jbApt12G+9rkpKul5KhfhXFXJ8Si3ROSwwYB2MHWrLg6eQCdwZ/X/DRRojVeIIxqcM8KIqEfkS0MGb2xVkP5ng24eu06aaUXcrFIp0/Zl0xa8FArzzLDYvpUlfQLuI1bionzNJ0uqVW5ibKQvFR88=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(8096899003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?+TaxSe7kXdddZpliyUwArqTuhKNVYsnZ6kR71vjRBy30QC6xMDD/CbkZ?=
 =?Windows-1252?Q?u3P1CvzlqaFr391OOg7UlC+Z03uPQlJDT3actFjy/61avEOUG3091EtA?=
 =?Windows-1252?Q?h1ppxR04hkwbvjONQUOXwkvw05pGH8E5Fzy+x3xfiyNfNogKOXAV+RcJ?=
 =?Windows-1252?Q?I17ig1sbnrrnQ2GFhmFTx5M481z6B63JXfY9f0rfF16tx/9krW6/3noQ?=
 =?Windows-1252?Q?4XSCMdweGbczrLcoCW3kvPSk4Sl/n5ZhR1sDvZ52FNeyupfNdYtbn0BY?=
 =?Windows-1252?Q?nPcThhhf5Bx+jG0SI6nYrDaTsoqI3tKTa0e2X3MSfi4iOBJhMt8dBEB+?=
 =?Windows-1252?Q?bS3UYvPsuWuYOIZYNvFV/+ZZzCekrbdG01K4kHxHMEY8Zr972X67ekP2?=
 =?Windows-1252?Q?3SPkloWAUxEjeGtWAlBaIQ+dhYOTaGxyAhBg0m4pBVMVGGEPZtpkJG2p?=
 =?Windows-1252?Q?Mi0CjjH6RJbgW1jeURmzMvXaFxuPsy727o1fH9XyYvRDvUOOSdxoUP/A?=
 =?Windows-1252?Q?RppFZ1W6fVwQO5AWrk8D4G61Oe4Vl52/edYvd7YAYHv933QI+g+rgq6p?=
 =?Windows-1252?Q?bHD4ibYRkrEdg5zKhkf9ndjpJD7vpZwJ0QdcAS31hrVGhQAn2xAx0S6X?=
 =?Windows-1252?Q?/hmztCGKzp2ETKjVUQ8D/bxqIaDpuwecccWbvslpy0olB2Js7bvi74da?=
 =?Windows-1252?Q?roTu9pq5Qa+82corlwWQ+KC2m7cEgFX3KqpB8oeaCAqXzXl80OWcgdhD?=
 =?Windows-1252?Q?vA2UqrF3f/H3FrITcAxeFw4f8sClqiXbPZdzAgN8tvhAakX6cU1FNeuW?=
 =?Windows-1252?Q?LYoGvDFEfXf2M0wqODvPIVbyVeL3cGiR6FurQ5x6pby6R4rA/iojupsv?=
 =?Windows-1252?Q?SP6k9i/HrvZOesxHcC0Mbi70DWRg5ya2lq7cgZrxTGCpbUkAWMU0NN/2?=
 =?Windows-1252?Q?SG3JwNLG40qX017XsvM1IMtX93XS7aiPlKsBgikzXOISMls/KNYjqiEa?=
 =?Windows-1252?Q?pVygLBTxV1aolFQu4RvtUE3YaNHpeNiWNlzGVx3zhqkaJGs3LJtwCxxy?=
 =?Windows-1252?Q?N5XMn2n6giFt6hRpOZv1q/7b/Ha5BJGo1wxFmQc0acdddebRytwubdU6?=
 =?Windows-1252?Q?Q2pwQfqMEFeD6BQoup/ixAPEzgloZXQ3HF1BCzJgNPgoPveDQMGBZXZI?=
 =?Windows-1252?Q?Qufcpcyxi+qpow9JMFHUsVmaQ/d+pt4BuMb+ozQaP8K8msIjBuAq8lMb?=
 =?Windows-1252?Q?I5TPGV02dCfid7fBnwrXcrwzzpR+60U8cyiyc9Bu8MbJdXxDV/SRMgt9?=
 =?Windows-1252?Q?Eg06wQxGBFRBt/GLDIqYmwjDNwd358kH4SMMOp4gmQep7TLPcQvcVYWG?=
 =?Windows-1252?Q?n1eTyMwksAPL8QjLQeXYR/JtJA417Ro1PGAeGN+fMYB2mBQjz6poxW7C?=
 =?Windows-1252?Q?R2glXACIIp18rWSymEgEPkdbEhtZrg9VBAegX+pfz+5yn4/jgTrim1VW?=
 =?Windows-1252?Q?O02SpnMancwl4gYCMtMic8Rv5IYwn0S2Q0Rp9T7lQb6DnT9KimR2Qx+0?=
 =?Windows-1252?Q?+Aju+qY6j12riUEVSa41iXQk5h6+yJ13Vq/tC3C9ux3ZeIpp8FOxluTx?=
 =?Windows-1252?Q?dcD81rI/wBKcVs0IcqWLlW5DqFbrLyNeuJZF/WmEvFD284jeTucfyqfB?=
 =?Windows-1252?Q?fNq3681tMC1hdJEj0I+pKkhEh/vGDtnv2L64opXnefQlph/u2+WhKDph?=
 =?Windows-1252?Q?nA7Men2kRQd+GMktFrIA7Y68plmhmmCSCE7xWcGSr5ARkMYGKF+Kl6vg?=
 =?Windows-1252?Q?evnEVgsAE0UAyn5EQXLvUz2tXWu/CWxLk170mx4xZhbOMgLz?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB8598B39DBADCDF5C628594DDAD672PH7PR11MB8598namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xr1FrWmg6DhFs9tIjIkf573s5A9lXu0sj4mCDzxX1hodd6AxuffXeiZRi58kQvE6PhaoVVKcZros/bzCDogKtDLGcsJILKDSHMrQwJl8efSHEa5C/3dB9HC+m9wghmyslPUz01OrKjL2nWd41jgkIGiqs9dOnwY25tOjaBsv4m549G5ffyK0NkyWuBpIMpPFQSz2tcitebObdHo9FShzetzLtG3vIiVtwYj4dqGZusguopugwEC/PtHXJ/UQ+cNygfg79G8R5N0GuzJCsL5YaWDDlJ7QIVD1j/RK0zlC+XOYYjllw1t/XwJjqmGhdwcAiFPWVH3ZeCksQLiSksCMzg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a828eb-7c61-435c-dabb-08df2e6955b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 05:16:45.3447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yd7HZ32eZpMDy8g18FXIOJbLaCxvfM74lIIIuL76ZeyDN4Rxbhbpo4V2qP9Ye3wigNGRKlLdtGoP1/X/5cF3hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7169
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-5.cisco.com [173.37.147.253];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.253, alln-opgw-5.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 05:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248216

--_000_PH7PR11MB8598B39DBADCDF5C628594DDAD672PH7PR11MB8598namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Yoann, Peter,

Thanks, Yoann. Continuing the discussion here as suggested.

As i explained in the other thread [1], the existing u-boot fixes are not c=
urrently applied to u-boot-tools. My CVE_STATUS changes address cases where=
 the affected code is not compiled into the tools build.

I understand that the proposed separate include would allow both recipes to=
 share the CVE patches without adding them to u-boot-common.inc and affecti=
ng downstream users.

My concern is whether we need this additional include and shared patch list=
 for cases that can be handled through recipe-specific CVE_STATUS entries. =
Could we consider the held exclusions on that basis?

If maintaining one shared source patch set is the preferred approach, could=
 you clarify how we should handle patches 2=9611 of my series? Should we re=
visit them after the shared include is settled and retain only the exclusio=
ns still needed?

[1] https://lists.openembedded.org/g/openembedded-core/message/247868

Regards,
Hetvi
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: 16 October 2026 03:44
To: peter.marko@siemens.com <peter.marko@siemens.com>; openembedded-core@li=
sts.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>
Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches fro=
m u-boot

On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.openembedded.org=
 wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs
> patched in u-boot showed-up in CVE reports for u-boot-tools.
>
> It does not make much sense to share git repository but not share all
> patches on top of it, so move adding all patches from u-boot recipe to a
> common include file where also the git repository is defined.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc       | 10 ++++++++++
>  meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |  2 --
>  meta/recipes-bsp/u-boot/u-boot_2024.01.bb       | 12 ------------
>  3 files changed, 10 insertions(+), 14 deletions(-)

Hello Peter, Hetvi,

There is a bit of back-and-forth around u-boot-common.inc. So I thought I
would give my vision and get your thoughts.

Fundamentally, there is confusion about the usage of this .inc file:
* This is the common part of u-boot and u-boot-tools recipes (what the
  above patch uses)
* But, also, this may be used by downstream layers to reuse u-boot
  recipe parts. We basically did the revert of Peter's patch a few month
  ago for this reason[0].

With Paul, we would like to have a single set of patches common for both
u-boot and u-boot-tools, but that can't be in u-boot-common.inc as there
is a risk of breaking downstream layers.

Our idea is to create a new inc file "u-boot-common-patches.inc" (I'm
not attached to the name) that contains only SRC_URI +=3D "CVE_*.patch"
and a big warning explaining that is file is only supposed to be
included from layer-local recipes (namely u-boot and u-boot-tools).

This whole situation is not ideal but think the above would solve our
issues and still be acceptable under stable policy.

What do you think?

Regards,

[0]: u-boot: move CVE patches out of the common .inc file - openembedded-co=
re - OpenEmbedded Core layer
     https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8ff03=
147dd532a88cf3ce08d61fab057522
--
Yoann Congal
Smile ECS


--_000_PH7PR11MB8598B39DBADCDF5C628594DDAD672PH7PR11MB8598namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Yoann, Peter,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks, Yoann. Continuing the discussion here as suggested.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
As i explained in the other thread [1], the existing u-boot fixes are not c=
urrently applied to u-boot-tools. My CVE_STATUS changes address cases where=
 the affected code is not compiled into the tools build.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I understand that the proposed separate include would allow both recipes to=
 share the CVE patches without adding them to u-boot-common.inc and affecti=
ng downstream users.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
My concern is whether we need this additional include and shared patch list=
 for cases that can be handled through recipe-specific CVE_STATUS entries. =
Could we consider the held exclusions on that basis?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
If maintaining one shared source patch set is the preferred approach, could=
 you clarify how we should handle patches 2=9611 of my series? Should we re=
visit them after the shared include is settled and retain only the exclusio=
ns still needed?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
[1] https://lists.openembedded.org/g/openembedded-core/message/247868</div>
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
Hetvi</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Yoann Congal via lists.openembedded.org &lt;yoann.congal=3Dsmile.fr@=
lists.openembedded.org&gt;<br>
<b>Sent:</b> 16 October 2026 03:44<br>
<b>To:</b> peter.marko@siemens.com &lt;peter.marko@siemens.com&gt;; openemb=
edded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.=
org&gt;<br>
<b>Cc:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patc=
hes from u-boot</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko v=
ia lists.openembedded.org wrote:<br>
&gt; From: Peter Marko &lt;peter.marko@siemens.com&gt;<br>
&gt;<br>
&gt; After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs<br>
&gt; patched in u-boot showed-up in CVE reports for u-boot-tools.<br>
&gt;<br>
&gt; It does not make much sense to share git repository but not share all<=
br>
&gt; patches on top of it, so move adding all patches from u-boot recipe to=
 a<br>
&gt; common include file where also the git repository is defined.<br>
&gt;<br>
&gt; Signed-off-by: Peter Marko &lt;peter.marko@siemens.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot-common.inc&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | 10 ++++++++++<br>
&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |&nbsp; 2 --<br>
&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot_2024.01.bb&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | 12 ------------<br>
&gt;&nbsp; 3 files changed, 10 insertions(+), 14 deletions(-)<br>
<br>
Hello Peter, Hetvi,<br>
<br>
There is a bit of back-and-forth around u-boot-common.inc. So I thought I<b=
r>
would give my vision and get your thoughts.<br>
<br>
Fundamentally, there is confusion about the usage of this .inc file:<br>
* This is the common part of u-boot and u-boot-tools recipes (what the<br>
&nbsp; above patch uses)<br>
* But, also, this may be used by downstream layers to reuse u-boot<br>
&nbsp; recipe parts. We basically did the revert of Peter's patch a few mon=
th<br>
&nbsp; ago for this reason[0].<br>
<br>
With Paul, we would like to have a single set of patches common for both<br=
>
u-boot and u-boot-tools, but that can't be in u-boot-common.inc as there<br=
>
is a risk of breaking downstream layers.<br>
<br>
Our idea is to create a new inc file &quot;u-boot-common-patches.inc&quot; =
(I'm<br>
not attached to the name) that contains only SRC_URI +=3D &quot;CVE_*.patch=
&quot;<br>
and a big warning explaining that is file is only supposed to be<br>
included from layer-local recipes (namely u-boot and u-boot-tools).<br>
<br>
This whole situation is not ideal but think the above would solve our<br>
issues and still be acceptable under stable policy.<br>
<br>
What do you think?<br>
<br>
Regards,<br>
<br>
[0]: u-boot: move CVE patches out of the common .inc file - openembedded-co=
re - OpenEmbedded Core layer<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://git.openembedded.org/openembedd=
ed-core/commit/?id=3Df4ced8ff03147dd532a88cf3ce08d61fab057522">
https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8ff03147dd=
532a88cf3ce08d61fab057522</a><br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH7PR11MB8598B39DBADCDF5C628594DDAD672PH7PR11MB8598namp_--
