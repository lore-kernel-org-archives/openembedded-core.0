Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8874.1793357901774629979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Y6akPs/v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: roshs@qti.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F5Q81120769;
	Fri, 30 Oct 2026 10:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vt1m1ZVMazUB2U0RHkJlpkCb
	kvHjiZY4OHDD6SRv9wA=; b=Y6akPs/v0ZcNubUDT9pkNZkWoGSFymENs46FuVi9
	9+5Ne6FjNQCRqtv7j6YNhAManpMVABNnY8wzaDQA1CeF1h5i9SsLpWD8l1Wp4RXu
	VgR7PES/CGQO5t3mVBzCqRJ7ywQRN5+0KkTd/l8t8HtpS2z9tiAgk6dZCQuwOsZ/
	ZjijujtBviTGayuJxJdWesdaVgbtd/cCJdFwE+IPlG3obLc04SmH1Ohv2OMcOl/U
	d8QGBTV1sppkPVirxtg40O8yuvzXh/wzlU5gsQEUiBlRrCXOeDi0o/bKAa7+bgPQ
	nff4gbJUMaMTmqwoKTvJ2xk4/n05HlhXabSIkL3LEDh/GA==
Received: from bl0pr07cu001.outbound.protection.outlook.com (mail-bl0pr07cu00105.outbound.protection.outlook.com [40.93.4.5])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pjjg9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 10:58:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xS81MT3qAm1PJqYbuRDpsPk9Bt8e7gNz5VC+2vkDZ6B66T+O0u1JnV73SzvAQOq9XcChdmy6vFU5/6ObXZREoDf04tZs398y6h4euqumSVKKNdWMRFT00EhV7xmNrqMPtpIoe378AZ3gb8bYWwvETf3l0wv5fFxZ38MS6l6XbBo0bHjyEp1j+sWuNq1cfu4gf4+uAm0rgNc1NGkFWSibOYDpb2MmJ6CyaK6kqYx/4BUNDjWXlsmB7Tsck2aza4pwPAV+OGd+GpPLbVKuKGCGewo+Av1l5HeguN7cIvN5X9OvatCfWJj1qSYnUHpUG/xwbjdq+i4xghPB96oHYvjv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vt1m1ZVMazUB2U0RHkJlpkCbkvHjiZY4OHDD6SRv9wA=;
 b=LYLeydCu+C67ijBzTefwmEstaJy4TyDdMXwfp3fwVFntxMUc0EXuS1t79+yUVOndJWdU7qtwH9kD+AntwBORTt0D+iNx8PyWoFOx2ko0JiW9hwgnrZgcHbGKrdv87eo3lvNu3HjVoxaWGou3eXCQVyL2QsOuBYDAfZ1CSsK3Fa0//W0vaDSkIum3cCS3bmZChfD4ulICNY92CBxdGTxTux4J0w/kdJ3F5C2wlUoQh0eWMhSToX2khZUvwZCOKLZAF3MtUNysp0r4P00uEV8WTfEWrBT4o8WQ7EztyQBswFaATbj2iLXaxHiSYENDLChM5IsG/NE5RpRSFuL/Rt7YVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DS4PR02MB11190.namprd02.prod.outlook.com (2603:10b6:8:32a::18)
 by SA0PR02MB7483.namprd02.prod.outlook.com (2603:10b6:806:ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:58:15 +0000
Received: from DS4PR02MB11190.namprd02.prod.outlook.com
 ([fe80::aba2:f69a:a7c6:95ca]) by DS4PR02MB11190.namprd02.prod.outlook.com
 ([fe80::aba2:f69a:a7c6:95ca%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 10:58:14 +0000
From: Roshan Sivakumar <roshs@qti.qualcomm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Sumanth Gavini
	<sumanth.gavini@windriver.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        Paul Barker <paul@pbarker.dev>
Subject: Re: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter
 dependency generator
Thread-Topic: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter
 dependency generator
Thread-Index: AQHdYgHpy8hwRXPh30+Uw7KS7+AmSLcUn9+AgAFTkfM=
Date: Fri, 30 Oct 2026 10:58:14 +0000
Message-ID: <DS4PR02MB1119020ECBB039D39BB64FDF6876D2@DS4PR02MB11190.namprd02.prod.outlook.com>
References: <20261022084635.3702905-1-roshs@qti.qualcomm.com>
 <CANNYZj8v+Tk5zkt8tjPvyN31jKhYBLXm9eJgZgawYDiYo3-=hg@mail.gmail.com>
In-Reply-To: <CANNYZj8v+Tk5zkt8tjPvyN31jKhYBLXm9eJgZgawYDiYo3-=hg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR02MB11190:EE_|SA0PR02MB7483:EE_
x-ms-office365-filtering-correlation-id: 1230f19f-f4c9-439e-1ec5-08df3674b221
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|5023799004|11063799006|4143699003|56012099006|261009223027099003|261009221227099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|10067099003|18002099003|22082099003|6133799003|3023799007|8096899003;
x-microsoft-antispam-message-info: u9fhRL+4FTxvjYlZayA/qijc0kYJcyBl1yKdSMaRZpouyWADQN1GOuVES026wjC8rzqc6l+HVbBkQMxNwqU41G3TFr6oPcPpwO5s/WXv0B0tE5h2NAhCVR6AejwWp4daLFK2JR1gQAmEm8NaICYHM6+Yf4xJgssi6tT9o5pERbTkhK9EwvmI6Bh1WxUjflRZsKWqPflmp8clRheiqAQfkKYDpQxIXronbgjghovGimFm5eIwKh89QKs+1Yjam9M+MyXoV5srdFQ22uDdyGlNe8xdV4Bbtq2z6M2Y580yI6aJLKwcYbpxMeDm2rLpknkcR4YUfqroMIJPOKVEmLG/e0hDon+m+q/bWJM2/w6RWqWGmpwBNJmpl1dnmmfWfx9rNXQd1Uw3wlYR57yBqJKwiEVGZfNzFicx9p5UmuB0jTKR/4IySMvv2QSNc4l5wPyWzrWOCX2rbCUF1eLvHlAqbKzaPWJmcg94RmluHQOY3SAa7dsdTt4jwq4m3KPQGTXUCXMkQnjwdlCIY48WikBt0I66PzNaqhhQ6sK6bCX3djk23LXm9/rukOCAOB1E5ij0dbH0V+JDHvUdjunJjyL1KxG92Cd6DbNGXv2yYtI+KgUPQmduQVCQRTKqEJwRvikYYMjF45sRlO0qw+QZm7c84XsevUgPzuhwNnO07L7qGRI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR02MB11190.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(5023799004)(11063799006)(4143699003)(56012099006)(261009223027099003)(261009221227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Uf4lefe7GMS3FD2fOyWMp8lE8BJkgU5vkiksHiFyRr6J0crNOG4KOX/9Z5?=
 =?iso-8859-1?Q?VFtTtuOyhCankEhdIQ94TemEk2kT5uGjg14DIBspoPlmdu7ButTrNaa2pr?=
 =?iso-8859-1?Q?H8mNiQfGCpQqiZeZBHeae/tq943or0loKcsMzfZtsVnJZpk/e4Mo/HKY+I?=
 =?iso-8859-1?Q?LwTaZhHemw8u3KtmE22ISqokPHH5a6IPXwZx1QZOQEojoCMcuCRVqkHu+o?=
 =?iso-8859-1?Q?MrqSfxG8Zdxj7ILbiJE8O5A5MxfhcZHiB3E9Z0mPf3gVvXr6rdJoF9qmoW?=
 =?iso-8859-1?Q?E/hem71Zh5+Jk2+Ik+pacNFbeIM8A4ZzWJ5LDy38ePzU59Ksr2/6VJjPFn?=
 =?iso-8859-1?Q?b0g3m4ocpm3Jw54itf8YslyXNcXCyGorKOD/6suwEzi+yrxvLYxycyJgKw?=
 =?iso-8859-1?Q?pO+CisUyCNS90jDahSpJF+gh3xqN1Z+AcFdeALlrmf7sMsJZAgVhsg8nII?=
 =?iso-8859-1?Q?3UxMISU+bPVD49Tu+xb9RQXhKerR2P5aJ0XKP3aCy+7F96b/iY5kMLNkag?=
 =?iso-8859-1?Q?vgk5h6qtUC4OhLBUyG2mgnU3Tg/o1Ibi1PNAdmObTig2x0bgNYuIJjJ8RF?=
 =?iso-8859-1?Q?nr37CjV8SDVbo85/7Hjn3prMSNM2cQJibwSj6KXrMQAU0F3jegd08pVjqW?=
 =?iso-8859-1?Q?MbXZniQJKOhcYUgbqaOd6cPi28NhclzemjZ0OVaXKXG408SaEw5PQI1xQX?=
 =?iso-8859-1?Q?K/+dPL3pwmAv+OI6UghE69n3H9s3eLokQ7ShyZ1v1G1kn75rdF8Z5ukVZg?=
 =?iso-8859-1?Q?YBm8Xb4XFix4YHXdyHiwLSPxVJfzwld5jrRJ4mhjBnvXsSCVsYadtYmkvL?=
 =?iso-8859-1?Q?QlNhRdund83gQwEA+jvjFHeeRBTGZJxqO2qvxKC/haDxkA3kffVW/KmXIC?=
 =?iso-8859-1?Q?RmOMH7uNPcFEuT5yO9lCj1EaNnQQ3inpEpBYhSRErA3LLoBKbDp4rWMU2P?=
 =?iso-8859-1?Q?7QpRo4GMuvhVQIXfPcFeNj02UQbG4kBTBoMRBpGzVP9YZ6sPNaJPaYt7jN?=
 =?iso-8859-1?Q?oas6chj1tRfu22QEluyZsk9qwizBLFUG8sr/vOeHTNwEajkrCPKSSnn6yj?=
 =?iso-8859-1?Q?M+J569wlRdj9LrsgXOz+6i//AgJDeCAPHGIqqy7Mx3T4u0vlMpsatv6WqP?=
 =?iso-8859-1?Q?w/KgfTybFh9PeAa5nsMXZMRn/SRqZ26Ony0a+yBvr0j5PhDmDw0DkQJdbD?=
 =?iso-8859-1?Q?o1tUlPo3QXkcHTgCrzAY1ByPLuvriFrDmjKCcCBVH7GMAIkTZfPliIjXqI?=
 =?iso-8859-1?Q?/FPZvj5ah6Q00lluTCmEhQzxw+1okENWtBs7KlScnjICVPfICvON2/kqNs?=
 =?iso-8859-1?Q?Mx7n1rBLv7NV2riTZxSOYU18/NPAEKoDP3wS2l918I1w1Xb1LqKeknntLZ?=
 =?iso-8859-1?Q?HKuqfgVGhBbs3RwOeBlRLc8l9KVajo2z2mtM9YcWo9fQOj21bf9MDofUUz?=
 =?iso-8859-1?Q?fWFx9uDQcn0RPin8l2xpIyTqa2rT3s3UeoX8m++FpSDjOIbIqvkEQCOW26?=
 =?iso-8859-1?Q?ByeF49tezc2FKwJwFnT0BLs+fps8eXGmCn6Wi//7/qVG1QqoqSY/nx5wsk?=
 =?iso-8859-1?Q?8NTJkKsByuDGIrsi+ohlq1n/kAYMLyzIPXgyP/m1i2rKGbYGDL4eiEPCZ4?=
 =?iso-8859-1?Q?+RjMx1X/v5BWaywPglg4OdtKNjgP55LeBe9JDIWj40dw4lF7ssB3GWZmt1?=
 =?iso-8859-1?Q?s++CLzLZMAZII/NJ2x3oKZH0PJK3IYVx0fcO3uqeO8ZNevDwyUVGnDtswy?=
 =?iso-8859-1?Q?p0VgzZQgAG4Jq0MCDgEjhMjzUN1OT48Oc3eG+ulQrUmT0+?=
Content-Type: multipart/alternative;
	boundary="_000_DS4PR02MB1119020ECBB039D39BB64FDF6876D2DS4PR02MB11190na_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qEjV1Hi0AjZAWJrNxIU8nYC2aOqhslDarqP9AbhX7fOkYH4itlVDhMcXlgdyleNGveXfykikKkI5947xDVi1Un/8w3vNCKd9hYTgTpy1daf4L3emYPpowKWSjy+51eNPw8NB3gz2bf9qFTNUt5Ibps5kn0o2+YSxG6/f9SYA2TWsCF2//v9gbPJXCf5OJHNNJMXHpfY0a3zSdBAQ/+Iqums7iNUzQZrsOZDaaJROw0Sxr1FMp0nUQxZLI5++ZX+q58wzQc69Kt+mhp8ZCfVxEMYEKGAbZtTA5G2w/KQx2elT0yeqHgdacjL/bU1JQeTE4ZIqeTAL+NNcFXt1s21G/Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: CjsYtJ7PZVzv8mJTOWj66p1ZIOBX/Hn8wvDl+5z6V61J8B4fAnVv1VXvqTz+vxDNtMWL8V3C7MiEYae8hQlAFWDQivLcKpnBZMnxSAGQiMOf3z5R8oUVCageo7NueJmnOJm72P3oP0lkc5C3mVczmVeCb8RLL6eOjLcHUqPrnKdaWg09xk+OHzCCf6Bn0PJ4j1BDHIP2rhp7WqDn8cVZCnoA5qFCIas4dg4EP/LArjKdZE0nEXY7/qKv+7rDLYCRhC16VMg3h8aP49VcUJ38cCbtvXk2i3ugF/ba0wJ+nmjP/3f/WKDgOxlUHhHBgpnRobsC4LL93lXJGaVFw7/pgvERFZCB+5EfKDcooKG8iftM8/jRR6Q6kJYaGCtPVzMHEBJGRQuAahz/L0jCUasfL0khxilzEjJ304IHk3it4XbrqFIoOpsduxpGZ347qW6PshWE4IM3JzP56hn9QCDwhfovW/zRpZcv8Ueka1pHHqniEq30NimbMcVoIbv/1rpt1g6AEFH5rOwiuE1jeYvxYb/sGbjI/VdykeNxpTx6DSs8d0z9RBiAC7Ib8EtdccSJcRIwbCS6Z6mpFMTYreB0FHxBKREM2TRWXEq5M2drX6OSeqUTYf5tfsQq8MumXxrj
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR02MB11190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1230f19f-f4c9-439e-1ec5-08df3674b221
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 10:58:14.2115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qh+88psbt1BpY+JKQhDOVR02jM3otEMRicI0H4ij/vRUwiry0uarFtJcYb6mY1ey5m8z1wtWKDw785XC/ryOTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7483
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfXxSzNeaamGVaA
 pQ066IELOluG7p/1NXYFp8B3B0FAZqWqyGWysnxuOW/SVos43QwNdcYSC4MAfasW2bkM+fZo2mF
 qGtqxyYO9pVSlDjmi5YCf9HaLqGLLjckUWKet4Da0s/jnDJNzm8s1GjgPVNATX4puW/9/HcKv/c
 +FjUDQBWb6/lF/cruhPiJLMgIDuX9DkGHs2r2FcKPxYgpQ5exkJNRDtBGpZxB66/zsoozIG3VKB
 Tw0siTNiGDk3YiNQl0WCKgaL6sr1PSphjCFtGMTxzeegMWdh9uMbJk3FVEnHcFPNXIgROLy2Xdc
 MJmcoiGr/nJjFHdeRKLCjBdtp+gUFMaZP3BIIQ4b6pQu/w5pV1JrKaweOozBgRXrESontvgm4+/
 3020haT4JzoWv8nQWKYEPxKyvvlfpa0ZrW+ui6awfZXRcJ8jSvkeak7fMOVQfJ4nKXkVY+RRA+I
 3PDh0U9slQDYji9EMgw==
X-Proofpoint-ORIG-GUID: U1sa3vB-7eLMGDuYVG7oJq3y35sP0Bzq
X-Proofpoint-GUID: U1sa3vB-7eLMGDuYVG7oJq3y35sP0Bzq
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4784b cx=c_pps
 a=SzPxVFfh7B3C0UVW/03dkw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=zaMboryHWa1J7lJU6hoA:9 a=lqcHg5cX4UMA:10
 a=wPNLvfGTeEIA:10 a=Hcn3069hBYusoJ836sMA:9 a=jjSlll3UALhGpuZy:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX0nQY+uqqbiWk
 T6sGg1LVaNI0JvHClHD+K/pY4BcNZ16OjJPYcKhCq6oepixqUSJvGyudd5B/HMdRsXueJJ6ZoIf
 ZmkGK28Vz5KhtTzdjK5d8NyY1w+Hr28=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249027

--_000_DS4PR02MB1119020ECBB039D39BB64FDF6876D2DS4PR02MB11190na_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

I agree that disabling RPM's shebang-based dependency generator removes an =
existing feature, so I've dropped that approach. Instead, I've sent a minim=
al patch that declares the missing dependency directly: openembedded-core@l=
ists.openembedded.org | [PATCH] kernel-devsrc: add runtime dependency on se=
d<https://lists.openembedded.org/g/openembedded-core/topic/patch_kernel_dev=
src_add/122008476>

This pulls in the full sed package which provides /bin/sed in usrmerge buil=
ds : Blaming openembedded-core/meta/recipes-extended/sed/sed_4.10.bb at mas=
ter =B7 openembedded/openembedded-core<https://github.com/openembedded/open=
embedded-core/blame/master/meta/recipes-extended/sed/sed_4.10.bb#L66>.

Without this, populate_sdk task fails with "/bin/sed has no provider" error=
 in builds where usermerge DISTRO_FEATURE is enabled.

But if the script in a target package refers to /bin/sed, and the target ro=
ot filesystem is not providing that, then the problem is not with the depen=
dency checker, it's with the script and/or filesystem layout. Disabling the=
 check does not address that problem, it just sweeps it under the carpet. A=
m I missing something? How does this work on Fedora for example, which also=
 uses usrmerge?

I agree, will investigate further on this. In the meantime, I'd suggest we =
take this minimal RDEPENDS fix to unblock the immediate issue.



Thanks,

Roshan.




________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Thursday, October 29, 2026 07:29
To: Roshan Sivakumar <roshs@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Sumanth Gavini <sumanth.gavini@windriver.com>; Richard Purdie=
 <richard.purdie@linuxfoundation.org>; Paul Barker <paul@pbarker.dev>
Subject: Re: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter dep=
endency generator


WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

On Thu, 22 Oct 2026 at 12:12, Roshan Sivakumar via lists.openembedded.org<h=
ttp://lists.openembedded.org> <roshs=3Dqti.qualcomm.com@lists.openembedded.=
org<mailto:qti.qualcomm.com@lists.openembedded.org>> wrote:
RPM 4 generated dependencies with the external __find_requires /
__find_provides generator, which OE disabled entirely via
_use_internal_dependency_generator 0. RPM 6 removed that mechanism; for
v6-format packages only the internal fileattr generators run.

I don't understand. What was enabled in rpm 4 and what was not? What ran an=
d what didn't? The above seems to say that rpm 4 used external generator, w=
hich was disabled by oe, but then the disabling statement refers to interna=
l generator.

rpm's script.attr generator therefore runs for the first time in OE
builds. For every packaged executable whose first line is a #! shebang
it emits an interpreter dependency. kernel-devsrc ships
scripts/mksysmap (#!/bin/sed -f) as an executable, so its package gains:

  Requires: /bin/sed

OE manages build and runtime dependencies explicitly through
DEPENDS / RDEPENDS and does not want these. They break real use cases:

- The interpreter path is taken verbatim from the shebang. A #!/bin/sed
  script requires /bin/sed, but under usrmerge the only provider
  (busybox) offers /usr/bin/sed. The literal paths never match and the
  package becomes uninstallable.

But if the script in a target package refers to /bin/sed, and the target ro=
ot filesystem is not providing that, then the problem is not with the depen=
dency checker, it's with the script and/or filesystem layout. Disabling the=
 check does not address that problem, it just sweeps it under the carpet. A=
m I missing something? How does this work on Fedora for example, which also=
 uses usrmerge?

- In the SDK the sole interpreter providers (busybox, coreutils, bash,
  perl) are deliberately banned by target-sdk-provides-dummy, so these
  auto-generated requires make -dev/-src packages uninstallable during
  do_populate_sdk ("nothing provides /bin/sed needed by kernel-devsrc").

This probably needs steps to reproduce, so we can better understand the iss=
ue.

- The requires are non-reproducible: they are only emitted when the
  interpreter is scanned from the shebang during packaging, so the same
  recipe can produce different packages between the reproducible A and
  B builds.

I also don't understand this. How does the non-reproducibility happen exact=
ly? Why would it produce different requires?

This is the same class of regression already handled for the pkgconfig
generator; see "rpm: disable the RPM 6 pkgconfig dependency generator".

There was also a concern during patch review that the checks that the gener=
ator does are useful to catch missing runtime dependencies in recipes, and =
disabling this would regress the packaging quality. Something like this che=
cker should be made generic (e.g. run in do_package, regardless of specific=
 packaging backend). How does this check work exactly, and where is it impl=
emented? Do we have an equivalent in do_package (I vaguely remember that we=
 do)? If there's an equivalent, then why it doesn't complain but the rpm-sp=
ecific check does?

This needs further investigation.

Alex

--_000_DS4PR02MB1119020ECBB039D39BB64FDF6876D2DS4PR02MB11190na_
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
Hi Alexander,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I agree that disabling RPM's shebang-based dependency generator removes an =
existing feature, so I've dropped that approach. Instead, I've sent a minim=
al patch that declares the missing dependency directly:
<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/patch_k=
ernel_devsrc_add/122008476" id=3D"OWAaed867b5-ffad-16b3-55f2-4991d89d2302" =
class=3D"OWAAutoLink">
openembedded-core@lists.openembedded.org | [PATCH] kernel-devsrc: add runti=
me dependency on sed</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
This pulls in the full sed package which provides /bin/sed in usrmerge buil=
ds : <a href=3D"https://github.com/openembedded/openembedded-core/blame/mas=
ter/meta/recipes-extended/sed/sed_4.10.bb#L66" id=3D"OWA22e016e9-b0b3-e96a-=
941f-3a5de4c436e0" class=3D"OWAAutoLink">
Blaming openembedded-core/meta/recipes-extended/sed/sed_4.10.bb at master =
=B7 openembedded/openembedded-core</a>.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Without this, populate_sdk task fails with &quot;/bin/sed has no provider&q=
uot; error in builds where usermerge DISTRO_FEATURE is enabled.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<blockquote style=3D"margin-left: 0.8ex; padding-left: 1ex; border-left: 3p=
x solid rgb(200, 200, 200); color: rgb(102, 102, 102);">
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
But if the script in a target package refers to /bin/sed, and the target ro=
ot filesystem is not providing that, then the problem is not with the depen=
dency checker, it's with the script and/or filesystem layout. Disabling the=
 check does not address that problem,
 it just sweeps it under the carpet. Am I missing something? How does this =
work on Fedora for example, which also uses usrmerge?</div>
</blockquote>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I agree, will investigate further on this. In the meantime, I'd suggest we =
take this minimal RDEPENDS fix to unblock the immediate issue.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" class=3D"elementToProof" data-signature-name=3D"rosha=
n">
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
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Thursday, October 29, 2026 07:29<br>
<b>To:</b> Roshan Sivakumar &lt;roshs@qti.qualcomm.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Sumanth Gavini &lt;sumanth.gavini@windriver.com&=
gt;; Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;; Paul Barker=
 &lt;paul@pbarker.dev&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH] rpm: disable the RPM 6 script interpre=
ter dependency generator
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<p style=3D"text-align: center; margin-top: 1em; margin-bottom: 1em;"><span=
 class=3D"spanWithBackgroundColor" style=3D"font-family: sans-serif; font-s=
ize: 14px; color: black; background-color: yellow;"><b>WARNING:</b> This em=
ail originated from outside of Qualcomm.
 Please be wary of any links or attachments, and do not enable macros.</spa=
n></p>
<div style=3D"direction: ltr;">On Thu, 22 Oct 2026 at 12:12, Roshan Sivakum=
ar via <a href=3D"http://lists.openembedded.org" id=3D"OWA3bc3c223-953b-5d4=
4-52fa-0524e3e23159" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
lists.openembedded.org</a> &lt;roshs=3D<a href=3D"mailto:qti.qualcomm.com@l=
ists.openembedded.org" id=3D"OWA5a05ef81-78cc-0555-df5a-2a0259b2fa19" class=
=3D"OWAAutoLink">qti.qualcomm.com@lists.openembedded.org</a>&gt; wrote:</di=
v>
<blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; border-l=
eft: 1px solid rgb(204, 204, 204);">
<div style=3D"direction: ltr;">RPM 4 generated dependencies with the extern=
al __find_requires /<br>
__find_provides generator, which OE disabled entirely via<br>
_use_internal_dependency_generator 0. RPM 6 removed that mechanism; for<br>
v6-format packages only the internal fileattr generators run.<br>
</div>
</blockquote>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">I don't understand. What was enabled in rpm =
4 and what was not? What ran and what didn't? The above seems to say that r=
pm 4 used external generator, which was disabled by oe, but then the disabl=
ing statement refers to internal generator.</div>
<div style=3D"direction: ltr;">&nbsp;</div>
<blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; border-l=
eft: 1px solid rgb(204, 204, 204);">
<div style=3D"direction: ltr;">rpm's script.attr generator therefore runs f=
or the first time in OE<br>
builds. For every packaged executable whose first line is a #! shebang<br>
it emits an interpreter dependency. kernel-devsrc ships<br>
scripts/mksysmap (#!/bin/sed -f) as an executable, so its package gains:<br=
>
<br>
&nbsp; Requires: /bin/sed<br>
<br>
OE manages build and runtime dependencies explicitly through<br>
DEPENDS / RDEPENDS and does not want these. They break real use cases:<br>
<br>
- The interpreter path is taken verbatim from the shebang. A #!/bin/sed<br>
&nbsp; script requires /bin/sed, but under usrmerge the only provider<br>
&nbsp; (busybox) offers /usr/bin/sed. The literal paths never match and the=
<br>
&nbsp; package becomes uninstallable.<br>
</div>
</blockquote>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">But if the script in a target package refers=
 to /bin/sed, and the target root filesystem is not providing that, then th=
e problem is not with the dependency checker, it's with the script and/or f=
ilesystem layout. Disabling the check
 does not address that problem, it just sweeps it under the carpet. Am I mi=
ssing something? How does this work on Fedora for example, which also uses =
usrmerge?</div>
<div style=3D"direction: ltr;">&nbsp;</div>
<blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; border-l=
eft: 1px solid rgb(204, 204, 204);">
<div style=3D"direction: ltr;">- In the SDK the sole interpreter providers =
(busybox, coreutils, bash,<br>
&nbsp; perl) are deliberately banned by target-sdk-provides-dummy, so these=
<br>
&nbsp; auto-generated requires make -dev/-src packages uninstallable during=
<br>
&nbsp; do_populate_sdk (&quot;nothing provides /bin/sed needed by kernel-de=
vsrc&quot;).<br>
</div>
</blockquote>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">This probably needs steps to reproduce, so w=
e can better understand the issue.</div>
<div style=3D"direction: ltr;">&nbsp;</div>
<blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; border-l=
eft: 1px solid rgb(204, 204, 204);">
<div style=3D"direction: ltr;">- The requires are non-reproducible: they ar=
e only emitted when the<br>
&nbsp; interpreter is scanned from the shebang during packaging, so the sam=
e<br>
&nbsp; recipe can produce different packages between the reproducible A and=
<br>
&nbsp; B builds.<br>
</div>
</blockquote>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">I also don't understand this. How does the n=
on-reproducibility happen exactly? Why would it produce different requires?=
</div>
<div style=3D"direction: ltr;">&nbsp;</div>
<blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; border-l=
eft: 1px solid rgb(204, 204, 204);">
<div style=3D"direction: ltr;">This is the same class of regression already=
 handled for the pkgconfig<br>
generator; see &quot;rpm: disable the RPM 6 pkgconfig dependency generator&=
quot;.<br>
</div>
</blockquote>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">There was also a concern during patch review=
 that the checks that the generator does are useful to catch missing runtim=
e dependencies in recipes, and disabling this would regress the packaging q=
uality. Something like this checker
 should be made generic (e.g. run in do_package, regardless of specific pac=
kaging backend). How does this check work exactly, and where is it implemen=
ted? Do we have an equivalent in do_package (I vaguely remember that we do)=
? If there's an equivalent, then
 why it doesn't complain but the rpm-specific check does?</div>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">This needs further investigation.</div>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">Alex</div>
</body>
</html>

--_000_DS4PR02MB1119020ECBB039D39BB64FDF6876D2DS4PR02MB11190na_--
