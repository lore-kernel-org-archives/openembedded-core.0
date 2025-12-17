Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD7DD65C4F
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 13:48:17 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14835.1765979291673722269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 05:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kOLhbG0+;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15719; q=dns/txt;
  s=iport01; t=1765979291; x=1767188891;
  h=from:to:subject:date:message-id:mime-version;
  bh=cLflB0sipaITj/rF1pu68D9DsHKDEAQS4XQ7tFHfT6M=;
  b=kOLhbG0+lYPDebYHSns3/gmLNL0rXUdYeQh3wGioqkVsxy/zt8r7HQcM
   coDHo/GMx4nyN0zXrwvPNVTL8ZO8Hl0rRLnnKLlxlay/gRIbw4IHoK5K3
   NUvNBF7Wj7qevN3VBHUWs1iq0i60fEXHLduwK8+Wl02GlIGpg63aYpEg8
   0CJKRMThNB1FcvStoGiq0xtuBNtBZc7uQQwjg0ZOQiOwjjPeYJQXJlAbJ
   QYb4Z4D8B2Gx9n/UltXhDs+xZlh1ws1T8xqZ0H2G2S5WaIuVhmXuIc2Ko
   Dy+3HKnrJNKomR6gnEMO0EsauIvusasIOxGEGMgG9rIIiavTPZ5Nfbq/g
   A==;
X-CSE-ConnectionGUID: PPT5C8+OSXSZzwsipxRStA==
X-CSE-MsgGUID: JaUwKxFvS1SsduLwMb7J+A==
X-IPAS-Result: =?us-ascii?q?A0DFAwAbs0Jp/5QQJK1aHgEBCxIMQCWBIAuBPTFSB30Cg?=
 =?us-ascii?q?SFJiCADhSyGWIIhl0aGV4F/DwEBAQ0CMSAEAQGFBwKMaQImNAkOAQIEAQEBA?=
 =?us-ascii?q?QMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTwEMhnNiFwF/JwQbGoJhg?=
 =?us-ascii?q?h0WQAMBAqQLAYFAAooreIE0gQHgKIFLiFMBKoE0iQgnG4INgVeGBwKBYoQTg?=
 =?us-ascii?q?i8EgiJ6FIYfk1yBRCIDJjMsAVUTFwsHBYFmAyo0LW4yHYEjPhdzgRSDSR5oD?=
 =?us-ascii?q?waBEYNPiRgPik0DC209NxQbBQSBNQWTPVxOgisIegkKASsggleSYwkBRI8QR?=
 =?us-ascii?q?4E1giGKQpUXCiiDdIwelW8XhVulEC6YWCKLE5hGhRoCBAIEBQIQAQEGgWg8K?=
 =?us-ascii?q?4EucBWDIglJGQ+SIYVkwmp4PAIHCwEBAwmTZwEB?=
IronPort-PHdr: A9a23:vrHjSxYZiAQTeDg6yha0L+D/LTAchN3EVzX9orI9gL5IN6O78IunY
 ArU5O5mixnCWoCIo/5Hiu+Dq6n7QiRA+peOtnkebYZBHwEIk8QYngEsQYaFBET3IeSsbnkSF
 8VZX1gj9Ha+WXU=
