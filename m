Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web12.37511.1614011481396939916
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=C1va5PZH;
 spf=pass (domain: siemens.com, ip: 40.107.22.84, mailfrom: florian.bezdeka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UD8Cog9Bi8QwuVSX5T0pPPR3AILONrMVNeufO4SOjAS26DbK4wxBr3RsqhdzzBGvG1YV5EO6w8xsl7CKASVJjiGS5ReLNW23+GG7uiJISe95OjhI1eEjk6gaoX8cjfg1tPxpi333WT2OIVCwaIdbU8Ghunzm4mHpdvDntTLm3A24EYkseBpsXoXDc/UG2ZFgyJ3glQ4pJpfa2G850jvh94N/NfgEj/h3lWCF517V7cfcxU83iT5VTa2Otp4duqYjRbyWhMiLrLlLwgHG9LA/KktHavW4Q+ejON+NXjZM8tcHWCzAxqWpYHc6oFZmbQZYFMOwryHAMEu2cl4U3x4WkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAxLGSpZr21S3mUb1DHfnRzAIQC+TdRDYyznl5yh51I=;
 b=bSMku2vnsTaI9UDtJBKJL5b6DX4GMQz5/69ctredFeeK2fvJnZX3KPQ0dusQC3CeC0qSni/CCuOyws+3nKQsRjBwTdxTJhq+Ec9FNhLbNYrqLLNkVkbwRttedCYtkqLSQf9A0XiM08Y1TOUCN7iGHXybSOrUDMaieRIP4mHdQLKhXzOd+axnemVwV7ywR6dPcJCdUirbabrom1i55sKz1I6Cj5sywmhRI5Bqi9bbc3WvWWnUs99O0o+EHvqqqAqHpcsi55HwIkNfmAeKgb1iX6fJzHNWY7izzmf9Zfqq1wsGIsq5UaBPB7x0jKYKXDR9dwzQcHio6jvWJ6Jf4hZ0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAxLGSpZr21S3mUb1DHfnRzAIQC+TdRDYyznl5yh51I=;
 b=C1va5PZHd7LLT0BjRt6MJQjeSo5qRLdrUXgmKPIMTl3ODj5USEbCWheUptJbsmOmcaNnR3Jmmo8fhdEHia1JuRxFyKMrPyYCiRq2gxNpvinPWfLlc5vQ3GhBxh6wpqbtnZli8AxjDiy5wHD10T8SSuCesIDfDyJI8fcFOqqhVNs=
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM9PR10MB4231.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 16:31:19 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc9b:2590:a1cf:3301]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc9b:2590:a1cf:3301%7]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 16:31:19 +0000
From: "florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] wic: Warn if an ext filesystem affected by the Y2038 problem is used
Thread-Topic: [OE-core][PATCH v2] wic: Warn if an ext filesystem affected by
 the Y2038 problem is used
Thread-Index: AQHXCQ/QgRMMnOhmG061Q5ykS2aueKpkVUmAgAAI4IA=
Date: Mon, 22 Feb 2021 16:31:18 +0000
Message-ID: <94d69e984d12ce54c89d64ce15703699d838fc18.camel@siemens.com>
References: 
 <5b5b7cb71b40268712a8bf9d18e33bf6901cebd4.camel@linuxfoundation.org>
	 <20210222114120.32592-1-florian.bezdeka@siemens.com>
	 <7a7e2ce878209faaaa4ccd75b0d8ce40ffcfa349.camel@linuxfoundation.org>
In-Reply-To: 
 <7a7e2ce878209faaaa4ccd75b0d8ce40ffcfa349.camel@linuxfoundation.org>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=siemens.com;
