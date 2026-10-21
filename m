Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5641.1792565193675476386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 23:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=RVIfrxbC;
 spf=pass (domain: ericsson.com, ip: 52.101.72.12, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8ygWRElRRABPleiiV2n2N5npBMB8D5ZqM3DbxLquQ2+3tmn2BVuBjsoMFaA3iHLNuQWDUE4exOC75zYABe5Viy81spInMvpN98iPBzrxipvw+as+6u/AzX1ph6qdo7ic5MoOqHZpC0rZcvXwh8tNz42qN4ONbyQwAZj+HIv/3T/NDHvoSg9c4/5daI8RkhiUx91zym5UdBNiFyLluMiZlfCM+wjZHlq5Be4VozHPqxVujOZoCWKDox/QltZo0vd0YmAad13+VKc7bKGlxqDbPrLBJe8+QmcYrKEJUvSFE4fcifxFcc819ztayDmBM9JGm7W5/IL55i8+MqWGS97gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/D3uS1q43p737fX4q9tKyY7M+l5kXOCmmiIqg3Fnek=;
 b=UCH8X30sKyFJNK6PnBXBr2zWmM4CODslYrgF3N00HA+Nq3rxi6RZWK3z39W1b8ZJzeE8RqNgYv4neol2vFMlI8ge5+oFZ2YDGHjgwhh2pDV84cvvux361p30M+Ln45EUB+DM03SD3/WIOF6YfEpXkEI+IzSJV6HFQMEWhV6N3H5AoWs14uekczhS40hlCWr4nQovvb90AFesu3eiE9xEsO74D0HEu5LAdWAj7/jcUgKDe/gc3c0lS8yn+9GwUhIdMwwYgoDBxbfKlimwxjq/ZX1kN3b4rTURRREu+in9K886pNFPG5MJS/RhU3/yevknbNy05X96/Axn2jofPB0tSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/D3uS1q43p737fX4q9tKyY7M+l5kXOCmmiIqg3Fnek=;
 b=RVIfrxbCkZL0jD0i93v4ePlM5S6ytIKdKoF4DLzi2Ud6UoLcp+dynXGlV8BGDMqt9oaDUINLgteHE605/zFvEpCux37ExQWOhJfdeB0uHMAlm62Ko/fMWWHXybgrkNQR4AASrOD5rHw2BzyuBvQa0r/7HIGoxM6LdU4g84k7MwKAVt36DTGD4guRmYmNAjjxB8/vK8QqILOapb2+/3l695IQQbrg9d/0Oa3GnA95JyHBslrGUEFNA1UX8PiiL0iPtyaZ07jCNqyuPS+NkZyPThWBSSmd3NwBx7VSHZh8c4uHbVW3w95A78KB6SMIGZ1KIgCRwExfOOzfyNY6RI19zg==
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com (2603:10a6:20b:140::11)
 by DB9PR07MB9342.eurprd07.prod.outlook.com (2603:10a6:10:454::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 06:46:29 +0000
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0]) by AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0%5]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 06:46:29 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "kazuyoshi_akiyama@jp.honda"
	<kazuyoshi_akiyama@jp.honda>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>, "benjamin.robin@bootlin.com"
	<benjamin.robin@bootlin.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH wrynose 0/4] spdx: fix the compiled-sources
 filter
Thread-Topic: [OE-core] [PATCH wrynose 0/4] spdx: fix the compiled-sources
 filter
Thread-Index: AQHdRlyEXdqzlbCvEUeHL6KZM474orbgo60AgAMeO4CAAAvxgIADireAgB9wLYCAAN9FAIAAGw+A
Date: Wed, 21 Oct 2026 06:46:28 +0000
Message-ID: <fef20d337848497d00f62eb0201c4c06b61e4bbf.camel@ericsson.com>
References: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
	 <DLP4XNN74N6I.1RINHBSPGZQL3@smile.fr> <P6U4ukI2TxueJYGtH8T_Xw@bootlin.com>
	 <TYYP301MB11583CEAF49F1D6ABB33F54EEB8D2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
	 <DLSRMLU0EYKQ.3KSUL5VCXXX11@smile.fr> <DM9S9QJC41I5.HBYN1E0X32YB@smile.fr>
	 <TYYP301MB1158CD0148A79E2B59165355EB662@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
