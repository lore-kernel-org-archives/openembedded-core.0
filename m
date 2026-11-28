Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8195.1795878813362652434
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 07:13:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qAwjs/lb;
 spf=pass (domain: siemens.com, ip: 52.101.72.64, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJNnqGU0YxGCTXtRyStGLrwzn//M9ub2imDvzH2ehTd+SoJhpJDarc5Q08vasIGWCi1Xaf8f1j4V7+fwOZuS4zPvvk0Ml9vTHxgKubytl279116Unf+YAAes3QsEQ2saKJsj2sCwPQ6hwouRFQZh/O7lMcjMUJRsk2s4NZfGliSZRkKq6VjRNGTA89Fe07UBb7ZnCB7bRiYC6XUSEBVscryP/mrQaSuJ0QKzE4U/UC1x+cbO0si8zlOc0GCfBfZS5NpoyMBMdu5YpxvYAJHQbYtuAAb403FNmFVcmtZva+K1cLxl/rCu9Tl61Wr2lIPTqkIYl6AzdrZMtCUMqeJplA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gApEwtQTHWbAxRepJxjaBrBvqcd4J4zR8QB7wfHyAp8=;
 b=uqe+LF+/JW6D81sKifbpHp00j+n8RGNuzrKPSYtCN0E1qjorM/JiipJWqu7mgJyUADP/gWUuiDPkjrhzIKHTG4ga1tsnYzscDucDwEn6F3q7FNl3rs4NeRx9Su1auWJBSZMTqe7drNeyT+WbboGo2sFT9xnubQWbu0JfQReE23TN2WkJR5lkVBUMTUCK4jjfIBkwEhrzSJuG1y/4Ogb/2qzEdV+Fbiwf2SWJUDOVHoWm0pkCl/X6egvP+BukxeVzTa3WajINQGr6kQKQKtlbZkV2b2Yikd3w8z0+1ZhEWdc9k+CUWD8nycSPybmGo0nSu029tGBnn+AXm39sWSKe4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gApEwtQTHWbAxRepJxjaBrBvqcd4J4zR8QB7wfHyAp8=;
 b=qAwjs/lbiHCQkkXOWmkDLBJeg2Cku0k6pZ50hFbqrFBCHLiWRuRmCDfyR31EtmuTON/H2FgQ669IayUWJqk96puhXa/ocz8mBxVYKkrCHEjkrl4GOEzj5KmvaWnQUYVOQd4hHln0URSEUwXZzMsAikxJx3oVrwRd/QP5l0c8vccRszYG6NNhqtNJHC45d8v6nH9AWB8P4bwI3gQI9fD/mRlTxM/nfBgJ1yU84K08RWqFUIchDNJGYR3pw/B6aV3XBi5MG3hq3XsovtDYrPFQyaLCgTWRAmYKviBN7RJlseZAo8RiTYSSNredO6LuWh6iIjVclD2ijKwNhDC/UWaHtQ==
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::19)
 by PR3PR10MB3947.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:40::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.8; Sat, 28 Nov
 2026 15:13:28 +0000
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f]) by AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f%5]) with mapi id 15.21.0688.004; Sat, 28 Nov 2026
 15:13:28 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"ricardo.salveti@oss.qualcomm.com" <ricardo.salveti@oss.qualcomm.com>
Subject: Re: [OE-core][PATCH v2 0/4] uboot-sign: support an SPL FIT with
 firmware loadables and extra configurations
Thread-Topic: [OE-core][PATCH v2 0/4] uboot-sign: support an SPL FIT with
 firmware loadables and extra configurations
Thread-Index: AQHdeZar0H4rE4Mnq0OCMdX9fLMx/7c7+WMAgAeo0n4=
Date: Sat, 28 Nov 2026 15:13:28 +0000
Message-ID: <AM7PR10MB37454EF6C492D88D76EFAB498E402@AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM>
References: <20261121085937.411140-1-viswanath.kraleti@oss.qualcomm.com>
 <CAA_5yovVqGo6_TgUcAMJVGi4fmMcWa3r_bPV5g37Qb5xyjCviw@mail.gmail.com>
