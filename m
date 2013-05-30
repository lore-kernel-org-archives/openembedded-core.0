Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 03B5E62238
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:04:00 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hr14so4593853wib.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 07:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=bRomjYvk9zJtdQbKYIDLgixq9DQaD3lPCN07DBeucHY=;
	b=cWyIraqidRknQ1MhA1+VQ0r6Gq+j+m7V5gunQYi646hNBoeP5etPaJcYRCtSYqVeVA
	kIy9JVEIKhAztr4ewUYIQx+DPr0db+u6LJ0q2KTZqdXyQ1yp2oQyUrth6yYRGpS0hPaD
	oXu8RlijsjIF+s4QkRnWps4KEQ7aPSmfbhFbS5ZaR0u+jHz3faJ8hL4q6fkbtiH5g5Al
	9qtag9mjj3p/5k21gFHpkQj15fpo+kpQGlemLhG1c/c/R4Uno9X86+y/1nYifZzKPCC3
	7IPtshbpb09IDuzekOlsPzScR+ldecekeK/v5PE7ua9l2ByTipujIUf/kHEsCFjzGNb8
	6v0w==
X-Received: by 10.194.235.99 with SMTP id ul3mr4976826wjc.6.1369922641785;
	Thu, 30 May 2013 07:04:01 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id h8sm38208362wiz.9.2013.05.30.07.03.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 07:04:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 15:00:37 +0100
Message-Id: <6792689a9b2c5269b2e9e2c6fc21a52dca1cef9d.1369922325.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369922325.git.ross.burton@intel.com>
References: <cover.1369922325.git.ross.burton@intel.com>
In-Reply-To: <cover.1369922325.git.ross.burton@intel.com>
References: <cover.1369922325.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnpNA81P6UndCMB39BRrYjgWfDhJb7Ftm8gowgmLkeGjwe7bUq2LjMHldkl+vEf8DZL4K2b
Subject: [PATCH 4/4] core-image-weston: basic image that boots directly to Weston
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
X-List-Received-Date: Thu, 30 May 2013 14:04:01 -0000

This adds an image that boots directly to Weston on KMS/DRM, and includes the
Weston terminal and gtk+3-demo for incredibly basic testing.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/images/core-image-weston.bb |    9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/recipes-graphics/images/core-image-weston.bb

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
new file mode 100644
index 0000000..e49b205
--- /dev/null
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "A very basic Wayland image with a terminal"
+
+IMAGE_FEATURES += "splash package-management"
+
+LICENSE = "MIT"
+
+inherit core-image
+
+CORE_IMAGE_BASE_INSTALL += "weston weston-init gtk+3-demo"
-- 
1.7.10.4


