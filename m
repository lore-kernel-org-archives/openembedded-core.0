Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3523.1793962860220544273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 03:01:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Y7awyZit;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6512; q=dns/txt;
  s=iport01; t=1793962860; x=1795172460;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=z+E3A0FhJ46Juxk4W3gzoRv09zBoJCr8Nawp+qhEAB0=;
  b=Y7awyZitlEeqGdDCiWSDQ7QJGtUdSkBMctM0XhghXBu3zRLemPgl9uld
   f1cfDcVIp6Ys0r6B8gzmA5c8Pc6isL/3R095cTRvGWmhX+vmokEtdQabo
   UqbGvMQl6MW05nSoH0uKAa98DA5/7CPY9EwnCLdn4W2qfYTXLsH4heN0r
   TMBVzeE/vk/moTRJsdxAd2N1TsrDumKcSoB7lKPSSD5pQ7w/7niy1JF4E
   lmiwcjeJN400ULKlIrCxI84JfiRdGKcVaJesJ8NSj37FEOXIdwZ//XiHD
   7W+iAGnBkvroTZDPJJ/ENo4rHcJr0LnV2cBGzMDOXbJhYgyU/EAqv+JuK
   g==;
X-CSE-ConnectionGUID: oaLklTdKRTmiTT+Qb3r/dg==
X-CSE-MsgGUID: au3Yj4o3TByF4okIM/zY4Q==
X-IPAS-Result: =?us-ascii?q?A0DYAwCTsu1q/5D/Ja1agS6BK4E9ATBTgQkCgRESSQMBi?=
 =?us-ascii?q?B8DhSuIegOeIYF+DwEBAQ0CLgEVDQQBAYUFAo4dAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQEBAQMBERUkAS0QAgEIEQQBA?=
 =?us-ascii?q?QEuJwodCAIEAQ0FCBqCYYIdFkEDAQIOsRJzAoodeIEBM4EBgykBPwJD3A8Vg?=
 =?us-ascii?q?TiFQoMEGwEBBSZJbIJdgSMYAYR9JxsbgXKBV4JpPoEFgVwCA4E0KzyDWIIwB?=
 =?us-ascii?q?IIiehIbgkIJjAwBAYFRhnlSciIDJjMsAVUTFwsHBYElEDMDKi8tI0sFLR1wD?=
 =?us-ascii?q?CcSDx0XER5YGwYFEiAqQUNbgRKBB12BKyhdAQIfRi0VgXYCglGBI10CAUlBD?=
 =?us-ascii?q?gdFUwklPgUSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFGkcIAgsCDHQoERATH?=
 =?us-ascii?q?R4kLwUcJj4bCi9tPTcGDxkDBIE1BZFRB1uDEoEPK0+BRBkGk0cujxOjeQoog?=
 =?us-ascii?q?3iKfoEmjT6IMheEBIFXiz2ZWQuYfSONZ5VhhS4CBAIEBQIQAQEGgWg8gVlwF?=
 =?us-ascii?q?YJuAQEyCQpAGQ+SJIUTxjZ5AgEIAy8BAQcCBw4DC4FokACBfgEB?=
IronPort-PHdr: A9a23:YcATBB1HK+eQoIxRsmDPmlBlVkEcU/3cJAUZ7N8gk71RN/3l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:62ybRKulwhJPruQxoqpcKNJen+fnVA5fMUV32f8akzHdYApBsoF/q
 tZmKTzXPP+KM2D0fNFyPY/g/BwGupHVnIBkTQVsrCE3Fn5BgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw/e9TAmVy+
 d8iFDUMUizAvujt2vW3Rbw57igjBJGD0II3oHpsy3TdSP0hW52GG/qM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtLYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9J4DXHp4FxhvGz
 o7A123kWSAYaNvE9RCU3C6rhc7q2jHKBLtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmEHY909v8hwTjsvv
 rOUo+7U6fVUmOT9YVqW96yfqnW5Pi19EIPITXZsodctizU7nLwOsw==
