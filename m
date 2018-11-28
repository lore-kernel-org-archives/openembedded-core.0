Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 268676D446
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 22:52:07 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id s5-v6so24956087ljd.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 14:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=RDwjxJUMrVfN8hFiHMhfnu9LMcVdhdHoeKHjRAm5HhA=;
	b=1HfcOyOwXRwaLsVfel27q3RE7p3hEVYo4DRslKe6FAMcK71jyY7YRd38NZWa75JpNk
	ErKNpUR3imyJSf9Jisi8BvKQgo59Lg6y6jCmH/Y3vK+ZdqShccu54UA/hBvNuCPSpYvI
	eVxP014cLrbxQl6bWAJzAUEGTdsW4mHbcKA5IJ7MRqk5K9HHAbimGRPtmR78n3c++krY
	4JFUsjIwb74NyGHwrNN1Whv2mvFaik8/Gh0j3KT8U5nnTdseSK16K8L8dvTSKVcLbKHf
	BlDJbAlsPWAo4SvoTglHaZFA8f+B1CiV58WRgQnJgJDQ9v8xBG3atkVsCp0QtYvu6HQE
	WptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RDwjxJUMrVfN8hFiHMhfnu9LMcVdhdHoeKHjRAm5HhA=;
	b=sAzzAIY3FW6NWNIE6MF10yXn9FtkjhUamPeL4y8+RjQYkkzlSeYs6uAlAEG9/U4NMq
	i9QQ5UyPJ2XxAnA1UJ3lKpMbSzprGCfirGcR8eokkGBc+tTh0O66d5YMS7BgpQ/k0BTe
	oAF6dU0T/HQv//HnBGz4zqZhJ6e6GH07dlay39cE9jbsh8z3z4i9PFdRP1lfr0etjr3W
	u6/Rn6pysB6zxWQhohyyWntb+dQAMsbiDVGu+onznyg+i/uS35M/b/ibxO0Z/AA85zIC
	xIWATr2S73dfbv3rm9pbaEbj4dpOdMqbWVXdtJP1tLFDhV7akgVAIgV/MSL7/3Smi2Sg
	pt6Q==
X-Gm-Message-State: AA+aEWZyWIEaPym8xJZpU4hWR502ghlsiwB8+VqLcJ9qIDMeUxadBzvS
	NwS4/3dWwy3nOux6pPvoWb8rxmMW4Xk=
X-Google-Smtp-Source: AFSGD/UifPQB9ykouAx95x7coh1zOfYZ7uDIh8SkoBEIGkfAq+G/j9QTpt3oOJ1Ma0pb2Jvz/lcdSA==
X-Received: by 2002:a2e:7c13:: with SMTP id
	x19-v6mr3868372ljc.83.1543445528038; 
	Wed, 28 Nov 2018 14:52:08 -0800 (PST)
Received: from scout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	p67sm1423505lfe.14.2018.11.28.14.52.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 14:52:07 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 23:51:09 +0100
Message-Id: <20181128225109.110590-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [meta-oe][thud][PATCH] layerindexlib: change LAYERSERIES_COMPAT to thud
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
X-List-Received-Date: Wed, 28 Nov 2018 22:52:08 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 bitbake/lib/layerindexlib/tests/restapi.py                    | 2 +-
 .../lib/layerindexlib/tests/testdata/build/conf/bblayers.conf | 2 +-
 .../lib/layerindexlib/tests/testdata/layer1/conf/layer.conf   | 4 ++--
 .../lib/layerindexlib/tests/testdata/layer2/conf/layer.conf   | 2 +-
 .../lib/layerindexlib/tests/testdata/layer3/conf/layer.conf   | 2 +-
 .../lib/layerindexlib/tests/testdata/layer4/conf/layer.conf   | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/bitbake/lib/layerindexlib/tests/restapi.py b/bitbake/lib/layerindexlib/tests/restapi.py
