Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web10.2375.1615404103552359908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 11:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=ID0XA899;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=416; q=dns/txt; s=iport;
  t=1615404103; x=1616613703;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=5unzAJ2cA9czKuZC2D5YN8XSr35HgzVsZcBptBUH4pY=;
  b=ID0XA899iWODuGPf2anNFjA5dM/5DrqGw4HOqea0lST7jpP+LNgAxsNp
   tjH25TGTyY8NacapdqbAq3QTG4Yuehqu/xnDjsLPYFy/LdmLA+YjS5sha
   LEx9632Ei0MtzkGeoluAdrIFXMp4DRMsXXGQ2LjIJ/6uWN1nUuN9H1Wlt
   8=;
X-IPAS-Result: =?us-ascii?q?A0DHAwCmG0lgkIMNJK1agQmBT4FTUX1aNjEKh38DhTmhd?=
 =?us-ascii?q?oEugSUDVAsBAQENAQEsBgIEAQGBEwGDMAkCgXICJTUIDgIDAQEBAwIDAQEBA?=
 =?us-ascii?q?QUBAQECAQYEFAEBAQEBAYY4DYcLAQE3AREBgQAnBA4NDIJcAYJVAy8BDqJjA?=
 =?us-ascii?q?ooedIE0gwQBAQaFGhiCEwmBOYJ2gnmHVCYcgUlCgVSDFoJcBBaBSYNIgiuEB?=
 =?us-ascii?q?CN5gRadRpxgCiGCX4lEkwuDKgGBSZ8MoDeWeAIEAgQFAg4BAQaBVgE1gVlwF?=
 =?us-ascii?q?YMkCUcXAg2OOINWhRSFRXMCCS0CBgoBAQMJfIp0AYEOAQE?=
IronPort-PHdr: A9a23:Bca9/RWfcPlibbnWdENix3VgGtzV8K0OAWYlgqEPgq9Scqml45XpN
 VDe4vMollLSQIHH8JpshO/fsqSmUmsFst6Ns3EHJZpLURJNycAbhBcpD8PND0rnZOXrYCo3E
 IUnNhdl8ni3PFITFJP4YFvf8XK35D8WXB74MFk9KuH8AIWHicOx2qi78IHSZAMdgj27bPtyI
 Ry6oB+XuNMRhN5pK706zV3CpX4bE9k=
IronPort-HdrOrdr: A9a23:MQxjG6FP/XEkgc9MpLqFuJXXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7IE/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgePJwTXzcQY76
 tpdsFFZ+HYJVJxgd/mpCyxFNg9yNeKmZrY+Nv25V0Fd3AMV4hL6QBlBgGHVmh/QwdbDZQ0fa
 DsmvZvjTymZHgRc4CHHXEDRefOvJnmk5jhbB4ACXccmUazpBmv76P3FAXd4wcGX1p0sPsf2E
 Xmsyi83KWstPmn1gTRvlWy0716kMbso+Ezf/CkpdMSLlzX+2OVTaBAf5HHgzwvuuGo7z8R4Z
 fxijMtJd565X+UXkzdm2qW5yDa3Dwj62DvxDaj6BOJy6GUNVFKafZpv55TcRfS9iMbzbdB+Z
 9LxG6Qut52Ch7NjU3GlqD1fixqjUa9rD4el/cShRVkIPIjQYJWxLZvmH99IdMlJmbX+YonGO
 5hAIX3//BNa26XaHjfoy1G3MGsdm5bJGbGfmEy/uiulxRGlnFwyEUVgOYFmG0byZ47Q55Yo8
 zZL6VTkq1URMN+V9M8OM4xBe+MTkDdSxPFN2yfZX79ErscBn7Lo5nrpJI4+f+tY55N6Jcpgp
 zOXBd5uAcJCgHTIPzL+KcO3gHGQW27Uzio4NpZ/YJFtrr1Q6euPjaETFwojsu8s/QSCsDWQJ
 +ISddrKs6mCVGrNZdC3gX4VZUXA2IZStcpttEyXE/Los+jEPyvisXrNNLoYJb9GzctXW3yRl
 EZWiLoGclG5ke3HnvxgB3bXWLxalXylKgAV5Tyzqw28swgJ4dMug8ahRCS/ceQMwBPtaQwYQ
 95O7PokqSyoGGs5mbW52B1Oh5QZ3wloonIYjdvn0snIkn0ebEMt5G0YmZJxkaKIRd5UofLCg
 JFvk92/qi2NpSUwignB7ucQySnpkpWgEjPY4YXm6WF68ugR4gxCYw+XrdtUS/REQZupApsoG
 BfSQMNS0PFDAnygaG9gJF8PpCHS/BMxCOQZe9dszb2qFiVr8BHfAplYxeeFeqsxTsIaxURrF
 tr6KMbiKeHgl+UWBUCqdV9FkZNZmSRCK9BFyKfauxv6+jWUTA1a3uWjjqHjBx2XWzm+ywp9z
 bcBBzRX+3XCVxAvX0d6ILWyRdfc2WQeF8YUAEgjaR0CXnGtnFv0eWCe6q01C+LZkEfx/wGWQ
 u1EAc6M0dgwcu62wWSnyvHHXI6xo82NuiYF7g7darPs0ndY7GghOUDH/VO+oxiO82ruugXUf
 iHcwv9FkKwN8o5nwiUrG0iIi96tT0tlu7pwgTs6Cy90GQkCfTfZFRgSLdzGaDV00H0A/KJ2o
 5+l9Q7oK+5NXjwcMePzeXPdCFYQymj1VKeXqUts9RZrKgyvLx8E93SVibJzmhO2FE7IN3vnE
 0TTaxn6Nn6S8VSVt1Xfzgc8ksildyJIkduqADwD+MkdVwmjnPQPbqyksz1gKtqBlfEqBr7OF
 GZ/SEY4uzMWDGb06UGT603OmZbZSEHmTlf1fLHc5eVDgqkd+tOpgXndnC8daJQU6iDF/EbqA
 1g79SBgu+QcG751WnrzElGC7ML93ziR8W4RB+IE6pP9dexPFyXmKuk4MKpll7MOEyGQlVdgZ
 cAbFAaa8RIlyIrg4I22DWjU6CfmDNXr3JOpTV80kP30oeo4G3HDVhLPA3QjJJRRyRSOBGz/L
 H42Pnd0m/87jhD0YTCE0kVfsgmIalhcrTK
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,238,1610409600"; 
   d="scan'208";a="652511307"
