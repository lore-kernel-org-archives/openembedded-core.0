Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 276747F8C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:55:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id a15so5695075wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8fIwJOX0fsnlGI01nmYMGTosD7a5R94DneBtFy6+O1Q=;
	b=Y+9XfQM0Tj5XXIjLZUcAW9+HhimTWHavM8nxEy01VKxhwWosQcdixqkfmGLTXUNDZ6
	Own2SFIDM0O8GLZ6GXgwKvOHniIOFveYRXLMrtt8JjZZpd/Mo0BnIBpWzIc1vin8NKpc
	sU/OUSFhYk0v0IiC3NFPm9HIz4XFOgLhuz6HtNfZqJEuxWFlkzliD5F43lFoUDFU+YUU
	EEJnZ/tVFuTj+ILbE+lHSC7oi8PYF2Zrk2QJj6fJPXwSURaDhnWKs0h6NLIGapf00Ujn
	uPWlDX/nPkvwfXJng0V+6wUzv+DJw35qJ8UH71ZR3zSaJ3cX7b04VJXxrSfNI9e1oKK8
	20UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8fIwJOX0fsnlGI01nmYMGTosD7a5R94DneBtFy6+O1Q=;
	b=dHMCU8LgW2z7v5ANEqc/vY/EkQAKaqre2Vwmlw0JcXUKVXZ7XBfo6ZFNTdhSaaUdJL
	qNOuv4b83wUfhgrUqzyBj3OoQpXHvKr9nZCaIcwRXt3V6JIaPXlbNVZe9LFnIGjVZ2EV
	gz5Lh8NtzHu6DoW10FWLvICC5+N1w65kvVuuMs9Bg6RDA5BYehf/k4JcsYJOqgpF+ZpK
	9TWTbr47LrxHOfp/5qI3aXkdHwYylA39nVpl8ok9k5jAJvGw49GI1kSWS7qFaW+CX0Tw
	KzpphzQg5lul3j78U6ssSfNEl1p5e7P25trFsPlrmIDrEKmnAlN+EuK5c+PAqzA7r49b
	SRbA==
X-Gm-Message-State: APjAAAXlrdIyS7nwopoa2kX0jhBm0S5WWFdONuQyhNTIPINj61fcMsBu
	o380s231H4jfMafAd3+I/fw2gdmTW5w=
X-Google-Smtp-Source: APXvYqwD5K8oPWt38ru7aHpZ2fmYWAAOjLi6/yrBrD2hZksyLHazxLKbOIj8LHTicT9kUdpU1vi9Tw==
X-Received: by 2002:adf:ee03:: with SMTP id y3mr4862276wrn.116.1572519325741; 
	Thu, 31 Oct 2019 03:55:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l4sm2836496wml.33.2019.10.31.03.55.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 03:55:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:55:15 +0000
Message-Id: <20191031105518.7716-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031105518.7716-1-ross.burton@intel.com>
References: <20191031105518.7716-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] oeqa/selftest: add test for oe-run-native
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
X-List-Received-Date: Thu, 31 Oct 2019 10:55:25 -0000
Content-Transfer-Encoding: 8bit

A small test to verify that oe-run-native is correctly working.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index c169885cf32..80d8b2c4cca 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -121,3 +121,9 @@ class OEGitproxyTests(OESelftestTestCase):
         if dash is None:
             self.skipTest("No \"dash\" found on test system.")
         self.run_oegitproxy(custom_shell=dash)
+
+class OeRunNativeTest(OESelftestTestCase):
+    def test_oe_run_native(self):
+        bitbake("qemu-helper-native -c addto_recipe_sysroot")
+        result = runCmd("oe-run-native qemu-helper-native tunctl -h")
+        self.assertIn("Delete: tunctl -d device-name [-f tun-clone-device]", result.output)
-- 
2.20.1


