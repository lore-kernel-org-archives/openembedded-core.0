Return-Path: <chee.yang.lee@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 372D379C7C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Aug 2019 14:17:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2019 07:17:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,373,1559545200"; d="scan'208";a="178106830"
Received: from pgsmsx108.gar.corp.intel.com ([10.221.44.103])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2019 07:17:37 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.4]) by
	PGSMSX108.gar.corp.intel.com ([169.254.8.190]) with mapi id
	14.03.0439.000; Sun, 11 Aug 2019 22:17:36 +0800
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] systemd-boot:grub-efi:wic: add variable
	APPENDS for multiple boot configuration
Thread-Index: AQHVSUlnan4s2UPNu0OTbKzknFRylabsQFkAgANG5gCABoU4AA==
Date: Sun, 11 Aug 2019 14:17:34 +0000
Message-ID: <F0A8E5F2-0690-4979-A417-387761F24D26@intel.com>
References: <1564749183-3162-1-git-send-email-chee.yang.lee@intel.com>
	<e46e1d0f5ff44a4fe3ddbbfd301c72061962cdb7.camel@linuxfoundation.org>
	<D88A5CDD-118A-48EE-99D0-EF6CC362A1ED@intel.com>
	<a08b3fb5e679868a896d3d3035bb30838973f711.camel@linuxfoundation.org>
In-Reply-To: <a08b3fb5e679868a896d3d3035bb30838973f711.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-originating-ip: [10.255.128.161]
MIME-Version: 1.0
Subject: Re: [PATCH v2] systemd-boot:grub-efi:wic: add variable APPENDS for multiple boot configuration
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
X-List-Received-Date: Sun, 11 Aug 2019 14:17:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EA5883F9211D4468927942B7DC4B16C@intel.com>
Content-Transfer-Encoding: base64

VGhpcyB2YXJpYWJsZSB3b3VsZCBvbmx5IGJlIHVzZSBieSBib290bG9hZGVyIHRvIGdlbmVyYXRl
IGJvb3QgY29uZmlnIGZpbGUgYW5kIHNpbmNlIGl0IGRlZmluZSB0aGUgZGlmZmVyZW5jZXMgaW4g
a2VybmVsIGNvbW1hbmQgbGluZSBmb3IgbXVsdGlwbGUgYm9vdCBjb25maWcuIA0KbWF5YmUgQk9P
VExPQURFUl9LRVJORUxfQ01ETElORVM/IE9yIE1VTFRJX0tFUk5FTF9DTURMSU5FPw0KDQoNCu+7
v09uIDgvOC8xOSwgMjo0MyBBTSwgInJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmci
IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCg0KICAgIEhpLA0K
ICAgIA0KICAgIE9uIE1vbiwgMjAxOS0wOC0wNSBhdCAwODo0MCArMDAwMCwgTGVlLCBDaGVlIFlh
bmcgd3JvdGU6DQogICAgPiB3b3VsZCBLRVJORUxfQ01EX0xJTkVTIGEgYmV0dGVyIHZhcmlhYmxl
IG5hbWUgZm9yIHRoaXMgY2FzZT8NCiAgICANCiAgICBJJ2QgbGlrZSB0byB1bmRlcnN0YW5kIHdo
aWNoIGNvZGUgaXMgdXNpbmcgdGhlIHZhcmlhYmxlIGFzIHRoYXQgbWlnaHQNCiAgICBoZWxwIG5h
bWUgaXQgY29ycmVjdGx5LiBJJ2QgaGF2ZSBzYWlkIGl0IHNob3VsZCBiZSBDTURMSU5FIHdpdGhv
dXQgdGhlDQogICAgc3BhY2UgYXMgdGhhdCBpcyBnZW5lcmFsbHkgaG93IHRoZSBrZXJuZWwgcmVm
ZXJzIHRvIGl0LiBJIHRoaW5rIHRoZQ0KICAgIHByZWZpeCBzaG91bGQgaW5kaWNhdGUgd2hpY2gg
Y29kZSBpcyBnb2luZyB0byBlbmQgdXAgdXNpbmcgaXQgc28gS0VSTkVMDQogICAgbWF5IGJlIHRv
byBnZW5lcmljLg0KICAgIA0KICAgIENoZWVycywNCiAgICANCiAgICBSaWNoYXJkDQogICAgDQog
ICAgDQoNCg==

