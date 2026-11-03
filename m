Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4858.1793684032402838810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 21:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VkatRZ/i;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=21871; q=dns/txt;
  s=iport01; t=1793684032; x=1794893632;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=GYGPMahcgkVN3N1Pa2HH6ebKbSFqS3/PodlvYu1e9uw=;
  b=VkatRZ/idJPwN4gzpSV2t7UqTJiYYaENskffwOBaEQM2baNC7+dOqg4w
   tSy2KsNhqX3aiEeqylZMotukA6JH7ljvQbBO7F3xe7bQ0zF7tDwNonMLb
   Mhu/DAMdSf2VWi5NwAQYZzw3klZuYOtIzGhQHA/hkwjpq2bXnt8hhOsqm
   4vCmT6r5Ylu9OhbkndPSikyEvWAi4vhNcoSWnbb4R1y25SqiGFbGNm+HK
   LzFcZFpXNrD1fU46VsCNCIe4Iaxx9ZQRWy53zUkfrJgUK0RMFRqvQ+pS6
   h7/8hgeBOgz7BhbYQuvwmnjPZSFtPV92fFjDGMabUZZ/dfRrZAQEu5fM8
   Q==;
X-CSE-ConnectionGUID: tpb2oIUsSUCeUG5E6qeWEQ==
X-CSE-MsgGUID: HBz/vhdVR8W3uY9nR5O6wg==
X-IPAS-Result: =?us-ascii?q?A0AJBgC9cOlq/5AQJK1agS6BK4E9ATBTgQkCgRESSYgjA?=
 =?us-ascii?q?4UrhlmCIQORS45SDwEBAQ0CLgEbBwQBAYUFAo4cAiY3Bg4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQEBAQIBAYEIAgEIEQQBAQEuJ?=
 =?us-ascii?q?wodCAIEARIIDIJvgh0WGicDAQIOBrBxAoodeIE0gQGDYwHcWRWBOIVAgwMbA?=
 =?us-ascii?q?QErSWyCXYEjNIRiJxsbgXKBV4JpPoJhAgIBF4EdK4QUgjAEgg0VehIbgkIJg?=
 =?us-ascii?q?hmJdgEBggWGFlJyIgMmMywBVRMXCwcFgSUQMwMgCi8tAhQNIg8EFgUtHXAMJ?=
 =?us-ascii?q?xIPHRcRHlgbBgUSICpBQzArgRKBB12BKyheAh9GLRWBdgKCUYEjXQIBSUEOB?=
 =?us-ascii?q?0VTCSU+BRJHJCIIEgkBExosCoEaNTwJJj8VDFsLCxoFGkcIAgsCDHQoERATH?=
 =?us-ascii?q?R4kLwUcJkAQbT03Bg8ZAwSBNQWRIQdbghsBLUVaNAErBB4tgRZWDwQQkwMBC?=
 =?us-ascii?q?Y9PR6MwCiiDd4wjjT6IMheFW6UVmQgjjWeVYQIGGxaEdQIEAgQFAhABAQaBf?=
 =?us-ascii?q?iaBWXAVO4JnCUoZD44uFoNghRPJJ3kCAQgyAgcCBw4DC5FogX4BAQ?=
