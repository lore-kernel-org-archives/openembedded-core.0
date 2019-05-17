Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 74E117D080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 02:09:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2019 19:09:19 -0700
X-ExtLoop1: 1
Received: from pgsmsx113.gar.corp.intel.com ([10.108.55.202])
	by fmsmga001.fm.intel.com with ESMTP; 16 May 2019 19:09:17 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.94]) by
	pgsmsx113.gar.corp.intel.com ([169.254.6.39]) with mapi id
	14.03.0415.000; Fri, 17 May 2019 10:09:17 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2 v2] oeqa/runtime/cases/rpm.py: Enable rpm
	install dependency testing
Thread-Index: AQHVDB2rsVxNvvwcFU6dKuy6P774HqZuklBQ
Date: Fri, 17 May 2019 02:09:16 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D043481D33E1@PGSMSX109.gar.corp.intel.com>
References: <1557969749-80524-1-git-send-email-ee.peng.yeoh@intel.com>
	<6e9630df6d8d4bd8f436526f440cf5f2f107bb31.camel@linuxfoundation.org>
In-Reply-To: <6e9630df6d8d4bd8f436526f440cf5f2f107bb31.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODkwYmYxYzYtMGMwZC00YjViLWJkOGItOTY1MzI1YzQzYTAwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQ2dkc1dHbEZucFFlMkhpREI5SzdTZ2tyMzkrNld0WXRwcjFRb2N2cHVQc2FWYkMzSWFwYUo2c3BQcXFzbjN2ayJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2 v2] oeqa/runtime/cases/rpm.py: Enable rpm install dependency testing
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
X-List-Received-Date: Fri, 17 May 2019 02:09:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KSSB2ZXJpZmllZCB0aGF0IHRoaXMgdGVzdCB3YXMgZmFpbGluZyBpbiBt
dWx0aWxpYiBiZWNhdXNlIHRoZSB0YXJnZXQgcGFja2FnZSB0byBiZSB1c2VkIGZvciB0ZXN0aW5n
IHdhcyBub3QgYXZhaWxhYmxlLiANCg0KSSBoYWQgYWRkZWQgc2tpcFRlc3QgbG9naWMgaW4gY2Fz
ZSB0aGUgdGFyZ2V0IHBhY2thZ2UgbmVlZGVkIHdhcyBub3QgYXZhaWxhYmxlLiBTZW50IHRoZSB1
cGRhdGVkIHBhdGNoZXMuIFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgaW5wdXRzLiANCg0K
VGhhbmtzLA0KWWVvaCBFZSBQZW5nIA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnXSANClNlbnQ6IEZyaWRheSwgTWF5IDE3LCAyMDE5IDM6MjkgQU0NClRvOiBZZW9oLCBFZSBQ
ZW5nIDxlZS5wZW5nLnllb2hAaW50ZWwuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS8yIHYyXSBvZXFh
L3J1bnRpbWUvY2FzZXMvcnBtLnB5OiBFbmFibGUgcnBtIGluc3RhbGwgZGVwZW5kZW5jeSB0ZXN0
aW5nDQoNCk9uIFRodSwgMjAxOS0wNS0xNiBhdCAwOToyMiArMDgwMCwgWWVvaCBFZSBQZW5nIHdy
b3RlOg0KPiBDb252ZXJ0IG1hbnVhbCB0ZXN0Y2FzZSBic3BzLWh3LmJzcHMtaHcucnBtXy0gDQo+
IF9faW5zdGFsbF9kZXBlbmRlbmN5X3BhY2thZ2UgZnJvbSBvZXFhL21hbnVhbC9ic3AtaHcuanNv
biB0byBydW50aW1lIA0KPiBhdXRvbWF0ZWQgdGVzdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFll
b2ggRWUgUGVuZyA8ZWUucGVuZy55ZW9oQGludGVsLmNvbT4NCj4gLS0tDQo+ICBtZXRhL2xpYi9v
ZXFhL3J1bnRpbWUvY2FzZXMvcnBtLnB5IHwgMzANCj4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQ0KDQpNdWNoIGJldHRl
ciwgb25seSBvbmUgZmFpbHVyZSB0aGlzIHRpbWUgaW4gbXVsdGlsaWI6DQoNCmh0dHBzOi8vYXV0
b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvNDQvYnVpbGRzLzYx
Mg0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg0K