index 58766950ce..4febd23609 100644
--- a/bitbake/lib/layerindexlib/tests/restapi.py
+++ b/bitbake/lib/layerindexlib/tests/restapi.py
@@ -35,7 +35,7 @@ class LayerIndexWebRestApiTest(LayersTest):
         self.assertFalse(os.environ.get("BB_SKIP_NETTESTS") == "yes", msg="BB_SKIP_NETTESTS set, but we tried to test anyway")
         LayersTest.setUp(self)
         self.layerindex = layerindexlib.LayerIndex(self.d)
-        self.layerindex.load_layerindex('http://layers.openembedded.org/layerindex/api/;branch=sumo', load=['layerDependencies'])
+        self.layerindex.load_layerindex('http://layers.openembedded.org/layerindex/api/;branch=thud', load=['layerDependencies'])
 
     @skipIfNoNetwork()
     def test_layerindex_is_empty(self):
diff --git a/bitbake/lib/layerindexlib/tests/testdata/build/conf/bblayers.conf b/bitbake/lib/layerindexlib/tests/testdata/build/conf/bblayers.conf
index 40429b2f66..4f06ca7b70 100644
--- a/bitbake/lib/layerindexlib/tests/testdata/build/conf/bblayers.conf
+++ b/bitbake/lib/layerindexlib/tests/testdata/build/conf/bblayers.conf
@@ -1,4 +1,4 @@
-LAYERSERIES_CORENAMES = "sumo"
+LAYERSERIES_CORENAMES = "thud"
 
 # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
 # changes incompatibly
diff --git a/bitbake/lib/layerindexlib/tests/testdata/layer1/conf/layer.conf b/bitbake/lib/layerindexlib/tests/testdata/layer1/conf/layer.conf
index 966d531959..8e979e0c65 100644
--- a/bitbake/lib/layerindexlib/tests/testdata/layer1/conf/layer.conf
+++ b/bitbake/lib/layerindexlib/tests/testdata/layer1/conf/layer.conf
@@ -7,11 +7,11 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "sumo"
+LAYERSERIES_CORENAMES = "thud"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_core = "11"
-LAYERSERIES_COMPAT_core = "sumo"
+LAYERSERIES_COMPAT_core = "thud"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
diff --git a/bitbake/lib/layerindexlib/tests/testdata/layer2/conf/layer.conf b/bitbake/lib/layerindexlib/tests/testdata/layer2/conf/layer.conf
index 7569d1c217..a59cdf3a45 100644
--- a/bitbake/lib/layerindexlib/tests/testdata/layer2/conf/layer.conf
+++ b/bitbake/lib/layerindexlib/tests/testdata/layer2/conf/layer.conf
@@ -17,4 +17,4 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = "sumo"
+LAYERSERIES_COMPAT_networking-layer = "thud"
diff --git a/bitbake/lib/layerindexlib/tests/testdata/layer3/conf/layer.conf b/bitbake/lib/layerindexlib/tests/testdata/layer3/conf/layer.conf
index 7089071faf..321d51bee7 100644
--- a/bitbake/lib/layerindexlib/tests/testdata/layer3/conf/layer.conf
+++ b/bitbake/lib/layerindexlib/tests/testdata/layer3/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "sumo"
+LAYERSERIES_COMPAT_meta-python = "thud"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/bitbake/lib/layerindexlib/tests/testdata/layer4/conf/layer.conf b/bitbake/lib/layerindexlib/tests/testdata/layer4/conf/layer.conf
index 6649ee0208..86f689491e 100644
--- a/bitbake/lib/layerindexlib/tests/testdata/layer4/conf/layer.conf
+++ b/bitbake/lib/layerindexlib/tests/testdata/layer4/conf/layer.conf
@@ -19,4 +19,4 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "sumo"
+LAYERSERIES_COMPAT_openembedded-layer = "thud"
-- 
2.17.1