IronPort-PHdr: A9a23:2K68BxRGIabSaDn+3iXUCura2Npso47LVj580XJvo7tKdqLm+IztI
 wmGo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:nSL8Hq3mzIMJ7FU42/bD5Ypwkn2cJEfYwER7XKvMYLTBsI5bp2EOm
 GdNCj+PbKqIMGLyeYx2PN+28h8D78LRyYAyTFdk3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsaDpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGEFk8Z4o5x/1MPEpDy
 NNFBW4UYy+uvrfjqF67YrEEasULJc3vOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEiojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQhgOezb4CEI4fiqcN9vmyK4
 XzG81rDUi5BKe3OzwDY1Syzibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MvECSB3MPSXhKb9lOWNIKeAHGH
 2ShxrvBLTduq7aSD3ma89+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:oKDt2ajfPCfHXE6TmnXXhpjphXBQX9N23DAbv31ZSRFFG/FwyP
 re/8jzhCWVtN9OYhAdcIi7Sda9qBPnmaKdkrNhQ4tKPTOW9FdAQ7sSlrcKrweQfxEWs9QtqZ
 uIEJIOR+EYb2IK9/oSiTPQe71Psbv3lZxAx92uskuFJjsaDZ2Imj0JcjpzZXcGPTWua6BJc6
 a0145snRblU3IRaciwG3kCWMb+h/CjrvjbSC9DLSQKrC2Vgx2VyJOSKXWl9yZbfyJEwL8k/2
 SAqArk+6Wlvci8zx/Xx0XT455VlNaJ8KoMOCWLsKcoAwSprjztSJVqWrWEsjxwivqo8kwWnN
 7FpAplF9hv6lvKF1vF4SfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZ0Uw9p9txuZ
 g7nF5x9qAnTy8orh6No+QgZCsa0XZcZkBS19L7ukYvFLf2roUh9LD3snklSKvoVxiKmbzPWN
 MefP00oswmMG+yXjT+onRlxsCqUzAYGxeLRVVHh+muugImx0yQCyAjtZEidrBqzuNmd3FJit
 60QZhAhfVASNQbYrl6A/pEScyrCnbVSRaJK26KJ0/7fZt3cE4lhqSHqYnd3tvaMKAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTITH+mVTrgx8lC79wh04eMCYbDIGmGUhQjgsGgq/IQDonSXO
 uyIotfB7vmIXH1EYhE0gXiU91ZKGUYUscSptEnMmj+6P7jO8nvrKjWYfzTLL3iHXItXX7+GG
 IKWHzpKMBJ/imQKwnFadjqKgTQk2DEjOZN+fLhjpouIaA2R/hxjjQ=
X-Talos-CUID: 9a23:72f/V2+Wq6kJFpShQsaVv1IMEJoiU0DG90r7LnKXVEs3UbCqZGbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A54zWAw5kzegdyU8ghJ1RIukoxoxIybbpFkABr69?=
 =?us-ascii?q?WhJKZBH12AWq60iu4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Nov 2026 05:33:51 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 27947180001FC
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 05:33:51 +0000 (GMT)
X-CSE-ConnectionGUID: Y1sMQaGHR6ilOncjlnB2jw==
X-CSE-MsgGUID: EbyepuT5RIiA2BaKfJ9R2w==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,192,1787011200"; 
   d="scan'208,217";a="91448156"
Received: from mail-westusazon11010064.outbound.protection.outlook.com (HELO BYAPR05CU005.outbound.protection.outlook.com) ([52.101.85.64])
  by alln-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Nov 2026 05:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlIxhUhQ8HS6AZ4Su75jtZo6OUNNQW1RjM/n+F80t36dkik5XreZLliSdh1g+sx/uY5ICTUNeO9AtrucvZBQioBQiSeHy7espoAsYzyTtU89hhA9c/AH1O7mOuEhDPeMcWk2Z3Oq4wnhkjfVNSmNd82QjJCVfTPNcz9Lr4bD2IMeqm6uQrfdIV7JjScOcx6Q6aSlafv6FEMxujZub4+1NYjQZURI9V6G1USFItAT8SHOJkcDJ0BgDF+S+kGD8isLovJHywt1J49Hxb3ukOuqXB7KU1vd+0UegJF+FfEIM72gXM9aaE60UhdAFk/dT6nOrsSXjn9kPbUmpnheJDc4JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYGPMahcgkVN3N1Pa2HH6ebKbSFqS3/PodlvYu1e9uw=;
 b=AXipbymADUg+KIyYHPOvfF//7rbt8xLUGjh+gowApKBJBqOrrufjEbcBiUDnTeHbZUgwrNR3vYHTQv0yHUdPeIuIULFfTOk8Kwk1JJ9YkQsAO4+d18vjl417LEotSiqGcrHsb8rUqS9SZXwOa0+kBFbWt7mIoE78dKos/vxX1YoMIPOz4S5FJGv+8T4N5DFT5abQr6Q2flls8or0SGEIKB0zvLpNLViLXFaPLMA/2fti4cyToEM+XBqUIRHTQCVOJU7eQ1oB2vj5YV1QComNuKvAeSpxViFP9cvMFdPJeQ4/UEJg7aUr++IcwxJ0f8OYeRdfSdGT4aXok6Kw/EfnzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 by IA3PR11MB794841.namprd11.prod.outlook.com (2603:10b6:208:54a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 05:33:48 +0000
Received: from PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f]) by PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 05:33:48 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>, "peter.marko@siemens.com"
	<peter.marko@siemens.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches from
 u-boot
Thread-Topic: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches from
 u-boot
