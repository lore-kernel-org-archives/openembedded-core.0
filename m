Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 17C6578830
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:26:48 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id a20so32278410wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 10:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tL0/DGEvSo2OdTmdNzA6JfdjKf2cPDzk2baWR+5vETc=;
	b=r+2IhUn2r8ouV65o3aCM+b0HSm6JmLJHqeUpJnz121GdPprohzOLgs4yOVxALTp/Hz
	jN/YIeaIh4+8SttHU3L90Z0QWDmnkdUKJrloAVI0IHpryOHcQk46OVDrLB68rN05Pn+z
	qh7H4c7eKH7byLfoEFnsKZK8Bz3T8FOWFkTYtCRX+vLINWPgY1UkRpB93zjbMn9hiZ3n
	aPW6us0thJQk7fnzZqwqJugJ5rFWPVOG1Dn3mHw4r385s+MC+hgp8H4BkuN7fVbMkC5/
	Po26nujbDuHuXGQsncw4WC3SJwYSS0/PDIi9uHTjlnk2MY54QFPn62c9G3SWu8t/tGOI
	MdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tL0/DGEvSo2OdTmdNzA6JfdjKf2cPDzk2baWR+5vETc=;
	b=Tzulv5qEqD8Nfto+A+WNDQmLXOXVVHylIBYg+uQQuudMqaPP0PIA1Z2hcF6Mrf6RDc
	G3w2MV5UXtAJEYahNQrsyrB1bpxnXjQ0hDFmz1S6xx+Ku67iO+GKsZyyyjYlFlJSK2Ze
	8/iTGAbwhqBkdhwJk48zCK+kzV9JpoH1FuEwVzuFzBAwmdWoayduOswiW7xF/xYuAEGe
	of2UjjlTsE6Y3XJx6THwxhXZwEfR3vBPKtIMLyk7sTxozXc1zpy2I+ixyMBaTid16AtJ
	OtBd/tlpEqUoHRYBDW+lWrjCvKWO3wbAc/zIDRV2arb8W7hEDMnGIgevXfPRBdEUjUZX
	s/pA==
X-Gm-Message-State: AElRT7HDS6rApkOgTdpi5BOn5dySrGypCmT6Iko6w6Fnr4Ie3i/QETO0
	cRgNzuE/aGXWqrnNoN2KB9uzcZsz
X-Google-Smtp-Source: AG47ELslH6NXZ19lcjwZI8HWAOQDWmM0sInS0B7MtzhU5z7d6PhqoBSHquR0ngWSotB2ZpMmXa4ysA==
X-Received: by 10.28.124.20 with SMTP id x20mr2401505wmc.62.1519928808968;
	Thu, 01 Mar 2018 10:26:48 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h188sm4955285wmf.23.2018.03.01.10.26.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 10:26:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 18:26:31 +0000
Message-Id: <20180301182634.20502-8-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180301182634.20502-1-ross.burton@intel.com>
References: <20180301182634.20502-1-ross.burton@intel.com>
Subject: [PATCH 08/11] sdk: install specified locales into SDK
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
X-List-Received-Date: Thu, 01 Mar 2018 18:26:49 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/sdk.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 6dc96b5f064..aa6597a8495 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -84,6 +84,19 @@ class Sdk(object, metaclass=ABCMeta):
             bb.debug(1, "printing the stack trace\n %s" %traceback.format_exc())
             bb.warn("cannot remove SDK dir: %s" % path)
 
+    def install_locales(self, pm):
+        linguas = self.d.getVar("SDKIMAGE_LINGUAS")
+        if linguas:
+            if linguas == "all":
+                pm.install_glob("nativesdk-locale-base-*.utf-8", sdk=True)
+            else:
+                for lang in linguas.split():
+                    pm.install("nativesdk-locale-base-%s.utf-8" % lang)
+        else:
+            # No linguas so do nothing
+            pass
+
+
 class RpmSdk(Sdk):
     def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
         super(RpmSdk, self).__init__(d, manifest_dir)
@@ -147,6 +160,7 @@ class RpmSdk(Sdk):
 
         bb.note("Installing NATIVESDK packages")
         self._populate_sysroot(self.host_pm, self.host_manifest)
+        self.install_locales(self.host_pm)
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
 
@@ -230,6 +244,7 @@ class OpkgSdk(Sdk):
 
         bb.note("Installing NATIVESDK packages")
         self._populate_sysroot(self.host_pm, self.host_manifest)
+        self.install_locales(self.host_pm)
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
 
@@ -316,6 +331,7 @@ class DpkgSdk(Sdk):
 
         bb.note("Installing NATIVESDK packages")
         self._populate_sysroot(self.host_pm, self.host_manifest)
+        self.install_locales(self.host_pm)
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
 
-- 
2.11.0


