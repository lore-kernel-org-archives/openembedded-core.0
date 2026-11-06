Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3424.1793962651347096721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 02:57:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VXHvklpm;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=18210; q=dns/txt;
  s=iport01; t=1793962651; x=1795172251;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=ZprOIA5dsR5N66TMJths8q88ogMM0xJZhzH6ifeTseU=;
  b=VXHvklpm7U7DUVZzRNjXyYK2/gKEL0jqBbKc5JmRIzI06J5vWfb+dAUv
   X86Rw2szFY1crLvBEA9hsQIgE/Iu3KyRQnsC4U7H/He+awb8YNAu10E4b
   UnbKa2peFxtvBGgAq1OdygnG9aetLtGGFTm+QEJpZg5vDuhrkbXwxfPhL
   UdMFn9UQehxXHXw7/9kXUDwiPOHV+vQCUWwKBGJsaW9Rp4Jna8qhr+uZf
   dL5jlU1oNxKYXW2URLSWpP9zS5x6Y2/DIv3PZLb89GhBhnJxujT4SzqEh
   FmgDj506yHeI9w4QcV5m9d1Jkcn61yXbN7TPKjcYq02NtkLphxLeT2N3a
   A==;
X-CSE-ConnectionGUID: yyRigvJfQFq4RnhAl2LdsA==
X-CSE-MsgGUID: MpxJ1jVbRZOcS3gUPk1n+A==
X-IPAS-Result: =?us-ascii?q?A0DZAwB5se1q/48QJK1agS6BK4E9MVOBCQKBERIaLwSIH?=
 =?us-ascii?q?wOFK4h6A54hgX4PAQEBDQIuARUNBAEBhQUCjh0CJjQJDgECBAMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAQEBAwERFSQBLRACAQgRAwEBA?=
 =?us-ascii?q?QEuJwodCAIEAQ0FCBIIgmGCHRZBAwECDrEQcwKKHXiBATOBAYMpAd0TFAGBO?=
 =?us-ascii?q?IMRgjGDBBsBAQUmSWyCXYEjGAGEfScbG4FygRVCgmk+gQWBXAICAReBHRoRH?=
 =?us-ascii?q?h6DWIIwBIIiehIbgT+BAwmMDAEBgVGGeVJyIgMmMywBVRMXCwcFgSUQMwMgC?=
 =?us-ascii?q?i8tAhQNIg8aBS0dcAwnEg8dFxEeWBsGBRIgKkFDMCuBEoEHXYErKF0BAh9GL?=
 =?us-ascii?q?RWBdgKCUYEjXQIBSUEOB0VTCRYPPgUSRyQiCBIJARMaLAqBGjU8CSY/FQxkC?=
 =?us-ascii?q?xoFGkcIAgsCDHQoERATHR4kLwUcJj4bCi9tPTcGDxkDBIE1BZFRB1uDEgGBD?=
 =?us-ascii?q?QErT4EuAQYPGQYRkzYujxOBfIxklRkKKIN4in6BJo0+iDIXhASBV4s9mVkLm?=
 =?us-ascii?q?H0jjWeVYYUuAgQCBAUCEAEBBoFoPIFZcBWCbgEBMgkKQBkPkiSFE8YveQIBC?=
 =?us-ascii?q?DIBAQcCBw4DC4FokAACJoFWAQE?=
IronPort-PHdr: A9a23:oJLdBBO1v5zicQ2Gou8l6nc2WUAX0o4cdiYc7p4hzrVWfbvmo9LpP
 VfU4rNmi1qaFYnY6vcRk+PNqOigQm0P55+drWoPOIJBTR4LiMga3kQgDceJBFe9LavCZC0hF
 8MEX1hgl0w=
