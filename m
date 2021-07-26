Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com [68.232.156.107])
 by mx.groups.io with SMTP id smtpd.web08.27383.1627288102323839681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jul 2021 01:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=tX93M478;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.107, mailfrom: ito-yuichi@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1627288103; x=1658824103;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CK+rzFx0Hg2YRLfjEXldp4fQZltdIbq/wmZnfqF4BiU=;
  b=tX93M478kXW3Npk4Nw9Hs7tCQxP1kzFE658V2n1WLApBy4+Q9k0u6XXY
   w3tP2Y+FHWb8mKcHQLe37KM0M8eeuNH/bxkqBXUJBqa/JL+Lyl8MTiqQM
   T9ahgBy8M7dCQzOjsx9yDiQdEDArM2Ftpcdm683Q4ry/bxNpxt66xUFij
   uXEawQobd/UK0NOElPTmkozkj+KyIw/xlPEVHRNFgzEuYDuS43VUk/uf+
   kdVIgK+oEczYkJlGK9SYPOCnWtpyogM6jcSwjND9p2mELilujr/aghHQ1
   4HswhQL+lZ/XbNtqJiedn6XrM0yALww7mgHRudcEamxCCqB4c6BhBnCT4
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="35456800"
X-IronPort-AV: E=Sophos;i="5.84,270,1620658800"; 
   d="scan'208";a="35456800"
Received: from mail-os2jpn01lp2051.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.51])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 17:28:20 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efDsx1689UmcADx3Db+fVkBOVCvcRG1DYP/CX8Kbyv+Bc15755xMkBL8fv5FTwtjdUPN51lk9/ciDPLgGueWR7xbr1dzQxA5BPa1kPZ+Y8qZZpd+kmbDLlXlj0WBImGmhKjDFbxfcdwQPEyUVRqcjayObwt432MFb2YSEPXFGxcOsNemUZ+Zj+809xH4+LzSFR4GayzoVZYwQSdDcFkwfn3hw6f0zyzQjpi6+zSLVqkwYeAPn3lul1GjYgEal6qZpx2zzhHCgmz0SDvt23bm+tjm6uNsNtjtp+Rvc+AUUuJZ/YsJ4xeMtUjRhrQwXslQF3AxMiJDsz05Z6nHk2Ordw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK+rzFx0Hg2YRLfjEXldp4fQZltdIbq/wmZnfqF4BiU=;
 b=Vl8ocB4fTkJYJ2HkaN6DqwK3PzFUKMXXaQ3UN/7UEwDqe8Y3Z91eq0NjJpKheYpnwNhrxCMnqfc+BjaHrib68DiYmxR3cM99/JkQ/W60E2cc8NM4WN+eaqwbT2g4hdwZ2w5yt86TTHW7IEcDCtSL9wcUqp7Gm1O2Ensi6hFDWtX1y+MUgvIGZcgzAKdG6F4I1hBLz3Q3aVwEzldT2e6E125C6L+sVVaqk3Ji+71HXJ8JuPDZBgCpR+5E5o/vspBXfXFhgiTPdrHTF3B3TbONuzr1MB6mSOQJ8K/diyvCpPmGXR0zktDT3ymOD04YDCYFlyPwKyN1XVNyi4S2W/GhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK+rzFx0Hg2YRLfjEXldp4fQZltdIbq/wmZnfqF4BiU=;
 b=NWfcWywkwUBBufZWfrBlObRZdaygL9RlAXuWubdzpEj+XHC3whKinbAA+dc58/RCZB81zjFRFUVPNRTiWc8OHJu+m1l5kYwfgDpI6+goOmnzapjeBgx0wVirEmbIc/e8qcFudZM5QqW5CduklrRl3184McrWyNJ1HeYaVfyh6S8=
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com (2603:1096:400:41::9)
 by TYAPR01MB5963.jpnprd01.prod.outlook.com (2603:1096:402:34::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 08:28:16 +0000
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::a0a3:8a30:7d79:db67]) by TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::a0a3:8a30:7d79:db67%4]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 08:28:16 +0000
From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
To: 'akuster808' <akuster808@gmail.com>
CC: 'Richard Purdie' <richard.purdie@linuxfoundation.org>,
	"'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] cve-check: Add allowlist that is same function of whitelist.
Thread-Topic: [OE-core] [PATCH] cve-check: Add allowlist that is same function
 of whitelist.
Thread-Index: AQHXanKtSp8zYPvAjEKvHUlVZf/v6qs0zWoAgBa3EhCACZNzkA==
Date: Mon, 26 Jul 2021 08:28:16 +0000
Message-ID: 
 <TYCPR01MB559993B5B40CA0CE67051A6F8FE89@TYCPR01MB5599.jpnprd01.prod.outlook.com>
