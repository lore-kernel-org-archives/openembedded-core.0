Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFEAC433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 17:17:47 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web12.296.1652807865340494037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 10:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=cLnO8fBr;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=305; q=dns/txt; s=iport;
  t=1652807865; x=1654017465;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=+awCSl6hiBf1lR4rRjIyZH82urvPMhdOChyrFaYVZfw=;
  b=cLnO8fBrcaBYyQtPnDyHtJsly1S7JSvVD5VMXzJjXZXKZ34TBUOZBnj5
   YTll2sEuIypToUTDPAEkh4coKclfk3JsKhH7sgulyIoKJzArwf5YOvpbV
   Zy+4bnwV80itxKO+dJhT2ym7m2mpf2AlrxWmz5veiGpkVhGYdqw4VdexT
   w=;
X-IPAS-Result: =?us-ascii?q?A0DyAAA+2INimIMNJK1agQmBT4FSUnwCWDlDiBoDhTGFC?=
 =?us-ascii?q?Z49gSyBJQNUCwEBAQ0BATMPBAEBhQIChT8CJTQJDgECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEDAQEFAQEBAgEHBBQBAQEBAQEBAQkUBwYMBQ4QJ4VoDYZbLgEBOBEBgQAnB?=
 =?us-ascii?q?BsaglsBgmMDMQGgUQGBPgKKH3iBM4EBgggBAQYEBIUNGII4CYE8gxSLTCccg?=
 =?us-ascii?q?g2BWIdrhAuCLpV6OwNUgQUSgSFxAQgGBgcKBTIGAgwYFAQCExJTHgITDAocD?=
 =?us-ascii?q?lQZDA8DEgMRAQcCCxIIFSwIAwIDCAMCAy4CAxgJBwoDHQgKHBIQFAIEEx8LC?=
 =?us-ascii?q?AMaHy0JAgQOA0MICwoDEQQDExgLFggQBAYDCS8NKAsDFA8BBgMGAgUFAQMgA?=
 =?us-ascii?q?xQDBScHAyEHCyYNDQQjHQMDBSYDAgIbBwICAwIGFwYCAnEKKA0IBAgEHB4lE?=
 =?us-ascii?q?wUCBzEFBC8CHgQFBhEJAhYCBgQFAgQEFgICEggCCCcbBxY2GQEFXQYLCSMcL?=
 =?us-ascii?q?BEFBhYDJmgFBJYnqBOfEAolgyeLGpUMFYNjAaR1lmaiAYR/AgQCBAUCDgEBB?=
 =?us-ascii?q?oFhZ4EucBWDIwlIGQ+OOYNZhWWEeXU7AgYLAQEDCY8PAQE?=
IronPort-PHdr: A9a23:nkvxbxBNFcn+VckOpFjzUyQVaBdPi9zP1kY95pkmjudIdaKut9TnM
 VfE7PpgxFnOQc3A6v1ChuaX1sKoWWEJ7Zub9nxXdptKWkwJjMwMlFkmB8iIQUTwMP/taXk8G
 8JPHF9o9n22Kw5bAsH7MlbTuXa1qzUVH0aXCA==
