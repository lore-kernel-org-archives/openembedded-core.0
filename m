Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.440.1794156772139354186
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 08:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=poP3UEZk;
 spf=pass (domain: axis.com, ip: 40.107.159.30, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6ek060hsV0IT8a5coPdJ3avQtwGzlgq78oGzQsAT6xaMnFiy2dDkvP/CivfrnrAaZ00jyWJKhOaV/mNQBGZrqnbx2HQFIFMRj7tkV1sNOmNrc9fAXOh1pcctN+SsnBO4DmJJQd3oiGoLz7dUUmAWg9NY9v+xtBP/ELGW1L6mQAkU473CSjAXrQcc1Fx5odZdrPBurrGFNQMhUml4iArjUrlnFXvsydeI1j3DHDuQ/qo+flsYvlC6EiTeYj8PzhOedLH4ucikQzB1+TQo7489C1VoVu1d0N39QesFkpvyP1BW0sq93GF05qfiv713rd0nxFsFwXhes7Skq8ovRb+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1h0VqhmpJTebBycN4LSLntAOb2Ude8T12FaWoeNj65A=;
 b=QJQCfPuyC95kzQMBBc6raRz1cU2UXhDFMJITIA/5uomR4CAwGuTsnAxa3i8OGssIAkVQxyK+KEE8p8Y9mN3eftzpM0eS243CRLhGr5n1YLyttJYbuqCHQVhjhLHOVO4T9vqYeCBkLvBGQrakd2AIREFruSOnIKCxWFe8cvS6k8hNKEcXd170ZuHGsEjfyYkbIClQD2bHmsfRfKR6XygCQxSS1zQwrQHGm08ZIXRKB+FB96A8AZeOjoZUavgomFHN28KidJHxf5E+dwJmacaso9ws4w/DfIw6wysO5+rJ8enUtOtPudmMsk7mW22lr4ttJOwLnxpf7hENBmQImB0rQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1h0VqhmpJTebBycN4LSLntAOb2Ude8T12FaWoeNj65A=;
 b=poP3UEZk4zyUk73zHgZQIDIIMbY+3L/PbI7oK8lxdlK1TRBsawKb9F8cZMBz5Ile5P4BGNWmB0DnwtBm0n/nFL1ssFQ4fPGEFLSmRdNLQNFd3uAzixkUGr4fSlTPwMiN5pymW7kc2SGZsRWHFtm7uID5vlZG9jqzQQC6cKLb8uI=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB8PR02MB5945.eurprd02.prod.outlook.com (2603:10a6:10:11f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Sun, 8 Nov
 2026 16:52:48 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%6]) with mapi id 15.21.0592.010; Sun, 8 Nov 2026
 16:52:48 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/3] libzip: Inherit lib_package to package the
 tools separately
Thread-Topic: [OE-core] [PATCH 2/3] libzip: Inherit lib_package to package the
 tools separately
Thread-Index: AQHdbS7ZPenM0mGHIkCe8EZ6OMaY4bckaJBA
Date: Sun, 8 Nov 2026 16:52:48 +0000
Message-ID: <DB5PR02MB102132FCE46D3C031E9F8DE2BEF742@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20261102140700.2707257-1-pkj@axis.com>
 <20261102140700.2707257-2-pkj@axis.com>
 <B89343EE-A79C-4FF4-A202-331200EADE05@arm.com>
