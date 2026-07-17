Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16B3C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:40:37 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7461.1784266832059978209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IE4b8qBu;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4798; q=dns/txt;
  s=iport01; t=1784266832; x=1785476432;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=S3tWbO9BqwdfMAYeRgGeXAX0XQSLiWhBW57Ha89ho6g=;
  b=IE4b8qBunC5N7nOJX5xQ/1U2X8BC3PIBD3aASgeXosM5VIlLOvXelrnw
   uO4qWTtMSFU7DI8wLYwcT5Z7cla0qbi9+t88ODPez3LzHHfU8hlMhzNAe
   FopDPMKbaJ2ejvaT503ncuWQ6MZpv/n148cI98XT+F4XRXBpb6L3K5aEa
   mYVy10+tyz7pRz4qR6+4keUND9agYJ5MI0FJg6zZA+a3v8Ane0RUFXew0
   TS3iQq1OFz5wFo0BnstW22sSdyau7JzQ3Mvba7tGNGPIB6ovqFcxUimvw
   pmKgDyND3DzD+kI2h2UmnJUoaV/d/GRU0gRRYUxkAmj7DK6/WbJF1+USU
   Q==;
X-CSE-ConnectionGUID: kXk6RM9EQ7OAQ5MxsAR1UA==
X-CSE-MsgGUID: m73NUW5pSKGgr4AawgsKJA==
X-IPAS-Result: =?us-ascii?q?A0CQAwByt1lq/5QQJK1agS6BK4E9ATBTgQiBI0mIIwOFK?=
 =?us-ascii?q?4ZYgiSXRIZXgX4PAQEBDQIuASIEAQGFBQKNUgImNAkOAQIEAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQELAQEFAQEBAgEHBYEOE4ZQDIZaAQEBAQMBEXcCAQgEDQQBAS8nCh0IA?=
 =?us-ascii?q?gQTCBqEfhZBAwECsW8BgT0Ciip4gTSBAeA3FYE4hT+DHAEBKoE1gl2BIhmEf?=
 =?us-ascii?q?CcbG4FygVeCaT6EGiuEE4IwBIIiPD4SG4NZgV+MJlJyIgMmMywBVRMXCwcFg?=
 =?us-ascii?q?SNDAyovLSNLBS0dgSMhHRcWHlgbBwUSICpBRSMDTz04C0MFgVYCgghOIx8DO?=
 =?us-ascii?q?X+BL3VKdy1qAhAXaUEkghSBPgMLbT03FBsDBIE1BYxcB1sjg31LLIEQIQajC?=
 =?us-ascii?q?I5glRcKKIN1mV+IMheEBI0UmVSZCCOodQIEAgQFAhABAQaBaDwrgS5wFYMiU?=
 =?us-ascii?q?xkP4Ft5PQEBBwIHDgMLgWiQAIF+AQE?=
IronPort-PHdr: A9a23:tob/DRC1TOr82ckEvNA9UyQVXRdPi9zP1kY9454jjfdJaqu8usmkN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+hmG
IronPort-Data: A9a23:BGxqlaud4CBfkYQtj7Jr3RIZaefnVA5fMUV32f8akzHdYApBsoF/q
 tZmKWuCO/beN2XxeN9/O4uxoxgDvsCAmNNlTQJrrSE9FSoRgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3a9ks11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw+dZ0X1trp
 NEhdxckV02ml/mf+uuGY7w57igjBJGD0II3s3Vky3TdSP0hW52GGvyM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgd/5JEWxI9EglH2aCVRslecv4I84nPYy0p6172F3N/9JYzTH58KxB/Gz
 o7A12GmWTcnC4GH8hmq/Wjwr+bQkjjYeqtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBF2cHY909v8hwTjsvv
 rOUo+7U6fVUmOT9YVqW96yfqnW5Pi19EIPITXZsodctizU7nLwOsw==
