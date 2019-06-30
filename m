Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id D11B17E951
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 09:19:57 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id c2so10527975wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 02:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FfWbGX0jmtlui4MmrU4vTHepNQuxEXlhtby+u5Vs0vo=;
	b=clgsnmikNzCgzwqd6nw9k3202ey1Q6exUb5mgLWcUYpUHQ43pNK9TNLocH7oAKbPVl
	NrEctoXc3N/fLEv/1yOlq7gNOPvJtomOpgRyy15+7O6aRy/2LFd3IMhnJyTalB6ohoZ3
	FWgnGSPOLMuHLvG7NmYre9xk+DrEh+FHy5uqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FfWbGX0jmtlui4MmrU4vTHepNQuxEXlhtby+u5Vs0vo=;
	b=N0edYEHnJd49ot1OUJjxMVwf0vYQsL7KR+fKoIRaBn55JEyywIwaULwDL7cGgUaMLz
	Zd1UK4ZdEeLtI9QXzZbF25mCy+PrzrEidRI99frtYS9yhaYqET6sz/94R+dxAitfektN
	5U/NuCt+pcG6aDG1XScHcGelKkhEXeYN+WHlCDUGX3wDhI2Od1BBuE7om20YMSARz0al
	NjZXzvljZpVMoMIOHP1LdJ7EqTfOn2NV/+fLpFiUuw/Z5rI1yYEqcOGqC1S8EjX23b96
	cKLoesHYPZrMHxPiKQugi+QhL48MIoB4QVKccNSg01SHr/u22MDwd7frpSSyS/TPCqw0
	GUVA==
X-Gm-Message-State: APjAAAXVLt/sEoD5MAkQNMUKnfzpf+d9a1o5I8nfVO4RK+RnlqDKtGAR
	6f85ybdtGn5Airx+pLR2+Cs7HrbzI8Y=
X-Google-Smtp-Source: APXvYqz9qsY2zBzEeouiflo2nCNrn5QV4PJ4YrGKFfkfFj+MzlzQs1ny0/00K2f8u/Vu43xb6WDXKA==
X-Received: by 2002:adf:f544:: with SMTP id j4mr14846604wrp.150.1561886398170; 
	Sun, 30 Jun 2019 02:19:58 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h90sm9198701wrh.15.2019.06.30.02.19.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 02:19:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Jun 2019 10:19:55 +0100
Message-Id: <20190630091956.3314-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] staging: Code cleanup
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
X-List-Received-Date: Sun, 30 Jun 2019 09:19:58 -0000
Content-Transfer-Encoding: 8bit

multiconfig dependencies no longer appear in BB_TASKDEPDATA so we can drop
this code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 92070602228..94c85248daf 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -261,12 +261,10 @@ python extend_recipe_sysroot() {
     workdir = d.getVar("WORKDIR")
     #bb.warn(str(taskdepdata))
     pn = d.getVar("PN")
-    mc = d.getVar("BB_CURRENT_MC")
     stagingdir = d.getVar("STAGING_DIR")
     sharedmanifests = d.getVar("COMPONENTS_DIR") + "/manifests"
     recipesysroot = d.getVar("RECIPE_SYSROOT")
     recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")
-    current_variant = d.getVar("BBEXTENDVARIANT")
 
     # Detect bitbake -b usage
     nodeps = d.getVar("BB_LIMITEDDEPS") or False
@@ -452,11 +450,6 @@ python extend_recipe_sysroot() {
     msg_adding = []
 
     for dep in configuredeps:
-        if mc != 'default':
-            # We should not care about other multiconfigs
-            depmc = dep.split(':')[1]
-            if depmc != mc:
-                continue
         c = setscenedeps[dep][0]
         if c not in installed:
             continue
-- 
2.20.1


