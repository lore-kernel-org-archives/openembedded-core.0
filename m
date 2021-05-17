Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.53])
 by mx.groups.io with SMTP id smtpd.web10.16518.1621244399744862890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 02:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=P/GjA+TP;
 spf=pass (domain: windriver.com, ip: 40.107.243.53, mailfrom: qiang.zhang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkT2YMvaIlimtMq63EwVQqub9WFcCCbTSIT155VpVxv99iE+0Eg5bJkJGCTyBSkc9X8G/i/9YuECTRiAeuT60Cw08Z/jJhc7We9R8AURZkNajWoM2CCawXkI8oF09CaxK+NwQwmsIuLZS33Vlyhi0Bx+SUwyd4elbp+0zzfO7JI6OvfCIGVc78zAa+PnvEMPTTJAJ9vFSX69tEUqvewrjgIIvjqITqPAjIGNQwz5yQdhOueVWYFRvWfEcXnL8M41VsIiCtOdP9dTcKk/O4KLf5QlzRwZ8TyiCZY3+9rAW/+eDxf6H0sJukhV7MgJey8Te9Dq8KJKm7vpRUD5QZNG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0ubqMejuY7scxtnVGav3J2gYeMZ/cSr3zop4WLgLXE=;
 b=LXKf5quuaQ28rG/g2hEtcAqVsahA1rbT9CPsfz/fupc+ERDhva/E6oV9t3dGlvHdJ20QBx5Kta7NbaheddrbTxKuDaZOk5Bqet9Itt0dNvNJF9dw2ujaE3Dfd+fY1mlG/j7KS7HBqH1N0lyOqGMO7adSDLj93je7moKOyElCiX/pOzNgqUC0wtqNEejy77q7n2uxvcyJnYyLFdye0FI+m/4ZEV+Mh/EKZKhteDcwHOM0IxCD6C+//kVrZbA6qX/a5hmpGaZmI0UXPQLXd/KIXR83zR0fBfsxL0vw0HnbmBdpMEckLtTeHbH+5gqXELhjHVis8VGQpnJzT3YlqYMNtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0ubqMejuY7scxtnVGav3J2gYeMZ/cSr3zop4WLgLXE=;
 b=P/GjA+TPDWwoP81/dcn5UaWD0LVSvOaUrAlNwZGduXa18h0KTex2HNMbrLryOhfyBXpaTgEg8VOxTK/fS9EleU4RRZ+NrYdMnvgeUL9CSRR5Zo0gjffvqOdkF4IYYdoQZwXlstPzdIuQqBJOzw3Y5hePDppD6z4gvXlOXNnv5sU=
Received: from DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 09:39:57 +0000
Received: from DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274]) by DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274%5]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 09:39:57 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Chen, Qi"
	<Qi.Chen@windriver.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?5Zue5aSNOiBbT0UtY29yZV1bUEFUQ0hdIHJ0LXRlc3RzOiB1cGRhdGUgU1JDUkVW?=
Thread-Topic: [OE-core][PATCH] rt-tests: update SRCREV
Thread-Index: AQHXSvuUGiZ8ppXNDEOA38TS7i89zarnY46AgAAGeBI=
Date: Mon, 17 May 2021 09:39:57 +0000
Message-ID: 
 <DM6PR11MB42025B458D1B95DBF2F88BE6FF2D9@DM6PR11MB4202.namprd11.prod.outlook.com>
References: 
 <20210517090323.9968-1-Qi.Chen@windriver.com>,<CANNYZj8zWA-aADeZenSLa=Y8UVPMyHyQ+GvLWtMCE4TT30h7Tw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8zWA-aADeZenSLa=Y8UVPMyHyQ+GvLWtMCE4TT30h7Tw@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37275bd3-3135-4160-9057-08d91917bb92
