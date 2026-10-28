Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39429.1793181864063407582
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 03:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XTugjIpY;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15312; q=dns/txt;
  s=iport01; t=1793181864; x=1794391464;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=geIeYfZEwJNi1VKxPSKCq5wfZEaPi7xOpGnVf6k7rGQ=;
  b=XTugjIpYNvzXXvnPDViF+ikqOMlTsdnEQ4/+xrlZMn6iji/Qt2p0QhHP
   aPvh90vrruMZPtdoD8nwpTVDk3sBWk5Yqb+Kmrw47WhiXbUYrdXiEVBXJ
   OkfOItxrHZ13/ZMunVmXybH1q813WUOb1lXvKawOFoJGPJrzFUteoYw71
   xQMsXdQJmTNuQLsEm7oKy9kEbf5NNtTfFfMA5sC0y6aGIvbuC9/ftKNmH
   fufNDB7oJTOd9kvDQnwqOT0CKAhOvZ4Dedeap1cixNpXKOje54f3lRQXU
   CQlA7Twhs7UauLlQvTbPd04WI5SYTch1vBMCE0ATONj3hTNrR+LDamoLn
   Q==;
X-CSE-ConnectionGUID: o2h3WU25TK6BzTSprB88Kg==
X-CSE-MsgGUID: s/kWMQCiQVyuJS4dJlxqzw==
X-IPAS-Result: =?us-ascii?q?A0A7BADgx+Fq/4//Ja1agS6BK4E9MVOBCQKBERJJiCMDh?=
 =?us-ascii?q?SuGWYIhA5FKjFKBfg8BAQENAi4BFQ0EAQGFBQKOGwImNQgOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgEBAQEDAYEIAgEIEQQBAQEuJ?=
 =?us-ascii?q?wodCAIEARIIgnuCHRZBAwECDqoPAoodeIE0gQGDYwHcWRWBOIMRgXU6gwMbA?=
 =?us-ascii?q?QErSWyCXYEjNIRiJxsbgXKBV4JpPoJhBAEXgR0rhBOCMASCDRV6EhuCQgmCM?=
 =?us-ascii?q?ol4AQGBLIYIUnIiAyYzLAFVExcLBwWBJRAzAyAKLy0CFA0QEg8EFgUtHXAMJ?=
 =?us-ascii?q?xIPHRcRHlgbBgUSICpBQzArgT6BB12BKylhAh9GLRWBdgKCUYEjXQIBSUEOB?=
 =?us-ascii?q?0VTCSU+BRJHJCIIEgkBExouC4EaNTwJJkEVDGQLGgUaSAgCCwIMdygREBMeI?=
 =?us-ascii?q?CYtbT03Bg8ZAwSBNQWQZQdbghkBLUVaNAErBB4tgWwPFJMDAQmPT0ejMAoog?=
 =?us-ascii?q?3aMIo0+iDIXhVulFJkII41nlWACIRaEdQIEAgQFAhABAQaBaQE6gVlwFTuCZ?=
 =?us-ascii?q?wlKGQ+OLhaIc8kneQIBCDICBwIHDgMLkWiBfgEB?=
