Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE7577156
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 02:11:22 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id x141so1233012oia.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 18:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V7D6PIIZu0Y24SMQBAUX9iEdiWDl8xijPDYfuKEdE2A=;
	b=R3MiFvHjdxXwElzX1oF8KWzL7YJsPvqD3fwQIWzxUIWIzExI1RqP/PK/vCsQedrgqF
	FS16PPwp/9CqUNeGbEJg8Pa5MIRdXjHTrbl7lx9yWMexAOzOzmsyRFPprWi5qTU+dLhe
	9v+XGbFzQRGXX3nqI82mVXL+xYm8u8eyb8VCtAejE1thQtsKS5gxLtLXWucgdFLcQyIS
	16Rpb1g2KfINUWq8Y3023X37JXDLD1F+sAQpyBMgyjXcZk0QAR9E2QAkFvbkX/TZsM1+
	ZySuo22hLALGF/n53y53FIyK4JRhlSXXubKvPbXs1JfXTF1wyQPnZhpj7UFXL163U0U6
	XbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V7D6PIIZu0Y24SMQBAUX9iEdiWDl8xijPDYfuKEdE2A=;
	b=hDkNcRvHhK9K4nollAvkGSuTePwTAU/OtpOsRbBzqmIKxeXgnv0IcSkDSe5V2QTsDX
	BTl83zvElX1NWlfsK94xP/eNafxRz6Xg4xlDXwR8q+trye7luZ8r4OqDeewpoxratug1
	23Xb5ulGb6fCJNaaMiZnzHsIXb3CIY9AQQYZjz6f/60jPAM2IZL5l3GNZ8CMYp+dDu0p
	gV4MGtzOqMk03e9FZeGj1Kvx0bUgsoZirgv+DbAK9KQdQTA52PCCvoVKSEo7M4mJ1B5Q
	I+5cKOI7xDnLy6BkQLR2LQV8hmQMCqL1M8YKf+7Bnn6YPK3+yAEReEaqaWuBDI4YBMey
	jV0Q==
X-Gm-Message-State: AG10YOSzoxRn2tuHcV/Lffd9mREl1GPb5lfXvIHXFnp4FCGL7bGBjKdDOd0kfhiLx6/u+A==
X-Received: by 10.202.213.215 with SMTP id m206mr352247oig.26.1453947083052;
	Wed, 27 Jan 2016 18:11:23 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id q4sm4448874oew.6.2016.01.27.18.11.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 18:11:22 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 18:11:10 -0800
Message-Id: <1453947071-13364-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453947071-13364-1-git-send-email-armccurdy@gmail.com>
References: <1453947071-13364-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] gcc-cross.inc: drop pruning of PATCH_GET from the testgcc script
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
X-List-Received-Date: Thu, 28 Jan 2016 02:11:24 -0000

PATCH_GET is no longer exported by bitbake.conf, so no longer needs
to be pruned from the gcc-cross do_compile() environment.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index aa10633..f479360 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -72,7 +72,6 @@ do_compile () {
 	sed -i -e "/^'/d" ${B}/${TARGET_PREFIX}testgcc
 	sed -i -e "/^UID/d" ${B}/${TARGET_PREFIX}testgcc
 	sed -i -e "/^TERM/d" ${B}/${TARGET_PREFIX}testgcc
-	sed -i -e "/^PATCH_GET/d" ${B}/${TARGET_PREFIX}testgcc
 	sed -i -e "/^PKG_/d" ${B}/${TARGET_PREFIX}testgcc
 	sed -i -e "/^POSIXLY_/d" ${B}/${TARGET_PREFIX}testgcc
 	sed -i -e "/^PPID/d" ${B}/${TARGET_PREFIX}testgcc
-- 
1.9.1