Thread-Index: AQHdS4frhCCAqvcIU0uOsV0baGdy0rb/TigAgAa+x6qADNOVgIAADuXdgAAPoQCACRMmMg==
Date: Tue, 3 Nov 2026 05:33:48 +0000
Message-ID: <PH7PR11MB859851658A7D586768D2A604AD692@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20260923173850.21338-1-peter.marko@siemens.com>
 <DM5RBD9MJT2O.2M12R8AMW5OLY@smile.fr>
 <PH7PR11MB8598B39DBADCDF5C628594DDAD672@PH7PR11MB8598.namprd11.prod.outlook.com>
 <DMGCPPR45G7N.2FMNA6HS4W3G6@smile.fr>
 <PH7PR11MB85983BF338795A95B47297DEAD6F2@PH7PR11MB8598.namprd11.prod.outlook.com>
 <DMGF1CY7LWZQ.3N9SFE4FLRK56@smile.fr>
In-Reply-To: <DMGF1CY7LWZQ.3N9SFE4FLRK56@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8598:EE_|IA3PR11MB794841:EE_
x-ms-office365-filtering-correlation-id: c344d9f5-dc14-4342-dd6b-08df396c093b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|8096899003|10067099003|18002099003|22082099003|13003099007|38070700021|56012099006|11063799006|4143699003|261022113327099003|261022105027099003|261022075727099003|261102123227099003|261028144727099003|261021123027099003|261021135927099003|261026121527099003|261021121427099003|261026140227099003|261009223027099003;
x-microsoft-antispam-message-info: jeScqy43sBXMdje7+SkeaNP9e4qu4V0esFcM7+5t9Fz8CDmdj09gumv1TaL1Ab6XLFV2TFs+NEvxN2UCXzuG8rLQ4TPNiKrXpBFP27FR3LrNJ1RcfbbfObzT57US40zjpzLeKOg36Dym/wapmWSrh0ApZsGo9ujxVtDlDH0CnhgEWmDN/N27rPy6nBY9rX0GHgEewmtIiDbSDJUNLq1egDrE0nI/c05+4+PuHGk5Y9FskwqI/8VaFDf/IWfi9jcT7Plt27L41jcsGkYbSZobLQmbXTs0Pd0D7IN9qyfW1u3qjTazA+yDqMm3tNHvvJ8mMIDUM53Bvi4HQECy09pT4QxA24qMARI/Z50j+2LdB9e/t4iCmcLwh5V46EktsvrOXYreW9W72Xeajr+E/VczC5T9mcpwMRSNq3AoXxuerTWDqSNGyhCKyjHejnFC8xNzd6WifBXBarktsq+6Dz8oqIHeHeRHJBG2jjo6LQ/KAkxVMBRpGe31X++r57jCOyqNMEbwsIx5x4/auHXMw/W6j7Y33c03c+NHcfmLtHnbgmUQ6rxVP+EUCaOo5qrdzlQdmBJ9BKD/UAlQVZWTqZscvMOduoN9wJnolhuAksAMq1g8iQLGuirDh95b9aK0Jay7EM6dMehSXa18QizSb+8hOWbiQXHK3OXGynFiUXaOlsw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(8096899003)(10067099003)(18002099003)(22082099003)(13003099007)(38070700021)(56012099006)(11063799006)(4143699003)(261022113327099003)(261022105027099003)(261022075727099003)(261102123227099003)(261028144727099003)(261021123027099003)(261021135927099003)(261026121527099003)(261021121427099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?VX63PqxJB4ogHDTbGxEdnpMune/Z2wHTo6rZY/+7yskrHg+kKnUxxTGV?=
 =?Windows-1252?Q?rpqYx+QFCwJBWWvvfq5lyfpiWLCzHVGxB5oRufvGDuTJAuc0HYPoBimC?=
 =?Windows-1252?Q?1tKoW/NWi2TKkMr80MXzTO5QPkwCM9XkmrC8rY7EncEVwNkdC0xaGlmx?=
 =?Windows-1252?Q?bcZYH12v9YfmV9FYORBp3xoSO3NRaLY0XOWul4owVghIek9oW/FrIRQL?=
 =?Windows-1252?Q?/1yHF+Yy4dM2/aemH5Ea2Kq1XHCwPYF/2xs66L6tpSk0EPvr5iLP0z2Y?=
 =?Windows-1252?Q?GSO8pcmWJOpcQdZn4PPwfMyWziKzqpiDgKx2JGysyMxYnsJlBGfsuy8e?=
 =?Windows-1252?Q?7t1nuDXsnfVMXh8yZK0oo95RfIYovrYiJSHyyobwKinLHmckae5bhjtf?=
 =?Windows-1252?Q?iPnrRgO06/yeZY3bNfbQ826Va0tlP+8DtWsmuo/VRFfg/qT93F5FoDSx?=
 =?Windows-1252?Q?GirOcp4DrAyJLUpioKMddcSRufgR+6V8dLWVA9XfG26kOUIZJ997qBd7?=
 =?Windows-1252?Q?Dd8YwjfYnk+nNKest3VDXXBHBKe0+zgbaSaHPxFrHfrsLxBrAI5Jo5C0?=
 =?Windows-1252?Q?WXv2ScvU9sazRPyBKSd5jDgfyIvfo46ccWmwkpKSmzFKziEOQzLi8RRg?=
 =?Windows-1252?Q?jch2w4L7crJ5napcIiRvx42VX3d6Nki3WZaxE95jYRHeRRNU54uxwurg?=
 =?Windows-1252?Q?hAlrqptLVBrqi6YpHDkT63ZgyONgk+PlxhsS1ZRGz8IAaD6uQbrf/iJl?=
 =?Windows-1252?Q?ZZbJMVG+0U014BYM8v10+zs42AIGU+eca1Df/6afXQqojMjjDm57S2uX?=
 =?Windows-1252?Q?nxAv24FsR/jCCcfzjxPFEecjgRxau9CwAV/xieCMXmlXkwlhv4tcEWgA?=
 =?Windows-1252?Q?RykenNjOKZK3yxleM2B5t6L4dj/yT17ndst9IjPbj4Dx1qGJxylUpiTS?=
 =?Windows-1252?Q?VRc7T7uA926696KSzUn3bd97VVOeOIHzwXHwyMJLVz524y/qoO8ccsm4?=
 =?Windows-1252?Q?8ZtJfy4a7l19n4P1rh0f1T5wtasyDXasWoriQXf0yRRPK8LNwVuovi4F?=
 =?Windows-1252?Q?HwYdNLzTVnu379Dk3PecardnI6xUHypVNRJWrR5+6DzdcPN9hh6Y9435?=
 =?Windows-1252?Q?HzLWWojGTNAD7UNCE7aGfwFVua4cCvCVhVg1tI8EPS5dd3vduAZ71fXJ?=
 =?Windows-1252?Q?gPwwgiPonv6dFlmO07ZnbYsVvNmHnqjOR+LGPbDIYoHiLV0T/NSqQtXW?=
 =?Windows-1252?Q?USVQouYbfmZ7n/QQCxIKTODqGChbUtSXTBfHU4XS29bFnFK+cdo9UpDK?=
 =?Windows-1252?Q?KresbKxPfiPHqz0au2rlath9t1PEGTcfRtQ1J8OJplphbp+6VUx7PtMi?=
 =?Windows-1252?Q?xfQzzgaY8BofXPXc4pNO4yZbEOPGQqzgYsAhpLhUx94bBKbMoYU7S0x6?=
 =?Windows-1252?Q?R3BPNScmn9uw7ecUjO/Dugij+FHBudjT6ItbDxE8xt4LWBtGnfwT6+RD?=
 =?Windows-1252?Q?inuiceXfdgXcc9GuO1cS7E6gsS0HiiQAbHCtIaF+nPP7FjGgsFk/oQ0O?=
 =?Windows-1252?Q?EfyHly1nh9In2aRzGsOh6/pG3s0wYmkNodwFRyotfHmxQsh02rnvHh5h?=
 =?Windows-1252?Q?0NKxaGsJi0uUWpcUqp3AHeY6UepuKEWLqIoYceVedRBeQyfB1wLjPCav?=
 =?Windows-1252?Q?drqWT1+ViBlvTDRSKt++OgAsfTPIbHEOTGUHQ1dtzkXZ1nWNKxgIMOzu?=
 =?Windows-1252?Q?2KgOttvCOxoYJaAREV3KeFw/AJMTQ/BuYAWikj4VD1/TIFQj8x1NsBkZ?=
 =?Windows-1252?Q?1MQkfm0LbmyDJgQzmZO+tFHX6I5ybTUyvNNCOQURWjRiyox4?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB859851658A7D586768D2A604AD692PH7PR11MB8598namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JBJKVT8+0uemESDTRCPw6WZ5CGoVbWV3VlGSKAaVqArUc8YiLXzHaM4fji0kHKBBZNVQmbG4l7s9XYceVg5uMNwH6apHRfgxEUpVe0QIFrO/Zoumla2fRl/11EYgTzubhfyCpIj/QJemkLbVhz5uhVV9NEt73Sqr98kFY6+TZMaNpdXMjcx1LCUP2ykVSZxQJMHdHjosy2Q8OQeCVjSJi6eZR0YXRhuDMKZiMTzdMN+gFgffaL1YPjKBL0GKejCtQLCCywWfxtc/gUYHGabqgE/bsVaeUtkhL8s5Ur7OZYA2SCwjLAAxmZAPQisb0NTKavLYDW+DAzu87Lpo+7qo0w==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c344d9f5-dc14-4342-dd6b-08df396c093b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 05:33:48.3853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W5LFC2lFfWHHTsvuCAOh+QXcgtyV1DWw5oPSiBC1i+0TpE85St0RjqVW+J1W2Kbcc+ZfX8pNkWZey8KzqOOTAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB794841
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-1.cisco.com [173.37.147.229];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 05:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249231

--_000_PH7PR11MB859851658A7D586768D2A604AD692PH7PR11MB8598namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

My reason for adding CVE_STATUS for is that u-boot-tools uses tools-only_de=
fconfig, which disables networking. The affected TCP and NFS code is theref=
ore not compiled into the tools. not-applicable-config accurately describes=
 this configuration.

I understand the preference for sharing source patches between u-boot and u=
-boot-tools. However, the tools remain unaffected by these CVEs regardless =
of whether the source fixes are applied, so I believe the configuration exc=
lusions are technically valid.

The same approach is already used in the wrynose branch [1], which excludes=
 all three CVEs. The fix for CVE-2026-29009 was also applied separately to =
u-boot on wrynose [2].
Additionally, For CVE-2026-29007 and CVE-2026-29008, I have not located a m=
erged upstream fix or a formal patch submission for either CVE in the U-Boo=
t community.

For these reasons, I believe retaining the CVE_STATUS entries is appropriat=
e for u-boot-tools on Scarthgap. They accurately reflect the configuration =
being built and keep the CVE assessment consistent with the approach alread=
y accepted for Wrynose.

[1] https://github.com/openembedded/openembedded-core/blob/wrynose/meta/rec=
ipes-bsp/u-boot/u-boot-tools_2026.01.bb
[2] https://git.openembedded.org/openembedded-core/commit/?h=3Dwrynose&id=
=3Ddff41dcd5e54cad46ba91ecc45faefb0c8db9089

Regards,
Hetvi
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 28 October 2026 16:26
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openembed=
ded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches fro=
m u-boot

On Wed Oct 28, 2026 at 11:04 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> Thanks for clarifying. For patches 9=9611, I understand that source
> fixes are preferred. However, networking is disabled in u-boot-tools,
> so building it would not compile or exercise the affected code. How
> should these fixes be verified?

By sharing the sources with u-boot which will compile those parts.

>
> Regards,
> Hetvi
>
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoan=
n.congal=3Dsmile.fr@lists.openembedded.org>
> Sent: 28 October 2026 14:37
> To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hth=
akar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openemb=
edded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org=
>
> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches f=
rom u-boot
>
> On Tue Oct 20, 2026 at 7:16 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHI=
PS PRIVATE LIMITED at Cisco) wrote:
>> Hi Yoann, Peter,
>>
>> Thanks, Yoann. Continuing the discussion here as suggested.
>>
>> As i explained in the other thread [1], the existing u-boot fixes are
>> not currently applied to u-boot-tools. My CVE_STATUS changes address
>> cases where the affected code is not compiled into the tools build.
>>
>> I understand that the proposed separate include would allow both
>> recipes to share the CVE patches without adding them to
>> u-boot-common.inc and affecting downstream users.
>>
>> My concern is whether we need this additional include and shared patch
>> list for cases that can be handled through recipe-specific CVE_STATUS
>> entries. Could we consider the held exclusions on that basis?
>>
>> If maintaining one shared source patch set is the preferred approach,
>> could you clarify how we should handle patches 2=9611 of my series?
>> Should we revisit them after the shared include is settled and retain
>> only the exclusions still needed?
>
> The general idea is that by sharing CVE patches with the main u-boot
> recipe, CVE would be also "fixed" in u-boot-tools (even if said patch is
> not compiled).
>
> For 2-8, patches are in u-boot so no need to ignore them:
> * [Patch 02/11] u-boot-tools: Ignore CVE-2024-42040
> * [Patch 03/11] u-boot-tools: Ignore CVE-2024-57254
> * [Patch 04/11] u-boot-tools: Ignore CVE-2024-57255
> * [Patch 05/11] u-boot-tools: Ignore CVE-2024-57256
> * [Patch 06/11] u-boot-tools: Ignore CVE-2024-57257
> * [Patch 07/11] u-boot-tools: Ignore CVE-2024-57258
> * [Patch 08/11] u-boot-tools: Ignore CVE-2024-57259
>
> For 9-11, there are no u-boot patches so ignoring them in the
> u-boot-tools recipe, would be fair (but patching them would be
> preferable):
> * [Patch 09/11] u-boot-tools: Ignore CVE-2026-29007
> * [Patch 10/11] u-boot-tools: Ignore CVE-2026-29008
> * [Patch 11/11] u-boot-tools: Ignore CVE-2026-29009
>
> Regards,
>
>>
>> [1] https://lists.openembedded.org/g/openembedded-core/message/247868
>>
>> Regards,
>> Hetvi
>> ________________________________
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.=
openembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoa=
nn.congal=3Dsmile.fr@lists.openembedded.org>
>> Sent: 16 October 2026 03:44
>> To: peter.marko@siemens.com <peter.marko@siemens.com>; openembedded-core=
@lists.openembedded.org <openembedded-core@lists.openembedded.org>
>> Cc: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <ht=
hakar@cisco.com>
>> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches =
from u-boot
>>
>> On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.openembedded.=
org wrote:
>>> From: Peter Marko <peter.marko@siemens.com>
>>>
>>> After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs
>>> patched in u-boot showed-up in CVE reports for u-boot-tools.
>>>
>>> It does not make much sense to share git repository but not share all
>>> patches on top of it, so move adding all patches from u-boot recipe to =
a
>>> common include file where also the git repository is defined.
>>>
>>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>> ---
>>>  meta/recipes-bsp/u-boot/u-boot-common.inc       | 10 ++++++++++
>>>  meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |  2 --
>>>  meta/recipes-bsp/u-boot/u-boot_2024.01.bb       | 12 ------------
>>>  3 files changed, 10 insertions(+), 14 deletions(-)
>>
>> Hello Peter, Hetvi,
>>
>> There is a bit of back-and-forth around u-boot-common.inc. So I thought =
I
>> would give my vision and get your thoughts.
>>
>> Fundamentally, there is confusion about the usage of this .inc file:
>> * This is the common part of u-boot and u-boot-tools recipes (what the
>>   above patch uses)
>> * But, also, this may be used by downstream layers to reuse u-boot
>>   recipe parts. We basically did the revert of Peter's patch a few month
>>   ago for this reason[0].
>>
>> With Paul, we would like to have a single set of patches common for both
>> u-boot and u-boot-tools, but that can't be in u-boot-common.inc as there
>> is a risk of breaking downstream layers.
>>
>> Our idea is to create a new inc file "u-boot-common-patches.inc" (I'm
>> not attached to the name) that contains only SRC_URI +=3D "CVE_*.patch"
>> and a big warning explaining that is file is only supposed to be
>> included from layer-local recipes (namely u-boot and u-boot-tools).
>>
>> This whole situation is not ideal but think the above would solve our
>> issues and still be acceptable under stable policy.
>>
>> What do you think?
>>
>> Regards,
>>
>> [0]: u-boot: move CVE patches out of the common .inc file - openembedded=
-core - OpenEmbedded Core layer
>>      https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8f=
f03147dd532a88cf3ce08d61fab057522
>> --
>> Yoann Congal
>> Smile ECS
>
>
> --
> Yoann Congal
> Smile ECS