IronPort-HdrOrdr: A9a23:2GLz86xvHvQcmgb9HkirKrPxLOgkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ5+xoWJPtfZvdnaQFh7X5To3SLTUO2VHYY72KgrGSuQEIdxeOktK1kJ
 0QDJSWa+eAQ2SS7/yKnTVQeuxIqLLogcLY4Ns2jU0dMT2CAJsQljuRfzzraXGeMzM2fabReq
 DsgfZvln6LQ1hSRMK9AXUOQujEoPP2tL+OW3Q7Li9iwjOjyRez5pDHMzXw5HojegIK7aYp8G
 DDnQC83aO+rvG9xCbb0m/Y/75WlNHixtYrPr3MtiESEFrRozftQL4kd6yJvTgzru3qwk0tis
 PwrxApONk2w2/Nf0muyCGdmDXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cghtdhy6
 hGtljp9aa/TCmw2RgV1eK4EC2CpXDE50bKVtRj1kC3ZLFuLIO5a7ZvpH+9Xq1wRx4So7pXYN
 WGRPusl8q+N2nqL0zxjy1I3MGmWGg1E1OtR0gPvdHQ7h1t9UoJlXfxAKck7ys9HFVXcegY2w
 zJX54Y5o1mX4sYa7lwC/wGRtbyAmvRQQjUOGbXOlj/ErobUki94aIfzY9FrN1CQqZ4h6caid
 DEShdVpGQyc0XhBYmH24BK6AnERCG4US72ws9T6pBlsvmkLYCbfRGrWRQriY+tsv8fCsrUV7
 K6P49XGebqKS/rFZxS1wPzVpFOIT0VUdETuNw8R1WSy/i7Z7HCp6jearLeNbDtGTErVif2BW
 YCRiH6IIFa4kWiShbD8VHssrPWCzrCFL5LYd/nFrIouf0w36V3w3wotWg=
X-Talos-CUID: =?us-ascii?q?9a23=3A+L61TGqjcCpacz/903BddZrmUccsVn7Z8HvzGXO?=
 =?us-ascii?q?9CFpVC4SfEkXX9Kwxxg=3D=3D?=
X-Talos-MUID: 9a23:jnDJRwRKzkcCS4SaRXTlmWpTNptvuJiEGW5RlpYnno6WBHBJbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 11:00:59 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 27D59180003DA
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 11:00:59 +0000 (GMT)
X-CSE-ConnectionGUID: vo8HrpYMTPiDdAEddWAIKw==
X-CSE-MsgGUID: OrhEN4DwQGme6LKSXJ/0MQ==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208,217";a="74442957"
Received: from mail-northcentralusazon11013035.outbound.protection.outlook.com (HELO CH4PR04CU002.outbound.protection.outlook.com) ([40.107.201.35])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 11:00:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNYfMNPAn77HZESDpKoVMNzHJZG6guQPr1byMpDy0XvQdTP5DbITddtQ+zFfxC0fftNAlj+zx2PQj0jCkgrzLtLtL8UnxFHvDmbShJsC+TMZ0di0Z4/3iO+0WcZTGUTny3jWTh8VvtzPPE7j0EC3aDzJCSDM+y4MgNMGAgaJHGBzu/Xj0nI2C9bFAh6IX0IwJAhshS2kEo9hloSQWMb7EYgI9rbePSmTsG7VV54aD56Edo6R2Nsw+0Xj38ONGb5hs611Xzv/bLyhsk8yM4w4f2ibBZW1VzIRm6mML0Uzvapa6JvqGexMXvsv6Tj0a9i65zaBler9KykcuCdyRCJpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+E3A0FhJ46Juxk4W3gzoRv09zBoJCr8Nawp+qhEAB0=;
 b=aZxgBahI5AMJ6NJSKXAUMrUmrCZy67PIns6soPfhpE4A7jAm77H1jeiJs8brl1ABM2LJqf+gd2D195aFlO8v5ShkUOzvZLUQAlgXUimMnuOfjbAGu+jEiJmE09xgYHbGBuftSIeEWXiygnFN+GjwYlIr7YdwiQjxjAbTGwQDtauTclc89i2QxlnfsAR6UvRZFpIsoSCty8ZBfEqDCInHqUeZJDp6M/JDPO+GhCpXvROXLoSKybDQlwsnfMEboUdFovT8ubGDgfrHw5OXIaQ54w+QlfE7IQM3GLyIXzAh4z+j2QtgJwEPqUK4qWB1mrS8Vl1WfRgkFq/6oxD4tlMwug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 by DM4PR11MB6238.namprd11.prod.outlook.com (2603:10b6:8:a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 11:00:55 +0000
Received: from PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f]) by PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 11:00:55 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-106584
Thread-Topic: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-106584
Thread-Index: AQHdXSHLjg7gDsBQhU+IrpXDsy9xObcFOYMAgBvH+6M=
Date: Fri, 6 Nov 2026 11:00:55 +0000
Message-ID: <PH7PR11MB8598B4AAA920FDDFE1174602AD762@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20261016035236.442896-1-hthakar@cisco.com>
 <20261016035236.442896-2-hthakar@cisco.com>
 <DM91CIFZHG6C.1EYHKXIN5ULNT@smile.fr>
