Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5C3EB4906
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 11:15:13 +0000 (UTC)
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43231.1770894912524571237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 03:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Gys3uGFu;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14541; q=dns/txt;
  s=iport01; t=1770894912; x=1772104512;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=hOxfE59kRXyghMfUKpFb1t88B50ooG3oxbPnR78Yi64=;
  b=Gys3uGFu/9scn2hPPX1KMQl/detsm0XYqB0AZjnidwVDctJigBuLJf0Y
   fBnSyeBoFib0Bz1Yi/xFrBIM20/1tgGYm0IqpJvNk5ZoYSsgtWJclvrzx
   MyopPPKl3ln0H3U8VUPP9RNIxiqJOwfOvUPy+YWDFpvkv6flzkcb6taNm
   oLnp15XbFDSQv35FdciLU5OcTmZ98nB5Ak/6/IdEVY5HO49SPBK/8rflx
   0rf2sI6AeiTZu0HcJwZwWiYVISQDbLwEXbdABDebpSzH8q4Au6ekLBCl1
   Yh/Bfzv+i72vFf+ZBdk5Faj6Dff+MNyyc4pxVXyAA43k5/Y0VGNh4bz8r
   w==;
X-CSE-ConnectionGUID: T40mAiJFTeitRT8veq8T3A==
X-CSE-MsgGUID: GgaPxS44SGuNSeeS4RpJ/A==
X-IPAS-Result: =?us-ascii?q?A0A1CwDwtI1p/85K/pBagQklgSuBPTFTB34CgSFJiCMDh?=
 =?us-ascii?q?SyGCAGaNoZXgX8PAQEBDgE9FAQBAYUHAo0dAiY0CQ4BAgQBAQEBAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZdFmcSAX8nBA4NGoJhgh0WQAMBA?=
 =?us-ascii?q?g6deQGBQAKKK3iBNIEBV4MDBQkCQ9t7BoFNiDgbASpJawGJDCcbG4FygVeCN?=
 =?us-ascii?q?4NQBBiBSIQTgi8EgiJ6FB2TS4FEIgMmMywBVRMXCwcFgWYDgQZuMh2BIz4XM?=
 =?us-ascii?q?1gbBwWIDA+JDXhuPmJwAwttPTcUGwMEgTUFjV5bQYFBgiyBG4FNolCOX5UXC?=
 =?us-ascii?q?iiDdIweiAQHjWUXhASNE5lUmQaOCZVghS0CBAIEBQIQAQEGgWg8gUcLB3AVg?=
 =?us-ascii?q?yNRGQ+UIL5oejoCBwsBAQMJk2cBAQ?=
IronPort-PHdr: A9a23:dg5CUh2SCwDpvv7zsmDPmlBlVkEcU/3cJAUZ7N8gk71RN/7l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:/QNd1q35MB+FSq/nfPbD5Y1wkn2cJEfYwER7XKvMYLTBsI5bp2MCy
 2RLXjzVaKqDNGf1eNx+boq08B4Aup/Wx4I1QQBu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 Lsen+WFYAX7g2QtaDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGMB1uOKQZ2MhLDGBSz
 8BINj0UPizYrrfjqF67YrEEasULJcTxeYdasXZ6wHSBULAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NEqojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjOazaIKIJobiqcN9sUmRn
 nL9ozjCLQw8D9GS8ma/6lDrr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/KJpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfQ9/vBDj10u7rTQnWYnop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:s/ncT6NGFajO08BcT5X255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UossREb9expOMG7MBXhHO1OkPYs1NaZLUTbUQSTXftfBOfZslnd8k7Fh6JgPM
 VbAtVD4bTLZDAQ47eZkWyF+r0bsaC6GdWT9JzjJgBWPHlXgs9bnmBEIzfeOHdbACNBAp00Ho
 ed4M1omxqMEE58Uu2LQlM+c6zmvdPkqLLKCCRqO/cg0mazpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyzfHvlWjoah+qZ/E8J9uFcaMgs8aJnHHkQCzfrlsXLWEoXQcvPyv0lA3i9
 PByi1QfvibqkmhPl1dkyGdmTUI4wxerkMKDmXoxUcLlPaJBw7SzfAxwr6xPCGprXbI9+sMrp
 6jl1jpxqa/Symw0xgUI7PzJklXfo3emwt6rQYe4kYvIbc2eftfq5cS81hSF4pFFCXm6Jo/GO
 0rF83E4u1KGGnqJ0wxk1MftuBEZE5DVyuuUwwHoIiYwjJWlHd2ww8Rw9EehG4J8NY4R4Nf7+
 rJP6x0nPUWJ/VmJ55VFaMEW4+6G2bNSRXDPCabJknmDrgOPzbIp4Ts6Ls46em2cNgDzYc0mp
 7GTFRE3FRCMH7GGImLxtlG4xrNSGKyUXDkzdxf/YFwvvnmSL/iIUS4OScTegub0oEi6+HgKo
 OO0chtcozexEPVaPR04zE=