--
Yoann Congal
Smile ECS


--_000_PH7PR11MB859851658A7D586768D2A604AD692PH7PR11MB8598namp_
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
My reason for adding CVE_STATUS for is that u-boot-tools uses tools-only_de=
fconfig, which disables networking. The affected TCP and NFS code is theref=
ore not compiled into the tools. not-applicable-config accurately describes=
 this configuration.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I understand the preference for sharing source patches between u-boot and u=
-boot-tools. However, the tools remain unaffected by these CVEs regardless =
of whether the source fixes are applied, so I believe the configuration exc=
lusions are technically valid.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
The same approach is already used in the wrynose branch [1], which excludes=
 all three CVEs. The fix for CVE-2026-29009 was also applied separately to =
u-boot on wrynose [2].</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Additionally, For CVE-2026-29007 and CVE-2026-29008, I have not located a m=
erged upstream fix or a formal patch submission for either CVE in the U-Boo=
t community.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
For these reasons, I believe retaining the CVE_STATUS entries is appropriat=
e for u-boot-tools on Scarthgap. They accurately reflect the configuration =
being built and keep the CVE assessment consistent with the approach alread=
y accepted for Wrynose.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
[1] https://github.com/openembedded/openembedded-core/blob/wrynose/meta/rec=
ipes-bsp/u-boot/u-boot-tools_2026.01.bb</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
[2] https://git.openembedded.org/openembedded-core/commit/?h=3Dwrynose&amp;=
id=3Ddff41dcd5e54cad46ba91ecc45faefb0c8db9089</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> 28 October 2026 16:26<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; peter.marko@siemens.com &lt;peter.marko@siemens=
.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@li=
sts.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patc=
hes from u-boot</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed Oct 28, 2026 at 11:04 AM CET, Hetvi Thakar =
-X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt; Hi Yoann,<br>
&gt;<br>
&gt; Thanks for clarifying. For patches 9=9611, I understand that source<br=
>
&gt; fixes are preferred. However, networking is disabled in u-boot-tools,<=
br>
&gt; so building it would not compile or exercise the affected code. How<br=
>
&gt; should these fixes be verified?<br>
<br>
By sharing the sources with u-boot which will compile those parts.<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Hetvi<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembedded.=
org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
&gt; Sent: 28 October 2026 14:37<br>
&gt; To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) &=
lt;hthakar@cisco.com&gt;; peter.marko@siemens.com &lt;peter.marko@siemens.c=
om&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@list=
s.openembedded.org&gt;<br>
&gt; Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patche=
s from u-boot<br>
&gt;<br>
&gt; On Tue Oct 20, 2026 at 7:16 AM CEST, Hetvi Thakar -X (hthakar - E INFO=
CHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt;&gt; Hi Yoann, Peter,<br>
&gt;&gt;<br>
&gt;&gt; Thanks, Yoann. Continuing the discussion here as suggested.<br>
&gt;&gt;<br>
&gt;&gt; As i explained in the other thread [1], the existing u-boot fixes =
are<br>
&gt;&gt; not currently applied to u-boot-tools. My CVE_STATUS changes addre=
ss<br>
&gt;&gt; cases where the affected code is not compiled into the tools build=
.<br>
&gt;&gt;<br>
&gt;&gt; I understand that the proposed separate include would allow both<b=
r>
&gt;&gt; recipes to share the CVE patches without adding them to<br>
&gt;&gt; u-boot-common.inc and affecting downstream users.<br>
&gt;&gt;<br>
&gt;&gt; My concern is whether we need this additional include and shared p=
atch<br>
&gt;&gt; list for cases that can be handled through recipe-specific CVE_STA=
TUS<br>
&gt;&gt; entries. Could we consider the held exclusions on that basis?<br>
&gt;&gt;<br>
&gt;&gt; If maintaining one shared source patch set is the preferred approa=
ch,<br>
&gt;&gt; could you clarify how we should handle patches 2=9611 of my series=
?<br>
&gt;&gt; Should we revisit them after the shared include is settled and ret=
ain<br>
&gt;&gt; only the exclusions still needed?<br>
&gt;<br>
&gt; The general idea is that by sharing CVE patches with the main u-boot<b=
r>
&gt; recipe, CVE would be also &quot;fixed&quot; in u-boot-tools (even if s=
aid patch is<br>
&gt; not compiled).<br>
&gt;<br>
&gt; For 2-8, patches are in u-boot so no need to ignore them:<br>
&gt; * [Patch 02/11] u-boot-tools: Ignore CVE-2024-42040<br>
&gt; * [Patch 03/11] u-boot-tools: Ignore CVE-2024-57254<br>
&gt; * [Patch 04/11] u-boot-tools: Ignore CVE-2024-57255<br>
&gt; * [Patch 05/11] u-boot-tools: Ignore CVE-2024-57256<br>
&gt; * [Patch 06/11] u-boot-tools: Ignore CVE-2024-57257<br>
&gt; * [Patch 07/11] u-boot-tools: Ignore CVE-2024-57258<br>
&gt; * [Patch 08/11] u-boot-tools: Ignore CVE-2024-57259<br>
&gt;<br>
&gt; For 9-11, there are no u-boot patches so ignoring them in the<br>
&gt; u-boot-tools recipe, would be fair (but patching them would be<br>
&gt; preferable):<br>
&gt; * [Patch 09/11] u-boot-tools: Ignore CVE-2026-29007<br>
&gt; * [Patch 10/11] u-boot-tools: Ignore CVE-2026-29008<br>
&gt; * [Patch 11/11] u-boot-tools: Ignore CVE-2026-29009<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
message/247868">
https://lists.openembedded.org/g/openembedded-core/message/247868</a><br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Hetvi<br>
&gt;&gt; ________________________________<br>
&gt;&gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-co=
re@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembed=
ded.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
&gt;&gt; Sent: 16 October 2026 03:44<br>
&gt;&gt; To: peter.marko@siemens.com &lt;peter.marko@siemens.com&gt;; opene=
mbedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedde=
d.org&gt;<br>
&gt;&gt; Cc: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) &lt;hthakar@cisco.com&gt;<br>
&gt;&gt; Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all pa=
tches from u-boot<br>
&gt;&gt;<br>
&gt;&gt; On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.openemb=
edded.org wrote:<br>
&gt;&gt;&gt; From: Peter Marko &lt;peter.marko@siemens.com&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs=
<br>
&gt;&gt;&gt; patched in u-boot showed-up in CVE reports for u-boot-tools.<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It does not make much sense to share git repository but not sh=
are all<br>
&gt;&gt;&gt; patches on top of it, so move adding all patches from u-boot r=
ecipe to a<br>
&gt;&gt;&gt; common include file where also the git repository is defined.<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Peter Marko &lt;peter.marko@siemens.com&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot-common.inc&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 10 ++++++++++<br>
&gt;&gt;&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |&nbsp; =
2 --<br>
&gt;&gt;&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot_2024.01.bb&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 12 ------------<br>
&gt;&gt;&gt;&nbsp; 3 files changed, 10 insertions(+), 14 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; Hello Peter, Hetvi,<br>
&gt;&gt;<br>
&gt;&gt; There is a bit of back-and-forth around u-boot-common.inc. So I th=
ought I<br>
&gt;&gt; would give my vision and get your thoughts.<br>
&gt;&gt;<br>
&gt;&gt; Fundamentally, there is confusion about the usage of this .inc fil=
e:<br>
&gt;&gt; * This is the common part of u-boot and u-boot-tools recipes (what=
 the<br>
&gt;&gt;&nbsp;&nbsp; above patch uses)<br>
&gt;&gt; * But, also, this may be used by downstream layers to reuse u-boot=
<br>
&gt;&gt;&nbsp;&nbsp; recipe parts. We basically did the revert of Peter's p=
atch a few month<br>
&gt;&gt;&nbsp;&nbsp; ago for this reason[0].<br>
&gt;&gt;<br>
&gt;&gt; With Paul, we would like to have a single set of patches common fo=
r both<br>
&gt;&gt; u-boot and u-boot-tools, but that can't be in u-boot-common.inc as=
 there<br>
