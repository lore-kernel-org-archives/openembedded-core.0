Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27035.1793128952342019074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 12:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=s7qIjS6a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4760c3fcbc=saisireesha.t@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIH00r3673810
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 19:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=L2xDU8TurKQK1/vTs/bn0V
	DoU+M1gK7tY7eOEfkVfOs=; b=s7qIjS6ap6Jkc1xzasQTpxYXtow6IDH4ez9k0K
	wFgrnGbgrEIlEJUay8VEbajNqNJWloiHf9huig2aZmGcypd6LTJFd1Qakms+ThCf
	AnNzNkF9zCc9riAK4dkYBIs1CRvh0GZFuRzQkBcj6rQh2yApSZRsgGfS7ZG1ooWx
	iZp4MYPnVqECTTI0rsRLRllPCMsaGeqJz26lxNDkGoYNYVI3iU68HpUXw3OQxSzB
	I+OpXJWtPPIcv4zrwTwiegXY7dKG3EyRGLWaN2oyvbIbLMyV9MwYwigBw8qX+yMR
	VCLxkSUw1vhCUvKl3DZjlP35vIk8sKRYtnSNGXYz57Wz/Ykg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020095.outbound.protection.outlook.com [52.101.85.95])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hghvxd1ft-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 19:22:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGRrqDUR2mXHf8z6l92iYNULVXGSQaBJo3eIGlLlo092YU/irrf8xexK2daPjmbQrXQ1HFXpm/1yMgD/T7MNBEBq9GXwxk9Phhx7BoJ6ypg+25WBBv1j2ZDPGfXPs22397sfCRHRgyj1elA1Gs63jwpmwOlRP1yJD6sBaiCAim++P7u9dPCNEHo3JEYk9CcLpxU/bYEuKKaa/MwO8XKuUhCBjmbomi0FA+BlRv0jJ2w2MVz3h6uIylf5qJ9Nj4ESvec8JIkWGui/XA/C3qkek0TotZn1c/MZfXlK/r7dijma2fveOXJL3AZ18PkPPNOcONj1I2a3hSVSyLiW8Bjoyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2xDU8TurKQK1/vTs/bn0VDoU+M1gK7tY7eOEfkVfOs=;
 b=l1gPznEQML4VYeSXDfDEeAfQ9oRcFlvCJ6HFnWR7yZ8rq6Cc8onlRMnSc0gKfapWAVgdV941vCaYgN9gP8XBH3wqy3C5iCfn3IX9NrxgakFTqt8Ze+X4C4UnOmxxtQz/KRX0Bv5cim+Icuit+kWvcz0Odoy3wLZ9GWtyPzzxwxPtO6InpWM2J8DDs6MqnBhTCJANmHYwicCpqpsxqcUxPvSEwNOfbxBkJ74utjDJGa46bJrd+xPqQuUg4VUteJhyjxfrDXCbG5eOFeFr/kUSwc2BLxnjCs22WdsKIS+R8zhrCOc145ZINBCTdOYNQBoKECgbFJxRr9Loio4dWVJB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 by PH0PR11MB4981.namprd11.prod.outlook.com (2603:10b6:510:39::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:22:26 +0000
Received: from SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102]) by SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102%3]) with mapi id 15.21.0546.019; Tue, 27 Oct 2026
 19:22:25 +0000
From: "Tirumala Pudi, Sai Sireesha" <SaiSireesha.T@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "quic_vkraleti@quicinc.com" <quic_vkraleti@quicinc.com>
Subject: Re: [OE-core] [PATCH]
 systemd-boot,systemd-tools-native,systemd-boot-native,systemd: upgrade 262 ->
 262.1
Thread-Topic: [OE-core] [PATCH]
 systemd-boot,systemd-tools-native,systemd-boot-native,systemd: upgrade 262 ->
 262.1
Thread-Index: AQHdZKEh1/srbEreokK55zcrlhSxo7cRx3yG
Date: Tue, 27 Oct 2026 19:22:25 +0000
Message-ID: <SA7PR11MB959419FB76DA1D8DA2EC4673E8602@SA7PR11MB9594.namprd11.prod.outlook.com>
References: <20261023191044.3603305-1-saisireesha.t@windriver.com>
 <DME2P9H79X8M.2UKMXPNGXMJUO@bootlin.com>