In-Reply-To: <CAA_5yovVqGo6_TgUcAMJVGi4fmMcWa3r_bPV5g37Qb5xyjCviw@mail.gmail.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-28T15:13:28.161Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR10MB3745:EE_|PR3PR10MB3947:EE_
x-ms-office365-filtering-correlation-id: c039d9a3-081b-4f88-f230-08df4d622821
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|39142699007|31052699007|366016|23010399003|1800799024|376014|38070700021|10067099003|56012099006|18002099003|22082099003|55112099003|11063799006|4143699003|8096899003;
x-microsoft-antispam-message-info: f6Lrq1bhVtrqgo5b8vChbbUBWVcMh3Wm6rb5T6yrNXdtxlHh41CRBvA2MfPrPi2mp3tHaIj+vVz6n2WwCN2SOrES5tVeB3nJqEnXpoaewupgTtZgTvQ8wNhThsfOyfVtr8tSd0xMlAjkyTh1Yia42/dD8zZJ7ZHSBp638maqO1I3wsa09OpmXF+UnmsjRTUGQGMKNnfaJtmpLphtuFkxWPxKyU+rliOmdHPYyFhTVy7x7kK/GRb6nYHYNI03m4YBCRzvW4ftDgvRJe1MOe2eZkXfmHD2kBWQLNfaOyYdqHWJAhkMTYnoA7rGJGYY22qW6WhyrYw6w29IKCK0vCgy2A3d9l7OR5Ku7GX/pBml8/T4XqtgWFK+kK/YiJAgZ7GsiWjmc5yqQ7RF+m/6EiDnoYXyhLczIrhjjY6w9YI8FW9UCBx16XCZMlgHO5rlvCCVJiBEGBpY4W0ritkSvOoSl0DKHTM7vTlha4Kwb9LZSbgipAeVj4zFQeWv44YMsSYaUkAmDj5DumPraUKHaNcwdT/MVNJaA2aO5ePIJ+VvHq7053W3V933mLpA3i2edoHd6iEcffipicNTPlQ+7scCIqCvkyRsQ7oPL4jOlWAs15vwaCEm0NpDBKiDLpTVGuL5YgwgFP/rQWQtAUoVX8Xh509JTI6AUeowSx690RYzTjP+IHOaT7Zqe2X8TkYRF7xty8dz4KlxeE0C3nCmSPAj9Wf3RmL48dxWmtHDOjI9nrU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(39142699007)(31052699007)(366016)(23010399003)(1800799024)(376014)(38070700021)(10067099003)(56012099006)(18002099003)(22082099003)(55112099003)(11063799006)(4143699003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3BtPY+NbMzyAjj14HY/+147OOuAH5PtRejKF8YKLx9Irz4AHQXqCMQxJvd?=
 =?iso-8859-1?Q?UeC5+RhDjrvDwUDIUDoFLIN5NjdwQ+y73nQjUAffswGYmXZRrD2c3BJkEL?=
 =?iso-8859-1?Q?fQhd4tfDxLqcmN7xGvXSJqg0tiwrZGzZhC+IJYVv/ZVBdsCv2P0o7sX3HX?=
 =?iso-8859-1?Q?Rols7pS+TfhC9Vb1yg6yxTDj09g5/WgzgXY7U8uUWu6nNh+Ns3tbChy90A?=
 =?iso-8859-1?Q?Fqy2rWmZh0VNNGpWK5F3o29ULYy57hLqgh00tb7awAteytJ9FsqJooYER2?=
 =?iso-8859-1?Q?Af+8AtMfNRI/OGEOyH4e2Kf7D1JBbOm4ZjmXBXngF08G8O7byWaIlLw8oh?=
 =?iso-8859-1?Q?4sSvbK/rYabd9X5h2n6q8c6e6ADIgcUKFDADwN8h7xGk5Y+br2AyLvhrIH?=
 =?iso-8859-1?Q?nrOkL/8qXNCmoccYu/t3SC32PvAAw/4m2Mm3P82r3DN99wBcKQ/u4CycqB?=
 =?iso-8859-1?Q?uQNC8MNhYCqEkSpjVUjuHTjiFYqT+qUvYiRil4S16P4iuLeIODWWVpxR6Y?=
 =?iso-8859-1?Q?sn/j5pni0vub2ZhDi14udI7xk0V5hH/rSmnl+MPyKm/QzeV2J4b+tbiI+R?=
 =?iso-8859-1?Q?Y7AoXVv8icKU6yVHc44hNozTruNaT3dCdHPa6iLOlbSHSf5IYoT3+YgV+M?=
 =?iso-8859-1?Q?/zJQ+LUnhcSWh9LqiHonyCGa3Hn2FUduJzgzCa9hyueZkTAYfHlc2Gjbmm?=
 =?iso-8859-1?Q?1iADLedDRuVcoGj2PZfy8Jk5Tb4xWqnP5qzsaxqLioVwVjf8vMIL0j0y0P?=
 =?iso-8859-1?Q?1/O7fhsZIEyXCecSiLG12Sha5IuKlV5p6Wo5qnjX1vJGJC6F2EFIqyP6E9?=
 =?iso-8859-1?Q?xX1dMVx8L05PJJxknnH6YIeyRQE376j0/x6Ul/jDaJ2GevoBkNEcP/mbj+?=
 =?iso-8859-1?Q?ZajWat0hTHxTdU431AHqi4nxmYYbTy7kgFw9o4AKYSocIdmxqlb39IYpsC?=
 =?iso-8859-1?Q?ppucEd24i+xJgcFu4IatDjBFPY2UP+/Yu7CMpiZQ3VJoThwuTpu6hqztfg?=
 =?iso-8859-1?Q?qbBYp0yrN3/XRs84yN5c6KAD9ghSto1/WKLAecgT1SMa3PLG85KosjTw2Y?=
 =?iso-8859-1?Q?cneP5C4ZwIhstjxc2oA3t43PVRl08rHde2zPTStEp4MNgKE0Lb0ZAumzZ2?=
 =?iso-8859-1?Q?/gpBE8d+ol2FDT1DrMA/Oi++T9ZsKwF6JbSk3uTH8ntEtO7utYxuY+8fwZ?=
 =?iso-8859-1?Q?KRJdKuu+lUF69LZU/VhPlAxVgiB/rUVNT86MZHWd5DVVk5GrECHnhlvae+?=
 =?iso-8859-1?Q?dyBtRjpDOhwxx05LZbhzrZVR7WeXjNq6JBM9V9jHdvxjI43mHRKLoE3qcN?=
 =?iso-8859-1?Q?71Gtuvy6Db81aC8WRzjm3E+VGVnB/pdrKvOWpc1GjI1xRBF3BsQD1fVWDt?=
 =?iso-8859-1?Q?xgLhOZVNR5tou9vCykRTQqgCCERzVcbi+mI2FM1OMjyPTHgm0fDa7SO8Qe?=
 =?iso-8859-1?Q?WAV608pdNFQhRBu1G/8+UO/jR0cTiAXvWBlXrwxD+IMF4QInIyK6HkgwX3?=
 =?iso-8859-1?Q?7A+NNcKdhlIqbBiV+oxE3+S3E0Try0pJZ6sqMYOE6d2e6zSZ2THS0iQ4a+?=
 =?iso-8859-1?Q?vm4d1e3hs3vKsuxQcEx7O9PKS/nDmYJU0HzFkubZgDa0JePkHOI90WPpa4?=
 =?iso-8859-1?Q?zLVeKEMBIDtABYBXGw6Ai3s5FcZkO1UfPy8TuEmljFqz1+1m1yQn+3sZ/A?=
 =?iso-8859-1?Q?Q1rp1sEBAW5W9DuqinJcuBW4Zze0YfpHY053ce5h1SJN5ojDmPd2anz96E?=
 =?iso-8859-1?Q?hvKMeDcb2SJH2q75JG4Thv59W8HCQWtaTJwPc6pDZmiQjmLqjV0P8eK38y?=
 =?iso-8859-1?Q?XbsOLOw2oA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM7PR10MB37454EF6C492D88D76EFAB498E402AM7PR10MB3745EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c039d9a3-081b-4f88-f230-08df4d622821
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2026 15:13:28.5025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iO9IyLk/RIiuh2L/tidTTdw77Z+/ZPWqXqP8eFIHadQ9BPq28OmrGw7CUsVPZv0dEVGYm7VVKwECLi6tN1hjk9Y06F8sHPAB9jgpHuCOkRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3947
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 15:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251500

--_000_AM7PR10MB37454EF6C492D88D76EFAB498E402AM7PR10MB3745EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

v2 looks good to me.

Regards,
Adrian

--_000_AM7PR10MB37454EF6C492D88D76EFAB498E402AM7PR10MB3745EURP_
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
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
v2 looks good to me.</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
Adrian</div>
</body>
</html>

--_000_AM7PR10MB37454EF6C492D88D76EFAB498E402AM7PR10MB3745EURP_--