IronPort-Data: A9a23:ZKQy6K2zk7sDcdl5rfbD5Ypwkn2cJEfYwER7XKvMYLTBsI5bp2FWx
 zFKXWCEaPfYYmOjKd90at+wo05U75DTydc2SwZu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsbzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGHVAMPIIG2OhOL3gSz
 /oYATRXShyYrrfjqF67YrEEasULJc3vOsYb/3pn1zycVahgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME+ojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQhgOm0YYKLJITiqcN9u16Ih
 DvEwW7DMDYRD4eQ9AKGq3Tvr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2ShxrvBLTduq7aSD3ma89+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:T/CZParUQGt/UpNszL3SKvkaV5srLNV00zEX/kB9WHVpm5Oj5q
 OTdaUgtSMc1gxxZJh5o6H/BEDhex/hHZ4c2/h2AV7QZniWhILIFvAs0WKM+UybJ8STzJ846U
 4kSdkANDSSNyk1sS+Z2njELz9I+rDum87Y55a6854ud3AXV0gK1XYBNu/vKDwMeOAwP+tAKH
 Pz3LshmxOQPV4sQoCQAH4DU+Lfp9vNuq7HTHc9bSIP2U2ltx/tzKT1PSS5834lPg9n8PMP4G
 LFmwv26uGZte2nyhjT7mnX755HstrswNlOCaW3+4kowzPX5TqAVcBEYfmvrTo1qOag5BIBi9
 /XuSotOMx19jf4Yny1iQGF4Xii7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBH1r
 5R1W7xjesUMfqAplW52zH7bWAsqqOGmwtlrQfVtQ0HbWIqUs4UkWXYxjIMLH5PJlOg1GltKp
 gfMCiV3ockTbrdVQGYgkBfhPqxQ380AhCKBmIGusCTznxquUoR9TpD+CTa9U1wqK7UjPJ/lr
 n52qgErsA9cuYGKa16H+sPWs2xFyjERg/NKnubJRD9GLgAIG+lke+83FwZ3pDjRHUz9up4pL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GTDg0NtX6ZR1sqD1AOODC1zOdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXYJExRf3VZVeIWQXFMcVptE4UVSTpd+jEPymisXLNPLIYLb9GzctXW3yRn
 MFQTjoPc1FqlumX3fp6SKhEk8FunaPi66YPJKqiNT7krJ9Q7GkmjJl/WiE2g==
X-Talos-CUID: 9a23:sYyiCm3iF9Y7npfEP/mkCrxfC9Efc3LD7nnpDVbkM2BpYbnPbVOL0fYx
X-Talos-MUID: 9a23:k4604wpBK9FqgeaKqSoezxR6JOUx4ZqkMnIqmq5dtPS8NnV2eB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 10:57:30 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 234761800025F
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 10:57:30 +0000 (GMT)
X-CSE-ConnectionGUID: LaccyqoRTrK0JX5A7mJPdA==
X-CSE-MsgGUID: +Diuc+f/S/q3FNK/e0BwQw==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208,217";a="91799802"
Received: from mail-southcentralusazon11013008.outbound.protection.outlook.com (HELO SA9PR02CU001.outbound.protection.outlook.com) ([40.93.196.8])
  by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 10:57:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNPL19JEGxJ1BPFq/GRxOWXFACCX7mUHJMwrZgJmHGNs7QtgB/XWeXxgJcnHQXCaqstlEqhU9lcjK/9qE4UFLRvKNYfqnWsJ5FFMHl3mp8crxpUTZBn0UY1CUPSaKtB2jBiWKmo3k5+ZTI6iNEPY3QJFBJKDf5saHx5/CWz9WXb5Nal0i1GHxyw6KYc0GHQwHF2XAvASgfbCSyxUr6NBlF50j+3GkYxKRG8hnVeKF5DtBWnO3tI6xPFU59r847eE/yjF/8LZV7AKCeyztJR2JzO+d7yWd591wgjWoAzBO7j416E1bF6eZ6jrOB93Cyp3XTlYEb2gqC7HL5mRwCpVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZprOIA5dsR5N66TMJths8q88ogMM0xJZhzH6ifeTseU=;
 b=Suo+i7CTmZUubLHB9aNT9/bxJ0gpOLMChxTz1HIKpEbtI2ZTeoWOegjR+XySIMS+FDs5kbq1C1BE5KtOvaG4r8kMSUvtJhgFLsZt/rdSyXjAMJAdkWbwS5w4GmABFyvNCzKSRmTEl7vyjV+tQ5aE4j/UjSxgnC0xGFdW8h1lQB4zEkQT+Ibq8D7CYOSgZ2FEUDhFljalhaMS5vrLDDiBRx2aZookYL91TuOYc7NsxUL5kzJBmN/JcShqV3bUWT1RXOkENiUg32XhuWt2xegF6t+Rqw/Opn29IMIsMB1td/9eVv9mb0M8VyfJiF8wWAMcXGj2JtDmundoSICql7mP8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 by DS6PR11MB721915.namprd11.prod.outlook.com (2603:10b6:8:4c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 10:57:27 +0000
Received: from PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f]) by PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 10:57:26 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>, "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE
 LIMITED at Cisco)" <hthakar@cisco.com>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 1/3] lrzsz: fix CVE-2026-105841
