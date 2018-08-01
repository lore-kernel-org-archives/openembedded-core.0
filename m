Return-Path: <pabisr@cisco.com>
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
	by mail.openembedded.org (Postfix) with ESMTP id C048A60797
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 20:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2288; q=dns/txt; s=iport;
	t=1533155722; x=1534365322;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=gurNg1f6kMHHPz3nXpIgWngJNpcWBmZgCFW1HlI9kOQ=;
	b=MDKDJ4PrV422racXSCavBom+hn0/pIrKCokkOPc+B6+ZkWFU82KKx5jn
	1wRTUgNAhCq+jvfeP5TndVB/HpypMD04+vj1J7UIJWYUDO9g3kYzMFsPu
	Ki7f49G4kP1fu/ELUM03OhPADb7Kfivbw5GT7gn+80+JI800Fd7L4Tj4N s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DmAwAxGGJb/51dJa1bGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNOY38oCoN0li+DYYUIjw4LGAOEUQIXgywhNxUBAgEBAgE?=
	=?us-ascii?q?BAm0cDIU3AgQBIhFFEAIBCA4MAiYCAgIfBwoVEAIEAQ0FgyABgWcDFa9eEYE?=
	=?us-ascii?q?hgS6HGw2DMoELhj2BQBeCAIE5DBOCTIJWgj+CajGCJAKZcysJAoYXhTRigw2?=
	=?us-ascii?q?BSEWDWYgriyyGbwIRFIEkMyKBUnAVZQGCPgmCRIolg2FvjxKBGwEB?=
X-IronPort-AV: E=Sophos;i="5.51,433,1526342400"; d="scan'208";a="432226556"
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
	by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Aug 2018 20:35:20 +0000
Received: from XCH-ALN-005.cisco.com (xch-aln-005.cisco.com [173.36.7.15])
	by rcdn-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id w71KZLcg015058
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 1 Aug 2018 20:35:21 GMT
Received: from xch-rcd-001.cisco.com (173.37.102.11) by XCH-ALN-005.cisco.com
	(173.36.7.15) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
	Wed, 1 Aug 2018 15:35:20 -0500
Received: from xch-rcd-001.cisco.com ([173.37.102.11]) by
	XCH-RCD-001.cisco.com ([173.37.102.11]) with mapi id 15.00.1320.000;
	Wed, 1 Aug 2018 15:35:20 -0500
From: "Ryan Pabis (pabisr)" <pabisr@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Greg Olin (grolin)"
	<grolin@cisco.com>
Thread-Topic: [OE-core] Why does Openssl 1.0.2n use libcrypto.so.1.0.2 and not
	libcrypto.so.1.0.0?
Thread-Index: AQHUKcRepg5gj4E+e0SrPrA4l6U+vaSroSGA///KbQA=
Date: Wed, 1 Aug 2018 20:35:20 +0000
Message-ID: <14E22879-604B-4920-9244-FA4D6855F7DC@cisco.com>
References: <884A0584-E44B-4810-8F02-194B625F24D7@cisco.com>
	<CANNYZj-u80B3WxCbWpr4MbrWZU5jxWMM1xCTY7PJPBznB4-uLw@mail.gmail.com>
In-Reply-To: <CANNYZj-u80B3WxCbWpr4MbrWZU5jxWMM1xCTY7PJPBznB4-uLw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.e.1.180613
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.116.192.245]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.36.7.15, xch-aln-005.cisco.com
X-Outbound-Node: rcdn-core-6.cisco.com
Cc: "Doug Livezey \(livezed\)" <livezed@cisco.com>,
	"Ken Nicholas \(nicholk\)" <nicholk@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Why does Openssl 1.0.2n use libcrypto.so.1.0.2 and not libcrypto.so.1.0.0?
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
X-List-Received-Date: Wed, 01 Aug 2018 20:35:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C668A67FB27F4144AD0A7AD84E7C246E@emea.cisco.com>
Content-Transfer-Encoding: base64

