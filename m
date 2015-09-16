Return-Path: <erkka.kaaria@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 912A860053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 06:32:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 15 Sep 2015 23:32:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,537,1437462000"; d="scan'208";a="790397017"
Received: from ekaaria-xps-8300.fi.intel.com ([10.237.68.35])
	by fmsmga001.fm.intel.com with ESMTP; 15 Sep 2015 23:32:18 -0700
From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2015 09:31:49 +0300
Message-Id: <1442385109-28179-1-git-send-email-erkka.kaaria@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH v2] python_2.7.9.bb: Add python-misc as runtime dependency to python-modules
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
X-List-Received-Date: Wed, 16 Sep 2015 06:32:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q3VycmVudGx5IHB5dGhvbi1taXNjIGlzIG5vdCBpbmNsdWRlZCBldmVuIGlmIHB5dGhvbi1tb2R1
bGVzIGlzLiBUaGlzIG1lYW5zIHNvbWUgcHl0aG9uIHNjcmlwdHMgZmFpbCBldmVuIGlmIHB5dGhv
bi1tb2R1bGVzIGlzIGluY2x1ZGVkIGluIHRoZSBpbWFnZSAoZm9yIGV4YW1wbGUsIGdldC1waXAu
cHkgYXQgYm9vdHN0cmFwLnB5cGEuaW8vZ2V0LXBpcC5weSkuCgpTaWduZWQtb2ZmLWJ5OiBFcmtr
YSBLw6TDpHJpw6QgPGVya2thLmthYXJpYUBpbnRlbC5jb20+Ci0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob25fMi43LjkuYmIgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uXzIuNy45LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob25fMi43LjkuYmIKaW5kZXggYWU0NTU3Ny4uZjdlMmYyNyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob25fMi43LjkuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob25fMi43LjkuYmIKQEAgLTE2MSw3ICsxNjEsOCBA
QCBGSUxFU18ke1BOfS1kYmcgKz0gIiR7bGliZGlyfS9weXRob24ke1BZVEhPTl9NQUpNSU59L2xp
Yi1keW5sb2FkLy5kZWJ1ZyIKICMgY2F0Y2ggYWxsIHRoZSByZXN0ICh1bnNvcnRlZCkKIFBBQ0tB
R0VTICs9ICIke1BOfS1taXNjIgogRklMRVNfJHtQTn0tbWlzYyA9ICIke2xpYmRpcn0vcHl0aG9u
JHtQWVRIT05fTUFKTUlOfSIKLVJERVBFTkRTXyR7UE59LXB0ZXN0ID0gIiR7UE59LW1vZHVsZXMg
JHtQTn0tbWlzYyIKK1JERVBFTkRTXyR7UE59LW1vZHVsZXMgKz0gIiR7UE59LW1pc2MiCitSREVQ
RU5EU18ke1BOfS1wdGVzdCA9ICIke1BOfS1tb2R1bGVzIgogI2luaGVyaXQgcHRlc3QgYWZ0ZXIg
InJlcXVpcmUgcHl0aG9uLSR7UFlUSE9OX01BSk1JTn0tbWFuaWZlc3QuaW5jIiBzbyBQQUNLQUdF
UyBkb2Vzbid0IGdldCBvdmVyd3JpdHRlbgogaW5oZXJpdCBwdGVzdAogCi0tIAoyLjEuNAoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCkludGVsIEZpbmxhbmQgT3kKUmVnaXN0ZXJlZCBBZGRyZXNzOiBQTCAyODEsIDAw
MTgxIEhlbHNpbmtpIApCdXNpbmVzcyBJZGVudGl0eSBDb2RlOiAwMzU3NjA2IC0gNCAKRG9taWNp
bGVkIGluIEhlbHNpbmtpIAoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29u
dGFpbiBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5k
ZWQgcmVjaXBpZW50KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJlY2lwaWVu
dCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuCg==


