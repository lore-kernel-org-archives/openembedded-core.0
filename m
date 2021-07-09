Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com [216.71.158.62])
 by mx.groups.io with SMTP id smtpd.web08.7603.1625812216962748812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 23:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=X2c/GFVU;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.62, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1625812217; x=1657348217;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vWSAoF2vdst0sFOpypUioYPQAtCeuPur6H6vxXFSr9Y=;
  b=X2c/GFVUHn+wuwvJVMVyDsfzU0xvpocWXAActoN8MlLAzJL3lbBvxtEB
   0M4/im3JZ3WqjML8E0KYYsykNPKT/BfTqCg07pWFr3UQUoS2VfpqW7oLx
   kiVvjDswz4yliIvz8UKmF15JaHGcOd6BDaMS9nltSYeHZVzZ+H/SoBzqZ
   26tMGsQVcirsPoGNCyVVPP0su4EaDqd2sw8tDCO0kIco6712iVM/CLnPk
   1CAdbrD5oPir7g5zgzsJhbI4vpl3sfC8oNVcq3DRHsz6M4ELh0GNzU7kh
   zfJ+U2ce+cU03pTGAeFS5T4WGeywrJEfTb76ykvPOji+iVlbQGhIb6/LU
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="34412407"
X-IronPort-AV: E=Sophos;i="5.84,226,1620658800"; 
   d="scan'208";a="34412407"
Received: from mail-os2jpn01lp2052.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.52])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2021 15:30:14 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOsrOWx3yP8pqcpo45y9W6FhK+eW6UCOE1Cfjg1ujkNu/8qPpae2dZX+vp9kZyCxiUtxzdPaliPq2KuALPyKKcdOVNMhetOBNhNsFnRQt9/B1J3jTfXOLp19KeIbshvkDwuCNugT4SpTD/WBMCU6eDSzfrXoTYF691LM3I85/er6Zc85f+foKZyj3GIg4uclalRt+ulLC/ZQfAr7uDfP9jD0UGFnJMK/6PN0uwYIASh7NBu3kKJbXCWOTtODiNY+PiqFQvTst97Pnzsuog3oIcIjI/q5/LD2/Mk+azfZbd6iFVydHl6F4KFb+k6zXhM55lteFh5+MQ1Sq2zLv/8fJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWSAoF2vdst0sFOpypUioYPQAtCeuPur6H6vxXFSr9Y=;
 b=ABn1Zif8wak3Zo9Vj9ze5jjy0qsxbkOYnEPnjBt7x6m3UYevuABB3W+6q6MZW16A71+EcThRohNDm6a/3kSHf+7oc7G58DiD400Xftma2K0fWUKNKTPjDvhzJJB20RXKFAH0tDFz+HdbVJyHsTjRos+CqYAQx83S/+V/0HJ01kj9wNukHK9VMkRiooBPPmTbabC5FjomBlg8KrQseEkqrdN/f90WkWJBY1EsgrEUVR3EwzLUo7y/nXJozwL5/897oRwNh9Id5vNk9Mfcg1iVKUELK0CKIsqZKHEEd6YWAWQwBrGpSC0CMQBShBzcGoxWvwJwN6sct7xRZxNsgQPuaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWSAoF2vdst0sFOpypUioYPQAtCeuPur6H6vxXFSr9Y=;
 b=RHUPfe4Fqy07RsHFbzS40V2rd1EVq+bUTiN/zQrc+ngyJvmndKAs9M/BFq2Ik8+quOnksPmYdgiJibqBnDF44JqZYllIEGg/svXWD6hmr0mnyuLG0Q3u44ulJhK8CersK0AVlL1gzH1UMkoIr8ozusSyW3tymVgZ2/A4FHqHuU4=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OS0PR01MB5539.jpnprd01.prod.outlook.com (2603:1096:604:a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Fri, 9 Jul
 2021 06:30:11 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::e949:47e2:9166:7cdc]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::e949:47e2:9166:7cdc%7]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 06:30:11 +0000
From: "wangmy" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gnome-desktop-testing: upgrade 2018.1 -> 2021.1
Thread-Topic: [OE-core] [PATCH] gnome-desktop-testing: upgrade 2018.1 ->
 2021.1
Thread-Index: AQHXc0cQYUt6V5CzC0m0AFXzLzbOjKs4cf4AgAG+eOA=
Date: Fri, 9 Jul 2021 06:30:11 +0000
Message-ID: 
 <OSBPR01MB1845A73BC124CB75DF38D976DC189@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1625672669-3918-1-git-send-email-wangmy@fujitsu.com>
 <CAMKF1sqnh0w_psbrNdfTNHq-zkyEzP197mXeY89mX8rvJ5oipg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqnh0w_psbrNdfTNHq-zkyEzP197mXeY89mX8rvJ5oipg@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82a8e6aa-a7ad-44bf-ce08-08d942a30102
