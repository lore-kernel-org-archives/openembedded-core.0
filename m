Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23237.1792936134986513967
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 06:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=n3VgOVun;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: roshs@qti.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69PClUjd1380326;
	Sun, 25 Oct 2026 13:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CUWcB1JYL/RJ11od999xPUpD
	gqeLopqEskEeWLq7u1w=; b=n3VgOVunKRB5C41vpFUQB/u7MhnAtas9rP8yXLt1
	PR2+cSYq13ELS3iZaLPoqqxgyPJtg49Xcqh+WkPmLFwZ4hAIUH3+T5Ynkv5dTyVC
	4D6OWLYVzHxt4Us67rBngvMrC7Dc+GSEDsnL8Ab+6YIhFTTVV0HbzBsnqLK1p4p6
	ldIunzjOtv1mQcZLuWlxNIaUWlPUtga7nn/fXbqxhjt7m71Dh83ZgoKtwhMdvhkb
	9zKazwy3vrPN1jnQf9QuHZVoZujk1spnutqkKLMCHatRun3ltq+2yJxEk+Fdh1vo
	+kPccGx7SUf8fMWw2cy9jOvd4s5HJJsyJuu5BwvNvu0s9A==
Received: from co1pr07cu001.outbound.protection.outlook.com (mail-co1pr07cu00101.outbound.protection.outlook.com [40.93.10.89])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcguggc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 13:48:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ru8xO6jwF8A+CzyTy0HvEI9PrTm09L5f5HpfkfwHvKI6UscNyy6BCdzJtZ/two8Jg9uHdL3P4FiLg85/aHURxrT0ro/DSNKpYyS3z9hJLlmYThH/4F9Yr4rDfNwHaLHbbi9vJDyb9jPIQyKDfW/65/GCRoYKnSYSpkT4fq0oHVZgBzRMQd5aj+5GI9WeezM/0yUpi+VIlBG+Q1jqNhoLxnddT5Q+hugmqC7D9ljDKpa4tx68AeZCUwISM+N1bXMrkhCyNJ2W57FE2pFcA4mMTzurXl4XCVRy9QcQ0jROalIuxz3MQDi5gXL5aXZfgiD0YF8miiTdkGo01ln46KxR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUWcB1JYL/RJ11od999xPUpDgqeLopqEskEeWLq7u1w=;
 b=pEDD1srErX89gKWS+cJHjR6y91NQ/POVxRDBbCOFVl0REzpUCY81jmGFGoy+UD5QDQihvVymyh9rAQmiJ+JBJndqLiqKGh5weC9bklsdsV7OA8CzFFBZapVU6C0HEFa0BbcyQteDhpHeGH85SprOhUkoIlYzN8TvmP03VhMgA4WsNtDKbwpWQL5KxUqV/y+h9LqDH94Mr9d6XTBZzu14YFwa0+G/5/UeGJcEeDnUwIKGQVKquiH1n9Xxkqx+CZMxrgMb23EDx6CfADh7B/1AqY/ZNvUHJ8P/72Xhk+2qfHQD/lUl17DmlMeBDEQkldQ4xm4tGTmcZc+D8l/NxMdENw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DS4PR02MB11190.namprd02.prod.outlook.com (2603:10b6:8:32a::18)
 by SA1PR02MB11316.namprd02.prod.outlook.com (2603:10b6:806:4a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Sun, 25 Oct
 2026 13:48:48 +0000
Received: from DS4PR02MB11190.namprd02.prod.outlook.com
 ([fe80::aba2:f69a:a7c6:95ca]) by DS4PR02MB11190.namprd02.prod.outlook.com
 ([fe80::aba2:f69a:a7c6:95ca%5]) with mapi id 15.21.0546.021; Sun, 25 Oct 2026
 13:48:48 +0000
From: Roshan Sivakumar <roshs@qti.qualcomm.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Sumanth Gavini <sumanth.gavini@windriver.com>
Subject: Re: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter
 dependency generator
Thread-Topic: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter
 dependency generator
Thread-Index: AQHdYgHpy8hwRXPh30+Uw7KS7+AmSLcJeykAgAFEPzSAA4tarw==
Date: Sun, 25 Oct 2026 13:48:47 +0000
Message-ID: <DS4PR02MB11190EFFE070BED87859F8A9B87622@DS4PR02MB11190.namprd02.prod.outlook.com>
References: <20261022084635.3702905-1-roshs@qti.qualcomm.com>
 <DB5PR02MB102132000280F19DBB82F92ECEF652@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <18E118B84815B8D6.4141359@lists.openembedded.org>
In-Reply-To: <18E118B84815B8D6.4141359@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-IN
X-Mentions: peter.kjellerstedt@axis.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-reactions: allow
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR02MB11190:EE_|SA1PR02MB11316:EE_
x-ms-office365-filtering-correlation-id: 0fa0d9c3-03d0-4d83-9140-08df329eb1d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10070799003|38070700021|260925022911599003|260925021911599003|260925021311599003|5023799004|11063799006|4143699003|56012099006|261009223027099003|261009221227099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|10067099003|22082099003|18002099003|6133799003|8096899003|3023799007;
x-microsoft-antispam-message-info: Ke4M/NeT89cSwKhuOaKvSOBEBMkiqb06bnMYRTCrc/dMKSNqiaL8t7KE3iOmDErWJOMvJBW14nNyoL2UMMhjBTvy/buWqrwxVQ4+j2twJ3wF1bmCCdsmR6ViDK05oioHnijkWN6KYwjmsWOh8da+rHvXtCYfgu4H/uHNbjm2b0PShDj3XefsoEOBEfSPCkUY4vOfZBIsFxcdpGcV5GKfjVFLGt9rgIggExu7vbhrg//aGFAq/EsHSkB0yO+xJD/DGL0bPye4pvetsNj5sRjgdn+4/pZBtZNperPkxuMP1aFy7bt0luc5RYpuSYePa0mQ/4qY8m6yrh/N0IUdXDs4pjB1pzqMNORGuypp4Twt7+POaUd79f9c3pJeRb5UK+ERMRGcHZProkbmYeCKLauogpZopY8o/sLPd1xDb9skizJgSAk/ALg7ECt/2YF6TEmOAzk3SBXe1//wvc9NGbHpI3MMLc9tf7lmHzSYJ1mqXqTW7OMvjdsrhlg0Huw226aLwkUp22W/kIz0M6Sh3nlcDNa/chCVlcyRUcRQUXeQVJ0mei4tc+hlniPC6n1RfBEGFAyDetAmG879HprFqvFJV0WEQ7cVSY1ifFOujlp0B3fdwcI4zS5faqYMXL/yU9TE+vWR/mXR7kxBOKivWMjp2tgoJtL+2t8z85hJdwLugDg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR02MB11190.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(38070700021)(260925022911599003)(260925021911599003)(260925021311599003)(5023799004)(11063799006)(4143699003)(56012099006)(261009223027099003)(261009221227099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(6133799003)(8096899003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cEpmkUGI7yE/3Is4L++0DWGMJqCRSYihgwMRmZ+fyoGObzPNwceCp+iCE5?=
 =?iso-8859-1?Q?1AO23o9JgABj6qMMBgODf0RclTnhQAlYTzXTeUq+nUwHLw0pvLiREJCGic?=
 =?iso-8859-1?Q?I6B7ZA746VuRwrUocrp2QiAqni3yPGvLVnAPSMcsSuRWCy5B1hQ4tm5/Rv?=
 =?iso-8859-1?Q?LvwREbEWW6y8JF57shSshqvRxfDws4KOQzQTthWk+qJz19sIDFz95kd57W?=
 =?iso-8859-1?Q?vefheR8AgLLgKP/jMERODa9Q/FTVH/B30+BNHRh+xAdfhSV09lAsrI3unF?=
 =?iso-8859-1?Q?60rb8//wapTBawWwOrfpt5Dr3Dxe4WqdtNY3DvpDR7dWuS4o9TiKi8t3P+?=
 =?iso-8859-1?Q?BwGdGQ6H3Evl/7kiLbSdxa9EnWQ4O0LbFItee6IfmBtQUsD6E1g/DzI/1g?=
 =?iso-8859-1?Q?N7fP0yWYJa5UpoWKqQ69EAc+jErpq/jOAqW4/rosd8qe4jJwZ2/8OVJbK1?=
 =?iso-8859-1?Q?E6pXoER+qtjJXIyKnLX9I17uzws9ywFYyrA0fhiQcaqyGBnRpT1+tsUClh?=
 =?iso-8859-1?Q?aNHRE+lD7K3hE86Hm5TRd5FKGMEPs47t3IGbDhZPx7kNn0K6a40RGB18Gx?=
 =?iso-8859-1?Q?on1YGl9Awah5UgnFI+bjKZESTwOie0aRETB0FJ3G7JXMwj9o5CJSwcmVDG?=
 =?iso-8859-1?Q?mxevliYoFTb3/NCrjLmqv7LIw+MkdJaCumhfFp+pB76UK8NC6skEke8i9l?=
 =?iso-8859-1?Q?OfFC6eaY0lb9R4jQ/E1uZP56j1oS/8+/5o96i0mvQUFNZTVyDmzINW74hE?=
 =?iso-8859-1?Q?J+MbQqVRw+KlWjj98Sj7o6ODoLw5HzcseFtJrpAJ5ayMLuneD3390ONeyy?=
 =?iso-8859-1?Q?x5aT2Nzu3VffmgHvSArcjvmIFQ/M6+7K9vFKA4HRpianAsdEBKjojrqvFo?=
 =?iso-8859-1?Q?PLMMgEsReg0xFm/Kf+VfMCNX+1c7lx2BOg5cyL3x2yUy+otoPVCNnGN08E?=
 =?iso-8859-1?Q?yvmaysbdu1QD1Npug1EWtXJHz8oGd/Y1RswQiAsxxFGv9O3ayvK1JOA6lo?=
 =?iso-8859-1?Q?HU5Fhc1D+8Uh4RcLIhi8XEkCAoytLS6qhDj31tE1nRHc7Vo2m7CL+jKaT1?=
 =?iso-8859-1?Q?TEecpVbXD85B/BAC/N8j/OPMZTUWEG+1zQz8j+rOLHVs80V8TfKf9xe9g4?=
 =?iso-8859-1?Q?NXXZ4q3LqIGDQplmXGnybLgU2Ys5Sx7rEDqPOauqHIdFi8KVgbC9veYzhB?=
 =?iso-8859-1?Q?8iaLXDJt1l+8HxeIrL27UxpUfVka3W3CfmPuypSQsqMkOcMqMun9f5ZQ27?=
 =?iso-8859-1?Q?2S3F4ZXJdv6F4BeCSemI5oFVrKm+d7Pl1OXSIhGAAkKBGimSZdgzQOLXV5?=
 =?iso-8859-1?Q?XcbVmK1r7VbHQPnwHvDClGUWTNB/L4gQJw5ZX+es7GAxdWUJd48gB62jmI?=
 =?iso-8859-1?Q?moVjwMDFvDptwvDNi4UeQYyhXP7SztEFesRFsX9dDlyr/C2Rvo3gg4nHE1?=
 =?iso-8859-1?Q?EO11z/snInIucI15GfX5eGEmrAP61fKrCI1wqJQVpuF8+9KoRnopwmvTXu?=
 =?iso-8859-1?Q?uM3mfd0PLoXp5GyuZgQS619CkbXrEUoc929ypkbTdIUmzEmKcUbKwcXvLX?=
 =?iso-8859-1?Q?bsYmrw7M0A2WKJCel+kQtpDKmLVshWuLcK+y9Om14SHzj57hZuoYWAVMdv?=
 =?iso-8859-1?Q?O0tf1BvsHlhR6A7LNieIwGlknNkfjgIGr99ntaisz6WHqMVQYWJ2BrVk0p?=
 =?iso-8859-1?Q?KYgphzMCI1q3JSAjRqa1UR7xEFwUmVsD24p+ctUc2LuAUOv+magkp9nw1B?=
 =?iso-8859-1?Q?grUqxotUCSj3fyMIWcCq0eFRPdcw+iqBq3uPwKhFCPxvxLMLVpxN+m/WPt?=
 =?iso-8859-1?Q?17vsbhGco5C7A6xdx/jtptQkaltvoWSIACnlynxhu5CutFtF3VDgE0tjBK?=
 =?iso-8859-1?Q?vj?=
x-ms-exchange-antispam-messagedata-1: nMNdfVUUQDRdlk+BzM1qg5TjJaRFlgZ/jCA=
Content-Type: multipart/alternative;
	boundary="_000_DS4PR02MB11190EFFE070BED87859F8A9B87622DS4PR02MB11190na_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EnTiI5ubCcDfxxDiZXpBEHRcgfzLjKy2HqPLDTryVp+SHUHXhZyNMK2VXNsf6w1fG3de+p6soA5O8GxpSW9FzXih+0oLplUGR1lKPlJgurF4UVs9rxfj8uhVbUYjq6Q/3QbKej8MsVU7Yi6nJXCNM7O9Tv77p7LN4HWm2jHuOWpjTHd8oRUCtSXrStiH3D3jbrHlgFGeZhKg/tYIn14DK30m1EEZgWf5H9MbD2v57AbebK+CK2Mnvemeo1mWp47kHpGy7Y245+dpYkfsR939rj5VBXydIyj3vKYgw9G29JFppDamCgyvElCcbjIUEeHIzHeLdlTxpaShuWV1VT+KiA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: tIL6YgbqgwGLEvlBdcp0J1NRreJGOfGYE18xFIhQkYbehHa/+ZOMTA85/cUsR3KErz9Svk4xBTZAdcHAu0dev8cvDOKUSt5dyAUZvhFlYxyJhH8t7U4vMX1L/qQAOKDqZDlKjGcVOoRmoLTobRrbG7JCqfU0KF8VDoilMo+XF09KaznTCpo8a4W+PYDalUKJCj+5R/9cgKJ7/WQxBTUnFBByteerejaP2GCE6H35ZOc3XKF7xes0KJh+D/OqrzemPlFJWCB/bYSFbfMztck0D+OqrtGy3GxHhfRNU8te55ZphjTi0rN7qfWsICdocSeyGa1BoSjLvoWP+wTuuM3bTi+VGhXmc10/Zxm3MJst6+6bSFYT8vhczwt+6++LqrGgnr3UQ2trepkiLCFOtz6GZ+54btY2qtg8i/Cz9oyz0Y4twq5JxKXzC1BA+MUA3mi3MWsnYxHNai7VRZecECnlysYEMyNFthGS9z/eQL2gRXlxcroyySoA1HyWfcXPew0PPDyooZXZy1U8O8N8OIyMNUJFjAxXy+1K1SI+5506UQcqBYnqsPK3rk4QxHhdUs2hvHxbPyyD9I+rK23TyjkNwkFJibX2QuIzZnwnmFntGhIVbFVVMRIzwDGkk8Pf/t9K
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR02MB11190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa0d9c3-03d0-4d83-9140-08df329eb1d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2026 13:48:47.8320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /QGEH7pHpFsYh5+a86DzsQAkiJGUC1t7b9usvIE725fVC+vwuHLOqJPx4ADBmBPUX80/qLVhOoSvgIizTsBEcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB11316
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDA1NCBTYWx0ZWRfX+qbh9yuM/zZT
 s3ZaH5MDwLLUbX1tQ6/zJ6e+0AZVSv+o9F6OjKYZ01ZG8N5Okoq4ADvD0yHmmhfAVj8/uHTlxZm
 BjW4+iYo7FA4XixBiI93+83qkqhnIm4=
X-Proofpoint-GUID: nfhZKDhqLa93YadAytTLnH1OK-3Vmj_r
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6ade08c3 cx=c_pps
 a=drLWwUu1SPN6c22PCi7Z2A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3-RhneuVAAAA:8 a=_EeEMxcBAAAA:8 a=WfHZuIUsAAAA:20 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=n89uRTh6ABJrdXbcW-IA:9
 a=lqcHg5cX4UMA:10 a=wPNLvfGTeEIA:10 a=3LZwzZelzVVoEMmb0JQA:9
 a=ygGsMerCJzhJuKcM:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=VLVLkjT_5ZicWzSuYqSo:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=bn7x_FpfJtc3yKQXRW3z:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDA1NCBTYWx0ZWRfX0VJTKBvGLSJd
 i1zXiiRMFWHGJMnVrEovFKN2h0o2AX9QizD5ulGLVbRDqrsX9iso2MszBdDpabA73+vBStO3PeO
 1rhVZ/z3quGcESP2iC512H56Dzm2Drs6LuHlU9DPBw4JMEl00opkCEIW06Fk6DqofwSfIy23qxm
 3mRcVigICo1+nDzqlK+q6Ry+rYhPOStjQ6TM4+Liw8OXqp5TK3UaxmdlqqM+UJXWBNbK9AlUgu9
 BdNgsAR19h8n5QUxuXFaqs6RsAtsh+A80aVQXLOEJo6dW8TyPkFe2MxFJzoQI+3bzeS0EIBVl8+
 SOjfAy72j4KbTj/GkSvEnOsoUNNUfzQd45MyfcB5VlJZ8WQO+lG4ZiMBM9uiRoQf+9e97X8SV4s
 uQpRrmJBXE+0rexjDMqWppkOA3152VeZvfVjQuv+yPHPUWq8pw3w1HuVbnOCfQpCOfzAs1fLuHL
 69owUX75C6qaWhszXfQ==
X-Proofpoint-ORIG-GUID: nfhZKDhqLa93YadAytTLnH1OK-3Vmj_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 13:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248606

--_000_DS4PR02MB11190EFFE070BED87859F8A9B87622DS4PR02MB11190na_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi @Peter<mailto:peter.kjellerstedt@axis.com>,

Can we merge this fix and handle the dependencies using RDEPENDS in the ind=
ividual recipes that need them like mentioned above?

Get Outlook for iOS<https://aka.ms/o0ukef>
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Roshan Sivakumar via lists.openembedded.org <ro=
shs=3Dqti.qualcomm.com@lists.openembedded.org>
Sent: Friday, 23 October 2026 13:11:38
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-core@lis=
ts.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Sumanth Gavini <sumanth.gavini@windriver.com>
Subject: Re: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter dep=
endency generator


WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

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


--_000_DS4PR02MB11190EFFE070BED87859F8A9B87622DS4PR02MB11190na_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" dir=
=3D"ltr">
Hi <a rel=3D"noreferrer noopener" id=3D"OWAAM948616" href=3D"mailto:peter.k=
jellerstedt@axis.com">
@Peter</a>,</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" dir=
=3D"ltr">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" dir=
=3D"ltr">
Can we merge this fix and handle the dependencies using RDEPENDS in the ind=
ividual recipes that need them like mentioned above?</div>
<div id=3D"ms-outlook-mobile-body-separator-line" data-applydefaultfontstyl=
es=3D"true" dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, =
-apple-system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" id=
=3D"ms-outlook-mobile-signature" dir=3D"auto">
<span style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robo=
to, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Ge=
t
</span><a href=3D"https://aka.ms/o0ukef" style=3D"font-family: Aptos, Aptos=
_MSFontService, -apple-system, Roboto, Arial, Helvetica, sans-serif; font-s=
ize: 12pt;">Outlook for iOS</a></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Roshan Sivakumar via lists.openembedded.org
 &lt;roshs=3Dqti.qualcomm.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, 23 October 2026 13:11:38<br>
<b>To:</b> Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;; openembe=
dded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.o=
rg&gt;<br>
<b>Cc:</b> Sumanth Gavini &lt;sumanth.gavini@windriver.com&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH] rpm: disable the RPM 6 script interpre=
ter dependency generator</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<p style=3D"text-align:center"><span style=3D"background-color:#ffff00; fon=
t-size:14px; font-family:sans-serif; color:#000000"><strong>WARNING:</stron=
g> This email originated from outside of Qualcomm. Please be wary of any li=
nks or attachments, and do not enable
 macros.</span></p>
