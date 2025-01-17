Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA497C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 15:46:19 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.45])
 by mx.groups.io with SMTP id smtpd.web11.13640.1737128771100795141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 07:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MD5zJeI7;
 spf=pass (domain: arm.com, ip: 40.107.20.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bX5TWxDeyFUo+X4Wm/X9KOewUbh75A5goiaq2tfSKhGnp52X/nyH6mJWm84LZnpn7d11Zl8IBpifjzqQQ64QZ57+yOuu9UQubgtTGfDfVRa9cgt77SfTB4FogQfaLPSOKMxQr79+jiCHaLwnRtotl+oagSsmajlCpT3ZddP9CQuDKrp0bROJmsxXwjuW+Z/fV0jmtU2WJe1sFNyJUhEHpzt79OoqZKwvkK8DsGqM2xrJTINnshLmjO/wFwW7PP7smnajfsoWkctAu9qjcbLtvOfUwyyCCtg2dC7rW2djz9qvWuPPaxqvFcTA7gSbaLLTbHNATej/DwAiYbDAKyQggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJmD6d+3P9GCxoSc3CL0M0oiyX9MElFSTjIYEvOoSpk=;
 b=CwCp95NAGusfMkHAhD7fkbawbpz2K0Z4YqGT9nVQ6//OXUJdAj3ohPZdGKBM1XHdhYt1bI0tWLuDHthKBtw11eTJ9p0ILSD8a2/JbmTRH2IJAwGYfftcfNKCSkJoIuL+2/Kd0DoBr6bc6tXkCzUgEFMzr3nRQfooVOSYAb0zaMZ+eRLb9yO8BUfjaPQ3j34xR9vVpcArSufLrAky2i0zab1TsGnSwbNhKGk1ewbF0B5FLGaEHXnnYqLEMUMVnJIf6bP9B0vJspskUhVTQE4wanM7CWYwsmvkdQly4+dVtd0vdBqchiHaHrkz1HL3Fv2KtsgK4sYa7XCu2dhnJJ7ZKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJmD6d+3P9GCxoSc3CL0M0oiyX9MElFSTjIYEvOoSpk=;
 b=MD5zJeI7cRaFs0+FA6nhbE4ddFS5pWKXnU/fU1m0GWtKyHGo39xcj0bwYaDfjEXmEjRlnuSdPUY6V1TS+AZL9GZJ4y5c4SyBvKo+FnF+fZeveZcxDKyQXPf0nr2m9vxK1YPG0UIbs+X0E4hTLGc35hcMOfPLBrkjw1NS5SD9VXo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB10410.eurprd08.prod.outlook.com (2603:10a6:10:52b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 15:46:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 15:46:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] fmt: 11.0.2 -> 11.1.1
Thread-Topic: [OE-core] [PATCH 1/1] fmt: 11.0.2 -> 11.1.1
Thread-Index: AQHbYBFbsSStzNxE/kCV9QVdlEXOt7MOymCAgAxjSAA=
Date: Fri, 17 Jan 2025 15:46:07 +0000
Message-ID: <A08654A9-D6FE-4BAA-9181-2EC9CE497D61@arm.com>
References: <cover.1736150475.git.liezhi.yang@windriver.com>
 <b6a3ea4a7a3c811d7f3f9fa74e11d5001321ecb1.1736150475.git.liezhi.yang@windriver.com>
 <CAMKF1soHePWfU3Vf5614+rW2iCLKmfmXwqFhh+genW++s_JcYg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soHePWfU3Vf5614+rW2iCLKmfmXwqFhh+genW++s_JcYg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|DBBPR08MB10410:EE_
x-ms-office365-filtering-correlation-id: 65024989-e246-4eae-6098-08dd370e0e9a
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OStBV0xaR3BrMk9odlNkTnR5bDhiVDhnRzBCUStOZW15L3N3djI3dkRqNVQ3?=
 =?utf-8?B?aUh3WVpsL2JJR0s0TjF4azMwMDd4ems5cjg1TytZOVlZSmlvVVpMVTZ1VlQ0?=
 =?utf-8?B?VlkySkJHd1J3SWtNREpNS2crQTBNSXdSSXB1MjZWcnQycFNTRm0vbDdtbm1Y?=
 =?utf-8?B?cWhrS0kwT3p2SG5NNmlqWEZmZXFGQ3Jmb2dtbkRLUC8zczU3N0piR2VHcXF2?=
 =?utf-8?B?WmRKWld5Q1hjL2d1bVJ1M0ZDZytZVFVEZVd3MjVkZnZWNTZmWUNWYjN5S3Vn?=
 =?utf-8?B?SWJUZG9CZ2tvNHY3RE9mYWVOM3UxaVhLcWNoZnhDS0huNU1UNWlzOUNqKzhT?=
 =?utf-8?B?dkRjTVlPZXROaks4L3hDZFlhUHpKeGFNM2JFbGJmaTNUc1Y2a2o5blJlRjdB?=
 =?utf-8?B?ZlFPT2owK2k1c1ZWQTIwZTl3Q0E1M0xjYzdrT29wdnpWdll6ZjVIZUtHcEda?=
 =?utf-8?B?cUFEM2NPQ0c2MU92YTZDWmxGUk9PK0J2QTN6VVhEWEVKSkxHUjFuUnE4MlBC?=
 =?utf-8?B?cXdWcUI0VTlDMHEwV3pHemgwaHFHcnVOdUpndnNveXJSSCtNbmNENVZUZk5X?=
 =?utf-8?B?NnVxSnkyeFQyNVRrQW5RUE90bUd6ODY0NzJJWlcrVENqNGdMZjRmcHdnMEFj?=
 =?utf-8?B?SjQ0WFFqVUJ6WS85TkJkbW5NeXVzZ0MxVnRPWUlENEhGMnJpQ2FQakoxcHhY?=
 =?utf-8?B?RGFwL2l3b3FzUG1aNmFYVzhpOGszTmw3N2Q0V2JaK2NpOE5RVjFYK0MwRXV0?=
 =?utf-8?B?LzNwTktFaWJlTUVSSnpQVU81Z1NwR3ZUd25VYUJ1K2ZlNks5ZW9LTjVUU3BQ?=
 =?utf-8?B?b2NsaGFJL0FhMHRVa0ttTXRjNmJDRjVFY24zaERUMEN5bWhUT3lGSTRpdkI5?=
 =?utf-8?B?WnpLS1N1RElvd09uaE5NTG1GU01DUXJrNFNrRW8zZkNzZWkzTkZHZUhKUlBY?=
 =?utf-8?B?NFNqc3NMZERjYmdRbDFMbUR0WDhIN2w5R2UyakN2bW1Wa3h1VmR2VzJ5aVNZ?=
 =?utf-8?B?TitFMGRsd3hkTGIwd1VKSlM2RHQ2VzIvWk1mTEtMcU1ZMVdiZHhBMHFGaWpP?=
 =?utf-8?B?aFJXaVVSV3F0eWZCRk4rSm1hcHJPVFRaQWtOeC9PbSs1NTl1YVpxbC9JOHo0?=
 =?utf-8?B?dUE1UUtzRkkzWkVWditmVng0aHVMajlpNThvTmxMNEdySDdGdVRrVWdKNm1o?=
 =?utf-8?B?WldRam84eXVSNDlSRFJ3SDd4WWV6bHJQM0xBUVZhbGprQjQyaHZST1RyZ29S?=
 =?utf-8?B?bnBHRTVYeGl0eno0M3RjQktWeDF1M05nTm1YNzdTbnAvYzlRL0FGbGZrMTFn?=
 =?utf-8?B?OWxraVVVUzNraDB3VW1BdTlBZDFZeTlJTSs0M2pLMXRGZE9mcUlKanhJNWRm?=
 =?utf-8?B?U3ZNOE0vS0gzSmJSVEZ3NTBxM0x4N3BoVUUyRGg0TnNteGRlZTJQTGNhVW13?=
 =?utf-8?B?L0NVdktHRG1JaHdDbnVER0pJS1A5Tk9wazNvb0M1TDNvdWtCNjdRRFRPUkd5?=
 =?utf-8?B?eEJLQ1N1SFRJYnFnYXc0ZlM0Y0tJYzJXVHVjNjRKamhROUhFNVAxMndWazhY?=
 =?utf-8?B?WVhTQTdFUjlGNFNMRkdXak5aOGhWdzF1bjFYa01FSnlabFRMUmJOekQ1Wnk1?=
 =?utf-8?B?bkVzb0tqWmJHcGZFWFAzYThKaVpjWnQreXBJcWdhM1YvdlJCOTlXajdJNXE5?=
 =?utf-8?B?OEtDWTdPMXZLVXpDcVRqR0JIQVNOaElFSzY1Mnpxcmw3TnlBWTJzR0JPQXQ1?=
 =?utf-8?B?YnZGaEs1T1V6MS9qSXgvS0o0elF4dW91aWdTTC80dzFTcUQ2dEZNS1BzZXVW?=
 =?utf-8?B?WVVqSHZKbThFSVhkKzJMbkd1VTJYc2s3SjdBSEk2bnExTW5ISW0xeUNKanJG?=
 =?utf-8?B?MTNmc3BUQzVEWmNMRjVpckQyWG5td041dGlQRTZ1V3NRYW4yTVh3Z1ViR2pM?=
 =?utf-8?Q?WPFQSx/nvKXaZmzS2EXLnFEsh0/J5iRh?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bDRzUVlvK283WEpBVVRGVGQ5UWJTak1PdXJSc2QvMUdYV3JkUHdFc1Q5RmZI?=
 =?utf-8?B?L0RveUNKSWR0YWxiV2FMQkdlbktCczNuTlZtNGJnczZ1WTEyMGdrSHdMMVNO?=
 =?utf-8?B?NVlpMUxDOHFVSDNhdFdOVS8zRnkvbUFhdUJ4WUR5c05RY0g3OEdmMkk0MGJ2?=
 =?utf-8?B?TGg4ejVCVTVqTlhYMGNBZEpjSnBFWis2Z2dsRVg0S0FuZ2g1ektna0F3Ly91?=
 =?utf-8?B?RHJUN1N5U3hzT1psaXpZdTBhcXYrNjYxLzJzalJrUnl0SFF3cENWSStMMytl?=
 =?utf-8?B?WHNpeG5VaFo0cFlqWDhFL0NLalZZTzNqRC9EUUo3YWhVT0ZjMElaNkRabzhw?=
 =?utf-8?B?K3d3SXYxS3d4amNhTGI3NWVwTTc5OUkwVGxCYU9XdlBvWDBIUGdyYWtVQWNK?=
 =?utf-8?B?aFVPaUdMWnBHVTN2WTIvdVNTZjlic1V1UkJRUURsemFsUFZtK3JxRU5XNjZk?=
 =?utf-8?B?WGZaYVN1LzI1ajY0TnBQQlFLY2pNbldIRjBSSi9HalRjdGhwaHVCZzhuUmxC?=
 =?utf-8?B?UktlUlV3blhrQWhYczVzSXQ2WjQxYkNuODhTVm44aGoybnFIejJKbjFvcS9m?=
 =?utf-8?B?b000NDJoeUp4REYxUTVOV1M4ZHp0UGhzdmFtejlTR2VweU82NjBPODBuSmgv?=
 =?utf-8?B?a1g1RGpaMnlNdDNCOHhwTGFOTU1WZzFDVGxycTBaR29tanVYZVo0blBZcU9l?=
 =?utf-8?B?WG5oK0tvMjdGdWFvV0p3US8ySGpoUWxqUjcybHZpcTllOGtIcE5oOXp3cHVs?=
 =?utf-8?B?Yit4dkZhcnRQYVhHendGcVNvVENIWXdOWFl6MFR2aDdZbzVEZXdPMCtCSWRw?=
 =?utf-8?B?VTFEZWtscmdCNVk4cy9TbGRnenhzRSthYktLYXBITGxMbXhtTng5VEhPbkR5?=
 =?utf-8?B?dThlMDdpazlQZUVxYWNGSWFnY05GQzNvbHZ1MEFibUVSVDY1eDIrbGtHRzQ1?=
 =?utf-8?B?UUpxQ1NINDRZUzVaSzBRcUEyTDB5bHp4dndnWi9wYjNkVURxNExFVGlxMThZ?=
 =?utf-8?B?NnpFbWw0ZDVaK2lXNDNyaURMemRiT3BxbGFlR2thQnFkWjVJUVYwYTh3ckNL?=
 =?utf-8?B?UWZNNW1Oek84d2U3RzNwK1hHYnFIdXJsREU2Tk9SZm9mT2hOVXlCYUNUc0lJ?=
 =?utf-8?B?QW00a1NzRHJ0b3NhZjFvV0ExSm9rVlI2ZGhzRlBUK0dtVXE3a29NM1dHT0pC?=
 =?utf-8?B?cFY4eHQzRHh5Syt4SDJmSUd2K2ducytyOTZxZDFNbCt4NVdYTjBGTXNaVXh1?=
 =?utf-8?B?SkpuZVhiSGJRd3p5OE9KbnRDQVVwRTJuMTNuTmZpTmFBUnBDV2xyUjlHUmVC?=
 =?utf-8?B?WDJYMDMzQUx4dnlRT3NYaldSbUQ5Qlg4eHcvY1U3K1k3OVYwVkl4cjJLdkJi?=
 =?utf-8?B?Y25QY2VjV2laZFovUlhCQmpEL2thS3IrTWVrYVprZjRXU2cwNDlIMXZRNXR5?=
 =?utf-8?B?M0d0QkxRN2I0b3c1K01qVkhIR3JUc0lDUGdZeFRidzFMYSttRGJ1SzhIRFVK?=
 =?utf-8?B?cnJhNWhmdHBUaHVyVmx0WUJhVkl2MFNtc3VtaytSeFNxc2U4V2RpbVpGWS94?=
 =?utf-8?B?dmVDOEdmWnBUL3k1TE81QlBYNlowZUczUnBndXBZb1pSUFByZDQrVjRDczdt?=
 =?utf-8?B?b01tN1dKdXdvaWNNODczS3ZHa3FQcVV5TCswV0lqZCtLbUhVVWRiUU1TbTFN?=
 =?utf-8?B?MXRVMlBBUzl5aXUxaFljQzk0ZGNuays3M3VrK0VhbEh1R1dBdzZGOXdaK0Mr?=
 =?utf-8?B?TE9meDFOSVYwUWFlblhZam5hbk1xZEZ2elBHbDFRZjRXS0RnMmtETDVmQW9R?=
 =?utf-8?B?bklDdEtjQ0grZmNXYnpTY2hUQXRTeGRQY3VDZStuQUJMYzMvOGVpaDhZSnUv?=
 =?utf-8?B?TkJkMzlVbnIrMEphUjh5alh2MUNNcUUzdVMxbk1iQ3B3Q0NjSVRyN1I3VE9C?=
 =?utf-8?B?RGkwcVBCRVpHYzIyKzR4elg2aCtQeVpMRnFFNm0veURDamlIaWhrTFE0WW1S?=
 =?utf-8?B?TURPMGtZYTNsaGJhdHh2c3FpcHhJV2NSSTc1UVk5VmVMcDY3Z1Vhd0g3YmVr?=
 =?utf-8?B?eCtMZFN1cUZ1a1VmOWs1bzJMQ0R4Y0ZPMFJJM1dIbGdQRHR3cGNGb2tlYjRw?=
 =?utf-8?Q?MrZVCph9VOjFeoIWPyVV7XVTk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05E6E51B4470EE41BD8ECC38B445A88A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65024989-e246-4eae-6098-08dd370e0e9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2025 15:46:07.0157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hqBYTPCJ6e3per22lG3PCvHc41tBk5vZTuUN6XWPThsvnlD9saqx7qccG+ZG+mUKPUQrMtG+pMgP6nN4AkmZPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10410
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 15:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209990

T24gOSBKYW4gMjAyNSwgYXQgMTg6MzUsIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
IA0KPiBJIGtub3cgdGhpcyBwYXRjaCBpcyBhcHBsaWVkIGJ1dCBJIHN0aWxsIHdhbnQgdG8gYnJp
bmcgaXQgdG8gYXR0ZW50aW9uDQo+IE1hbnkgcGFja2FnZXMgaW4gb3RoZXIgbGF5ZXJzIGRlcGVu
ZCBvbiBmbXQuICBmbXQncyBBUElzIGFyZSBub3Qgb3INCj4gbm90IHVzZWQgaW4gYSB2ZXJ5IGJh
Y2t3YXJkIGNvbXBhdGlibGUgd2F5DQo+IHNvbWUgcGFja2FnZXMgcHJvdmlkZSBhbiBvcHRpb24g
dG8gdXNlIHZlbmRvcmVkIHZlcnNpb24gb2YgZm10IHNvIGluDQo+IGNhc2Ugb2Ygc3lzdGVtIGZt
dCBiZWluZyBub3QgY29tcGF0aWJsZSBpcyBub3QNCj4gYSBodWdlIGlzc3VlIG90aGVyIHRoYW4g
ZHVwbGljYXRpb24sIGJ1dCBzb21lIHBhY2thZ2VzIGUuZy4gZ2VyYmVyYQ0KPiByZWx5IG9uIHN5
c3RlbSBwcm92aWRlZCBmbXQgYW5kIGl0IHN0aWxsIGhhcyBub3QgbW92ZWQgdG8NCj4gMTEuMQ0K
DQpJZiBmbXQgaGFzIGJhc2ljYWxseSBubyBBUEkgc3RhYmlsaXR5LCBzaG91bGQgd2UganVzdCBo
YXZlIGZtdDEwLCBmbXQxMSBldGMgcmVjaXBlcyBpbnN0ZWFkPw0KDQpUaGUgLWRldiBwYWNrYWdl
cyBmb3IgZWFjaCBvZiB0aG9zZSB3aWxsIGNvbmZsaWN0IGFzIHRoZXkgZG9u4oCZdCB2ZXJzaW9u
IHRoZSBoZWFkZXJzLCBidXQgYXQgbGVhc3QgdGhlIGxpYnJhcnkgcGFja2FnZXMgY291bGQgYmUg
cGFyYWxsZWwgaW5zdGFsbGVkLg0KDQpSb3Nz