X-Talos-CUID: 9a23:9Dede2FNeKxbwpllqmJbqBYRM8EHXEHQzWvqHx+mBH85dOa8HAo=
X-Talos-MUID: 9a23:5wXF9wuh8wEDbnmwDs2nqz5rDNdTv/iVJ10rqpgLgJW+LQ43EmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2026 11:15:10 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id AD0741800022F
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 11:15:09 +0000 (GMT)
X-CSE-ConnectionGUID: rvT603DoSS+GiRDmnqULzA==
X-CSE-MsgGUID: hMNgHac0SIeDTVO8SxivwA==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.21,286,1763424000"; 
   d="scan'208,217";a="49849509"
Received: from mail-bl0pr07cu00100.outbound.protection.outlook.com (HELO BL0PR07CU001.outbound.protection.outlook.com) ([40.93.4.0])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2026 11:15:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/ROx1Z2929Y2jFrfJ/SvvlBeK+XTQiyCNdQ2cH3uWI8Pc8K4rP26JOmnPegbtYGQCTeoSDMJx0vpOjGnRJfkJSyFayZANlL4d/k1jc8OTzWVFhFPPMqlS0vzx0xT6rTicPQKzmIhktz7f8QVXteu4ZugIDbhsHqP9vNZr1xD74rMoV/LLfEDCQNSj6a+u+RlrjmLNsmcWNhE8VWqEO9MoWik2tXSkDevrM8ZBAIS1d/FIKjMcLu6SgF2xy3e+4NjU02Mks3dPCCnCa0GGP5fz7236LC/IkRyiEVy64IKztkiv5CkkDbATEdH507o9IhTUOHDHmRt7YkSzLNndXLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOxfE59kRXyghMfUKpFb1t88B50ooG3oxbPnR78Yi64=;
 b=FI5CHAuipsYKxBIWvmbFeqIExqT7QvyNelev4YTZMNFK7O0l22Vkqq+Fo3tA/j+odPPag5Bx6FE41OxYcjefEG05Gr9ldl5akDIpWLfitfSNXkBPfxKfKFUXzl/M9Ttb3mLHj2roTjet0b9Rg2UJNXU6G7fjH9zyEeJEcMwGSzpXtRpCm4m6IUWUoDbO1fLmQQ28ecPTbmY9Bln63AF2NWkVmu0v1Hxt9LHcLcXQWUdWgvYYeoEOPDFQEXlVHhADFbTZG8ut/eC4dOj3rNU2C2SLUEN/d55x9TnI0ZMORAOSs98mx8BAZPNKCKFPXZpT4HK8fPrNDh2oBhbOFLfspg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Thu, 12 Feb 2026 11:15:06 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 11:15:05 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "Viral Chavda (vchavda)" <vchavda@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Clarification on handling recent CVEs for go-binary-native package
Thread-Topic: Clarification on handling recent CVEs for go-binary-native
 package