IronPort-Data: A9a23:ur9Cj6N6jfDZtVzvrR28l8FynXyQoLVcMsEvi/4bfWQNrUor0jYPx
 2JJUT+HaK6LMDOmco10btmx9x9Tu56BzIVnTnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCcaphyFBcwnz/1WlTbhSEUOZqgG/ytUYYoBggrHVU+EHp41ko58wIEqtcAbeaRUlvlV
 eza+6UzCHf9s9KjGjtJg04rgEoHUMXa4Fv0jHRnDRx4lAO2e00uMX4qDfrZw00U7WVjNrXSq
 +7rlNlV945ClvsnIovNfr3TKiXmTlNOVOSDoiI+ZkSsvvRNjn1jyYVqKNU+U2lWgCqXkvta4
 fAU5JPlHG/FPoWU8AgcexBcFyc7Nqpc9fqeZ3O+qseUiUbBdhMAwd03UxpwZtNeo70xWDoXn
 RAbAGhlghSrgOW8wa68VvJEjcU4J86tN4Qa0p1l5WGGVqt5EMqZH80m4/dAjBIqlMN/J8+DZ
 uAFNjVTdhbJTERAbwJ/5JUWxbf02SaXnydjgFWNqKw65mLewAB83P3mN8DYUtiLXtlO2EGAq
 2TL+m70Dh0XOJqY0zXtz563rubLmSW+U4UIGfjhsPVrm1aUgGcUDXX6SGdXv9Ho21WdCs5wC
 XY6+yExs6UZ32WOF4jyCkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOoTiZmMbADDBnJJrLQHGx
 mNljPuyXmU27+P9pWa1s+bK82zjYED5OEdYPUc5oR05D84PSW3ZpjvLSttleEJepoKoQWirq
 9xmQdRXuln+pccP06P+9lfdjnf14JPIVQUyoA7QWwpJDz+Vhqb4OeRECnCCsJ6sybp1qHHb7
 RDofODFt4gz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmwkex00Yp1cImSxC
 KM2he+3zMINVJdNRfIoC79d9+xxpUQdPY2/D6uNPoYmjmZZLVLYoEmCmnJ8L0i0wBRzzsnTy
 L+QcN2nCj4BGL97wT+tL9rxIpd1rh3SMVj7HMihpzz+iOL2TCfMFd8tbQvfBshkvfjsiFiEr
 L53aZDQoz0BC7KWX8Ui2dNJRbz8BSJlVcmeRg0+XrPrHzeK70l7UK+MneJ4ItE690mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:2U9xqq21TzrXo2ZsyBVwlwqjBe5xeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ4uxoS5PwO080kqQFrLX5XI3SFjUO3VHIEGgM1/qa/9SNIVydygc/79
 YtT0EdMqyJMbESt6+Ti2PUc6dC/DDtytHNuQ6q9QYKcegcUdAG0+4WMHf/LmRGAC19QbYpHp
 uV4cRK4xC6f24MU8i9Dn4ZG8DeutzijvvdEFE7Li9izDPLoSKj6bb8HRTd9AwZSSlzzbAr9n
 WAuxDl55+kr+qwxnbnpiHuBtVt6ZrcI+l4dY+xY/suW3fRY8GTFcFcsoi5zXAISSeUmRIXeZ
 f30lAd1o9Img7slymO0GfQMk/boXATA7uI8y7BvZMlyvaJHQ7SQvAx+75xaAfW5UY7od1w5q
 pXwmqStp5aCg73hijm/djPUCdrmyOP0AUfuP9WgHpFXYQEbrhN6YQZ4UNOCZ8FWDn38YY9DY
 BVfYjhDdttACSnhkrizx9SKR2XLwYONwbDRlJHtt2e0jBQknw8x0wExNYHlnNF8J4mUZFL6+
 nNL6wtzdh1P4QrRLM4AP1ETdq8C2TLTx6JOGWOIU7/HKVCP37WsZb47Lg8+envcp0Vy5k5no
 jHTTpjxCYPUlOrDdfL0IxA8xjLTmn4VTPxyttG75w8obH4TKqDC1z2dLnvqbrUnxwyOLyqZx
 /oAuMmPxbKFxqcJbp0
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.91,233,1647302400";
   d="scan'208";a="873579224"
Received: from alln-core-1.cisco.com ([173.36.13.131])
  by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 17 May 2022 17:17:44 +0000
