Return-Path: <william.c.randle@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9B85D6067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 16:40:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 23 Mar 2016 09:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,383,1455004800"; d="scan'208";a="674500088"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Mar 2016 09:40:08 -0700
Received: from orsmsx160.amr.corp.intel.com (10.22.226.43) by
	ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Wed, 23 Mar 2016 09:40:07 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.68]) by
	ORSMSX160.amr.corp.intel.com ([169.254.13.48]) with mapi id
	14.03.0248.002; Wed, 23 Mar 2016 09:40:06 -0700
From: "Randle, William C" <william.c.randle@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] insane.bbclass: tighten lib_re and exec_re
	patterns to avoid false positive
Thread-Index: AQHRhRxTM8ODTxW/+UeMoyRHDMMi3Z9nq66AgAAEwoA=
Date: Wed, 23 Mar 2016 16:40:05 +0000
Message-ID: <1458751207.2442.11.camel@intel.com>
References: <1458748461-4643-1-git-send-email-william.c.randle@intel.com>
	<CAJTo0LYjV1OROv5oO3_Wi8638pnnhOh3SgEp31yJ8GRk2XfsfQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYjV1OROv5oO3_Wi8638pnnhOh3SgEp31yJ8GRk2XfsfQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.0.118]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: tighten lib_re and exec_re patterns to avoid false positive
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
X-List-Received-Date: Wed, 23 Mar 2016 16:40:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A6A3C265C765949AC150E054CB14F6A@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE2LTAzLTIzIGF0IDE2OjIzICswMDAwLCBCdXJ0b24sIFJvc3Mgd3JvdGU6DQoN
Ck9uIDIzIE1hcmNoIDIwMTYgYXQgMTU6NTQsIEJpbGwgUmFuZGxlIDx3aWxsaWFtLmMucmFuZGxl
QGludGVsLmNvbTxtYWlsdG86d2lsbGlhbS5jLnJhbmRsZUBpbnRlbC5jb20+PiB3cm90ZToNCisg
ICAgbGliX3JlID0gcmUuY29tcGlsZSgiXi9saWIuK1wuc28oXC5cZCspezAsM30kIikNCisgICAg
ZXhlY19yZSA9IHJlLmNvbXBpbGUoIl4lcy4qL2xpYi4rXC5zbyhcLlxkKyl7MCwzfSQiICUgZXhl
Y19wcmVmaXgpDQoNCg0KSSB3b3JyeSB0aGF0IHRoaXMgZ29lcyB0b28gZmFyIGluIHRoZSBvdGhl
ciB3YXksIG15IERlYmlhbiBob3N0IGhhcyBhIGxpYnJhcnkgY2FsbGVkIC91c3IvbGliL2xpYmJs
YXMuc28uM2dmLg0KDQpNYXliZSB3ZSBzaG91bGQgYWRkIGEgImlzIHRoaXMgYW4gRUxGIiB0ZXN0
IGludG8gdGhlIGxpYmRpciBjaGVjayBpbnN0ZWFkPyAgVGhhdCBtaWdodCBraWxsIHBlcmZvcm1h
bmNlIHRob3VnaCwgYW5kIHRoaXMgaXMganVzdCBhIHNhbml0eSBjaGVjay4NCg0KQW55IG90aGVy
IHRob3VnaHRzPw0KDQpSb3NzDQoNCk9rLCBJIGZvdW5kIGEgbGlicmFyeSBvbiBteSBGQzIzIHN5
c3RlbSBuYW1lZCAibGliZG1yYWlkLnNvLjEuMC4wLnJjMTYiIGluIC91c3IvbGliNjQuIFRoZSBh
dmFpbGFibGUgZG9jdW1lbnRhdGlvbiBvbiBzb25hbWVzIEkgZm91bmQgc3RhdGVzOg0KDQoNCiJF
dmVyeSBzaGFyZWQgbGlicmFyeSBoYXMgYSBzcGVjaWFsIG5hbWUgY2FsbGVkIHRoZSBgYHNvbmFt
ZScnLiBUaGUgc29uYW1lIGhhcyB0aGUgcHJlZml4IGBgbGliJycsIHRoZSBuYW1lIG9mIHRoZSBs
aWJyYXJ5LCB0aGUgcGhyYXNlIGBgLnNvJycsIGZvbGxvd2VkIGJ5IGEgcGVyaW9kIGFuZCBhIHZl
cnNpb24gbnVtYmVyIHRoYXQgaXMgaW5jcmVtZW50ZWQgd2hlbmV2ZXIgdGhlIGludGVyZmFjZSBj
aGFuZ2VzIChhcyBhIHNwZWNpYWwgZXhjZXB0aW9uLCB0aGUgbG93ZXN0LWxldmVsIEMgbGlicmFy
aWVzIGRvbid0IHN0YXJ0IHdpdGggYGBsaWInJykuIEEgZnVsbHktcXVhbGlmaWVkIHNvbmFtZSBp
bmNsdWRlcyBhcyBhIHByZWZpeCB0aGUgZGlyZWN0b3J5IGl0J3MgaW47IG9uIGEgd29ya2luZyBz
eXN0ZW0gYSBmdWxseS1xdWFsaWZpZWQgc29uYW1lIGlzIHNpbXBseSBhIHN5bWJvbGljIGxpbmsg
dG8gdGhlIHNoYXJlZCBsaWJyYXJ5J3MgYGByZWFsIG5hbWUnJy4NCg0KDQoiRXZlcnkgc2hhcmVk
IGxpYnJhcnkgYWxzbyBoYXMgYSBgYHJlYWwgbmFtZScnLCB3aGljaCBpcyB0aGUgZmlsZW5hbWUg
Y29udGFpbmluZyB0aGUgYWN0dWFsIGxpYnJhcnkgY29kZS4gVGhlIHJlYWwgbmFtZSBhZGRzIHRv
IHRoZSBzb25hbWUgYSBwZXJpb2QsIGEgbWlub3IgbnVtYmVyLCBhbm90aGVyIHBlcmlvZCwgYW5k
IHRoZSByZWxlYXNlIG51bWJlci4gVGhlIGxhc3QgcGVyaW9kIGFuZCByZWxlYXNlIG51bWJlciBh
cmUgb3B0aW9uYWwuIFRoZSBtaW5vciBudW1iZXIgYW5kIHJlbGVhc2UgbnVtYmVyIHN1cHBvcnQg
Y29uZmlndXJhdGlvbiBjb250cm9sIGJ5IGxldHRpbmcgeW91IGtub3cgZXhhY3RseSB3aGF0IHZl
cnNpb24ocykgb2YgdGhlIGxpYnJhcnkgYXJlIGluc3RhbGxlZC4gTm90ZSB0aGF0IHRoZXNlIG51
bWJlcnMgbWlnaHQgbm90IGJlIHRoZSBzYW1lIGFzIHRoZSBudW1iZXJzIHVzZWQgdG8gZGVzY3Jp
YmUgdGhlIGxpYnJhcnkgaW4gZG9jdW1lbnRhdGlvbiwgYWx0aG91Z2ggdGhhdCBkb2VzIG1ha2Ug
dGhpbmdzIGVhc2llci4iDQoNCg0KVGhhdCBpbXBsaWVzIHRoZXJlIHNob3VsZCBvbmx5IGJlIHVw
dG8gdGhyZWUgbnVtYmVycyBhZnRlciB0aGUgLnNvLCB0byB0aGUgIi5yYzE2IiBvbiB0aGUgZW5k
IHZpb2xhdGVzIHRoYXQgcnVsZSwgYW5kIHRoZSBpbXBsaWNhdGlvbiBpcyB0aGVzZSBzaG91bGQg
YmUgdmVyc2lvbiAqbnVtYmVycyosIG5vdCB2ZXJzaW9uIHN0cmluZ3MsIHdoaWNoIHdvdWxkIG1l
YW4geW91ciBsaWJyYXJ5IGVuZGluZyBpbiAuM2dmIHZpb2xhdGVzIHRoYXQgcnVsZS4NCg0KDQpJ
IGd1ZXNzIHNvbWUgcnVsZXMgYXJlIGp1c3QgbWVhbnQgdG8gYmUgYnJva2VuLiBTaWdoLg0KDQoN
CiAgICAtQmlsbA0KDQo=