Thread-Topic: [OE-core][wrynose][PATCH 1/3] lrzsz: fix CVE-2026-105841
Thread-Index: AQHdXR+41fmoMbDTjkK8H8b17cspGrcE7JcAgAQVWueAF/veHg==
Date: Fri, 6 Nov 2026 10:57:26 +0000
Message-ID: <PH7PR11MB8598AB26F77C989C03B0069DAD762@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20261016033726.426908-1-hthakar@cisco.com>
 <DM8VHO5HY4L5.2OTI5CNBGV9OT@smile.fr>
 <18E0BFCE2E8E47C5.4046778@lists.openembedded.org>
In-Reply-To: <18E0BFCE2E8E47C5.4046778@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8598:EE_|DS6PR11MB721915:EE_
x-ms-office365-filtering-correlation-id: 35332e23-55fe-4ee3-69e3-08df3bf4becf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|10067099003|8096899003|13003099007|38070700021|4143699003|11063799006|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261022113327099003|261021121427099003|261022105027099003|261022075727099003|56012099006|261009223027099003;
x-microsoft-antispam-message-info: MP2+lNFxJNwGEL3YUXCFDbnFD9bnXO+niWwCON3yUKcHRNdLOE06z12OtFfx+sBQ0yW5V6BCkI0rPNLfxXbj3RikTxBzqsR+JH1oREJq3V0p3vXKNlf6hc3dxHz4Dj5rIqfQPY6CZClUY0xC62WNRIlnP1BULQW1fcLJE35Uo4GgAAoKFObRmseFAep88fwKwDlJuAdsFC2xCgMvlFvB9frHrGD70++vMivVSBz99AGlIcjB8iH53yO79WlI++pBrcoAcK6HkmuCLUB2a8hir1q3dmYXABSR4F3bo0vrf1564qSd/UmZlSECtCToukdFGC1DieZaMjnsLTzrUU0nNDNZRNzc9TOdp0j6Wie1neGTWNwhg8gqqJxoIexMaeHzqHjEA/pkMFrSgH2mdYJnxVsumYAQgtxPdEn1ZPJ+fhI7hN495VQgRqUbYANt8FV3W/D5fxQN2WLuDqsxDcOV3JyX5vkjVGbZdX/JZWwgC5r6pJcYqPoA52sQCbTIjP1RdLBByU0tDWmxIOYiwfkdZXNSbNEhsQ6UM2P34F7XLBpuSAKnj4UJ3CUu5rM33PwuSwoV3tJm/9R3YencFr7X6Bn30NV+aSZqrMJ9SqkWJNbieoBK2Qr5ueNQ8ArgPpjmpCj8r4fmPH9PWapeJTltsug9/qjs0MLhjvJTcgkfnlo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(8096899003)(13003099007)(38070700021)(4143699003)(11063799006)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261022113327099003)(261021121427099003)(261022105027099003)(261022075727099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GEm+urcfUvYtNIHB0Cdy9/Mvh3SbTKwcTpF0BMh3WGKVB/GRlF3XSlAATY?=
 =?iso-8859-1?Q?RwGvcv6CBSBFnFzEKT2HXpLGOw44eMTfBdNqBGl9A7aYvr9ctheGN+Ni0G?=
 =?iso-8859-1?Q?eduarkXS6dAQ63KXQbcn3/jpSegCKIAUn+AXGvqm0g83CL/IgzO5cHpQAT?=
 =?iso-8859-1?Q?IEYF2TVFecSwS6hcqn4kWWyijpOVWfHSgn+gPoIP0cvTIwcoyU4T2+gZ8D?=
 =?iso-8859-1?Q?xAEkpkyrm+PucrhL0iSR+nbg33Ook4InZvN+X8DnrdGGlsHJyNf6ZIGaqy?=
 =?iso-8859-1?Q?JjuDBsFlqjdDHCEyt7L/EZS+IOkkPta/88akMNiO0ReQsxGa1uFac1bGsK?=
 =?iso-8859-1?Q?DlRYaH9jUnaObByp3cCG2rG6uT/Php9Ij0O690wyLKGTcJX9pI48ytmRxw?=
 =?iso-8859-1?Q?+Uhpi2BZowP7xSJ/IAtfsXtFiY5yOqDkP22ECQT6dkFuJ+wH7J/LkdIgHI?=
 =?iso-8859-1?Q?KCD2jzXif1prCnEbtdlVn7h5mL5oUuBhx9jBuHxfuMH82yvdZXEQkunFz3?=
 =?iso-8859-1?Q?jJ3HB8udohswBxy0skuHPxvLD4v7oDwAZQ8BOTYEhoYCLoiM04+BfZeKQM?=
 =?iso-8859-1?Q?gz+yEvETF++g33JxAmeSkJj1iWGkvrqy0FGDeiRtygb3xWnjdE1EXp+i9Z?=
 =?iso-8859-1?Q?cx5e6doHToyHOJCneP0pI/1QFyob7k/d7stwQqFdvTnyvBiluHIH5EUqDe?=
 =?iso-8859-1?Q?vUrkfWxgNVythWEIGGPDZHyFb0Ho4iAwSukRIixu9g0sIefl2/mp42TlWG?=
 =?iso-8859-1?Q?wid7Mzd/fI4o2qtd5tkqPlmz7xbNKbnKdAFHfzdb6MCVXQkC7EpFQ09lBl?=
 =?iso-8859-1?Q?B1HMO8JlKW4yxOnPIwANUf1uP+yaacyKY8GF6okyT0ckjKZ/of6BjYXOOf?=
 =?iso-8859-1?Q?GXMago04xviWa27C/SRVcIQP2uKReHfcSp7qFB8VoB73yJ47fLleX+oGIz?=
 =?iso-8859-1?Q?zC8qIRBsBW/lQOMnQrgbTDQa6+AP47LwZCfg9Z6xjpEuj/n7waMfGnZ7pS?=
 =?iso-8859-1?Q?S3hn0G04T7M0TyQK0XzZIhWxLQDNDQiYU7OQktoWisQL9ZsZVYYa5kIds0?=
 =?iso-8859-1?Q?rhfSzP+U3gF3qnfJJc7mNqLBHxJ03QIQ3+7KVxOeV2Dmavg5lS4q6DiaPT?=
 =?iso-8859-1?Q?onDzChhKBiR/eDMWx6kESP669hpWCHzEz7cw00cQDJnU4WzuUCJRZO4dhL?=
 =?iso-8859-1?Q?EHUubMwY0FoD5xINH3bY9nEjpKaw1vtDzdhSETe7jJUSnv31zBVy8vuYw5?=
 =?iso-8859-1?Q?Iy/gb0apykAlHT9Pa2uqrozBQjg2JQYdpB1UBGMwcfE0tqb1zK2qXjmASu?=
 =?iso-8859-1?Q?lpWW3RNCRkXZOv3J2U9x7QCUulkdQDza0Tkix647Akv++Qf9e3lh73ymhE?=
 =?iso-8859-1?Q?7/JbBBZdtIOs1Jkjmr9BDEV38UAPyzCVIKjG1OnlPmAgo0mrrXFfzDpPkq?=
 =?iso-8859-1?Q?ljt592/CScaLBEZH5hkmbS/3GKnCeJ3MsNgRkQsNucCyTAEkk6tD3OccVu?=
 =?iso-8859-1?Q?V6Wi4UYeiWmTgVOepBeZiqA43NfyAlb9zqoa8ZHpB4CtXHG+Zq4jaXXf5n?=
 =?iso-8859-1?Q?LXegQ7R0cVaFd2KeLgNp8p0J6aGlF4rvYmrdF0vTC7QIZlNBFX3fXqVY+s?=
 =?iso-8859-1?Q?4ivgSuhUCUmY9hF+jHumq5vW8nOxquZm3aMbb7LQoiDTA+jtWF9O69TyoH?=
 =?iso-8859-1?Q?AFK0l4cxVqt2VlyntteZPQx9kUQC96K3U9QNabgEh4FDX5IfUlpJEzzbRU?=
 =?iso-8859-1?Q?MZotUUb1+K2efqUoNR0HbhlJfQCiqPx7nF623SdFv9/NTS?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB8598AB26F77C989C03B0069DAD762PH7PR11MB8598namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aBSyP/pJMErVcOMOnBFUh/u26eS87M8uG2BaC0wf6SHtb/41zYgkXGbCSGFH0vth76OVf0F1OS8grfWQQsJXvEo3HDzuZBEczAg4S5uGauwiE0tgTxlTk7CXwQa0oDhZrW9iWCBHCpZlpCHlK0r7h1oQKMjhOjM2hCYgDlW0UfP51GREfDVUYx7SqMEXJX6P5Aet7TkNuU0lx2FRPQrzS16sNnADy807A3WWqsImt0Jrc3EOVmMoJ0WpPltUUwHVOA22s7pBFW5WxJkpzVC/bjedYDiN80pTy1s+/2WzPt+npVGw5qGvRJbcG0cVBrnhGIMgeievCtNFhA1ebZtH9w==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35332e23-55fe-4ee3-69e3-08df3bf4becf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 10:57:26.8583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3j9pmYyi2DmyVwTtETEonYQACc0oz5NlXg2KcZKwUFA9/ge6ZSyqFA1kXLpDUDLVD4VgmU2bLaCy/Ux26Js2jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB721915
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-4.cisco.com [173.37.147.252];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 10:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249630

--_000_PH7PR11MB8598AB26F77C989C03B0069DAD762PH7PR11MB8598namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
I have submitted the patch series for blacksail [1], and the lrzsz upgrade =
has already been merged into master [2].
I have also submitted the updated v2 patch series for wrynose [3].
Could you please review the updated wrynose series when you have a chance?
[1] [blacksail,1/3] lrzsz: fix CVE-2026-105841 - Patchwork<https://patchwor=
k.yoctoproject.org/project/oe-core/patch/20261106092125.2587191-1-hthakar@c=
isco.com/>
[2] lrzsz: upgrade 0.12.20 -> 0.13.1 - openembedded-core - OpenEmbedded Cor=
e layer<https://git.openembedded.org/openembedded-core/commit/?id=3D50fe9dd=
a5f27aad82f5f7c904fb4bcc0d9cc46db>
[3] [wrynose,v2,1/3] lrzsz: fix CVE-2026-105841 - Patchwork<https://patchwo=
rk.yoctoproject.org/project/oe-core/patch/20261029103012.2335950-1-hthakar@=
cisco.com/>

Regards,
Hetvi

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE =
LIMITED at Cisco) via lists.openembedded.org <hthakar=3Dcisco.com@lists.ope=
nembedded.org>
Sent: Thursday, October 22, 2026 10:02
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; yoann.congal@smile.fr <yoann.congal@smile.fr>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 1/3] lrzsz: fix CVE-2026-105841

