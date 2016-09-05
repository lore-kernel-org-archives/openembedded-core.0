Return-Path: <joshuagloe@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 42CAA773B7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 13:35:24 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a143so6540965pfa.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=TqBN02qiAF6XYxvammyYqNOjDSpYPbCBUFjbh8KK+Yw=;
	b=DH2qzvA/ZUaK0QThnqgSDgCEGFyZp4orqj65hn9n5ynMG3zIJyb9/OIzykvWkJBBj8
	BX5xfh51A3A4BVNS9WvprDY2WMe2af4JPvRzB8H7O7Joq7fcRc9nrJ4ygpjUAG66W4DF
	bfwf+jCUU5Qd8687tH60VqbkHfclReTOGbX0Gai44KWL9oDSGI4+MvHrl+7/5Spbx8MB
	3q/cPnNIA8Dp9ZEBX/hv+QEMESK9pGoEVcNqSSwgrnntwOg5cnhlmz0ltd80eRV/xT4j
	s76k/pnkYD9ALe5qtujyA4WXaoTnrvgNXDyt0lK9DYOeGo9eJ4iJrYEO0NnlDJTCTeaf
	s/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TqBN02qiAF6XYxvammyYqNOjDSpYPbCBUFjbh8KK+Yw=;
	b=bUUzJiy2Q66wnI4ueRs2tAqyTB9sp6RsnC5FlBP11lZKtbybM+gHIVKHRqbxLUvRyk
	guLUTdGUAOGtNur2iqQZZ7PFiwajYxeHe9SfHSRjk2kd1gx/79HGmFFt+kR9/0lLjLcv
	xwxSSt8pBSriEX59l/iJZ9oZcMzjqdH3zfnlWBiCkx6jdUq6so2JiOCUzI3R5HW7fK5p
	l/lFkM+0ihL8OQJITDbfV2UHJa77w5V491uMSpCtj03Vfk7/zKjXSnLmtXln9p06wXbe
	TqAXLJUSo95ZP+tNRZPaMAi3xP+siPz9ZTX/I426lKgoIvWlXFwMdvg+tYi4JsoR50MO
	n+vA==
X-Gm-Message-State: AE9vXwMPHuwniKQIIX1QNyDaZ82Fov1PeWjr2J2Q7/KzT1QSDqXU9awUcodIu6Gt0JFzPw==
X-Received: by 10.98.25.66 with SMTP id 63mr18582708pfz.94.1473082525329;
	Mon, 05 Sep 2016 06:35:25 -0700 (PDT)
Received: from jlock-mobl1.ger.corp.intel.com ([192.55.54.42])
	by smtp.gmail.com with ESMTPSA id
	a71sm15312551pfg.38.2016.09.05.06.35.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 06:35:24 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 14:35:10 +0100
Message-Id: <20e654a621e5101a7fb7f10d1e4e0eb0c1efcbf3.1473064318.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1473064318.git.joshua.g.lock@intel.com>
References: <cover.1473064318.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1473064318.git.joshua.g.lock@intel.com>
References: <cover.1473064318.git.joshua.g.lock@intel.com>
Subject: [PATCH 2/2] selftest/liboe: add a test for copyhardlinktree()
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
X-List-Received-Date: Mon, 05 Sep 2016 13:35:25 -0000

Add a simple test to validate that the number of files in the
destination matches the number of files in the source after the
copyhardlinktree() has been performed.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oeqa/selftest/liboe.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/lib/oeqa/selftest/liboe.py b/meta/lib/oeqa/selftest/liboe.py
index 5c93069..35131eb 100644
--- a/meta/lib/oeqa/selftest/liboe.py
+++ b/meta/lib/oeqa/selftest/liboe.py
@@ -62,3 +62,32 @@ class LibOE(oeSelfTest):
         self.assertIn('user.oetest="testing liboe"', result.output, 'Extended attribute not sert in dst')
 
         oe.path.remove(testloc)
+
+    def test_copy_hardlink_tree_count(self):
+        """
+        Summary:    oe.path.copyhardlinktree() shouldn't miss out files
+        Expected:   src and dst should have the same number of files
+        Product:    OE-Core
+        Author:     Joshua Lock <joshua.g.lock@intel.com>
+        """
+        tmp_dir = get_bb_var('TMPDIR')
+        testloc = oe.path.join(tmp_dir, 'liboetests')
+        src = oe.path.join(testloc, 'src')
+        dst = oe.path.join(testloc, 'dst')
+        bb.utils.mkdirhier(testloc)
+        bb.utils.mkdirhier(src)
+        testfiles = ['foo', 'bar', '.baz', 'quux']
+
+        def touchfile(tf):
+            open(oe.path.join(src, tf), 'w+b').close()
+
+        for f in testfiles:
+            touchfile(f)
+
+        oe.path.copyhardlinktree(src, dst)
+
+        dstcnt = len(os.listdir(dst))
+        srccnt = len(os.listdir(src))
+        self.assertEquals(dstcnt, len(testfiles), "Number of files in dst (%s) differs from number of files in src(%s)." % (dstcnt, srccnt))
+
+        oe.path.remove(testloc)
-- 
2.7.4