Received: from mail.cisco.com (xfe-aln-001.cisco.com [173.37.135.121])
	by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 24HHHirT031263
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 17:17:44 GMT
Received: from xfe-rtp-004.cisco.com (64.101.210.234) by xfe-aln-001.cisco.com
 (173.37.135.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 17 May
 2022 12:17:43 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (64.101.32.56) by
 xfe-rtp-004.cisco.com (64.101.210.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14
 via Frontend Transport; Tue, 17 May 2022 13:17:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oq5oPudOvpD8lbAzEpBWUKRF/jBqGQlDqVUA5uPQaMgVMEBxQ++nkLf8rjgTzs+dpWf/15lE6bEqB53e3q+kGKTDWmqRp2cB6rIp92SA+BJXN0x/1Eugsb5NM/8xpnW3uIFz1I+HXl1t0kj63XxX4gC31gp9/F2pN38GVWLejDkodZMEMPLCduQ22WElG6RatiyR/hL5NuIM6Q5iVCubTwhlB06kqTevFFia0Ym/err5KuYR02a2BNU5dCqu9j8KYXOEccGiy9GQCJSBrsBGVu2WWQgXuRVZheK/JTE7jpWcR90G5KDjffotfzM5NCyU1Tzxv4jIKg7Xo4cXwM96rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+awCSl6hiBf1lR4rRjIyZH82urvPMhdOChyrFaYVZfw=;
 b=cz6nCPWv7EwSdOaKUhcQnlWTP3pHhemM/GebqQAQONdGKRKnQuPcItIx/WWa9oPlL7mQqw4G2OvsWhoFjE2zWyGImpBJAxLYvfcIdJGVxUpu7OZGq5xizlsM0GGdhtDnZ4Q3Hk9ZMHsUDj3V2jKRV/gS05GIGbB8d477jJqi43rquhmf1xeBX/EZT0Ti9ffN/rOjP2ev9mJ6pF0HHVKhW5BSurrAZ7V+AiSFniOPrMX0KPxxrJwLAr0hZmE8SxtAAX2aGLrK3CGxMHHcy6CENuYbyLOGITVqWH3S9dlahjUWt1c5r76crm/0QuJtvZO6f6q9j+EZz9QJHwqalf9xUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+awCSl6hiBf1lR4rRjIyZH82urvPMhdOChyrFaYVZfw=;
 b=SSwW2Q60TdBTljyNk1TSzBgbMAzVubQ35KeiJWbsrp3CsZOi5GyUfdwejU+MsJ9ps5nmjPkQIDJM1a2iJEdoQg6vNHscyqwOaYdjYnb42ojozxBWt0nBTvd8Ywl1QIKz2Ahr8xrjcjqIrwup/WC7QgLAWxP5OGWuCo+9YGhH2kE=
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 17:17:42 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::4911:1c25:c2c9:86bd]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::4911:1c25:c2c9:86bd%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 17:17:41 +0000
From: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)"
	<oobitots@cisco.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: convert-overrides.py