&gt;&gt; is a risk of breaking downstream layers.<br>
&gt;&gt;<br>
&gt;&gt; Our idea is to create a new inc file &quot;u-boot-common-patches.i=
nc&quot; (I'm<br>
&gt;&gt; not attached to the name) that contains only SRC_URI +=3D &quot;CV=
E_*.patch&quot;<br>
&gt;&gt; and a big warning explaining that is file is only supposed to be<b=
r>
&gt;&gt; included from layer-local recipes (namely u-boot and u-boot-tools)=
.<br>
&gt;&gt;<br>
&gt;&gt; This whole situation is not ideal but think the above would solve =
our<br>
&gt;&gt; issues and still be acceptable under stable policy.<br>
&gt;&gt;<br>
&gt;&gt; What do you think?<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt;<br>
&gt;&gt; [0]: u-boot: move CVE patches out of the common .inc file - openem=
bedded-core - OpenEmbedded Core layer<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://git.openembedded.=
org/openembedded-core/commit/?id=3Df4ced8ff03147dd532a88cf3ce08d61fab057522=
">
https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8ff03147dd=
532a88cf3ce08d61fab057522</a><br>
&gt;&gt; --<br>
&gt;&gt; Yoann Congal<br>
&gt;&gt; Smile ECS<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH7PR11MB859851658A7D586768D2A604AD692PH7PR11MB8598namp_--
