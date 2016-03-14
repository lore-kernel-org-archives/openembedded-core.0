Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AAA0F6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 08:18:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2016 01:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,334,1455004800"; d="scan'208";a="763633779"
Received: from pgsmsx101.gar.corp.intel.com ([10.221.44.78])
	by orsmga003.jf.intel.com with ESMTP; 14 Mar 2016 01:18:55 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.21]) by
	PGSMSX101.gar.corp.intel.com ([169.254.1.115]) with mapi id
	14.03.0248.002; Mon, 14 Mar 2016 16:18:55 +0800
From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [master][PATCH] rpm: enable xz/lzma compression
Thread-Index: AQHRfcmFb+jMt2xLSUGL4HRqjQ1tBJ9Yl5lQ
Date: Mon, 14 Mar 2016 08:18:54 +0000
Message-ID: <50B33AC5ED75F74F991980326F1C438D191CB5C4@PGSMSX103.gar.corp.intel.com>
References: <1457939741-29071-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1457943238.2804.294.camel@linuxfoundation.org>
In-Reply-To: <1457943238.2804.294.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [master][PATCH] rpm: enable xz/lzma compression
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
X-List-Received-Date: Mon, 14 Mar 2016 08:18:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2UgYXJlIGhhdmluZyBpc3N1ZXMgb24gZGVjb21wcmVzc2luZyB0YXJiYWxsIHdpdGggeHogZm9y
bWF0IGFuZCBycG0gaW5zdGFsbGF0aW9uIG9uIHRhcmdldC4NCldlIGhhdmUgdGhpcyBzb2x1dGlv
biBpbXBsZW1lbnRlZCB0byByZXNvbHZlIGl0IGludGVybmFsbHkgYW5kIHdvdWxkIGxpa2UgdG8g
ZW5hYmxlIGl0IGluIE9FLWNvcmUgaW4gb3JkZXIgd2Ugd291bGRuJ3QgcmV2aXNpdCB0aGlzIGlz
c3VlIGluIGZ1dHVyZS4NCkRvIEkgbmVlZCB0byByZXNlbmQgdGhlIHBhdGNoIHdpdGggcmV2aXNl
ZCBjb21taXQgbWVzc2FnZT8NCg0KUmVnYXJkcywNClJlYmVjY2ENCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIFttYWlsdG86cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZ10gDQpTZW50OiBNb25kYXksIE1hcmNoIDE0LCAyMDE2IDQ6MTQg
UE0NClRvOiBDaGFuZywgUmViZWNjYSBTd2VlIEZ1biA8cmViZWNjYS5zd2VlLmZ1bi5jaGFuZ0Bp
bnRlbC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFttYXN0ZXJdW1BBVENIXSBycG06IGVuYWJsZSB4ei9sem1hIGNv
bXByZXNzaW9uDQoNCk9uIE1vbiwgMjAxNi0wMy0xNCBhdCAxNToxNSArMDgwMCwgUmViZWNjYSBD
aGFuZyB3cm90ZToNCj4gRnJvbTogQW51aiBNaXR0YWwgPGFudWp4Lm1pdHRhbEBpbnRlbC5jb20+
DQo+IA0KPiBFbmFibGUgbHptYSBjb21wcmVzc2lvbiBzdXBwb3J0IGluIHJwbS4NCg0KWW91ciBj
b21taXQgbWVzc2FnZSBzYXlzIHdoYXQgdGhlIHBhdGNoIGRvZXMgYnV0IG5vdCB3aHk/IFByZXN1
bWFibHkgdGhpcyBjaGFuZ2UgaW5jcmVhc2VzIHRoZSBzaXplIG9mIHRoZSBycG0gaW5zdGFsbCBz
byB3aGF0IGlzIHRoZSBiZW5lZml0Pw0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg==

