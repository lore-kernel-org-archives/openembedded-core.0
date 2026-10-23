Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2162.1792741306071445170
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 00:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PsgXQavl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: roshs@qti.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FN451048304;
	Fri, 23 Oct 2026 07:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aZdTpzqLrC23v76bPnMGZ+/7
	uh2CshLVWPsh9LwKG/0=; b=PsgXQavlv+wqbkS5nIooZuYQP7sVHKCspEP+Bhvd
	g7lwp4QeWEGPL3V1eCMyl+zfDqxce6x4c8ZLnP7dIg7PjTyCuBuE2K8TBgQSdvNw
	OXro4nTI5YuPqohqF49/n1EQW0s5/BnGYMCIkutaXUdF+wEdV2e1GHrRjDebnVwC
	lK4tSDPU0nM9jC/+LY1yJ9/IZ7tYIjHhfCh0fIXt5dnOdC4SWf86CxDR5BELB0U7
	/3ITLVr3ivxxPXTOBnDtEZHVeZWRl+1bctHxvUU3csDcJLqa0OGJbf5C10RT7xlU
	eftWxfpLP2ZLhAZdWiZP7fd1aXSojaMNJcR+LCc7x5HjHg==
Received: from bn1pr07cu003.outbound.protection.outlook.com (mail-bn1pr07cu00304.outbound.protection.outlook.com [40.93.12.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbjjx2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 07:41:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFaSMNk2GFGM2b4k4iisbafeYqCQ1isk2ZKQt4QZbhLvS9bbjbCqna3mZ8SpM+x7X0CEYSt5SpuCrU2G69Vni4cnaFPBOG0JuUAWv8scWtL5p9gJnJHTAxuYpe5ICZVIOAokzcZ/VsyVY3Q7YXJfIuzTC8yHN5zR9MM6lSrKee6V3Zx/HLPlbwh5XoEfg/okVvuGJIbcep/AH3CPlGMXM320upu+SYJpYAKjxtu4Hmc6ORDfZIagHAiZ4hJEIbMXSGmMAZeaHvJD0R3yjLbkM5Rvn0lNoTqQnGNl4agXncqwUikxMxERWV6C7JRcl60rGOb9UJzk5tlF/iILlXa6KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZdTpzqLrC23v76bPnMGZ+/7uh2CshLVWPsh9LwKG/0=;
 b=bMH+HWiUgD3zjQk0pr8mwJd3MNmqYxJzAcpfzyWd6bPST+yuPKJPMQjp0UcIXsnOBhezn7Kn0spf4iqIgQqeybwYE20fTHNYAL1raXUptWvoobBSbK8YpCTXmRzpa80+9THycIV83GrM6A6J1U7oOm0OOoo43msh7TvCl92ZchoW2DNGhPvFETOjgLjxIHs6PC0iLFwNZlJf/H12c/W004XbVCRYwPpcKA1oNa3aFLHJRhG5Sc1ic+eqTfge2thLW65RuaoIaUaGdQiybQRXWYtFG5bCc4pPExKvj2FMJmEFaCWZb0Wo0DsBlO9msOaYUgmm62ZbHA1gqPhNhK2/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DS4PR02MB11190.namprd02.prod.outlook.com (2603:10b6:8:32a::18)
 by PH7PR02MB8955.namprd02.prod.outlook.com (2603:10b6:510:1f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 07:41:38 +0000
Received: from DS4PR02MB11190.namprd02.prod.outlook.com
 ([fe80::aba2:f69a:a7c6:95ca]) by DS4PR02MB11190.namprd02.prod.outlook.com
 ([fe80::aba2:f69a:a7c6:95ca%5]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 07:41:38 +0000
From: Roshan Sivakumar <roshs@qti.qualcomm.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Sumanth Gavini <sumanth.gavini@windriver.com>
Subject: Re: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter
 dependency generator
Thread-Topic: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter
 dependency generator
Thread-Index: AQHdYgHpy8hwRXPh30+Uw7KS7+AmSLcJeykAgAFEPzQ=
Date: Fri, 23 Oct 2026 07:41:38 +0000
Message-ID: <DS4PR02MB111904FEA73B0731DB9E71A5187642@DS4PR02MB11190.namprd02.prod.outlook.com>
References: <20261022084635.3702905-1-roshs@qti.qualcomm.com>
 <DB5PR02MB102132000280F19DBB82F92ECEF652@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102132000280F19DBB82F92ECEF652@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR02MB11190:EE_|PH7PR02MB8955:EE_
x-ms-office365-filtering-correlation-id: 405b5411-5839-400e-f3fd-08df30d91260
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261021123027099003|261022105027099003|261022075727099003|56012099006|38070700021|260925022911599003|260925021311599003|260925021911599003|4143699003|11063799006|5023799004|261009221227099003|261009223027099003|10067099003|22082099003|18002099003|8096899003|6133799003|261021121427099003|3023799007;
x-microsoft-antispam-message-info: sn2fJsj5Z1yBQreUgYRfYCRnt3q6/SiAHM57Wp+9z0w9ETtwbBNtFDunV3aMc/6UyCYgEQ9ehYjp4SoJLlmfgCt6be9CWm+R/in/JNM+qBvXMNictPIBv4sdxBex5xoz5tSRSFvy8qWy82HgutXH5eVPV/28FPlS4Mr20xWG9ZSsE04K9DsS7CU3SZUkHF6eA2+hyjcdlHane9oOsJ8tptQZpUu0EYwyAZhVEw7XoCtZh0ioddzsM/SqfrEPEH4140stH85VQ2LV/kE+gr9LJx9EqWJhpPhUefJYVeS/wyVHEqBzMDfw37OahQhZRQ7N+zdA+yZ+g3tSpKtTcyD6Gc998jWUBIb8GmSVoeXHHyWItKwPV6dMde5d69QiE8Ka7oHJcsV7t0cJtceE0Qgzax0wmKMkj9d53Y0kIIGln/EWrDZk+Mv9F6x1x045OX3aTy80m/396I9rxKPUJp9sjsLEptb6IBQbCmhlMIeUt8MUfqMhmKzVl6WovKEF5J9U2IPc1SlsqeicsR8Ixq0lwEm2SQ5UX6UhjDlS3kHbLMS62fogFpRpGik1NXhRqzGnqOqwziOqBxpl0L4uGDcVkquHcN4DKxArLhE50FUd9g46CVoezE2J82k9Yvz8A4BSw/Id1whLVrEDRwfdUgMHg3zfqSoIU4n3pdOaaRcYb+c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR02MB11190.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261021123027099003)(261022105027099003)(261022075727099003)(56012099006)(38070700021)(260925022911599003)(260925021311599003)(260925021911599003)(4143699003)(11063799006)(5023799004)(261009221227099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(8096899003)(6133799003)(261021121427099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wi0bZSCBMetG+QzHl3lr+9ekSpWKkCvXUjhCD7JNfMRu1ZkV1b2fGA6Kde?=
 =?iso-8859-1?Q?ws9HkcINKauFK0hXrzDtA/8FpYa/SM01ZyneJS8/XYoPyfCPC44Ofukq7z?=
 =?iso-8859-1?Q?FPJtCYQKL62Vb9yiyQTnSXLLc1/iczKt2EEziYQp+N1cA4sg3DXq7SMMZo?=
 =?iso-8859-1?Q?psF7OCmbB855aYB8lAQwlg7Wmwtszm/JwmpUrijIn+1r4Wo2y8fhpEyZH1?=
 =?iso-8859-1?Q?6/y/1tkGglbljkl372MrI/TYcBhCgbn4U/Xd424dCD5z+6/CkIVo0T5YZf?=
 =?iso-8859-1?Q?5CMIFo0+Gg3AbG1f0VyrH9wuuaPIzqJ/VwuBICVOOpuACarhg8xYNE38JJ?=
 =?iso-8859-1?Q?nOVTCdylWLKgnSiP1ksWxRpbYC8q7mLFnEEkIG3oyWXi38nkYvovPXI5S4?=
 =?iso-8859-1?Q?kRTnR1d4LR5ewbyO3XlB75ns0Ze6Lvb62thxuWViZt3qRcvT6PgD0djhSx?=
 =?iso-8859-1?Q?WiNnTsiwnqGPWKsWoI8ZiaTtLaMondwcLh63S7L6zL/+Czloq+BRh/Rgqt?=
 =?iso-8859-1?Q?LPEYvuAGmzP3YmJNLyMhrsgSWx7eW9JWjlBUuthscrMxMhmqrh1WThyqQS?=
 =?iso-8859-1?Q?D9Rm1OR0Neu0e70doll9OHURGsbqoeHusyQDTAM/vyd/5Q7cjBCidwTqVz?=
 =?iso-8859-1?Q?2A/NHpZIHkcrEskTjsksAV0ylT58LJBVud/REKAAqmsVOZUWtd988bdeKM?=
 =?iso-8859-1?Q?32wL462lbVeFrBPzu+gb8cAlXRUwQOuCeh8IjTRZhAO5wcMuABVNKkUa5z?=
 =?iso-8859-1?Q?/OMJ9DDPnkI2cQwoipldFvYCnd6IeL5gDKVkFCYhDGL7z9+R5QbjWM0q1K?=
 =?iso-8859-1?Q?BjTkM5TNZQg+EQuiFWXZfi/UNfISWzm843XwOQomQYLt9o9U1APeHw+s3D?=
 =?iso-8859-1?Q?rSiMpISjnoSaVlCGt1910CcJQVa+eTTEFlUafTG+eockTAJy3v5oGeB9AT?=
 =?iso-8859-1?Q?frkiDovcUSXg5Vuie9+yaqTRKOZp4oTL6F01HgOcYNeya5tR7tq4jDzq4F?=
 =?iso-8859-1?Q?y/12FIihjoUoFYBrpENdGF7QFOE+ioaNyUHBddvn0233x9+BT6W+oxeFFA?=
 =?iso-8859-1?Q?oyXquDx2fucNXhSTvumWh/NYfm1g4Z/ThTG3G1l5xc0ekwwKOVA+Y/lIh+?=
 =?iso-8859-1?Q?wahrWLELdS+LBRl7iF/WFb3L3Zb9U+09FcbwammFaIzB0EoTQtsnNgwbMq?=
 =?iso-8859-1?Q?RT4PDIO7x7Yg/EYJkNfV3fBRp8qPnc7b5X0OFVDf/LhdxM3O0ti8k4/fdu?=
 =?iso-8859-1?Q?TPf4AJULTZP6lUWgV4rE3iCHOWagLgwrDy5qNFyffSFkJ/Bk9kVR3w6y/z?=
 =?iso-8859-1?Q?sWaG8BIjXx1tjfKWC4h8HSPe3pJM87OZhFM20TuG3lMlSV9e0bHIvBZKO1?=
 =?iso-8859-1?Q?1sbGtMe88fWeFA63epCtEiPsp/s3LWciKZ3g+3rpSwaSL2sglMwrEYlWe8?=
 =?iso-8859-1?Q?lSytgMCtb7KX8nXsEk5eVUjxq8lTf9KRNStKsFM/99K5WI8HyIbomeNFlq?=
 =?iso-8859-1?Q?+JfXrvK6ioAG00ajxWTS7qWWqRt0Mthz2SRV3o6JDXDsFLsBDU/Zu3cG9q?=
 =?iso-8859-1?Q?SUqBVtDnswXLRpgI2ou0qMw4hIAYQN1Fa7wrz6ui4Nzxy+BRAf2KkPmdc4?=
 =?iso-8859-1?Q?ue8LMUd6CbtAPBBfy71h19HDtXMjIaxSaS1Kz/4MbGSWRbrFwDZ0DzFO3L?=
 =?iso-8859-1?Q?r4OLvsVXiTO5lUhbWLSJdttY7DySlgH2Zu2REhXye3Sh8dZdFu1MaMKR+R?=
 =?iso-8859-1?Q?4drcdEdIlOSwaIPq2D8EQkDxZsi5Y2CILts6J9+QEnW31K?=
Content-Type: multipart/alternative;
	boundary="_000_DS4PR02MB111904FEA73B0731DB9E71A5187642DS4PR02MB11190na_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 1oABXVOpeCKD9daPTn2dpkqmf7P5Q5frjEXmjDv2UZfrFp5srUTKbH1Dh2sYReUhChEINLAvAKyGVXJzju/m+NGL+I/m7xm8UXFf1LC1iY5DpcxlP3VNjXG4nuMQ0W6SjvSCv7xddKlixPDZQaWQEJ609fvpM2TitGjPpQKD0xz68prxmzS+Utq3VUoKAri9HdJPkpV+myEsqj355zffHoxJ/D0TmMe1zD2SHfHYafNIoOFdZIMEA/jZjp3qhc0hI6vJPF+fNtrb3GAzqyavyjiTFia8nBUZORWILU0Ts4CrZVxnXqQpZh9GR82vIHh3iYNkMWQWDdicqnlVUVPKcg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: hQVzTR2XFkWu/O/zYU3P/KsuI4621F/QPVyLxXRiEjISNO4cJE/pQGw9TTZB5CEMA6DEEbAn8rooSWPRIuYWL3hDKpLPwE39cToTLdy27u/wKj++BZ9xMDsGv8SIwCQTuaoWekzBQ6QI9Ei2+H6YwWzEjgV8o3ozN7ylAEn7uCLbFxZ87EcZ+9UJXVzNQNG/0RHmbvrJhf2ItRtM8EMTdXrKsJjZFJOvlPD4ll6esf88M7DMlRH11gUEgIN9/YbSPfCV5DJ0krXDZkdPj1MDWVGBDEXhpZw8zTE83hjJIljAMD7NKBjPecLpPw00UcWI54VnmAIrT5SBAY8TMUAeKTsU6tojdtrC9m3VSZww45SVcJk82iSPMywIAz+cPSIHbP73QNNbE40Z23fv3qT/1McRI8XpI5X2wYGiQWaHDadnXnri6mFOWl/zuMNpTLdHv7nszxUIdi6jMZ5VjX9Wcj8IrUdglUJ7oZ4DHlEzwng16gzL1Bv7L1+rc6zSAxWXw2UP1iBqBkeA5i3euQtq2iUYXS4T7MwNL98uiJBtdKS12bI/KoJwv8n8PeHANyRaoeuBTEd9Iz1OjZpGbntUiqf4kLUdG2waTS3umMKZ9lORW3HxbRJwPMABqtgTH39r
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR02MB11190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 405b5411-5839-400e-f3fd-08df30d91260
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 07:41:38.3981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6HQ2GdFNNOB2hC6/pr8qpWCwrQZ6To+zLQ8X0B2oG27Uqg4vySv3TUh93c4x+49bmKPqSUJk3yGKEGSRFzuKQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB8955
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMCBTYWx0ZWRfX9OCeY475bqNK
 E7v0fzvvWTj3/YDsB7uwUSWuI9ew8Hk5pXtX1A0L6iiPxpZHyaYZSVDkfmRD2vMxapICe2k/YGY
 s8oi8qxHVkqUgYKMyHVE82BVVZDQaI8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMCBTYWx0ZWRfXyETT6KppecGA
 Kiz5lx80I8sPm5WXNY0no//uFg02BXXkE1FknuqizNtxylT3OPXkPDLTQplN8PBkpAgME5Z0B/h
 c1jrxu133h694i8dAx4CCsy7NgOCWGDplA1BjgeC0mSaGs/onFPRPJ88SumRLy176B9Ol3n8iMN
 370YtXWfACk/c2C9dqnOp2+iSTUzuyfvycL7dNaIOq5CARouKt0/J29xGpnIheDqc/GeHvn7Fu2
 MbQuGuv1dN0SVLGRLJHcfkymsV3AnZ45eQQMjWejmfsS4fdwaSY+PKQxRw4h0z5zvBGvCO3ui8g
 s150GeJshMybNSAp+X8udAJaiKqUxTRiRusCCFmHyA6ocrW9k/PrKZN41opHcDBY0XTMvvakkgU
 Mxfe5k3ozosBc46A/gFgAzoz6Zy7quS6N3Ef4HXl+m50iy/OmLTnmIEPB32f88Wf+IJldLeR6KY
 dSBkpkdmSZRnXy9eH5g==
X-Proofpoint-ORIG-GUID: MIUEvlw6NmKrcIBL6B0pRI8q95MG_pan
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb0fb6 cx=c_pps
 a=QkuM5wwrLaM8KyCKNiv24A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=WfHZuIUsAAAA:20 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=iUCGjRYGqWejWIwOwwwA:9 a=wPNLvfGTeEIA:10
 a=LTet_cP_jgiTOEOl:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=VLVLkjT_5ZicWzSuYqSo:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=bn7x_FpfJtc3yKQXRW3z:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: MIUEvlw6NmKrcIBL6B0pRI8q95MG_pan
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 07:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248488

--_000_DS4PR02MB111904FEA73B0731DB9E71A5187642DS4PR02MB11190na_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>>Replying here again since the previous reply was sent in a separate threa=
d.

I believe this dependency belongs here: openembedded-core/meta/recipes-kern=
el/linux/kernel-devsrc.bb at master =B7 openembedded/openembedded-core<http=
s://github.com/openembedded/openembedded-core/blob/master/meta/recipes-kern=
el/linux/kernel-devsrc.bb#L460>

RDEPENDS:${PN} +=3D "sed" in the above recipe is the right way to do it?

There should probably be a separate patch to satisfy that dependency.



Thanks,

Roshan.



________________________________
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Sent: Thursday, October 22, 2026 05:19
To: Roshan Sivakumar <roshs@qti.qualcomm.com>; openembedded-core@lists.open=
embedded.org <openembedded-core@lists.openembedded.org>
Cc: Sumanth Gavini <sumanth.gavini@windriver.com>
Subject: RE: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter dep=
endency generator

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Roshan Sivakumar via lists.openembedded.org
> Sent: den 22 oktober 2026 10:47
> To: openembedded-core@lists.openembedded.org
> Cc: Sumanth Gavini <sumanth.gavini@windriver.com>; Roshan Sivakumar <rosh=
s@qti.qualcomm.com>
> Subject: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter depen=
dency generator
>
> RPM 4 generated dependencies with the external __find_requires /
> __find_provides generator, which OE disabled entirely via
> _use_internal_dependency_generator 0. RPM 6 removed that mechanism; for
> v6-format packages only the internal fileattr generators run.
>
> rpm's script.attr generator therefore runs for the first time in OE
> builds. For every packaged executable whose first line is a #! shebang
> it emits an interpreter dependency. kernel-devsrc ships
> scripts/mksysmap (#!/bin/sed -f) as an executable, so its package gains:
>
>   Requires: /bin/sed
>
> OE manages build and runtime dependencies explicitly through
> DEPENDS / RDEPENDS and does not want these. They break real use cases:

I am not sure about the explicitly part. AFAIK, installed scripts with a
#!/bin/bash shebang leads to an automatic dependency on bash. Whether it
is RPM and/or bitbake doing that, I don't know.

>
> - The interpreter path is taken verbatim from the shebang. A #!/bin/sed
>   script requires /bin/sed, but under usrmerge the only provider
>   (busybox) offers /usr/bin/sed. The literal paths never match and the
>   package becomes uninstallable.
> - In the SDK the sole interpreter providers (busybox, coreutils, bash,
>   perl) are deliberately banned by target-sdk-provides-dummy, so these
>   auto-generated requires make -dev/-src packages uninstallable during
>   do_populate_sdk ("nothing provides /bin/sed needed by kernel-devsrc").
> - The requires are non-reproducible: they are only emitted when the
>   interpreter is scanned from the shebang during packaging, so the same
>   recipe can produce different packages between the reproducible A and
>   B builds.
>
> This is the same class of regression already handled for the pkgconfig
> generator; see "rpm: disable the RPM 6 pkgconfig dependency generator".
>
> Suppressing the generator from the rpmbuild command line
> (__requires_exclude / __script_requires set to %{nil}) is not reliable:
> rpm reloads the fileattr macros during dependency generation and
> clobbers the --define. Remove script.attr and its helper script.req
> from rpm's install lists via a source patch. This changes
> do_unpack/do_patch, so the whole rpm recipe and everything downstream
> re-hash and no stale rpm-native is reused.
>
> Signed-off-by: Roshan Sivakumar <roshs@qti.qualcomm.com>
> ---
>  ...he-script-interpreter-dependency-gen.patch | 72 +++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_6.0.2.bb        |  1 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/0004-Do-not-install-t=
he-script-interpreter-dependency-gen.patch
>
> diff --git a/meta/recipes-devtools/rpm/files/0004-Do-not-install-the-scri=
pt-interpreter-dependency-gen.patch b/meta/recipes-devtools/rpm/files/0004-=
Do-not-install-the-script-interpreter-dependency-gen.patch
> new file mode 100644
> index 0000000000..8c3d1769c8
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0004-Do-not-install-the-script-
> interpreter-dependency-gen.patch
> @@ -0,0 +1,72 @@
> +From: Roshan Sivakumar <roshs@qti.qualcomm.com>
> +Date: Thu, 16 Oct 2026 00:00:00 +0000
> +Subject: [PATCH] Do not install the script interpreter dependency genera=
tor
> +
> +RPM 4 generated dependencies with the external __find_requires /
> +__find_provides generator, which OE disabled entirely via
> +_use_internal_dependency_generator 0. RPM 6 removed that mechanism; for
> +v6-format packages only the internal fileattr generators run.
> +
> +rpm's script.attr generator therefore runs for the first time in OE
> +builds. For every packaged executable whose first line is a #! shebang
> +it adds an interpreter dependency, e.g. a kernel-devsrc package shipping
> +scripts/mksysmap (#!/bin/sed -f) gains:
> +
> +  Requires: /bin/sed
> +
> +OpenEmbedded manages build and runtime dependencies explicitly via
> +DEPENDS/RDEPENDS and does not want these. They break real use cases:
> +
> +- The literal interpreter path is taken verbatim from the shebang, so a
> +  #!/bin/sed script requires /bin/sed while the only provider (busybox)
> +  offers /usr/bin/sed under usrmerge. The paths never match and the
> +  package is uninstallable.
> +- In the SDK the sole interpreter providers (busybox, coreutils, bash,
> +  perl) are deliberately banned by target-sdk-provides-dummy, so these
> +  auto-generated requires make -dev/-src packages uninstallable during
> +  do_populate_sdk ("nothing provides /bin/sed").
> +- The requires are non-reproducible: they are only emitted when the
> +  interpreter happens to be scanned from the shebang in the build
> +  sysroot, so the same recipe can produce different packages.
> +
> +This is the same class of problem fixed for pkgconfig.attr; see
> +"rpm: disable the RPM 6 pkgconfig dependency generator".
> +
> +Suppressing the generator from the rpmbuild command line is not
> +reliable: rpm reloads the fileattr macros during dependency generation
> +and clobbers any --define. Remove script.attr and its helper script.req
> +from rpm's install lists via a source patch. This changes
> +do_unpack/do_patch, so the whole rpm recipe and everything downstream
> +re-hash and no stale rpm-native is reused.
> +
> +Upstream-Status: Inappropriate [OE policy: dependencies are managed by
> the build system, not generated by rpmbuild]
> +
> +Signed-off-by: Roshan Sivakumar <roshs@qti.qualcomm.com>
> +---
> + fileattrs/CMakeLists.txt | 2 +-
> + scripts/CMakeLists.txt   | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/fileattrs/CMakeLists.txt b/fileattrs/CMakeLists.txt
> +--- a/fileattrs/CMakeLists.txt
> ++++ b/fileattrs/CMakeLists.txt
> +@@ -1,6 +1,6 @@
> + install(FILES
> +       debuginfo.attr desktop.attr elf.attr font.attr metainfo.attr
> +       ocaml.attr
> +-      rpm_macro.attr rpm_lua.attr script.attr sysusers.attr usergroup.a=
ttr
> ++      rpm_macro.attr rpm_lua.attr sysusers.attr usergroup.attr
> +       DESTINATION ${RPM_CONFIGDIR}/fileattrs
> + )
> +diff --git a/scripts/CMakeLists.txt b/scripts/CMakeLists.txt
> +--- a/scripts/CMakeLists.txt
> ++++ b/scripts/CMakeLists.txt
> +@@ -6,7 +6,7 @@ install(PROGRAMS
> +       check-buildroot check-rpaths check-rpaths-worker
> +       find-lang.sh find-requires find-provides
> +       ocamldeps.sh
> +-      fontconfig.prov script.req
> ++      fontconfig.prov
> +       rpm_macros_provides.sh
> +       rpmdb_dump rpmdb_load
> +       rpm2cpio.sh tgpg
> diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtoo=
ls/rpm/rpm_6.0.2.bb
> index c27f58a0e8..6c80c839ca 100644
> --- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
> +++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
> @@ -40,6 +40,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/r=
pm;protocol=3Dhttps;branch=3Drp
>             file://0001-tools-elfdeps.cc-Remove-format-module.patch \
>             file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-=
4.2.patch \
>             file://0003-Do-not-install-the-pkgconfig-dependency-generator=
.patch \
> +           file://0004-Do-not-install-the-script-interpreter-dependency-=
gen.patch \
>             "
>
>  PE =3D "1"
> --
> 2.34.1

//Peter


--_000_DS4PR02MB111904FEA73B0731DB9E71A5187642DS4PR02MB11190na_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;&gt;Replying here again since the previous reply was sent in a separate=
 thread.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I believe this dependency belongs here: <span style=3D"color: rgb(47, 111, =
167);"><a href=3D"https://github.com/openembedded/openembedded-core/blob/ma=
ster/meta/recipes-kernel/linux/kernel-devsrc.bb#L460" target=3D"_blank" id=
=3D"OWAd5f51177-808e-1c95-e190-190cd22919b2" class=3D"OWAAutoLink" rel=3D"n=
ofollow noopener" style=3D"color: rgb(47, 111, 167); margin: 0px; text-alig=
n: left;">openembedded-core/meta/recipes-kernel/linux/kernel-devsrc.bb
 at master =B7 openembedded/openembedded-core</a></span><br>
<br>
RDEPENDS:${PN} +=3D &quot;sed&quot; in the above recipe is the right way to=
 do it?&nbsp;<br>
<br>
There should probably be a separate patch to satisfy that dependency.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" class=3D"elementToProof" data-signature-name=3D"rosha=
n">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<p class=3D"elementToProof" style=3D"margin: 0in; font-family: Calibri, san=
s-serif; font-size: 11pt;">
Thanks,</p>
<p class=3D"elementToProof" style=3D"margin: 0in; font-family: Calibri, san=
s-serif; font-size: 11pt;">
Roshan.</p>
<p class=3D"elementToProof" style=3D"margin: 0in; font-family: Calibri, san=
s-serif; font-size: 11pt;">
&nbsp;</p>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Peter Kjellerstedt &l=
t;peter.kjellerstedt@axis.com&gt;<br>
<b>Sent:</b> Thursday, October 22, 2026 05:19<br>
<b>To:</b> Roshan Sivakumar &lt;roshs@qti.qualcomm.com&gt;; openembedded-co=
re@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<=
br>
<b>Cc:</b> Sumanth Gavini &lt;sumanth.gavini@windriver.com&gt;<br>
<b>Subject:</b> RE: [OE-core][PATCH] rpm: disable the RPM 6 script interpre=
ter dependency generator</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">WARNING: This email originated from outside of Qua=
lcomm. Please be wary of any links or attachments, and do not enable macros=
.<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt; On Behalf Of Roshan Sivakumar via lists.openembed=
ded.org<br>
&gt; Sent: den 22 oktober 2026 10:47<br>
&gt; To: openembedded-core@lists.openembedded.org<br>
&gt; Cc: Sumanth Gavini &lt;sumanth.gavini@windriver.com&gt;; Roshan Sivaku=
mar &lt;roshs@qti.qualcomm.com&gt;<br>
&gt; Subject: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter de=
pendency generator<br>
&gt;<br>
&gt; RPM 4 generated dependencies with the external __find_requires /<br>
&gt; __find_provides generator, which OE disabled entirely via<br>
&gt; _use_internal_dependency_generator 0. RPM 6 removed that mechanism; fo=
r<br>
&gt; v6-format packages only the internal fileattr generators run.<br>
&gt;<br>
&gt; rpm's script.attr generator therefore runs for the first time in OE<br=
>
&gt; builds. For every packaged executable whose first line is a #! shebang=
<br>
&gt; it emits an interpreter dependency. kernel-devsrc ships<br>
&gt; scripts/mksysmap (#!/bin/sed -f) as an executable, so its package gain=
s:<br>
&gt;<br>
&gt;&nbsp;&nbsp; Requires: /bin/sed<br>
&gt;<br>
&gt; OE manages build and runtime dependencies explicitly through<br>
&gt; DEPENDS / RDEPENDS and does not want these. They break real use cases:=
<br>
<br>
I am not sure about the explicitly part. AFAIK, installed scripts with a<br=
>
#!/bin/bash shebang leads to an automatic dependency on bash. Whether it<br=
>
is RPM and/or bitbake doing that, I don't know.<br>
<br>
&gt;<br>
&gt; - The interpreter path is taken verbatim from the shebang. A #!/bin/se=
d<br>
&gt;&nbsp;&nbsp; script requires /bin/sed, but under usrmerge the only prov=
ider<br>
&gt;&nbsp;&nbsp; (busybox) offers /usr/bin/sed. The literal paths never mat=
ch and the<br>
&gt;&nbsp;&nbsp; package becomes uninstallable.<br>
&gt; - In the SDK the sole interpreter providers (busybox, coreutils, bash,=
<br>
&gt;&nbsp;&nbsp; perl) are deliberately banned by target-sdk-provides-dummy=
, so these<br>
&gt;&nbsp;&nbsp; auto-generated requires make -dev/-src packages uninstalla=
ble during<br>
&gt;&nbsp;&nbsp; do_populate_sdk (&quot;nothing provides /bin/sed needed by=
 kernel-devsrc&quot;).<br>
&gt; - The requires are non-reproducible: they are only emitted when the<br=
>
&gt;&nbsp;&nbsp; interpreter is scanned from the shebang during packaging, =
so the same<br>
&gt;&nbsp;&nbsp; recipe can produce different packages between the reproduc=
ible A and<br>
&gt;&nbsp;&nbsp; B builds.<br>
&gt;<br>
&gt; This is the same class of regression already handled for the pkgconfig=
<br>
&gt; generator; see &quot;rpm: disable the RPM 6 pkgconfig dependency gener=
ator&quot;.<br>
&gt;<br>
&gt; Suppressing the generator from the rpmbuild command line<br>
&gt; (__requires_exclude / __script_requires set to %{nil}) is not reliable=
:<br>
&gt; rpm reloads the fileattr macros during dependency generation and<br>
&gt; clobbers the --define. Remove script.attr and its helper script.req<br=
>
&gt; from rpm's install lists via a source patch. This changes<br>
&gt; do_unpack/do_patch, so the whole rpm recipe and everything downstream<=
br>
&gt; re-hash and no stale rpm-native is reused.<br>
&gt;<br>
&gt; Signed-off-by: Roshan Sivakumar &lt;roshs@qti.qualcomm.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...he-script-interpreter-dependency-gen.patch | 72 +++++++++++++=
++++++<br>
&gt;&nbsp; meta/recipes-devtools/rpm/rpm_6.0.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 73 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/rpm/files/0004-Do-not-i=
nstall-the-script-interpreter-dependency-gen.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0004-Do-not-install-the-s=
cript-interpreter-dependency-gen.patch b/meta/recipes-devtools/rpm/files/00=
04-Do-not-install-the-script-interpreter-dependency-gen.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8c3d1769c8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0004-Do-not-install-the-script-<=
br>
&gt; interpreter-dependency-gen.patch<br>
&gt; @@ -0,0 +1,72 @@<br>
&gt; +From: Roshan Sivakumar &lt;roshs@qti.qualcomm.com&gt;<br>
&gt; +Date: Thu, 16 Oct 2026 00:00:00 +0000<br>
&gt; +Subject: [PATCH] Do not install the script interpreter dependency gen=
erator<br>
&gt; +<br>
&gt; +RPM 4 generated dependencies with the external __find_requires /<br>
&gt; +__find_provides generator, which OE disabled entirely via<br>
&gt; +_use_internal_dependency_generator 0. RPM 6 removed that mechanism; f=
or<br>
&gt; +v6-format packages only the internal fileattr generators run.<br>
&gt; +<br>
&gt; +rpm's script.attr generator therefore runs for the first time in OE<b=
r>
&gt; +builds. For every packaged executable whose first line is a #! sheban=
g<br>
&gt; +it adds an interpreter dependency, e.g. a kernel-devsrc package shipp=
ing<br>
&gt; +scripts/mksysmap (#!/bin/sed -f) gains:<br>
&gt; +<br>
&gt; +&nbsp; Requires: /bin/sed<br>
&gt; +<br>
&gt; +OpenEmbedded manages build and runtime dependencies explicitly via<br=
>
&gt; +DEPENDS/RDEPENDS and does not want these. They break real use cases:<=
br>
&gt; +<br>
&gt; +- The literal interpreter path is taken verbatim from the shebang, so=
 a<br>
&gt; +&nbsp; #!/bin/sed script requires /bin/sed while the only provider (b=
usybox)<br>
&gt; +&nbsp; offers /usr/bin/sed under usrmerge. The paths never match and =
the<br>
&gt; +&nbsp; package is uninstallable.<br>
&gt; +- In the SDK the sole interpreter providers (busybox, coreutils, bash=
,<br>
&gt; +&nbsp; perl) are deliberately banned by target-sdk-provides-dummy, so=
 these<br>
&gt; +&nbsp; auto-generated requires make -dev/-src packages uninstallable =
during<br>
&gt; +&nbsp; do_populate_sdk (&quot;nothing provides /bin/sed&quot;).<br>
&gt; +- The requires are non-reproducible: they are only emitted when the<b=
r>
&gt; +&nbsp; interpreter happens to be scanned from the shebang in the buil=
d<br>
&gt; +&nbsp; sysroot, so the same recipe can produce different packages.<br=
>
&gt; +<br>
&gt; +This is the same class of problem fixed for pkgconfig.attr; see<br>
&gt; +&quot;rpm: disable the RPM 6 pkgconfig dependency generator&quot;.<br=
>
&gt; +<br>
&gt; +Suppressing the generator from the rpmbuild command line is not<br>
&gt; +reliable: rpm reloads the fileattr macros during dependency generatio=
n<br>
&gt; +and clobbers any --define. Remove script.attr and its helper script.r=
eq<br>
&gt; +from rpm's install lists via a source patch. This changes<br>
&gt; +do_unpack/do_patch, so the whole rpm recipe and everything downstream=
<br>
&gt; +re-hash and no stale rpm-native is reused.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [OE policy: dependencies are managed b=
y<br>
&gt; the build system, not generated by rpmbuild]<br>
&gt; +<br>
&gt; +Signed-off-by: Roshan Sivakumar &lt;roshs@qti.qualcomm.com&gt;<br>
&gt; +---<br>
&gt; + fileattrs/CMakeLists.txt | 2 +-<br>
&gt; + scripts/CMakeLists.txt&nbsp;&nbsp; | 2 +-<br>
&gt; + 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/fileattrs/CMakeLists.txt b/fileattrs/CMakeLists.txt<br>
&gt; +--- a/fileattrs/CMakeLists.txt<br>
&gt; ++++ b/fileattrs/CMakeLists.txt<br>
&gt; +@@ -1,6 +1,6 @@<br>
&gt; + install(FILES<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debuginfo.attr desktop.attr elf.=
attr font.attr metainfo.attr<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ocaml.attr<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rpm_macro.attr rpm_lua.attr script.at=
tr sysusers.attr usergroup.attr<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rpm_macro.attr rpm_lua.attr sysusers.=
attr usergroup.attr<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DESTINATION ${RPM_CONFIGDIR}/fil=
eattrs<br>
&gt; + )<br>
&gt; +diff --git a/scripts/CMakeLists.txt b/scripts/CMakeLists.txt<br>
&gt; +--- a/scripts/CMakeLists.txt<br>
&gt; ++++ b/scripts/CMakeLists.txt<br>
&gt; +@@ -6,7 +6,7 @@ install(PROGRAMS<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check-buildroot check-rpaths che=
ck-rpaths-worker<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; find-lang.sh find-requires find-=
provides<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ocamldeps.sh<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fontconfig.prov script.req<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fontconfig.prov<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rpm_macros_provides.sh<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rpmdb_dump rpmdb_load<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rpm2cpio.sh tgpg<br>
&gt; diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-dev=
tools/rpm/rpm_6.0.2.bb<br>
&gt; index c27f58a0e8..6c80c839ca 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb<br>
&gt; +++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb<br>
&gt; @@ -40,6 +40,7 @@ SRC_URI =3D &quot;git://github.com/rpm-software-mana=
gement/rpm;protocol=3Dhttps;branch=3Drp<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-tools-elfdeps.cc-Remove-format-module.patch">file:=
//0001-tools-elfdeps.cc-Remove-format-module.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4=
.2.patch">
file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0003-Do-not-install-the-pkgconfig-dependency-generator.=
patch">
file://0003-Do-not-install-the-pkgconfig-dependency-generator.patch</a> \<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0004-Do-not-install-the-script-interpreter-dependency-gen.patch"=
>
file://0004-Do-not-install-the-script-interpreter-dependency-gen.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt;&nbsp; PE =3D &quot;1&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
<br>
//Peter<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS4PR02MB111904FEA73B0731DB9E71A5187642DS4PR02MB11190na_--
