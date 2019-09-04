Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3D9F87F27C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 14:23:45 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id x15so11340821pgg.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=lgZsC47RVhRU2VXuEndKN55BRqoVcf+2kTnwx5k2XRg=;
	b=VdvWJyssMLtzOgF4GOyBVW8VDWvPASdl+c9/GPV2bcpRpXH1NWFQ+4tyLAj394luGR
	5HGhcbbuVZF0P/XALePyWJK8jOu9Yd377tMp4eRA44SnLX1hOhmwlcvRu0zmNIFopzVR
	rcNAeTGzfFR5OJE15MlX/ohjj4q6hWNpiAwx71zjZPjYMIzusLfeTPSGApFgZw/Z3iw5
	Rze34wTEbU+wwxDGAHeQBlnzgTNRFdKMfBhcMFM9NmP2bjIj7PN+ZoYRS+ltNgk8mI1T
	81IGPF9xj6rZazSbgF9umNRpT18rWDovKED4R9p0ZqfpNPxfm693ihmHL+Qds9tleCcM
	EnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=lgZsC47RVhRU2VXuEndKN55BRqoVcf+2kTnwx5k2XRg=;
	b=X+r2ahLTZW/Ngmohs42MI6mvtsb5opwbsqTKJox20Ow4vVPXdyxTkgq2hfFACu9u/l
	VP3XpIwiXPNev2r9aBOiDcGFpUvd5JLUeGv8VpIRe6bGh3iVV79dxNtMNjfSTrM+W9Fj
	dradWsCqnP1lmUTS0/ZRyL0rf5XWQfFNFLFOWxuhK6iVRyxSs2DvDxlBHLVvGGIcMWxI
	zcGx1zqQoxAzfkMuss/kIWcW1XAWxgFLx+klpLbD7AjZwl8+Y5WTXhEHiDqn8h1XWtDV
	rvQ6gwMoQ7yF0PMk91dineGTewj5VeeZAC/jYKbC+8XQo4S7R/qK3nOJ2gPSknQzVz6C
	G/5Q==
X-Gm-Message-State: APjAAAXg/lGPnl2zOPg4Xe/VZMEuEBCymJFxmztltkFi1KkUVFT2Wv+n
	KWR65VVpMNShcKAF5SvWLCSBFQ+dcoAtMA==
X-Google-Smtp-Source: APXvYqz3ZOIpyycIFvr8EF94m6exjPf8pM5Nd6pamy7qKpj6y0MdTJV9wO53kYsbLsaimRc4YNaNrg==
X-Received: by 2002:a63:b102:: with SMTP id r2mr34737468pgf.370.1567607026185; 
	Wed, 04 Sep 2019 07:23:46 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	k15sm9424961pfk.168.2019.09.04.07.23.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 07:23:45 -0700 (PDT)
Date: Wed, 04 Sep 2019 14:23:23 +0000
Message-Id: <20190904142323.21781-4-nathan@nathanrossi.com>
In-Reply-To: <20190904142323.21781-1-nathan@nathanrossi.com>
References: <20190904142323.21781-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 4/4] oeqa/selftest: Toolchain tests suffix "-user" for qemu usermode results
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
X-List-Received-Date: Wed, 04 Sep 2019 14:23:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Suffix the ptestresults suite with "-user" for tests that are executing
against usermode qemu.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py   | 1 +
 meta/lib/oeqa/selftest/cases/glibc.py | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 4f7ffdcb2a..ef85df5e36 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -79,6 +79,7 @@ class GccSelfTest(OESelftestTestCase):
                 sumspath = os.path.join(builddir, target_sys, suite, "testsuite", "{0}.sum".format(suite.split("-")[0]))
 
             ptestsuite = "gcc-{}".format(suite) if suite != "gcc" else suite
+            ptestsuite = ptestsuite + "-user" if ssh is None else ptestsuite
             self.tc.extraresults["ptestresult.sections"][ptestsuite] = {}
             with open(sumspath, "r") as f:
                 for test, result in parse_values(f):
diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 7992ea6bf2..4d0c13131b 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -43,10 +43,11 @@ class GlibcSelfTest(OESelftestTestCase):
 
         builddir = get_bb_var("B", "glibc-testsuite")
 
-        self.tc.extraresults["ptestresult.sections"]["glibc"] = {}
+        ptestsuite = "glibc-user" if ssh is None else "glibc"
+        self.tc.extraresults["ptestresult.sections"][ptestsuite] = {}
         with open(os.path.join(builddir, "tests.sum"), "r") as f:
             for test, result in parse_values(f):
-                self.tc.extraresults["ptestresult.glibc.{}".format(test)] = {"status" : result}
+                self.tc.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
 
 class GlibcSelfTestSystemEmulated(GlibcSelfTest):
     default_installed_packages = [
---
2.23.0.rc1