Received: from alln-core-1.cisco.com ([173.36.13.131])
  by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Mar 2021 19:21:42 +0000
Received: from mail.cisco.com (xbe-aln-006.cisco.com [173.36.7.21])
	by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 12AJLX0S007084
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Wed, 10 Mar 2021 19:21:41 GMT
Received: from xfe-rcd-001.cisco.com (173.37.227.249) by xbe-aln-006.cisco.com
 (173.36.7.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Wed, 10 Mar 2021
 13:21:36 -0600
Received: from xfe-rcd-001.cisco.com (173.37.227.249) by xfe-rcd-001.cisco.com
 (173.37.227.249) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Wed, 10 Mar 2021
 13:21:31 -0600
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (72.163.14.9) by
 xfe-rcd-001.cisco.com (173.37.227.249) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3
 via Frontend Transport; Wed, 10 Mar 2021 13:21:31 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZS2yPBn7UyiYpEM8xdIjZgWTpzWbCj4i1V+96RHTEvUldI9aK3aMjeEk7GwVJMUX7PSzmxaT8oUFIHIwud1zini8VJalQJcLmX7O7c1nlev9al9rpZsNux7VE7ElZEA9iPOnWN4KUkrnF+oso7k13JAF6114asX83v05ToBYgKTILN8iNorg8MPXY5PcCPArX5oN/+0qVV/3bZsKfQIVbiWD8EGWIH8hKgZ8CATLlEP4QBBqrpmcavMzGNi9mJWtex/0U741XM7RmefqEXnDSqIMXl3rs4OLcuDng6E05oviPZZmhqUdMwLDVf+S7raDsuZToFXQ3Jj5NjECOJ6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5unzAJ2cA9czKuZC2D5YN8XSr35HgzVsZcBptBUH4pY=;
 b=CNF0Igp1BKu2hK7lIUD9+uSXIkItzfwW7NksGhRs+1cPVXlknD6S8e0XThqBRgp4cHYPB/wOkJ8BG8ZH3kEoqHtlA6+RYLVQk6JMXzK1ubGv/tkjfBCeMOdGvjETaPDtuphNoezhIUDiKMtPYkDrOD+9RgBmACzdXLMO2p+SeojVuPVH+oeEIPPmn76MlOYs9dgVT3otp3B2C24DaKOmgTRJtJG2vK8t0KPsg8xVAVNTs5rE60m4erbPn//8b2JctkKP5BuGMT62w3W899MSS/MvNc9RbFpKY5eD4ZQ6WWT0fdGhvvBYl+ps4STSAbNyivI5EPoTk4ia7yky7RO9cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5unzAJ2cA9czKuZC2D5YN8XSr35HgzVsZcBptBUH4pY=;
 b=Vd2D9W9D0arn1Pk2py6KTnGOl8+EqAaix2jJ4ezgGOevYwoP7Q7+0NOKepDzw8NlHi1Kn8flSzr+djSkmVOKXvZHfuYZsgRtF71zEMM/sNOpnW1SiSbyULcsr4IYpcsk33Eeaqt3Y6ZvMbaB+7L1OvmKHcm5yZZYi/hd4vtGGS4=
Received: from BY5PR11MB4024.namprd11.prod.outlook.com (2603:10b6:a03:192::24)
 by BYAPR11MB2645.namprd11.prod.outlook.com (2603:10b6:a02:c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Wed, 10 Mar
 2021 19:21:29 +0000
Received: from BY5PR11MB4024.namprd11.prod.outlook.com
 ([fe80::6505:b3:4118:8336]) by BY5PR11MB4024.namprd11.prod.outlook.com
 ([fe80::6505:b3:4118:8336%4]) with mapi id 15.20.3890.038; Wed, 10 Mar 2021
 19:21:29 +0000
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: perf: fix reproducibility issues
Thread-Topic: perf: fix reproducibility issues
Thread-Index: AQHXFeE07Aj6hbNelUad+Ka/IlCCVQ==
Date: Wed, 10 Mar 2021 19:21:29 +0000
Message-ID: <BY5PR11MB40242781588BD3BB72E0FE3ED9919@BY5PR11MB4024.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [173.38.209.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32eb075a-b75f-4324-13ad-08d8e3f9b4de
x-ms-traffictypediagnostic: BYAPR11MB2645:
x-microsoft-antispam-prvs: <BYAPR11MB26453765FF0BDA1B92B0A278D9919@BYAPR11MB2645.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:225;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1HhsjOwIIg6pEvTJyY1eZWUaV7ny5eItADACcLSTGK+YspWuz6Xd8kkwV6d6EkLxBYFsWDsOm/XFNAcU2ydZRrl81GY1W9fEnurPj/ywtOev0BsOCSEUenj9Xjvwbn+nuA/5oy/bVdPVIDbhSMydSfIOj/hJG1FI24u2G9wn/mA4cnPopTDMaEodYlmWc1FOunqxcPPCUUGVi95IXkNa6Xi1oCRCeYtSz2XsUckiGiLDSI9O925uKaZARK06Uu3px2nTUW7nQIRfY46ML8Vl3TlXDcJxoMQi9SIDmmLyUfflPUxvDNjiX1wYnnjBzzZUzPopW58OmGBthm6fWbfBOm7pC6YavMP7YJ3dGXXBcWKWF1O7KVdxkmuAiwzS7KgczD5EulzE/UyKuU2uoPcliytJLpI/aLi8z737czzQa0IRASp/vX6F8nzWfyYS+wA7oDxN3JSvxiSev8SzOOj12IIvkMv2jal4UOFOLVx2JjmYYwUBXakljp0PQ4Rg1EGXGOWdPGmlYQK/yc1rMHWGTwucUZ20E7rIeW8qghzDVBsaU569W0AZymtUb2GMZ7eARNmgHySJEPkviXRfOZA4/wh4sdH+7E8npxaamUcV7dq4sC9kd8Noq/GCqWtptJGhtGZWCN5aXc3gtDU+5L9hsNt+qwBWfsovn1QmvKInG34=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4024.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39860400002)(346002)(396003)(366004)(66946007)(5660300002)(91956017)(71200400001)(76116006)(66446008)(6916009)(66556008)(2906002)(6506007)(66476007)(8936002)(8676002)(7696005)(4326008)(186003)(83380400001)(26005)(478600001)(316002)(4744005)(33656002)(55016002)(64756008)(966005)(9686003)(52536014)(86362001)(15302535012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?52AUYtFC7/rl/N93X3M/BR0Vqd/KLKF5QXQy7xs0loiTJzdv4VoXaLADwi?=
 =?iso-8859-1?Q?ndwHGnkmvnNtM7qYo39mt5MEFt24Z6F8f91s+6InNKLCc2VHUiRYll6bdp?=
 =?iso-8859-1?Q?XgL8OvaSQYS0iOcrosptJ+SzI7JofCm2GDMVEBhg2kZVKrRQc6UJxGmytM?=
 =?iso-8859-1?Q?GPDrPPqy2wMBJz4G8jc/tFtmniz5UlFBio4flBx1TZp+BkPciv6GK8oY4I?=
 =?iso-8859-1?Q?49+sFWc3TxjAhPH8EiDuXRJI4h66TlOOjAq7TraXnB9csynfoiu1vWPs20?=
 =?iso-8859-1?Q?OVJMxHrskIGyBaslh2NmpGQ++Vp+iP9H9PfkA4HtUOq3AAO88ykm4zqJzz?=
 =?iso-8859-1?Q?sdjMvwX/gqWDxjdWSXcbfStIW+h/n4fZ32rrADWZ93RBmoki3SbTZZzb8C?=
 =?iso-8859-1?Q?dIRpE38701xwLAZuOmHN9/M9c0NRmvsLO5rgXzYcTtWSA8p59MHPLAy/+i?=
 =?iso-8859-1?Q?HwisUB9/2xK1XPl+rE68fov5Ch4SpEIe07k/9wmuplat9Y/KNqB2xjztFc?=
 =?iso-8859-1?Q?AdESrP+IAqwqm19jn3ZXo8XTkjci+x+RIEkjy533uxqQP5Vt7/JRCrZsLm?=
 =?iso-8859-1?Q?x5CtdqTHnL2fvGNxgTSWgnGH3xs5BVDHj6HKGkgikjpNemU1CRA/PVz0xl?=
 =?iso-8859-1?Q?I92LVG/jPtQeRhMJVCPQZGYjsl3WO+VNRCFxpB9LIWwAaiXJw9kSBeFs37?=
 =?iso-8859-1?Q?iRkPJyvMh9U7BvPOw1xn4VtBaUrQvViBhKs69uq0NuWmYCb3qa5RMAaKoQ?=
 =?iso-8859-1?Q?9jSCUmF4KxiL+detj3xG+z8a2Pa6QB2RkGWfb1qCHntG7r1AjFIE5mvE4u?=
 =?iso-8859-1?Q?5XjrI6tv0kwVQI9L2xyheTtPhis8MkXFsbcpimHJEX0FUi79qDJwdjtYx6?=
 =?iso-8859-1?Q?vpUSnvtrnsXKSJ84TLE82xOWJb1C7hc/WLT1Zla7ksj40oYzPkyA5eOcyg?=
 =?iso-8859-1?Q?nKGE1XAQiNHIzqxba1Ef0mDNNMaPWCbjq7MscEtC5k/4C1oJjtH8jMjM2q?=
 =?iso-8859-1?Q?SPqEZpNOVu4wC1b7fy28hGHwqW43lN0uPURshMXqdrfK2xbfV0ZdhKtPQI?=
 =?iso-8859-1?Q?4tDcOUlHvUooGT5T3M3EsoLVXnZdR33qG7MrP8+4fFL0wOwGFyBz15MayP?=
 =?iso-8859-1?Q?ikQ/v8rGXwpDZG+BZj96eBpm+KFBpBw0hVjVHh3zYTMyhv8lmTa7/KFYca?=
 =?iso-8859-1?Q?ofVFP2s7/frsapnEJy/tBJ1KNRHL+iY15KVSXadiZOdqA0x6sxEq6JBOOW?=
 =?iso-8859-1?Q?hx4WoSlEhpu4WwB4M+Np0blN94qzJCKZ70j3uztFxbKop/8uOPPfd09zwr?=
 =?iso-8859-1?Q?Uu8+ghrcE+uwlI9gZBMKRPi2Xn/IDnkE7IrHkh2V4BKJjR8=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32eb075a-b75f-4324-13ad-08d8e3f9b4de
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 19:21:29.2350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XlSZPsX261xS3tzdGDQFjrRnTBIjnKrtK7cYKXGjBtwL2XWLzZl148XN6x7Uc8LU1byuZyQ2ddilahHZTKUNYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2645
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.21, xbe-aln-006.cisco.com
X-Outbound-Node: alln-core-1.cisco.com
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Bruce=0A=
=0A=
I've just found that were working on the same reproducibility issues for pe=
rf package. You fixed that in yocto =0A=
http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-kernel/p=
erf/perf.bb?id=3Ddea57aa1cd879df4feae1b9595b38c5b6ff74574=0A=
i prepared a patch to kernel that i want to send to community, maybe you ha=
ve concerns about this.=0A=
=0A=
Regards,=0A=
Denys=
