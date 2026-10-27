Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15821.1793097111915520470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 03:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FksdbpXH;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=23434; q=dns/txt;
  s=iport01; t=1793097111; x=1794306711;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=J4LiVsbGZZ8MLazAGOKjxmY6g454+NJnfC11rfa2Vkg=;
  b=FksdbpXHEuk+Z39nkmhyWvW6O3SkQfoAD25pvqcWpHU6/zONZ/Y0Q/Rh
   26uRk4VXGtDoGJtr9Mc/pJ0Q7NCEfTCAd4Yv6v9MO6q/JmmSK9uH1GPKX
   cWpkgm9JYhdKPWxfRbLl17aeO6HqHc7RC8uJRcdl8D04bS5sqvQVj17Dw
   f5pK3+3AwKTDh7nBF2LqF16ZaUPJoi6xwPEkvOtbWgWKphDD76Md4TTa4
   zG1oxhyV6CktPeZ7B4pDyER2+AM7Ac7jug1xPgkYyk0NRF8M7W6G3i6iR
   Rxh1QDpSvE5yTLGIVF30Z7JbL/vshQkBiNXlU3HyVXzZdbkqKJCsCFQC7
   Q==;
X-CSE-ConnectionGUID: GhRKmSbGS4WVw4lHbMknCA==
X-CSE-MsgGUID: b1YSXzFsTTeJyl+QhbUp4Q==
X-IPAS-Result: =?us-ascii?q?A0BoAwBKfOBq/5AQJK1QCh4BPAwCCzqBK4E9MVOBCQKBI?=
 =?us-ascii?q?0mIIwOFK4YJAYJwnh+Bfg8BAQENAjQdBAEBhD9GAo4XAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZAVfRIBGiY/FxAEAQ0NgnuCH?=
 =?us-ascii?q?RZBAwECDgarLwKJSxs3eIE0gQHgNwaBTYUGgz0cAQUmSWwBhBiEfRcQGxuBc?=
 =?us-ascii?q?oEVQoYIAQEBAQEXgRkvhBOCMASCDRWBDIFydIJMkR6BRCIDJjMsAVUTFwsHB?=
 =?us-ascii?q?YE1MwMgCi8tAhQvDxoyHXAMJxIsFy9YGwYFgR1zK3Uqa4EHXYErKWABIYEIg?=
 =?us-ascii?q?XYCglGCAAIBSUEOB0VTCSU+BRJHJCIIEgkBExouC4EaNTwJJkEVDGQLGgViC?=
 =?us-ascii?q?AINDHs5EDUgJG09NwYPGQMEgTUFkHQHW4IhHYEtBA4cAQUCIgEBFzc+Dz8FB?=
 =?us-ascii?q?gUBAkQKkyYBF4MWjCujdwoog3aKfIEmlXAXhASNFJlXiASRBCONZ5VgI4ULA?=
 =?us-ascii?q?gQCBAUCEAEBBoFoPIFZcBWCbgEzHzQZD5IkgmSCL8kneQIBAQcyAgcCBw4DC?=
 =?us-ascii?q?5FqLYFPAQE?=
IronPort-PHdr: A9a23:TnW2qhISa06PbUKx2tmcuVQyDhhOgF28FgcR7pxijKpBbeH+uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:+h2OZKxPGFXTH1AFXPF6t+dvxyrEfRIJ4+MujC+fZmUNrF6WrkUFn
 WJOWG2DOvbZZTOjc9FxaI2xoUMPvJTXmoQwGlRl+VhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsaD1MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJG42B64dwexYOj1xy
 +NELBAHSxOFrMvjldpXSsE07igiBMDvOIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUicC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+OiyYIWEIY3UHK25mG6S/
 1P9z3bXGS0mOf6OzXm88niRnrP2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuwbRRHu7yOQnXb/bCRxQ5e8wBPRYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:jX4psq/p7SpE2BTGKW1uk+HMdr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBdpTnhAsW9qXO1z+8S3WBjB8bcYOCGghrkEGgM1/qZ/9SNIVybygc/79
 YtT0EdMqyMMbESt6+Ti2fIcadE/DDtytHQuQ6q9QYXcegcUdAZ0+4WMHf9LmRGACN9Kd4SEp
 2a6sBbpzymV0g2Q62AbEUtbqzonfGOsIjpTyInKncchTWmvHeF+bT6Gx+X0lMkVS9TwbAtyG
 7BkwbozKSuufO2x3bnpiDuBpJt9+fJ+59mPoihm8IVIjLjhkKDf4J6QYCPuzgzvaWG9EsquM
 OkmWZgA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMBDdZbj44xSGqY16NghqA+7E
 t45RPdi3NlN2KFoM073amOa/herDv3nZPlq59Us5UQa/pGVFYbl/1gwKocKuZwIMu90vFoLM
 BeSOfB+f1RbVSWK1rdvmVp3ZiQe05bJGbffqDH0fbliQS/WxtCvhAlLMBzpAZxyLstD5ZD/O
 jKKaJuifVHSdIXd7t0AKMbTdKwEXGle2OFDIu+GyWQKEg8AQOFl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P0bjE9eH0pFH+g3EBDzVZ0Wm9uhOo5xi/rHsTrviNiOODFgojsu7uv0aRsnWQe
 y6Np5aC+LqaWHuBYFK1QvjXIQ6EwhUbOQF/tIgH16eqMPCLYPn8uTdbfbIPbLoVS0pX2vua0
 FzKwQb5P8wmnxDdkWI9SQ5AUmdCXAX1agAYpTnww==
