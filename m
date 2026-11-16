Received: from mx0a-006e0602.pphosted.com (mx0a-006e0602.pphosted.com [148.163.144.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23209.1794814430563160520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jp.honda header.s=PoD-DKIM-Selector header.b=VXkCiRNq;
 dkim=pass header.i=@jp.honda header.s=selector1 header.b=u2U+pKXV;
 spf=pass (domain: jp.honda, ip: 148.163.144.78, mailfrom: kazuyoshi_akiyama@jp.honda)
Received: from pps.filterd (m0469174.ppops.net [127.0.0.1])
	by mx0a-006e0602.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG69Lt8785280;
	Mon, 16 Nov 2026 07:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PoD-DKIM-Selector; bh=e5hnoh4mRpeuYtOR
	LlY26fdh3fn5LT10t1IchsJfAiQ=; b=VXkCiRNq36HoI76VM8rYXjGs/sJxz5rk
	mMZLdILU92wZZByuipFLcJIZSqGido6xOQNE8+axLNQHLw8MtbJBA/U9rIMpQDon
	hShJ7ipISgfDpU4ikPLCktdnd/TO/QuoeugtrPbjMOkKr8lZaWwNwR0ARdmNVJ/q
	IUhAMeFhZbBVeVp8pMYPk17X8Swp7KogvtGjkufiMU4UlK94ZtfftSyDFC9ZOwtp
	cwGFE9BHy1a5svB8qHEmmqtvME4XQ5dCYOcjlFmGzSLiEHgrc0Cckc//cNiC44mV
	NHiv0KUfNjaGPaAbWvLxtgRDnf/yPl2V8slIKok7fnpnTM8YXw+K9w==
Received: from os0p286cu011.outbound.protection.outlook.com (mail-japanwestazon11010054.outbound.protection.outlook.com [52.101.228.54])
	by mx0a-006e0602.pphosted.com (PPS) with ESMTPS id 4hyvaer98b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 07:33:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMq5qXnmcsnI4olTPPy1xP06DE7sXBL3QhVaymOK2pwReMvBEnOvsQubepqM47LelBowEkxhY1Gqv9ZeB0vnAVmvRlmjbUfUKG+8nYtJE+aWLBGG96quj7pZVU1RNg9imTJIhQZENt4wIbRCTO2MG+MfgJIcsyROUIMRkX2DDU7e1HYaajHTddbvb9htGbzilch4C7b1CKQxlP2QQcClBgC+atmRhTDItLROFfl8BtHuVe8c73IHRa9T9Fnk2oOeF/xVcTqQqBRVSqSUWUs0oNRSVIv+7iHm/J7Uv2qACbh89nOyh92qhVzibTGUxqdK07wkJ68YK6MPDojfKzVdEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5hnoh4mRpeuYtORLlY26fdh3fn5LT10t1IchsJfAiQ=;
 b=k3iPZ8E2xmh6Awrq87X4ScmApfJhrt+jAACLeS9zRzixfR6zQAZHxAnQQHJGzKX0nj2mLONjIftz5uwzO3UND2796NLPIQj5Qji3rXGAPyELeeYn8FJBSh9vN+hDVv/PLc/lPHwMLrSqogQWmUaaLfAmZote3lu9LUVXrw0ajNaQCpwJYmNSQw5x+bE8/Ubki3jYptyFXsCLs5DzgmFfzZYxdm1wCy3oBO9eR1V5qnFH9OiHrSQHITAjS8/lv//U5Ec9ulzciUvRYYcTGE1s3mRYvRTZOaZj452HdJObrLxOtXriHkbecgG1E8lvkibpA7OIei0bfv0Dj+YnoFEwqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jp.honda; dmarc=pass action=none header.from=jp.honda;
 dkim=pass header.d=jp.honda; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5hnoh4mRpeuYtORLlY26fdh3fn5LT10t1IchsJfAiQ=;
 b=u2U+pKXVxeOd6aDC3ARHPXXE6RQoS3uvD0MOdo/8MsnIt3VUc6QngHPrDelYQyzd7F3oarVDXX/YYTMxlRyWCnap+Yq6tQdwa3zoS0w6OiJiScLNlGF3HavajTvUK7LWMjl0t2CEtvw9PepgWiKjzRXNPK25qsOThUOEf6nMJ4yVS809fnleRZCs+O/K+XMvIHc5YFEHIX7H+ISVF48l9iVGWq7G4bQKzRhLryeAE/7R/nydxO5Bwa0n+ObJ3g0uCtz3TBCyWOFN+3PvtS+4d0t76Q8rEBnfUGNxe+Wxjf7Xy5pBZzW1DB0EtTsz0CqnrmJGCZ+GXstFkcNi+pG5VQ==
Received: from TYCP301MB0530.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:38d::6)
 by TYYP301MB1322.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:30f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 07:33:47 +0000
Received: from TYCP301MB0530.JPNP301.PROD.OUTLOOK.COM
 ([fe80::a7c5:dc20:849b:989c]) by TYCP301MB0530.JPNP301.PROD.OUTLOOK.COM
 ([fe80::a7c5:dc20:849b:989c%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 07:33:47 +0000
From: =?iso-2022-jp?B?S0FaVVlPU0hJIEFLSVlBTUEgKBskQj0pOzMbKEIgGyRCT0I3RBsoQik=?=
	<kazuyoshi_akiyama@jp.honda>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "stondo@gmail.com"
	<stondo@gmail.com>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>,
        "jpewhacker@gmail.com"
	<jpewhacker@gmail.com>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "adrian.freihofer@siemens.com" <adrian.freihofer@siemens.com>,
        "patrick.wicki@siemens.com" <patrick.wicki@siemens.com>,
        "stefano.tondo.ext@siemens.com" <stefano.tondo.ext@siemens.com>
Subject: Re: [OE-core] [wrynose][PATCH 0/4] spdx30: fix the source download
 enrichment
Thread-Topic: [OE-core] [wrynose][PATCH 0/4] spdx30: fix the source download
 enrichment
Thread-Index: AQHdcgMXkyJIIcnfikOEqA319jchFrcwVP+o
Date: Mon, 16 Nov 2026 07:33:46 +0000
Message-ID: <TYCP301MB05305DDF05FA2FD678EE3D01EB7C2@TYCP301MB0530.JPNP301.PROD.OUTLOOK.COM>
References: <20261111173537.3653558-1-stondo@gmail.com>
In-Reply-To: <20261111173537.3653558-1-stondo@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jp.honda;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCP301MB0530:EE_|TYYP301MB1322:EE_
x-ms-office365-filtering-correlation-id: b9e73aaf-4565-411b-31ac-08df43b3f355
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|10067099003|11063799006|56012099006|261026135527099003|261026121527099003|261026140227099003|261026130827099003|261028144727099003|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|8096899003|3023799007;
x-microsoft-antispam-message-info: PU5k2p/kU2qa+FRwWc7gC1IFKojncFAD+o/mz+5N/wsw+naampClkPuo2GIQgMc7xbCn8IGI5iJJi5Dg8JnOP7+KT845sP1jr2f0v9lkSiWqzQteL0YtSpXcVK03sZYqVfPpaqUfviIjBE8ZHE/+zXxAGBG6737mzTClggdlHg71jqhs3nLbeqCNlnIBma+ZFC2JrtrLn9GDSVMjNJUj/ZqBpXJ/tyn7fEPwGyhgoMZZ9uJSZam0pRpv8pAJAcAtWsUUVbjHdVOpifdLoEw7jdGlVDBtKt6xHUOJhMk88YShcP1WLzxEYrn515uOAosWmUo1bs0ELF8KxjFZqlq/1b/uR4sq2jceh5DSpwkvV2aDxT3MWiB1OZtntKEXL0f6ZM0Z5k2lNECO0g0nmtZ+u0DG0ZfomtXDUUxUb2VslCrgqrdvtRjt+e/mwjaVyCct6Nmg5I+6vyHnTXhtCWB62gAGdki1slcpo6eqG7VvtTkerdrmgYfswqG235BI0buVXA6P+WL2PVcNl9M1E+hkWGW5XLskDYOVBPtq0aPTDQPAE4Ji+Mj9vLLbZCMv0d13fE1g4q5hfMQKNi0BDxeUUewhK+fmR+fLzB8NyNZ2pNX8sMcWe6ERyG/Mb60J15NnjWCb2epsY7fPh+ixz2uuPmtXWyz4EBbB16Ok1onKdgX3xYNHK2FptFcxxFffWWUOMvZx+xvuzR1DP4mocM9Ta+7zgGbp+nonwspvqvLaylo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP301MB0530.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(11063799006)(56012099006)(261026135527099003)(261026121527099003)(261026140227099003)(261026130827099003)(261028144727099003)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(8096899003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?eFZOQ3dPbk1xYzRERW5yNnoxckdmMVpzTTNnUVo4U3c0SGFoRSt6dlBo?=
 =?iso-2022-jp?B?T3E1SFVQNHBnbUUwbXV3Y3dtTlJlSHhGNDhjR3RqMUExdlYzK2dpd1Zn?=
 =?iso-2022-jp?B?bUp0SDFKWFFZcUw5YXNscHpUWHQ1dUtsbFRnWEdMcUdQa1V4NWhoMnFt?=
 =?iso-2022-jp?B?d29lNndjYm5NMjkxVGVENXNVdWYxNFVOb0RmbEppOVp0ZURuOERaQXRT?=
 =?iso-2022-jp?B?SkZXbmFwOE81d1pyR2F1VXNJdmNVc0dNYVVKZUc2RzdLZ21Zc3JtU0NK?=
 =?iso-2022-jp?B?NDc4bDYvS2Yvb3MrSEpyM3k4eG5kUkdyOC81TTVvWVZvVjZHSUh5RlpT?=
 =?iso-2022-jp?B?OGFCdXFta2ovMFNTSHdNaEtPRGVqVXVuNENvSVdHZWRCd0o0dnVKTVor?=
 =?iso-2022-jp?B?eW9tY0F2OGVPVFFPWXVDTTBmeHl2aCtCM2xyVU54dm5KSk94cWZLNnV4?=
 =?iso-2022-jp?B?c3dPMUVLc1dRL3kya29QalJoaXNiMXJuQkpsVDdySFIrWXNtcHlKVmtW?=
 =?iso-2022-jp?B?T1FZT3YrQTN6VG9BYk1sSUVtLzJiUjFERXdqWEY4TG91M05KbnExRCtL?=
 =?iso-2022-jp?B?Q2w5VHRycm5XMC9YQlIxL040TzFSYUJQcVp4eG8wWmJLU3ZlVHlOQWJZ?=
 =?iso-2022-jp?B?R3dUdm13WFlNaEJCalhhSkdIMG9hT0tlYktWTFk4eWtMTHRBMWlqLzQy?=
 =?iso-2022-jp?B?KzN4UTJlZndOOEc2UnRlTzE1S3lrNUVyd1dxNlBlb3ZoOVI5QXJHalJu?=
 =?iso-2022-jp?B?bDl2dnRydXlDd0JsbXh6eXdrZUlXcHVBejN3ZXdFMnViWnpoL0paclBp?=
 =?iso-2022-jp?B?dnAvUnJBRGNuYTk2VUx5V096cUJhSDJ0NDlrVkpIQ0h6bUdCSk1qcDNO?=
 =?iso-2022-jp?B?ZnZSRmxIdCtpbEhublFaN2VMeVRKMkNBa1ZTWHMwUEk1djlITnIwN1NN?=
 =?iso-2022-jp?B?Skw3eE9saytvQmZaZ25qSnpXWFA0ZmJOV0RHcnN3NnBZUlV5QlEveEtv?=
 =?iso-2022-jp?B?QUFEMTVRc1kzV1h4UXpkVDdzalpsakFOdmsxMktmYldOTWduL1ZTYitG?=
 =?iso-2022-jp?B?eDJkS05kR2xWakc3a3pqZzhCMDJpZ0JJZ3dHVlZoMVp4S2FpdXNMNC8z?=
 =?iso-2022-jp?B?dlkyNmJWUTlyLzRhTGpiSlphL3FzeDNwRXZzYXRCbVc4SjY5TjhKYVJj?=
 =?iso-2022-jp?B?clJUN3hSMnhTTTV6NnpISkk0ZWlDSXJYOGw2SHNsRm8rYXM0RWM2TFlL?=
 =?iso-2022-jp?B?TE11ZWV0cnQ1bnFENmE4bW9razFZSGlRS3pMMFBTNU9IRm5BaWpaalFi?=
 =?iso-2022-jp?B?V0NwbU92dzNYRGpMSStQbTlaY0tvK2hlRVkwaHZia0g0QXU4VWFRYnN3?=
 =?iso-2022-jp?B?TGxCOEFtTm5zbFNVbTk3a0J6aXR4allPMksrNG44VGR4UGxrdEg0dXpy?=
 =?iso-2022-jp?B?bFN6K3h1YkxsYjcvS1lVR3d1RDNrRFVWdmdaMFhuU1FWWXZINGxGTkNz?=
 =?iso-2022-jp?B?ZDMzWGY2Q1M5T0phbXJnSVgzdU9IUk9va0ViOU9mYzlqZ29oNHp3OTd5?=
 =?iso-2022-jp?B?dysxRXBWRWYwaVJmSTJhdTFZWDNDSk51WjMyYW9QUFcyT1FYMUMwSFRh?=
 =?iso-2022-jp?B?NDFrem1Jamx3NlFMUjd1R2FVM3ltcU9UZVhqQWxFZThhOWxUQlZJT3NJ?=
 =?iso-2022-jp?B?eTVxd2V3V2NpeFBEUUZSRTFjTU1OeWRaZkxCT0hSNVJnTnlsR3d1V2Vp?=
 =?iso-2022-jp?B?ekJRMzV1UUVHVDVweUJDelgxNzdoOUFuZVNydER1c3BvbHJKNkttV2ZH?=
 =?iso-2022-jp?B?aE9vb1laOWJOS1hKZEd2TGx3TUhlSmh2U1ZIYXk4cmM4djBnN3NodGdH?=
 =?iso-2022-jp?B?NGIyUHpoamdqejlSUDh6VUs2UEJzbjZSckVJbWFsYlc3SDlXRU9Dc0w2?=
 =?iso-2022-jp?B?ODBHL3YxSDU0Y01uZFBlU2UwZWpaSlZ1dUNqeC9sVHhVUTB4L29NSlJo?=
 =?iso-2022-jp?B?SGtnZDU4eW94ZkIxZXhwZnpya1NFZjV2d0wrRC9kYXBEQ2ZkQ0Q2MVJ4?=
 =?iso-2022-jp?B?SnExU1JIeU9SbWU4S3VqVEh2Z1JWYUVBWkVOV3JBNFJpOVF1dCt6ZStY?=
 =?iso-2022-jp?B?NHl3dGZoZlBHK2pzSzN3ODhFYnY1UTlScmZTdTJTbDdETXd4bnRjTHFm?=
 =?iso-2022-jp?B?OG1GclI0V2pVNDAvL2Q2cUFRZFF2dStMMElSc24yRDZ3dEFNOG43cjIr?=
 =?iso-2022-jp?B?Qjhnc2RpSlBLQjZOdHZHajNpMlFTakQxZGI4eTZ6SGMwdnZlNzM2SGY2?=
 =?iso-2022-jp?B?N3dhTEtGSE8vS0xJOG5yL3pUNDZHTm1SM0JxS1BZdk55eU5uK253TnJK?=
 =?iso-2022-jp?B?MElVK0cwd1JXVXQvWnNkeHpBZjRuZlZJQnFuOGxYQjdjcDBxRzVLKy9s?=
 =?iso-2022-jp?B?eStRTkVzdGw5WFN4ZDdLeHd5S0JsTmVMdzNMZ1IvaWNXZFNQY1BCYUtW?=
 =?iso-2022-jp?B?RDh5MnJTWEVHTjdWcEVYK1diWitZY1pVOUdudz09?=
Content-Type: multipart/alternative;
	boundary="_000_TYCP301MB05305DDF05FA2FD678EE3D01EB7C2TYCP301MB0530JPNP_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qYtLqfRASfzlIJGD2Qtd/BUhTZ5lfXyIl1588NVQHUggUI14mcd0vG1ew1Ww5s1hBuFgGe1FHJalRYysjUWFAohFACF5T36GIjc/HGGJkLg/nxX7YUQSJSShv9CltX8QAqaKoE8JKAG+OBcupJQyHNLNuCun3tcL4OeE7Q/SoRCvvYG/Dj3jjy5tfpzRAM/eYsiAk1DGGYKixF6lZcsZIFzomGy6d7VL9WDeJoYiAbnyGDwVbJ/vIHyxLwvZts07JyReuRvzvp++P+uSCtENEo3ZOch/vOUnns827OvS14uTbQfxuMbcllzemRWdovKZBJeSqLTssch3AEgAR4NSjA==
X-OriginatorOrg: jp.honda
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCP301MB0530.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e73aaf-4565-411b-31ac-08df43b3f355
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 07:33:47.0101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cc138ffb-9c4d-433b-b211-d4549ae62e8b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e/eSviPNLDflbJPhUSEzUrYj73n71QOjeotsgXeUgiL7vP5PIsDL5VrUCIC3njJG/5mkKRU5xK0lNNB4cCHHr93Fsmgj5nUMYQI2Lt8q2MU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP301MB1322
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 07:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250315

--_000_TYCP301MB05305DDF05FA2FD678EE3D01EB7C2TYCP301MB0530JPNP_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

Thanks for the backport!
I was planning to do it myself, but I couldn't find the time and kept putti=
ng it off.
This is a huge help, thanks!

Kazuyoshi Akiyama

________________________________
=1B$B:9=3DP?M=1B(B: Stefano Tondo via openembedded-core <stondo=3Dgmail.com=
@lists.openembedded.org>
=1B$BAw?.=1B(B: 2026 =1B$BG/=1B(B 11 =1B$B7n=1B(B 12 =1B$BF|=1B(B (=1B$BLZM=
KF|=1B(B) 2:35
=1B$B08@h=1B(B: openembedded-core@lists.openembedded.org <openembedded-core=
@lists.openembedded.org>
Cc: yoann.congal@smile.fr <yoann.congal@smile.fr>; jpewhacker@gmail.com <jp=
ewhacker@gmail.com>; peter.marko@siemens.com <peter.marko@siemens.com>; adr=
ian.freihofer@siemens.com <adrian.freihofer@siemens.com>; patrick.wicki@sie=
mens.com <patrick.wicki@siemens.com>; stefano.tondo.ext@siemens.com <stefan=
o.tondo.ext@siemens.com>
=1B$B7oL>=1B(B: [OE-core] [wrynose][PATCH 0/4] spdx30: fix the source downl=
oad enrichment

Hi Yoann,

This series backports three spdx30 fixes from master to wrynose, plus
their tests. Patches 2 to 4 also go to blacksail in a separate series.
Blacksail already has patch 1.

Wrynose has 9f1825e74d ("spdx30: Add Git version and PURL to source
downloads"). It adds the commit hash as version and a purl to the Git
source downloads in the SPDX. That code has three bugs, and master
fixed all of them:

1. spdx30_tasks: Fix duplicated revision in Git PURLs (e31479ddba)

   On wrynose, every Git purl has the revision twice, for example
   pkg:github/fastfloat/fast_float@<rev>@<rev>. That purl is invalid,
   so scanners cannot match it. Master reformatted the file after this
   fix, so I applied it by hand. The change is the same.

2. spdx30: Make source download enrichment part of the task signature
   (e57ec14f8d)

   The enrichment code is in two functions whose names start with an
   underscore. bitbake leaves such functions out of the task
   signature. So do_create_spdx did not track them, or the
   SPDX_GIT_PURL_MAPPINGS variable that they read. After a change,
   bitbake restored the old SPDX from sstate. The fix renames the two
   functions. As a side effect, the do_create_spdx signature of every
   recipe changes once.

3. spdx30: Enrich gitsm source downloads like git ones (1e5146d8f9)

   This one can look like a feature, but I think it is a fix.
   9f1825e74d enriches Git source downloads, but it checks only
   fd.type =3D=3D "git". gitsm is the Git fetcher with submodule support,
   and it has the same revision. So a recipe that changes from git://
   to gitsm:// loses the version and the purl of its main repository,
   with no warning. The fix is one line.

4. oeqa/selftest: Add tests for source download enrichment
   (3ca309cbd3)

   Two selftests for patches 2 and 3, which fail without them. On
   wrynose, test_git_purl_mappings_rerun_create_spdx also fails
   without patch 1. That is how I found that wrynose does not have it.
   If you take only fixes, you can drop this patch. Patchwork can show
   it as accepted already, because a March commit (9a622a2062) has the
   same subject.

I tested the series with oe-selftest -r spdx.SPDX30Check on wrynose
(bitbake 2.18). All 14 tests pass.

KAZUYOSHI AKIYAMA (=1B$B=3D);3=1B(B =1B$BOB7D=1B(B) (1):
  spdx30_tasks: Fix duplicated revision in Git PURLs

Stefano Tondo (3):
  spdx30: Make source download enrichment part of the task signature
  spdx30: Enrich gitsm source downloads like git ones
  oeqa/selftest: Add tests for source download enrichment

 meta/lib/oe/spdx30_tasks.py          | 17 +++++-----
 meta/lib/oeqa/selftest/cases/spdx.py | 47 ++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 7 deletions(-)

--
2.56.0


--_000_TYCP301MB05305DDF05FA2FD678EE3D01EB7C2TYCP301MB0530JPNP_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Stefano,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
Thanks for the backport!<br>
I was planning to do it myself, but I couldn't find the time and kept putti=
ng it off.<br>
This is a huge help, thanks!</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Kazuyoshi Akiyama</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>=1B$B:9=3DP?M=1B(B:</b> Stefano Tondo via openembedded-core &lt;stondo=
=3Dgmail.com@lists.openembedded.org&gt;<br>
<b>=1B$BAw?.=1B(B:</b> 2026 =1B$BG/=1B(B 11 =1B$B7n=1B(B 12 =1B$BF|=1B(B (=
=1B$BLZMKF|=1B(B) 2:35<br>
<b>=1B$B08@h=1B(B:</b> openembedded-core@lists.openembedded.org &lt;openemb=
edded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> yoann.congal@smile.fr &lt;yoann.congal@smile.fr&gt;; jpewhacker@=
gmail.com &lt;jpewhacker@gmail.com&gt;; peter.marko@siemens.com &lt;peter.m=
arko@siemens.com&gt;; adrian.freihofer@siemens.com &lt;adrian.freihofer@sie=
mens.com&gt;; patrick.wicki@siemens.com &lt;patrick.wicki@siemens.com&gt;;
 stefano.tondo.ext@siemens.com &lt;stefano.tondo.ext@siemens.com&gt;<br>
<b>=1B$B7oL>=1B(B:</b> [OE-core] [wrynose][PATCH 0/4] spdx30: fix the sourc=
e download enrichment
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">Hi Yoann,<br>
<br>
This series backports three spdx30 fixes from master to wrynose, plus<br>
their tests. Patches 2 to 4 also go to blacksail in a separate series.<br>
Blacksail already has patch 1.<br>
<br>
Wrynose has 9f1825e74d (&quot;spdx30: Add Git version and PURL to source<br=
>
downloads&quot;). It adds the commit hash as version and a purl to the Git<=
br>
source downloads in the SPDX. That code has three bugs, and master<br>
fixed all of them:<br>
<br>
1. spdx30_tasks: Fix duplicated revision in Git PURLs (e31479ddba)<br>
<br>
&nbsp;&nbsp; On wrynose, every Git purl has the revision twice, for example=
<br>
&nbsp;&nbsp; pkg:github/fastfloat/fast_float@&lt;rev&gt;@&lt;rev&gt;. That =
purl is invalid,<br>
&nbsp;&nbsp; so scanners cannot match it. Master reformatted the file after=
 this<br>
&nbsp;&nbsp; fix, so I applied it by hand. The change is the same.<br>
<br>
2. spdx30: Make source download enrichment part of the task signature<br>
&nbsp;&nbsp; (e57ec14f8d)<br>
<br>
&nbsp;&nbsp; The enrichment code is in two functions whose names start with=
 an<br>
&nbsp;&nbsp; underscore. bitbake leaves such functions out of the task<br>
&nbsp;&nbsp; signature. So do_create_spdx did not track them, or the<br>
&nbsp;&nbsp; SPDX_GIT_PURL_MAPPINGS variable that they read. After a change=
,<br>
&nbsp;&nbsp; bitbake restored the old SPDX from sstate. The fix renames the=
 two<br>
&nbsp;&nbsp; functions. As a side effect, the do_create_spdx signature of e=
very<br>
&nbsp;&nbsp; recipe changes once.<br>
<br>
3. spdx30: Enrich gitsm source downloads like git ones (1e5146d8f9)<br>
<br>
&nbsp;&nbsp; This one can look like a feature, but I think it is a fix.<br>
&nbsp;&nbsp; 9f1825e74d enriches Git source downloads, but it checks only<b=
r>
&nbsp;&nbsp; fd.type =3D=3D &quot;git&quot;. gitsm is the Git fetcher with =
submodule support,<br>
&nbsp;&nbsp; and it has the same revision. So a recipe that changes from gi=
t://<br>
&nbsp;&nbsp; to gitsm:// loses the version and the purl of its main reposit=
ory,<br>
&nbsp;&nbsp; with no warning. The fix is one line.<br>
<br>
4. oeqa/selftest: Add tests for source download enrichment<br>
&nbsp;&nbsp; (3ca309cbd3)<br>
<br>
&nbsp;&nbsp; Two selftests for patches 2 and 3, which fail without them. On=
<br>
&nbsp;&nbsp; wrynose, test_git_purl_mappings_rerun_create_spdx also fails<b=
r>
&nbsp;&nbsp; without patch 1. That is how I found that wrynose does not hav=
e it.<br>
&nbsp;&nbsp; If you take only fixes, you can drop this patch. Patchwork can=
 show<br>
&nbsp;&nbsp; it as accepted already, because a March commit (9a622a2062) ha=
s the<br>
&nbsp;&nbsp; same subject.<br>
<br>
I tested the series with oe-selftest -r spdx.SPDX30Check on wrynose<br>
(bitbake 2.18). All 14 tests pass.<br>
<br>
KAZUYOSHI AKIYAMA (=1B$B=3D);3=1B(B =1B$BOB7D=1B(B) (1):<br>
&nbsp; spdx30_tasks: Fix duplicated revision in Git PURLs<br>
<br>
Stefano Tondo (3):<br>
&nbsp; spdx30: Make source download enrichment part of the task signature<b=
r>
&nbsp; spdx30: Enrich gitsm source downloads like git ones<br>
&nbsp; oeqa/selftest: Add tests for source download enrichment<br>
<br>
&nbsp;meta/lib/oe/spdx30_tasks.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | 17 +++++-----<br>
&nbsp;meta/lib/oeqa/selftest/cases/spdx.py | 47 +++++++++++++++++++++++++++=
+<br>
&nbsp;2 files changed, 57 insertions(+), 7 deletions(-)<br>
<br>
--<br>
2.56.0<br>
<br>
</div>
</body>
</html>

--_000_TYCP301MB05305DDF05FA2FD678EE3D01EB7C2TYCP301MB0530JPNP_--