IronPort-HdrOrdr: A9a23:aELnHq8GLk34exKl7GVuk+HRdr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBepTnhAsW9qADnhOBICOgqTPuftWbdyRCVxe1ZnO/fKnjbalHDH41mpO
 hdmspFeafN5DFB5K6QjnjbYrMdKZu8gd2VbIzlvhFQpHRRGtldBnBCe3+m+yNNNW57LKt8Pq
 CxouBAoD2tc2kWaMOUOlkpNtKom/T70LjdTVojHRAI1Cmi5AnE1JfKVzSI1BYXVD1ChYwl7X
 XElALB4KCiueGQyxPX1WPfhq4m1ucJzOEtOOW8zuwubhn8gAehY4psH5eYuioune2p4FE21P
 HRvhYJJa1ImjPsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhLhebgDS5yMbzZJBOe
 NwriCkXqhsfFf9dRfGlp/1vtZR5wyJSE8Z4KsuZrpkINIjgfFq3NQiFQhuYeY99WrBmfAa+a
 9VfYDhzccTV0+GZHbEuWQq6tmtUnMvWiqieCE5y5eoO/w8pgEl86Per/ZvxEvp+P8GOup5zv
 WBPaJymL5USMgKKap7GecaWMOyTnfAWBTWLQupUB/a/Yw8SjvwQqTMkf0IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnL2JFQ6BjCTGi0QDyok6hlltVEk6y5QKCuPTyISVgoncflq/IDAtfDU/
 L2PJ5NGffsIWbnBI4M1QzjXJtZL2UYTaQuy5wGckPLptiOJpzht+TdfvqWLL3xESw8Ume6GX
 cHVCibHrQ30qlqYA6OvPH8YQKYRqWkx+MDLEHzxZln9LQw
X-Talos-CUID: 9a23:skGUpGCYD2jz9xX6EypX9xAuP5EISyL65U6NBl+jIFwwdZTAHA==
X-Talos-MUID: 9a23:JbdmSASfaWJAQqLLRXTp22pECfg1+5+NJ08XzbwPpMafFg5ZbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:40:29 +0000
Received: from alln-opgw-5.cisco.com (alln-opgw-5.cisco.com [173.37.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id C54E9180001EC
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:40:29 +0000 (GMT)
X-CSE-ConnectionGUID: 3LFVfxqqSiakHzIb8PWrIg==
X-CSE-MsgGUID: TEsIp4nGT2qxiUu8e0VHeA==
Authentication-Results: alln-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208,217";a="60417726"
Received: from mail-eastusazon11011005.outbound.protection.outlook.com (HELO BL2PR02CU003.outbound.protection.outlook.com) ([52.101.52.5])
  by alln-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:40:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFUbN+XMx7Iz7IK5MMNH/Oy3N3+V89EHHkwG2cUfliOiRx6FckzPdkoKDhQzx2Wvkb4Oe8qXr7bD83pJc0hRuf+C42vvUQ9Q/5Fd2sN+/1bj3dOTuH94ptLNtuBvoccU7tOzmyKXHoKs+UuSvTN0IBpqRI1lODg7gHmR+612ofg12PGPThlekqk0gfz1YbY/x0+rfVNylunummIsqfledSXHgegISptJg8vy0RRLiLbo4dcwnUxPqBxq51U8vM1iU4tR6UeZq6b7K7TFyZ/wzedi2b/mouJNqyRteajNYduihaEaMLvkSfDUec5X/UigdifrsQs32n8gGScqYkdjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3tWbO9BqwdfMAYeRgGeXAX0XQSLiWhBW57Ha89ho6g=;
 b=V8KkygxPtfM5d8eVUQKb2P8U7fNZSnJJY/p+RUHuZP6nIuuNBE8ebV6GUEVWHMXhFBi3aTyFFzac6Id0y9JfFWWlQfmH90T5RVJGJJSPX1PjuLcUhtYRrUfPKg6ZhoyHRH3pJFgc4DDyYJyCPGSq09OkemB7VkIS3dmLq8/itd/4blSmKKnhuqyAK4pOwe4p9l4cUQ6ismiJMKFn58GuaRTlacW/RPMpx9SIlGxzm0YtCw2ufFQBPjaw8nFOtpva24TCsiFhIdJwaz4S3lggCj3A8wpIn9ihbFcCjQyUgZ1W2ebZEab8PnOMcQ++DhFxc9DyCrL6cdxkFiBsWEehxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:40:27 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%4]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 05:40:27 +0000
From: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH v2 0/6] rsync: Fix multiple CVEs
Thread-Topic: [wrynose][PATCH v2 0/6] rsync: Fix multiple CVEs
Thread-Index: AQHdFawSKkKSUX59eEGvo+jS5krQmbZxMeW4
Date: Fri, 17 Jul 2026 05:40:27 +0000
Message-ID: 
 <PH0PR11MB59024ABF2B62F1ADF2A0D9BBCFC62@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260717052059.773645-1-asparmar@cisco.com>