X-Talos-CUID: =?us-ascii?q?9a23=3A4PLtdGgWCEOh7jgjw6wqvjEIljJuXX3n73LrKWC?=
 =?us-ascii?q?DVVlXV+GRaVW1+6VPup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AsE/tswy5Ev04wmJyu1vmzdx3ts+aqK73OXs9g7s?=
 =?us-ascii?q?dh/WJFz10eA6dhgmvHrZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Oct 2026 10:31:50 +0000
Received: from alln-opgw-5.cisco.com (alln-opgw-5.cisco.com [173.37.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id A570F180001C5
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 10:31:50 +0000 (GMT)
X-CSE-ConnectionGUID: znl9gwvHSje6BRkTCSQtSw==
X-CSE-MsgGUID: J8hFqkRUQxO+fqiPNK3Asg==
Authentication-Results: alln-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,181,1787011200"; 
   d="scan'208,217";a="69983808"
Received: from mail-northcentralusazon11012012.outbound.protection.outlook.com (HELO CH5PR02CU005.outbound.protection.outlook.com) ([40.107.200.12])
  by alln-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Oct 2026 10:31:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUMuBZYjxIrndl8Okk6hN+R3IdHy/+uqta90d4gN3O1Vtr5WwaZk+IPqJDc6Ps/WDYvun/4FAKWrRA7nkHNa8y2xPdsOzZY6Jn8jyN9B5ehtaZOaA9uSBom5+85jv3eXOSjl6BDacjPNqUzFoa0bAE59rwCcRejGzqE2WFHi5ioj33uJf1KFetliuyLKYA+vJ946bZ4QikWT/RPL4/qm/PXWB48jcxCZHzOGhdocX3n8Gbu4QaRAEga4KQg+T5sFDvd2p9kinaLF+4hl5esp+etpOlhv6W5SKvsk33BuzWe6Cl9gu8ZAV56cUnj5CFjFfnFsZ4S68DOFKn8vQ0JI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4LiVsbGZZ8MLazAGOKjxmY6g454+NJnfC11rfa2Vkg=;
 b=RznIPICz7/IgLqUVrmzKEbhO3ZL0bkIWDP4ARFRiSO1Y3ZsR4t4XpSdoaQq6LhO33F0d+YFpbDyWPSlaGqse2hPu83378RbLZjeVK/EyCEp9PaVZR3Eb+UDq8Ytws1sMuD3q3NIXUEH+/DfVmSgIrchGkQ6AxacjlwAvUajJIPzUPEtCkKn2Ypg/cOxRkGWqqUaT2+pQrBJSMuQE1ISqhwAu0+vhgG4FY2fR58+5//3BIaQlKQPCCZPK3126tK5EFGt10Y6tXGNtWiDeTRp0HgTdxB2eYDmu/Iz3Y4FXiEfJLF3tRJl+n3hiY72YmqaVrevr0PeVqhJGEX77PP8GdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 by FT1PR11MB837409.namprd11.prod.outlook.com (2603:10b6:170:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 10:31:48 +0000
Received: from PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340]) by PH0PR11MB7616.namprd11.prod.outlook.com
 ([fe80::9ba7:5071:9af5:340%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:31:47 +0000
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<devanshp@cisco.com>
To: "daniel.turull@ericsson.com" <daniel.turull@ericsson.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: "Ruslan Bilovol (rbilovol)" <rbilovol@cisco.com>, "Viral Chavda (vchavda)"
	<vchavda@cisco.com>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "JPEWhacker@gmail.com"
	<JPEWhacker@gmail.com>
Subject: SPDX 3.0 component releaseTime - clarification and areas for
 improvement
Thread-Topic: SPDX 3.0 component releaseTime - clarification and areas for
 improvement
Thread-Index: AQHdZfmLtEZYKFGl3ESJ2HWcWE/TQQ==
Date: Tue, 27 Oct 2026 10:31:47 +0000
Message-ID: <PH0PR11MB7616891F646E31AD2F01DE9AD3602@PH0PR11MB7616.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7616:EE_|FT1PR11MB837409:EE_
x-ms-office365-filtering-correlation-id: e2af5b8e-32b2-4dc4-e1b2-08df34158138
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|261026140227099003|38070700021|56012099006|261009223027099003|11063799006|261022105027099003|261022075727099003|261021121427099003|10067099003|18002099003|261026121527099003|6133799003|8096899003;
x-microsoft-antispam-message-info: TdsvZqlsyqxRCzcs7OvXzv7rniXEfW3pvFrRPGd6B3K3rmeQn9bIZQmBVkqPQZjn5Im/i/e9gF9xXmVLU+7UPr3bF4y03Yo8FRL9iY3cd/6SGJRf7sgCpoylG/Gg/WkLhX8P9HmueVCJcrn1KQY0Q3oET/8d5ZXW1x1XHXDGSYLQG+1GEldOR4Yj3q0ReOIBGIzYsqBAp5pVACaDmlavOJVe6AoQHcRI46ScKKoNEzUkYQ3SD5KdIZmnfu5MroUK8839O/3ivRjytJhAl4qYKvzdnen1FydmA4tBIfJHrZSV1HXaUYpB6m7jNTJ12UJqKDLq9xV0QabGzKIAwpPA8amYCrb6MeYI3CB+3nSZZPXgc2L5Qhe9KXNlD5/YbIFM38niiEtDgAAAzV+Aw2qIO39QIYae6vvT2FtXJNs3hE7SijTH0xFQzV+COvTaFiA8iCUTUeR5tm6DVO4AukGMnUcZ1jDeasKSRW7eveIoyKES4JjuXCOpCQXakrnwLpE+mUskIdasz7Lui4sKs9iBW+lzyHWxeRs2sqPSHNpxh53jslJs3dEueFFL1JpjRDqUNSO57duYImOorvYi970cKIZ2e8ZxwY7WJfEmi2G4nenZfAEq/MAqiZR32fEM2AKI+rixFVgEFox50ilU4fG4efYL8gFb8+7P8M5hjFM9Sio=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7616.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261026140227099003)(38070700021)(56012099006)(261009223027099003)(11063799006)(261022105027099003)(261022075727099003)(261021121427099003)(10067099003)(18002099003)(261026121527099003)(6133799003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?3Vb7NWN20FxIkaiCZdycs9Vx5SrpARsp8SAJG0nFfGDzBTjAUsQDQ7Ea?=
 =?Windows-1252?Q?pICGZl1h1mbOYmWHEHq10REPQDDSpbQ2fUNZmHJ57112uvpS+4TYi0es?=
 =?Windows-1252?Q?7h8AOWFWraRhK12HZMXAHOkSd7mpM+agkZD+MhH8CTXMow6i02ruS8Ib?=
 =?Windows-1252?Q?h9kPUmpkVvwKZzf9YphIvM6IeaBzjAgkYI2MLPYGX9/OcNIL1A6tlqen?=
 =?Windows-1252?Q?Si456JgtG6Q9Nm3ocIngi3jy5evcR+76C1xVT6fJ+yDePHY/XM0991Cx?=
 =?Windows-1252?Q?2AP2JhHiQnAjtmLJLlUslIikG8THebNaNyUycQzJOgJkC2v+09D1S76i?=
 =?Windows-1252?Q?k0GzAZiCu/fF9dkqM/0XRc19cqFSSgTWpnpyz2J8blyVpExGku+LAQsM?=
 =?Windows-1252?Q?BsLv9XZrQ3+bDAnjSIy34Pkkdjm+7B6+efM1ALKwA2jXilud+YaFyo9T?=
 =?Windows-1252?Q?ZBXcP+YoY7m0Ad/lAiUUyW05rAa63sHmCwASk4CNcbEsPcI+frqAlxRq?=
 =?Windows-1252?Q?VwBdeHGSa8UFbvDvSLZ03JdBkVZGVT/F5v0IOGQgCzXUFbb9zEFICLpX?=
 =?Windows-1252?Q?nil6eyvKVF3+bNwtilYLEsnLSNSyFVLAA98KXS8IAwo+jhi/U9KrVoCT?=
 =?Windows-1252?Q?gbSGrvBM6ET+Am5AH0tuCnubfFA2yxYRISkvjkSgjxXOIfFrX2hl8Usj?=
 =?Windows-1252?Q?c59yjqcROuoNfBxQB+Rx3jo12W6pBinLHbBOeRDPMg6lJ5uGK6uRsuXg?=
 =?Windows-1252?Q?dKbqkbRwfoXuMjjAgKc1L9HBOn1GVGZ1oVi0bFFb0VVFB0ioqXE0vF0A?=
 =?Windows-1252?Q?r8MmoIRisvajtXUf+SeLlDm8lrS5ZK1PWGpxQPwPXOChSGBHzRFvhmKZ?=
 =?Windows-1252?Q?le1twoSekBFMy9KmZrLo2hsZU03FtWRSmCyUk/63850vYlCd0q2XKCia?=
 =?Windows-1252?Q?ofC2EKDt4wYfnySi3AWYOB8ie/LstmiA8SQKuKQCy6y7b2aMAknieJ8u?=
 =?Windows-1252?Q?dfK0synuqP4ds9XkAarJj3exPi/AIS3O89ogoJQAyGhnTZ0xa0g9AGia?=
 =?Windows-1252?Q?6O5RoedJ7znD067nBvxO8f+46S0ERNUnoWm/bYit/2ILOVLLoH2HaB4S?=
 =?Windows-1252?Q?EWiHuq+iAhUNeQstofPKnEe4MFnZHMf+uoWevpU1uAS2GiqjT2lnIn8z?=
 =?Windows-1252?Q?dEZBpKGAtjWHmTc5Ek+iVr/ykQs4cDm1Y6aBXeA3HACVdvn9z4k6QAQo?=
 =?Windows-1252?Q?5mBkzQ9OBMEtI9sffixaBibXbXvJ4lZD4lE0AgNOxvp7x0D1n2abfcNZ?=
 =?Windows-1252?Q?KnVn88Ga0c8iw9G9eS8S2EekBm3fAVKfQSCD/oO7F0pqimHYKe7ORfi8?=
 =?Windows-1252?Q?6uVT8Bk5lxIE49kCO5DQLGhqnZiU1BKaqDLzZ7LFxT4zDN0Vw2punkFW?=
 =?Windows-1252?Q?/EgXyllhxj5un/pe0Amew6iOW5drWKDRxBIBxxK0nSX2JrTbx9ELnRds?=
 =?Windows-1252?Q?IUgc099dK51nWcf/S2byainIl6HeXl4sE9MB5w/UgWc/jH5vioD4lCbS?=
 =?Windows-1252?Q?mgJqHCATMQ0b96Jw23kqaCbVxAW4o6eBq95E6NbzaImiLPIXk1lloyLQ?=
 =?Windows-1252?Q?zawSgTggik0GLIkK3lJxccEiNllfEUsQwSoRg4GkCaAo89m0uXnfAPFe?=
 =?Windows-1252?Q?z5RGxgAsHYJmTnKO5ZNS201FmycTqyIrv3t5ma70HyYFZTETdgjqbIdL?=
 =?Windows-1252?Q?cysToaTLbqZh9wVD/N3h9cGfzzOGqUZWTb+whWeet29mFMiEDBWvM8dW?=
 =?Windows-1252?Q?Bfaf4MslsBoM16hXo4KqLFvqCZHXdoKr3Zsg2kWyQRhKWiJB?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB7616891F646E31AD2F01DE9AD3602PH0PR11MB7616namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Rm9cdjBNlybwMA++VqNvSMKH3iLj/AfUsfVoiezfXPOTLkKzRSGT2L1Ia9h9NghdrndSVolrKPIV8K61wyZSp/ovP8snIpCPMsLTp8D9e94dHyRiQIMVtj54N4s4O4tygCRjnSsKNv1FB2PaHpWXgnfUYoi+q3hv09Mw6/90Natb/0HTOOnLjK5IvPOZdQDJdvaQzk8KtvyJgX9uOvzAJM7gDUfF/1PCM/gy+TBzK3+47p8wQIywebl9WLwhCfPsd2Cv4Y0czUzXHiLfKxMiw3xKC/hCHFwGcK5C4Kch1yXozJYftfPCE/1j5eakpE4pKzwx/slHM7vjqmAxTiMETA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7616.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2af5b8e-32b2-4dc4-e1b2-08df34158138
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 10:31:47.3390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AfIw11RwEGIwavTZqKW5h9qX948BmJJTs+B5lLsHygVTEJg5RMwFlUh7fPIFwKhvvHx6tBzcm4pH7Q8+hmH6jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB837409
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-5.cisco.com [173.37.147.253];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.253, alln-opgw-5.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 10:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248724

--_000_PH0PR11MB7616891F646E31AD2F01DE9AD3602PH0PR11MB7616namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello,
We are evaluating the create-spdx-3.0 release-time feature for component-ag=
e assessment. Comparing generated timestamps with upstream release evidence=
 highlighted several cases that need clarification.

Could the Yocto/OpenEmbedded maintainers advise on the following?

  1.
Meaning of  releaseTime

Is the field intended to represent upstream release publication or a best-e=
ffort source timestamp? How should consumers distinguish a base release fro=
m a later source snapshot?

Example: tini v0.19.0+git produces 2025-05-08T14:41:25Z, matching the selec=
ted source revision=92s Git committer timestamp, while the v0.19.0 base rel=
ease<https://github.com/krallin/tini/releases/tag/v0.19.0> dates from 2020-=
04-19. These describe different events and produce different component ages=
. Clear guidance would help consumers interpret the field appropriately.

  1.
Dates for individual source components

Could dates be resolved independently for each source component rather than=
 assigning one recipe epoch to every downloaded source object? The download=
ed-source implementation<https://git.openembedded.org/openembedded-core/tre=
e/meta/lib/oe/spdx30_tasks.py?id=3De519068936be3abe8f049262fc9870cf8cf0527c=
#n463> computes the date before iterating over the sources.

Example: The identical once_cell-1.21.3.crate archive<https://static.crates=
.io/crates/once_cell/1.21.3/download> receives 2025-09-25 when consumed by =
 python3-bcrypt and 2026-02-10 when consumed by python3-cryptography. Neith=
er value is independently established as the crate=92s release date.
Another example is bzip2 1.0.8: its main tarball receives the 2020-05-17 co=
mmit timestamp from the auxiliary bzip2-tests repository. However, the offi=
cial release announcement<https://sourceware.org/legacy-ml/bzip2-devel/2019=
-q3/msg00031.html> establishes 2019-07-13 as the release date. The recipe<h=
ttps://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/bz=
ip2/bzip2_1.0.8.bb?id=3De519068936be3abe8f049262fc9870cf8cf0527c#n24> inclu=
des both the main tarball and the separate tests repository.

  1.
Release tarballs and mirrors

Under what conditions can a date derived from extracted tarball timestamps?=
 How should mirrored or repacked archives be handled, while distinguishing =
upstream publication from mirror upload times and HTTP metadata?

Example: For abseil-cpp 20260107.1, The generated UTC calendar date, 2026-0=
2-11, matches the date shown on the upstream release page<https://github.co=
m/abseil/abseil-cpp/releases/tag/20260107.1>. What validation or qualificat=
ions would upstream recommend before relying on similar tarball-derived dat=
es?

  1.
Normalized archive timestamps

How should the feature handle fixed timestamps introduced by packaging tool=
s for reproducibility? Could identified normalization values be flagged rat=
her than presented as release evidence?

Example: In our inspection, every regular file in the Pygments 2.19.2 sourc=
e archive has timestamp 2020-02-02, which becomes its SPDX release time. Ho=
wever, PyPI records publication on 2025-06-21<https://pypi.org/project/Pygm=
ents/2.19.2/>.
Fixed timestamps are documented packaging behavior: Hatch=92s timestamp uti=
lity<https://hatch.pypa.io/1.13/plugins/utilities/> defaults to 2020-02-02 =
when `SOURCE_DATE_EPOCH` is unset, and scikit-build-core documents using a =
fixed value<https://scikit-build-core.readthedocs.io/en/latest/reference/co=
nfigs.html#sdist-reproducible> for reproducible source distributions when t=
hat variable is unset.

  1.
Shared sources and package-object coverage

What is the recommended approach for shared-source consumers? Please also c=
larify how consumers should obtain source release dates when inspecting ins=
talled binary-package objects.

Example: gcc-runtime 15.3.0 uses sources supplied by gcc-source-15.3.0, but=
 its empty SRC_URI means it has no downloaded-source object carrying releas=
eTime. The GCC shared-source implementation<https://git.openembedded.org/op=
enembedded-core/tree/meta/recipes-devtools/gcc/gcc-shared-source.inc?id=3De=
519068936be3abe8f049262fc9870cf8cf0527c#n1> illustrates this arrangement.
Separately, the binary-package object for acl has no releaseTime, although =
its downloaded source object has one. The installed-package creation code<h=
ttps://git.openembedded.org/openembedded-core/tree/meta/lib/oe/spdx30_tasks=
.py?id=3De519068936be3abe8f049262fc9870cf8cf0527c#n920> creates these objec=
ts separately.

  1.
Date provenance and reasons for omission

Could supporting metadata identify whether a date comes from publication ev=
idence, a Git commit, or archive file timestamps, and explain why a date is=
 unavailable?

Example: Inspection of the poetry-core 2.3.1 source distribution<https://py=
pi.org/project/poetry-core/2.3.1/#files> found zeroed archive timestamps, l=
eading to fallback suppression and an omitted release time. The release-dat=
e helper<https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/sp=
dx30_tasks.py?id=3De519068936be3abe8f049262fc9870cf8cf0527c#n40> suppresses=
 the default fallback timestamp.
Generated content such as os-release<https://git.openembedded.org/openembed=
ded-core/tree/meta/recipes-core/os-release/os-release.bb?id=3De519068936be3=
abe8f049262fc9870cf8cf0527c#n1> also has no release time, but for a differe=
nt reason: it has no independent upstream release. Consumers need to distin=
guish these situations.

  1.
Reporting completeness and validation

Could the reporting script retain undated recipes, preserve source/version/=
architecture context, detect conflicting dates, and explicitly report inval=
id or skipped inputs?

Example: base-files and gcc-runtime do not appear in the report because the=
y have no downloaded-source package objects. In a controlled test, conflict=
ing dates for the same recipe are resolved by selecting whichever date is e=
ncountered first, without reporting the disagreement.

These questions relate to commits aeaa8ba9<https://git.openembedded.org/ope=
nembedded-core/commit/?id=3Daeaa8ba9d58d58b2f022e79abaf68a0849c66f2e>, e519=
0689<https://git.openembedded.org/openembedded-core/commit/?id=3De519068936=
be3abe8f049262fc9870cf8cf0527c>, and 10b5d2c0<https://git.openembedded.org/=
openembedded-core/commit/?id=3D10b5d2c0f60539d85b29c78ba5d7eac7d53fa25d>.

Please advise which behaviors are intentional limitations and which would b=
enefit from follow-up changes. We can provide small reproductions and corre=
sponding source/SPDX examples.

--_000_PH0PR11MB7616891F646E31AD2F01DE9AD3602PH0PR11MB7616namp_
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
Hello,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
We are evaluating the <i>create-spdx-3.0</i> release-time feature for compo=
nent-age assessment. Comparing generated timestamps with upstream release e=
vidence highlighted several cases that need clarification.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Could the Yocto/OpenEmbedded maintainers advise on the following?</div>
<ol start=3D"1">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation"><b>Meaning of&nbsp; <i>=
releaseTime</i></b></div>
</li></ol>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
Is the field intended to represent upstream release publication or a best-e=
ffort source timestamp? How should consumers distinguish a base release fro=
m a later source snapshot?</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
<b>Example: </b><i>tini v0.19.0+git</i>&nbsp;produces <code>2025-05-08T14:4=
1:25Z</code>, matching the selected source revision=92s Git committer times=
tamp, while the
<a href=3D"https://github.com/krallin/tini/releases/tag/v0.19.0" id=3D"anch=
or-350ed6b3-f95d-e99a-3058-1e61c6a39b4c" class=3D"OWAAutoLink">
v0.19.0 base release</a> dates from 2020-04-19. These describe different ev=
ents and produce different component ages. Clear guidance would help consum=
ers interpret the field appropriately.</div>
<ol start=3D"2">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation"><b>Dates for individual source components</b></d=
iv>
</li></ol>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
Could dates be resolved independently for each source component rather than=
 assigning one recipe epoch to every downloaded source object? The
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/=
spdx30_tasks.py?id=3De519068936be3abe8f049262fc9870cf8cf0527c#n463" id=3D"O=
WA575f92bb-ce63-d854-a15a-c12e9b45f2e9" class=3D"OWAAutoLink">
downloaded-source implementation</a> computes the date before iterating ove=
r the sources.</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"margin-left: 40px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
<b>Example:</b> The identical <a href=3D"https://static.crates.io/crates/on=
ce_cell/1.21.3/download" id=3D"OWAc8a96c72-3740-7f43-9ef8-9e07f06d3626" cla=
ss=3D"OWAAutoLink" title=3D"https://static.crates.io/crates/once_cell/1.21.=
3/download">
once_cell-1.21.3.crate archive</a> receives 2025-09-25 when consumed by&nbs=
p; <i>python3-bcrypt</i> and 2026-02-10 when consumed by
<i>python3-cryptography</i>. Neither value is independently established as =
the crate=92s release date.</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
Another example is <i>bzip2 </i>1.0.8: its main tarball receives the 2020-0=
5-17 commit timestamp from the auxiliary
<i>bzip2-tests</i> repository. However, the <a href=3D"https://sourceware.o=
rg/legacy-ml/bzip2-devel/2019-q3/msg00031.html" id=3D"OWAe92df583-d0c3-2db6=
-c716-bade66036fec" class=3D"OWAAutoLink">
official release announcement</a> establishes 2019-07-13 as the release dat=
e. The
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/recipes=
-extended/bzip2/bzip2_1.0.8.bb?id=3De519068936be3abe8f049262fc9870cf8cf0527=
c#n24" id=3D"OWA2f59c590-56b2-8afb-5284-2cb601fb08b1" class=3D"OWAAutoLink"=
>
recipe</a> includes both the main tarball and the separate tests repository=
.</div>
<ol start=3D"3">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation"><b>Release tarballs and mirrors</b></div>
</li></ol>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
Under what conditions can a date derived from extracted tarball timestamps?=
 How should mirrored or repacked archives be handled, while distinguishing =
upstream publication from mirror upload times and HTTP metadata?</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
<b><br>
</b></div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
<b>Example:</b> For <i>abseil-cpp 20260107.1</i>, The generated UTC calenda=
r date, 2026-02-11, matches the date shown on the
<a href=3D"https://github.com/abseil/abseil-cpp/releases/tag/20260107.1" id=
=3D"OWA5aa26bfb-de19-1396-0def-cc400b8c8d68" class=3D"OWAAutoLink" title=3D=
"https://github.com/abseil/abseil-cpp/releases/tag/20260107.1">
upstream release page</a>. What validation or qualifications would upstream=
 recommend before relying on similar tarball-derived dates?</div>
<ol start=3D"4">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation"><b>Normalized archive timestamps</b></div>
</li></ol>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
How should the feature handle fixed timestamps introduced by packaging tool=
s for reproducibility? Could identified normalization values be flagged rat=
her than presented as release evidence?</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
<b><br>
</b></div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
<b>Example:</b> In our inspection, every regular file in the <i>Pygments 2.=
19.2</i> source archive has timestamp 2020-02-02, which becomes its SPDX re=
lease time. However,
<a href=3D"https://pypi.org/project/Pygments/2.19.2/" id=3D"OWA93e45bdb-64c=
d-1c8f-cbbd-db20d38b8de8" class=3D"OWAAutoLink">
PyPI records publication on 2025-06-21</a>.</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
Fixed timestamps are documented packaging behavior: <a href=3D"https://hatc=
h.pypa.io/1.13/plugins/utilities/" id=3D"OWAf87474ba-17d9-176c-3baf-937ab2b=
c3085" class=3D"OWAAutoLink">
Hatch=92s timestamp utility</a> defaults to 2020-02-02 when `SOURCE_DATE_EP=
OCH` is unset, and
<a href=3D"https://scikit-build-core.readthedocs.io/en/latest/reference/con=
figs.html#sdist-reproducible" id=3D"OWAacb14021-a605-0606-65a5-93daa214b9bf=
" class=3D"OWAAutoLink">
scikit-build-core documents using a fixed value</a> for reproducible source=
 distributions when that variable is unset.</div>
<ol start=3D"5">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation"><b>Shared sources and package-object coverage</b=
></div>
</li></ol>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
What is the recommended approach for shared-source consumers? Please also c=
larify how consumers should obtain source release dates when inspecting ins=
talled binary-package objects.</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
<b><br>
</b></div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
<b>Example: </b><i>gcc-runtime</i> 15.3.0 uses sources supplied by <i>gcc-s=
ource-15.3.0</i>, but its empty
<i>SRC_URI</i> means it has no downloaded-source object carrying <i>release=
Time</i>. The
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/recipes=
-devtools/gcc/gcc-shared-source.inc?id=3De519068936be3abe8f049262fc9870cf8c=
f0527c#n1" id=3D"OWA622193be-cb31-98cb-8bd9-cc1202a47c0c" class=3D"OWAAutoL=
ink">
GCC shared-source implementation</a> illustrates this arrangement.</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
Separately, the binary-package object for <i>acl</i> has no <i>releaseTime<=
/i>, although its downloaded source object has one. The
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/=
spdx30_tasks.py?id=3De519068936be3abe8f049262fc9870cf8cf0527c#n920" id=3D"O=
WA91c948f9-2184-563b-18b8-bd08c595c3c5" class=3D"OWAAutoLink">
installed-package creation code</a> creates these objects separately.</div>
<ol start=3D"6">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation"><b>Date provenance and reasons for omission</b><=
/div>
</li></ol>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
Could supporting metadata identify whether a date comes from publication ev=
idence, a Git commit, or archive file timestamps, and explain why a date is=
 unavailable?</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
<b><br>
</b></div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
<b>Example:</b> Inspection of the <a href=3D"https://pypi.org/project/poetr=
y-core/2.3.1/#files" id=3D"OWAc2fa2e39-a6a6-bc4a-e759-431296b9fa13" class=
=3D"OWAAutoLink">
<i>poetry-core </i>2.3.1 source distribution</a> found zeroed archive times=
tamps, leading to fallback suppression and an omitted release time. The
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/=
spdx30_tasks.py?id=3De519068936be3abe8f049262fc9870cf8cf0527c#n40" id=3D"OW=
A310ab8f7-cf3e-99c4-ffb0-fe68f05d8e9d" class=3D"OWAAutoLink">
release-date helper</a> suppresses the default fallback timestamp.</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
Generated content such as <a href=3D"https://git.openembedded.org/openembed=
ded-core/tree/meta/recipes-core/os-release/os-release.bb?id=3De519068936be3=
abe8f049262fc9870cf8cf0527c#n1" id=3D"OWAccfad9f5-580a-6134-2b35-247bf6c4e3=
b9" class=3D"OWAAutoLink">
<i>os-release</i></a> also has no release time, but for a different reason:=
 it has no independent upstream release. Consumers need to distinguish thes=
e situations.</div>
<ol start=3D"7">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation"><b>Reporting completeness and validation</b></di=
v>
</li></ol>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
Could the reporting script retain undated recipes, preserve source/version/=
architecture context, detect conflicting dates, and explicitly report inval=
id or skipped inputs?</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);">
<b>Example:</b> <i>base-files</i> <span style=3D"font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: r=
gb(0, 0, 0);">
and</span> <i>gcc-runtime</i> do not appear in the report because they have=
 no downloaded-source package objects. In a controlled test, conflicting da=
tes for the same recipe are resolved by selecting whichever date is encount=
ered first, without reporting the
 disagreement.</div>
<div style=3D"margin-left: 0px; font-family: Aptos, Aptos_EmbeddedFont, Apt=
os_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: r=
gb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
These questions relate to commits <a href=3D"https://git.openembedded.org/o=
penembedded-core/commit/?id=3Daeaa8ba9d58d58b2f022e79abaf68a0849c66f2e" id=
=3D"OWAcfed106d-a4cd-ec6a-feae-4671d565b00b" class=3D"OWAAutoLink">
aeaa8ba9</a>, <a href=3D"https://git.openembedded.org/openembedded-core/com=
mit/?id=3De519068936be3abe8f049262fc9870cf8cf0527c" id=3D"OWAe032441d-fd39-=
cd61-c2b8-9fed76dfd34d" class=3D"OWAAutoLink">
e5190689</a>, and <a href=3D"https://git.openembedded.org/openembedded-core=
/commit/?id=3D10b5d2c0f60539d85b29c78ba5d7eac7d53fa25d" id=3D"OWA456bfbdc-9=
e1b-9dfe-ff92-a62741e5cf69" class=3D"OWAAutoLink">
10b5d2c0</a>.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Please advise which behaviors are intentional limitations and which would b=
enefit from follow-up changes. We can provide small reproductions and corre=
sponding source/SPDX examples.</div>
</body>
</html>

--_000_PH0PR11MB7616891F646E31AD2F01DE9AD3602PH0PR11MB7616namp_--