x-ms-traffictypediagnostic: DM6PR11MB4721:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <DM6PR11MB472114F8FEFEDD1B22DA5705FF2D9@DM6PR11MB4721.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ySH657OWbGQUPX0RRNBLpjLJX2cwsGILBLoteKrMKjUKhbeBAl9ZpIl6YSVZDIRvlJXDpmrjgdTIygg976KSHVMSVDzOoFUOpV0R6VQ1oazEb3nPdyUWdlxgR3YhGGndwzjXklFUlpdaM5kLcp22n96WzDH/gE5kfTMFuoWSVhtvyZx1GzjLuxYWye1e0bXf1uxpAbbBlGxrYO5Fl5t8lMlAQG3EggBh23eeDx4L4xXS8n4FpJCuOiy+NDM4h7Qd9J1zsQwq9FOgPOpe+fBwxKD5fMnJw4HnxS18d1pxkH61IVp4migE6r3NIZImXJEEwsFUBk88YnFiqXpMhhd+GLnk0eU5pCFE1YeJi95bF6WXN0Im18S1KHHFv44ZSrvHYmvQMsjYeD/VamZXyVp13Xn5idvPehiyslWCcbznEWPXkuVRjjwTYyjkIGJpOn3C9IwWVwywsf96jiq1NlGZxf+/C8eq/Rtz/9cwIVXRYJrordlFD2n43x1TfN9eKmkY//sV7BsUkF3s0/XwYZMcRQkrBqB/cEqPYDbl1fOowMF1/O4+XiDkHmQZKGdBx324gCV0X/SzgVP5nu6Z3y2iXY3cawV5C9rfWYdbGbhXGhJsPYJNgLeJjCZbaF7cI/gzQg8ik7YD0VJ7Sv7Wp54kqsqzUTTgbuAil7E7uKzbK8zILgU9RC4Z3G3I29o72sGammgIWyequH3iR1BXwOA3zJywrtF11B5qD+e5TQAJmltj3lsCpgIW2aCVeldz8miO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4202.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39830400003)(136003)(346002)(366004)(86362001)(52536014)(2906002)(66446008)(55016002)(7696005)(64756008)(66946007)(33656002)(186003)(5660300002)(6636002)(38100700002)(9686003)(122000001)(110136005)(316002)(66476007)(76116006)(91956017)(15650500001)(71200400001)(26005)(83380400001)(4326008)(966005)(478600001)(224303003)(8936002)(6506007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?gb2312?B?NWwwbkF6WFhTRmNheG9DWWQ1TFJSa08wckpTTHNwNW0vKzRjZFZhQ2daeFVw?=
 =?gb2312?B?L3JHWW12TXBqMVBMNjhFSERHeDhwUlJGc3hiWDllT1RjWHQ5azZXcDFqYjhC?=
 =?gb2312?B?dnZ4QjBHZGhLRStzWWQ1Z1RmNCtTZU85SjRzdkZ4cmZCcmhRc3RCQUVjVVUr?=
 =?gb2312?B?RXUxbnJYK2tWN05XbTN6ZkRPeXdHQUtvNmt5NXJZNzN4bHBRSUw4aUpmaGM1?=
 =?gb2312?B?MVpTbWhLUitHOUZPblRJaUVyeXRIMjR4RHBwTEsvYU8vU2E5SE1waTlCZW16?=
 =?gb2312?B?YnlzWEdrSmRtSWRvS0JiSkVkTUkwRzcvdmsvK0JnTm40eHI5K0lJaEFsa0V4?=
 =?gb2312?B?eVMzU3pCODJYQzRURTlSdTU0cVBFSUNJZ05WQzQ5STJEZGRkUmdhc1h3TE1Y?=
 =?gb2312?B?eXdqRGErQmhHN1J1YlI1ek8vNEdpWmI5TW1mcVJFRWpuUk9DZTQrZzNKSnJD?=
 =?gb2312?B?dTBkdFNCd09sQ1N4dVJFYW02KzVWQTNQSXZIMzd2NllvalFyMkNaNTAyZ1JO?=
 =?gb2312?B?d2xLbzFDQiswcGp6b2VpaFJJUkxkczRjUlFLa1d5SXRHNUJmWXlaRUJVL0Iz?=
 =?gb2312?B?eThzV29ZRy9yVk9icEVFQ2luTUI4VDROOHEzMmhzbmlQTTk0QVpKbi82T1RJ?=
 =?gb2312?B?TitYcFlsYUlrL0FRb1Y0bFN3akNJYkNXb2NkSlhwUzhKQk5YOEc4Ukl2MEo0?=
 =?gb2312?B?Zm9acWt5NXBORlo0eVpRUUF0MVB6WW1HWHZ2MGtFbHB5VVBtSFFQcDAzMFR2?=
 =?gb2312?B?RVk1eWpaSjdIZWF6MEZKcEQxdVV1TEFWR2NtTTI0QXJxRkt1ZW1VKzF2VUZM?=
 =?gb2312?B?Y3N1Z3ZhczNRaVRnelJtWWl3c1NEdmt0TUFUVS9NZ21iY0VKMGxhcE9FUk9q?=
 =?gb2312?B?bENrQ3dQN0IrZ3NmNTZwVGptbnZhSU1CKzR6dmw4NjBiaU5iQ0FTbWFINjdx?=
 =?gb2312?B?dS9pWnAwUmVpRmV0MlVJdWdxRmFVQVlTQVFCOGlCMzBFMWlDdHFTeDRENEdO?=
 =?gb2312?B?eEpyRFd4ck1kY2NUSi81WHYwcVNpNEtkYXFUT1dPZkhvSXNNWU0rc2pjWWlE?=
 =?gb2312?B?eGczOWdGOEN5d01XZmUzeVNpd1liYkZrbnhWcStjM000L0lYMnpaR1pMOTdi?=
 =?gb2312?B?aWFqVlNIVkJ2a0JDMldIS1E1WnRvQ0F4ditlZjZ3allQMXVQcCtUQ0hYNGZS?=
 =?gb2312?B?VkdxazFqSXkzUmorMVN0SEs3ZDc3RHZ2elFyWkFiT3FQR1lIa053QUxVNnBF?=
 =?gb2312?B?SjFLK3VtSmxQejZZZjF2WnJiUFhVQk16QkVkNXVtVC9vejVOSHJGaHhkazBM?=
 =?gb2312?B?V1VUQXlBNTZ1U0tTNzVTY0NVWXR0dFZnSzRpZUtMb282VlBoRWF0ZWdYTEd5?=
 =?gb2312?B?ZkgvcUlzMkMyd0FxOFV5ckpaR3F4N1FKY3NNTDFlZk5uWi9wS3QybEkvWTVv?=
 =?gb2312?B?cGp4VUhqdWFJU3NVczBMT2tlRCtaVWJKYXRvc3hMc0R2OGw4UkJsSjcxRlVF?=
 =?gb2312?B?TVNvOGYrTU1zVlpINXE5WmN0UHR3R3MwMFA4ZE1JY2tzanNGazlrdG1FVjho?=
 =?gb2312?B?TzY2aGtjY0dLeWhVUERYYmhibVBJYXRNTmVvQXpEQkFQeWUrVC9nWVlvNXI4?=
 =?gb2312?B?MWhIRGpJdklGR09RcE9KMXpkdDIzajJXSVhFYjFJYi9xa21Sd1hkNFpnc0h0?=
 =?gb2312?B?M0xPZXhMYnNyOWE1Y2FaTkdhVmZ1TFA1aE9DbHo3U3hjd21rRkhsK3VSOXRV?=
 =?gb2312?Q?szKCsyEP/HpmBEIdZw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4202.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37275bd3-3135-4160-9057-08d91917bb92
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 09:39:57.0863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DyAylWZnvVh14KLTldiHGCtFw4LoeXmEIP5xGz7Hy+3go1CTVn8I1ll9UhR5BCgUKHzZrckMEFQGJXvZchVw1RRhpy8/ExW2zVSvaHfN7og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCreivP7Iyzogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gtPqx7SBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4Kt6LLzcqxvOQ6IDIwMjHE6jXUwjE3yNUgMTc6MTIKytW8/sjLOiBDaGVuLCBR
aQqzrcvNOiBPRS1jb3JlCtb3zOI6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHJ0LXRlc3RzOiB1cGRh
dGUgU1JDUkVWCgpbUGxlYXNlIG5vdGU6IFRoaXMgZS1tYWlsIGlzIGZyb20gYW4gRVhURVJOQUwg
ZS1tYWlsIGFkZHJlc3NdCj5NYXliZSBpdCdzIGJldHRlciB0byB1cGRhdGUgdG8gdGhlIHRhZ2dl
ZCAxLjEwIGNvbW1pdD8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3V0aWxzL3J0LXRl
c3RzL3J0LXRlc3RzLmdpdC9jb21taXQvP2g9dW5zdGFibGUvZGV2ZWwvbGF0ZXN0JmlkPTMyODE5
NTgxY2MwNTA5YzlkNThjMzNjMzA2MWY1N2FiZTBjNDBjODgKPgo+QWxleAoKSGVsbG8gQWxleAoK
VGhlIHRhZ2dlZCBWMS4xMCBkb24ndCBmaXggdGhpcyBwcm9ibGVtLCB0aGlzIHByb2JsZW0gaXMg
Zml4ZWQgKDNhZWM1ODAgcnQtdGVzdHM6IERvbid0IGFzc3VtZSBudW1hIGlzIGF2YWlsYWJsZSBh
dCBydW50aW1lKSAuICBpdCBub3QgaW4gdGFnZ2VkIHYxLjEwLgoKVGhhbmtzClFpYW5nCgo+Cj5P
biBNb24sIDE3IE1heSAyMDIxIGF0IDExOjAzLCBDaGVuIFFpID48UWkuQ2hlbkB3aW5kcml2ZXIu
Y29tPG1haWx0bzpRaS5DaGVuQHdpbmRyaXZlci5jb20+PiB3cm90ZToKPlRoZSBjb21taXQgJzZh
Zjg4MDY3ZGExNmM2ZTY5MjQzYjM3NmMzYjY0NTRlYzY5NDQ2MGInIGlzIG5vdCBhdmFpbGFibGUK
PmluIHRoZSByZXBvIGFueSBtb3JlLiBJIHRoaW5rIGl0J3MgZHVlIHRvIHNvbWUgbWlzLW9wZXJh
dGlvbiBvZiB0aGUgdXBzdHJlYW0KPnJlcG8gaW4gdGhlIHBhc3QgZmV3IGhvdXJzLgo+Cj5VcGRh
dGUgdGhlIFNSQ1JFViB0byB1c2UgdGhlIGxhdGVzdCBjb21taXQgb24gdW5zdGFibGUvZGV2ZWwv
bGF0ZXN0ID5icmFuY2guCj4KPlNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPjxRaS5DaGVuQHdpbmRy
aXZlci5jb208bWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbT4+Cj4tLS0KPiBtZXRhL3JlY2lw
ZXMtcnQvcnQtdGVzdHMvcnQtdGVzdHMuaW5jIHwgMiArLQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj5kaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXJ0
L3J0LXRlc3RzL3J0LXRlc3RzLmluYyBiL21ldGEvcmVjaXBlcy1ydC9ydC10ZXN0cy9ydC10ZXN0
cy5pbmMKPmluZGV4IDBjODliYWQ5MWYuLjE2MDBmNTgxM2IgMTAwNjQ0Cj4tLS0gYS9tZXRhL3Jl
Y2lwZXMtcnQvcnQtdGVzdHMvcnQtdGVzdHMuaW5jCj4rKysgYi9tZXRhL3JlY2lwZXMtcnQvcnQt
dGVzdHMvcnQtdGVzdHMuaW5jCj5AQCAtMSw1ICsxLDUgQEAKID4jIFZlcnNpb24gMS44Cj4tU1JD
UkVWID0gIjZhZjg4MDY3ZGExNmM2ZTY5MjQzYjM3NmMzYjY0NTRlYzY5NDQ2MGIiCj4rU1JDUkVW
ID0gImM5MDUxYTM2ZDkzNDUwM2I0NjczY2E1NjE1ZjYzMWJhZTM2ZGVhZDAiCj4gUEUgPSAiMSIK
Pgo+IFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS91dGlscy9ydC10ZXN0
cy9ydC10ZXN0cy5naXQ7YnJhbmNoPXVuc3RhYmxlL2RldmVsL2xhdGVzdDxodHRwOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS91dGlscy9ydC10ZXN0cy9ydC10ZXN0cy5naXQ7YnJhbmNoPXVuc3Rh
YmxlL2RldmVsL2xhdGVzdD4iCj4tLQo+Mi4zMC4yCgoKCgo=
