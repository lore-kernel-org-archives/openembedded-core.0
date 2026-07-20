Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69827C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 11:11:28 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6578.1784545883863546718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 04:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ch5moOYi;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10904; q=dns/txt;
  s=iport01; t=1784545883; x=1785755483;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=R1iFHN51z+DPDdlhTJZzOvPoZVl1e1Rz1Zn0I6aBPp8=;
  b=ch5moOYinofHxqSRdvZfc7R93PiXM1viT5B4K38RnDYgiPmlEj59AR4V
   TNgaRSdCAoqAmF2WBSXVrw8dGJph5FGIeYifHlDnJH7ZImo9H1X1cvQ9V
   J5TVFRo+XHVsQ8DIi92J9L/qj7QNj5eDxIFSTTCe5DiZ1zUsm9VpHirif
   3pLvln7ble+aqBwZ/Wi7vdd2Vh0DMUR4ym7Xr3hrg9HgOL5fGcxh1Q+xQ
   laYRv/B1Pdgyx8bmap8I2y/OioRC6oqwJ4kRBtNJ0Yb6QW0TbPwLujw2L
   UGF/AoTP319F66GMCAGQ39gpqkcPCaUe3pO/7UbVlJr/t7rqvLifIIEAe
   Q==;
X-CSE-ConnectionGUID: txILNM3gT1K44W12NPyDDw==
X-CSE-MsgGUID: iHhOgU4jRF6nUx1uUe/C8w==
X-IPAS-Result: =?us-ascii?q?A0A7AAA1AV5q/5UQJK1aHQEBAQEJARIBBQUBZYEXCAELA?=
 =?us-ascii?q?YE8MVOBCAKBIUkDiCADhExfhliCIQOBE5YxhleBdAoPAQEBDgEuARUNBAEBh?=
 =?us-ascii?q?QUCjVMCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GW?=
 =?us-ascii?q?gEBAQEDARFcGwIBCBEEAQEBLicKHQgCBAESCBqCYYIdFkEDAQIOsFIBgT0Ci?=
 =?us-ascii?q?ip4gTSBAYNoAkPcChWBOAGFPoMBGwEBBSVJbIJdgSIYAYR8JxsbgXKBFUKCM?=
 =?us-ascii?q?Tg+gQWBXAEDAYE0K4QTgjAEgQ6BFHoSG4NagWGGN4VZUnIiAyYzLAFVExcLB?=
 =?us-ascii?q?wWBIxAzAyAKLy0CFA0iDxoFLR1wDCcSDx0XFh5YGwcFEiAqQUUjAxQ7PzgLQ?=
 =?us-ascii?q?wWBVwKCBU4jHwM5f4EvdUp3LWoCEBdKOCSCEgKBOwIHAwttPTcGDhkDBIE1B?=
 =?us-ascii?q?YxQB1sjgU2BbQkKCCQgL2F8ETqKGohJChWPQYF8giGfWgoog3WKe4EmjT6IM?=
 =?us-ascii?q?heFW6URC5h9I41nlWAhhQ0CBAIEBQIQAQEGgWg8gUcLB3AVO4JnCQpAGQ+SI?=
 =?us-ascii?q?4F/gxTGcHkCAQgDLwEBBwIHDgMLgWiEXosigX4BAQ?=
