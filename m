Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B58BD59D91
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 20:07:13 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2546.1765570029396697812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 12:07:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Fu1gxsIg;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: ohnatiuk@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=467; q=dns/txt;
  s=iport01; t=1765570029; x=1766779629;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=5afTjyzwHO1bsKvsNncyQ7c2QXMTKQTgPj5gDazhs4w=;
  b=Fu1gxsIgIs40SKrzW8+7kDcVd04xz7O71S9ZREIAkXhJJkiTUzUH8q+h
   DwaMSxFAwZxohOvcYtZkRlcUw5U140ky+i9azi3A/fK7iHDe6PjgRTC6L
   OqYgmxR/3cCm6vzfqtYVnHBvlGc8KQYTzgo0oBKUJcDfdPYlW8gPYW+Bt
   HPb0eo96H343Ox6D7Vl76uA5jpBDNHN8Mhbhe2+czH7WQlW9ShxDDzWTm
   fyPJdW0f50w7bNjKHjW61lgzKEbvN4Q5IXzCA6RdOoRggnyG1UjqhPf8c
   BQ592HVfRR+uwsxfGxMC8/D2EEay+N0ZqlYRcQzi1UVzSkYUpM9H6fBe3
   w==;
X-CSE-ConnectionGUID: R7pqKD2XTxWN/wtAgko2dg==
X-CSE-MsgGUID: QgQeubTCRHCATIfd8GeJeQ==
X-IPAS-Result: =?us-ascii?q?A0DNBQAzdTxp/4oQJK1aHgEBCxIMQCWBIAuBblIHfYERE?=
 =?us-ascii?q?ohpA4UshligPoF/DwEBAQ9RBAEBhQcCjGcCJjQJDgECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQsBAQUBAQECAQcFgQ4ThlAMhnN5AX8nBBsahVQDAQKnOgGBQAKKK?=
 =?us-ascii?q?3iBNIEB4CiBS4hTAYYJhF0nG4INgVeHa4QTgi8EgiKBDplzgUp4LAFVExcLB?=
 =?us-ascii?q?wWBZgMqNC1uMh2BIz4Xc4EUg0keaA4GgRGDUYkYD4l2UgMLbT03FBsFBIE1B?=
 =?us-ascii?q?cACoXoKKIN0BaIIF4NxAaZ5mQYiqHMCBAIEBQIQAQEGgWg8K4EucBWDI1EZD?=
 =?us-ascii?q?9QzgTQCBwsBAQMJk2cBAQ?=
IronPort-PHdr: A9a23:sniaJha2QFA6SyP0RP6CeyL/LTAchN3EVzX9orIuj7ZIN6O78IunY
 ArU5O5mixnCWoCIo/5Hiu+Dq6n7QiRA+peOtnkebYZBHwEIk8QYngEsQYaFBET3IeSsbnkSF
 8VZX1gj9Ha+WXU=