In-Reply-To: <20260717052059.773645-1-asparmar@cisco.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|MN2PR11MB4744:EE_
x-ms-office365-filtering-correlation-id: 042269eb-c0f7-4e64-aed6-08dee3c5e832
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|38070700021|18002099003|8096899003|56012099006|11063799006|10067099003;
x-microsoft-antispam-message-info: 
 K9GAsMc82gYwlK4X0fiISa4eyUI/qchbb+JwnOED2/TL1I6McJKdR9kALMZeE7Lkd6k2Pix2VaEE4Bbek5hCU62o+b7gHh5zaHTNkD5i/c6liBVLF3AFsFwdDRDxXLPuTYSj7xgqVUFy9qmTXx6GgaeXI/cc5MM6zZ3mhE7sHFn/oX8mjO/1ZgFZZvvLkyxnPcA+pOsUzQKzcnHaCjRrNijVi81kFvL8S+FPSmNcv/QNStVl9RwM42+x9Wgod2DP2lMymOlxJrPqYzOkZTP2G6N4aExqKMqV20WM+LVfE3K95bIl0bhu4fHBrUjEwMOD6crKaIz3Hth5CjsjHnvRXo0S65+lwDpfzgeNpLzpKbXlY7JPCaAQBrpkleSnThwdMN4O6o+RVQ6RSA1hy9G0T3VXMZd6pPqcu5FGn6zF9mCqlOJbNQpsurnAYshUeL9gsQyTJhP6n+9wMK33YdoFYRB/O0+ztRDh8667tjZPPlCiQGzWYiYN1BN3RFpfu0lBllS37O4iH3e8a1W5nKUW0bTATHTRAK1lpNIMkpVI4wEQcVtKOmwJmhqTHLynIqscgolVDdSeYw/fZ8VT8Rijh3kZMSC6Ivc514Jd2jdixEAXhshoKr/XDBSBX9zjxtVWkiihcGWjKOf3YnyvX0+S6YUAL8HlZ36lknY/SCuuj4IkjCUiOUfRMMSv26POoTlRYIEMu4DYjRiFvwVt2pVWmQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(38070700021)(18002099003)(8096899003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FYNDO77vkA8ErZp0xH6IBDRtBPChP8VX7Mw5I/22U+W4Xwz/mJs63N0ikn/M?=
 =?us-ascii?Q?NRky6JyzFrsXhZ17LBzrASh5iu3fidIg9SCNRFcC5i2HU1bN0fh9ostZ3elS?=
 =?us-ascii?Q?SzjIn6Uf3QxF8g8od+rShk2OQWJP9BzxFa1KYf0d6jX+D6AaVYIut8cMZTln?=
 =?us-ascii?Q?M99BTKJfdRU9yjMIMcZGEJCNGbuImqmtK9R55WH036BdtkmcotSKvcaxEUef?=
 =?us-ascii?Q?2s/mQSn5J5dnFym/N/tirAfbFq+LhP45NoVuIcwS6/dsY4tkdCZtDQidUHTT?=
 =?us-ascii?Q?Mb/8qZLuXlZr8B+2H0D/QORwwQrrXAINEFN8G0joxDYH3kBz0d24bhkD0MmK?=
 =?us-ascii?Q?PQnyQ5mQxDDFkkA0cMJ3ZfV65FrMZ/keKmE5RquTvjMEbtIHx5nHW73AJkB+?=
 =?us-ascii?Q?pPtofm2rGGC9ytUMFnMnrlCFrmhtDbO7oCyP0ZOFRxO9lsgJs+gv6/IDYtOi?=
 =?us-ascii?Q?SPc4JJS9IyfBoz2wBGTqzaG5l/ffcLISvwXY+MLLbchELcBTE9uQRI8fRGVA?=
 =?us-ascii?Q?Cx2P25CSehEV/moBJGFpi/XydIRIFJD4h0MdKyis4SykBSbxR/Fu8OkflmTP?=
 =?us-ascii?Q?FFUvilROrXSrWSr+TbUIEpQa9XP5cJWb9627st3grxDkXKwTdwSl069Phrkj?=
 =?us-ascii?Q?ZzhAA6jCJp8UQ+SK5HiuMHssqJAtv/f3FovqnOFsgW85bfowdk7lc+OfuNKL?=
 =?us-ascii?Q?zHoO7cZdJ353fY8xqftBPyxEUYwtfrw74hnRJoD/Bf72bxmPkgM8my3Mtkem?=
 =?us-ascii?Q?U+6JDduKPnyYgnvU4QfHmoeoxQYekohG2Ce6tGFEaIeDm2AUC3aVpgdfp400?=
 =?us-ascii?Q?8W5So9UoiO/Xfk1SN8qsG5JKSC1BaiHeawcqrX53341XrA6kvSPlpWnQLuGn?=
 =?us-ascii?Q?R4/LrkNdBqFzEq00mjNkTORxH+LGnJbje3Tn02b8exIpW7PzXIpVe237BamM?=
 =?us-ascii?Q?7YLTlZbK720qQ3AnK7Ukjj6XLtAdGL735AwM75rM3nd7gOPdQUjnyBC0DUZ6?=
 =?us-ascii?Q?cvjbzDCVcj6Zhfnu/7bFJ78MKAwmlXCbhdl7vRAj8u6eSYxLrY7iiiiS3ieV?=
 =?us-ascii?Q?WoMedCAgETeSjVCa4GUuIyuJqhBdRxiSNsUAnNgQ0VWtiIuroEIg4pGiWw4o?=
 =?us-ascii?Q?baZjtitokmYYt7C6mm26D1yAWRUSf310iI0O5uroD1rWGiZOqO4kGJEBtyO/?=
 =?us-ascii?Q?jpkrDDSxo7DbEs6Vj0EwHGvuQ+49FgoesjCj3QkCtY3xXEAPfTC2z3ArLGh8?=
 =?us-ascii?Q?SHdG/k3rHJqiRw4p16Hm9MlJBpeGCXRAh6YGVUUMFU4m57V2BM64YaAK+Y+p?=
 =?us-ascii?Q?pF3IeZgvX0NX82yu4PJLCbaYsgRw4esU5RLUH2uYDMJup/1FtDb7unCexCxA?=
 =?us-ascii?Q?6RG3nq38xpQpAjhZSGjPSId+BdKjuUPegTY17ytnTSwq/TsbvXq3VsfCz5iT?=
 =?us-ascii?Q?99HeyHyWPtd1b2Qu9Cn4gUeXOGa+mUaFghTv1+tf0R0PeppHYd95jt+J1q00?=
 =?us-ascii?Q?rt5XkKcD8zFW9FuIBSX7IHqfvis3kgVBIg5nHSI9bQnowOQAoV0wGOaaN/CY?=
 =?us-ascii?Q?sH/jhhmONvxZZMAp+ry/cwiSsZBpGFAQjobu0a6+4UckryfvQpMP7O0GrpmS?=
 =?us-ascii?Q?WrTHJodqRFyOqErL2aOoRPg8OeM/nQ3xX8VxWTnmPfft1YhmqsMeRcGi9C1/?=
 =?us-ascii?Q?C6X+H/ucRzV8E8R7JW/HdhvSlz1RkaP/YWT0SHNiVc1kAm+x?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB59024ABF2B62F1ADF2A0D9BBCFC62PH0PR11MB5902namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	JgZ+tvLmAynyx1x17lazLy9YmTjhjeUn68iUCYBN2VBEuTgjtqdhkMJ2PR8I0X7mFgj7toIA3wxGwnZtotFpNg4YMFP+rBByMK0jYnetvsZbThqWFsFaD870nNzl8+64FBZ8guPVa5lXY1itaMxdh+XuTSkh8XsqRPR3s9CwScuc7TQ5yAPLVwCGAJ29AqfJXkn8P1pYbmakEQJ1AcqHvR+m0DfcVQXPZizmlb3NIWM4KFbx67nIogpNfjOcST11BpA4yt+LvrorGTRJzUvlckqL0oLbzxX3LB/gK8jm1NnEoOAJ84NKmUE5Z+OgXofINq8jKcTxZXUvqCMDGZmbpw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042269eb-c0f7-4e64-aed6-08dee3c5e832
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 05:40:27.5707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LWbiAkF1YzcORppW9LiX4xQeffBXeHGlPx0x1mvnYSEwC9QjexnPEvaIuOQ5OvZgkjDL3jmrKN7OwzJbZQFTtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-5.cisco.com [173.37.147.253];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.253, alln-opgw-5.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241130

--_000_PH0PR11MB59024ABF2B62F1ADF2A0D9BBCFC62PH0PR11MB5902namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Please ignore this patch series. I will send corrected patches again.

Regards,
Ashish.
________________________________
From: Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco=
) <asparmar@cisco.com>
Sent: 17 July 2026 10:50
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 <asparmar@cisco.com>
Subject: [wrynose][PATCH v2 0/6] rsync: Fix multiple CVEs