IronPort-PHdr: A9a23:qWqVIxXneg5JExEuudKMnSDkkDnV8K3PAWYlg6HPw5pHdqClupP6M
 1OavrNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:dFqL7qCLUsjo2xVW/3Hiw5YqxClBgxIJ4kV8jS/XYbTApDoj0zZVx
 mUZXTjSPamOYmTwLdhyaIzi90xQu5fcxoIyOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD/g2YoWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE3+VPKGcTZoIko8UrXV4Xr
 9ogORwhcUXW7w626OrTpuhEj8AnKozveYgYoHwllGufBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWsHgBfoO3WjPn8bBZ8klfuogVH0ciZTrxSeoq9fD237k1wtjeK8aYOKEjCMbcR1nmGXm
 z7ExUqnBCwKbcGixH2uom3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIk/CS6AeCDW9CRTlEADA7iPILqfUR/
 gbht/viBCdkt/ueTnf1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:xkctSa6J3jaKCAkWVgPXwcGCI+orL9Y04lQ7vn2ZFiYlEfBwxv
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
X-Talos-CUID: 9a23:dYcbamO4O5i5mO5DRDlG0GgxQc8ZK16BkEiJeWmAGEpFV+jA
X-Talos-MUID: 9a23:COhysgZhrCJR5eBTth/soz5faMVSzfqoNVBUjKgL/OLUKnkl
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:11:23 +0000
Received: from alln-opgw-3.cisco.com (alln-opgw-3.cisco.com [173.37.147.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id EB9881800021A
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:11:22 +0000 (GMT)
X-CSE-ConnectionGUID: xiy0ixauQiCQCjgXj2W3OQ==
X-CSE-MsgGUID: qyvOeo1BRJOp3XYAGm884Q==
Authentication-Results: alln-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208,217";a="59668025"
Received: from mail-centralusazon11010010.outbound.protection.outlook.com (HELO DM1PR04CU001.outbound.protection.outlook.com) ([52.101.61.10])
  by alln-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:11:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANsW5LEwY/dlm60tV9Kwujhix92/LHz46itfI1/aF42Sq93Vyv7/z83ueIBOTJLNyVR0R1VkN9+gAUF/KJFdj+ao6GLRnqIJqlkiBoSUV9irnTOBNdsBxaR3/zY2w9fxIB8FIOcsfh25OuIa4OlsMtypC41fCHiQ1qJKT+9HRmDfufTpvKMpad/xDiyaDO10qfXa4N3LrrnwTzEGsHm1QIrZxkc/czT+/HAHlHnkbkk7AdMeluus5vCxjyhB1cqR2zfvuRqjpFcPBnmWDU65FtANz9aZ4n71KKZ+mV2Z0SZ0bSVY36BTGJJC8JVY9/zRB8AW9Fp7cVdB7S0qiYKB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1iFHN51z+DPDdlhTJZzOvPoZVl1e1Rz1Zn0I6aBPp8=;
 b=poAUrZjJKQXqNsEvM2YdKOW/ibkn/aXJfnq6uOPJf0FHTM846Jn3XKpFJZ64Tb3Y+HM2Y8d3zIjhlyRFgO6kWl6bJ9FljpNPCYK3Rev+KNWw62/DhG4U4cpSRxJqB2SlAZEmfcN8wAa9pTkcoa56XsQNSasTZjT87FzfKByOrcR8tpkfYz/gwEDQlOQ9cUurJR2hNiyy96Mhv9kjDsym45GCb4oBT2BPeDQMtOVFdW7RFEISI+BRr5gLya/MNDFqNbpDm5AbKM2rjfzDkqqLyO8dV2E2JSYhxFg4A6e8ya/QcUzyMcx+BVeBIhA3T7N6Oga5gLqz++Z69E6/oqOsvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 MW4PR11MB7032.namprd11.prod.outlook.com (2603:10b6:303:227::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.18; Mon, 20 Jul 2026 11:11:19 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 11:11:19 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 2/2] gnutls: Fix CVE-2026-42009
Thread-Topic: [OE-core][wrynose][PATCH 2/2] gnutls: Fix CVE-2026-42009
Thread-Index: AQHdEFIlL8T+AbXF3EaJBSmbPE0BRbZx0vMAgAR7/og=
Date: Mon, 20 Jul 2026 11:11:19 +0000
Message-ID: 
 <DM4PR11MB61896A144BF2301F9CDD6E4CC4C32@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260710095422.3042774-1-sudumbha@cisco.com>
 <DK0X83RP88XU.1TF6MFXVOZMYZ@smile.fr>
In-Reply-To: <DK0X83RP88XU.1TF6MFXVOZMYZ@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|MW4PR11MB7032:EE_
x-ms-office365-filtering-correlation-id: e400af5a-890f-4ec8-3e7b-08dee64f9fcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|8096899003|4143699003|56012099006|11063799006|13003099007|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 ctNdonjzaKTckwrxRCx5wVHblgRQ8lkMfxV1teUS+vX0v56UG9o7TjqTK0nCFFTR5X/zY5RuCP9mzjAOkHiD3n5DyTEr0Z/MU9ud+0S0eQ/cT5ftRxZyjiYlDk+UG2zh9QYU/eYAEe31knqgLUpsYUvM06XMcQ+fILjz4QSFvxOCVhHfL+h5y2gYOY/am+DolT7w2PTjM703BeJLeMWKuEqn3TrrTQDUP3O6QqoSmNhc8brjAQoJQw1KD9/DiY3An46JGeKZjAtIOFwD32NxI4IvqpkutoiGpWfgSU/cPjRGmTStkCUXyWAJQtfUM8Pn/B+B+0JeYoP+TUjKDme98cBLHTWUcX105xC5QySpvLIw+i0LS+eqfsrqwWlM0VrgbPl6zIG97quyHMdQ0EskIfpE9RJU/kkk+WouAWYfwNh3F4VG1e+ni691IpHdpMUdmn3lCEO4/XhvOj/P2mBjD7b5q0IlPilkQz1C9Xkp9OMukmwBtUqQNSAX4CHDV9HRtBg0HOWOeRuS6ujxGKjax50d8DjTL8fhnDemqjMhou1N1OF3uBE9UEgWoIVla/aqvWYSknWLCmflW9K+tQY2KATAcbF6u9qlsyvxf6mJpoFvRUwlTHGGo+RMyjmWw2zqlgWtYoXfuHyP29mkKLsq3mIYJ+KzJzMUSstbLcDn65A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(8096899003)(4143699003)(56012099006)(11063799006)(13003099007)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Du0Ts9QQHGuh4cywKUpKZOfKuti2y9jHudHJ+SkZCe9FyEpVIX5ecYpO2M?=
 =?iso-8859-1?Q?Y6VN8jr1BmIFhYJwF5AdQ0AKpvZ2qJUuczMr5nZ26cVXRhKFvlkYvkyPHC?=
 =?iso-8859-1?Q?TKoaAtfeB0ehClisoyLoh48QHa/ykp+4zl7JO8v4zqsxlk0QWSrndGcNJz?=
 =?iso-8859-1?Q?lIikc5mI+ZMhEQaezze/6RaIzirT6N5QS9uKO8A0lc3rpL3SLDStkPYAYw?=
 =?iso-8859-1?Q?MqSRnPg/L5BH+/ZIp17z5GjQIx+0+/B1kf3N1+IFOzT8nJ0rStz3RHDyCD?=
 =?iso-8859-1?Q?GI3cNmA7FrYxe/uUJKxu7oGIcKYBmVnhl9t+Ge9g5LRpIowsIXRNEeMg2T?=
 =?iso-8859-1?Q?hOwlwyPPP9I+mYnEJjclAwdepACerYGBvXBsKRmHnHaqPI0Ih0eV9i0e8J?=
 =?iso-8859-1?Q?X3L62iH9bE0mzx/vSDboRJohgZu3SmzB+liN9ga7T84nYAiiTwvs3aeGOH?=
 =?iso-8859-1?Q?QgGEn1F1JQWur/eklCOk5xgCh8gKOI1+FbL6nJ4I8diZraRSpFzk97lRo1?=
 =?iso-8859-1?Q?70gnzGhrno/AhXcNp4BeUYdWKyvYwP0m2Sr1aTUKj2x0y/ZOFYCu7Y3mZd?=
 =?iso-8859-1?Q?HDSVcrwKyDIKgazjsyF3SWJ/p6C9SimGooFdlM/UUlg8hCqu8dgiBveUsE?=
 =?iso-8859-1?Q?DkDmE3IDIeK+GMBzEc6YzQfiviXUwkF8VFAMaC2rDgeiHObs79XWOcjDdl?=
 =?iso-8859-1?Q?CINMd5fapheHDbmkuznTaIRuLSRBZXc7w9KTbvrITz7YpoJN9hrrfF8KEa?=
 =?iso-8859-1?Q?Qm7GTrCF2DiOkwyoff7oej0KJ5AsAXtXIYcH+/GT6zrrH+8GjQSX4ZXFi9?=
 =?iso-8859-1?Q?8w0GJNxRYx5s1AsKV+fLTkklm7cEBMCakK19KnxZXaejZ6v/+kW4Cq+rav?=
 =?iso-8859-1?Q?m4iLYcFMfNapF/MQErmLiVhG4OL70+GjrjXO1UaDEJSr2sS1qD5zbcnKQw?=
 =?iso-8859-1?Q?bgLHvvLcGX0CPeAlvdfrrWup8qKLzl87kYQf3hcCZ+NjoZ9xyS5lNJfnFR?=
 =?iso-8859-1?Q?j4wH5iSR+yxRUnVoULbivvTEe8R5nLidIqW0Q3G/Mv4a0YFUJdQ3aFsmLk?=
 =?iso-8859-1?Q?b4oNBTS+y3TAVnwU6tPAd16xWI3JnfHAz0Or7TlIWbQwWsAZjU09VZM1Wn?=
 =?iso-8859-1?Q?z1xoQQft796HsOy7ALYBJoeTDx4xkAyBH3DJD88ezny01X3hHgwJiPhAGl?=
 =?iso-8859-1?Q?JRVkh4wqzHsC28WV4Inv539sfK3q0jQQNcyifIP957SU36R6zEiXgiHwvw?=
 =?iso-8859-1?Q?EKsAmmAA1JwbBq6QL3eSQifevjrVVazTkDczN73KmzhkUZzphqaqupiOTG?=
 =?iso-8859-1?Q?+gprCjx+FTewvjg5jH7TCQIRtweI4OaZno9Rzvohp81m9hzi1Q4thKZddB?=
 =?iso-8859-1?Q?V9VLcl8k9xJ8GgDv9Y+66wbu/Z49HuPs/Ehbe0wK6ZVukc/cH9nwj6VLcj?=
 =?iso-8859-1?Q?8iwLcPdICqf9XhxvERXCy5gliXFemYBSnSa9c24mN1wFPjg5VOjjB0q0dt?=
 =?iso-8859-1?Q?STIXEJDPsq8haXufiaaXJsWotEX857A+Gd9zOEBNMbwQ1zXu5YvmBCJTct?=
 =?iso-8859-1?Q?aIWIhFcP2A5vWvuqh4aa9ZBDEV4QaEDRxeaCUfEYMYtWhQagSdl0N3VesL?=
 =?iso-8859-1?Q?8C4h3TfedRRYkYv0GbRx+EBjG0Qla1EKI+0Q5paeOqdzGnu+2Y4nh/IUfe?=
 =?iso-8859-1?Q?jucnkNpJ2fVBsR6hSRPSra0GNHpH9B+ZrD9bNpFHRYOm6Yjq7G3A2tvPjM?=
 =?iso-8859-1?Q?n1xYpz4LGsp/qJZfFcwJJ6SIrbTUEOiGm3IeOsGx73HFry?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB61896A144BF2301F9CDD6E4CC4C32DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	OW+i52P1Vld6NUGt3+yjslP8LYlCndGhMuhYmBiXej0NH9R/pSQ2h/kEuT4xJIOmm3C/fTkJGiZ3MOhwhW/1kPWrbOwtTTxKLwkTZDQtnaT2K97qlxLRh2FEtr6ciiyvdEs3yxjQCl6iEEOdur5tb1VDs2X3qA0VEmyU9RCRcMEqr2g9Z1FGzYEeRbvIGmy1vPAac1qcpLVim4aOalGOCJMEDlMqlEbgVcSQc4Gm3dv/JzBqUWcbQW6AfZ9NN7W6c+i9Vw3ka/xJpL3H1eC3MQlgk8f3GHWDPbhzINqfPNXyy9bXK2tGqgelt7zBAn4bM0al3/VWUXnlo7oMcZq8Jw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e400af5a-890f-4ec8-3e7b-08dee64f9fcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 11:11:19.0447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3pAk6STETzarLFBTmyAfhByP7xsAvEVbd/IoT8+CkKGet3QrhqCccWpyAhnxGlnRDaGIs706GgCcwwK9DDmYqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7032
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-3.cisco.com [173.37.147.251];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.251, alln-opgw-3.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241361

--_000_DM4PR11MB61896A144BF2301F9CDD6E4CC4C32DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann Congal,
I am working with Sudhir Dumbhare on these fixes. As Sudhir is currently un=
available due to a personal matter, I have taken over the follow-up and reb=
ased the gnutls patches on top of the latest changes recently merged into t=
he wrynose branch, as requested.
The updated patches have been submitted to the upstream mailing list:

  1.
openembedded-core@lists.openembedded.org | [wrynose][PATCH 1/2] gnutls: Fix=
 CVE-2026-3832<https://lists.openembedded.org/g/openembedded-core/topic/120=
356870>
  2.
openembedded-core@lists.openembedded.org | [wrynose][PATCH 2/2] gnutls: Fix=
 CVE-2026-42009<https://lists.openembedded.org/g/openembedded-core/topic/12=
0356873>

Thank you for pointing out the issue and reviewing the updates.
Best regards,
Deepak Rathore
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Friday, July 17, 2026 8:07 PM
To: Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco) <s=
udumbha@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-=
core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 2/2] gnutls: Fix CVE-2026-42009