IronPort-Data: A9a23:bVZd/62eCE9oL6MdLvbD5Ytwkn2cJEfYwER7XKvMYLTBsI5bp2AAn
 GMfX2uAa/feMDegLdkiPY21oB4BvMDdz9JjGgc93Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 Lsen+WFYAX4gmQtaDpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGNh4uJK40oNZLEV5os
 uMEAT8OaUqPiLfjqF67YrEEasULJc3vOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2N0Sojx5nYj/7DLo5nOGhmnjicBVTqUmeouw85G27IAlZjuSza4OMI4HWLSlTtn+Xn
 2/b9VjSODExHeC+xzbV3X+Oi9aayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1/fDWkfRTkHY9sj3CMreQEXO
 payt4qBLRRksaaeTjSW8bL8kN94EXF9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:gDMXCahh0P+WxQumsNZPfZ8tOnBQX4l23DAbv31ZSRFFG/FwyP
 re/8jzhCWVtN9OYhAdcIi7SdS9qBPnmaKdkrNhQYtKOzOW9VdATbsSp7cKrAeQYBEWmtQtsZ
 uIEJIOROEYb2IK9/oSiTPQe71Psbv3lZxA7t2uqUuFODsaE52ImD0JczpzfHcGIzVuNN4SLr
 bZzMxBoDarZHQQaeqGJlRtZYL+juyOvqjLJTodCTAayCTmt16VAbjBfCSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWsMGJ8KoMOOW8zuwubhn8gAehY4psH5eYuioune2p4FE21P
 HRvhYbOdhp4X+5RBD1nfKt4Xih7N8d0Q6h9baquwqnnSU/fkN/NyN1v/MbTvIe0TtmgDgz6t
 MM44vTjespMfqJplWC2zGPbWAkqqJxykBSydL6SBdkINIjgLM9l/1vwGpFVJgHBy7084YhDa
 1nC9zd/u9fdReAY2nepXQH+q3kYp0fJGbwfqE5gL3i7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QL5pe7r9NkXdBRbXdG6CK1XuE68Kf3rLtp7s+b0woOWnYoYBwpc+kI
 nIFFlYqWkxcUTzDtDm5uwCzjndBGGmGTj9wMBX4JZ0/rX6WbrwKCWGDEsjlsOxys9vdvEzm8
 zDTa6+L8WTX1cGQ7w5rzEWc6MiWkUjbA==
X-Talos-CUID: 9a23:UQZr9mHXtL5MdGmDqmJdq1YNOex/QkHN81GXPFORBmVuErGaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A+beWRw/CYXNwA3sKnjWWQLCQf/5n2qmzAnwmq7U?=
 =?us-ascii?q?tkvWlOyAgFDq/gQ3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Dec 2025 20:07:08 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 3863A180001B8
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 20:07:08 +0000 (GMT)
X-CSE-ConnectionGUID: OuVFORI0Td+iEEzuR+9zfQ==
X-CSE-MsgGUID: u5IhvdRORk2PSf+iMHzgdw==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.21,144,1763424000"; 
   d="scan'208";a="59790521"