IronPort-PHdr: A9a23:0fQQ5x0PbAsREtuqsmDPmlBlVkEcU/3cJAUZ7N8gk71RN//l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:KG77SqwQpzDtcCoYeG96t+dvxyrEfRIJ4+MujC+fZmUNrF6WrkUGm
 jZNCmmEPa7ZMGr8LowgPIy1ox9Su8LVx9ZnTAc4qFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsaDJMsMpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEZsPdYnx7wqPUIQ3
 +4kEygXREDTpO3jldpXSsE07igiBNPgMIVavjRryivUSK54B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOHWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OWxaYKOIoTXHq25mG6D4
 WH52l3SAygkJcG98maJ0Ha8n/3QyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7HQGMFVTVGLtchsafaWAAX6
 7NApPuwbRRHu7yOQnXb/bCRxQ5e8wBMRYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:Z0zDnqqTsINue00e6jKBvZYaV5siLNV00zEX/kB9WHVpm5Oj5q
 OTdaUgtSMc1gxxZJh5o6H+BEDhex/hHO1OkPcs1NaZLUXbUQSTXfpfBOfZslnd8mjFh5JgPM
 RbAudD4b/LfCJHZK/BiWHSfadDsby6GeKT9JrjJhxWPGdXgtRbnn9E43GgYzRLrWd9dP0EPa
 vZzPBq4xCnfnMaZNm6AH4qY8jvzuegqLvWJTQ9K1oC8gehsROEgYSWLzGomjsOWTJGxrkvtV
 PCjxH44aubtfS6wA/31mPY7Zha8eGRhOerAvbituElbhHXziq4boVoXLOP+Bovpvu01VosmN
 7Q5z89IsVa8RrqDyGIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FcyHe91ErsLhHoe
 F2NiOixthq5CH77WDADuvzJlZXf42P0DwfeNso/jliuE0lGeZsRMIkjRto+dw7bVPHAcgcYZ
 lT5YfnlbdrWGLfSWzFtW9yx9HpdHEyEhCaBnUmgKWuomNrdLQT9TpE+CTZ9U1wrq7UR/R/lp
 f5G7Utm7dUQsAMa6VhQO8HXMusE2TIBQnBKWSIPD3cZeo60l/22tfKCY8OlamXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO9hzWWm2yUTnk18kbvvFCy/DBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTB/P4N2PhFYtAwgW7UZhPLnsVVtETp78AKhizi9OOLpevuv3Qcf7VKraoGTE4WnnnCn
 9GRzT3LNUo1DHcZpY5ummnZ5rAQD2KwXsrKtmpwwE68vl5CrFx
X-Talos-CUID: =?us-ascii?q?9a23=3AKI6zimtC1QyIUO4hRa3roovF6IsiKH2G80qKfnO?=
 =?us-ascii?q?bV0x7dIaNU3XAqIBrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ApKBXlQ3AHR3B/HXPtkKu+JEEQjUj+OOtN2U0upQ?=
 =?us-ascii?q?/hdiZFxcsNxWZnC2lXdpy?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Oct 2026 10:04:23 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id D926B180003AA
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 10:04:22 +0000 (GMT)
X-CSE-ConnectionGUID: eKxY+ACpSpiQnRSELVw4DA==
X-CSE-MsgGUID: PoHDM4OkQy2GmBqW8q3dhw==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,182,1787011200"; 
   d="scan'208,217";a="82682914"
Received: from mail-eastusazon11011044.outbound.protection.outlook.com (HELO BL2PR02CU003.outbound.protection.outlook.com) ([52.101.52.44])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Oct 2026 10:04:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARvBaAGsh7Ds0Cj5jGR2R8VRho8jZSFCie+TzGzXNQnC0W+3e+ys7AzEqnAxZKjwKxmUTz9fyLQ/hwau+WtWjKDOHzqhXfVSkMhgjXn4i+O4Z5ITu+i5b1vT1qZu7dZ7zpN6vTP7piXLBQhc0su64JZX5sVjsJexspi9zsVNEFuIWn+icXwueM6scOgJWsgzRvanbbFaLCT6H1jL4HX1D1/HfP6axnm9669EpHF4np63ZX3TbZZyxwbfGuA3I8d+2PXSy86Euk6+ac43VMEWzZy1B+GFPhgD9bY2Zd3tKzVepULx9FKKKZy4tox0IEqjVmKGoE/PhNDhmPoegKCg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geIeYfZEwJNi1VKxPSKCq5wfZEaPi7xOpGnVf6k7rGQ=;
 b=cSQbRwXMmYY1vozCeVraQIKlIxC0nG0ucTbfVFHukR7eOestZciFiVhyxcvX7wS9fr6vFjWY7AcHzvQyGyWp1l0uWXmUlGVBVqqgvmavQ9eTKHKeAZf4N2ZS+8xngECXg13Vnsou4rQgdwanon4dnlKZvaSy0zRy9KvKCFUyCLjl8InzaXXV2IfeWFcA/D00+nablxsj14RX/9o0j3AjNiJMJ5JKbGFxP1nFU8XiRnpnyn9AALkWj4AqhM50DTJTkb8Hx6Cu/P0smDLr6p1Ftml55JrNgd5P0L0aKT6YTRC+CDqPcl2afrck3zGlhfVe8nBmFCz6D08SJRB9BVBcTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 by BN9PR11MB5226.namprd11.prod.outlook.com (2603:10b6:408:133::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 10:04:20 +0000
Received: from PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f]) by PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 10:04:19 +0000
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
Thread-Index: AQHdS4frhCCAqvcIU0uOsV0baGdy0rb/TigAgAa+x6qADNOVgIAADuXd
Date: Wed, 28 Oct 2026 10:04:19 +0000
Message-ID: <PH7PR11MB85983BF338795A95B47297DEAD6F2@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20260923173850.21338-1-peter.marko@siemens.com>
 <DM5RBD9MJT2O.2M12R8AMW5OLY@smile.fr>
 <PH7PR11MB8598B39DBADCDF5C628594DDAD672@PH7PR11MB8598.namprd11.prod.outlook.com>
 <DMGCPPR45G7N.2FMNA6HS4W3G6@smile.fr>
