Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id F3E5071B2F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 16:09:11 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id o16so63258761wra.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 08:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gJMFXUY0ZvxyqRAcG4WnQHGEnH8sv7ysPXqvuogk6N0=;
	b=fX4DebYVUmfX0DndKW3LIXHc8jc2OdLCIY7BgYnuf1CaSbUZ2+FOc7dsASwxlk+E2+
	BO8p6ZT8xeVSMzLkFs1HmuRE7KRXkVW/XGVCulICSzCD5PmXihAwQtimWYLN2S9BC7/K
	vDr1sHbOkSJQ94up+mY6fU/TAVYdkyFPzVR/hLqdC/vAUD2jFfNgHhcc4B1JC15Zdp1/
	6MUbqI2nrCjZgO03KzQ10GC268IReKIhUvHRr3P3HqdMkCApOIEh4nmKnUKcnOy26zHn
	YzhDbwjjS9LaA9tprfkhnumr8mN0cPLkRaNF7H99EUK0GF7clE8P1vcwkB+bDD3nPkgq
	1Pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gJMFXUY0ZvxyqRAcG4WnQHGEnH8sv7ysPXqvuogk6N0=;
	b=FclGfOhyvucaTLxSI7CB5e63mL89kci+/j5TQBHFKPHpWBn/ohZx+Z+oeJo6ppZAYG
	V9NhfOLjgWmbHNkdR/ilvCAbbX9/o5M2meXmZKMD7DNHX7Y8MS6NPeLSU4VxNCpMQQfF
	AeDj0j2U/WV12us3hHjY5yVrZ4bS7JQwJ9QwS5Vs6a1mFa6dEr5qzrlhYtkiW53T3Zdo
	+YrrbaXmWoB0vY+zyTD3fxoIXZzrXpkm4J4jTDU5ZPwUfcQXWwitV2qrcZRbxKsFse2M
	eZ0OPtLWUoo67dqgDUbQEL8MPkwE01hhvrFHjSFzMoppf4pHwVcYATNcfV2YWbVbON9t
	sUyQ==
X-Gm-Message-State: AIkVDXKf/YoFow+AOTsy9zkUD/l6ECPclr5vYwcnxGpqFsb59jcxN8SuKBBBMpSQDGYpVs+D
X-Received: by 10.223.136.152 with SMTP id f24mr19044232wrf.187.1486570151259; 
	Wed, 08 Feb 2017 08:09:11 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	v67sm13665821wrc.45.2017.02.08.08.09.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 08:09:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 16:09:08 +0000
Message-Id: <1486570148-19170-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] lttng-tools: no need to delete libxml.m4
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
X-List-Received-Date: Wed, 08 Feb 2017 16:09:12 -0000

The configure.ac uses pkg-config now and this macro doesn't exist in the tarball
anymore, so remove the deletion.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb b/meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb
index 741d884..4c11e5b 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb
@@ -50,11 +50,6 @@ FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
 INSANE_SKIP_${PN} = "libexec dev-so"
 INSANE_SKIP_${PN}-dbg = "libexec"
 
-do_configure_prepend () {
-    # Delete a shipped m4 file that overrides our patched one
-    rm -f ${S}/m4/libxml.m4
-}
-
 do_install_ptest () {
     for f in Makefile tests/Makefile tests/utils/utils.sh ; do
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
-- 
2.8.1