In-Reply-To: <DM91CIFZHG6C.1EYHKXIN5ULNT@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8598:EE_|DM4PR11MB6238:EE_
x-ms-office365-filtering-correlation-id: 02c85002-da90-40b9-7c62-08df3bf53b16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|261022105027099003|261021121427099003|260925022911599003|260925021911599003|260925021311599003|11063799006|10067099003|261022075727099003|261022113327099003|56012099006|261009223027099003|261026121527099003|261028144727099003|261102123227099003|261026140227099003|4143699003|22082099003|18002099003|13003099007|8096899003;
x-microsoft-antispam-message-info: g/U6R+dTnSj4Qd6Bl/HZYTeEKZ6bHkfeDAgZLZKg/6WD5B/xk8ckC1gLeZUXNHMs4NdGM3vVzW2CrSD+CpRe0ziuK5i/lzRmQenbbTQiwbHz1VGvH7TXuBKwA5tFprDXFjj8+KffxqSok2hK/BiVVLfsOlsti9jtwJLqY5yf2tJ275l8n7kfwlIqM+TyyKpkqoZ4L7ovmFKyHzlkSILgot0/MOblnPgDRbgrkqRvS+lM0Md4hJxdtXaegI7kaJfCRYmtK86cvlQE7iRWk1QmcTdHLfc8FIiMnT99cGb/IoD9OwV56up0Qf42R/cKzVnCI2mJ2V+G6Y/jzotQMXlb95Rxrh99tpg1i/Cys3cVnGwPuuvrqs7Y0igGeJNHLPpXyRwc7h3BbiXoKs4JglESXuyFOVcSI3FfnOtb0awdH4WsyGytO7q8wAXbnaAJQDVk3SnKLH/rOgdHmAGt98rnXMiVY6KG65lfA0kCEOPb2HinznUh9mN1g4qeR1IdegzXZe7NvlTptu4H+5T/iL0NH44qHGXdB8ib9MfKIfTcRUXpPdBOPmMdyAe2HWE3+/qsMLsdxbI8UQUMgJVYGVPCpFLahAQrM1bDMypsjyzGjjNUiFuXKoL0XUCF0Iiq0CX1LCAMsLLE2ZB/5HiuMESgvT/aZbAVq6LOpO3ezQjs5RY4lZZHvn5J0kOQb4/t4sFZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(261022105027099003)(261021121427099003)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(10067099003)(261022075727099003)(261022113327099003)(56012099006)(261009223027099003)(261026121527099003)(261028144727099003)(261102123227099003)(261026140227099003)(4143699003)(22082099003)(18002099003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xioQtAL1//bXZXLqFyuH7fJSN12SHIjDxqQ8Y8ll/e9AnVNmd3sGddzBRxWJ?=
 =?us-ascii?Q?tSoFhSby0tGFqlTzTIJTvblO8HpbF3OfYGEHwe118sQTexNzHiIELJ3j3QpQ?=
 =?us-ascii?Q?zj43r2cc7AqWKS4IfhU43s+E38uC4Pk04hoeZsEo+LtVAK97zm6FZmHJuv/2?=
 =?us-ascii?Q?oMmX2m0tpXnevXnaO5GlmLHUWtZsBXGacDjcS4AMBPi76F5huqH0IIgUk4Wa?=
 =?us-ascii?Q?is6PY4i9H3yZh4toXww8suiZZqQbhTVzhCQZsHkGna2agGaS8n7g7Bu09ric?=
 =?us-ascii?Q?R6yHsKrZjic8C/lcIDl6xwbnL8LCF3ZY99e+gsbHqozvy1DrC0wh8GyelGCU?=
 =?us-ascii?Q?uLeprTqd2E3k7kUn/8oWp/Q2Jb793fwvy8eGv80Hf3YAjloIkVv1HnJqXgqj?=
 =?us-ascii?Q?7pqMZ6Pepc6XQ4xgn43l2tumAcyOdeK3XWvivuz5fQCwqSjfoLKccvNUrFRy?=
 =?us-ascii?Q?LjIKjcMDi+F2cCi4a+pMXfkomcSXdWNYCCcMgCnbTeT9tU/xjpkLQrE6+yYt?=
 =?us-ascii?Q?av41pN//CtUl08AL05pnd4ymLvCDMGMvQP34wA/NIcxZ6kKh6dj01NNRwU8F?=
 =?us-ascii?Q?n3Ru6vRkmWbqrCAx5OkoJY6IAOt0LkebU25QJxV/fIEoYl460oXYOVqu+8Ui?=
 =?us-ascii?Q?o/KS3wOPJWjy/PAqAd7eUS0uWZ0fgaSJIEsj/5ZEnJ/qeTmRxhZDDn5jsobA?=
 =?us-ascii?Q?OQUP5zuhhduUpZUeVdcqVLaR6YzVDHBijyEL7f1NvWqwtZtPWq4f3FEKEBzt?=
 =?us-ascii?Q?mC6tENNR0iZkSbU+iHXyPHOuvPDbBWJhOoSkFhlqPTBqH8oWwpCmxsV9pqg6?=
 =?us-ascii?Q?CZ8JmtUngCQZUo9FKgAk/HzhRzmm5y03CPY1vxD4wBzIw4jRDtYDSs45/EZn?=
 =?us-ascii?Q?Sxux1QLSYtj7TdsWFpMYySb68QG/w4R8984X8WLXMhVsZFpEyp8yPufo930C?=
 =?us-ascii?Q?QEwn9wCUJcQrxtQ6lIEbj7Ns2RwQvnbbqStmgbJM2xEufXvoeuu2nCY5hAmP?=
 =?us-ascii?Q?MMNpI+tzPSALmUDFg17URJ1eu9eGHCkXnP6D0AgwyI92t0Hbw9rvXRcOiCZa?=
 =?us-ascii?Q?zulKRpLpG2gBxzfDULCYSonpmuv05Z7ciDtezDiEmXW+CRTObC6LpiDwM+LF?=
 =?us-ascii?Q?qXZ0W2OTyZAJFRUzPOALvjFrx3S+hm/zku9rjpLzs8JmWVomw+Z4u0OpYJOW?=
 =?us-ascii?Q?pyZSXpvy+3eC5HDaWQ6CRmRcs3lwxG3CLdXpWfLUZMTXIT7rs7xxDX4bYuh1?=
 =?us-ascii?Q?UX9HdsBv5hBwenLeza4VketeqzXrnmujZm4LFhattn/xJfQj7Lqz9+QKKB0A?=
 =?us-ascii?Q?pvpWd3zgJtGbQN3d5hVVYMVHX2XJ01TV5TrS9pfaLd1OM8FrjgoTgAc7KZ7I?=
 =?us-ascii?Q?+jF4R+r6GXOEOJAPilVoccAIkDqvaYguuWnlvFIp4oWw8G85tmAuYcHxEHn3?=
 =?us-ascii?Q?gi/4Wn4MW8nTCo3H1zHpwLrLqa7aAmwPOda5YXRRIg0LW06vdVE0NI9RRhtX?=
 =?us-ascii?Q?JbE/GQHlkiSOUQmeHSEUZQDjliTkeAtYxB9TQImJFrtvU7HpmyPBaa2PuYWg?=
 =?us-ascii?Q?j+6HlyiOZPOF75SjjPPS0w/rOQQQCvH7ksmISLAStckOdSN94/vRsgzSAOeF?=
 =?us-ascii?Q?wUM7of5L5sy9e2fD6kzDAlGF3NHcCA+L5ne7kEmIMX3IcnTnBpHFpcZmiB6a?=
 =?us-ascii?Q?SdEYVO1UHyUv4WRcmjd9O/VYfiV7UkBfnJ8hzbzUFSpz+dqo?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB8598B4AAA920FDDFE1174602AD762PH7PR11MB8598namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: yDhY+OnBOuFZFJv7tK8CtzZjUbDUhcgxMH9ApFAG3FR8icfzBW/nkOdJHTc+Cr3uamG7oim07/yQCfVw2TsPUhCoJPGFuE4EGXDHWKZkmLM38ryltikwucE2eqieXtX7JCshD2XXq6S0pGvKiuXmbGiGPJKf8bvIh4EFHBzynoJnxmIcx//5FjG3PwfVTlPSuA+uqO5o+lo9tjUkA3c0vflwG5cn9e3DAimNF3dKMpu4TjxTC0MSoepTrtzstctWkatnvG7J+esYjLUR0zj81uMeEI9ypGa2dH8knBkCE1HaW0+CWHwJV+shDQzSlTEvPVgr609BYmzHJPZ7vOhuwA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c85002-da90-40b9-7c62-08df3bf53b16
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 11:00:55.3701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCksWTZjX7fYJEUjNTwywX3dbW9QOqx4L184ktjXrXHz1QN8VN8eE8yqI93XAfbm7772z7UdhDMCRTbM3jGIdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6238
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-1.cisco.com [72.163.7.162];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 11:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249631

--_000_PH7PR11MB8598B4AAA920FDDFE1174602AD762PH7PR11MB8598namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
I have submitted the corresponding OpenSSH backport patches for blacksail u=
pstream [1] .
Could you please review  the wrynose series when you have a chance?
[1] [blacksail] openssh: Upgrade 10.5p1 -> 10.6p1 - Patchwork<https://patch=
work.yoctoproject.org/project/oe-core/patch/20261105042209.1168511-1-hthaka=
r@cisco.com/>
Regards,
Hetvi

________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 20 October 2026 00:14
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@=
lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-106584

On Fri Oct 16, 2026 at 5:52 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2], using the
> commit shown in [1].
>
> [1] https://github.com/openssh/openssh-portable/commit/aef20dfe30e68a4699=
11a229b9117e7134766311
> [2] https://ubuntu.com/security/CVE-2026-106584
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../openssh/openssh/CVE-2026-106584.patch     | 39 +++++++++++++++++++
>  .../openssh/openssh_10.3p1.bb                 |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-10=
6584.patch

