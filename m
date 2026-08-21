Return-Path: <evekariy@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887FDC5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:26:36 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1153.1787336795269688189
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TJAcHxQ8;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: evekariy@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10440; q=dns/txt;
  s=iport01; t=1787336795; x=1788546395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0eMigvbBH76J3PrSnSGSEc6TjwVi+OJogThnvDmUHjQ=;
  b=TJAcHxQ8qdlD+9TwZwoOKPletzSpA09LjykPV4dpclxHfcnQ1zWTmozv
   IAZQHxyO6N645KKJg2jccTF0O4Vl9nEQz7tVZy1mZDZSBdfdbjDX65huh
   DfDeuF0gUcbzn2dncIOSt3bWWVsSV2/PJzXxhoyStIPXTX1KGjlfcPumd
   rkqP9SytG4ob/idcNHOCHATA9sNeaEScoxkHwA0RUzKTcAy3mqVexVc6x
   jM4lRYM1TKzwZEydFJcp6uljRgD/T20yl68e5O25YGVlK1+9QdKLBylAa
   Ya4eJmIsjZn+vQnfssUd2xCkaquPbSb1ovqS2kFNQPAOq2MhZBkhiVPdy
   A==;
X-CSE-ConnectionGUID: uREuyY/hQoO8SXyXvNOVqg==
X-CSE-MsgGUID: 6de64mPESgiBZlPjFfJj1A==
X-IPAS-Result: =?us-ascii?q?A0BeAgAil4hq/5EQJK1aHgEBCxIMggULgld0X0JJlkoDi?=
 =?us-ascii?q?2QQkieBfg8BAQEPRA0EAQGEP0YCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQMyAUYQHAMBAi8gCyMIGYMCAYI6AzcCA?=
 =?us-ascii?q?RHCA4IsgQGDaAJD2RsNcoFmAQsUAYE4hT8fgmCFI10YAYR8JxuBSUSBFYNpg?=
 =?us-ascii?q?QWBGkIBAYE3AYZtBIINgSGBWh6GEotESIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4ENGwYFgR2BKIQQIxk2eoEJXoErKWABEheBCYIHAoJaggUCAUlDD?=
 =?us-ascii?q?gdIFQsYDUgRLDcUGQQ+bgeOVB+CTXsTAQohIC82G4Ebk2OSBKAecYQojCKPP?=
 =?us-ascii?q?oV8GjOFW6URC5h9jgqECZJHhGmBaDyBRwsHTSMVgyIJShkPjiwBCwuDYIF/g?=
 =?us-ascii?q?2XGVSQ1CzIBAQcCBw4DC4FokAABJ4FWAQE?=
IronPort-Data: A9a23:V3xiDaoaTop9UlcVdqznMm+6TupeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnSaayCYjakft1zaI619x8AuZbTyII1TAo5qC9gF38S9ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8ko35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vtNLHxfx
 LsYETcqPiuzltKo5pWFU+Y506zPLOGzVG8eknhkyTecCbMtRorOBv2ao9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtKYH49tL/Aan3XfiNVq1uPpLsf6GnIxws327/oWDbQUozQHJwJwx/I9
 goq+UynDhxEaNmn5AGK81iegtfNsy3ZWts7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2YRLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWja1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:ty0J1q+IvINkhaL8V/Fuk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: 9a23:zhMfnG8MT96ZhSrym1OVv1MuN900Qzrd9XD3c3SIGFZ3bpqrUFDFrQ==
X-Talos-MUID: 9a23:KIEbWAoHrNKUymsuTnMez29uOZk05pyDM08Mu6cCg8uqOw5yYh7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,235,1779148800"; 
   d="scan'208";a="821145188"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Aug 2026 18:26:34 +0000