In-Reply-To: <DME2P9H79X8M.2UKMXPNGXMJUO@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-10-27T19:22:25.333Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA7PR11MB9594:EE_|PH0PR11MB4981:EE_
x-ms-office365-filtering-correlation-id: f00023a8-97f5-43c7-db95-08df345fa22f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|6049299003|23010399003|1800799024|22082099003|18002099003|6133799003|261026121527099003|13003099007|4053099003|4013099003|8096899003|56012099006|4143699003|11063799006|10067099003|261021121427099003|261022105027099003|261022115727099003|261009223027099003|261022075727099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info: sLjLaoLZ2I9r1cJHjC0Zq0qmT2yOoFT5UYav+CkBft9NgyjSaQDCi1QBR+AQELRkBggTv4s9wIm36rBPhE6KM14zwXY4V2cDAOIDfr+2I+mY2HZdXpNR2+WO8lOH1yqeiNYCgE2HzjB3Iu5PA7xypNyyVmQpzRSu9Gn5ImW7VzBrsTLTHZllzI5Meez/+kbm9MUgiX3uLKBp3ujUsQF9TwzZu19U4e2vzef6JoUlJXrjfI7DiYTRsihjRBYYdQyVVridaUZb1F0L7bpEV/4WI8DVtKFhN7+mwNBhdmid6o7W3ZfSEg0WN0tnLVHBEJFg3/aSf6Gz3oEm7fW3G6BDQbYhQKSeWs8g/yLw5c5doop0cN5fWS/dWIbubBDqVxS0qRaaHfYtYpYbuo6gHSPhRpGnGsCpolrHSDWG3Yqs6xBSWrCwYla4n2nhkvUU+yOo9b5GjA8siOv2xU3UmJwJiCY3WVBU+0uRaUaHuEWw+O3AmP5oZHvtymOuyMRDvR5xg0YQclcL9Th4rekehnxb5xAkwDiOLfqDmWZ1SNMBluwI2CtS/Siz6xqc7R6XBRCeqB4aGPWxiBSwKu/n9TpLLL64gNP/YgfTK1LTmxcXUekRGAjSn86/iQHyHswTyebWxBmOzHwruainmB0JS3MrGgSr1JIP0fl7ETfdPFrXo10=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA7PR11MB9594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(6049299003)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(261026121527099003)(13003099007)(4053099003)(4013099003)(8096899003)(56012099006)(4143699003)(11063799006)(10067099003)(261021121427099003)(261022105027099003)(261022115727099003)(261009223027099003)(261022075727099003)(261026140227099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?/WFQVOTzfv6Vc3/E6uEYpvH+uVRDeorvlIISMZY7ckpfmyRhAsd0mcPj?=
 =?Windows-1252?Q?hbRFqtHpPaRRc32/2Ucsv+fKUvMRmpEejFNP8F0FgHlzXu04P/PaP4OR?=
 =?Windows-1252?Q?Y2ZpX5Lq5btW1LQMc2HiI67c77h+ijibkKqarh6+Uv7mmdwfESbe5qqi?=
 =?Windows-1252?Q?w/NTGqn8FRMZ0AJp7wyOVSW6sHci2ioXBcXvVbMh9uETYAZYngkuqTBr?=
 =?Windows-1252?Q?HwN/yt+HMrwmrFopB3Y629XPRdVa1sBBvveFAYIuZCkGOKhF05lZ9Ynb?=
 =?Windows-1252?Q?uZ+qJEkdBE9Qtxm1o7Z05ShVn+Gueakb6lOv9/ZQ+CnlQ6iDw3BZ6/6J?=
 =?Windows-1252?Q?dnCDUKWtShGR9csnbNwBbCBFONOjGvSsEgb9UQAwZa5Qlo5xmmSUYDuV?=
 =?Windows-1252?Q?NYLtRnwnGg8zGDT0prcp61t/R5pD+xqC45g3I/UghyBjgYtXlGrLenYA?=
 =?Windows-1252?Q?jjOGL7/aiJqWFdMnMk0qzqPNgBedvLYVwMKMFheNZu4NwdaVTlNrBBTl?=
 =?Windows-1252?Q?Tt3HXHaU8WwD9PcYEOWCLLV074H7+zhjksPxFkSqazcETq8uapBkEriB?=
 =?Windows-1252?Q?WrCiBH1I7CV0+jG58tJTo0T9xgmfBFm1f8B59YrwZAv33eAqcB+iZ00b?=
 =?Windows-1252?Q?OVO3svxmVUuz4SPvK5FnPMySUhXtvwDWG84eI3XD6o5no7cOxs8Jcbup?=
 =?Windows-1252?Q?m0lITktd1JiOOcED1dYDXjoHbqtT1+378udV229MZQd1NvXWigAiho2k?=
 =?Windows-1252?Q?b9K6IIjzM7V04wVvnJ8RkUFw3Go+3wqid3XtjboSMQQ4ZjnNT8GcYUnj?=
 =?Windows-1252?Q?zASh5VXH1hW/IySmR9iYS3ZBa6dOlNIBYrjqB5mqDAj9yq+oKTP2esxp?=
 =?Windows-1252?Q?CpoGRw5omk8KBJRvQ21vJxvNuNuhRaTy1s7EMoZFvLxbkjIaNvhhP+LB?=
 =?Windows-1252?Q?7o+mqEbKGEh02v5trFhm+Vet0pn2TVc3bKSOWMNsl8dILcUi25KAE3gd?=
 =?Windows-1252?Q?bkzY+/5kFCDQRcolgN+AyXRgWzF6x2gtuG28D7c9VXSg167XOtaOY39B?=
 =?Windows-1252?Q?GAK/uVNhYrdLrz+72eNOw+1W7OIQSy8KVf7cFWZAOMyJEHgTl04OnUiT?=
 =?Windows-1252?Q?IsBOa6U7VZwVoUVIQjhfIXEm3GlPPm5rAYkH7bTeBO9itaDC9+a4mIbi?=
 =?Windows-1252?Q?APmxVL7vj9TmoeTXTNjSzB+Ge1+wn290b9uc6JjCn/2J0aFiWggokp6V?=
 =?Windows-1252?Q?Fp/ClxUCGa+lkLJ0QA+Xh3jv4VZu0G3JASfOpVoikUos7n38MIRmGIey?=
 =?Windows-1252?Q?2sioP22qyNqFBOjgUKaRdDTMPLElwk5Bi99zRazIU/8yzxihEgLjjxAL?=
 =?Windows-1252?Q?96OZArv0BCjgd0v9VZyxQUuUW9xXdIzi8uTWwQSUrU34P2Ac6gzIEseS?=
 =?Windows-1252?Q?B5mpWzxEUPAzmB2LzypRP77HxmEe22xntgES06lxBcENs1JLgEkW7Kmt?=
 =?Windows-1252?Q?RGtvhAX5CPnJbvPk9YLEoxVOedh6dWXZsqFKi5gXJ5BtNaLasAoAc60Y?=
 =?Windows-1252?Q?lBjwwDgy3YR7L5vBsXkNWk47fP3k0Ajw3ShyGgjXjpuNQlfQmiuKolk2?=
 =?Windows-1252?Q?tfaguJofPEJK2rXQOvKlg0Swe21Zhcp92RIx6QvQcQfhrjZjM5e8UvYp?=
 =?Windows-1252?Q?jP9o+gjbQDrFJrtCwCiJ1fhclGeIrZNjFNug1KVhYV+S9Q4WKL7v1pA/?=
 =?Windows-1252?Q?/xGXISiygUXv1f21ldNAPhx8wxlcN5NbzolSRMEnRYq2CMsrW4P/zY93?=
 =?Windows-1252?Q?Okw1XBMDLSjETwIZA6IJ3htZHPGogND5blnjlUrgQmxrslQc3FQ+y0Va?=
 =?Windows-1252?Q?LdP4d5edRypabQ=3D=3D?=
Content-Type: multipart/related;
	boundary="_004_SA7PR11MB959419FB76DA1D8DA2EC4673E8602SA7PR11MB9594namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zYYKkQZzY2SZzuEBdubkqw+S95J00X2qCNXveuSlpHLXFN6OHb/oWVZH/NT2z4YgQzDUK/TAGAvTtAnQ5IzpHh5mRlGo5CiE1xTJLQNmdQt83VNPdczN5JBl9rMnAeqwDbmdaDkMYV6RP9jQ3wk0IAlNa220brf7gSoHKyJrq1fVad5bhUjaaTJje4AJzHrUbr798XonzAWNYDYH7VFPO4z9PElCQXygppyxkxD8AjvNW0KtjIgKX7LfaPrl8CxQksOTnlyXNeQ4Il6ZqoTdieWhfVu+eQPjsG42K8FQCrK+bWwYI9hD2EuZTzRvA8NVXmW7J+sMxrXLBHPSQ2Xtyw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA7PR11MB9594.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00023a8-97f5-43c7-db95-08df345fa22f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 19:22:25.7255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LdqhoYVSsj4B9rVh3+aeCaJiVrcYOzB+mdrdBx0UKasxeRG7paGht3R77Tm9OzjfaUWg2yAPbIfO/XdvStKPToAAVJJRlKzNKR9LJsazA4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4981
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Q55HcI2a c=1 sm=1 tr=0 ts=6ae0f9f6 cx=c_pps
 a=ws69a72eWNNXWagsEosLDA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
 a=COk6AnOGAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=pILNOxqGKmIA:10
 a=vzCpKHjYlzRw3hP6:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=HXjIzolwW10A:10 a=T6a71-JsGAwA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NyBTYWx0ZWRfXymH4KPE8/WJS
 zIiTTY1FLF+eSbsxIpwqhndc2Al+M/9Jk7zvhmujFw3EkwpKveclKKlHCynfSW5qbweQfBixhQU
 mdLzsDgHZ6K/lM43puw5otD9isFNb8/O2C3aONg6/vNNGrEUgoPD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NyBTYWx0ZWRfX9KRbQ8pwKuxj
 CPKJ/1yg5R4EPJgrLC2k79TVOzQXrt6B3nbuQ07JRAkRpv9mqcxMlPJ0UcHQZWw8IBjpjJY28DD
 zobisdmoks5xfZk1kgK9R/d7i36lAlDFLB2KZGy6QVIFrP6n/eqotPWf41q4u8I/NKix6eqopkV
 kEK2WuLHXDIQu4NZFddvZ4DXueUKEmDD51GIzMGvfAJ1PcqJtKaMm0nCvDoeP+0dfcIKJPfgJN+
 q0l3sgygzKIAlVoI/Ex/mCASuzMsY3iGknTf1Y3jNP3J1Kh8VJXkzfEULcuejywlWhv42sTKOw3
 v9/w+0twQuzSMkJzk4MeeWacLW4/jKOUjVcTzZr45vqcWnQ3lN4XqtQ+ZXtWsIgQ5T+8gZ0EBjt
 8wnhyqrDDJ8sbC406uvOWT7GvoNAJW0vNIQ7uRooh+xxzYJn5KIrv14PygCmF8CRpWNmZCMuE/L
 ovCjn2LkqTqwbtOQb6A==
X-Proofpoint-GUID: bU935KdubDx7blncIKVddj0tJAQwAfeW
X-Proofpoint-ORIG-GUID: HFyOZIRFyoteluytw7BtSHBz1UdcqiBm
X-Proofpoint-Virus-Version: 
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 19:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248762

--_004_SA7PR11MB959419FB76DA1D8DA2EC4673E8602SA7PR11MB9594namp_
Content-Type: multipart/alternative;
	boundary="_000_SA7PR11MB959419FB76DA1D8DA2EC4673E8602SA7PR11MB9594namp_"

--_000_SA7PR11MB959419FB76DA1D8DA2EC4673E8602SA7PR11MB9594namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

I investigated the [log_check] warning and reproduced the relevant configur=
ation locally using qemux86 with poky-altcfg and PAM/audit support.

The warning originates from the pan-plugin-warn package during do_rootfs. I=
t appears to be triggered by the PAM configuration and rootfs log checking =
rather than by a systemd compilation failure.

The local core-image-full-cmdline build completed successfully (6,059 tasks=
), and the warning was not reproduced in our local rootfs logs.

I also checked the upstream systemd changes. The existing patch for the sys=
root-to-libaudit include directory was dropped during the 262 to 262.1 upgr=
ade, but the warning investigation appears separate from that patch.

At this point, I haven=92t identified a systemd recipe change that would ad=
dress the warning. I will keep the warning investigation separate from the =
missing patch and follow up if further evidence identifies a connection.

Best,
Sai Sireesha T
Linux Engineer - Sys
OSS Platform Group
[cid:fd61650f-f3d3-4614-83fd-b785ac3a5c0e]

________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Sunday, October 25, 2026 11:51 AM
To: Tirumala Pudi, Sai Sireesha <SaiSireesha.T@windriver.com>; openembedded=
-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: quic_vkraleti@quicinc.com <quic_vkraleti@quicinc.com>
Subject: Re: [OE-core] [PATCH] systemd-boot,systemd-tools-native,systemd-bo=
ot-native,systemd: upgrade 262 -> 262.1

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Fri Oct 23, 2026 at 9:10 PM CEST, Sai Sireesha via lists.openembedded.or=
g T wrote:
> Upgrade the systemd recipes to the 262.1 stable release.
>
> Update the source revisions and refresh the existing patches
> to apply against the updated upstream sources.
>
> Notable fixes in v262.1:
>   - logind: fix one-byte buffer overflow
>   - ndisc: fix an off by 2 write in ndisc_option_build_encrypted_dns()
>   - sd-bus: avoid overflow in sd_bus_message_append_{array,string}_memfd(=
)
>   - firstboot: fix use-after-free/double-free in process_hostname()
>   - sd-event: fix hang after ratelimit expiry
>   - journal-file: refuse hash chains and field lists that loop back
>   - seccomp: mask socket() and setns() arguments to 32 bits
>   - kernel-image: handle errors when reading .osrel section
>   - udev-node: chase devlink on remove event
>
> Refresh the patch context for the updated upstream sources.
>
> Testing:
> - bitbake systemd
> - bitbake core-image-minimal
> - Booted core-image-minimal on qemux86-64
> - Verified systemd 262.1 as PID 1
> - Verified zero failed system units
> - Verified clean shutdown
>
> Signed-off-by: Sai Sireesha T <saisireesha.t@windriver.com>
> ---

Hi,

Thanks for the upgrade.

It looks like we have some warning during the do_rootfs, but without
much detail:

WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: [log_check] core-image-f=
ull-cmdline: found 1 warning message in the logfile:
[log_check] warn.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/4830

This is only seen on qemux86 with altcfg distro. Can you have a look at
the issue?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_SA7PR11MB959419FB76DA1D8DA2EC4673E8602SA7PR11MB9594namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Mathieu,<br>
<br>
I investigated the [log_check] warning and reproduced the relevant configur=
ation locally using qemux86 with poky-altcfg and PAM/audit support.<br>
<br>
The warning originates from the pan-plugin-warn package during do_rootfs. I=
t appears to be triggered by the PAM configuration and rootfs log checking =
rather than by a systemd compilation failure.<br>
<br>
The local core-image-full-cmdline build completed successfully (6,059 tasks=
), and the warning was not reproduced in our local rootfs logs.<br>
<br>
I also checked the upstream systemd changes. The existing patch for the sys=
root-to-libaudit include directory was dropped during the 262 to 262.1 upgr=
ade, but the warning investigation appears separate from that patch.<br>
<br>
At this point, I haven=92t identified a systemd recipe change that would ad=
dress the warning. I will keep the warning investigation separate from the =
missing patch and follow up if further evidence identifies a connection.<br=
>
<br>
</div>
<div id=3D"Signature" class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Best,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(12, 136, 42);">
<b>Sai Sireesha T&nbsp;</b></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Linux E<span class=3D"spanWithBackgroundColor" style=3D"background-color: r=
gb(255, 255, 255);">ngineer - Sys</span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"spanWithBackgroundColor" style=3D"background-color: rgb(255,=
 255, 255);">OSS Platform Group</span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-size: 13.3333px;"><img id=3D"x_x_image_0" width=3D"126"=
 height=3D"22" style=3D"width: 126px; height: 22px;" size=3D"7931" data-out=
look-trace=3D"F:1|T:1" src=3D"cid:fd61650f-f3d3-4614-83fd-b785ac3a5c0e"></s=
pan><span class=3D"spanWithBackgroundColor" style=3D"background-color: rgb(=
255, 255, 255);">
</span></div>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com&gt=
;<br>
<b>Sent:</b> Sunday, October 25, 2026 11:51 AM<br>
<b>To:</b> Tirumala Pudi, Sai Sireesha &lt;SaiSireesha.T@windriver.com&gt;;=
 openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.opene=
