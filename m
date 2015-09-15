Return-Path: <erkka.kaaria@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 79E1F76E2E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 12:36:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Sep 2015 05:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,535,1437462000"; d="scan'208";a="805549398"
Received: from ekaaria-xps-8300.fi.intel.com ([10.237.68.35])
	by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2015 05:36:13 -0700
From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 15:34:19 +0300
Message-Id: <1442320459-25899-1-git-send-email-erkka.kaaria@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] Add python-misc as rdependency to python-modules
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
X-List-Received-Date: Tue, 15 Sep 2015 12:36:14 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q3VycmVudGx5IHB5dGhvbi1taXNjIGlzIG5vdCBpbmNsdWRlZCBldmVuIGlmIHB5dGhvbi1tb2R1
bGVzIGlzLiBUaGlzIG1lYW5zIHNvbWUgcHl0aG9uIHNjcmlwdHMgZmFpbCBldmVuIGlmIHB5dGhv
bi1tb2R1bGVzIGlzIGluY2x1ZGVkIGluIHRoZSBpbWFnZSAoZm9yIGV4YW1wbGUsIGdldC1waXAu
cHkgYXQgYm9vdHJhcC5weXBhLmlvL2dldC1waXAucHkpLiBUaGlzIHBhdGNoIGFkZHMgcHl0aG9u
LW1pc2MgYXMgcnVudGltZSBkZXBlbmRlbmN5IGZvciBweXRob24tbW9kdWxlcy4KClNpZ25lZC1v
ZmYtYnk6IEVya2thIEvDpMOkcmnDpCA8ZXJra2Eua2FhcmlhQGludGVsLmNvbT4KLS0tCiBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbl8yLjcuOS5iYiB8IDMgKystCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob25fMi43LjkuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbl8yLjcuOS5iYgppbmRleCBhZTQ1NTc3Li5mN2UyZjI3IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbl8yLjcuOS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbl8yLjcuOS5iYgpAQCAtMTYx
LDcgKzE2MSw4IEBAIEZJTEVTXyR7UE59LWRiZyArPSAiJHtsaWJkaXJ9L3B5dGhvbiR7UFlUSE9O
X01BSk1JTn0vbGliLWR5bmxvYWQvLmRlYnVnIgogIyBjYXRjaCBhbGwgdGhlIHJlc3QgKHVuc29y
dGVkKQogUEFDS0FHRVMgKz0gIiR7UE59LW1pc2MiCiBGSUxFU18ke1BOfS1taXNjID0gIiR7bGli
ZGlyfS9weXRob24ke1BZVEhPTl9NQUpNSU59IgotUkRFUEVORFNfJHtQTn0tcHRlc3QgPSAiJHtQ
Tn0tbW9kdWxlcyAke1BOfS1taXNjIgorUkRFUEVORFNfJHtQTn0tbW9kdWxlcyArPSAiJHtQTn0t
bWlzYyIKK1JERVBFTkRTXyR7UE59LXB0ZXN0ID0gIiR7UE59LW1vZHVsZXMiCiAjaW5oZXJpdCBw
dGVzdCBhZnRlciAicmVxdWlyZSBweXRob24tJHtQWVRIT05fTUFKTUlOfS1tYW5pZmVzdC5pbmMi
IHNvIFBBQ0tBR0VTIGRvZXNuJ3QgZ2V0IG92ZXJ3cml0dGVuCiBpbmhlcml0IHB0ZXN0CiAKLS0g
CjIuMS40CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwgRmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6
IFBMIDI4MSwgMDAxODEgSGVsc2lua2kgCkJ1c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYg
LSA0IApEb21pY2lsZWQgaW4gSGVsc2lua2kgCgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1l
bnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9m
IHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5
IG90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5k
ZWQKcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNv
cGllcy4K