From: Ashishkumar Parmar <asparmar@cisco.com>

Backport the upstream rsync security fixes for CVE-2026-29518,
CVE-2026-43617, CVE-2026-43618, CVE-2026-43619,
CVE-2026-43620, and CVE-2026-45232 to Wrynose.

Changes in v2:
- Updated the CVE-2026-43619 backport to restore the upstream commit
  description and explanatory comments for the openat2/Android fallback
  handling.
- Clarified the Wrynose-specific Backport Changes metadata.
- No functional changes were made to the other five CVE patches.

Ashishkumar Parmar (6):
  rsync: Fix CVE-2026-29518
  rsync: Fix CVE-2026-43619
  rsync: Fix CVE-2026-43618
  rsync: Fix CVE-2026-43620
  rsync: Fix CVE-2026-43617
  rsync: Fix CVE-2026-45232

--
2.35.6


--_000_PH0PR11MB59024ABF2B62F1ADF2A0D9BBCFC62PH0PR11MB5902namp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please ignore this patch series. I will send corrected patches again.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Ashish.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ashishkumar Parmar X =
(asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;asparmar@cisco.com&gt=
;<br>
<b>Sent:</b> 17 July 2026 10:50<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at=
 Cisco) &lt;asparmar@cisco.com&gt;<br>