x-ms-traffictypediagnostic: OS0PR01MB5539:
x-microsoft-antispam-prvs: 
 <OS0PR01MB5539E4487B2320F87A4876D9DC189@OS0PR01MB5539.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cgvev7wXSqAy0rVS0DGz0Mp9dh7ffh665MHzuj2g8Drno71ugUSljlMiplQAm8LuxMW0lNpH7xIyNc7vQHTn5SksofCfLgCkCxbjuea5CVmzJP6BXZ5KpSD62ufQ4W7KIctcihPDW3xXbnpDEj8HghBdz1L2lWdMVO0NKACMtiAGS8d1TgQuv7Gw00Qi5XGIQkaU48qZFoJAH2hVLi5/FpPXK0UhsW33/reOwWDAqWsehPzqnF+R+GQ8cGx2n+1w4Ihl57nWZMUosUqzA0mKrknnh4DSjqvjP1RUEhtRqd14miXBrr+0m14tFXHebim9c6NRKdpT4NRdPSuVGTM/U6GvhvZ5HBgex60Gq5vV2E6iWv9VnIpPgIs4wV+OypcDX//FlMhDHCBQHY2uhZKyv9zU3tHwLlUTjXBe86cE5gC+NUievxwmDt6qFYdnZPFsSq+FCaFYVcNmOlbjPC+vilDx9+0n0Zgfil5g+JCch/D9WiOXeQO61/bz56BloM3ildGlijOGrLkb3S15rc/KAzV6OiTy/5ozAqDjLmdMmLrPXVXytOzWX6z9MxPHPDbheMXcayDwHvfWAvB1WncJDzj/ZCQqQRdCUZOQB+kWom7QXE71vUG+M6Y8SHfegAkQ9eUWKi/gILSDLJu+b8IMVtLB/ZGymaH1E1Nu2hghkKvWuMe3FwZhXSLhCzQLnXXbNqw6sP03Y2iy9o5l4TRKbCEXz8Va9z3hlexzVpVGPWTztXJ0nMkW0HSIgxrOIe26
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(8936002)(8676002)(38100700002)(186003)(26005)(122000001)(66946007)(33656002)(53546011)(71200400001)(85182001)(2906002)(76116006)(7696005)(6506007)(55016002)(66556008)(9686003)(64756008)(316002)(83380400001)(66476007)(6916009)(86362001)(5660300002)(4326008)(66446008)(966005)(52536014)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V2RhSC91anY0eThGd0Z6WkN2QXpTeDRZWHNlZ2tDNkEvZ25jdVB6STFzOFMr?=
 =?utf-8?B?NVI2ZWdnS1Fvc2xrUWtNM0ZVcytJaXpVVmE1WjFlZnNaRDV0WWJlclBPdWVU?=
 =?utf-8?B?c2w0a0tjMmNqclIzSkUyM0NpYWdjTHpmYTlyV25acyt5ZndoaUtMVVJsZm9E?=
 =?utf-8?B?a2NNa3VXWWJqeDIrN1BVMjJPb2NFTFlidnFURjBZQ1Z4dWFEV25ZM21BUm4z?=
 =?utf-8?B?elpYNHlaNzVTMFdZUHAwMzhjaUllWm1RMkdkbW9oZlhFNDFhQ2hKSjZneldJ?=
 =?utf-8?B?NzhnWGFmT3NNT0Y5cmh3eXVlSWh6cFRRT0VXUXVFcFB3c24zZWxFeUFtSXc0?=
 =?utf-8?B?bnBUcktoc2piMlZycjZ5ekRaWTBWQ2dhYStGOEdsUGkzSVU4UWRMTElGRFY1?=
 =?utf-8?B?WGtrT2I4S20rRitIZnp6M2kxdHJaL2FQOEJpRTJJUVlNNW1sQU9VYTFwOEVX?=
 =?utf-8?B?ZDdBZG50bmRxNXQ5d3Y4eVVOTTUwekppbTNwZy9DbDdlMlFLOWdEV1RUb2Za?=
 =?utf-8?B?TEdMblNpbkc3dkNqMlpqdmJiYkZPTVBTSERnWEl5Q1ZrMHBybDloV3E1UFN5?=
 =?utf-8?B?UU9TZTJMMXE5OEpHYlAwOHJJSStocnRTSkZUS1Y2OER3eVJ3ZlFUYUlQQStN?=
 =?utf-8?B?ei9kcldQZGZqRml4ZnBNQTVUOENjcnZKY1p4RTRsOTAxVXJsYUYwRmhhRVFp?=
 =?utf-8?B?TWo3M0U5eFJWY1lCcTNSOEZkTitiMjhRc1gyWjRaNWJldnljSUNRWVJhMUlv?=
 =?utf-8?B?Y2o3UmgyazZzNkx0RjZ3YjhOR1g1bHdmZTBwY1ZSei9wSUQvZTE3ZkNXUXFH?=
 =?utf-8?B?UC9SdFZiQjNibUUwN3V6QXp4aVZLTklJSUE2aDlqaUF0TWdMTm9XTEZEb05r?=
 =?utf-8?B?dUpibVllQjlFMmdnbytheGpxY2RaQ25iV2p0TUZDY2ppN2NWVlNqYTBVMDly?=
 =?utf-8?B?WTFiWlBwdlZielhzcmlhUDZVSjVuZmNMY1pWMmNiZjFrUWxFQjltMWdwd3Jj?=
 =?utf-8?B?dWF4dHBqTE9BK3hJOVRjUTYxclV2bGx2KzNLYjJKb3dIcE5acVFDSFdFTWJw?=
 =?utf-8?B?YXQrSGRZcE1yVDIvMFlQelZ4bkMrQ21mcmNnNDlqV1J6TjF0KzBGY0FUMmVR?=
 =?utf-8?B?WCtDdTRDV0pOMDhKYm9BTUNzVC9PbUhoY0RML0pMeEVZbE4xQU9PT09mc2g5?=
 =?utf-8?B?TDdDV1MySUxCbnhLTUFvb1Y4RE5XNHBTbSs2MU9Pa081RFAyQVEzemlHVnFL?=
 =?utf-8?B?Q3BWNGJUc1JHYkxVYlhYUWk2MkxGUThLUDgya1FpUllHUytmeFpYRDc3RmV5?=
 =?utf-8?B?YWdwT2pHb0w2elQ3UFZicG5RK2g0T1hwK0drSTZ3TG1vS0E1T2ZXeSt6TmZ1?=
 =?utf-8?B?YUpxZ0swVVphdUt1RDd6d1lWSzhQaVRTVmdFak9jOG0vY1Q0NWp0dnpicmkz?=
 =?utf-8?B?R0JaOXN0YmFVbm12SGVDQmdwZStmTjliZmVINEo1SlFiMG5yYXF0SVlYUDdD?=
 =?utf-8?B?UlAza1dmTUUxekNnZTg4QlJCSmhQaTdCdmJhL1lJMUgyMkpneTkvVW5sdXo2?=
 =?utf-8?B?bS8waFFMT292QkFUck9YRmFFcDJVcmY4QWFBTmYzNE1hZEExeCsxbGU5UHda?=
 =?utf-8?B?UVdCYm90YWJBSGJOSU0zRXQ5STBITmg4eUdFcjE5am13aERDWU8vRUgrT1k1?=
 =?utf-8?B?RXpKTmFqZXVDWnY0a1FmYkszN1gySzhFanBRYVV0enI2SFM3N05FZUVuaGxr?=
 =?utf-8?Q?9w88WcsYgQjOjIFGlw=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a8e6aa-a7ad-44bf-ce08-08d942a30102
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2021 06:30:11.3029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bFC9shKYS9ycsZra/3+MqeirlSuBJNlwLZLs5wZCDf1OLf7n8twiOt9DRYFu4pMBO4DZ4RFKpWubQFnkxHBfGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5539
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSB1c2VkIHRoZSBkZWZhdWx0IGNvbmZpZ3VyYXRpb24gb2YgbWlwcywgYW5kIHRoZSBjb21waWxl
ciB3YXMgbWlwcy1wb2t5LWxpbnV4LWdjYywgd2hpY2ggZGlkIG5vdCByZXByb2R1Y2UgdGhpcyBw
cm9ibGVtLiANCg0KVGhlIGNvbXBpbGVyIGluIHRoZSBsb2cgeW91IHNlbnQgbWUgaXMgbWlwcy15
b2UtbGludXgtY2xhbmcuIA0KDQpDb3VsZCB5b3UgdGVsbCBtZSBob3cgSSBjYW4gdXNlIHRoaXMg
Y29tcGlsZXIuDQoNCsKgIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkRldmVsb3BtZW50IERl
cHQuSQ0KTmFuamluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNU
KSBOby4gNiBXZW56aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVMOiArODYrMjUt
ODY2MzA1NjYtODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJ
TDogd2FuZ215QGZ1aml0c3UuY29tDQpodHRwOi8vd3d3LmZ1aml0c3UuY29tL2NuL2Zuc3QvDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEp1bHkgOCwgMjAyMSAxMTo1MCBBTQ0KPiBU
bzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gQ2M6IFBh
dGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQo+IDxvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQQVRDSF0gZ25vbWUtZGVza3RvcC10ZXN0aW5nOiB1cGdyYWRlIDIwMTguMSAtPg0KPiAy
MDIxLjENCj4gDQo+IGZhaWxzIHRvIGJ1aWxkIG9uIG1pcHMgaHR0cHM6Ly9lcnJvcnMueW9jdG9w
cm9qZWN0Lm9yZy9FcnJvcnMvRGV0YWlscy81ODc0NzYvDQo+IA0KPiBPbiBXZWQsIEp1bCA3LCAy
MDIxIGF0IDg6NDUgQU0gd2FuZ215IDx3YW5nbXlAZnVqaXRzdS5jb20+IHdyb3RlOg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPiAt
LS0NCj4gPiAgLi4uZXNrdG9wLXRlc3RpbmdfMjAxOC4xLmJiID0+IGdub21lLWRlc2t0b3AtdGVz
dGluZ18yMDIxLjEuYmJ9IHwgMg0KPiA+ICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKSAgcmVuYW1lDQo+ID4gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z25vbWUtZGVza3RvcC10ZXN0aW5nL3tnbm9tZS1kZXNrdG9wLXRlc3RpbmdfMjAxOA0KPiA+IC4x
LmJiID0+IGdub21lLWRlc2t0b3AtdGVzdGluZ18yMDIxLjEuYmJ9ICg5NCUpDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0DQo+ID4gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbm9tZS1kZXNrdG9wLXRlc3Rp
bmcvZ25vbWUtZGVza3RvcC10ZXN0aW5nXzIwMQ0KPiA+IDguMS5iYg0KPiA+IGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ25vbWUtZGVza3RvcC10ZXN0aW5nL2dub21lLWRlc2t0b3AtdGVzdGluZ18y
MDINCj4gPiAxLjEuYmINCj4gPiBzaW1pbGFyaXR5IGluZGV4IDk0JQ0KPiA+IHJlbmFtZSBmcm9t
DQo+ID4gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ25vbWUtZGVza3RvcC10ZXN0aW5nL2dub21lLWRl
c2t0b3AtdGVzdGluZ18yMDE4Lg0KPiA+IDEuYmIgcmVuYW1lIHRvDQo+ID4gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZ25vbWUtZGVza3RvcC10ZXN0aW5nL2dub21lLWRlc2t0b3AtdGVzdGluZ18yMDIx
Lg0KPiA+IDEuYmINCj4gPiBpbmRleCBlNWM2OWMwYzQ2Li5iODJlYjhhZjJlIDEwMDY0NA0KPiA+
IC0tLQ0KPiA+IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ25vbWUtZGVza3RvcC10ZXN0aW5nL2du
b21lLWRlc2t0b3AtdGVzdGluZ18yMDENCj4gPiA4LjEuYmINCj4gPiArKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbm9tZS1kZXNrdG9wLXRlc3RpbmcvZ25vbWUtZGVza3RvcC10ZXN0aW5nDQo+
ID4gKysrIF8yMDIxLjEuYmINCj4gPiBAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0NCj4gImZpbGU6Ly9DT1BZSU5HO21kNT0zYmY1MDAwMmFlZmQwMDJmNDllN2JiODU0MDYzZjdl
NyBcDQo+ID4NCj4gZmlsZTovL3NyYy9nbm9tZS1kZXNrdG9wLXRlc3RpbmctcnVubmVyLmM7YmVn
aW5saW5lPTE7ZW5kbGluZT0yMDttZDU9N2VmM2FkOQ0KPiBkYTJmZmNmNzcwN2RjMTExNTFmZTAw
N2Y0Ig0KPiA+DQo+ID4gIFNSQ19VUkkgPQ0KPiAiZ2l0Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9N
RS9nbm9tZS1kZXNrdG9wLXRlc3RpbmcuZ2l0O3Byb3RvY29sPWh0dHAiDQo+ID4gLVNSQ1JFViA9
ICI0ZGVjYWRlNjdiMjlhZDE3MGZjZjNkZTE0OGU0MTY5NWZjNDU5ZjQ4Ig0KPiA+ICtTUkNSRVYg
PSAiZTM0NmNkNGVkMmUyMTAyYzliMTk1YjYxNGYzYzY0MmQyM2Y1ZjZlNyINCj4gPg0KPiA+ICBE
RVBFTkRTID0gImdsaWItMi4wIg0KPiA+DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0KPiA+DQo+
ID4gDQo+ID4NCg==