In-Reply-To: <TYYP301MB1158CD0148A79E2B59165355EB662@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR07MB6437:EE_|DB9PR07MB9342:EE_
x-ms-office365-filtering-correlation-id: 4bf3c37c-42d6-4385-2c93-08df2f3f08fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|10070799003|376014|366016|22082099003|18002099003|10067099003|11063799006|4143699003|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: GDEg6scG+43HiYUd9FgPpuB6O7MLiLohPP3edbxhH+WKsZa7rp6rdgaPk2J4w+4FyOWvFcaKFJkpHIBb2Kxij7uwgMO0ty1H9Zq5SVEvowmBl9FxQiY7huoROxltyBcY+PZKXNYgvmxZeJMRC6CFea+5U33ml7Li5mahk5bnYe0XsGos3MJLkVH8zWgfGGTxsH6JBzACO2g5Kp9wQ4Mug17FSuxhHKBp2R4nQhYN4qDL6qXzcAzU3KsPZvt+OwYTuqxNERuvBE1OpwHMJQ5cSIfHjv/Nzb7CxAedoIQ5qPSFlB94JUCbSkPhcJKRvzTtVBbzsAmSJnteXKWLRpEvVkx6mm6RXGz0qBokmopXPMKPn/Gv22HXP6j3Itywi+Ywmj/W5pinBmbxxIHym8fDHHn0ueJI52JkJWDDPnPIk0c5HZkB1oUOts5W0eddlJpNWsgNQjGSaoTFm2Lw7V+Oi9aExFlAksin4O35qOeifMgOjW7pN55Qg3ETBkWYevzThDrt2Og7c1Dw+H5OV71DOGvIfIP95u59CzoX67XPb9d+U9UHH/jmTnETR3qiBUXpgaz+HcorqY8rLohO2TgRN20O4pdOHTJEUtTOJTpFAyIrMj7FNv54gDZ2yf3xPlRafKlFXqJ2IZvMHoN68m5202wJXBpNikLd8PTeZ8pgM/uUgdMnI2Fe7ODP3uadYvF4wlG8Mvm5544Prfes4BF//tG4rzPCwqMOR1y1EA78njE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR07MB6437.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(261009223027099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ME9PYnlKVjYvT2NFYWUzRU94RVlrenpJdktRcFlQVEpHK29BL2QwR2JtK2FH?=
 =?utf-8?B?RXE0QWlUYzA0V1d3VzduUXZ0b2hSTjhJbmdyeWNzbTAwV1B5RkhhUi9GRDl2?=
 =?utf-8?B?UzBpa3JaZDVSMTNIRC9RSDdqVzlnTVIyTkVLOEt4ME5vTlBEc0RmY3QwWnpu?=
 =?utf-8?B?Z2F6eHBzcld5QmoyYWVMcVQ3dUxiSDhScWtraDJRb01ubHQ3d2tVVzdUNXZj?=
 =?utf-8?B?MkNxeE1jbG5oU2hUck0wWGMvNGhxSmpsMFh2TS9lZUhxWUQwb2N1c3ROd1M5?=
 =?utf-8?B?RHZHS2V0Z2VRbkNQM3NSeFc3c0RVbnpUc2phREpVVUljUk0zVXVPNWdHVlNo?=
 =?utf-8?B?MkQxeVZkSEtzbGt1eE5RUWN0UnJiZCtrb1diQjJ5dVA4bXFnSHNiTnkzQnNM?=
 =?utf-8?B?U3NvNElWb2hnUlYxWE1QVk1qRVZsa3o3LzhnWm54ZVpnS0RCc1gwRWg0SWw5?=
 =?utf-8?B?S3BYTThpVEN0a3U4aXdQSGNMTjVUSmR4SmpFWGhqYTJFTUxZc1BKTHVKR1lj?=
 =?utf-8?B?WXBxRzhHTDRGME82MENHU0hNa0ZBeDlkajYxaGovdWxKTlN3ZW1WcE5XeUNF?=
 =?utf-8?B?RkdpMi9lZ1IzNHNEUUxwbmRpWG5VUDY5WDAweS9PWXU0UFZEcWUvTFpQRVdq?=
 =?utf-8?B?STZueGpPaElqRkFKWVhpd2lDLzRXTDlhcUI4VEd3N0pneW9KOWZIbDFEQWt0?=
 =?utf-8?B?UmI5VFVodUxMaFJ4bDRRT0srcUsxU0NVWlkrMWRTeWlZelZnOGpGY25kRFhI?=
 =?utf-8?B?b3JvcWtyeXZhcXRhdERiRm9saHZJMFJSbEZNaEdDQmkyeGhjVWF3NHJUbTBX?=
 =?utf-8?B?RFVRVUl4eGwreGc2TTY1ZGpGTkdoa1ZmZE95b0cvYUJwNjQ1T01mY2hrSk1s?=
 =?utf-8?B?Vk1ZODFUamtyamxZTEM3STR0MDdabmo1N1lpZnQyRndMRWxDa1VXYjNlUDJs?=
 =?utf-8?B?cnJ2RWtSdjF1em1IdXI1VHdSbnplU2d4WnNhR3ovVnRiTXR0OEp5K2VWMy9h?=
 =?utf-8?B?LzZnVnJZWDdiTUhwR21nbFRCVHhxbnNFODJtMWhWZWp4U0h1dG9uZHgvUEhk?=
 =?utf-8?B?YVBOYVlrcWZOZVJ0ekN1UjE1R0J3azdhVW4reE1tMlJ6Mmd1d2VZbHFTQVZD?=
 =?utf-8?B?UExaNjlnVWZ6dWEyZGtjaERqK0pyclZMank0Y0M5dWc2QVBxYUEraE40R0JH?=
 =?utf-8?B?eUo1UUFneUM4N0tVeHBPbndmM1VIczNNb2hnekxTTCtHTkJFU0hlbkQxT2pR?=
 =?utf-8?B?RFFVeGhoYzJUb1lBRTQwcStwaHRvRHRJRVZZaWZYQU1XU2xFTkRZdzZZZHJ5?=
 =?utf-8?B?VWJQc0ttbS9KR29acXRUcDFpSDdtWjlOTzJ6c0tHYk9lbDkrVnovS0VjM0sz?=
 =?utf-8?B?NEhWT0JFbGczcW9EdEZYQ1FXa3dSSTh5MFZTalBPbCtsSUlLVG1xOUdwTVlt?=
 =?utf-8?B?ZEZhbUZ2SVZjQ1kzeCsyVU1iclhUNnFBandGUGN1Zzd0TnBkY2JoOUFXdWE4?=
 =?utf-8?B?bXo3OHJKSnp3WGtTT2J1Tm5GdVNndjZkS0MvdVBrRXFRNnFiOUdVSzBNS09K?=
 =?utf-8?B?ZGNjK0FXaml1NGRzbzVXMU1ORCt2TmRWbUFrcVZ6czQxdDFYdjNOUkZhVzFQ?=
 =?utf-8?B?SWU0eGdqdnJVUFpsRFNFOUVrcFhyak9vUWIrQ3JROFpYUXZiWHB2bXZ0UW5Y?=
 =?utf-8?B?OURBTXg2clhxZ2NyY0k0ZmQwNnd2Tmg1SitHeUtBbFRPa1hSUzZXd0FZMUtN?=
 =?utf-8?B?dFVDTHNmVHZMWDAzUnpjaXhwWWFkZVZXN2pZODdPUWdZSnJhME83MVhKYjdS?=
 =?utf-8?B?VFE5NDU1NXpodWtvOWJxZ3dVdmtTNkJXQlVyT3pPV0tZQ2ZRaHVZVCtwTnI1?=
 =?utf-8?B?UG9BSUZjTWFSckc0dThmLzhzSU05WTFpRlFENnJtVnBPTlpIYnJNL0RDVUZ2?=
 =?utf-8?B?SEhza0k2S0FrcVFtRThTYzJidEFTTC9TQlNLNlhDcDhPUlJmbDg4RVF1WG9k?=
 =?utf-8?B?andYUkhSMzRuZlNMeCtzbnpQeFFCVXVEQTR1dkRUSGE1bVpGM2ZrRmdnKzB2?=
 =?utf-8?B?dzVYWlNFdkh3WExzMktuVk1UZC9zU1VTaGoxRHNNdE1ZdXB3b2xnbUVEVE5T?=
 =?utf-8?B?eEZoejE3dlRNVjkyZ3hNOUlSU1BVc1ZNcTV6RGJkSlkzM0dsN1BMNVIzeXZE?=
 =?utf-8?B?TFFuK0hOYm1QT2FnV2ZFWk13YjYxR1oxdW85VHA0MmZqMzQ2a1VPbXRtWnhj?=
 =?utf-8?B?azVwOGlldVpqV3hWb0JRNFpDbXc0ZUxWbWhQb2tVV0c2RDRwSWdpanR6c0tr?=
 =?utf-8?B?amdDMjdhL3FZU3hpdmd1WnNtaWJCWlZRYlZGSTJhaWpoZ1QvOGZONE5kNEdV?=
 =?utf-8?Q?3ojhNw4Qt3OtHBuHOdkMRL6ghXDXz1IrV8XIp5A5nktMR?=