IronPort-Data: A9a23:q2mWeK157WqtJW35/PbD5Ytwkn2cJEfYwER7XKvMYLTBsI5bpzxUz
 jNKCD+AafrfNDSmctB/OY7jo0lSu8KHmtRlGlM+3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 Lsen+WFYAX4gmQtbTpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGNHkKYKZIucFMMVp85
 +MDKSgdVCufrrfjqF67YrEEasULJc3vOsYb/3pn1zycVK9gSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MESojx5nYj/7DLo5m+2pmn7jaBVTqUmeouw85G27IAlZjuS1bIOPIozSLSlTtmSRm
 33l70rnOUghL9CC7SWg+C2OxcaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4qBLRRksaaeTjSW8bL8kN94EXF9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:zfHZPaEC3gmP6rOUpLqFtZLXdLJyesId70hD6qkvc203TiXIra
 CTdaogtCMc0AxhJU3I+ertBEDyewKhyXcV2/haAV7MZnichILFFvAH0WKA+UysJ8SdzJ8m6U
 4IScEXY7OAbykesS+Q2njfLz9U+qj+zEnev5am854Cd3AMV4hQqy1CJkKwFEpwSANaBZw/Oq
 a9y6N8zQaISDA8VOj+ImMKcdTiirTw+a4OZyRoOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SKqZiAu1Dh/l6Wy64TtMrqy9NFCsDJoNMSMC/QhgGhY5kkc6GevQoyvPqk5D8R4Z
 fxSlYbToVOAkHqDyKISCjWqkvdOfEVmjrfIGqj8DveSArCNXYH4oR69MVkm1DimjUdVZlHod
 x2NiSixtZq5deqplWl2zAOPCsa0HZdrRcZ4J8upm0aXo0EZLBLq4sDuEtTDZcbBSr/rJsqCe
 90Eajnlb9rmH6hHgfkV1NUsaqRd2V2Gg3DTlkJu8ST3TQTlHdlz1EAzMhamnsb7poyR5RN+u
 yBa81T5fpzZ95Tabg4CPYKQMOxBGCISRXQMHiKKVCiEK0cIXrCp5P+/b1w7uC3f54Dyoc0hf
 36IRtlnH93f1irBdyF3ZVN/ByISGKhXS71wsUb/JR9sq2UfsueDcRCciFaryKNmYRsPiSAYY
 fCBHt/OY6REVfT
X-Talos-CUID: 9a23:jY8StW3EJ0nf2RVsP0Wj8rxfIvgZL1aNj1DrE3SKG3lySaWFc2SM0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3AxHSyzg24kbaay3tnk0ARcML5TDUjwa2TF2Mdv4s?=
 =?us-ascii?q?94vKfOTFUJBKX0xb0a9py?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Dec 2025 13:48:10 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 6C50D18001407
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 13:48:10 +0000 (GMT)
X-CSE-ConnectionGUID: Gw9ju9yhRoCi+TUDmtlsqQ==
X-CSE-MsgGUID: M78/0lvPRK+d+gMpmg8/Tw==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.21,155,1763424000"; 
   d="scan'208,217";a="63820328"
