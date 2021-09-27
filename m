Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2C0C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 20:04:57 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web12.4431.1632773096817319394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 13:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZEMmqKGk;
 spf=pass (domain: gmail.com, ip: 209.85.210.46,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso25943085otv.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 13:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K8Sl1E+abUHvEHzJysZqOG5bvTNBpOCsHLpHdY+VH3U=;
        b=ZEMmqKGkNSISB6UdTDypSUBAHUA1imhJ4uEIdFDg7hNwLbz1rbd9HU/KOTxbMxVUrT
         tWqwDrE6EXuoPNRnaKqplxw4X7lbXFFZJWhPphrSFf4mK4WVX029KQp434qFRoQdntVr
         30qsp/p13zsyfgNY2ipge++nDI12GeVhCplfqhA/MdlQhGjms2gORyrunHIycwnIU1mF
         6cQTF97SbvCSTvR/kRgFEDBB2493kncxgWSc7HUo2+/bvsPRR1DSC5h+fS2/bdayPho7
         oQYZ5rZUJkk/SSUr5csfspSjmSdd93IYjt9sGQCQX9ANVHzGW2nfuFH9v78nBAoyqgul
         o08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K8Sl1E+abUHvEHzJysZqOG5bvTNBpOCsHLpHdY+VH3U=;
        b=5IHgRn6WgsCCXuQXJoxoHz9vemVHmtfLhfka3teDlEY7ScPlBNeXFIadSQJd6SzOFm
         AU7NhUtUZw6EgVDlfkojtrQLTJeB/xCUczQ7361m61Suxf4kQ0I9bO4ocjrXVjuJB2Tf
         KvrSf0rPleCCMAbEsPhQOXmAugvcY/EdCJkmSKt9WohsXMQA5OXZlQjO0kcifUlSLDVI
         lBAR77lBxPB2mLyehbb26JaGaiwPB9g1KjzRbgfqSvRapSAy10orqWqq4JvhhSaYOhsn
         BCNynt7IbWofS/MFxSgQXAkeObkXFncQjTI0BcOBliVhVep2T1wJSdmbX76XW13+wrvW
         r77g==
X-Gm-Message-State: AOAM530qp19IjZhYkcr3n8hUBZxglpdGjr7emSXyR1+Kc2oe5473II7E
	hl0/nwulJI4jZNhikdMPSNo2+n3hnR4=
X-Google-Smtp-Source: 
 ABdhPJzgza30ILrsMO4BeGSId7a4a1P/8lkQT0qp4lHxZoVUcy8TBXAfzBpVzRjNJon0/iByzFfFvQ==
X-Received: by 2002:a05:6830:4b8:: with SMTP id
 l24mr1691813otd.334.1632773095775;
        Mon, 27 Sep 2021 13:04:55 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 l19sm2377427ota.17.2021.09.27.13.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:04:55 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib/oe/spdx.py: Add comments
Date: Mon, 27 Sep 2021 15:04:44 -0500
Message-Id: <20210927200444.2190714-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 20:04:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156400

Adds several comments to this file to explain the intention and how it
should be used

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx.py | 57 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
index 9814fbfd66..844ee9fd03 100644
--- a/meta/lib/oe/spdx.py
+++ b/meta/lib/oe/spdx.py
@@ -2,6 +2,18 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+#
+# This library is intended to capture the JSON SPDX specification in a type
+# safe manner. It is not intended to encode any particular OE specific
+# behaviors, see the sbom.py for that.
+#
+# The documented SPDX spec document doesn't cover the JSON syntax for
+# particular configuration, which can make it hard to determine what the JSON
+# syntax should be. I've found it is actually much simpler to read the official
+# SPDX JSON schema which can be found here: https://github.com/spdx/spdx-spec
+# in schemas/spdx-schema.json
+#
+
 import hashlib
 import itertools
 import json
@@ -9,7 +21,16 @@ import json
 SPDX_VERSION = "2.2"
 
 
+#
+# The following are the support classes that are used to implement SPDX object
+#
+
 class _Property(object):
+    """
+    A generic SPDX object property. The different types will derive from this
+    class
+    """
+
     def __init__(self, *, default=None):
         self.default = default
 
@@ -19,6 +40,10 @@ class _Property(object):
 
 
 class _String(_Property):
+    """
+    A scalar string property for an SPDX object
+    """
+
     def __init__(self, **kwargs):
         super().__init__(**kwargs)
 
@@ -39,6 +64,10 @@ class _String(_Property):
 
 
 class _Object(_Property):
+    """
+    A scalar SPDX object property of a SPDX object
+    """
+
     def __init__(self, cls, **kwargs):
         super().__init__(**kwargs)
         self.cls = cls
@@ -62,6 +91,10 @@ class _Object(_Property):
 
 
 class _ListProperty(_Property):
+    """
+    A list of SPDX properties
+    """
+
     def __init__(self, prop, **kwargs):
         super().__init__(**kwargs)
         self.prop = prop
@@ -82,16 +115,28 @@ class _ListProperty(_Property):
 
 
 class _StringList(_ListProperty):
+    """
+    A list of strings as a property for an SPDX object
+    """
+
     def __init__(self, **kwargs):
         super().__init__(_String(), **kwargs)
 
 
 class _ObjectList(_ListProperty):
+    """
+    A list of SPDX objects as a property for an SPDX object
+    """
+
     def __init__(self, cls, **kwargs):
         super().__init__(_Object(cls), **kwargs)
 
 
 class MetaSPDXObject(type):
+    """
+    A metaclass that allows properties (anything derived from a _Property
+    class) to be defined for a SPDX object
+    """
     def __new__(mcls, name, bases, attrs):
         attrs["_properties"] = {}
 
@@ -105,6 +150,9 @@ class MetaSPDXObject(type):
 
 
 class SPDXObject(metaclass=MetaSPDXObject):
+    """
+    The base SPDX object; all SPDX spec classes must derive from this class
+    """
     def __init__(self, **d):
         self._spdx = {}
 
@@ -122,6 +170,15 @@ class SPDXObject(metaclass=MetaSPDXObject):
             return
         raise KeyError("%r is not a valid SPDX property" % name)
 
+#
+# These are the SPDX objects implemented from the spec. The *only* properties
+# that can be added to these objects are ones directly specified in the SPDX
+# spec, however you may add helper functions to make operations easier.
+#
+# Defaults should *only* be specified if the SPDX spec says there is a certain
+# required value for a field (e.g. dataLicense), or if the field is mandatory
+# and has some sane "this field is unknown" (e.g. "NOASSERTION")
+#
 
 class SPDXChecksum(SPDXObject):
     algorithm = _String()
-- 
2.33.0


