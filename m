Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 276437D1D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 06:33:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2019 23:33:56 -0700
X-ExtLoop1: 1
Received: from kmsmsx151.gar.corp.intel.com ([172.21.73.86])
	by orsmga008.jf.intel.com with ESMTP; 15 May 2019 23:33:53 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.94]) by
	KMSMSX151.gar.corp.intel.com ([169.254.10.117]) with mapi id
	14.03.0415.000; Thu, 16 May 2019 14:33:50 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/2] oeqa/runtime/cases/rpm.py: Enable rpm
	install dependency testing
Thread-Index: AQHVC1Zyu3zaLkIH1UaygvNKjC6t8KZsFvOAgAE0m7A=
Date: Thu, 16 May 2019 06:33:50 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D043481D1DBD@PGSMSX109.gar.corp.intel.com>
References: <1557888470-57934-1-git-send-email-ee.peng.yeoh@intel.com>
	<CANNYZj_kU12GxGk8Mi2gOyPNuQVyRbe+9BzCpxvOYKdJ3UEKMQ@mail.gmail.com>
	<b578fb2cf8678888f069c7565d9a94c89c1adab0.camel@linuxfoundation.org>
In-Reply-To: <b578fb2cf8678888f069c7565d9a94c89c1adab0.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMTRmMjRjMzUtMDI3Zi00ZDE2LTk3M2ItODg0ZDM2YzEzNWVkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaVhKSGMwRjFJU3BDWnU0SHNVRVNRSUR0VmNuakVkWGlWRzB3a2JpOFlhOFVjNmVtQTVVenNPakY4VDlITDR1MSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] oeqa/runtime/cases/rpm.py: Enable rpm install dependency testing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2019 06:33:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCBhbmQgQWxleCwNCg0KVGhhbmtzIGZvciB0aGUgaW5wdXRzISANCkkgYWRkZWQg
dGhlIE9FVGVzdERlcGVuZHMgZGVjb3JhdG9yIHRvIHRoZSB0ZXN0IGNhc2UuDQoNCkJlc3QgcmVn
YXJkcywNClllb2ggRWUgUGVuZyANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcgW21haWx0bzpyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnXSANClNlbnQ6IFRodXJzZGF5LCBNYXkgMTYsIDIwMTkgNDow
OCBBTQ0KVG86IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPjsgWWVv
aCwgRWUgUGVuZyA8ZWUucGVuZy55ZW9oQGludGVsLmNvbT4NCkNjOiBPRS1jb3JlIDxvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KU3ViamVjdDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0ggMS8yXSBvZXFhL3J1bnRpbWUvY2FzZXMvcnBtLnB5OiBFbmFibGUgcnBtIGluc3Rh
bGwgZGVwZW5kZW5jeSB0ZXN0aW5nDQoNCk9uIFdlZCwgMjAxOS0wNS0xNSBhdCAyMTo0MyArMDIw
MCwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+IFRoaXMgbmVlZHMgdGhlIHNhbWUgY29uZGl0
aW9uIGd1YXJkIGFzIG90aGVyIHJwbSB0ZXN0cywgZS5nLg0KPiANCj4gQE9FVGVzdERlcGVuZHMo
WydycG0uUnBtQmFzaWNUZXN0LnRlc3RfcnBtX3F1ZXJ5J10pDQo+IA0KPiBzaG91bGQgYmUgZW5v
dWdoLg0KDQpZZXMsIHRoZXJlIHdlcmUgZmFpbHVyZXMgb24gdGhlIGF1dG9idWlsZGVyIGZyb20g
dGhpcywgZS5nLjoNCg0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhv
b24vIy9idWlsZGVycy80NS9idWlsZHMvNjAyDQoNCmh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9w
cm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvNTkvYnVpbGRzLzU5Ng0KDQphbmQgc28gb24u
DQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQo=

