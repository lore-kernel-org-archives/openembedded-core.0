Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6F1626011B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 18:44:46 +0000 (UTC)
Received: by wmww144 with SMTP id w144so53800283wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 10:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=W8ylEMaFeRE1KDkP5JzX4GzHTTY6m7Ppem5jiD0o1i4=;
	b=dcoVC4QzzW8GbjFo4LDoPGRMYRtKKnZt8clBadvH65W/vEoUf0yfGf9ca3m0/jBMDH
	qz7pkdxQVRnc0CkqcUtaJhyiil1W2Fi4UMtAGLcgC8HcPyQVJwdP4f0shi0UA4Qg/gVu
	rB7MWYOBQTMgROHhV5YF8rwdly3oCcImRs9dxn8MbqYqvjpiqTcHm91EoATxptji7S4c
	rt3/d+O65vY32FZLuRXlUbN6Gg4h0qkooob1YCFN2o5RoGHC3BIvCWq+pQbDgaS55LXz
	jIcTgUEqomZTJ9CXbchKydat6Uc0cACUUfdpXM1xaC4grSXf7ghW8zEU6eG1xYoylOE9
	gQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=W8ylEMaFeRE1KDkP5JzX4GzHTTY6m7Ppem5jiD0o1i4=;
	b=Y3H/5blq09prTqYrw98W0KxhhB/UrwzRJ3PDYUBFb36QbbpV2xubuxJiu8+rWmAyTQ
	/tgYbbKxjQ1o+tqVpnK+Rufnbh/djHahniwU0kGjxW6h5stlpGXpPh1P/Fe7/RUs5LyA
	R1rLpaNtRm4971Cv0Lak9UGIoZ5JWGQzODlYsHoyqQjl9ci6qJ33H0PELG14PAYxMgTC
	falBXHHxa8zAuZ3ySqwTHdvXLBBlmPRlYFQ2fqEIL6Nr9eodknBRZcf2DjA0H40UUA6q
	xl0DgdEJ4pjgoztko3hV0uQcSJBTUr6ColsXiH1V/QFAQC6xto/2bgxgaulX6Myc3Hgc
	9UOA==
X-Gm-Message-State: ALoCoQm1agk1BDTh5+mSEpv8DatvJiCv3pnA+7vRu/2W7JPzOz2kd76gCGEoACGmcz2nytMtPz0j
X-Received: by 10.194.246.200 with SMTP id xy8mr7300096wjc.62.1448131486708;
	Sat, 21 Nov 2015 10:44:46 -0800 (PST)
Received: from Blackadder.home
	(host86-164-154-14.range86-164.btcentralplus.com. [86.164.154.14])
	by smtp.gmail.com with ESMTPSA id
	143sm5323286wmv.18.2015.11.21.10.44.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 Nov 2015 10:44:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Nov 2015 18:44:38 +0000
Message-Id: <1448131478-38698-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.4.9 (Apple Git-60)
In-Reply-To: <1448131478-38698-1-git-send-email-ross.burton@intel.com>
References: <1448131478-38698-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] base: add automatic dependency on lzip-native for .lz SRC_URI
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
X-List-Received-Date: Sat, 21 Nov 2015 18:44:46 -0000

Now that the SRC_URI is parsed this can be done without false-positives.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index c7db81a..dc4a5aa 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -548,6 +548,10 @@ python () {
     if path.endswith('.lz4'):
         d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_populate_sysroot')
 
+    # *.lz should DEPEND on lzip-native for unpacking
+    elif path.endswith('.lz'):
+        d.appendVarFlag('do_unpack', 'depends', ' lzip-native:do_populate_sysroot')
+
     # *.xz should DEPEND on xz-native for unpacking
     elif path.endswith('.xz'):
         d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
-- 
2.4.9 (Apple Git-60)