Hello,

This patch (and a few others in the series) are included in openssh 10.6
but blacksail only has 10.5. Can you send the backports for blacksail so
I can merge this series for wrynose?

Thanks!
--
Yoann Congal
Smile ECS


--_000_PH7PR11MB8598B4AAA920FDDFE1174602AD762PH7PR11MB8598namp_
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
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
I have submitted the corresponding OpenSSH backport patches for blacksail u=
pstream [1] .</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Could you please review&nbsp; the wrynose series when you have a chance?</d=
iv>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
[1] <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/202=
61105042209.1168511-1-hthakar@cisco.com/" id=3D"OWAc6a6ec96-4947-cdeb-840b-=
5c8431cad7ee" class=3D"OWAAutoLink">
[blacksail] openssh: Upgrade 10.5p1 -&gt; 10.6p1 - Patchwork</a></div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Hetvi</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> 20 October 2026 00:14<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;op=
enembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-1=
06584</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri Oct 16, 2026 at 5:52 AM CEST, Hetvi Thakar =
-X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.=
org wrote:<br>
&gt; From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix as referenced in [2], using the<br=
>
&gt; commit shown in [1].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/openssh/openssh-portable/commit/aef2=
0dfe30e68a469911a229b9117e7134766311">
https://github.com/openssh/openssh-portable/commit/aef20dfe30e68a469911a229=
b9117e7134766311</a><br>
&gt; [2] <a href=3D"https://ubuntu.com/security/CVE-2026-106584">https://ub=
untu.com/security/CVE-2026-106584</a><br>
&gt;<br>
&gt; Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../openssh/openssh/CVE-2026-106584.patch&nbsp;&nbsp;&nbsp;&nbsp=
; | 39 +++++++++++++++++++<br>
&gt;&nbsp; .../openssh/openssh_10.3p1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<b=
r>
&gt;&nbsp; 2 files changed, 40 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE=
-2026-106584.patch<br>
<br>
Hello,<br>
<br>
This patch (and a few others in the series) are included in openssh 10.6<br=
>
but blacksail only has 10.5. Can you send the backports for blacksail so<br=
>
I can merge this series for wrynose?<br>
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH7PR11MB8598B4AAA920FDDFE1174602AD762PH7PR11MB8598namp_--
