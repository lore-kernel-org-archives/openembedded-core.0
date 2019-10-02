Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id EF36D7E9CD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 14:09:15 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a6so7344437wma.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 07:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0YcC4gwiiNh70d9DuANPlLRatQ0cq/cczJMcAkAoMmU=;
	b=E5kFmmdRMZwfz0emXmLCjS/qwyramak5m4x3ZbTU6uqPRgLnS2Gm3GG6ZfmOVM1fcv
	s6eX04h6tvSWReJn+iGg+wH499C+4cQzLuH+8FMgnU4YVtJhwMpRjOK7zoGBgtG1J49/
	BM785MEHpal+w0ScpDtsZdWSa2WfunicVPMxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0YcC4gwiiNh70d9DuANPlLRatQ0cq/cczJMcAkAoMmU=;
	b=IvlzASuTAV3VGX5xRteyKBaiizVmESrgcefddWi6fmMzY72w11AB183Fu3IRppvBxx
	k6JFiPdcJNofcLXRrcRhHHTnjVz/HlDew6rJPZDp/0BPzVPEaFT/LXimlXZJOVIy5RM0
	vsEH8Wzp1VejJRLctcySklAVYR++i+z5nJ0Zt1bE5f+0dtNMNUz6rcq5TywpgBJ3Ux6o
	qbjguZYER5PUlCyUa+UHFQBLHc4Yf/HEPy+JKZ1duS3hE4lTqjEtwZpGdqku49M1H+bU
	qkYWD2Yl6uHI/Jo7glkEjF1aGw6oo3ETPFyoZck6M1ut4IT06AzMXWbTkeqUNzuZRUNN
	URVg==
X-Gm-Message-State: APjAAAUwV1pMkT6Zh0NWgGhxLW8ueEgxEf/7fsqVL2L1mCijoAT6rdHY
	CtzWiNRmqy+wZg9pKmtkAuA34aowLjQ=
X-Google-Smtp-Source: APXvYqyggVLLWuZ6Z0eYpJWxwK01JbDL+ZKWwQGeL8if39IvWldSA4Z0ZW5jbFwo7G0grW2IwgekIA==
X-Received: by 2002:a7b:c776:: with SMTP id x22mr2807502wmk.123.1570025356208; 
	Wed, 02 Oct 2019 07:09:16 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o1sm2762026wrs.78.2019.10.02.07.09.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 07:09:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Oct 2019 15:09:13 +0100
Message-Id: <20191002140914.30358-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] base: Improve module import error message
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
X-List-Received-Date: Wed, 02 Oct 2019 14:09:16 -0000
Content-Transfer-Encoding: 8bit

Turn:

ERROR: Unable to parse Var <OE_IMPORTED[:=]>
Traceback (most recent call last):
  File "Var <OE_IMPORTED[:=]>", line 1, in <module>
  File "/media/build1/poky/meta/classes/base.bbclass", line 35, in oe_import(d=<bb.data_smart.DataSmart object at 0x7f1d941ad208>):
         for toimport in oe.data.typed_value("OE_IMPORTS", d):
    >        imported = __import__(toimport)
             inject(toimport.split(".", 1)[0], imported)
  File "/media/build1/poky/meta/lib/oe/sstatesig.py", line 267, in <module>:

    >class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHashMixIn, bb.siggen.SignatureGeneratorUniHashMixIn, bb.siggen.SignatureGeneratorBasicHash):
         name = "OEEquivHash"
bb.data_smart.ExpansionError: Failure expanding variable OE_IMPORTED[:=], expression was ${@oe_import(d)} which triggered exception AttributeError: module 'bb.siggen' has no attribute 'SignatureGeneratorUniHashMixIn'

into:
ERROR: Error importing OE modules: module 'bb.siggen' has no attribute 'SignatureGeneratorUniHashMixIn'

which can then trigger a version mismatch error message.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 0c8a4b28629..d3184ecf7bb 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -32,9 +32,11 @@ def oe_import(d):
 
     import oe.data
     for toimport in oe.data.typed_value("OE_IMPORTS", d):
-        imported = __import__(toimport)
-        inject(toimport.split(".", 1)[0], imported)
-
+        try:
+            imported = __import__(toimport)
+            inject(toimport.split(".", 1)[0], imported)
+        except AttributeError as e:
+            bb.error("Error importing OE modules: %s" % str(e))
     return ""
 
 # We need the oe module name space early (before INHERITs get added)
-- 
2.20.1