In-Reply-To: <DMGCPPR45G7N.2FMNA6HS4W3G6@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8598:EE_|BN9PR11MB5226:EE_
x-ms-office365-filtering-correlation-id: ee5fb52b-cf72-4d0b-a85f-08df34dad578
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|8096899003|13003099007|11063799006|56012099006|4143699003|261026140227099003|261021121427099003|261026121527099003|261021123027099003|10067099003|261009223027099003|261022105027099003|261022075727099003|261022113327099003|38070700021;
x-microsoft-antispam-message-info: 6UhkoDzV810dc9rBivkLW+WDWHtnb1tBckUHD4esYtisvUQ6iK+WKdLwIx5ONa47acueTWsXLZI933abUA5QutfiTHqEXNhy1Iut5fzo+wDMhwCxuxN4TeXhja3ZuuzciVVqK1Pa9A5pVIRVtHEfrgHqhgzJ6zElWNc7Wklqkem4plHpyETtS7PqgjSX7P1Eur214ffmCX10zZa5gTSVZaNV0T2hzYEGejfTGQwfGVJVehNcJ3tALwg9k9oqGMWQr0T1C/RKO4W6wvEAJ5L87vWo5oWNRBp9cGnLN8bf1e6416Qdq/B3eclxP91V5N+WcEji4XlYze1GarEyHdG0tFYstaUDB/SRTAiRWlXv1ULHFdTkGqW9LJh7QfsL7MSist3OSnaTAGsjR9P6rT+Pmo30sDF56WTPLisccDo/0XzdJBz7ASmCaNsQd3ORLB7CVMcHu48tZwSfZ1XPvIu1MOpg07L1FuYXDvd8lnUgu46+xM9aIkLuzTSCtMjxjqDON73ZHnhA4M0jbUP3foZF21F4AKgYaDFUvnVrqqfrWQsVxpiR2cliTo2+PjYWebJ3DHlPcrZ1Xp2sV+2RS2fH1n8lXgjQSoZXCFr8gOEFHyzGuzjOQ9ttl3SQ8nUIgb8jI0LJ4FvwrwMyVEayXHGFcs3NiKjocqcCfuhno7kjApU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(8096899003)(13003099007)(11063799006)(56012099006)(4143699003)(261026140227099003)(261021121427099003)(261026121527099003)(261021123027099003)(10067099003)(261009223027099003)(261022105027099003)(261022075727099003)(261022113327099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?OWzUeUSBdQIplgkotraafQOmYU+nA7TFPq5ErB51OkUdaFY8mDr711mP?=
 =?Windows-1252?Q?Y7bibcwk+tZ2vZUWWu6hgsuo5X/jNn/Nsg+689nR2GCDHHOQo44rFxZE?=
 =?Windows-1252?Q?TG3lgTGAite6faxB6yGFFbejcbYsideaEEjiZyRTqUw8/tw+/XY3TUDZ?=
 =?Windows-1252?Q?L1so0i9pKbEWoZ6wIlHUlbyTij521dR4igb/yKiebt3YaYs8JnSwCgQl?=
 =?Windows-1252?Q?mJ9GciioqT0/fwRIQsGLFTUATQzEwr4tqwOr2eBFZ/e24KN3rSU3HRth?=
 =?Windows-1252?Q?z4qDXWsRnX0IkjNoZVCXdKXoC4fH6U2SIF02h9OlBRbN1MOddjk7VnRB?=
 =?Windows-1252?Q?6u58KH0+G6XJ4SniIgDt7wM699oG4zDIjEhrCT85XkjHG8sGLH85jdlo?=
 =?Windows-1252?Q?qwPdJAMrEkfnkAE/1lqnk2pe7mN+DIoJlqHCMNk64qZTVgb/taOcGWf3?=
 =?Windows-1252?Q?J94dt9Sjq3H5aOROdwyD5GiPD89kqmpHRXyXwp3EOYwfpIl365TSbyui?=
 =?Windows-1252?Q?CvPbNsX05FNV2gLb8sfuhJThJMqzofS3ac2/bUU58CUzmjjy78fnvuCm?=
 =?Windows-1252?Q?OkWf3nTNqvW6aGa24lMZt0dNJZuU0NJrcYCAHFJuKLAydEnnRkizMSh3?=
 =?Windows-1252?Q?xM9tMYtbbFuwmzAdjyZUkts5qpEv9h5RLytHgvfckWjPDq1gqSWdc2w6?=
 =?Windows-1252?Q?U2/+qtBAte33bEvBqKktHlskxonWPuUPh5gU0knVFwkSkES0PqYjqTUg?=
 =?Windows-1252?Q?Ul+9AzA6Sjf6o2sc0vpTWv/UxYAY1r/eDJ2k9xuXRUvbMdOOPmdPOym3?=
 =?Windows-1252?Q?YQLQ+cOfyuuYNM5dcsyqoOlb9Xp9HEY6Pzyf6sgnqOcgwRUgVb1QrzHF?=
 =?Windows-1252?Q?I6kFqQtV4n44LC8up/k/aAczQ4yR9nvrQrR1pcTZAeTlH0p/5wkoAsAu?=
 =?Windows-1252?Q?SvSdNEEQh04tp86CfsyTaxhMBujTgVgbLLCILJ1RRyHx06PcgUr0f3Vi?=
 =?Windows-1252?Q?Kxz+Egly1HnjINlKgRNvdQrjlg2Y1fauemkJTNVIeU1u7a/+TpotkiOB?=
 =?Windows-1252?Q?mX0uSLi5HBwZ+UQH1Ga6bs8f9skTEZiwyWpTEjgP7KwaNVay9ICkWIkq?=
 =?Windows-1252?Q?jzL86ZYYlPMqX1Zliu0EKIBklGLaCRQfiTmT4Jtlgt8f8cK/txAxyJRp?=
 =?Windows-1252?Q?xUeKWTg/MGuNbDe2zDk4bF1z7eyePCH5r7YK/HFZbeWYleFmwP4v6Y42?=
 =?Windows-1252?Q?IwiWUl57oIv3jNs4DMClUOONWjCX6uS2KeGN5zCHmvDGtt+3xfArUOx8?=
 =?Windows-1252?Q?d51hzPP9qOKpFMOVIUeH7yWRlEwndKMg0dTaJiA899hSFxFm4ukILI9C?=
 =?Windows-1252?Q?QY+w/Iodl4wilvMFPzubAhpSkRNEHWZeYe3tRH/ZAJJ37ZQ4JHSAhY5J?=
 =?Windows-1252?Q?6AepSBhHS362E+tE3iVv92kp29z3RsG/xGBn2fZSi73fXRCUoaLFW3Su?=
 =?Windows-1252?Q?FaOd0O0/bLz26l40vRwtDyQBB8FPNU6cjFjxMbUHQqVp4TBWfRu/cc4L?=
 =?Windows-1252?Q?LO2FNFQHC+nSpjxVqjvzt3vPv99pAue74QylMyTrOapvv9kVvKksMTri?=
 =?Windows-1252?Q?aYYzaj++0EcXKiryoaV5BZ4h1iiJK7enRd44883b33vK0pzg2WlC1TJQ?=
 =?Windows-1252?Q?pQPPtLc1RACyIydVmlipZpIEMCPVhNTt9JUW+lirmzN57eo5UtXOZXfL?=
 =?Windows-1252?Q?R+KX36Q2tH5ySha/tlbZu+sXcpwIjsf0RTw1+hB1yKXXYz59V0IsrB1n?=
 =?Windows-1252?Q?1pP1ags0PMtNS0MjBIpCP0J3/twcgPICa9SidtDtn+Wb5mkk?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB85983BF338795A95B47297DEAD6F2PH7PR11MB8598namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YyG99pDkwaoIC8ThhWOJcuM5GXtQ0HEiANSv6OiB5Xi2Q9Ke/gTFCffr2kGjJRh92C6cxlyLpsv9dNtmh/pIlrkSPE+JzoGVKfaM7YrntG3738y8H6l7MVBSdVkEkkH+EDI5IROjiy7qJjSkui95pL3aYjOQoaGeCxTrzS7iydnlUNmnz+FAYlH6n5YwCwfqC34gYOWHOBR0MwMgz2gksEmE1807X8PO9zSGdPb285tECwyrw5+F+h6liVfTXxIY80l+z4AiyrLtAaV6WtpJZXiC+Y7w5IlP4XZd/P5vKcUTh65+vQij5hHUWkWpmeR5eu6O0zQPfitga+1xrjVs/g==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5fb52b-cf72-4d0b-a85f-08df34dad578
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 10:04:19.8259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aZQ970JXebBJYmxuY+A9x33vsc6MtD0P2Pb8MdnhKwUb36KOiSykmruUbX6UvZ1BINuMsAYKpxkH3yALleCaQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5226
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-3.cisco.com [72.163.7.164];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 10:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248804

--_000_PH7PR11MB85983BF338795A95B47297DEAD6F2PH7PR11MB8598namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for clarifying. For patches 9=9611, I understand that source fixes a=
re preferred. However, networking is disabled in u-boot-tools, so building =
it would not compile or exercise the affected code. How should these fixes =
be verified?

Regards,
Hetvi

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: 28 October 2026 14:37
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openembed=
ded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches fro=
m u-boot

On Tue Oct 20, 2026 at 7:16 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann, Peter,
>
> Thanks, Yoann. Continuing the discussion here as suggested.
>
> As i explained in the other thread [1], the existing u-boot fixes are
> not currently applied to u-boot-tools. My CVE_STATUS changes address
> cases where the affected code is not compiled into the tools build.
>
> I understand that the proposed separate include would allow both
> recipes to share the CVE patches without adding them to
> u-boot-common.inc and affecting downstream users.
>
> My concern is whether we need this additional include and shared patch
> list for cases that can be handled through recipe-specific CVE_STATUS
> entries. Could we consider the held exclusions on that basis?
>
> If maintaining one shared source patch set is the preferred approach,
> could you clarify how we should handle patches 2=9611 of my series?
> Should we revisit them after the shared include is settled and retain
> only the exclusions still needed?

The general idea is that by sharing CVE patches with the main u-boot
recipe, CVE would be also "fixed" in u-boot-tools (even if said patch is
not compiled).

For 2-8, patches are in u-boot so no need to ignore them:
* [Patch 02/11] u-boot-tools: Ignore CVE-2024-42040
* [Patch 03/11] u-boot-tools: Ignore CVE-2024-57254
* [Patch 04/11] u-boot-tools: Ignore CVE-2024-57255
* [Patch 05/11] u-boot-tools: Ignore CVE-2024-57256
* [Patch 06/11] u-boot-tools: Ignore CVE-2024-57257
* [Patch 07/11] u-boot-tools: Ignore CVE-2024-57258
* [Patch 08/11] u-boot-tools: Ignore CVE-2024-57259

For 9-11, there are no u-boot patches so ignoring them in the
u-boot-tools recipe, would be fair (but patching them would be
preferable):
* [Patch 09/11] u-boot-tools: Ignore CVE-2026-29007
* [Patch 10/11] u-boot-tools: Ignore CVE-2026-29008
* [Patch 11/11] u-boot-tools: Ignore CVE-2026-29009

Regards,

>
> [1] https://lists.openembedded.org/g/openembedded-core/message/247868
>
> Regards,
> Hetvi
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoan=
n.congal=3Dsmile.fr@lists.openembedded.org>
> Sent: 16 October 2026 03:44
> To: peter.marko@siemens.com <peter.marko@siemens.com>; openembedded-core@=
lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Cc: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hth=
akar@cisco.com>
> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches f=
rom u-boot
>
> On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.openembedded.o=
rg wrote:
>> From: Peter Marko <peter.marko@siemens.com>
>>
>> After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs
>> patched in u-boot showed-up in CVE reports for u-boot-tools.
>>
>> It does not make much sense to share git repository but not share all
>> patches on top of it, so move adding all patches from u-boot recipe to a
>> common include file where also the git repository is defined.
>>
>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> ---
>>  meta/recipes-bsp/u-boot/u-boot-common.inc       | 10 ++++++++++
>>  meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |  2 --
>>  meta/recipes-bsp/u-boot/u-boot_2024.01.bb       | 12 ------------
>>  3 files changed, 10 insertions(+), 14 deletions(-)
>
> Hello Peter, Hetvi,
>
> There is a bit of back-and-forth around u-boot-common.inc. So I thought I
> would give my vision and get your thoughts.
>
> Fundamentally, there is confusion about the usage of this .inc file:
> * This is the common part of u-boot and u-boot-tools recipes (what the
>   above patch uses)
> * But, also, this may be used by downstream layers to reuse u-boot
>   recipe parts. We basically did the revert of Peter's patch a few month
>   ago for this reason[0].
>
> With Paul, we would like to have a single set of patches common for both
> u-boot and u-boot-tools, but that can't be in u-boot-common.inc as there
> is a risk of breaking downstream layers.
>
> Our idea is to create a new inc file "u-boot-common-patches.inc" (I'm
> not attached to the name) that contains only SRC_URI +=3D "CVE_*.patch"
> and a big warning explaining that is file is only supposed to be
> included from layer-local recipes (namely u-boot and u-boot-tools).
>
> This whole situation is not ideal but think the above would solve our
> issues and still be acceptable under stable policy.
>
> What do you think?
>
> Regards,
>
> [0]: u-boot: move CVE patches out of the common .inc file - openembedded-=
core - OpenEmbedded Core layer
>      https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8ff=
03147dd532a88cf3ce08d61fab057522
> --
> Yoann Congal
> Smile ECS


--
Yoann Congal
Smile ECS


--_000_PH7PR11MB85983BF338795A95B47297DEAD6F2PH7PR11MB8598namp_
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
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks for clarifying. For patches 9=9611, I understand that source fixes a=
re preferred. However, networking is disabled in u-boot-tools, so building =
it would not compile or exercise the affected code. How should these fixes =
be verified?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hetvi</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembedde=
d.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> 28 October 2026 14:37<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; peter.marko@siemens.com &lt;peter.marko@siemens=
.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@li=
sts.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patc=
hes from u-boot</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Tue Oct 20, 2026 at 7:16 AM CEST, Hetvi =
Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt; Hi Yoann, Peter,<br>
&gt;<br>
&gt; Thanks, Yoann. Continuing the discussion here as suggested.<br>
&gt;<br>
&gt; As i explained in the other thread [1], the existing u-boot fixes are<=
br>
&gt; not currently applied to u-boot-tools. My CVE_STATUS changes address<b=
r>
&gt; cases where the affected code is not compiled into the tools build.<br=
>
&gt;<br>
&gt; I understand that the proposed separate include would allow both<br>
&gt; recipes to share the CVE patches without adding them to<br>
&gt; u-boot-common.inc and affecting downstream users.<br>
&gt;<br>
&gt; My concern is whether we need this additional include and shared patch=
<br>
&gt; list for cases that can be handled through recipe-specific CVE_STATUS<=
br>
&gt; entries. Could we consider the held exclusions on that basis?<br>
&gt;<br>
&gt; If maintaining one shared source patch set is the preferred approach,<=
br>
&gt; could you clarify how we should handle patches 2=9611 of my series?<br=
>
&gt; Should we revisit them after the shared include is settled and retain<=
br>
&gt; only the exclusions still needed?<br>
<br>
The general idea is that by sharing CVE patches with the main u-boot<br>
recipe, CVE would be also &quot;fixed&quot; in u-boot-tools (even if said p=
atch is<br>
not compiled).<br>
<br>
For 2-8, patches are in u-boot so no need to ignore them:<br>
* [Patch 02/11] u-boot-tools: Ignore CVE-2024-42040<br>
* [Patch 03/11] u-boot-tools: Ignore CVE-2024-57254<br>
* [Patch 04/11] u-boot-tools: Ignore CVE-2024-57255<br>
* [Patch 05/11] u-boot-tools: Ignore CVE-2024-57256<br>
* [Patch 06/11] u-boot-tools: Ignore CVE-2024-57257<br>
* [Patch 07/11] u-boot-tools: Ignore CVE-2024-57258<br>
* [Patch 08/11] u-boot-tools: Ignore CVE-2024-57259<br>
<br>
For 9-11, there are no u-boot patches so ignoring them in the<br>
u-boot-tools recipe, would be fair (but patching them would be<br>
preferable):<br>
* [Patch 09/11] u-boot-tools: Ignore CVE-2026-29007<br>
* [Patch 10/11] u-boot-tools: Ignore CVE-2026-29008<br>
* [Patch 11/11] u-boot-tools: Ignore CVE-2026-29009<br>
<br>
Regards,<br>
<br>
&gt;<br>
&gt; [1] <a href=3D"https://lists.openembedded.org/g/openembedded-core/mess=
age/247868" id=3D"OWAe1054a9b-dae0-7cdf-e9c3-c7524cc33e61" class=3D"OWAAuto=
Link" data-auth=3D"NotApplicable">
https://lists.openembedded.org/g/openembedded-core/message/247868</a><br>
&gt;<br>
&gt; Regards,<br>
&gt; Hetvi<br>
&gt; ________________________________<br>
&gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembedded.=
org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
&gt; Sent: 16 October 2026 03:44<br>
&gt; To: peter.marko@siemens.com &lt;peter.marko@siemens.com&gt;; openembed=
ded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.or=
g&gt;<br>
&gt; Cc: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) &=
lt;hthakar@cisco.com&gt;<br>
&gt; Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patche=
s from u-boot<br>
&gt;<br>
&gt; On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.openembedde=
d.org wrote:<br>
&gt;&gt; From: Peter Marko &lt;peter.marko@siemens.com&gt;<br>
&gt;&gt;<br>
&gt;&gt; After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs<br>
&gt;&gt; patched in u-boot showed-up in CVE reports for u-boot-tools.<br>
&gt;&gt;<br>
&gt;&gt; It does not make much sense to share git repository but not share =
all<br>
&gt;&gt; patches on top of it, so move adding all patches from u-boot recip=
e to a<br>
&gt;&gt; common include file where also the git repository is defined.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Peter Marko &lt;peter.marko@siemens.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot-common.inc&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | 10 ++++++++++<br>
&gt;&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |&nbsp; 2 --=
<br>
&gt;&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot_2024.01.bb&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | 12 ------------<br>
&gt;&gt;&nbsp; 3 files changed, 10 insertions(+), 14 deletions(-)<br>
&gt;<br>
&gt; Hello Peter, Hetvi,<br>
&gt;<br>
&gt; There is a bit of back-and-forth around u-boot-common.inc. So I though=
t I<br>
&gt; would give my vision and get your thoughts.<br>
&gt;<br>
&gt; Fundamentally, there is confusion about the usage of this .inc file:<b=
r>
&gt; * This is the common part of u-boot and u-boot-tools recipes (what the=
<br>
&gt;&nbsp;&nbsp; above patch uses)<br>
&gt; * But, also, this may be used by downstream layers to reuse u-boot<br>
&gt;&nbsp;&nbsp; recipe parts. We basically did the revert of Peter's patch=
 a few month<br>