Hi Yoann,

Thanks for the review.

You are correct that the advisory [2] does not directly reference the
upstream commit [1]. I will correct the commit message to clarify
that the patch is backported from the upstream commit addressing
the vulnerability described in the advisory.

I will also check the status of all three CVE fixes in master and
blacksail and submit the required upgrades/backports for those
branches.

[1] https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359aec9=
6121215bd
[2] https://www.vulncheck.com/advisories/lrzsz-before-0.13.0-os-command-inj=
ection-via-lrz-pipe-mode

Regards,
Hetvi

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Monday, October 19, 2026 19:39
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@=
lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 1/3] lrzsz: fix CVE-2026-105841

Hello,

On Fri Oct 16, 2026 at 5:37 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359ae=
c96121215bd
> [2] https://www.vulncheck.com/advisories/lrzsz-before-0.13.0-os-command-i=
njection-via-lrz-pipe-mode

Where does [2] reference [1]?
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch | 267 ++++++++++++++++++
>  meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |   1 +
>  2 files changed, 268 insertions(+)
>  create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.=
patch
>
> diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch b=
/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch
> new file mode 100644
> index 00000000000..268218fb8a6
> --- /dev/null
> +++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch
> @@ -0,0 +1,267 @@
> +From 9eef71ce20fda2b345ef8431359aec96121215bd Mon Sep 17 00:00:00 2001
> +From: Uwe Ohse at akiar <uwe@ohse.de>
> +Date: Mon, 10 Aug 2026 17:55:28 +0200
> +Subject: [PATCH] remove topipe 'feature'
> +
> +CVE: CVE-2026-105841
> +Upstream-Status: Backport [https://github.com/UweOhse/lrzsz/commit/9eef7=
1ce20fda2b345ef8431359aec96121215bd]
> +
> +Backport Changes:
> +- Retained sys2() and exec2() and their declarations because 0.12.20
> +  still calls them in its separate, opt-in ZCOMMAND handling. Removing
> +  them as upstream does causes undefined references when linking lrz.
> +- Omitted NEWS because its 0.13.0 release-note hunk conflicts with the
> +  0.12.20 release history and is not needed for the security fix.
> +
> +(cherry picked from commit 9eef71ce20fda2b345ef8431359aec96121215bd)
> +Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