<b>Subject:</b> [wrynose][PATCH v2 0/6] rsync: Fix multiple CVEs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Ashishkumar Parmar &lt;asparmar@cisco.com&gt=
;<br>
<br>
Backport the upstream rsync security fixes for CVE-2026-29518,<br>
CVE-2026-43617, CVE-2026-43618, CVE-2026-43619,<br>
CVE-2026-43620, and CVE-2026-45232 to Wrynose.<br>
<br>
Changes in v2:<br>
- Updated the CVE-2026-43619 backport to restore the upstream commit<br>
&nbsp; description and explanatory comments for the openat2/Android fallbac=
k<br>
&nbsp; handling.<br>
- Clarified the Wrynose-specific Backport Changes metadata.<br>
- No functional changes were made to the other five CVE patches.<br>
<br>
Ashishkumar Parmar (6):<br>
&nbsp; rsync: Fix CVE-2026-29518<br>
&nbsp; rsync: Fix CVE-2026-43619<br>
&nbsp; rsync: Fix CVE-2026-43618<br>
&nbsp; rsync: Fix CVE-2026-43620<br>
&nbsp; rsync: Fix CVE-2026-43617<br>
&nbsp; rsync: Fix CVE-2026-45232<br>
<br>
-- <br>
2.35.6<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB59024ABF2B62F1ADF2A0D9BBCFC62PH0PR11MB5902namp_--