&gt;&nbsp;&nbsp; ago for this reason[0].<br>
&gt;<br>
&gt; With Paul, we would like to have a single set of patches common for bo=
th<br>
&gt; u-boot and u-boot-tools, but that can't be in u-boot-common.inc as the=
re<br>
&gt; is a risk of breaking downstream layers.<br>
&gt;<br>
&gt; Our idea is to create a new inc file &quot;u-boot-common-patches.inc&q=
uot; (I'm<br>
&gt; not attached to the name) that contains only SRC_URI +=3D &quot;CVE_*.=
patch&quot;<br>
&gt; and a big warning explaining that is file is only supposed to be<br>
&gt; included from layer-local recipes (namely u-boot and u-boot-tools).<br=
>
&gt;<br>
&gt; This whole situation is not ideal but think the above would solve our<=
br>
&gt; issues and still be acceptable under stable policy.<br>
&gt;<br>
&gt; What do you think?<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; [0]: u-boot: move CVE patches out of the common .inc file - openembedd=
ed-core - OpenEmbedded Core layer<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://git.openembedded.org/=
openembedded-core/commit/?id=3Df4ced8ff03147dd532a88cf3ce08d61fab057522" id=
=3D"OWA9a68f7bd-4345-d9ab-43ef-9ae68daf89ad" class=3D"OWAAutoLink" data-aut=
h=3D"NotApplicable">
https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8ff03147dd=
532a88cf3ce08d61fab057522</a><br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH7PR11MB85983BF338795A95B47297DEAD6F2PH7PR11MB8598namp_--