QWxleCwNCg0KVGhlIGxpYnJhcnkgd2FzIHByZWNvbXBpbGVkIGJ5IHRhaWwtZiBidXQgSSd2ZSBh
bHNvIHJlY29tcGlsZWQgb24gVWJ1bnR1IDE2LjA0IHdpdGggb3BlbnNzbCAxLjAuMm4uICBJbiBi
b3RoIGNhc2VzIHRoZSBsaWJyYXJ5IGNyeXB0by5zbyBhbmQgbGliY29uZmQuc28gcmVmZXIgdG8g
bGliY3J5cHRvLnNvLjEuMC4wLg0KDQpIYXZpbmcgYSBwcmUtY29tcGlsZWQgbGlicmFyeSB3b3Jr
ZWQgb24ga3JvZ290aCBhbmQgbW9ydHksIGJ1dCBkb2VzIG5vdCBzZWVtIHRvIHdvcmsgb24gcm9j
a28uDQoNClJ5YW4NCg0K77u/T24gOC8xLzE4LCAzOjQ3IFBNLCAiQWxleGFuZGVyIEthbmF2aW4i
IDxhbGV4LmthbmF2aW5AZ21haWwuY29tPiB3cm90ZToNCg0KICAgIDIwMTgtMDgtMDEgMjA6MjAg
R01UKzAyOjAwIFJ5YW4gUGFiaXMgKHBhYmlzcikgdmlhIE9wZW5lbWJlZGRlZC1jb3JlDQogICAg
PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+Og0KICAgID4gSSBoYXZl
IGEgbGlicmFyeSB0aGF0IHVzZXMgbGliY3J5cHRvLnNvLjEuMC4wIGZyb20gb3BlbnNzbCAxLjAu
Mm4sIHdoaWNoIGlzDQogICAgPiB0aGUgbGliY3J5cHRvLnNvIHZlcnNpb24gaWYgeW91IGRvd25s
b2FkIHRoZSBzb3VyY2UgY29kZSB0byB1YnVudHUgMTYuMDQNCiAgICA+IGZyb20gb3BlbnNzbCBh
bmQgY29tcGlsZS4gIEhvd2V2ZXIsIFlvY3RvIFJvY2tvIHVzZXMgdGhlIHNhbWUgb3BlbnNzbCAx
LjAuMm4NCiAgICA+IHZlcnNpb24gYnV0IGl0IHVzZXMgbGliY3J5cHRvLnNvLjEuMC4yIGFuZCBz
ZXRzIHRoZSBGSUxFUkRFUEVORFNfIHRvIHRoZQ0KICAgID4gc2FtZS4gIFRoaXMgY2F1c2VzIGEg
ZmlsZV9yZGVwcyBpc3N1ZSBmb3IgbWUgYmVjYXVzZSBpdCBzYXlzDQogICAgPiBsaWJjcnlwdG8u
c28uMS4wLjAoKSg2NGJpdCkgaXMgbm90IHByb3ZpZGVkLg0KICAgID4NCiAgICA+DQogICAgPg0K
ICAgID4gSeKAmXZlIHRyaWVkIGFkZGluZywgREVQRU5EUyArPSDigJxvcGVuc3Ns4oCdIGFuZCBS
UERFUEVORFNfY29uZmQgKz0g4oCcb3BlbnNzbOKAnSwNCiAgICA+IHdpdGggbm8gbHVjay4gIFRo
ZSBvbmx5IHdheSBJIGNhbiBnZXQgaXQgdG8gY29tcGlsZSBpcyBpZiBJIG1hbnVhbGx5IGhhY2sg
bXkNCiAgICA+IGxpYnJhcnkgYW5kIGNoYW5nZSBmcm9tIGxpYmNyeXB0by5zby4xLjAuMCB0byBs
aWJjcnlwdG8uc28uMS4wLjIgKGV2ZW4NCiAgICA+IHRob3VnaCBpdCB3YXMgcmVhbGx5IGNvbXBp
bGVkIHdpdGggbGliY3J5cHRvLnNvLjEuMC4wIGFuZCB0aGF04oCZcyB0aGUNCiAgICA+IGxpYmNy
eXB0byB2ZXJzaW9uIG9mIG9wZW5zc2wgMS4wLjJuKS4NCiAgICA+DQogICAgPg0KICAgID4NCiAg
ICA+IENhbiBzb21lb25lIHBsZWFzZSBhZHZpc2U/DQogICAgDQogICAgSW4gd2hpY2ggZW52aXJv
bm1lbnQgd2FzIHRoZSBsaWJyYXJ5IGJ1aWx0PyBZb3UgZ2VuZXJhbGx5IGNhbm5vdCB0YWtlDQog
ICAgc29tZXRoaW5nIHRoYXQgd2FzIGNvbXBpbGVkIG91dHNpZGUgb2YgWW9jdG8uIFdyaXRlIGEg
cmVjaXBlIHRoYXQNCiAgICBidWlsZHMgdGhlIGxpYnJhcnkgZnJvbSBzb3VyY2UgY29kZSwgb3Ig
YXNrIHRoZSBwcm92aWRlciBvZiB0aGF0DQogICAgbGlicmFyeSB0byBkbyB0aGF0Lg0KICAgIA0K
ICAgIEFsZXgNCiAgICANCg0K