x-ms-exchange-antispam-messagedata-1: XRgvigTp3pPWSH+Nw5RTCouvZUXSxyEQtB8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33899896FB7E8041AFBF37627BCDF1F3@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR07MB6437.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf3c37c-42d6-4385-2c93-08df2f3f08fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 06:46:28.9545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PY1yxUJ4Cb+CNt+g6XaXOmOdyDsV6eVlEkPQJSZ4DGp2+v2PkUfZ3cWYy7B85wmbbBN28pWsxcohlhytFKlo99zIOxbn1DH+77yVAh3WGF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB9342
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248363

T24gV2VkLCAyMDI2LTEwLTIxIGF0IDA1OjA5ICswMDAwLCBLQVpVWU9TSEkgQUtJWUFNQSAo56eL
5bGxIOWSjOaFtikgd3JvdGU6DQo+IEhlbGxvLA0KPiANCj4gVGhhbmsgeW91IGZvciBsb29raW5n
IGludG8gdGhpcyBzZXJpZXMuDQo+IA0KPiBJIGJlbGlldmUgbm8gY2hhbmdlcyB0byB0aGUgc2Vy
aWVzIGFyZSBuZWVkZWQgZXZlbiBpZiBpbXByb3ZlX2tlcm5lbF9jdmVfcmVwb3J0LnB5IG5lZWRz
IHRvIGJlIGZpeGVkLg0KPiBTdWNoIGEgZml4IGNhbiBiZSBkb25lIGluIGFub3RoZXIgc2VyaWVz
Lg0KPiBUaGUgc2VyaWVzIGlzIGluZGVwZW5kZW50IG9mIHRoZSBzY3JpcHQuDQo+IA0KPiBMb29r
aW5nIGZvcndhcmQgdG8gdGhlIG5leHQgY3ljbGUuDQo+IA0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
IDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2Yg
WW9hbm4gQ29uZ2FsIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgT2N0b2JlciAyMSwgMjAyNiAxMjo1MCBBTQ0KPiBUbzogWW9hbm4gQ29uZ2FsIDx5b2Fubi5j
b25nYWxAc21pbGUuZnI+OyBLQVpVWU9TSEkgQUtJWUFNQSAo56eL5bGxIOWSjOaFtikgPGthenV5
b3NoaV9ha2l5YW1hQGpwLmhvbmRhPjsgQmVuamFtaW4gUm9iaW4gPGJlbmphbWluLnJvYmluQGJv
b3RsaW4uY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBD
YzogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBN
YXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT47
IEpvc2h1YSBXYXR0IDxKUEVXaGFja2VyQGdtYWlsLmNvbT47IERhbmllbCBUdXJ1bGwgPGRhbmll
bC50dXJ1bGxAZXJpY3Nzb24uY29tPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCB3
cnlub3NlIDAvNF0gc3BkeDogZml4IHRoZSBjb21waWxlZC1zb3VyY2VzIGZpbHRlcg0KPiANCj4g
T24gV2VkIFNlcCAzMCwgMjAyNiBhdCA1OjQ0IFBNIENFU1QsIFlvYW5uIENvbmdhbCB3cm90ZToN
Cj4gPiBIZWxsbywNCj4gPiANCj4gPiBASm9zaHVhIChhbmQgb3RoZXIgU1BEWC9TQk9NIGludGVy
ZXN0ZWQgcGFydGllcyk6DQo+ID4gQXMgb3VyICJTUERYL1NCT00gZ3V5IiwgSSB3b3VsZCBsb3Zl
IHRvIGhhdmUgeW91ciBpbnB1dCBvbiB0aGlzIHRocmVhZC4NCj4gPiBGWUksIFdlIChQYXVsIG9y
IEkpIHBsYW4gdG8gcmFpc2UgdGhpcyBhdCB0aGUgbmV4dCB0ZWNoIGNhbGwuDQo+IA0KPiBJIGRp
ZC4gVGhlIGNvbnNlbnN1cyAoUlAsIEpvc2h1YSkgd2FzIHRoZSAic291cmNlcy8iIHByZWZpeCBp
cyBhIGRpdmVyZ2VuY2UgZnJvbSB1c3VhbCBkZXNpZ24gd2hlcmUgc291cmNlIHBhdGhzIGRvIG5v
dCBoYXZlIHRoaXMgcHJlZml4LiBTbywgaW4gdGhpcyB3YXksIHRoaXMgc2VyaWVzIHNob3VsZCBi
ZSBjb25zaWRlcmVkIGEgYnVnIGZpeC4NCj4gDQo+IE5vIG9uZSBpbiB0aGUgY2FsbCBvcHBvc2Vk
IHRoaXMgcGF0aCBjaGFuZ2UuDQo+IA0KPiBEYW5pZWwgbm90ZWQgdGhhdCB0aGUgc2NyaXB0IGZp
bHRlcmluZyBrZXJuZWwgQ1ZFcyBiYXNlZCBvbiBjb21waWxlZCBzb3VyY2VzIG1heSBuZWVkIGFu
IHVwZGF0ZToNCj4gc2NyaXB0cy9jb250cmliL2ltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQucHkN
Cg0KSSBoYXZlIGNoZWNrZWQgYW5kIG5vIGNoYW5nZXMgYXJlIG5lZWRlZCBmb3INCnNjcmlwdHMv
Y29udHJpYi9pbXByb3ZlX2tlcm5lbF9jdmVfcmVwb3J0LnB5DQoNCk5vIG9iamVjdGlvbnMgZnJv
bSBtZQ0KDQpEYW5pZWwNCj4gDQo+ID0+IEkgd2lsbCByZWNvbnNpZGVyIHRoaXMgc2VyaWVzIGZv
ciB0aGUgbmV4dCB3cnlub3NlIGN5Y2xlIChJbiAyLTMgd2Vla3MpLg0KPiANCg0K