On Fri Jul 10, 2026 at 11:54 AM CEST, Sudhir Dumbhare via lists.openembedde=
d.org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> This patch applies the upstream fix [1] and [2], as referenced in [3],
> to address a DTLS packet reordering flaw where duplicate sequence numbers
> could lead to unstable ordering or undefined behavior.
>
> [1] https://gitlab.com/gnutls/gnutls/-/commit/f01e21441e29052a6f096384079=
4c41d3b3ee66d
> [2] https://gitlab.com/gnutls/gnutls/-/commit/f341441fad91142897d83b44a17=
5ffc8f925b76f
> [3] https://security-tracker.debian.org/tracker/CVE-2026-42009
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-42009
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>

Hello,

I guess a recent gnutls patch broke this series:
ERROR: gnutls-3.8.12-r0 do_patch: Applying patch '.../wrynose/bitbake-build=
s/poky-wrynose/layers/openembedded-core/meta/recipes-support/gnutls/gnutls/=
CVE-2026-42009_p1.patch' on target directory '.../wrynose/bitbake-builds/po=
ky-wrynose/build/tmp/work/x86-64-v3-poky-linux/gnutls/3.8.12/sources/gnutls=
-3.8.12'
CmdError('quilt --quiltrc .../wrynose/bitbake-builds/poky-wrynose/build/tmp=
/work/x86-64-v3-poky-linux/gnutls/3.8.12/recipe-sysroot-native/etc/quiltrc =
push', 0, 'stdout: Applying patch CVE-2026-42009_p1.patch
patching file lib/buffers.c
Hunk #1 FAILED at 968.
1 out of 1 hunk FAILED -- rejects in file lib/buffers.c
Patch CVE-2026-42009_p1.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: .../wrynose/bitbake-builds/poky-wrynos=
e/build/tmp/work/x86-64-v3-poky-linux/gnutls/3.8.12/temp/log.do_patch.25292=
06
ERROR: Task (.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded-co=
re/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_patch) failed with exit =
code '1'

Can you rebase on the recently merged wrynose and resend?

Thanks!
--
Yoann Congal
Smile ECS


--_000_DM4PR11MB61896A144BF2301F9CDD6E4CC4C32DM4PR11MB6189namp_
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
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Hi Yoann Congal,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
I am working with Sudhir Dumbhare on these fixes. As Sudhir is currently un=
available due to a personal matter, I have taken over the follow-up and reb=
ased the gnutls patches on top of the latest changes recently merged into t=
he wrynose branch, as requested.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
The updated patches have been submitted to the upstream mailing list:</div>
<ol start=3D"1" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:f=
alse,&quot;orderedStyleType&quot;:1}" style=3D"margin-top: 0px; margin-bott=
om: 0px; list-style-type: decimal;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); margin=
-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation"><span style=3D"line-hei=
ght: 20px;"><a href=3D"https://lists.openembedded.org/g/openembedded-core/t=
opic/120356870" id=3D"OWAf2affb57-4541-7094-c768-7e8884045b50" class=3D"OWA=
AutoLink">openembedded-core@lists.openembedded.org
 | [wrynose][PATCH 1/2] gnutls: Fix CVE-2026-3832</a></span></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><span style=3D"line-height: 20px;"><a href=3D"ht=
