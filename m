Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1767609E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:56:13 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r144so27010182wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 06:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iyhP+SOCk4jwRwzfHVws79J4vKOvii352swXnMH+1Cw=;
	b=h71iWlG8/QAZ6A49pCm4ZRt35ddmagDdQIBhiMmP2+GFco9D60BjKxwgUXvbtUoHJ0
	3RHPng5sx5xYM7bNY2lemkJzx80Yg/y9Me+LLLXF3ozVA2bkoeQjwPEc4noQ/fVQgGpK
	rsZrwdBbG0aBADzIfU7zSKhsXlddJIhP6mE9CjJaT51c74hz+60NCFtF1rfPbCDPiwbT
	9wF183co/yfwR0Qpks8jpJBTR5Iu5ru1O6i4kotdjctxjUnvX/cRnKhomDB5bpAQv3q9
	1bCo7E2FK98r8oDo06QGr60w5CtZOSfj+OLyINM3g6PvFiXZ3BzMJWdxcNJh+jsMpx4q
	cYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iyhP+SOCk4jwRwzfHVws79J4vKOvii352swXnMH+1Cw=;
	b=azx2L879lElkQBS94XPX8RrKemawul+5K29l5Y4QnntvxCkZEB0qY8v9WVU/KTAdcC
	Ur4NmpTjfkj06813bnvvOV0aeuoNDtBm4k4hm+w18oAllsjYADNT5FS8UEmoVR6W+cCE
	ax0s5HpZGqahp2ugC/M9JYnAcabwOGEB+q+0/QATpy68XDwga0LmZOmkrA+HghWcywsF
	5kmOZ8vAXiD+Vh0PAvi3paMQGMTI3njeEaNCW6+ykaoeGcRb44XiDq5JnuhN22830sIK
	c3afCo5h2SYxwpopoBR1ISBlzrC9N6S3gjiiHKKJTWMrAKU9XvNdCgPoHIRuW4jg425o
	+pyg==
X-Gm-Message-State: AIkVDXJMMGPvVTkapKZZjvmMKtoJMJZVDfTFP1wVYwaCV7LzLWHGrPme+IkJ+L+MR/LNQQ==
X-Received: by 10.223.170.79 with SMTP id q15mr27025834wrd.36.1485183374106;
	Mon, 23 Jan 2017 06:56:14 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	q5sm15129433wrd.32.2017.01.23.06.56.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 06:56:13 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 15:55:08 +0100
Message-Id: <20170123145508.9252-5-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170123145508.9252-1-freesilicon@gmail.com>
References: <20170123145508.9252-1-freesilicon@gmail.com>
Subject: [PATCH 4/4] ref-manual: Add SSHD_CONFIG
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
X-List-Received-Date: Mon, 23 Jan 2017 14:56:14 -0000

Add description for the SSHD_CONFIG variable which is used to select the
package to use as provider for sshd-config.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 documentation/ref-manual/ref-variables.xml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 6e15e65f54..803f0da980 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -12511,6 +12511,27 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-SSHD_CONFIG'><glossterm>SSHD_CONFIG</glossterm>
+            <info>
+                SSHD_CONFIG[doc] = "The package used to provide OpenSSH sshd configuration.
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    When selecting "ssh-server-openssh" in
+                    <link linkend='var-IMAGE_FEATURES'><filename>IMAGE_FEATURES</filename></link>,
+                    specifies which package should be used as provider for
+                    <filename>sshd-config</filename>.
+                </para>
+
+                <note>
+                    This defaults to <filename>openssh-sshd-config</filename>.
+                    If "read-only-rootfs" is also specified in
+                    <link linkend='var-IMAGE_FEATURES'><filename>IMAGE_FEATURES</filename></link>,
+                    it defaults to <filename>openssh-sshd-config-readonly</filename>
+                </note>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-SSTATE_DIR'><glossterm>SSTATE_DIR</glossterm>
             <info>
                 SSTATE_DIR[doc] = "The directory for the shared state cache."
-- 
2.11.0


