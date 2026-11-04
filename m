Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4867.1793755829971967643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 17:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=h7ngMZ7z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: roshs@qti.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40Rws63868170;
	Wed, 4 Nov 2026 01:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vFueuo8WviG66wSkpFT1TH1c
	JP8D0DDHkLaspErcum8=; b=h7ngMZ7zGamcpUF8NUNNFloSVIyJl7jLPX+Awux2
	70gCq6hkW6CbbQXNzaCzZEJYqrpUiN9I9nbBc5FdvTJHp4nVrcrZgwhg/dz8g7D1
	TeDO+dHbhutjE2kkkeNAiWl1vHxdcFSrCr/58en5H2VohWEGOw6gq2C9yw2B+HLM
	+EcJFI8vi2kDW6OBXn3+kD5O2jfs2wtaJNAU3y2jaq+XWjzgSRizW7GzJydtETiC
	ZITcdWYvjl+75Wco/L1W+jssX+K+PQSB3jWj9H04JuT7iIc7LTXv5EVj3d5kXF/V
	Tpd4eT/WwFD7tb5P6urLcO2iPFEqiNua65p6rWrhL+0cyg==
Received: from bl2pr08cu001.outbound.protection.outlook.com (mail-bl2pr08cu00100.outbound.protection.outlook.com [40.93.4.8])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y1a35-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 01:30:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3X7X5qAbP9r4+TVHoJanm8Nk4UOYJ/dDu88Fqe1QdIzwajDNUVhrkNc0dEFmRTtlXuwjLWIaR21p4YlK5zLmeF4uhusB3d177gYYteVcNQw3fx7eZIr5CmY1g8b4fDdW1Gqm9SN6WUqcX7Gf1RnK5qQQISuG5aSGiVxN3hzEnl7U5Dmn6tToYSxWSqrPuRgLruAozEsA98wCKh9OrUJrK03Xx3xweyS0ntle3S6EM3p1WieXKqDSZSh3LNtPn/8J+QXBVGCvL5DhN7pVaXGh4OkGoJsiI9pTYKZmOZNtlH5J9IkhGsQnhzdYzfZ7BW2TnU6tMX0D/4nPa9D0g1/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFueuo8WviG66wSkpFT1TH1cJP8D0DDHkLaspErcum8=;
 b=ZzARch9fuih7f+UKJuQPCN6/7pEqVsu45s4pYwqiKyYDqQ3CXQ0NUM+5PfXW/177MXYfrgjXzzea+cUr4gkvW6PrDzoiuXDxMfmPI39nz01fyft2wepH2i+hBUX0dIVqBH3m6oagliHINxEqevqNAu+Y9eyR2bw9JDK7wYjUS614rjes4wWrLBpWm9GXKtReX8DVNAk5u0E6uaXZvKEuHB8q1BqsGLrtFyAs4wIUxDTc/UQTWlCjxNLyMIjnkGzbxzeVusW8i17IMPita4R3/Re88dvvIzgDqvbKz6qijUJMDtmrX1S7A8zl33oftaKpynCSYQt5IKM70MYHW/jh+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DS4PR02MB11190.namprd02.prod.outlook.com (2603:10b6:8:32a::18)
 by IA4PR02MB10834.namprd02.prod.outlook.com (2603:10b6:208:5d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 01:30:22 +0000
Received: from DS4PR02MB11190.namprd02.prod.outlook.com
 ([fe80::aba2:f69a:a7c6:95ca]) by DS4PR02MB11190.namprd02.prod.outlook.com
 ([fe80::aba2:f69a:a7c6:95ca%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 01:30:22 +0000
From: Roshan Sivakumar <roshs@qti.qualcomm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Roshan Sivakumar
	<roshs@qti.qualcomm.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        Bruce
 Ashfield <bruce.ashfield@gmail.com>,
        Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>
CC: Sumanth Gavini <sumanth.gavini@windriver.com>
Subject: Re: [OE-core][PATCH] kernel-devsrc: drop unused scripts/mksysmap to
 avoid sed dependency
Thread-Topic: [OE-core][PATCH] kernel-devsrc: drop unused scripts/mksysmap to
 avoid sed dependency
Thread-Index: AQHdau12MbSJt3aUZU2z3LqfV6KD2bcdIha4
Date: Wed, 4 Nov 2026 01:30:22 +0000
Message-ID: <DS4PR02MB11190D3AA58D06C430BC4203687682@DS4PR02MB11190.namprd02.prod.outlook.com>
References: <18E449B471A74413.164306@lists.openembedded.org>
In-Reply-To: <18E449B471A74413.164306@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: alex.kanavin@gmail.com,bruce.ashfield@gmail.com,peter.kjellerstedt@axis.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR02MB11190:EE_|IA4PR02MB10834:EE_
x-ms-office365-filtering-correlation-id: ef5c4e5e-4821-4908-8d6e-08df3a1331f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|10067099003|22082099003|18002099003|8096899003|5023799004|56012099006|11063799006|261022105027099003|261009223027099003|261021121427099003|261026140227099003|261102123227099003|261022115727099003|261026121527099003|261028144727099003|261022075727099003|38070700021;
x-microsoft-antispam-message-info: 4074gnCsZ4QtYTZR+8Q/ODAw5uVc8+0r2LOgBUECI3tbfvUrAv2P2pMbY+Ut3hG3Ix1c+ms4M1YT10978nYxjssj+iKLGvWTkfxxvkGoXwocvP+N3EY0oF1OzzU31jgm0oPx6bD1MxEfi51o7YE0zoPNZdCsTY/VGY4OIlV5DPsqkK7CrbiNGVl8VYdZQuIFWQdMyFNcrO+0jImKuu5efzqOurZU5PmuoZ4GIv8hFa8q5i3K/EcKp0J3ZoZjw0u11CZYEzZXsxpmLN2ra0SYLkKI6Jk1EDicGZ4/XRY1Yy6ZrVA33XMpjejX33ub6gzmrBzqM4/OyrwqOrt853BQZziNas0UflZzFHKe0e62akRhHrsU5MASmOvcHjH5/9fcIU7A0cGoUR8qgH6umhHurKEIWIQHLKweG75U2G8qF89+HA6PDNoNbc0R5uBMqVt42VIGblUc3WNtFZnyJcDZ2t5ec+zjTCAfUWw5JYCG7Cv62SmW5/p6vaygrb3nzcoIZjQP4+01otuoQDqoycusKIfB/SoO6cU3FfTWbPF68qQ3+vebfj/X5/WDCKAC4kmUWNspbHtAk5I7TwsYhLmJu2YU8419qVbhWd4qiXTTji4oYQAj+fZ/Y7qb1S3o9QXPn2tPafcf17u95nz+OGLahlTtq+PYna4NhbwQCxGwrzmpTthgwBFXR2rH6/Q93Z3pVu8JP9noD0TtjNXhbuLVWftGOKg09aYFR0DSTNhpJ+4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR02MB11190.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(8096899003)(5023799004)(56012099006)(11063799006)(261022105027099003)(261009223027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261022115727099003)(261026121527099003)(261028144727099003)(261022075727099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sJpn/4iJHn2XLS38UIVPoNz8yOinwoQ9P8w8TZy2IB+2wikV9XoStQv2iqL4?=
 =?us-ascii?Q?Rh3OXc/SN/BCwiyQFwq9LwjGWoyxxaNvGvKGGlDKnlwylEYHprsJcvBZb899?=
 =?us-ascii?Q?Zo7IkpxRKWvDD+1dVuEjF2ygpUWCqik6NzMeSQfJSoMxLQsIz61ZfjamkPS6?=
 =?us-ascii?Q?RsEDIS61BgZaL35lFtQCrUdK+aNEJWNB5PBkV8LFGFWYRT6WNg/okVlLYH9i?=
 =?us-ascii?Q?Ws39/b0FWDdPjl0dWfk2ujEPawT6Ae0j0DXvMc7hQ/pl4nLNERb6l93aEgtJ?=
 =?us-ascii?Q?pxfbsruv5lAycKsIUq+rHnxfV3bjeNpJk76GxIrYKZON5Zg27MHp08uZU5fj?=
 =?us-ascii?Q?WGOyAH5syIAEgn5ZIYKmfBJWdTgrgr+yqO7j42D7uKDyQCq8M1zatXaIAo0q?=
 =?us-ascii?Q?rpOiY1RbSnsRArdSrVPHX2NppjQEcOXUc2zBp6l4jR3AMmA0/X3QURA2Tr8q?=
 =?us-ascii?Q?PycMx9kRatX7mu3G+iUQLXF45QatebgVPwvU0pFYNTJoH8vMwesNZweehxv6?=
 =?us-ascii?Q?wN8e3e9Oig4QSLkXWd6Mb3hAhIY5RQHMX0ap12yuL66vp4oJfaeV8BPdLOxE?=
 =?us-ascii?Q?DhA7XsOx6Qdj0me5SU+/BG9938WhzPqweWooyZOsMqLQr7/pJ5awcSdfpbHX?=
 =?us-ascii?Q?ay3fGeZxMUYyCxAzkKS7/JvWZecd4Gmtx9/1tY5k7ToLEJGkpgnoMH57HVVF?=
 =?us-ascii?Q?CYeUCgq0S7OCZQ9Q5AFcEw0UawSlFswpre64MVXpngsf35Gm2B9NH1NbPz5V?=
 =?us-ascii?Q?shC4n0U9UkT7XS81mt8g5aNvsvTcDY9lwCYqzm0SlcwVkagNEyiB1OOW02LX?=
 =?us-ascii?Q?FBWY1TkWlcGPJKP30L34qxVs553j5IEEYsiUFLj40FINcWplvzVK4PF/+jX6?=
 =?us-ascii?Q?mFBZVHHaSe2Nx3g2S7usTpIjtNIGGZ14SQKvY68CcruCU6RvNkmXZj4bNX6P?=
 =?us-ascii?Q?ezzEao4eqkCke/pR0Qij9UcX2T7TfVu6pIMae3VZdjDcYaYGXGdTg/r/An8m?=
 =?us-ascii?Q?CzWeFZcPGv3ao9Xn+P6hJRUVFlRknpwNDww8a9IODtsT198u4hBQ9GVYLVvY?=
 =?us-ascii?Q?dZZNJezjWYFNWiV4ntwrRj0Az/Xh0a9Q1SixD+cSU/0BP9TYZp1DtpZHRcjv?=
 =?us-ascii?Q?siK/HTtvO4a/0qbnypWrPx++KIf24896Lbm1ne7j5quCnjYhNb30z+uXgTNn?=
 =?us-ascii?Q?QGeWLI39c1wWEgUe16tz7pb34BPp+zIqEKWAULlybdODSEVHhQ7OMVHcg4GX?=
 =?us-ascii?Q?+WX1FTx9AZdwP3eF0gUBT2+3lrSHdEjy0jkjh+Ytwpxk/FxCnS7URCOn137g?=
 =?us-ascii?Q?oAon5hR/nv/qKqkEeDbFcTesKziWDzvtV4udL7sQXzNrDj7dB5zm/GIsUIlf?=
 =?us-ascii?Q?qnZRsH2VzVXShSJ4YqSdLDUI0TF53OBXvIxdau6XilqKsjEx2SY7MhtapFxn?=
 =?us-ascii?Q?rCghualjRyTqGiU3Lr00GIiylQHloFDF4zaAOOoSQ/dN2s4shQUZd0MY0T13?=
 =?us-ascii?Q?Eb61uc0OdHrZXJirXGwUGiZv+kijYrYeZmd58DMdVMAAct6/2pEDHskjAhfQ?=
 =?us-ascii?Q?m7dCgr1gKNGKq0J8rbW/sBwJZPUbt3MZeuNMAmALgens/NYPFIEifrFCR48C?=
 =?us-ascii?Q?piokRyopt90dqu3Li52rLyj2hLeFqx0qoRvxER66vmEd/NEz1UG1n++bZLgE?=
 =?us-ascii?Q?L+JDfMmGYGBGKAU/RbhqwAjCKf2fIXhdg4OB3V2+TXcXNQDVBYVabfoJHnTy?=
 =?us-ascii?Q?rqoPdwA/hQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DS4PR02MB11190D3AA58D06C430BC4203687682DS4PR02MB11190na_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VDYQiyYMEfPUFf83K9vvlwYoZuzrPz2Z6ZVLSXxMzNQe/3ZiyN+SrlOV+XkV5V+MkMQSxtPih+hWtzfsEc3n6uAvhTA3lA90NKePtN8zjlcGeiyshErAFONP19J2piXImplEZcG5kaJvWHtabcssu7EoHHZG+hP6daJI1RtWhsScTdNPwC0yZ42WWsoT+IF1HKKQHlFb7RY6MDNE2/QhHsYZMRvWMpl8yKhrS94IvYka9Fklq8kD53uDnmwmjdHCPT9n+GdlmNfIopeCy7fCpwIqOdf67dWjv2v1daNUapssNhIbnJHjso4JHXSzTuxKyfEl0FBiUK4XVndGpBKUYg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: UpFzgR4AAcPKCSRrAt0q2xQa44DkBCifU5I0PmRuDQhmIz6EuvD6XtoXNie38fmhS+Tv6u4cUIJI7Tbv4aZsDt80xC3z7UdXRKn9c1zUtn5/v9XSsMI93Zf1QBuDM1w9a4ahODLHizqKCSOvfypkeM+IktdlLFNVidw4CPFyDNyr8EIo7T/fpYP1mIBtnd43VElUzFp6vd9Iwr6jSwP1if0EPHzJSRilvjPeeLlK6hdMlSewgRK8IMeH4NfUp2HBXp9mtayoQX08ZG9b83vtxmzIwwUcCvDYTA8l5DxEMAL30dfa8ssgexkcmURlwPk91qMn7BnGhYg/PoymPyE/HqiwhoI/8RKw28l0FtHp7BG7yAqD/pHeUjN0t1+AzZ3JarDNaVvwxYc+Hfq9zF/U6IfyKGPshKTLLRuQESu5F7y7yA8SWZ77HOF7elzWRcXG6bT7FfHvL289V72DSX8pfiVEEIVBNYQQHAPtHjlVh4QXyKSi0teaXgBg0wZ5ZnKf6ffhcs7WHqVISOBcQ0tC+2k933uPEsb/VzQm6a0QogIKYJ3xWR+JkvmSx2iFHMSOqOuHTufa/K5oU5gkYVjBBnhKhdzkJM9vwVxmaapoXF9QIYWISjKqByoc63WyxRkG
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR02MB11190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5c4e5e-4821-4908-8d6e-08df3a1331f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 01:30:22.5995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6qi30g6btFODKCvEz2/sUr6pYCcn4mipWnlfZXpFJkSSWDi55LIv6IfNs1EXuAOo7x3OC9tFkkmNNcP58b8CIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR02MB10834
X-Proofpoint-GUID: CUsVrSw3PSiKuk0e-AJH5-jIc3NgxVCU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNSBTYWx0ZWRfXzw7Vm4SouzXj
 /wh5/j9WrbD4KRQHuCg3Chpk90cCaXjMapiPTkHkThV1Oe4flPFncBtt1AWFamoZ9n5ka7WGGcE
 q0XlMoS2VLdcD80Qev5Bjc+zJFHUOR3RdEyfEM7IkvccbLz4x8V/JX5D6SZK15KdLB0UN01JAmE
 EX3dUzvpyUgO8WCLQFk4o7BDjvnd7ZxI4puZkTFpfvguz853kiLHIm/vonxHlxXVT8sgeCG2hxh
 eWtg9i2j0dY/EaVeJASheLU9iBAm8ejrAtQ0Qonczg2I5BODOagrVcKerUZOYstLC0zReW8sqj5
 JnWZ8QszNajgJYZtpm6AP2VmRgApycV4qsWizCStQ573IQGhxKkTLsGdE7Si1GdZc3uJc6U8vBw
 /sPWyPYFriCnAMaPkZsE397gsUVS3yVp9NVXgEtmmjfYgi1S8H4W2kvzM75e1TauI75Ev6wDikj
 P/PyILZRMIO3zPUwcng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNSBTYWx0ZWRfX4iaOeqv2PkqP
 N9NBePbnLpAX2A8pobLq9tkju8jbUfW9M3Ts7OOd4KKsg23Z1gjCKydG0s1ePTOjLBiWyi7NuQK
 5SwAaXE7mQhakNR/HLxZIVDK1+1BoF0=
X-Proofpoint-ORIG-GUID: CUsVrSw3PSiKuk0e-AJH5-jIc3NgxVCU
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aea8ab1 cx=c_pps
 a=4lXSgsBoi/3Q1P6qCHAbnQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=3-RhneuVAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=EUspDBNiAAAA:8 a=e9LzzKAnQ83bk2_E4msA:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10
 a=ro5RL_tylfyhmzcm:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=VLVLkjT_5ZicWzSuYqSo:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 01:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249318

--_000_DS4PR02MB11190D3AA58D06C430BC4203687682DS4PR02MB11190na_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Could someone review this patch? @Alexander<mailto:alex.kanavin@gmail.com>,=
 @Bruce<mailto:bruce.ashfield@gmail.com>, @Peter<mailto:peter.kjellerstedt@=
axis.com>


Thanks,

Roshan.



________________________________
From: Roshan Sivakumar via openembedded-core <roshs=3Dqti.qualcomm.com@list=
s.openembedded.org>
Sent: Monday, November 2, 2026 09:13
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>; Peter Kjellerstedt <peter.k=
jellerstedt@axis.com>; Sumanth Gavini <sumanth.gavini@windriver.com>; Bruce=
 Ashfield <bruce.ashfield@gmail.com>; Roshan Sivakumar <roshs@qti.qualcomm.=
com>
Subject: [OE-core][PATCH] kernel-devsrc: drop unused scripts/mksysmap to av=
oid sed dependency

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

scripts/mksysmap is a '#!/bin/sed -f' script that is consumed only by
scripts/link-vmlinux.sh during a full vmlinux link (NM | sed -f mksysmap
> System.map). External module builds against kernel-devsrc never relink
vmlinux, so the script is never used in this package.

Because it is packaged with a '#!/bin/sed' shebang, the RPM 6 interpreter
dependency generator emits "Requires: /bin/sed" for kernel-devsrc. Only
full GNU sed provides /bin/sed (busybox provides /usr/bin/sed), so SDK
population fails with "nothing provides /bin/sed" on images using busybox
sed.

Remove the script in do_install, mirroring the existing removal of
scripts/package/debian/rules (dropped to avoid an RDEPENDS on make). This
clears the spurious /bin/sed dependency without pulling full sed into the
package or the SDK.

Assisted-by: Claude Code:claude-opus-4.8
Signed-off-by: Roshan Sivakumar <roshs@qti.qualcomm.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kern=
el/linux/kernel-devsrc.bb
index 90bdbfc534..7da7e270c3 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -158,6 +158,13 @@ do_install() {
         # Remove as we else would ned to RDEPEND on make
         rm $kerneldir/build/scripts/package/debian/rules 2>/dev/null || :

+        # scripts/mksysmap is a '#!/bin/sed -f' script that is only consum=
ed by
+        # scripts/link-vmlinux.sh during a full vmlinux link. External mod=
ule
+        # builds never relink vmlinux, so it is unused here. Remove it as =
otherwise
+        # we would need to pull sed into the package/SDK to satisfy
+        # the dependency generated via the RPM shebang dependency generato=
r (Requires: /bin/sed).
+        rm $kerneldir/build/scripts/mksysmap 2>/dev/null || :
+
         # tools/include is needed by the archscripts host tools that
         # 'make scripts prepare' rebuilds on target (e.g. x86 vdso2c) and
        # not checked against objtool as it previously was.
--
2.34.1


--_000_DS4PR02MB11190D3AA58D06C430BC4203687682DS4PR02MB11190na_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Could someone review this patch? <a id=3D"OWAAM965965" class=3D"tWKOu menti=
on ms-bgc-nlr ms-fcl-b" href=3D"mailto:alex.kanavin@gmail.com">
@Alexander</a>, <a id=3D"OWAAM949424" class=3D"tWKOu mention ms-bgc-nlr ms-=
fcl-b" href=3D"mailto:bruce.ashfield@gmail.com">
@Bruce</a>, <a id=3D"OWAAM888764" class=3D"tWKOu mention ms-bgc-nlr ms-fcl-=
b" href=3D"mailto:peter.kjellerstedt@axis.com">
@Peter</a></div>
<div id=3D"Signature" data-signature-name=3D"roshan" class=3D"elementToProo=
f">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<p style=3D"margin: 0in; font-family: Calibri, sans-serif; font-size: 11pt;=
">Thanks,</p>
<p style=3D"margin: 0in; font-family: Calibri, sans-serif; font-size: 11pt;=
">Roshan.</p>
<p style=3D"margin: 0in; font-family: Calibri, sans-serif; font-size: 11pt;=
">&nbsp;</p>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Roshan Sivakumar via =
openembedded-core &lt;roshs=3Dqti.qualcomm.com@lists.openembedded.org&gt;<b=
r>
<b>Sent:</b> Monday, November 2, 2026 09:13<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;; Peter Kjellers=
tedt &lt;peter.kjellerstedt@axis.com&gt;; Sumanth Gavini &lt;sumanth.gavini=
@windriver.com&gt;; Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt;; Roshan=
 Sivakumar &lt;roshs@qti.qualcomm.com&gt;<br>
<b>Subject:</b> [OE-core][PATCH] kernel-devsrc: drop unused scripts/mksysma=
p to avoid sed dependency</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">WARNING: This email originated from outside of Qua=
lcomm. Please be wary of any links or attachments, and do not enable macros=
.<br>
<br>
scripts/mksysmap is a '#!/bin/sed -f' script that is consumed only by<br>
scripts/link-vmlinux.sh during a full vmlinux link (NM | sed -f mksysmap<br=
>
&gt; System.map). External module builds against kernel-devsrc never relink=
<br>
vmlinux, so the script is never used in this package.<br>
<br>
Because it is packaged with a '#!/bin/sed' shebang, the RPM 6 interpreter<b=
r>
dependency generator emits &quot;Requires: /bin/sed&quot; for kernel-devsrc=
. Only<br>
full GNU sed provides /bin/sed (busybox provides /usr/bin/sed), so SDK<br>
population fails with &quot;nothing provides /bin/sed&quot; on images using=
 busybox<br>
sed.<br>
<br>
Remove the script in do_install, mirroring the existing removal of<br>
scripts/package/debian/rules (dropped to avoid an RDEPENDS on make). This<b=
r>
clears the spurious /bin/sed dependency without pulling full sed into the<b=
r>
package or the SDK.<br>
<br>
Assisted-by: Claude Code:claude-opus-4.8<br>
Signed-off-by: Roshan Sivakumar &lt;roshs@qti.qualcomm.com&gt;<br>
---<br>
&nbsp;meta/recipes-kernel/linux/kernel-devsrc.bb | 7 +++++++<br>
&nbsp;1 file changed, 7 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kern=
el/linux/kernel-devsrc.bb<br>
index 90bdbfc534..7da7e270c3 100644<br>
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb<br>
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb<br>
@@ -158,6 +158,13 @@ do_install() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Remove as we else would =
ned to RDEPEND on make<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm $kerneldir/build/script=
s/package/debian/rules 2&gt;/dev/null || :<br>
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # scripts/mksysmap is a '#!/bin=
/sed -f' script that is only consumed by<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # scripts/link-vmlinux.sh durin=
g a full vmlinux link. External module<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # builds never relink vmlinux, =
so it is unused here. Remove it as otherwise<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # we would need to pull sed int=
o the package/SDK to satisfy<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # the dependency generated via =
the RPM shebang dependency generator (Requires: /bin/sed).<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm $kerneldir/build/scripts/mks=
ysmap 2&gt;/dev/null || :<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # tools/include is needed =
by the archscripts host tools that<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # 'make scripts prepare' r=
ebuilds on target (e.g. x86 vdso2c) and<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # not checked against objtool as=
 it previously was.<br>
--<br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS4PR02MB11190D3AA58D06C430BC4203687682DS4PR02MB11190na_--