That upstream commit is not in master nor blacksail as far as I know.
Can you send the proper upgrades/backports?

NB: I suspect the same goes to the rest of the series, so I'll wait for
your ping before reviewing it.

Thanks!
--
Yoann Congal
Smile ECS


--_000_PH7PR11MB8598AB26F77C989C03B0069DAD762PH7PR11MB8598namp_
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
I have submitted the patch series for blacksail [1], and the lrzsz upgrade =
has already been merged into master [2].</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
I have also submitted the updated v2 patch series for wrynose [3].</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Could you please review the updated wrynose series when you have a chance?<=
/div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
[1] <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/202=
61106092125.2587191-1-hthakar@cisco.com/" id=3D"OWA56c86700-7335-6ef2-6a64-=
4b9ffa2869dc" class=3D"OWAAutoLink">
[blacksail,1/3] lrzsz: fix CVE-2026-105841 - Patchwork</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
[2] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D=
50fe9dda5f27aad82f5f7c904fb4bcc0d9cc46db" id=3D"OWAcb315e62-af70-79bd-ae85-=
0526b229b34d" class=3D"OWAAutoLink">
lrzsz: upgrade 0.12.20 -&gt; 0.13.1 - openembedded-core - OpenEmbedded Core=
 layer</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
[3] <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/202=
61029103012.2335950-1-hthakar@cisco.com/" id=3D"OWA40d25f38-88b6-8ea4-417c-=
beefa2533585" class=3D"OWAAutoLink">
[wrynose,v2,1/3] lrzsz: fix CVE-2026-105841 - Patchwork</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
Hetvi</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Hetvi Thakar -X (hthakar - E INFOC=
HIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org &lt;hthakar=3Dcis=
co.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, October 22, 2026 10:02<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; yoann.congal@smile.fr &lt;yoann.congal@smile.fr&=
gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 1/3] lrzsz: fix CVE-2026-10584=
1 </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Hi Yoann,</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Thanks for the review.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
You are correct that the advisory [2] does not directly reference the</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
upstream commit [1]. I will correct the commit message to clarify</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
that the patch is backported from the upstream commit addressing</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
the vulnerability described in the advisory.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
I will also check the status of all three CVE fixes in master and</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
blacksail and submit the required upgrades/backports for those</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
branches.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
[1] https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359aec9=
6121215bd</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
[2] https://www.vulncheck.com/advisories/lrzsz-before-0.13.0-os-command-inj=
ection-via-lrz-pipe-mode</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Regards,</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Hetvi</div>
<div style=3D"direction: ltr; font-family: Calibri, Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div style=3D"direction: ltr; font-family: Calibri, Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembedde=
d.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, October 19, 2026 19:39<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;op=
enembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 1/3] lrzsz: fix CVE-2026-10584=
1</div>
<div style=3D"direction: ltr; font-family: Calibri, Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">Hello,<br>
<br>
On Fri Oct 16, 2026 at 5:37 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<br>
&gt; From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix as referenced in [2],<br>
&gt; using the commit shown in [1].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b=
345ef8431359aec96121215bd" id=3D"OWA523ad76d-7e7c-cce3-83b3-451ad3df9922" c=
lass=3D"x_OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359aec96121=
215bd</a><br>
&gt; [2] <a href=3D"https://www.vulncheck.com/advisories/lrzsz-before-0.13.=
0-os-command-injection-via-lrz-pipe-mode" id=3D"OWAdc4f21ed-8505-df36-13c9-=
bd0f445e2ae0" class=3D"x_OWAAutoLink" data-auth=3D"NotApplicable">
https://www.vulncheck.com/advisories/lrzsz-before-0.13.0-os-command-injecti=
on-via-lrz-pipe-mode</a><br>
<br>
Where does [2] reference [1]?<br>
&gt;<br>
&gt; Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch | 267 ++++++++++++=
++++++<br>
&gt;&nbsp; meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 268 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026=
-105841.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patc=
h b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..268218fb8a6<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch<br>
&gt; @@ -0,0 +1,267 @@<br>
&gt; +From 9eef71ce20fda2b345ef8431359aec96121215bd Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Uwe Ohse at akiar &lt;uwe@ohse.de&gt;<br>
&gt; +Date: Mon, 10 Aug 2026 17:55:28 +0200<br>
&gt; +Subject: [PATCH] remove topipe 'feature'<br>
&gt; +<br>
&gt; +CVE: CVE-2026-105841<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/UweOhse/lrzs=
z/commit/9eef71ce20fda2b345ef8431359aec96121215bd" id=3D"OWA263239ae-bf81-9=
c20-5a36-a41733f94f3b" class=3D"x_OWAAutoLink" data-auth=3D"NotApplicable">=
https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359aec96121=
215bd</a>]<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- Retained sys2() and exec2() and their declarations because 0.12.20<=
br>
&gt; +&nbsp; still calls them in its separate, opt-in ZCOMMAND handling. Re=
moving<br>
&gt; +&nbsp; them as upstream does causes undefined references when linking=
 lrz.<br>
&gt; +- Omitted NEWS because its 0.13.0 release-note hunk conflicts with th=
e<br>
&gt; +&nbsp; 0.12.20 release history and is not needed for the security fix=
.<br>
&gt; +<br>
&gt; +(cherry picked from commit 9eef71ce20fda2b345ef8431359aec96121215bd)<=
br>
&gt; +Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
<br>
That upstream commit is not in master nor blacksail as far as I know.<br>
Can you send the proper upgrades/backports?<br>
<br>
NB: I suspect the same goes to the rest of the series, so I'll wait for<br>
your ping before reviewing it.<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH7PR11MB8598AB26F77C989C03B0069DAD762PH7PR11MB8598namp_--