mbedded.org&gt;<br>
<b>Cc:</b> quic_vkraleti@quicinc.com &lt;quic_vkraleti@quicinc.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] systemd-boot,systemd-tools-native,sys=
temd-boot-native,systemd: upgrade 262 -&gt; 262.1
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">CAUTION: This email comes from a non Wind R=
iver email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Fri Oct 23, 2026 at 9:10 PM CEST, Sai Sireesha via lists.openembedded.or=
g T wrote:<br>
&gt; Upgrade the systemd recipes to the 262.1 stable release.<br>
&gt;<br>
&gt; Update the source revisions and refresh the existing patches<br>
&gt; to apply against the updated upstream sources.<br>
&gt;<br>
&gt; Notable fixes in v262.1:<br>
&gt;&nbsp;&nbsp; - logind: fix one-byte buffer overflow<br>
&gt;&nbsp;&nbsp; - ndisc: fix an off by 2 write in ndisc_option_build_encry=
pted_dns()<br>
&gt;&nbsp;&nbsp; - sd-bus: avoid overflow in sd_bus_message_append_{array,s=
tring}_memfd()<br>
&gt;&nbsp;&nbsp; - firstboot: fix use-after-free/double-free in process_hos=
tname()<br>
&gt;&nbsp;&nbsp; - sd-event: fix hang after ratelimit expiry<br>
&gt;&nbsp;&nbsp; - journal-file: refuse hash chains and field lists that lo=
op back<br>
&gt;&nbsp;&nbsp; - seccomp: mask socket() and setns() arguments to 32 bits<=
br>
&gt;&nbsp;&nbsp; - kernel-image: handle errors when reading .osrel section<=
br>
&gt;&nbsp;&nbsp; - udev-node: chase devlink on remove event<br>
&gt;<br>
&gt; Refresh the patch context for the updated upstream sources.<br>
&gt;<br>
&gt; Testing:<br>
&gt; - bitbake systemd<br>
&gt; - bitbake core-image-minimal<br>
&gt; - Booted core-image-minimal on qemux86-64<br>
&gt; - Verified systemd 262.1 as PID 1<br>
&gt; - Verified zero failed system units<br>
&gt; - Verified clean shutdown<br>
&gt;<br>
&gt; Signed-off-by: Sai Sireesha T &lt;saisireesha.t@windriver.com&gt;<br>
&gt; ---<br>
<br>
Hi,<br>
<br>
Thanks for the upgrade.<br>
<br>
It looks like we have some warning during the do_rootfs, but without<br>
much detail:<br>
<br>
WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: [log_check] core-image-f=
ull-cmdline: found 1 warning message in the logfile:<br>
[log_check] warn.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/buil=
ds/4830" id=3D"OWA74fa2544-ee4a-2e29-8429-e62f795872a6" class=3D"OWAAutoLin=
k" data-auth=3D"NotApplicable">https://autobuilder.yoctoproject.org/valkyri=
e/#/builders/20/builds/4830</a><br>
<br>
This is only seen on qemux86 with altcfg distro. Can you have a look at<br>
the issue?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" id=3D"OWAe997f98f-d285-0925-8ede-6c23e416b3=
c0" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://bootlin.com</=
a><br>
<br>
</div>
</body>
</html>