Thread-Topic: convert-overrides.py
Thread-Index: AQHYahGKR6WFFtmET02GmJlCxKWwNQ==
Date: Tue, 17 May 2022 17:17:41 +0000
Message-ID: 
 <PH0PR11MB4902975CA8B2354DCB0E837ED7CE9@PH0PR11MB4902.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: e4a8639d-4a4f-3ebc-0842-d516e9d4c2ba
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09a0830a-dc8b-4c2f-fefc-08da38292678
x-ms-traffictypediagnostic: SA1PR11MB5946:EE_
x-microsoft-antispam-prvs: 
 <SA1PR11MB5946B3360CC05A50CA470DD6D7CE9@SA1PR11MB5946.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LhkPgkdH6IxT868jTGjvSlh8xHJs3+wD+K9Jza8tD/CH7y6o1QpM+motNV9pM4b+yt1WvBg2MFQ2MxlL3AVSQZL7Tyz0mhlH5TzzdQJinkOZ68KWz0L82fdv3Hlu3Ee4O1FZ9rlHV20Nz5zfeLbornkrN4PGF/SRzsrepILgfB+nS2tWAOF5tXwFGEIZ+P3AodPBisO1Iv2Zs348Vw0QjHC2yZtSDm9uFlUvwn0XajQeDOQlYkUjBj8CkvmyZQjT6t955rpqe6MBwK46rMZG3ECPIfaEWHp91gkg99FTyFo7XIXPV5TGas0TNYPp5423A3g6uG5LYMm/d/td9D/ZVyI41MV3o2ieTH5PElP7KW2qYdwa/irMvcfpc87UlBytwSErDX2CXXuXacHSujOeorQtBrPigeK5EemvzzQjgJaBpR2q3OoiHHBY1Niu1fsKOFJ4QHx9kqPLcxApg7ndfJsUc3O50Br/naamVLTdwPhOik7q02x6ozqiWbKT3V+MyoZMcAcjDDZ966N81hZ5q3lsGhGlxEaEPIJsZ3rFFvlz1BPSpy8CRxsqywcVngvUBKIL9pfyiFKCYEZMEObpOLoQBOq+cQIkzQ5Tt0iq9a/hz2UGlVIiB4aBgNOOIoZ2k8BcsFHzNJ/UgieMk3TFbfDShuaUgD0KZetKgiAXmb0DHw/u+H9zQOKx12I/JtUzIrThol27Yh1XxnDYuCW+xw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(3480700007)(55016003)(2906002)(26005)(186003)(33656002)(9686003)(7696005)(6506007)(71200400001)(6916009)(316002)(66476007)(91956017)(86362001)(76116006)(66946007)(66556008)(66446008)(8676002)(64756008)(38070700005)(508600001)(38100700002)(122000001)(8936002)(5660300002)(52536014)(558084003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?v/XGctsOCjQXbeYuAsq+Sa0G7itCfargkmKvQ4YFj/MrMuLZhDqxf16mvE?=
 =?iso-8859-1?Q?QTODkwJhcGMJ9Xzgvl/Zo4FG9LYmz5d0poxMg6YJxpBZekvUITUJ88EO/1?=
 =?iso-8859-1?Q?81Wc9Ju2C5UtDvCcX6xHZHTaGvaicG20DniOfZpZMAczssR7vNk6fB4nu5?=
 =?iso-8859-1?Q?ZV+cZTGYTeB2W/YYtiVmQiSLs88v0tbkTeqGohQnVt+dodjfm8yG45un5o?=
 =?iso-8859-1?Q?Vg3FRI1bKrNilrhhkd1hRRO4keZyp14OxKkYov62cEFGK73ADCGEzHJBOw?=
 =?iso-8859-1?Q?pC8p+vbK994HU/YS+enUt83tSNeqKme8cE09z0o2lly6jkLzqoHzTmpdZ2?=
 =?iso-8859-1?Q?nguCbZRC2WmmZK2GPYicWtp1b6x92BR073gItsCjtng/kVuUpV8HqOYn0J?=
 =?iso-8859-1?Q?A2z0YCzu/AN2LpITj2wyBJOzUuv64iFzZUqh/eOKJYu60C/ZgZNK3xXImk?=
 =?iso-8859-1?Q?qjPa2gSM+p2yGjjZ56OOPdTnXCgfaC4TnTnDmJBLLgJbb24geEr0xVJqiF?=
 =?iso-8859-1?Q?1KeQfO4j8Brkx4tCL7B/jvf/VPz4N9EU0dveCLH5jrNHasHgizaqtmtpiX?=
 =?iso-8859-1?Q?5wD6JF7ZzHZEYoOmGPgQQrGQH5d+cBEmFabyQESu94EavF5elrghOmMiMv?=
 =?iso-8859-1?Q?23OQxtUKTJJSz6pPLL88+3dktSq/0v5D5yudHA1L1Ah+qTPaG9cRqIZbKN?=
 =?iso-8859-1?Q?/iaTNJ3NCf5ySC9WpWZrDM8JIiZ5e8dRMUJWjx0Ct2hngsHIQtIXTusnlR?=
 =?iso-8859-1?Q?3AD6TWOcE/xJXoiqjXfudrTUo2imQxGc4n2kCaF2tDHmhPBm3ig5CeRQpz?=
 =?iso-8859-1?Q?x8//zr71d4rWA8QJ82h6hCrmQLJSunB+Ln+jOZDbNcd/9h9cXRZHVMOslr?=
 =?iso-8859-1?Q?Ih3fXIAIGQYhP5AYkVIM17pTHZH3l/FagFCU3olsZHVTxkfhEHYAw7LZWG?=
 =?iso-8859-1?Q?Sx21yCDmQq2gtEYGcwyz9sD1MT96q26wmmiuuwhTDiOay65xsHUXAvhU8L?=
 =?iso-8859-1?Q?WDGRQKHdt4kZ98VKBJMjaDXkrh16Hm65dQSnWAt6UvM9rgPzWc0frUkqN3?=
 =?iso-8859-1?Q?+7jupwUPboxjFV38BpeWb/DiPDGUnLOTdGTGNV4KlFHXPicr5W5V+WAmdf?=
 =?iso-8859-1?Q?TPutm2KZ9rdJ2FYsGqiSU3My/8GEMaFJZkl5bMglMRJ1UFfULiClKzArMK?=
 =?iso-8859-1?Q?lmHp6Hg1ewvEOkrWOfP1eLBXkViKQFg0TTiWVPkWlWUfBU6ZE0R+ifpszE?=
 =?iso-8859-1?Q?U4E/DKCCiIu/S7Q7SUP0Y7QrwD5nlDyX48xt0XaFVTVAGH8I9O2jusOmaP?=
 =?iso-8859-1?Q?QTF6SvqF1oM/V/m9M7pntb/bULYX1ed/pGwOK7IkQz81cIqfPdwqMQOD4e?=
 =?iso-8859-1?Q?FcgNk61yrNuVqR4YnvmTOlbk/pNJ4TluWZmCJ6BlvccTgo98Cauy2JShHe?=
 =?iso-8859-1?Q?1+RNxggcEJffJkuTUmbF7cLkhIPFqd8biEosvEanSSMx2SfUoSEW8rXH9b?=
 =?iso-8859-1?Q?eLBAoQ7G6UMIvZW2I55sw7c4qX6xUTFqOsBy3UwyuDrkL426fnlZMyxnc9?=
 =?iso-8859-1?Q?1xsXYM1dK+QVQwbn1FQY6C7JhLVxoGF+Hg+CL7bFNJJyPCs+JhGhE+Utva?=
 =?iso-8859-1?Q?2PszcP1O+5Yov3M1Ny98eBCTIkZ5IV3ulGMqzL9ldYG3npYEw9KDRAZJnp?=
 =?iso-8859-1?Q?pMXtqSATftxsHUboemyInIVvqoOd0TxcBZJbnQTaugH+bZSTIj4YROFdq1?=
 =?iso-8859-1?Q?l8E7evNzm1MazaPBx0ChMbk3DVtt5peLbyeDUHcSSxwZVIyLECA1l0oREV?=
 =?iso-8859-1?Q?jnZYpcW1/g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 09a0830a-dc8b-4c2f-fefc-08da38292678
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 17:17:41.6000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 h3H56/xhJZt4AtytshrhnB2QUmtMzjI86bjhwZnOkKRsageCL0HcJA31nn9F/At08vCM/2kww4X3apT+QV1rSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.135.121, xfe-aln-001.cisco.com
X-Outbound-Node: alln-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 17:17:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165740

Hi,=0A=
=0A=
openembedded-core/scripts/contrib/convert-overrides.py missing conversions =
for architectures like i386, i586 and so on.=0A=
It leaves untouched something like: foo_i586 =3D "bar"=0A=
I'm not sure if it should be fixed for all existing iX86 sequence.=0A=
=0A=
Regards,=0A=
Oleksiy=