Received: from sjc-ads-4126.cisco.com (sjc-ads-4126.cisco.com [171.70.54.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 3C4E218000453;
	Fri, 21 Aug 2026 18:26:34 +0000 (GMT)
Received: by sjc-ads-4126.cisco.com (Postfix, from userid 1834987)
	id CF18BCC12A6; Fri, 21 Aug 2026 11:26:33 -0700 (PDT)
From: Emily Vekariya <evekariy@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: sankpare@cisco.com,
	ipasha@cisco.com,
	ranjirat@cisco.com,
	vchavda@cisco.com,
	Emily Vekariya <evekariy@cisco.com>
Subject: [OE-core][scarthgap][PATCH 2/2] python3-pyasn1: Fix CVE-2026-59884
Date: Fri, 21 Aug 2026 11:25:50 -0700
Message-Id: <20260821182550.23177-2-evekariy@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260821182550.23177-1-evekariy@cisco.com>
References: <20260821182550.23177-1-evekariy@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4126.cisco.com [171.70.54.147];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.147, sjc-ads-4126.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 18:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243951

The BER decoder shared by the CER and DER codecs parses long-form tags by
accumulating continuation octets without an upper bound on the tag ID size.
A crafted input can force construction of an arbitrarily large integer with
CPU cost growing quadratically, and can trigger unhandled ValueError
exceptions in the Python 3.11+ error formatting paths. Any application
decoding untrusted BER, CER, or DER input is affected.

scarthgap ships pyasn1 0.5.1, which is affected as the issue is present in
all versions before 0.6.4.

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/pyasn1/pyasn1/commit/628e36ecbb5277a3f01572ce418ef54271b165a5
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59884

Signed-off-by: Emily Vekariya <evekariy@cisco.com>
---
 .../recipes-devtools/python/python-pyasn1.inc |   1 +
 .../python3-pyasn1/CVE-2026-59884.patch       | 245 ++++++++++++++++++
 2 files changed, 246 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59884.patch

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 1780ee1d88..ae96f09fb1 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -20,6 +20,7 @@ SRC_URI += " \
        file://run-ptest \
        file://CVE-2026-23490.patch \
        file://CVE-2026-59886.patch \
+       file://CVE-2026-59884.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
diff --git a/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59884.patch b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59884.patch
new file mode 100644
index 0000000000..dd897e2d75
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59884.patch
@@ -0,0 +1,245 @@
+From 38e8ae286160eb27620e7cb42108b3b28d1f299f Mon Sep 17 00:00:00 2001
+From: Simon Pichugin <simon.pichugin@gmail.com>
+Date: Wed, 8 Jul 2026 17:36:30 -0700
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2026-59884
+Upstream-Status: Backport [https://github.com/pyasn1/pyasn1/commit/628e36ecbb5277a3f01572ce418ef54271b165a5]
+
+(cherry picked from commit 628e36ecbb5277a3f01572ce418ef54271b165a5)
+Signed-off-by: Emily Vekariya <evekariy@cisco.com>
+---
+ pyasn1/codec/ber/decoder.py     | 13 +++++++++++--
+ pyasn1/type/tag.py              | 20 ++++++++++++++++----
+ tests/codec/ber/test_decoder.py | 25 +++++++++++++++++++++++++
+ tests/codec/cer/test_decoder.py | 15 +++++++++++++++
+ tests/codec/der/test_decoder.py | 15 +++++++++++++++
+ tests/type/test_tag.py          | 20 ++++++++++++++++++++
+ 6 files changed, 102 insertions(+), 6 deletions(-)
+
+diff --git a/pyasn1/codec/ber/decoder.py b/pyasn1/codec/ber/decoder.py
+index be8ba65..18865c2 100644
+--- a/pyasn1/codec/ber/decoder.py
++++ b/pyasn1/codec/ber/decoder.py
+@@ -39,6 +39,10 @@ SubstrateUnderrunError = error.SubstrateUnderrunError
+ # 20 octets allows up to 140-bit integers, supporting UUID-based OIDs
+ MAX_OID_ARC_CONTINUATION_OCTETS = 20
+ 
++# Maximum number of octets in a long-form tag ID (20 octets = up to
++# 140-bit tag IDs, matching the OID arc limit)
++MAX_TAG_OCTETS = 20
++
+ 
+ class AbstractPayloadDecoder(object):
+     protoComponent = None
+@@ -1570,7 +1574,7 @@ class SingleItemDecoder(object):
+ 
+                     if tagId == 0x1F:
+                         isShortTag = False
+-                        lengthOctetIdx = 0
++                        tagOctetCount = 0
+                         tagId = 0
+ 
+                         while True:
+@@ -1584,7 +1588,12 @@ class SingleItemDecoder(object):
+                                 )
+ 
+                             integerTag = ord(integerByte)
+-                            lengthOctetIdx += 1
++                            tagOctetCount += 1
++                            if tagOctetCount > MAX_TAG_OCTETS:
++                                raise error.PyAsn1Error(
++                                    'Tag ID octet count exceeds limit (%d)' % (
++                                        MAX_TAG_OCTETS,)
++                                )
+                             tagId <<= 7
+                             tagId |= (integerTag & 0x7F)
+ 
+diff --git a/pyasn1/type/tag.py b/pyasn1/type/tag.py
+index a21a405..bbbdd85 100644
+--- a/pyasn1/type/tag.py
++++ b/pyasn1/type/tag.py
+@@ -34,6 +34,16 @@ tagCategoryExplicit = 0x02
+ tagCategoryUntagged = 0x04
+ 
+ 
++def _tagIdToStr(tagId):
++    # Decimal rendering of a huge tag ID can exceed the interpreter's
++    # integer-to-string conversion limit (sys.get_int_max_str_digits(),
++    # Python 3.11+) and raise ValueError; hexadecimal is not limited
++    try:
++        return str(tagId)
++    except ValueError:
++        return hex(tagId)
++
++
+ class Tag(object):
+     """Create ASN.1 tag
+ 
+@@ -56,7 +66,8 @@ class Tag(object):
+     """
+     def __init__(self, tagClass, tagFormat, tagId):
+         if tagId < 0:
+-            raise error.PyAsn1Error('Negative tag ID (%s) not allowed' % tagId)
++            raise error.PyAsn1Error(
++                'Negative tag ID (%s) not allowed' % _tagIdToStr(tagId))
+         self.__tagClass = tagClass
+         self.__tagFormat = tagFormat
+         self.__tagId = tagId
+@@ -65,7 +76,7 @@ class Tag(object):
+ 
+     def __repr__(self):
+         representation = '[%s:%s:%s]' % (
+-            self.__tagClass, self.__tagFormat, self.__tagId)
++            self.__tagClass, self.__tagFormat, _tagIdToStr(self.__tagId))
+         return '<%s object, tag %s>' % (
+             self.__class__.__name__, representation)
+ 
+@@ -194,8 +205,9 @@ class TagSet(object):
+         self.__hash = hash(self.__superTagsClassId)
+ 
+     def __repr__(self):
+-        representation = '-'.join(['%s:%s:%s' % (x.tagClass, x.tagFormat, x.tagId)
+-                                   for x in self.__superTags])
++        representation = '-'.join(
++            ['%s:%s:%s' % (x.tagClass, x.tagFormat, _tagIdToStr(x.tagId))
++             for x in self.__superTags])
+         if representation:
+             representation = 'tags ' + representation
+         else:
+diff --git a/tests/codec/ber/test_decoder.py b/tests/codec/ber/test_decoder.py
+index f6ff7b0..0152027 100644
+--- a/tests/codec/ber/test_decoder.py
++++ b/tests/codec/ber/test_decoder.py
+@@ -34,6 +34,31 @@ class LargeTagDecoderTestCase(BaseTestCase):
+     def testLongTag(self):
+         assert decoder.decode(ints2octs((0x1f, 2, 1, 0)))[0].tagSet == univ.Integer.tagSet
+ 
++    def testVeryLongTagRoundTrip(self):
++        # (1 << 140) - 1 is the largest tag ID fitting the 20 octet limit
++        for tagId in (1 << 77, (1 << 140) - 1):
++            largeTag = tag.Tag(tag.tagClassContext, tag.tagFormatSimple, tagId)
++            asn1Spec = univ.Integer().subtype(implicitTag=largeTag)
++            value = univ.Integer(1).subtype(implicitTag=largeTag)
++
++            decoded, rest = decoder.decode(encoder.encode(value), asn1Spec=asn1Spec)
++
++            assert rest == b''
++            assert decoded == 1
++
++    def testExcessiveLongTag(self):
++        # 1 << 140 is the smallest tag ID needing 21 octets, one over the limit
++        excessiveTag = tag.Tag(tag.tagClassContext, tag.tagFormatSimple, 1 << 140)
++        asn1Spec = univ.Integer().subtype(implicitTag=excessiveTag)
++        substrate = encoder.encode(univ.Integer(1).subtype(implicitTag=excessiveTag))
++
++        try:
++            decoder.decode(substrate, asn1Spec=asn1Spec)
++        except error.PyAsn1Error:
++            pass
++        else:
++            assert 0, 'excessive long tag tolerated'
++
+     def testTagsEquivalence(self):
+         integer = univ.Integer(2).subtype(implicitTag=tag.Tag(tag.tagClassContext, 0, 0))
+         assert decoder.decode(ints2octs((0x9f, 0x80, 0x00, 0x02, 0x01, 0x02)), asn1Spec=integer) == decoder.decode(
+diff --git a/tests/codec/cer/test_decoder.py b/tests/codec/cer/test_decoder.py
+index 3d27194..d759f76 100644
+--- a/tests/codec/cer/test_decoder.py
++++ b/tests/codec/cer/test_decoder.py
+@@ -67,6 +67,21 @@ class OctetStringDecoderTestCase(BaseTestCase):
+     # TODO: test failures on short chunked and long unchunked substrate samples
+ 
+ 
++class LargeTagDecoderTestCase(BaseTestCase):
++    def testExcessiveLongTag(self):
++        # 1 << 140 is the smallest tag ID needing 21 octets, one over the limit
++        excessiveTag = tag.Tag(tag.tagClassContext, tag.tagFormatSimple, 1 << 140)
++        asn1Spec = univ.Integer().subtype(implicitTag=excessiveTag)
++        substrate = encoder.encode(univ.Integer(1).subtype(implicitTag=excessiveTag))
++
++        try:
++            decoder.decode(substrate, asn1Spec=asn1Spec)
++        except PyAsn1Error:
++            pass
++        else:
++            assert 0, 'excessive long tag tolerated'
++
++
+ class RealDecoderTestCase(BaseTestCase):
+     def testLargeBinaryRoundTrip(self):
+         substrate = encoder.encode(univ.Real((-1, 2, 76354972)))
+diff --git a/tests/codec/der/test_decoder.py b/tests/codec/der/test_decoder.py
+index 553563c..726c999 100644
+--- a/tests/codec/der/test_decoder.py
++++ b/tests/codec/der/test_decoder.py
+@@ -73,6 +73,21 @@ class OctetStringDecoderTestCase(BaseTestCase):
+             assert 0, 'chunked encoding tolerated'
+ 
+ 
++class LargeTagDecoderTestCase(BaseTestCase):
++    def testExcessiveLongTag(self):
++        # 1 << 140 is the smallest tag ID needing 21 octets, one over the limit
++        excessiveTag = tag.Tag(tag.tagClassContext, tag.tagFormatSimple, 1 << 140)
++        asn1Spec = univ.Integer().subtype(implicitTag=excessiveTag)
++        substrate = encoder.encode(univ.Integer(1).subtype(implicitTag=excessiveTag))
++
++        try:
++            decoder.decode(substrate, asn1Spec=asn1Spec)
++        except PyAsn1Error:
++            pass
++        else:
++            assert 0, 'excessive long tag tolerated'
++
++
+ class RealDecoderTestCase(BaseTestCase):
+     def testCanonicalLargeBinaryReal(self):
+         substrate = encoder.encode(univ.Real((1, 2, 1000000)))
+diff --git a/tests/type/test_tag.py b/tests/type/test_tag.py
+index d0ffa07..ab9b8b1 100644
+--- a/tests/type/test_tag.py
++++ b/tests/type/test_tag.py
+@@ -9,6 +9,7 @@ import unittest
+ 
+ from tests.base import BaseTestCase
+ 
++from pyasn1 import error
+ from pyasn1.type import tag
+ 
+ 
+@@ -23,6 +24,19 @@ class TagReprTestCase(TagTestCaseBase):
+     def testRepr(self):
+         assert 'Tag' in repr(self.t1)
+ 
++    def testReprHugeTagId(self):
++        # must not hit the interpreter's int-to-str conversion limit
++        hugeTag = tag.Tag(tag.tagClassContext, tag.tagFormatSimple, 1 << 100000)
++        assert 'Tag' in repr(hugeTag)
++
++    def testNegativeHugeTagId(self):
++        try:
++            tag.Tag(tag.tagClassContext, tag.tagFormatSimple, -(1 << 100000))
++        except error.PyAsn1Error:
++            pass
++        else:
++            assert 0, 'negative tag ID tolerated'
++
+ 
+ class TagCmpTestCase(TagTestCaseBase):
+     def testCmp(self):
+@@ -54,6 +68,12 @@ class TagSetReprTestCase(TagSetTestCaseBase):
+     def testRepr(self):
+         assert 'TagSet' in repr(self.ts1)
+ 
++    def testReprHugeTagId(self):
++        # must not hit the interpreter's int-to-str conversion limit
++        hugeTagSet = self.ts1.tagImplicitly(
++            tag.Tag(tag.tagClassContext, tag.tagFormatSimple, 1 << 100000))
++        assert 'TagSet' in repr(hugeTagSet)
++
+ 
+ class TagSetCmpTestCase(TagSetTestCaseBase):
+     def testCmp(self):
+-- 
+2.34.1
+
-- 
2.35.6


