Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id AA00F731CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:13:13 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id c7so21434516itd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uMCVTc/sSM9gtT8lh34HEAiapTrEBMkRFW97EChkR1Q=;
	b=WCUqC4QgiE6ccrAQsVe9GRNS3i5JPHLHcbx7BdoL1epQGtMYIybEiwo1Wea+QF29Tb
	q41M0GWp8TNP69yPKCWewVp1QN/azBk9RR+G4vo2kO9cZVhHC9JG1SSoa7bYLNSMCmSm
	Pz2YSD39WIH204zronVRM9kXOOsiK/QdGCGz4Z8E3aG0i6PDtEbNU308/7msxS8POMK8
	dtbuQEn2zQVGPbPUSNHPlh2OBpbgt2edzcLqKyNwHMvWW4z6f5pHynVZWdIUzyegnzLw
	K/VdG4lkZDMYTTTkCPV/I88YyPPl9sszxGc9g9VqzP5Md1ftWXq8s8mAshy2laD9UYqh
	c7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uMCVTc/sSM9gtT8lh34HEAiapTrEBMkRFW97EChkR1Q=;
	b=WtnFrAW7Y7IvLL1oqj1Hd8GKJVxOUeqPrHipgFNy0As40oSHE/gLG8mO+2wMkM32SX
	l8E5ijI1/4kq3epY2YChuL/XQvMIjqYA+7CBaYU/QZR/qQiKYj4yJCu0Epfs2ThGSn4u
	0OaoMJTFNBZhgUwV8XK453PzqYWFNmSPsdkg2fm0kzKnqUJCmIZG0tT00F3uTWTu3sA0
	nIk/eeq9FGzH3zGr659VZFLS8ESGwfqMBxrrA1VlXS9/3voBru6ODWAVEolINElV1UAo
	57l4fSv7GTstHhTBXeMamSXHPdZLhReTkdr5uZlYc+0QfgDNcwRKQkKTwxyVxCngcIF3
	1R2g==
X-Gm-Message-State: AIkVDXKeRpZVEStpZjdBSy+f4NUkFv2xZxv/mQG8MdYjI6DTHAFYVvQmdLoufxevjOveTLtV
X-Received: by 10.36.20.216 with SMTP id 207mr3741970itg.61.1484921594007;
	Fri, 20 Jan 2017 06:13:14 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id k6sm4573464ioe.1.2017.01.20.06.13.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 06:13:13 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 15:12:35 +0100
Message-Id: <0a57ab7cdda3839ca69c9cc16079e5b748683ac4.1484921498.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 04/12] ovmf: explicitly depend on nasm-native
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
X-List-Received-Date: Fri, 20 Jan 2017 14:13:13 -0000

Fixes a build issue when nasm was not build already because of
something else.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index e722db5..13b583b 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -20,6 +20,8 @@ DEPENDS_class-native="util-linux-native iasl-native ossp-uuid-native"
 
 DEPENDS_class-target="ovmf-native"
 
+DEPENDS_append = " nasm-native"
+
 EDK_TOOLS_DIR="edk2_basetools"
 
 # OVMF has trouble building with the default optimization of -O2.
-- 
git-series 0.9.1