tps://lists.openembedded.org/g/openembedded-core/topic/120356873" id=3D"OWA=
51a1c2ba-2e26-1cf1-f0b8-27a41f751443" class=3D"OWAAutoLink">openembedded-co=
re@lists.openembedded.org | [wrynose][PATCH
 2/2] gnutls: Fix CVE-2026-42009</a></span></div>
</li></ol>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
<span style=3D"line-height: 20px;"><br>
</span></div>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
<span style=3D"line-height: 20px;">Thank you for pointing out the issue and=
 reviewing the updates.</span></div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
<span style=3D"line-height: 20px;">Best regards,<br>
Deepak Rathore</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembedde=
d.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, July 17, 2026 8:07 PM<br>
<b>To:</b> Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Ci=
sco) &lt;sudumbha@cisco.com&gt;; openembedded-core@lists.openembedded.org &=
lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 2/2] gnutls: Fix CVE-2026-4200=
9</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Fri Jul 10, 2026 at 11:54 AM CEST, Sudhi=
r Dumbhare via lists.openembedded.org wrote:<br>
&gt; From: Sudhir Dumbhare &lt;sudumbha@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix [1] and [2], as referenced in [3],=
<br>
&gt; to address a DTLS packet reordering flaw where duplicate sequence numb=
ers<br>
&gt; could lead to unstable ordering or undefined behavior.<br>
&gt;<br>
&gt; [1] <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/f01e21441e290=
52a6f0963840794c41d3b3ee66d" id=3D"OWA73193ed7-0ce5-e4cd-9f6c-8b6a946ed48c"=
 class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://gitlab.com/gnutls/gnutls/-/commit/f01e21441e29052a6f0963840794c41d3=