Thread-Index: AQHcmz3Uc2l4M2cpEkS/QXc4ClL57g==
Date: Thu, 12 Feb 2026 11:15:05 +0000
Message-ID: 
 <DM4PR11MB6189CC7075F52DA63D8CF527C463A@DM4PR11MB6189.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|SA0PR11MB4623:EE_
x-ms-office365-filtering-correlation-id: 10716d5e-66aa-4585-c00d-08de6a27f9be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|8096899003|13003099007;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?dvrzoYNRu5KYvvZZxMXbV8/HrapKZy5VmWh+O0fs5qPvd63sfbtYM08w?=
 =?Windows-1252?Q?6RQf6yhK0qM1HKzzA91odTV7SdfvYyuMAoFnpjK00Owb2iPYo4IS+vkH?=
 =?Windows-1252?Q?K0031IZwosHGOC9gjRIPABSGpGnKRSyMElXUsJKa4QJP2gU9U2m/8dP9?=
 =?Windows-1252?Q?phJUbpVBdbgkWIVAJnUVHMkVSjh1dzcFHGqklpbVvb1SLK81wi4D8VhC?=
 =?Windows-1252?Q?1izZkaG9DjmDf4nxfC/zdI+KGs91OZKQYTGMmlaQxS2fWwutUOnYJ25F?=
 =?Windows-1252?Q?gFNXWBdQ2s4ZVJGoDBTStIYNjEYFRGVjUyyYuaLniLpxeo0TbK3mlCmR?=
 =?Windows-1252?Q?DxGZFcLTyMGbUVqmA84jJ2pnc6yzYSrgcLFVh/spopgL+Y6eQyzsR1KV?=
 =?Windows-1252?Q?xfPg3E8CQrRev5TDiKjyOCBTkpvXotxIWZLC8Fq5ntTQ3OeVNUpYtHvc?=
 =?Windows-1252?Q?5OubAJ128df0cYjd4kXy585cWOhvXpIl2PuRRL4Tk4JGmxN1xFA8lNE0?=
 =?Windows-1252?Q?+Tj+TE24azALagdFF+Y8ErGN134RytRtzica5M/JGEmOVxTHa5SrfNOW?=
 =?Windows-1252?Q?kssPjHNJqigIMnD0Z1MStcVq6oK5VMCic7Cua1yuJ7oaaHQZ1QY4E5RT?=
 =?Windows-1252?Q?yWwFKoY9mNXwVQwPyrdzQTykaGjcyFnyn/rIS1TA6SPrwujicGUonuSg?=
 =?Windows-1252?Q?8b4fWxV65+BkGJTHzLAxYhty+kG0wE0cQqnTG+N9VS288iXYjyvQNKMU?=
 =?Windows-1252?Q?v4ONvkDm84qsYcBj+KUjifpldLgLjIhV6iwuxqVRF43ZeD+ScWVpzG0T?=
 =?Windows-1252?Q?HYCJ6r8YEa9ko28rWDO3vMXPfWlZnsBLxbi4LOJr8OA1EcZnt12CJ2ro?=
 =?Windows-1252?Q?2W6RLaxmVnjTsJnJ0K3WmrWZxny5x89q/dI23Q4zwq4nVYHUlKoIslO8?=
 =?Windows-1252?Q?VmQtR0hHWKvlHb6NtC0V0dZF/1eIrUcM3yRMxYaC/nTTEz44nShSdVXn?=
 =?Windows-1252?Q?mV/8IlTxxVitKYWZ5wjktYDmVD5/8lxkZgR7sZw5QPCxgM3dmfhfBzou?=
 =?Windows-1252?Q?2fxMPnNoJFl9e0pc83RDUQyOtcGh0ROCyjDg0tGnOh/SE0+aK8zZBpZO?=
 =?Windows-1252?Q?iALKd6bPKy5wM9h7OmOmaKOmAcdcCugxhDY5ZRcG+dJOxjtk6qUIF5Js?=
 =?Windows-1252?Q?oZCWEMkrQ39TE3z6un4088QDg0bwASfRWlSZ9ChkXXClEQGAc5AR8tOo?=
 =?Windows-1252?Q?gmCRkuAOe4L6R8cKyGa472PnW7qMon3aPUiArbeCfBDRWC7T1gcPFKJO?=
 =?Windows-1252?Q?i/YNP49/Sd3Q509vxhqLiuqwuFso2cOtOccvNOP1yCY3A4G9NjQLzaKY?=
 =?Windows-1252?Q?LDe+Ixj3Lt4S0AJAYQUYBGak00wvkNWaNW41rOatNcaRm8z7sJLAxyoN?=
 =?Windows-1252?Q?GOIED05f/ZTs/MCUSCRzdueuhWBuTSWZfpy4u8qmca015tjh1pQEokzZ?=
 =?Windows-1252?Q?gZSkbg4xBo9TEZjAVd1kT033aQN+Kl/mScOu0UJE4Asd5CUj9MD6GZV+?=
 =?Windows-1252?Q?a/48EUjDYnVy8fyIe0Bzlwtmt8HL+5QyM7xICeeWKQFmBnyywfeFn4Sw?=
 =?Windows-1252?Q?5rJuzvuXF8Rqfn3PI+IJelgRWVn4KcsNDQOopCsH2lxtnGUFR6XlqUdN?=
 =?Windows-1252?Q?GT0G3DVHTad/eYnMRF4L6IC7YmjFTanA81gMZ2ILBovAWNiEgqRrMXmm?=
 =?Windows-1252?Q?uAdSNtzFDJpomHTAKU/ClWNpEz4NBlc5p56/XwqV?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(8096899003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?fr+Z0Ii+yYDZ+ASOLRMsX+8RDw05fVIMuW3XWjRh0IPS66nbB7Ze1KY5?=
 =?Windows-1252?Q?+ojkdmlkP1+sWXYKRZ3YnZK3/HX4flRshyZbb1ItGYUBiUu83B0OH9Bq?=
 =?Windows-1252?Q?PWnsv9S1oRUQg0j3TNs3uOMxDIc+92VxpfOsbbrt1VUW/udNtKWcxVFg?=
 =?Windows-1252?Q?RruKp58Gz/VS3ZmDjzis7W9XgKNMW00RUnbyxhTjv0XGg+oyBaFj4wF1?=
 =?Windows-1252?Q?S5/KHnk4HPBR/mz5uHX/M1ypXIMq8nusvxUXwhoHM7rRcVfW+GAa6++j?=
 =?Windows-1252?Q?sG4sjk98ap8IKcESVqzOx9tRHMgv041bAd5GvDRBXijlteak7sq1/0tb?=
 =?Windows-1252?Q?kp4mjgrn5zOWM2NoLYvI+CUygtnwrmJPIc3PBbnIpmwxehA7xV99V8/Z?=
 =?Windows-1252?Q?B2u3Wsv1KAXLdDX2S/OGhZGet/4lWdzCjzeU0TTx0SXPo5/n0ckraw0Z?=
 =?Windows-1252?Q?GHvNNMGIzCfBVUonhN5IsukrioSLPWkPdPvgzpPG66fCilQSV0sxtKJj?=
 =?Windows-1252?Q?P8MPkrFPQ+pK+qwg4GgeMI+Yl7sHnMCEJ1R0Jfp6HF8ayh5hQPDnIqd6?=
 =?Windows-1252?Q?ybuJ0xKTLui3lQnSat235MqE2dfWS7MXLsKIeZ8gvOhcIQ2wFNOOUx/1?=
 =?Windows-1252?Q?tNbHenO+550OSeiUGQeMDUphw6oIN5UCbst7AnMPJYLjURw47Joi3mUJ?=
 =?Windows-1252?Q?GB/+iJoN8dXftIg8RBCsartelz1DRaMIUHIsIB8hXXvARx4LqdI9jTi8?=
 =?Windows-1252?Q?B5t/oKusrhHJ0Tjna2mj3CXsEfaNjmNQW7mydfo/o6XHfGUv0g+BZ/Vt?=
 =?Windows-1252?Q?nFAdzrqZMx11147mPtrnFZfpPqaAnu+CtakEKPQM9Y0TsF9pSGZU9g60?=
 =?Windows-1252?Q?L61Loxeh+GkTYTCu89xFhCsiC2ORZOlV3pGt0BhCgSM24X0IHqnz4iIy?=
 =?Windows-1252?Q?BN8OhYu5IFQRRsPllwyXmOXVSlylHQD7KH9AV7q5geY2g83d81W+8gnU?=
 =?Windows-1252?Q?kgsaa8ejsl3mmW2ntVoExSNAp6BUCbLIcCdGbblPX0oKv7PpnsAYn+Gx?=
 =?Windows-1252?Q?1Qaa+FyuvhRL3/QYjuqWpIf9USXt/X/RE4KbIS6FnW4Avn9y8nuRB29n?=
 =?Windows-1252?Q?joUEEe0vJ8W3jSJwYeeBxnt9+QhuY9K6r74YuFKdpgJl+/hClNlj7jQ7?=
 =?Windows-1252?Q?K4UFY/j77ZCnnw3GG18s8VOxTvglOVrBaI01b0ZKBV20SZS4SWPmZ1yj?=
 =?Windows-1252?Q?QKGetfwKhLmsHETIkRGP7Qv3R8O7mgXhfPczThxqEvT16lkai/TDKarN?=
 =?Windows-1252?Q?5WP7rkFi/0j5ePlQTQJZJ9qd1qsNhuvl/x+14p11ijeKgN2DW691KNae?=
 =?Windows-1252?Q?tuyPGdm8bHqIoJZYs1D879QBC18bOd0fEVlnJDdtt6zrwTJZOk8/DZuz?=
 =?Windows-1252?Q?hfrk6SXLAa9qIMlRlVbjguegxho3GIhp9leXvzTK+6l81vMlWvahLegJ?=
 =?Windows-1252?Q?Mo2rWs7S3DXCPc/9vwb1cS/hpKBvs1UjY97ASf9W+VE7NxaVVJGlCgYj?=
 =?Windows-1252?Q?XRber2O9UDOAUAf1zqtSqbC9XujVHUo1DUuHTdPdNACu+BkfcuQJ/iN/?=
 =?Windows-1252?Q?QWAxTMnmZw6wyMmaNkNuh1PW5Ca39l3UvC60p85pY5bCU4MU7XM8M6FU?=
 =?Windows-1252?Q?BJS+FxCzaZXSDy4sO95SXUJMDAry46AliP34HXVJ8gKZzwpYlHY3Clb0?=
 =?Windows-1252?Q?fTl6fsax0677hc4ULUt5XMwcX76pkFsnr17By7QH1lbIXZR6SX/96I99?=
 =?Windows-1252?Q?EHPn7DIt7helZufUKFEwoh56JQabcEqaBGRPUZjbB4Lgx94j?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB6189CC7075F52DA63D8CF527C463ADM4PR11MB6189namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10716d5e-66aa-4585-c00d-08de6a27f9be
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 11:15:05.8930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pcj8P6MsOQ/JooO0vZKoNxAbZVnyDPGiyMkKJqriIPWVWIDjIwQ09gU5yBsJuT6XH73tH9Jf7mVopqSBMO9nVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 11:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231022

--_000_DM4PR11MB6189CC7075F52DA63D8CF527C463ADM4PR11MB6189namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello Khem Raj,

Several new CVEs have been assigned to go-binary-native package (as listed =
below). Based on the recipe, it=92s been observed that it uses prebuilt ins=
tead of being built from source code. Can you please help to understand the=
 procedures and how we can address applicable CVEs for these packages? Do w=
e have any identified plan to address it?
CVEs affecting go-binary-native:

  1.
CVE-2025-4674 (CVSS 8.6) =96 https://web.nvd.nist.gov/view/vuln/detail?vuln=
Id=3DCVE-2025-4674
  2.
CVE-2025-47906 (CVSS 6.5) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-47906
  3.
CVE-2025-47907 (CVSS 7.0) =96  https://web.nvd.nist.gov/view/vuln/detail?vu=
lnId=3DCVE-2025-47907
  4.
CVE-2025-47912 (CVSS 5.3) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-47912
  5.
CVE-2025-58185 (CVSS 5.3) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-58185
  6.
CVE-2025-58187 (CVSS 7.5) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-58187
  7.
CVE-2025-58188 (CVSS 7.5) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-58188
  8.
CVE-2025-58189 (CVSS 5.3) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-58189
  9.
CVE-2025-61723 (CVSS 7.5) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-61723
  10.
CVE-2025-61724 (CVSS 5.3) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-61724
  11.
CVE-2025-61726 (CVSS 7.5) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-61726
  12.
CVE-2025-61727 (CVSS 6.5) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-61727
  13.
CVE-2025-61728 (CVSS 6.5) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-61728
  14.
CVE-2025-61729 (CVSS 7.5) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-61729
  15.
CVE-2025-61730 (CVSS 5.3) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-61730
  16.
CVE-2025-61731 (CVSS 7.8) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-61731
  17.
CVE-2025-68119 (CVSS 7.0) =96 https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-68119
  18.
CVE-2025-22873 (CVSS3: 3.8) - https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-22873
  19.
CVE-2025-61732 (CVSS3: 8.6) - https://web.nvd.nist.gov/view/vuln/detail?vul=
nId=3DCVE-2025-61732
  20.
CVE-2025-68121 (CVSS3: 10.0) - https://web.nvd.nist.gov/view/vuln/detail?vu=
lnId=3DCVE-2025-68121

Thanks for the guidance.
Regards,
Deepak Rathore


--_000_DM4PR11MB6189CC7075F52DA63D8CF527C463ADM4PR11MB6189namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hello Khem Raj,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px 0px 16px; fon=
t-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetic=
a, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
Several new CVEs have been assigned to go-binary-native package (as listed =
below). Based on the recipe, it=92s been observed that it uses prebuilt ins=
tead of being built from source code. Can you please help to understand the=
 procedures and how we can address
 applicable CVEs for these packages? Do we have any identified plan to addr=
ess it?</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px 0px 16px; fon=
t-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetic=
a, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
CVEs affecting go-binary-native:</div>
<ol style=3D"text-align: left; list-style-type: decimal; flex-direction: co=
lumn; display: flex;" data-editing-info=3D"{&quot;applyListStyleFromLevel&q=
uot;:true}" start=3D"1">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); text-i=
ndent: 0px; line-height: 1.5em; align-self: start;">
<div role=3D"presentation" class=3D"elementToProof">CVE-2025-4674 (CVSS 8.6=
) =96 <a class=3D"OWAAutoLink" id=3D"OWA1ca65b70-2398-03b0-72aa-f6b65488c9c=
6" href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-4674=
">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-4674</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); l=
ine-height: 1.5em; align-self: start;">
<div role=3D"presentation" class=3D"elementToProof">CVE-2025-47906 (CVSS 6.=
5) =96 <a class=3D"OWAAutoLink" id=3D"OWA03eb7f5f-f911-91b1-39a2-4ec6d8a647=
c3" href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-479=
06">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47906</a>&nbsp;=
</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); l=
ine-height: 1.5em; align-self: start;">
<div role=3D"presentation" class=3D"elementToProof">CVE-2025-47907 (CVSS 7.=
0) =96&nbsp; <a class=3D"OWAAutoLink" id=3D"OWAd648b0f1-8296-0aca-a4f3-a322=
76fcd43c" href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-20=
25-47907">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47907</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); l=
ine-height: 1.5em; align-self: start;">
<div role=3D"presentation">CVE-2025-47912 (CVSS 5.3) =96 <a class=3D"OWAAut=
oLink" id=3D"OWAdd1864ae-ee5d-c2d3-c187-ffa55eed96ac" href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47912">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-47912</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation" class=3D"elementToProof">CVE-2025-58185 (CVSS 5.=
3) =96 <a class=3D"OWAAutoLink" id=3D"OWA52e020ea-8789-fa5f-a93e-4de70d33d2=
f9" href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-581=
85">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58185</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation" class=3D"elementToProof">CVE-2025-58187 (CVSS 7.=
5) =96 <a class=3D"OWAAutoLink" id=3D"OWA3b049d8b-dfbc-c545-b452-0db3658eed=
8f" href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-581=
87">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58187</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">CVE-2025-58188 (CVSS 7.5) =96 <a class=3D"OWAAut=
oLink" id=3D"OWA1f4c4514-a4d2-872d-0423-97f2679ffad0" href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58188">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58188</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">CVE-2025-58189 (CVSS 5.3) =96 <a class=3D"OWAAut=
oLink" id=3D"OWAb1e0ec13-4e18-11a9-de6d-9f00af3ae02b" href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58189">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-58189</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">CVE-2025-61723 (CVSS 7.5) =96 <a class=3D"OWAAut=
oLink" id=3D"OWAa19e3313-c643-b167-b907-28bfef219c30" href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61723">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61723</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">CVE-2025-61724 (CVSS 5.3) =96 <a class=3D"OWAAut=
oLink" id=3D"OWAedb52fb5-fd50-88a8-ab42-7c239a83375f" href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61724">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61724</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">CVE-2025-61726 (CVSS 7.5) =96 <a class=3D"OWAAut=
oLink" id=3D"OWA35b8ed61-7426-8373-2906-abce07c55d53" href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61726">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61726</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">CVE-2025-61727 (CVSS 6.5) =96 <a class=3D"OWAAut=
oLink" id=3D"OWA4954b624-f264-158b-b67a-5a225347140b" href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61727">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61727</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">CVE-2025-61728 (CVSS 6.5) =96 <a class=3D"OWAAut=
oLink" id=3D"OWAcf766b56-f631-f45a-12bd-9ce27067e6e1" href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61728">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61728</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">CVE-2025-61729 (CVSS 7.5) =96 <a class=3D"OWAAut=
oLink" id=3D"OWA21d344e7-b9f0-122a-6999-449a0e1536a0" href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61729">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61729</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">CVE-2025-61730 (CVSS 5.3) =96 <a class=3D"OWAAut=
oLink" id=3D"OWA401e0b88-fc2c-149e-852f-5f6d32f4d363" href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61730">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61730</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">CVE-2025-61731 (CVSS 7.8) =96 <a class=3D"OWAAut=
oLink" id=3D"OWAe34bb81d-6c1c-b9fb-45f2-c61688a285eb" href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61731">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61731</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">CVE-2025-68119 (CVSS 7.0) =96 <a class=3D"OWAAut=
oLink" id=3D"OWA952d0b72-9f9c-bd94-dce5-abacb4ad9cd3" href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68119">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68119</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation" class=3D"elementToProof">CVE-2025-22873 (CVSS3: =
3.8) - <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-20=
25-22873">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-22873</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation" class=3D"elementToProof">CVE-2025-61732 (CVSS3: =
8.6) - <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-20=
25-61732">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61732</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<div role=3D"presentation" class=3D"elementToProof">CVE-2025-68121 (CVSS3: =
10.0) - <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2=
025-68121">
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68121</a></div>
</li></ol>
<div style=3D"text-align: left; text-indent: 0px; line-height: 1.5em; margi=
n: 0px 0px 16px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServic=
e, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" c=
lass=3D"elementToProof">
Thanks for the guidance.</div>
<div style=3D"text-align: left; text-indent: 0px; line-height: 1.5em; margi=
n: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibr=
i, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"e=
lementToProof">
Regards,<br>
Deepak Rathore</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
</body>
</html>

--_000_DM4PR11MB6189CC7075F52DA63D8CF527C463ADM4PR11MB6189namp_--