--_000_SA7PR11MB959419FB76DA1D8DA2EC4673E8602SA7PR11MB9594namp_--

--_004_SA7PR11MB959419FB76DA1D8DA2EC4673E8602SA7PR11MB9594namp_
Content-Type: image/png; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=7931;
	creation-date="Tue, 27 Oct 2026 19:21:31 GMT";
	modification-date="Tue, 27 Oct 2026 19:21:31 GMT"
Content-ID: <fd61650f-f3d3-4614-83fd-b785ac3a5c0e>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAfgAAABWCAYAAAAjSYRVAAAACXBIWXMAAC4jAAAuIwF4pT92AAAG
YmlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0w
TXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRh
LyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDUgNzkuMTYzNDk5LCAyMDE4LzA4LzEz
LTE2OjQwOjIyICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3Jn
LzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0i
IiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRw
Oi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMu
YWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNv
bS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9z
VHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0Mg
MjAxOSAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDIwLTEyLTAyVDE0OjU2OjM3KzAyOjAw
IiB4bXA6TW9kaWZ5RGF0ZT0iMjAyMC0xMi0wMlQxNTozMDozNSswMjowMCIgeG1wOk1ldGFkYXRh
RGF0ZT0iMjAyMC0xMi0wMlQxNTozMDozNSswMjowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBo
b3Rvc2hvcDpDb2xvck1vZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2
LTIuMSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDoxNzk0ZTkyYi03Y2FiLTVkNDgtYWIzNC0z
ZGNjYTFmNjdiZDMiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDo4NjFl
OWQzYy05ZDU2LWRiNDktOTM5MC03NTBlYmY4ZWE3NTkiIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJ
RD0ieG1wLmRpZDpkNTY5MzM2ZS1lNDU3LWE0NGEtYTQ4Zi0zOWI4YjY1Y2YyMzgiPiA8eG1wTU06
SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDpp
bnN0YW5jZUlEPSJ4bXAuaWlkOmQ1NjkzMzZlLWU0NTctYTQ0YS1hNDhmLTM5YjhiNjVjZjIzOCIg
c3RFdnQ6d2hlbj0iMjAyMC0xMi0wMlQxNDo1NjozNyswMjowMCIgc3RFdnQ6c29mdHdhcmVBZ2Vu
dD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKFdpbmRvd3MpIi8+IDxyZGY6bGkgc3RFdnQ6YWN0
aW9uPSJjb252ZXJ0ZWQiIHN0RXZ0OnBhcmFtZXRlcnM9ImZyb20gYXBwbGljYXRpb24vdm5kLmFk
b2JlLnBob3Rvc2hvcCB0byBpbWFnZS9wbmciLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249InNhdmVk
IiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjE3OTRlOTJiLTdjYWItNWQ0OC1hYjM0LTNkY2Nh
MWY2N2JkMyIgc3RFdnQ6d2hlbj0iMjAyMC0xMi0wMlQxNTozMDozNSswMjowMCIgc3RFdnQ6c29m
dHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKFdpbmRvd3MpIiBzdEV2dDpjaGFu
Z2VkPSIvIi8+IDwvcmRmOlNlcT4gPC94bXBNTTpIaXN0b3J5PiA8L3JkZjpEZXNjcmlwdGlvbj4g
PC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PlYNaPQAABg/SURBVHic
7Z1Pctw4sod/86L3zdmjY8oneOUTNHUCs0NbRXTpBLJ2b2f5BK4+gWsitFU0+gRmn8CcE7gmAvtm
n8BvQZRVpjLBfwAIsvKLcJSUIIm0CkQiE0jgH1+/foUgCIIgCOvif+ZWQBAEQRAE//xw+uGnn376
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
SUVORK5CYII=

--_004_SA7PR11MB959419FB76DA1D8DA2EC4673E8602SA7PR11MB9594namp_--