<div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
&gt;&gt;Replying here again since the previous reply was sent in a separate=
 thread.&nbsp;</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
I believe this dependency belongs here: <span style=3D"color:rgb(47,111,167=
)"><a href=3D"https://github.com/openembedded/openembedded-core/blob/master=
/meta/recipes-kernel/linux/kernel-devsrc.bb#L460" target=3D"_blank" id=3D"O=
WAd5f51177-808e-1c95-e190-190cd22919b2" class=3D"x_OWAAutoLink" rel=3D"nofo=
llow noopener" style=3D"color:rgb(47,111,167); margin:0px; text-align:left"=
>openembedded-core/meta/recipes-kernel/linux/kernel-devsrc.bb
 at master =B7 openembedded/openembedded-core</a></span><br>
<br>
RDEPENDS:${PN} +=3D &quot;sed&quot; in the above recipe is the right way to=
 do it?&nbsp;<br>
<br>
There should probably be a separate patch to satisfy that dependency.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
<br>
</div>
<div id=3D"x_Signature" class=3D"x_elementToProof" data-signature-name=3D"r=
oshan">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
<br>
</div>
<p class=3D"x_elementToProof" style=3D"margin:0in; font-family:Calibri,sans=
-serif; font-size:11pt">
Thanks,</p>
<p class=3D"x_elementToProof" style=3D"margin:0in; font-family:Calibri,sans=
-serif; font-size:11pt">
Roshan.</p>
<p class=3D"x_elementToProof" style=3D"margin:0in; font-family:Calibri,sans=
-serif; font-size:11pt">
&nbsp;</p>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Peter Kjellerstedt =
&lt;peter.kjellerstedt@axis.com&gt;<br>
<b>Sent:</b> Thursday, October 22, 2026 05:19<br>
<b>To:</b> Roshan Sivakumar &lt;roshs@qti.qualcomm.com&gt;; openembedded-co=
re@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<=
br>
<b>Cc:</b> Sumanth Gavini &lt;sumanth.gavini@windriver.com&gt;<br>
<b>Subject:</b> RE: [OE-core][PATCH] rpm: disable the RPM 6 script interpre=
ter dependency generator</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">WARNING: This email originated from outside of Q=
ualcomm. Please be wary of any links or attachments, and do not enable macr=
os.<br>
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
</div>
</div>
</body>
</html>

--_000_DS4PR02MB11190EFFE070BED87859F8A9B87622DS4PR02MB11190na_--