Received: from mail-bn1pr07cu00302.outbound.protection.outlook.com (HELO BN1PR07CU003.outbound.protection.outlook.com) ([40.93.12.2])
  by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Dec 2025 20:07:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zM6YA6GCbd1TfSLz8MZrKQWLDbAFEuHJQXckI1JLx8x2cHYR6LEPE4EA8NqENHs4e7+ItqY4yoAKRQcdOEA/qamuFf/ndWh9ItyYVDxCBj2V00vRupfIOngfhZ+i1R5GNMAqx+u+YB0HsNUUn75lILyIscZqba0+gNLLPuZM1NoK+SOcRuluywUq3coSJhNe0eKzRRJETOeATkJsWdKkQR0/mPYrWdsd7qdf9YWR0mBBiVGCxFXLTcjGBVM9+NKfQ6rKR+4ApAvvcX9M9z/1VHjCDFWuFqi0LXGBx36kvBIBsBSERxfEvy4X9KH5D+h5ddUMohrFqph3kN12TcoK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5afTjyzwHO1bsKvsNncyQ7c2QXMTKQTgPj5gDazhs4w=;
 b=oikY7oEl2wcoiJhjUGyqxGNLZgjr/nlEbKC8mwoI3+V8GqSfqRKNXvqwBgujED3olkl8vWsiZrweUeCYEYJsvyeQWfu6v6+NZ4kJvrNpFRdRayDI+13REMvBvGdvpU6UfCt5Bx/4b1x87Ip3ULZgPTIz6Q1qDcQ5dMrOULDbWS4p8F4zxJfPDGJerYKJ27cZngKLFnSZGVFvEC94JuyH7nHxHYDkksGD+H8BF5sfooUb2Mwx+E9UHftSksJMy6c2ddT6b4a7lKmfhyJUu2kSvLT4wfpwZVIMCs8zpvRpLgZrwxl/1Apg81ql02G4jODG1gNl/ee0BmgswsJcCzJ1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SJ5PPF4990C6B9D.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::826) by IA1PR11MB7200.namprd11.prod.outlook.com
 (2603:10b6:208:42f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 20:07:06 +0000
Received: from SJ5PPF4990C6B9D.namprd11.prod.outlook.com
 ([fe80::3b2c:7b42:eca1:3c92]) by SJ5PPF4990C6B9D.namprd11.prod.outlook.com
 ([fe80::3b2c:7b42:eca1:3c92%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 20:07:06 +0000
From: "Oleksandr Hnatiuk -X (ohnatiuk - GLOBALLOGIC INC at Cisco)"
	<ohnatiuk@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Changes to local python library don't trigger recipe rebuild
Thread-Topic: Changes to local python library don't trigger recipe rebuild
Thread-Index: AQHca6KuX4UR3oIfO0Kv4/R8MKR75Q==
Date: Fri, 12 Dec 2025 20:07:06 +0000
Message-ID: 
 <SJ5PPF4990C6B9D2DD56AE32F539CF05981CBAEA@SJ5PPF4990C6B9D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPF4990C6B9D:EE_|IA1PR11MB7200:EE_
x-ms-office365-filtering-correlation-id: 2f04c72f-cc59-4f83-62b3-08de39ba0620
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?DKioUepsb8ZS1z5ARXxcsPgxqbHPw871jXTJK1rO9wPxs7SVn47OI0RiDo?=
 =?iso-8859-1?Q?G/FTmgUY/lniCuHo6WVYYkFVsH4qa/rcb+lo9wWqywygVYSkQyeY6mRdUh?=
 =?iso-8859-1?Q?dWYm2z0AlazO8VDi9K40fKHC4+obXSLYZh/Y899iZVXhSDjVAewtfH0YBx?=
 =?iso-8859-1?Q?O70mz2JeDG3xZ51Zc6t8E+myAu2iDtoDgrj0PfV79994Gacg31vAB9aDSU?=
 =?iso-8859-1?Q?qgYh4ldjTMAIR8D6lFh7lyIOOurgaQ9rqDKwU9cHB8fRy+tTRE6kNK9yhn?=
 =?iso-8859-1?Q?ATW9XQoVhVmu2yhdRjzn5A9W3ESoS4j44DZM5tAQmEatG85bm+MWn3jf5p?=
 =?iso-8859-1?Q?85G/wMlYdSE04SNsyfNI5xlCubV0r6PpNlyqHyhsxFYOmMOZaWYXF0UjFE?=
 =?iso-8859-1?Q?n1NYGwXq0knBdxkGaS9gTdQVRL1N0g7vHOinbC6qvXKGQMQ53/hal6XO9b?=
 =?iso-8859-1?Q?1g4il0mxnjrSzvitmrxOwdHnN1M6zVPw03uCS2Mq0FRVlP0ZARMJbvjwlN?=
 =?iso-8859-1?Q?ZTRemoEPvGx3dL+640YS5ueVFpDjMWtwlgD+u4os/U0hlU1bdc+ULQSKOM?=
 =?iso-8859-1?Q?81lDXisl6wE00DMN6zCcpq9O2MBt15D6wo2Wf0Oe18v3JrNDbretxegcBw?=
 =?iso-8859-1?Q?BTLGb5yp9COe30Q+R+FVxPGH72Dy/i/BdMuWrW85L/Jzvak8OAmuqDY/pi?=
 =?iso-8859-1?Q?06L6J1bgJP81hA2sAhJyyXvtVstoqBUuBhhHfdnnAmIfCEg6B6b6IcEcg6?=
 =?iso-8859-1?Q?GydiGX7o9coL+KUILvWUqIRtDsJosiLDMb7MDoE12lUlOV3pNrI1ZkWZY3?=
 =?iso-8859-1?Q?0Etzsq1t4yzzsN7HhYaV8tX+LPM3Jpr/CtdOqhfbd9joX9rwlS61XkDARp?=
 =?iso-8859-1?Q?wsL5ik538R1grk2Dtxs9sgN0clElsoKnp8GHiIJiv7W6plLzrJw2YurOHq?=
 =?iso-8859-1?Q?cvWz17l2JBDu6Qq/BxrHZsopbth+BmJQNXbhET7ZBfqW1tiE7TUZEZfwvo?=
 =?iso-8859-1?Q?M/4gkLXc7NZRD6AlxGjvtaYBHGktxJqZ4aGZlR3Tf9NbQx6nK09qMzvbLA?=
 =?iso-8859-1?Q?pQCudzGarhhMMVMoYxaDEa7HzW3Z3NDrWC53XyGJrXQxfa481VfFUObzMw?=
 =?iso-8859-1?Q?F67Sa1AW1G31W6u8i3rIsFY2Nli+3CoYRpSxsHJyi4jNCDGAQqMl0RCRq3?=
 =?iso-8859-1?Q?PVQVPyiIUD0A4a3NHNR/yDofoZOwI9M2iT9zAIvIasXM6BriYuKpLbQk6W?=
 =?iso-8859-1?Q?54QLWdXfd+rj44WtcoTOoIeBVpPo80W9JDg3Lnt/wbJNaJvk+sTwI/T9au?=
 =?iso-8859-1?Q?CEO0l23U3UONJcwifYGXth4PhVLBF0BpyoR8aXyZvj9VQdJoW7pdZEEb5N?=
 =?iso-8859-1?Q?7tMmo+HmPaA+87BCPbeR2GPZ8wt9RntTRuK00hRD/IF7pFnMO/ugGxrxgu?=
 =?iso-8859-1?Q?VdWRZCxPXIGaCKRcb7OPzYHpoUSgrXqfqgvXx7lWoOIIvZIl7OgYOH7O+T?=
 =?iso-8859-1?Q?ajVCgZGao6N27nifjWOfFdE1s4C37te2fLjhzEOQUYqWy/KG8ZosOd1ba1?=
 =?iso-8859-1?Q?SyRlRz+jL8xUP/xmj2PlqJIA9dvL?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF4990C6B9D.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?2oQviaj/x5V+QGgIZwsq3JTW4NJe7/u3S0EZws0je/KvTKsT0YdOWe0kAz?=
 =?iso-8859-1?Q?oSUYYtmBtFi3b8O6KB1adcnxQZTBxhc4WbIYu76Bkar9Kn6vI6skHi+t5o?=
 =?iso-8859-1?Q?CwRSDKKb7hr7TGIsAQo4LaOQ1i4AUKL/yMVKx7gS9FOZBPjKm7qPkWM5bm?=
 =?iso-8859-1?Q?NLLFT3yqtLQY2mCIYStcvHa42DVOF4fpgi2lAZ+3N66jBDuBiLZm1xIhwR?=
 =?iso-8859-1?Q?3qV3hUQ69L5jNoSPNczOjoWqmutoJZBlv7EMw2Uc+1ZIYRVzNJT0jLJ9Op?=
 =?iso-8859-1?Q?F4kEFRJvQhcvTN2m47o+AcGYPlP5M2jaKpY8Dl+hb4mIhyfnv3rffIUiZy?=
 =?iso-8859-1?Q?xofzCD7rSXFe3l7P3rc/iBQjna0kIq90faRrsm5ibx1BCMPrxwxs67sGZn?=
 =?iso-8859-1?Q?eyLXoO0ZGhrgoPYUSU0Q90u2//dfoamcBEHFNVC0GxnQUyU793saj1aDEj?=
 =?iso-8859-1?Q?okDPtEX5KmBXLvEVDouohQe0hTDVPXm9vUiCQTGqPdhhBr523YjZgSEKyC?=
 =?iso-8859-1?Q?5TVRJRYHrxjZh2OIiDi+Vwp5yr3bADBPn+APK5jQ2Zo6gybcGrIP0nqdsZ?=
 =?iso-8859-1?Q?dAvDLQFlahZJZ9qaotvGGeMc9MWvdPGkrWHcvqZ2pDmtMreJJ58jnxUrPL?=
 =?iso-8859-1?Q?RNt1KpHRmrHJ/cmgc0bThYbZzeWDQVXYG4cZY1BozqbeheVyh1fUD2xLGw?=
 =?iso-8859-1?Q?GLKgvJ2HO0x2rJhveKwAbxkqCti2jfFn3/gNJ6w0bqE5nAMiyLdvtCyShA?=
 =?iso-8859-1?Q?SUzAsgqBZIPx1W3ymjeZriPEzPnoLWMb0R907k/VK1ZiiXSjP9qEySNzs1?=
 =?iso-8859-1?Q?dOHVeoy2HfSec6VxxTM7en+x39tVzSilLrmB6M67cNxNN2x11TgRp5sWpH?=
 =?iso-8859-1?Q?UEbfiKsc+zpcH+d4L1L28CiNeHn99Uhy+EudY7fZOzAeoPja/lJg7k9qBk?=
 =?iso-8859-1?Q?FixeglNPiqYALj7u+BaK8Pc5nZoOgV32MUFQcUnTuKoyABwpfSweXw4jmT?=
 =?iso-8859-1?Q?W/06z2wGCazQQ//yomaawicwaA5YhsFcswo4l0w3XXn63qiwSXlBwRPZoI?=
 =?iso-8859-1?Q?eJ6ZnogzIMr4R9rSxqxgMUUUjBl6EwyqQeM9XFp0mvjWtv3FUVZPRQnGQ0?=
 =?iso-8859-1?Q?VjNqdkFYKbjq+0QzDc7MW60b6Z5suygrHHDObfICjgrkTAqMkB85fQqnpL?=
 =?iso-8859-1?Q?akHDHlymnFRe+G9WMkEJ123zc+Zu65ZIQquWAZWqk2yjynNRO3MORJMI2w?=
 =?iso-8859-1?Q?ol7aCjpJdjdOY6+E+H5Rf0ANJUzk3FvdRovWPcP+9rHDk3uCq5iZK8+HAE?=
 =?iso-8859-1?Q?deRyNnV7bNnkrjmjq84umkdBK4B3D5utAy7eisyX6mYmErMA2HJu29Lbtk?=
 =?iso-8859-1?Q?E8EuuWC2DDxBpWk1QSbrSwY6/p/JFABwYAWTzrWhjTRgRh6ElZFnil6J+g?=
 =?iso-8859-1?Q?81mz2ZErJs39eOSO5YdYhE09zuod0AdIzj91xmSxtTBo4lelUbUdV5RnLu?=
 =?iso-8859-1?Q?PheHGSFL14DDs861J49XhRVPEbEKg0U20sX+3y3hAX+bwzdgI5BmGkCMQU?=
 =?iso-8859-1?Q?6SDJmIU5vv1g0m7Ig1MuPww8Qf6m3CwAC50slLxZ9g1cHUWQc7ubBLbn2Q?=
 =?iso-8859-1?Q?jpThJfZwOo1N1vx/jjmX8c/5Scolv19o1t?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF4990C6B9D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f04c72f-cc59-4f83-62b3-08de39ba0620
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 20:07:06.2471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OqipMl/w5Nuv00b9DL9QYMWaBSXSNpA7bJ9t87FU+I3V4gCxif6p5gdyQAXAq0Kp3U1JJzCOpCDl/etpJMHy5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7200
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 20:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227610

Hi,=0A=
=0A=
I have a custom bbclass which imports a python library via addpylib.=0A=
This bbclass defines new tasks which are also python functions (they call t=
he library).=0A=
This bbclass also has an anonymous python function which *conditionally* ad=
ds these tasks to the build.=0A=
=0A=
What extra code do I need to add in order for changes in the library to tri=
gger rebuild of recipes which inherit such class?=0A=
=0A=
Thanks,=0A=
Oleksandr=