In-Reply-To: <B89343EE-A79C-4FF4-A202-331200EADE05@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB8PR02MB5945:EE_
x-ms-office365-filtering-correlation-id: f5f9ac94-2aac-4ea8-516a-08df3db8b810
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|11063799006|4143699003|56012099006|261021121427099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: FY0p92Jp492p61SILq3pbV/UrHCgcsZzGTpwK0UM0scz7EGnzCWNxl3UsV0+dEKSXgwCJfD7W/a4uCTt1CPy6DbEJGD+3UsPK/t5C5xdB3gnXaEc/g7d53kJtXv6YZuGhrZLuQil1HYsKZa2ixbI5jdDsotJ0rPWLQ3O4kJAv9xCPiO+Bx6RQq2SODr7lVRuFb2Ef9gRfPY1kSzv5ePI3jKxWXUXR/3lmPaQGTmU9YFg/EGvtTRpH+IcoqwsZZpibogUky7XBpzIV9mMPU3CI4P29o6aFTpSE6YO6BmQJO2lzFErvLxu05ze9HIjhoSmOWOjQujviy2ZUxyQH0B4QfKHlqNan9gpzcIw7siQJ6Fx9WtYwNZGJ2x8ibcAzrrd/U/yAps4l+NLejcN4oXfb9WQRMhNKfGvQJtb5mX7jqYakqlSnTGUEn5wap+X7oUk+WC0c696f1vXep0JPz4uUc6K3OnGGl50FF8KM5SDQqw5O+o0MNtMMJHGG28tOoXQp0C3GnYb4bO+dyjN113xWwh2/F49V/IZRsD1gz9FJqGxT4388VY71mlVh9BZomKwEYN2Bf7jTgqB7FWXh+fQql/L2R/DTbvoDvWWzCm1OYya6EIIwdxWMoXw9DQsTeycvJSmmmNMqp8EECJlQzrdsl8HeKPE3wp0ayUwM+UTRc+QCZeEIruG6YucbinvZ5ja0w2yilmVcuOAWOVSfZhPJh5I49TvoDedH7SYyMYBE+M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejhKT3NqSmxWdUp2Z2ZLNDR3SUdUS00wVW1rNnQ4K2tEbm5qQUtRWnhyNUhQ?=
 =?utf-8?B?MFpYdWRiL2lhSzc1ZWkvdVo3TkN6UGU5NWZNR0gyVFFNamtrVDArSytmUlVh?=
 =?utf-8?B?emFidmlKZVNXSm1sOVNyNndXczJGU0lkYjRJaWYxRHc2VnMzaUduMFpXbzZI?=
 =?utf-8?B?cnBPT01mNTZMS1JPb3lzOE01ZklZalhnajVCeGZVYXdPM0g2Q0JQdDlDWWEv?=
 =?utf-8?B?L2VuUjR4endQQ0FYTDQ3bThnK0VLRHo1b2lWUWpzUG1waVVGbStoR2NjVE9S?=
 =?utf-8?B?ZGZ3dTlIa3cyOXpYRSsyYk5IRGRwNzVtZXhibzZMb1RaTGQ3VGg2UHh5M3Jx?=
 =?utf-8?B?MlVmUVZnbGZRUnJ6OXN4OFRpb1JXSlViYlZxck5oODQ4WVBUajlFMlF1clNE?=
 =?utf-8?B?ZUkzOUtnNzAwK3RMNVVyZTBUSWpMK1BHOHQ0WHJjMUpwZTRueDlhcThHNERF?=
 =?utf-8?B?dVBRMDN6U094QjFRZStZMDBSL3d0RmNiTlFRZzJmM29qZUlCdXVsOTlhTjVh?=
 =?utf-8?B?M3BrSEtNb2xFY2VXb0RZUkJwbGUzT0FSdWt1S0lvSjRjc2E4T1NTVk5TWitp?=
 =?utf-8?B?R0NWNEJFaGJESE5DY3NmZGxIRmZ3aTVWOXo3UHJ5a2JOVmsxZGFhbDNtSzN4?=
 =?utf-8?B?OVlrd0xUZ3N3WDNDTlRTSlRHUVcraVNJUzRycXlpWlRoZG1tb1FCMHUyMWpz?=
 =?utf-8?B?aEFjZWVpbG0zTTd4U2hQL2xrWFd2S0FZY2xWcTRMRlJDa3ZDNEVuZjhYSGZM?=
 =?utf-8?B?c00zNmhlckxRSFk4aHVRVVlrZW9BWFF2WFNOQWQ1NzBnQU8rbUpHRDNuV2px?=
 =?utf-8?B?VFZpNzlvYlB3VENtUmZXYkZyK0ZmUjV5QlJJL3c1UEFZYU44MDhBY2hmSDhJ?=
 =?utf-8?B?TGQrYkFncTkwT2prdC90NmsvMEFkVlYweUVRZjJGc0diMStrRmpEcytCd0tn?=
 =?utf-8?B?MDk1NlArSTNDUEN6aW41THJXTURrUzkybkhJMktkbit3dlBzbjE1eU9jR2d5?=
 =?utf-8?B?cGY0SlpPZDZWbjUwaExFRElST0lFVjg2cGUzR0REc1NsY0FwVm04d3VVMVJw?=
 =?utf-8?B?eDF5c3R0RXJ5cVB4QjQra2dwOGVpTFoyY01xc2RSQzE4aTNyUXJMWnVwb3U1?=
 =?utf-8?B?bDNRNE1nNUhiMmlmZ2w5QkQ3cW83M0pJWTNHQVo1aFhuRWlsSllPS1BaK3Jr?=
 =?utf-8?B?S052RXhEQzBjSUZYd3oyc3N4anpUSUNoUjZwUStzTGJra3hBUmt4UWRnakxm?=
 =?utf-8?B?dVMrQ2RCWnFES3dNNTk1bzlYem9mc1FHdW1UK0RtQlBVSE9KTnNHSGkxTkJw?=
 =?utf-8?B?WmZlcm9wUWp0YVRjN3l2Z1o0aFhZK1B1S0xIYTRWZi9wRnVPN3I1bE95dUhL?=
 =?utf-8?B?d2d3MVRubjJKbm9EZHhnQk56blloblo1OU03WHNhRC96Z20rczkzdFRXY2VP?=
 =?utf-8?B?T3VwZm9LTU0xbGt5OGpQaVRNMzIyVHlLbDRFR1ZUOWg3RjJISkxYVlc3YXN4?=
 =?utf-8?B?TE1OdTVzdkRjckZlRDRrWmk1dFdpY3lHTVdHSDJDVkNCcSs0c25OY2l3K1R5?=
 =?utf-8?B?MGE0TWRaTVBicEJOT3VHNTY2NUtmMUxuZ1g1TWVhV0ZoSy9NTk8wWW5XTTF5?=
 =?utf-8?B?Qys5K2xIOVVHVGdCQVN5dmM3TkxXdm1WaHl6Vm9tL2hpSFJncWkwNkJIeUFK?=
 =?utf-8?B?R2tpc0YrRWpidStOUm9INVkxTHpTTyt1R1dEWWVQV3Rmek0wQVVkVm1ZQmpm?=
 =?utf-8?B?Q0ZhM2M2S0FsWDdGM1d5SlBFWVRySUxsbGpySXNHR2RwVU9FR2JuVDR4T1NB?=
 =?utf-8?B?N0lRZDgyTWJKYzk3RFFvMzRqby9vZmxIZmRWSGJRcVhrMDF5aVQ2aGtPMUlv?=
 =?utf-8?B?aTlod0ZITnZ3VmdITHdYSzNsU2IwOFJmeTVlNFBIQjZGdlBVSjJFcGJUa0NP?=
 =?utf-8?B?ZTFIWmNkaWlpc2FpcTd4eHpEMk5Ccmo4VTdGUVF1eXIzcENXcFRvcUMzSUZ4?=
 =?utf-8?B?cXdUbFBZK1d6QmdjWFg1Z0RvMlR6QjRGL0tEbzRGTGk5TGJjMG9RZW5obUhK?=
 =?utf-8?B?OWFublpqWlhZSGcvRW1pRHVIRlI1Nk5aUEVSVmU3OHhzYlp4U3FsQ013aU1y?=
 =?utf-8?B?Ny90RVFGc0ZDZ1ZZc0tLMVovdUdsOE9walhWdGllOE45bGUzQ3NRUytrYito?=
 =?utf-8?B?MmYvQWo2dDQ2SjYvaUkzSGliMTRCSEtYVzhISnN6Q1E4eUFpbFJ2NE9WNGM5?=
 =?utf-8?Q?x5JvHAWglt+w41gY1EMBcm4sQ2YZW5rnyC17IJemHc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f9ac94-2aac-4ea8-516a-08df3db8b810
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2026 16:52:48.0900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fXVGB3LBqBBtkJtnUZVsJrk47n9QR/IeuH5b/CfCmW3RI8N4x5yGsWaAgJu+/J2x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5945
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 16:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249759

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5C
dXJ0b25AYXJtLmNvbT4NCj4gU2VudDogZGVuIDUgbm92ZW1iZXIgMjAyNiAxNTowNg0KPiBUbzog
UGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IENjOiBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIDIvM10gbGliemlwOiBJbmhlcml0IGxpYl9wYWNrYWdlIHRvIHBhY2th
Z2UgdGhlIHRvb2xzIHNlcGFyYXRlbHkNCj4gDQo+IE9uIDIgTm92IDIwMjYsIGF0IDE0OjA2LCBQ
ZXRlciBLamVsbGVyc3RlZHQgdmlhIG9wZW5lbWJlZGRlZC1jb3JlIDxwZXRlci5ramVsbGVyc3Rl
ZHQ9YXhpcy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gUmVjb21tZW5k
IHRoZW0gZm9yIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5LiBUaGlzIGFsbG93cyB0aGVtIHRvIGJl
DQo+ID4gc2tpcHBlZCB1c2luZyBCQURfUkVDT01NRU5EQVRJT05TLg0KPiANCj4gSeKAmWQgc2F5
IGRyb3AgdGhlIGNvbXBhdGliaWxpdHkgcmVjb21tZW5kczogdGhlIG1haW4gcGFja2FnZSB3YXMg
Y2FsbGVkDQo+IOKAnGxpYnppcOKAnSBhbmQgY2xlYXJseSBtZWFudCB0byBjb250YWluIGEgbGli
cmFyeSwgdGhlIHRvb2xzIGJlaW5nIGluIHRoZXJlDQo+IHdhcyBhIGJ1ZyBub3QgYSBmZWF0dXJl
Lg0KPiANCj4gUm9zcw0KDQpPaywgc2VlbXMgcmVhc29uYWJsZS4gSSdsbCBzZW5kIGEgdjIuDQoN
Ci8vUGV0ZXINCg0K
