Return-Path: <erkka.kaaria@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9EA60053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 06:19:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 15 Sep 2015 23:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,537,1437462000"; d="scan'208";a="769998708"
Received: from ekaaria-xps-8300.fi.intel.com ([10.237.68.35])
	by orsmga001.jf.intel.com with ESMTP; 15 Sep 2015 23:19:42 -0700
From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2015 09:18:50 +0300
Message-Id: <1442384330-27947-1-git-send-email-erkka.kaaria@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH v2] python.inc: Remove --with-wctype-functions configure option
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
X-List-Received-Date: Wed, 16 Sep 2015 06:19:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBvcHRpb24gaXMgY2F1c2luZyBpc3N1ZXMgd2l0aCBweXRob24gdW5pY29kZSBzdXBwb3J0
LiBTZXZlcmFsIHVuaWNvZGUgcmVsYXRlZCByZWdyZXNzaW9uIHRlc3RzIGFyZSBjdXJyZW50bHkg
ZmFpbGluZyAodGVzdF9yZSBhbmQgdGVzdF9jb2RlY3MgZm9yIGV4YW1wbGUpIGFuZCByZW1vdmlu
ZyB0aGlzIG9wdGlvbiBmaXhlcyB0aGVzZS4KClRoaXMgY29uZmlndXJlIG9wdGlvbiBtb3N0bHkg
c2VlbXMgdG8gYmUgaGlzdG9yaWNhbC4gRGlzY3Vzc2lvbiByZWxhdGVkIHRvIHB5dGhvbiBpc3N1
ZSA5MjEwIChodHRwczovL2J1Z3MucHl0aG9uLm9yZy9pc3N1ZTkyMTApIGluZGljYXRlcyBpdHMg
b3JpZ2luYWwgZ29hbCB3YXMgdG8gc2F2ZSBtZW1vcnkgYW5kIHRoYXQgdGhlIG9wdGlvbiBzaG91
bGQgaGF2ZSBiZWVuIGRlcHJlY2F0ZWQgYWdlcyBhZ28uCgpTaWduZWQtb2ZmLWJ5OiBFcmtrYSBL
w6TDpHJpw6QgPGVya2thLmthYXJpYUBpbnRlbC5jb20+Ci0tLQogbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24uaW5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLmluYyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLmluYwppbmRleCBlMThhYjhlLi40
ZDQyOGYzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi5p
bmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24uaW5jCkBAIC0xNiw3
ICsxNiw2IEBAIFBZVEhPTl9NQUpNSU4gPSAiMi43IgogCiBpbmhlcml0IGF1dG90b29scwogCi1Q
WVRIT05MU0JPUFRTID0gIi0td2l0aC13Y3R5cGUtZnVuY3Rpb25zIgogUFlUSE9OTFNCT1BUU19s
aW51eHN0ZGJhc2UgPSAiYWNfY3Zfc2l6ZW9mX29mZl90PTgiCiAKIEVYVFJBX09FQ09ORiA9ICJc
Ci0tIAoyLjEuNAoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVsIEZpbmxhbmQgT3kKUmVnaXN0ZXJlZCBBZGRy
ZXNzOiBQTCAyODEsIDAwMTgxIEhlbHNpbmtpIApCdXNpbmVzcyBJZGVudGl0eSBDb2RlOiAwMzU3
NjA2IC0gNCAKRG9taWNpbGVkIGluIEhlbHNpbmtpIAoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRh
Y2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVz
ZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlv
bgpieSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGlu
dGVuZGVkCnJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFs
bCBjb3BpZXMuCg==


