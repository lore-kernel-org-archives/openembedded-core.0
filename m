Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id CE2E37CAE8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 01:19:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2019 17:19:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,393,1544515200"; d="scan'208";a="148549660"
Received: from pgsmsx105.gar.corp.intel.com ([10.221.44.96])
	by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2019 17:19:05 -0800
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.167]) by
	PGSMSX105.gar.corp.intel.com ([169.254.4.205]) with mapi id
	14.03.0415.000; Thu, 21 Feb 2019 09:19:03 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2 v7] test-case-mgmt
Thread-Index: AQHUxttIuwYb6D1IKEyU0QOXDjzg8qXjv9EAgABRY4CABCopgIAAe7eAgAC/zKA=
Date: Thu, 21 Feb 2019 01:19:02 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04348187584@PGSMSX109.gar.corp.intel.com>
References: <1550123438-37723-1-git-send-email-ee.peng.yeoh@intel.com>
	<f26f1ce6b9b79817950b93f9aa0e38d32671e78f.camel@linuxfoundation.org>
	<8f788c03bb214b6b23dacec18b9efbc32d6bf81c.camel@linuxfoundation.org>
	<8f156c0c1b0cc7fe18bd25a03a8f5f0cdc4f422d.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D04348186FF8@PGSMSX109.gar.corp.intel.com>
	<1df4a2505898ca691f430d96f4391f18133d357e.camel@linuxfoundation.org>
In-Reply-To: <1df4a2505898ca691f430d96f4391f18133d357e.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjYyZjgyOGYtYTAwOS00MWZlLWFiZDEtZTQ0NGZmYTIyNzM0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR040cWJwUmRQNThPQUNuQ3JwbFNFSkdrNzBtSjlJSWNsem1jVldDXC9hemlNajdobTRXVHpRaytZMkthdlcwSTEifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH 0/2 v7] test-case-mgmt
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
X-List-Received-Date: Thu, 21 Feb 2019 01:19:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUlAsDQoNCk5vdGVkLCB0aGFuayB5b3Ugb25jZSBhZ2FpbiBmb3IgeW91ciBoZWxwIGFuZCBp
bnB1dHMhIFJlYWxseSBnbGFkIHRvIGhlYXIgdGhhdCByZXN1bHR0b29sIHdhcyByZWFkeSEgDQpX
ZSBzaGFsbCBwbGFuIGZvcndhcmQgZm9yIGZ1dHVyZSBpbXByb3ZlbWVudCBpbiBodG1sIHJlcG9y
dHMgYW5kIGdyYXBocy4gQWxzbyB3ZSBzaGFsbCBsb29rIGludG8gZnV0dXJlIHRlc3QgY2FzZSBk
ZXZlbG9wbWVudCBpZiBuZWVkZWQuDQoNCkNoZWVycywNClllb2ggRWUgUGVuZyANCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIFttYWlsdG86cmljaGFy
ZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZ10gDQpTZW50OiBUaHVyc2RheSwgRmVicnVhcnkg
MjEsIDIwMTkgNTo0NCBBTQ0KVG86IFllb2gsIEVlIFBlbmcgPGVlLnBlbmcueWVvaEBpbnRlbC5j
b20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpDYzogQnVydG9u
LCBSb3NzIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+OyBFZ2dsZXRvbiwgUGF1bCA8cGF1bC5lZ2ds
ZXRvbkBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAwLzIgdjddIHRl
c3QtY2FzZS1tZ210DQoNCkhpIEVlIFBlbmcsDQoNCk9uIFdlZCwgMjAxOS0wMi0yMCBhdCAwNjoy
NyArMDAwMCwgWWVvaCwgRWUgUGVuZyB3cm90ZToNCj4gVGhhbmsgeW91IHZlcnkgbXVjaCBmb3Ig
YWxsIHlvdXIgaGVscCBhbmQgaW5wdXRzISANCj4gV291bGQgeW91IGxpa2UgdXMgdG8gdGFrZSBh
bGwgdGhlIGltcHJvdmVtZW50cyBmcm9tIHlvdXIgYnJhbmNoIHRvIA0KPiBtZXJnZSBvciBzcXVh
c2ggd2l0aCB0aGUgYmFzZSBwYXRjaHNldCBhbmQgbW92ZSBmb3J3YXJkIHdpdGggdGhlIG9uZSAN
Cj4gcmVtYWluaW5nIGltcHJvdmVtZW50IGJlbG93Pw0KDQpJJ3ZlIGRvbmUgc29tZSBmdXJ0aGVy
IHdvcmsgb24gdGhpcyB0b2RheSBhbmQgdGhlIGdvb2QgbmV3cyBpcyBJIHdhcyBhYmxlIHRvIHNv
cnQgb3V0IHRoZSBnaXQgcmVwbyBoYW5kbGluZyBwaWVjZXMgYW5kIGZpeCB0aGUgdGVzdCBjYXNl
cy4NCldpdGggdHdvIG9mIHRoZSB0ZXN0IGNhc2VzIEkgZW5kZWQgdXAgcmVtb3ZpbmcgdGhlbSBh
cyBJJ3ZlIGNoYW5nZWQgdGhlIGZ1bmN0aW9uYWxpdHkgZW5vdWdoIHRoYXQgdGhleSdkIG5lZWQg
dG8gYmUgcmV3cml0dGVuLg0KDQpJJ3ZlIHNlbnQgb3V0IGEgcGF0Y2ggb24gdG9wIG9mIHlvdXIg
b3JpZ2luYWwgd29yayBhcyB3ZWxsIGFzIGEgc2Vjb25kIHBhdGNoIHRvIG1vdmUgc29tZSBmdW5j
dGlvbmFsaXR5IGludG8gbGlicmFyeSBmdW5jdGlvbnMgdG8gYWxsb3cgdXMgdG8gdXNlIGl0IGZy
b20gdGhlIG5ldyBjb2RlLiBJIHRoaW5rIHRoaXMgY29tYmluYXRpb24gb2YgcGF0Y2hlcyBzaG91
bGQgbm93IGJlIHJlYWR5IHRvIG1lcmdlLg0KDQpUaGVyZSB3aWxsIGJlIGZpeGVzIGFuZCBpbXBy
b3ZlbWVudHMgb24gdG9wIG9mIHRoaXMsIGUuZy4gSSdkIGxvdmUgdG8gZ2V0IHNvbWUgaHRtbCBy
ZXBvcnRzIGFuZCBncmFwaHMgYnV0IHRob3NlIGFyZSB0aGluZ3MgdGhhdCBjb21lIGxhdGVyLg0K
DQpUaGUgbmV4dCBzdGVwIG9uY2UgdGhpcyBpcyBtZXJnZWQgaXMgdG8gc3RhcnQgc3RvcmluZyBh
dXRvYnVpbGRlciB0ZXN0IHJlc3VsdCBkYXRhLCBnZW5lcmF0aW5nIHJlcG9ydHMgYW5kIHJlZ3Jl
c3Npb24gcmVwb3J0cyBhdXRvbWF0aWNhbGx5IGZyb20gZWFjaCB0ZXN0IHJ1bi4NCg0KSXRzIGdy
ZWF0IHRvIHNlZSB0aGlzIGFsbCBjb21pbmcgdG9nZXRoZXIhDQoNCkNoZWVycywNCg0KUmljaGFy
ZA0KDQo=