References: <20210623085633.3186982-1-ito-yuichi@fujitsu.com>
 <b7b05b428677e6d8f39c700ff4ce212a9baa8918.camel@linuxfoundation.org>
 <7ddffb54-dbc6-e221-fa69-5dff83ef5983@gmail.com>
 <TYCPR01MB559974130EF14CC85D5D621B8FE29@TYCPR01MB5599.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TYCPR01MB559974130EF14CC85D5D621B8FE29@TYCPR01MB5599.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfRW5hYmxlZD10cnVlOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJh?=
 =?utf-8?B?Yy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRlPTIwMjEtMDctMjBUMDY6MDE6?=
 =?utf-8?B?MzRaOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0?=
 =?utf-8?B?ZmVjZTA1MF9NZXRob2Q9U3RhbmRhcmQ7IE1TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?utf-8?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX05hbWU9RlVKSVRTVS1SRVNU?=
 =?utf-8?B?UklDVEVE4oCLOyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9TaXRlSWQ9YTE5ZjEyMWQtODFlMS00ODU4LWE5ZDgt?=
 =?utf-8?B?NzM2ZTI2N2ZkNGM3OyBNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1h?=
 =?utf-8?B?YjRkLTNiMGY0ZmVjZTA1MF9BY3Rpb25JZD03ZTZkNDBjMS1mMmFkLTRjNTQt?=
 =?utf-8?B?ODA1NS00YTE5NGZiODRhOWQ7IE1TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00?=
 =?utf-8?B?MmFjLWFiNGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA=?=
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5e8d738-986a-4518-589d-08d9500f5160
x-ms-traffictypediagnostic: TYAPR01MB5963:
x-microsoft-antispam-prvs: 
 <TYAPR01MB5963341785055C0B26E9C75E8FE89@TYAPR01MB5963.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OUNd48A60Yj+tqtD89v4eTtTcfYnQq/YuWxvTzZ80zxg1+adm1XtKufCnUzadPXC8C3jurrdH7v0QaOnuhqpFkS5fT31/zwqbIo8JHnzbrf4QgJ+GQhebKUe+CALjigDEvi+xmT2OCjjceeSwS1tIKkcRIBlOZgvoHWuieY/U1IghgbP/5KuL9fAJdlMLYoNjz7WP0vp6xYpApB5uoGT/biGOqPx+Qr5ez7GUukRrL4qXYUZ+OXwF1lzm3r4LZmAB8YvvUP6EWrJwOgU271i9/2SISbQEC9alMRjTIRbfTSFJmdDw+qJgNa/+a5k/TR15JwDSCvrsVCsR8TqTT4NKoyjupkZtlB2AUKvkM1y+jy8VUeXy8FxArxECplqsJzV71Tpn4Ig6uhHSj5vWEnzkkbF/5qw3SOtlKhDrp0ka4G/IDgCjXVBE5MZPTENDg6kIAc//dKZNsHH4yx9ki8qC2o220k74z09qe+/BBP/6sKFQTmBPeUp3M0/NUTt29dgnHqKBDvU8NoIGn0/cOXpM+eFuN0ZqFsufoKxyQh0rBIhuUU0eM6uJMHk2HbrszVTVGLARTwH1Y/l3NJYX8rkE5q+TbvkpmN7f1roBA+uaOqrHnx2JcVkBqFwllMOME7NTzsyBuuecG/LbGhUvBeHi/CfM9c56ftF1KGcZSJCxZRgUxFCQA2baucpwbvpxEgxDJ17qq7uHn3PbY1OGnx9AA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5599.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(71200400001)(316002)(5660300002)(54906003)(83380400001)(6916009)(4326008)(66556008)(2906002)(66946007)(26005)(186003)(66476007)(6506007)(55016002)(33656002)(38100700002)(64756008)(86362001)(9686003)(478600001)(122000001)(66446008)(76116006)(7696005)(85182001)(8936002)(558084003)(8676002)(52536014)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N29wM0pYdTQ3S20yZklxclpOcEVVQTM1Z1N6NjZ3QmpHVkFXZkpBUlZueTgx?=
 =?utf-8?B?UmVmYkd6ZFBIN0JXeU1UbHF5WlJCckNCNVFETVV2RVZUWkwzK3Y5UVNQQnRH?=
 =?utf-8?B?WlY1cFk3cnlPamFEVVprWXk3Y2FrMnVtU1YrTmdoKzlxMzFsbXY3bjVmeGJG?=
 =?utf-8?B?MGpCSE5TTndUM054WTdXRXg3RzcraGJxL3hSK3MrenNrRkVwUXJKek8zU2Z4?=
 =?utf-8?B?MXo4cVlLUjQySWtFVTJ0RXZhK1VNb3NDTVU2N21YZDJGRVJHRXNtVzVPOUEx?=
 =?utf-8?B?U0E4UVFtOFZKdFV0QlRrWmZramdPTm5XOFZjSlRFa0psZUtSb1RsZHYrVE52?=
 =?utf-8?B?VndtYmRXM0pyMXd1QjZUQXBmaTZCdi9HOTF0QXN6Q0FRUkJDWmJmMTdlRlN6?=
 =?utf-8?B?N0Q5a0htVU1lMUJlQ2tJZTJzbC96b0NsWUI4MENrdDhMeXl5R2Rsa05mMkRH?=
 =?utf-8?B?dG9IVXFCZmxHeWYxSXlIVUVGcTBKL3lXTWthcHZ3NzNtNEtGUW9MUHdSWU9M?=
 =?utf-8?B?bkJUN3ZqYnlyUm1Wc2FITVJGVjZWV3NJb043dHlYSk02Y0F6TUFacFdHMElO?=
 =?utf-8?B?SUpKalY2dkZlam9hOExTS3RvRjVWZWpjdll1eHdYSlVndE5LeW9zcVVxSzNh?=
 =?utf-8?B?S1V0NEdDSlpNTUR2cGZMc3dlSjIvWDZuMzVEb1Q3UHpOZldkNjdjbGRBVnU3?=
 =?utf-8?B?TnNhMjQwdGZ6N3NES0VKWDhGMkNISzg2ZEJmM05TZGplRlQ3aHZMQXRzNTdm?=
 =?utf-8?B?V3dtNHBOeVVOUis4emNxUEozVG1LM2ZBWGVlYjcyakFlR3NwSFpWOVljYUZX?=
 =?utf-8?B?T3oxV1kwKzNaZG14RkROelNTOHRWb3VSeTJvSnRrZ25mSk5qNkVBM0pwb3B0?=
 =?utf-8?B?dnFCZVdwY2ZkZ2t0YVptMHZlaEFrNzRRVW9abjNRSFhoTXFkU2RRM3BGTDYy?=
 =?utf-8?B?MlhJa3E3Mm92NExaemVoMEUzaU5KNnFMVUE0QmpkNHFGSFprMk53NnM0R3ZV?=
 =?utf-8?B?TGRYaFo0cU1sd0ZoQ0NPbXhUU2UxOFRFUjhlZU45TkEyN0xCc2dTc3g2bnJj?=
 =?utf-8?B?TWVZcVA5NXkxNGhvNVNKTk44akhuWUVlcU5VdFhJVUpxTU1UTnBYUlV1Ukp2?=
 =?utf-8?B?dUVsQkZkeXhnSFhVdFB6bFV0MGsrSzZmUm9SdCt2TjZqVGVralhkNTNkNGtK?=
 =?utf-8?B?NzlqbGMrT3N0aWxMekRDWThHWWtKMVFVVEZYTEh6cFlFK3AzUTc1UWM5SjMw?=
 =?utf-8?B?UzFYUmw3SnppSVA2ZHZWb3ZiaVBPYXNvamp4R1BFTktqM2ppdXNlaGFVR0FG?=
 =?utf-8?B?L0JlUkp0QkpGbGFBOElkdHJNZ0Z5NjlYblhTUStSZHNsaGdIcDNMZk03U3Vl?=
 =?utf-8?B?VVp3K0tzVkhIVm5Oa3kwcENxT2dBTU4vM1FyL1ovRHhOU1FQMVNWczEyQ3pR?=
 =?utf-8?B?SUprSkRaL25EbzFXZDN6ZHhuMkViNFZGUXgrQ2p1aDYyOTlvV0d6SlVGVW4w?=
 =?utf-8?B?RzlnVm1zUWl0NmkzbW15M0pmcm1GcjBwSmVzbUpvKy83Mng1QUEzKytWUlN6?=
 =?utf-8?B?UlQ3bGpONm5nOWZJaE5MV3pXQmRXSWJtVWNQSGN6V0xwUThaUS9hMTdkL3dL?=
 =?utf-8?B?QVM2RGtubkx4WUp3ZUVwcjNqUXdhUEpySk1MalRIQjU2Qi9YS1dxK2lDbXZG?=
 =?utf-8?B?Z3p0L0cvYVVqTmphZ3hIZUVqcGZ0Vk90cGpxQytIcWNSUjJLUWJKRTNkbEUy?=
 =?utf-8?Q?1kyRznzkBJRX02mNtQ=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5599.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e8d738-986a-4518-589d-08d9500f5160
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 08:28:16.8899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abynjiuCzvjJYU6QIzuniBDmMQjDAVHCrUq7hFBJ306oBNAgwjal+qJpMXsrWhc0y2Fa3qzBc6c8zprtaCmU8/c3oMhNFHdT7tTgDOzzBnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5963
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SEksIEFybWluDQoNCj4gSSBjcmVhdGVkIGFjY291bnQgYW5kIGFkZCBDVkVfQ0hFQ0tfV0hJVEVM
SVNUIGluIFZhcmlhYmxlcy4NCg0KU2hvdWxkbid0IEkgcG9zdCBhIHBhdGNoIGJlZm9yZSB2YXJp
YWJsZXMgaW4gd2lraSBpcyBhcHByb3ZlZD8NCkFuZCB3aGVuIHdpbGwgdmFyaWFibGVzIGJlIGFw
cHJvdmVkPw0KDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUgaXMgYW55dGhpbmcgSSBjYW4g
ZG8uDQoNClRoYW5rcywNCg0KWXVpY2hpIEl0bw0K