x-originating-ip: [2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4f3a8765-5324-4433-afa3-08d8d74f4873
x-ms-traffictypediagnostic: AM9PR10MB4231:
x-microsoft-antispam-prvs: 
 <AM9PR10MB4231CC6D1FF46C86037E24F0F6819@AM9PR10MB4231.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NIXq2aqYXh4oHixU1ivfjNcD46OnK7Jw4Tn0Hm/YSGZsEipox7iEjlU46bEW4UBE1QljFRkvGGdy04Ac483iPQDlkP4uwBiAYuruxbeVpO9lXmek+FXr745GnyKonPyPUJP/AupHzI9vWPTGoWURNc84/eUjWMf/fDWsSXgpHs2rvrI5Uq0wPOnqHCN75ugf7jGBMfBChnexjNYPrHDIY3xAjlprsg6YgyyNQgt6VLPo24z10RJ5R36VhROc0OgFPdxErZHSjRK6dlDZ1q/M9sTep81u5EPBsSjoHzRZSIB3ZrY+myP/j1PAuyciozqdaRzCIuxEdu+/nfpgcH++MmKpuWnU/14Dvy5aQfxPZETqBJ7xAGehCfe/9CMu+cyMz2ZF1/xfZHn/jYXy8IFsd8Fyo0mwQPvJ2SFECEljwO8MtBgA++1t1vAn9YoTuLwPcRwduaEXW6SWZ7wmRvXFpJb8nDCUH9KlJA+bFwsPR0C+6NBdOz89jbkPO4/ksAJefDP95/+IfumPCiD8oCWMvANN/wfUK2/qFwpZ4PG8LrdHkVD1ZhqZLhflBeKb6MQK33B4UiyVkpeBKMLFFxTryL2eZOckeanO1o3tla1JchY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(45080400002)(110136005)(316002)(6506007)(8676002)(5660300002)(6512007)(2616005)(64756008)(66446008)(66946007)(66556008)(478600001)(966005)(71200400001)(6486002)(91956017)(76116006)(2906002)(66476007)(86362001)(186003)(8936002)(36756003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?UWJhaDFwV05qS2NndW11d2N6UTlkcXdUdzhuemV3NklwbEUxN3dNTWhZS21s?=
 =?utf-8?B?VnNENVZNUUM1VTk5OHU2bVJJcGgxY0ZkNGF6TW1HWWNERGlYdjdkaTd3Zncy?=
 =?utf-8?B?MWlzM3g0dlRmRnZaOTdYbzU2dEdnUXhLb3AzTzUwMTNYSEk5cS9wZVJFTEJt?=
 =?utf-8?B?RFpaOStXZmxtMUdFdnVHY0pJbVh4YkxScXRlOG81UzZWTWd5RnVZRnYxdGdG?=
 =?utf-8?B?MGdqb2dlQTE5REFXS04vUm5VVkRrNStpdXpvWHNSR09jSk9TVk9MNjNhZkJk?=
 =?utf-8?B?SkdXYVZwNVpOYUkyNmNmRlpkS0FxVkdqNU5ieWk1K1JpaWJWTUFKRTJ6bjVz?=
 =?utf-8?B?cGpBR3pOemlmWGM2MnNOemdzdG5SRGFvTGlXZzFjWVFIUjhUUFlQdklJOGE5?=
 =?utf-8?B?TVJHa3QwbkxqbVMzQ3dsWDNqM0F6VjRWK05ySldHWFBTVGZvS3RheEcwUlVy?=
 =?utf-8?B?MmdIcEd4V2FPR1ZySjM3eEw4TkF6L2NFS0RaNjNmdUhvK3RNMktBRjFtWWxo?=
 =?utf-8?B?eXo5Nm1UVGh6VXJNdmVvUWwyc2o5VEEyZmdBMzdBREZ0aU15Zng1MENDNEVP?=
 =?utf-8?B?ZlNwL0hBWDhpVGJDY0lEUDNLRE9hYWd5QkcyV2ZaMXd3ODU3QzQ3UUJnK0tU?=
 =?utf-8?B?QlpKL2xLTGk0UktNaHFVb2l4RnFlZ05HRXo1RkQ1MlVaU0pnWitPYXRyNkRk?=
 =?utf-8?B?REJFcG4wR3A1TnZXcHpweG1ha1d6RWU2c1VNbnZlS08yNi9QbVNyRGo0c0lR?=
 =?utf-8?B?WHdFMGM0bmh0R0NpZjg2bkNERFhpQkJjRlpUVDhDclF5U2Rtd2NDMmtjYlFs?=
 =?utf-8?B?eTUyN2w0ekdVM2xtb1BzKzQ3bjVMVTJXY1g4cXRWbTlQdkxPRzM0YmNZZW9I?=
 =?utf-8?B?MWp0Y2JRVjFyZUprYkVpQmRwZndJaUIwVFdFQjdLTlRFRjI3dkVJUGlvUkVn?=
 =?utf-8?B?RG9IMk52K2IyQTBZNC9UNzh1QVZFcEdUTmxqSU5XdjVyNUxiSkozV3NGaDBE?=
 =?utf-8?B?VUhiRVVPT2FtaFVGRTBST3BIY2NRalVzdEpreUw1TVExSlVsTEF1UXRIQ2ll?=
 =?utf-8?B?V0N3aTRpckVtYmp5aHlpT0NlRHZOL2xGNmNDUnZUMzM0TXJWY0c3L01iRlpn?=
 =?utf-8?B?bThHVWxjalM4YzVBOWJaNThieUdoaVRaTTZoN3JIR0E2SEFqbzlTblJoQjY5?=
 =?utf-8?B?dUs0SWVzVVVxU1FHSjlmcjVteXN0ODZWQmJLV2JVTlNKM2FLY2lScFdBNjEr?=
 =?utf-8?B?M2R4RzI2WG5iTmFJVjVudlliQ0pUKy96ZlJZbjc2Q3JLdVpEeVZmMmdvYVBV?=
 =?utf-8?B?RUFsM3k1NUdpOGJkdXJEY3JVc0l3OVF4ZExCTGs1cy8xbEJWVVBZUWhxZmk2?=
 =?utf-8?B?SGFYelQyZmVUbUs4ZkRzKzMwQ2pxWHFnU21zNmRYVU1HeWExcEhFRmhqY1Nq?=
 =?utf-8?B?K3BiV2gyd3hDSCsyUVFjaGN5ZW9sRCt5RVU0dWRhTHFFcXNoblJ5UDlSTjh4?=
 =?utf-8?B?em1JNkx3Z3A0b1E0T2NvS01pTmdRRlRPOGN5bENVTkJ1OVFqME5rckdoMVNE?=
 =?utf-8?B?L2NBcGMvaWdvSW1HRXZTT0JsalJyczhJTFRFdDk3WWhGaG53NG5xUU9UZEZL?=
 =?utf-8?B?ZTdPR2UzMHpiNjBXcDFNQ1Nra0Naa29vdFNITmhFTFprTndqL1dQRUIrYWZw?=
 =?utf-8?B?MWdQSkZsY1ozNElLd0ZtU0drTXhsSTdzTGRjc05mUEI3OWxzdm9ucmFSWUlZ?=
 =?utf-8?B?aFpzVUd4aDV4aUlEOHZqMytVRU80VkpzT3NoN2tCYm92cW9SMXc3VVZjV21Z?=
 =?utf-8?B?S05zemNoMnpIYnBWaTNBY1RtVzAyTHFMKzRzZEZzbTR1ak1qaEVtUFlUYUNy?=
 =?utf-8?B?cVZlcEdWTXJ5RGh2bTBjT2dwUkZ2cVdCcUx5b0JCaklOM0E9PQ==?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3a8765-5324-4433-afa3-08d8d74f4873
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2021 16:31:18.9935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5JgbVy8bibgVJmJiVZyByk+SunwO0i+XmHwI+9lJo4a7iKco5RA37YKJp92l1CUbLyuQ8b+gUTQN/oPjfZTqKxMiNz//CoFdgTCLn67mgpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4231
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E586D938EC97B4CA65CAD2D22704C5E@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIxLTAyLTIyIGF0IDE1OjU5ICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gTW9uLCAyMDIxLTAyLTIyIGF0IDExOjQyICswMDAwLCBmbG9yaWFuLmJlemRla2FAc2ll
bWVucy5jb20gd3JvdGU6DQo+ID4gRnJvbTogRmxvcmlhbiBCZXpkZWthIDxmbG9yaWFuLmJlemRl
a2FAc2llbWVucy5jb20+DQo+ID4gDQo+ID4gV2UgYXJlIGdldHRpbmcgY2xvc2VyIGFuZCBjbG9z
ZXIgdG8gdGhlIHllYXIgMjAzOCB3aGVyZSB0aGUgMzIgYml0DQo+ID4gdGltZV90IG92ZXJmbG93
IHdpbGwgaGFwcGVuLiBXaGlsZSBwcm9kdWN0cyAoPSBlbWJlZGRlZCBzeXN0ZW1zKSB3aXRoIGFu
DQo+ID4gZXhwZWN0ZWQgbGlmZSB0aW1lIG9mIDE1IHllYXJzIGFyZSBzdGlsbCBzYXZlIHRoZSBz
aXR1YXRpb24gbWF5IGNoYW5nZQ0KPiA+IGlmIHlvdXIgc3lzdGVtIGhhcyB0byBzdXJ2aXZlIHRo
ZSBuZXh0IDIwIHllYXJzLg0KPiA+IA0KPiA+IGV4dDIgYW5kIGV4dDMgZmlsZSBzeXN0ZW1zIGFy
ZSBhbHdheXMgYWZmZWN0ZWQgYnkgdGhlIHRpbWUgb3ZlcmZsb3csIHNvDQo+ID4gbGV0J3Mgd2Fy
biB0aGUgdXNlciBpZiB0aGVzZSBmaWxlIHN5c3RlbXMgYXJlIHN0aWxsIGJlaW5nIHVzZWQuDQo+
ID4gDQo+ID4gSWYgZXh0NCBpcyBhZmZlY3RlZCBkZXBlbmRzIG9uIHRoZSBpbm9kZSBzaXplIGNo
b3NlbiBkdXJpbmcgZmlsZSBzeXN0ZW0NCj4gPiBjcmVhdGlvbi4gQXQgbGVhc3QgMjU2IGJ5dGVz
IGFyZSBuZWNlc3NhcnkgdG8gYmUgc2FmZS4gQXMgZXh0NCBpcw0KPiA+IHVzZWQgdmVyeSBvZnRl
biAoYW5kIHBhcnRpdGlvbnMgbWF5IGJlIGNyZWF0ZWQgc21hbGwgZmlyc3QgYW5kIGV4dGVuZGVk
DQo+ID4gbGF0ZXIpIHRoaXMgbWlnaHQgYmUgYW4gaXNzdWUgZm9yIG1hbnkgdXNlcnMuDQo+ID4g
DQo+ID4gT25lIHBhcnRpdGlvbiBvZiBta2VmaWRpc2sud2tzIHdhcyBhbHJlYWR5IGFmZmVjdGVk
IGJ5IHRoZSBZMjAzOA0KPiA+IHByb2JsZW0uIEJ5IHVzaW5nIGAtLW1rZnMtZXh0cmFvcHRzICIt
VCBkZWZhdWx0ImAgd2UgdGVsbCBta2UyZnMgdG8gdXNlIHRoZQ0KPiA+IGRlZmF1bHQgdXNhZ2Ut
dHlwZSwgc28gZGlzYWJsaW5nIHRoZSBhdXRvLWRldGVjdGlvbiBvZiBzb21lIHR1bmluZw0KPiA+
IHBhcmFtZXRlcnMgdGhhdCB3ZXJlIGRlcGVuZGVudCBvbiB0aGUgZmlsZSBzeXN0ZW0gc2l6ZS4N
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIEJlemRla2EgPGZsb3JpYW4uYmV6ZGVr
YUBzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiANCj4gPiDCoENoYW5nZXMgaW4gdjI6DQo+ID4g
wqDCoC0gRml4ZWQgYSB3YXJuaW5nIHJlcG9ydGVkIGJ5IENJIHN5c3RlbSBjb21pbmcgZnJvbSBh
IHBhcnRpdGlvbiBpbiANCj4gPiDCoMKgwqDCoC9zY3JpcHRzL2xpYi93aWMvY2FubmVkLXdrcy9t
a2VmaWRpc2sud2tzLiBPbmUgb2YgdGhlIHBhcnRpdGlvbnMgd2FzDQo+ID4gwqDCoMKgwqBhbHJl
YWR5IGFmZmVjdGVkIGJ5IHRoZSBZMjAzOCBwcm9ibGVtLg0KPiANCj4gSSBhZGRlZCB0aGlzIGFu
ZCByZXJhbiBidXQgaXRzIHN0aWxsIHNob3dpbmcgc29tZSB3YXJuaW5ncyB1bmZvcnR1bmF0ZWx5
Og0KPiANCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZyUyRnR5cGhvb24l
MkYlMjMlMkZidWlsZGVycyUyRjU4JTJGYnVpbGRzJTJGMzA2NSZhbXA7ZGF0YT0wNCU3QzAxJTdD
Zmxvcmlhbi5iZXpkZWthJTQwc2llbWVucy5jb20lN0M5ZmQ4NDI1NGY1ZDc0ZGVhZWM2MjA4ZDhk
NzRkNTI3OSU3QzM4YWUzYmNkOTU3OTRmZDRhZGRhYjQyZTE0OTVkNTVhJTdDMSU3QzAlN0M2Mzc0
OTYwNzQzODE2NjYzNDYlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01E
QWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZh
bXA7c2RhdGE9ZzMyZ0ZORUR2bUlLMm1lJTJCS0tKRUJ3RUljZEdNZmZkNFR1aElNam1yWnRVJTNE
JmFtcDtyZXNlcnZlZD0wDQo+IA0KDQpJIHNlZS4uLiBJcyBpdCBwb3NzaWJsZSB0byBzZWUgYC9l
dGMvbWtlMmZzLmNvbmZgIGZyb20gd2l0aGluIHRoZQ0KYnVpbGRjaHJvb3QgdGhhdCBpcyBhY3R1
YWxseSBjYWxsaW5nIGB3aWNgIHNvbWVob3c/DQoNCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0K
PiANCg0K
