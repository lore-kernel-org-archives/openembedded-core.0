Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7555.1794263851666155132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 14:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=nOk7l3c3;
 spf=pass (domain: siemens.com, ip: 40.107.159.37, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPXa470NUGWXCOPLRJVDuCeIp0CVSTlYnQf+wrWxkDbsWe6hMaTUHaH40L0m5H6QxBfrcJfVsLF0sraL+ZxTwn6T57VcNJxek9npsTPt1Ov4My5OnmZ6nspdTujk+yDcXGMVEATRDrsRA8gSzrzi3uQmmcV6C/4tgwrvykMCQ+NTqXaD/88os8bXsgpwqtG4KONrKFK/xcM4htOGto4IeKV/QPS+9X28SIgTMjAPkY3kRTBRNVZitJhdu7vbHDChJhzY1s4rXxBcpL/votG6eC29D8kh9vtTghh0OffI35s1j0Z4v+3yIg/GNjo9d3RCb1k5DuSwP1WbHAJW1mA1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjUhHLHTSSZrPdPt+Io2c3yv6fmLwQZ5TpZoGOJzyT0=;
 b=KSxTGxys34uxbMfv56MjbRkwPp0PMNgBc9vj/XICjKORZTu540RVi6f0J8JyV4cI0Jplm6CcKW7oOYKu8J5x0SvQnImVH82+tBLC4TQL6PlBKG+H/6zKo8TB1hc9kVuXLNjSrEjpDDfpSEoNEHL7yuUbZRyK4GBlNXKLHOQIL+QttPYN/tXV2iKBmqssxwocl/16ljEuJpp5cSs5ph06wqn6MjjUvuvcVhH7qElBEVYkrPMo449Q3MJw/o3EHZULFdjL9LOObbpOKQ7ib5PYadKTt0SjbRddkUkCiFWcPYea1qw7kyol9o7FOSLIK/IkhZwKF5sw4AiClGibtb76Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjUhHLHTSSZrPdPt+Io2c3yv6fmLwQZ5TpZoGOJzyT0=;
 b=nOk7l3c3cLi9oiPj88oMr3PDJxnZpWyFU3DRYe28lh623F0hDHuVD3ElfRBsOCyuqrVFzGqoXuIqBZ7fU7nYJfY/pPqXFQkgVnIvLyxXtuWJPBCexwCKeue4KhRH4crlRJI0b2GS76gHaAT99rdYQAmkkhXuR9Aul744tfHIiVfCiFQd5UT+Pf0FROFYyLtgz7V2TXBq6ig9+qXcXEtGgxLwhi+ta610yQspXbkqQYgmgwFoOQvZ74eEVR+5BmEiRUvdO7rv+QFD0vb7z64CnQdRObd//2OsAperSFEuECkKvxoxI+YaDLVJhtVdho9k9BI15TcGe8W8ZyG7ArRJ/A==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DU0PR10MB5194.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:346::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Mon, 9 Nov 2026
 22:37:26 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0615.003; Mon, 9 Nov 2026
 22:37:26 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [wrynose][PATCH 1/2] dropbear: add follow-up patches
 for CVE-2019-6111
Thread-Topic: [OE-core] [wrynose][PATCH 1/2] dropbear: add follow-up patches
 for CVE-2019-6111
Thread-Index: AQHdYyTnSo9uiSjpeUmW8PwwZzj78rcmEKuAgABeo7A=
Date: Mon, 9 Nov 2026 22:37:26 +0000
Message-ID: <AS8PR10MB5073B9D7D28749124C032589FD732@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261023192914.159339-1-peter.marko@siemens.com>
 <DMQU8C661EIP.20I8FSF0VPP9L@smile.fr>
In-Reply-To: <DMQU8C661EIP.20I8FSF0VPP9L@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=e1d27a94-eca4-451d-9993-0cc4f88aa127;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-09T22:36:44Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DU0PR10MB5194:EE_
x-ms-office365-filtering-correlation-id: 1d154978-1927-4d10-6087-08df3eb207b1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|55112099003|38070700021|4143699003|11063799006|56012099006|261102123227099003|261021121427099003|10067099003|261009223027099003;
x-microsoft-antispam-message-info: 9iQ6bm2VXB1Yu2q6nQHqyics51zD4oinPsm0scIU2MVIN7Flm4JMfWpJwTFz3mFe3ols5OFQBtyclya9Ot1SnroNz+mWtzABWXVMnYdvh7/36utrx7skUxkRyXIUYh6mOi7uDtTw13ubC/1Re31xvPiaCptw9ayg+KYfcRKHEjpFFHeF2IY6QMt0ocI9oyFIaqWduWjcVGEknGEBj58SC93dZjl3OB/R9FiQoxTPCGkaL+8PaSlPz3E7+M8dg1lNbM6QHZVGlKo7uagEgF0wLOj0FlqYd/bdi5mp79PU46U/pdndQFlM5swkGyIpKd1MNfPyudJwkFPgRmiNZ/G6wa7CIrvQs/xy+6j47eyTfOKhwfzk6YQ0HqdBi1BUposXEuNwPTQDzXz6i9hSLQpV5VZUJydniwBkTqVJT/ZZJ4B2w05Rt0uF+91dNUgnL0OpIl12Tiuxm7QguXpM0g3qbkAbawLVBsPn31K3M9k49QkydtAnTMcugWSA8mHUJXjkGsC5KFlbD9brmeg14CuySIU0/yYqXFCIOhxtoAkprvq5UJI4juiKEjWmklCX98qAplqQpIu1x+ygsc+7M/ilbCMpgGDqQrBe66FIzCSWo4Q6izbWpZZSLoQEKFGvdHbJeoqGdfWsDi0IbbCYvFIs7TQnRLi/VvTQvUzFm86mIrHKD8lbWIoIAb+1NyrO2Yau1jLZrN1Pqaw1EzzpI8ihwPqDIi4BJirCxU0VF6LU5bs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(55112099003)(38070700021)(4143699003)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmthTE5qOWtwYUF2cXowZW1Vd1drRGZBaVFlNmVLb3JnWGZHc2Jack5WRHhw?=
 =?utf-8?B?eEVDRk51TXRwVU5xUEdvYml6SWRScnFKRUFQTGlxUE5hcDZhM1RiblJYRG1J?=
 =?utf-8?B?dnk0OGUzUzVIOVVaME1zRGo2aWVkMStwSmU4REloc0tSODBSbHR6RERmU0ZC?=
 =?utf-8?B?MFdMcWMwUitLV0NmMHY0cHdqQ3VPRFdlUGk4cUVidm5BZDdzZ284WGROdU1z?=
 =?utf-8?B?T1JoMzRTUkczRVgzd1NuZUpBT25Yb09QbVgybk94VEVuR1lGcVFRRXJOQUh2?=
 =?utf-8?B?MU9pVEJIV2g3M0h5bG5BeGZyblUvYWFleFdkOTA0Tkh4eGtvL3N6QUt5bWFK?=
 =?utf-8?B?Qi9kRFVTcTR5RWQ2bjhNd2tjMktZcm9tODNyZi9JNUlnYUdhc1g3dzhHRXVa?=
 =?utf-8?B?bTB4dE1lUlIzZW9YQk5HNXlpZCtRRXp4cXpWZUgxRFcrMlNuYWt6SzBYb2tx?=
 =?utf-8?B?a0o5ZGF6a253aWhOc2ZSeGs5a1lrSVRod1YvdDR2R1ZKdlJzd2JZOW1HVEJr?=
 =?utf-8?B?dmtSM2lQTU81czdScEI4Uk1sK3RKTVI2SmNSVFJEMzd1RDNueHlxZXVXZzF5?=
 =?utf-8?B?Sm96OUJlc0pjamE1VUo3N2RucGxBTGxEekNTL3ZjRldiMlBnRC92aGZBRnRq?=
 =?utf-8?B?OU93Mm5GWVZGK25XaGt6ZFFLS2h4UkNmZmRvM3ZtU2hWUkhIb3NNbjFYU2gv?=
 =?utf-8?B?MFZkMmVDaDBPZEhwSUY4SUFPR1FiZVNyVzB4aHlRVndhdmtBL05OWXh6TXdl?=
 =?utf-8?B?YWd5U0ZiQWF0OWZQckFpNFhhbUswNzRYc3lzU1M4WHJMdVhVZ3V1VlJQdExJ?=
 =?utf-8?B?M2wra0R0OFQrc3JEcFU2c1E0dWxVblhCVlp0eHlkL3Avd3NLT3B5Q3lmS1Nj?=
 =?utf-8?B?c3UvREdhNDRrcTBOQVlGVTBFZEhDYlB2ZjNBSDhkc2UxbTJXRUJVQ2thRjBQ?=
 =?utf-8?B?UHg2cC9zWVNsRmVYRG9KbEZMMTJIMXR3bkJKSkhRV25FUHJLdWIrOVZJVHRz?=
 =?utf-8?B?dGlVbDRKWEpYYjk2REtXWm85anJPWkZzaUV1NUFZSFU4U3NmWFBpR2d4ZDli?=
 =?utf-8?B?OG14Ynl5TVRqSVNpay95VFB3S21BTks0dDFOSTIyWWxteTd6ZWxDN1dFUkZG?=
 =?utf-8?B?WEdzQW9DTnpKY2pzem1odVJGRVFrT0owU3p6NDE3bHgwd0dJa25yTXZlbmpK?=
 =?utf-8?B?VkI5ZmZ5b0xyV2pWOUFBL0VwNDV1Nlg1ejJaR01ZNGVucU1UOWZhS0RjY21h?=
 =?utf-8?B?cGFoZ04yRStBamtJZk5yTklpSUc5ZWFjU1ZlNmx2cDRaTnhITmgveVB4M1FC?=
 =?utf-8?B?eVJWc00zR0RyTWZ6V1oyNUttVmRxbFlDN1ZZM2ZwQ1YyMFB1Y0JSZHlERjJz?=
 =?utf-8?B?TktSUXVlWG1EdG1jSlNndlVJSkFjdTg1T3lKNG52UVk1TE93eng4cGtJUUI5?=
 =?utf-8?B?eFh5Z2RUejVRcGRjK2RMcEdvNWdIR0gycC9aV2UvQVp2UkZLSVlXZmY3N2Fj?=
 =?utf-8?B?WFBXaWlvOVJsNVdVYWZzTmFVNHZDOUpvTk8vaFhGQ1pYZEx0TDJpdFljeENy?=
 =?utf-8?B?MlBVdVo1M3EyeWROc21Hd1BhaVVKMEVPbU5DS2xNRFBtU1FIbVVoRDhwL3JO?=
 =?utf-8?B?V2lhaDJNcW9TNEI5ZFNYaGlKREhGQXJnTXlSY1JkaCtUekNBaFV5blZ6NkZP?=
 =?utf-8?B?aGVWNE9neENHaW0xWGo5dm9BS2M2VmZvSUY2MzZTZU00SUlxRGtmR1VyelFI?=
 =?utf-8?B?TG9UU3Nyb0MrRlhxTTBKSlhTMGZQRHFIZXV4dXEyY05WbC9mSU1tQVZWaXlM?=
 =?utf-8?B?M1R1d2VVcUY1NSt5aXZFb0d6Q3J1ZUVXQnVPM1VGWUtKQktMM0cwcXladm5m?=
 =?utf-8?B?V0RXKzdaSlRneDV0SjVqMW9OUVJTcTVaeExZNVJRV1BWaHNnalh3c0RTdS96?=
 =?utf-8?B?V1owb2RiUXJiQWo4RU5oZEphMEx1elYyZmo0VUZJQjdxbmp0dTdiaHEydjBu?=
 =?utf-8?B?OElLTzQ0bmZWME5qRkFnVUZEeEZRSzBjV0tCTVV5dC85bFZwUnVLY1AyWE5B?=
 =?utf-8?B?K1ZRdERjeGhvOXNCNm5OZHV2d3hYTFpiQ3preWd3RUk3dkRjR05UYjV1L21W?=
 =?utf-8?B?YUJOVHFIUWNkclZxb1FFbFB2bkwyRWpVWXIyY0dleWNRTzNaZHhGbUVHTllE?=
 =?utf-8?B?dXVuQlhacXNhN1hUNmxQZU9nUURLUU9VWGZVY3VZeXkvZUdoL29sdXQ3UHAr?=
 =?utf-8?B?c3g0L2lwdkc5OE9pTnZxOFJIUUVzSHJBZlhwTzVuMnQyb2hxMEwxR1YxaHVt?=
 =?utf-8?Q?yqj7jDjWCvI4msW4YR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d154978-1927-4d10-6087-08df3eb207b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 22:37:26.3481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1y26TAvtxPD+1ZNJt3p9xHbSHvdxVdxFFS2Ue1NQOhf2cpBLGQNWMOPAOMjZKWSfWicZ7i6wIVXUwZkpdKwPBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5194
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 22:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249877

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgOSwgMjAyNiA1
OjU4IFBNDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtv
QHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFt3cnlub3NlXVtQQVRDSCAxLzJdIGRyb3BiZWFy
OiBhZGQgZm9sbG93LXVwIHBhdGNoZXMgZm9yDQo+IENWRS0yMDE5LTYxMTENCj4gDQo+IE9uIEZy
aSBPY3QgMjMsIDIwMjYgYXQgOToyOSBQTSBDRVNULCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiB3cm90ZToNCj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFy
a29Ac2llbWVucy5jb20+DQo+ID4NCj4gPiBQaWNrIGFkZGl0aW9uYWwgcGF0Y2hlcyByZWZlcmVu
Y2luZyB0aGlzIENWRSBmcm9tIDIwMjYuOTAgb3IgMjAyNi45MQ0KPiA+IHJlbGVhc2VzLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29t
Pg0KPiA+IC0tLQ0KPiA+ICAuLi4vZHJvcGJlYXIvZHJvcGJlYXIvQ1ZFLTIwMTktNjExMS0wMS5w
YXRjaCAgfCAzNjQgKysrKysrKysrKysrKysrKysrDQo+ID4gIC4uLi9kcm9wYmVhci9kcm9wYmVh
ci9DVkUtMjAxOS02MTExLTAyLnBhdGNoICB8ICA0MyArKysNCj4gPiAgLi4uL2Ryb3BiZWFyL2Ry
b3BiZWFyL0NWRS0yMDE5LTYxMTEtMDMucGF0Y2ggIHwgIDM0ICsrDQo+ID4gIC4uLi9yZWNpcGVz
LWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNS44OS5iYiB8ICAgMyArDQo+ID4gIDQgZmlsZXMg
Y2hhbmdlZCwgNDQ0IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEv
cmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyL0NWRS0yMDE5LTYxMTEtDQo+IDAxLnBhdGNo
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9w
YmVhci9DVkUtMjAxOS02MTExLQ0KPiAwMi5wYXRjaA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
bWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvQ1ZFLTIwMTktNjExMS0NCj4gMDMu
cGF0Y2gNCj4gDQo+IEhlbGxvLA0KPiANCj4gU2hvdWxkJ250IHdlIGFsc28gYmFja3BvcnQgdGhp
cyBjb21taXQ/DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ta2ovZHJvcGJlYXIvY29tbWl0LzE2Y2Uw
NTllZDhlOTE0ZTIxMGFmNjdlMTk5MDQxOTQzZWM3NDcNCj4gMDM0DQo+IHwgc2NwOiBmaXggcmVj
dXJzaXZlIG92ZXJ3cml0ZSBjaGVjaw0KPiB8IE5vbi1yZWN1cnNpdmUgdHJhbnNmZXJzIHdlcmUg
aW5jb3JyZWN0bHkgZGlzYWxsb3dlZCB0byBhbiBleGlzdGluZw0KPiB8IGRlc3RpbmF0aW9uLg0K
PiB8DQo+IHwgSW4gYWRkaXRpb24sIHRoZSBkZXN0aW5hdGlvbiBjaGVjayBsb2dpYyB3YXMgd3Jv
bmcuDQo+IHwNCj4gfCBGaXhlczogNjFiZDBlMyAoInNjcDogRGlzYWxsb3cgLXIgdG8gYW4gZXhp
c3RpbmcgZGlyZWN0b3J5IikNCg0KVGhpcyBpcyBhIGdvb2QgZmluZC4NCkknbGwgc2VuZCBhIHYy
IHdpdGggdGhpcyBwYXRjaCBhZGRlZCBvbiB0b3AuDQoNClBldGVyDQoNCj4gDQo+IFJlZ2FyZHMs
DQo+IC0tDQo+IFlvYW5uIENvbmdhbA0KPiBTbWlsZSBFQ1MNCg0K