b3ee66d</a><br>
&gt; [2] <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/f341441fad911=
42897d83b44a175ffc8f925b76f" id=3D"OWA86a4a161-efab-2519-0d78-f2d55fd428bf"=
 class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://gitlab.com/gnutls/gnutls/-/commit/f341441fad91142897d83b44a175ffc8f=
925b76f</a><br>
&gt; [3] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-42=
009" id=3D"OWA14150433-cc3c-9e60-4a1f-abbca916780c" class=3D"OWAAutoLink" d=
ata-auth=3D"NotApplicable">
https://security-tracker.debian.org/tracker/CVE-2026-42009</a><br>
&gt;<br>
&gt; Reference:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-42009" id=3D"OWAc=
3dd4765-cce7-9793-5d74-cb39319385ac" class=3D"OWAAutoLink" data-auth=3D"Not=
Applicable">
https://nvd.nist.gov/vuln/detail/CVE-2026-42009</a><br>
&gt;<br>
&gt; Signed-off-by: Sudhir Dumbhare &lt;sudumbha@cisco.com&gt;<br>
<br>
Hello,<br>
<br>
I guess a recent gnutls patch broke this series:<br>
ERROR: gnutls-3.8.12-r0 do_patch: Applying patch '.../wrynose/bitbake-build=
s/poky-wrynose/layers/openembedded-core/meta/recipes-support/gnutls/gnutls/=
CVE-2026-42009_p1.patch' on target directory '.../wrynose/bitbake-builds/po=
ky-wrynose/build/tmp/work/x86-64-v3-poky-linux/gnutls/3.8.12/sources/gnutls=
-3.8.12'<br>
CmdError('quilt --quiltrc .../wrynose/bitbake-builds/poky-wrynose/build/tmp=
/work/x86-64-v3-poky-linux/gnutls/3.8.12/recipe-sysroot-native/etc/quiltrc =
push', 0, 'stdout: Applying patch CVE-2026-42009_p1.patch<br>
patching file lib/buffers.c<br>
Hunk #1 FAILED at 968.<br>
1 out of 1 hunk FAILED -- rejects in file lib/buffers.c<br>
Patch CVE-2026-42009_p1.patch does not apply (enforce with -f)<br>
<br>
stderr: ')<br>
ERROR: Logfile of failure stored in: .../wrynose/bitbake-builds/poky-wrynos=
e/build/tmp/work/x86-64-v3-poky-linux/gnutls/3.8.12/temp/log.do_patch.25292=
06<br>
ERROR: Task (.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded-co=
re/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_patch) failed with exit =
code '1'<br>
<br>
Can you rebase on the recently merged wrynose and resend?<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_DM4PR11MB61896A144BF2301F9CDD6E4CC4C32DM4PR11MB6189namp_--