Received: from mail-dm2pr04cu00306.outbound.protection.outlook.com (HELO DM2PR04CU003.outbound.protection.outlook.com) ([40.93.13.62])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Dec 2025 13:48:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lU5zxuahpmXbs+yYPUi7rMKOavEtZPQUifoTJJsqqPksU4ZH5IIBuL5w9bxXVqVQGcdcKYpvs27e3rBYaWjTLtsGC+BP+oZH30qQVt1sA9AljlAR9NyRSDdNpQ0SRA1fDHxkqiSHdXg6Hjt27mCP9tVBRIY8djvTjqBNqxTp215Hlq3Q7YQxNq5OK2JmJiYs4YXNdk3zpMP+ZzRdz407UhKQdkYg6anz11osoufPiqDHyQxMQsa2Vmdw1/3Ze/flfqEFrrGDA/cqu4EKKu+wcgoXqZ1hPWrHf9RpW5qMqXfz2GgYE9ly6ecpqZHLIhlMTxD7p2+dAOE0G1pVjGUMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLflB0sipaITj/rF1pu68D9DsHKDEAQS4XQ7tFHfT6M=;
 b=k4YtK8bt/Uaaiuq5lAFKt76N/UiNPSRLFc/BwhVlK2SBfdRcbglZuzfwVUxEO77M1fhIvOQ9XBVAu3z3d4a4dqcjHWzOpDNmGu95GXMQn9tHmxHwqdWcvr3sWzBirpJey886BkAj1zxc1XQM0YV9eL5tu7D5CLe4Zv5RXvtZv0/gIugdXtq8WakfRLQbLkdZ8znwg+Akgm2O3JXPVWuSSUkfBaiRSaPS359xj4fRpcZ9HnFoLtJ/oHVua1b+ssnf+5Re3soP/sB70XzxzRTgsucnNd5410J0yEDim1nJuSfW3zGJnNoFxBeKLgQVFFkVCEgJ83NIiBJUJbYAtqyu3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12)
 by SA1PR11MB6895.namprd11.prod.outlook.com (2603:10b6:806:2b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 17 Dec
 2025 13:48:08 +0000
Received: from PH7PR11MB6401.namprd11.prod.outlook.com
 ([fe80::956a:249b:d135:b43e]) by PH7PR11MB6401.namprd11.prod.outlook.com
 ([fe80::956a:249b:d135:b43e%3]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 13:48:07 +0000
From: "Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)"
	<oobitots@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: do_patch confused with URL value
Thread-Topic: do_patch confused with URL value
Thread-Index: AQHcb1sUlwK+s7A4DUeERElH/UjvKg==
Date: Wed, 17 Dec 2025 13:48:07 +0000
Message-ID: 
 <PH7PR11MB64018740A35A908068C72F11D7ABA@PH7PR11MB6401.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6401:EE_|SA1PR11MB6895:EE_
x-ms-office365-filtering-correlation-id: ab18af04-4b6f-4890-25a5-08de3d72e907
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?+EDWbOE4UgfVdvdG8zdqvKl6VwHi2V36oa1AxmLPQRQNXzRlhlh/kVQiC1?=
 =?iso-8859-1?Q?BTZjMxN1f1vFub5hrzmdoz1JF1JDX5vKnprQNBHeMULyrbAVLVDSlYc6A/?=
 =?iso-8859-1?Q?Nbnp21lNuAl18FkYuYM6DxPL1zP2ZDJ6WkGBQ63lSZpv/8kWMvAA+YHNIh?=
 =?iso-8859-1?Q?D78jkytZDAbSkRsRERXlb3NnBA+YUpjQsSVlCzi5kTEx8F/GyaWOs3Y15f?=
 =?iso-8859-1?Q?UA+7/MiOuPTxNKqvuokkldpwSDUvL4Z/I1D7SoLhKjNJuoRoa7sifkel2Y?=
 =?iso-8859-1?Q?Q/Ln2236UyE4D6wXGJ9b4kpPaUEET1mGGMtYruNScjdJw8pkTolAOFNLty?=
 =?iso-8859-1?Q?cJMjiTIGxBr3dZe0I5yJvKTvAltESvrRBGc9lNxFs9yHVuVwB2Nz6Lay5k?=
 =?iso-8859-1?Q?B727W8h8T71LrjqTAOV1VuBdwL/RmOxIvnhpBHPEses9jbReIaZerAWVYu?=
 =?iso-8859-1?Q?W/pCuEcTRjl7rMdow3p1TxHivnuIKszy0nuuLgK2MCCfZOD35qhNAFZAA9?=
 =?iso-8859-1?Q?A9eCwf2PJAw/a+P2D1GJR5o7nVPQ9ow3U/J9s458d7oy7NDukUNF6n87mt?=
 =?iso-8859-1?Q?8eXlhQ7sIegWyURBaoppogBpuWqJRrk1q2B0VM6Udpw3zfFTJxqYwsm5hg?=
 =?iso-8859-1?Q?/wqBVk28YjwLSZUlwB0YMIzRDwJ/5sfP+YPw5Uu8qNRxWeeEs4wBYo+cFF?=
 =?iso-8859-1?Q?Q7oU0fREuhXfnFafz2STvSl/kH+gj/XPo3J1jxq0KdVsFKgQMrhGknb54e?=
 =?iso-8859-1?Q?MF4DyJhDY0PwIg2R7i8CyZbbdeWaPFnlJYZn6FHZ9rcTPlNPQKz4R96oyj?=
 =?iso-8859-1?Q?yd0fREgD3TKnVoYwajcyLS+gOltoc7pHEV75nfc6AeEhFI8vrrF/xDjYII?=
 =?iso-8859-1?Q?ODMIBffD87WAOsMfTnYm8+Akc8ijaU3ZlR8nzNbOp5OGSHOOMI9KRhYw05?=
 =?iso-8859-1?Q?vYWcI2eiHckjV5gs2CWD13LId0m4PoRUHdDRuAp1StG4Mrm/eWBtyKU//9?=
 =?iso-8859-1?Q?rklrETIbb391igG9WMNQJcMQg13w1SmGWQ3ugQq1luB/GLUFODjrxzIZQZ?=
 =?iso-8859-1?Q?HCSclh7+udAcUl6WIEiRw7AhumuJk9lVP+keyrjbHewWqXE/SzngnctU9p?=
 =?iso-8859-1?Q?ZFKKVYlEhw8ZbVe6Gh245fhVOr9Y6IzuL6im3EBbnhxCZCreHL+SPeL3uC?=
 =?iso-8859-1?Q?tJ16uEUY6qOM+or9stn2PlNHNIkD3j7dCE2xgPgZeo2/g9T9v+ypungdix?=
 =?iso-8859-1?Q?na7cF8vXPB3s42Ga38k9/u/Kcrz32wAh0wvDFoJ9Lme58CEmFgpYS42B0y?=
 =?iso-8859-1?Q?kpVynPmoQ2kc01DQvbKUoqSyZCZ9S5blhebBCdT6LymGk3lScroaFkDUH3?=
 =?iso-8859-1?Q?9L1EPajve3i2dMeS2xVgNEaB8yz3gBPBGVlJ1kP7cfTLUkdZHUnRHIDQYN?=
 =?iso-8859-1?Q?LVLgITJ2EwnrZQF0CwXBylUNH6IYZoAFRqx8Qg151j28l0wJ61XOpQccx/?=
 =?iso-8859-1?Q?Q2J6cNrrsBs+yYXlvPyi2+YCMN9Yh9FanV1AIWXVozusmbqZiy1WfvHtHD?=
 =?iso-8859-1?Q?uSSjFFrFg9UxqYLl7U8lA2HoAuFM?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6401.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Dgeix+OuyPX60VvdgnMrBp2ver2mk2cJqFfnyeIdKxqmczIWX2v/Bv6sQV?=
 =?iso-8859-1?Q?l7ZN+IMR6z8tPQ9rknQYxw+zkxp+oMf9Kmd0qJSfXc5NugmWlipOrPZHJu?=
 =?iso-8859-1?Q?lZQ6KqEjfFvXgPjoqvl54QYyFKJzu4Xx8ZMyh9cuSWGAVITF2hD7mLaXxi?=
 =?iso-8859-1?Q?AY3bMf3dqYM5n+u51NzW5xC7GJ75yAK58jrPpIkQmksGJFibMB93oK/OUd?=
 =?iso-8859-1?Q?6gc9/5RKkhocBKEc7RndVSh5PqVE8mWFQl9oSukovlzSfv0FsJE66hqn2j?=
 =?iso-8859-1?Q?rHiDqvZCGkrxktc6CDDkV24OXcdApT/t8R0sfd+NqHQ+gJ5se7BuOoSnkI?=
 =?iso-8859-1?Q?Ejbyg0IclNiHNlgfiQ+RrjhzUjKswHYaUyFjm8jpRayxuVVcgjnyyDP2v1?=
 =?iso-8859-1?Q?OpDAXGtvttjWAqcHDRDtm7XpaVbz5jiYfw77yYhT5ZilhG63FheZOwRDbK?=
 =?iso-8859-1?Q?6mPieAxzG14LYLlgqzNautHXE8F5sFYCG9QGhyMVuquQzZDibza6DQHg7K?=
 =?iso-8859-1?Q?R9MRMgXY+yeHqxqlSY3x/kQXaLfMIL3ungWZveewMHm8a55/e7wLBDjuaR?=
 =?iso-8859-1?Q?NKaw/WW+CfOTbBDXLLVkQSWH8m59Glfkyxn73+kJp704ameKB8yJuJW4OH?=
 =?iso-8859-1?Q?VsoKaqF17sLHf2+FSFE1FO0vvcUIMGzPznhWJvvE2D7sipQtSQhyJ4E/t0?=
 =?iso-8859-1?Q?5fGvx51LQBRFp8e5bb2JI/yOWikmYZ5IiUzlGgFrHQmUuymOpwXzolyKd3?=
 =?iso-8859-1?Q?iIJ2nukHiw911usd79HfAnD21mN1+NBmT0Iz7itVEqzjxIbNJK7v/XQ1/y?=
 =?iso-8859-1?Q?3tPzltOW0VOlT6lijgvuua5W3uVJEZsrKjKVaQNxmitUs835Sd9sdJ9dn2?=
 =?iso-8859-1?Q?gZ9A5A3HjVd+5FKWK7JhSIaC++jYJwsFatZp0Fg7ENFqavF2xZvNX0meqL?=
 =?iso-8859-1?Q?gFFnn3UZ/BaPuVxkSanYWF0d6n6v414VEqoG47Z3qCASBSb7wcVhfQeMit?=
 =?iso-8859-1?Q?EJNdqr4rK4gs9Suhw+DJXLJ9V8fmJzqRccvGH4eXtvlh153yfjaPUTSXET?=
 =?iso-8859-1?Q?Pwbcixg5jLqjRlvrr0CnV3/LMhX/4pvhUtQXAfX6whva8oQc1w/lRPJbRG?=
 =?iso-8859-1?Q?2d/yx1d2JLtADhRdmsSIyFd7y8onT3jK7pv12U0ljKeq6ujCNYivOABLSN?=
 =?iso-8859-1?Q?3TTBwkoOcp4hLKbw5/m8WuICx+wjxzgSRk2eZFa0gkxZrffdC42UsNTPvo?=
 =?iso-8859-1?Q?lJMyYEoAVJeRkW/U3vfXt4vD7UKsKf5jF+9PVT2O+cTdT9N7KuOySA8j0f?=
 =?iso-8859-1?Q?mb+jnVmB95MuOp6nzX71pfF/9bFElm7AnwEXUWSpzXCLvKrJbgGTiUd1Px?=
 =?iso-8859-1?Q?GL3DP5z4AQG9oaIojm4xCTONO0s4Hx4TkgT17JBR328nT7QGMh0KVpKTyU?=
 =?iso-8859-1?Q?ay92eY4EOlrADl0zHprFwS/u/lR8zhhflqDruZ9uiGswVLJaelTOY3acCk?=
 =?iso-8859-1?Q?m5pxSbi6u9smUpx0NKiHkxAV6iOpKOYX/rJiWiY/taOwr6CrAmRQ0/PFGf?=
 =?iso-8859-1?Q?0kj9Ix8L9rTrQTdCUYPjUimXSRB95Tuq1BTfjYuzXazYtWCpxmFDMD833k?=
 =?iso-8859-1?Q?Zw6y8Z846t0Q0=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB64018740A35A908068C72F11D7ABAPH7PR11MB6401namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab18af04-4b6f-4890-25a5-08de3d72e907
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 13:48:07.7751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n9fFsz66fX5Glnsi9f/3JNr//bil+BA4+1dZygLb924rx3ro7JFst8JHZajVdagh7vYx/5I7yujZtAJF+saK4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6895
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 13:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228044

--_000_PH7PR11MB64018740A35A908068C72F11D7ABAPH7PR11MB6401namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Got an interesting case when patch stage failed.
And I would like to ask if it is a known issue and it makes sense to improv=
e logic (maybe I'm missing something).

```
ERROR: nativesdk-yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0 d=
o_patch: >>> url git://github.com/pkg/diff;name=3Ddiff;destsuffix=3Dbuild/v=
endor/src/github.com/pkg/diff;branch=3Dmain;protocol=3Dhttps local '<sdk-di=
r>/build/downloads/git2/github.com.pkg.diff' all False
ERROR: nativesdk-yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0 d=
o_patch: >>> url file://run-ptest local None all False
ERROR: nativesdk-yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0 d=
o_patch: Importing patch 'github.com.pkg.diff' with striplevel '1'
FileNotFoundError(2, 'No such file or directory')
ERROR: Logfile of failure stored in: <sdk-dir>/build/tmp/work/x86_64-native=
sdk-xesdk-linux/nativesdk-yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad=
8cc1/temp/log.do_patch.3930851
ERROR: Task (virtual:nativesdk:<sdk-dir>/distro/openembedded-core/../meta-v=
irtualization/recipes-devtools/yq/yq_git.bb:do_patch) failed with exit code=
 '1'
```

Custom yocto scarthgap version.
In my scenario I used mirror for downloads and states and build offline (BB=
_NO_NETWORK =3D "1"), so I have files

<sdk-dir>/build/downloads/gitshallow_github.com.pkg.diff_20ebb0f-1_main.tar=
.gz[.done] before fetch
and after fetch I have no
<sdk-dir>/build/downloads/git2/github.com.pkg.diff directory

check for directory failed

openembedded-core/meta/lib/oe/patch.py
```
890     local =3D fetch.localpath(url)
891     if os.path.isdir(local):
892         return
```
...
```
base, ext =3D os.path.splitext(os.path.basename(local))
```

gives us 'github.com.pkg', '.diff'

and this check also failed

openembedded-core/meta/lib/oe/patch.py
```
904     elif ext not in (".diff", ".patch"):
905         return
```

Hence, return local from function and this is treated as local patch should=
 be applied.

In works in cases when we have no mirrors and after fetch I got file

<sdk-dir>/build/downloads/git2/github.com.pkg.diff

Regards,
Oleksiy

--_000_PH7PR11MB64018740A35A908068C72F11D7ABAPH7PR11MB6401namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
Got an interesting case when patch stage failed.&nbsp;</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
And I would like to ask if it is a known issue and it makes sense to improv=
e logic (maybe I'm missing something).</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
```</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
ERROR: nativesdk-yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0 d=
o_patch: &gt;&gt;&gt; url git://github.com/pkg/diff;name=3Ddiff;destsuffix=
=3Dbuild/vendor/src/github.com/pkg/diff;branch=3Dmain;protocol=3Dhttps loca=
l '&lt;sdk-dir&gt;/build/downloads/git2/github.com.pkg.diff'
 all False</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
ERROR: nativesdk-yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0 d=
o_patch: &gt;&gt;&gt; url file://run-ptest local None all False</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
ERROR: nativesdk-yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0 d=
o_patch: Importing patch 'github.com.pkg.diff' with striplevel '1'</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
FileNotFoundError(2, 'No such file or directory')</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
ERROR: Logfile of failure stored in: &lt;sdk-dir&gt;/build/tmp/work/x86_64-=
nativesdk-xesdk-linux/nativesdk-yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e3=
5780ad8cc1/temp/log.do_patch.3930851</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
ERROR: Task (virtual:nativesdk:&lt;sdk-dir&gt;/distro/openembedded-core/../=
meta-virtualization/recipes-devtools/yq/yq_git.bb:do_patch) failed with exi=
t code '1'</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
```</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
Custom yocto scarthgap version.</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
In my scenario I used mirror for downloads and states and build offline (BB=
_NO_NETWORK =3D &quot;1&quot;), so I have files</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
&lt;sdk-dir&gt;/build/downloads/gitshallow_github.com.pkg.diff_20ebb0f-1_ma=
in.tar.gz[.done] before fetch</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
and after fetch I have no</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
&lt;sdk-dir&gt;/build/downloads/git2/github.com.pkg.diff directory</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
check for directory failed</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
openembedded-core/meta/lib/oe/patch.py</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
```</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
890 &nbsp; &nbsp; local =3D fetch.localpath(url)</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
891 &nbsp; &nbsp; if os.path.isdir(local):</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
892 &nbsp; &nbsp; &nbsp; &nbsp; return</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
```</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
...</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
```</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
base, ext =3D os.path.splitext(os.path.basename(local))</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
```</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
gives us 'github.com.pkg', '.diff'</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
and this check also failed</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
openembedded-core/meta/lib/oe/patch.py</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
```</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
904 &nbsp; &nbsp; elif ext not in (&quot;.diff&quot;, &quot;.patch&quot;):<=
/div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
905 &nbsp; &nbsp; &nbsp; &nbsp; return</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
```</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
Hence, return local from function and this is treated as local patch should=
 be applied.</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
In works in cases when we have no mirrors and after fetch I got file</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"line-height: 19px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
&lt;sdk-dir&gt;/build/downloads/git2/github.com.pkg.diff</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Oleksiy</div>
</body>
</html>

--_000_PH7PR11MB64018740A35A908068C72F11D7ABAPH7PR11MB6401namp_--

