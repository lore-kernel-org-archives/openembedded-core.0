Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 007107EC5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:49 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id y35so378157pgl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hZqTgINDA+GSWeT89RdgoNETahIaAcaktSPVKQU/Uvo=;
	b=OkNiWWtqUJSzL4cdlBzRovyEfHQs+ZSDkpxNQRnFTrJBIvF3SrAFYuxS8TG5yGrKjA
	dzPxDm7KnKBTgbHpp78QY2Y+JCpudpdyNgAg577cpuZJ1KJB+yOZIqL1y+XB1fpv3kq7
	AGnNi9qWHXP1fCWgRwdImmohZDJimqLYfDgwBVJbcEb28yYpr4v+McenwNF8P+wxcFXq
	qgjnWB/C72PyPt/mtOXR/jDp4s1HFfDT4v6XLPKDfLV3Op2HkzjBokgQfnX1NQ8za/9l
	ihm+D/BpidNiQ/jY/QePwLb9w84Xn3VVaBOM2NI8yLW6rQ2wHwPp1mhG7NikrZCIdXiD
	x87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hZqTgINDA+GSWeT89RdgoNETahIaAcaktSPVKQU/Uvo=;
	b=JpVI1AA5uYZySjDRhFHuErJ4NNrdOqg2Jr/1bTG2+iph6PCTWLsRVOAXB/fuj+I/DS
	6ZTHiAQW6lMzozBJQwRsE2Wl+rLIUpXSrLc7x+nrFCMgWgy+LgYvPO8IYdf8SRpExq1i
	yHINEMK7LxCUzTvkGFHAvoPQjux3bAU7cnloMBIkj05iX5Aiy5fbwZSLur5j32Ot1aC2
	1VvcHerUkT//zy4+lDpr0nFcKNiz06DdmYIUIWRRuJ1LFLZVg7DQ9QE1vxbO3aZcPzFS
	cMCxvNlk/54gVqgQSq9eW+6F+jwDLMvyVg69ZgZHwWLDT3hi5HYancjv97vetdajD5bY
	bKdQ==
X-Gm-Message-State: APjAAAXmIaRzEqT3WvFetuQVeM4llUe9mZC8OW709tTAbLoEeAcJDIFv
	SNJ8fF7GYaUMZhuNVwE0WstxwkAQUtE=
X-Google-Smtp-Source: APXvYqzyp3i3eU+9BZs6GGEZGGZTuypSwe/wmTozgjc3s4LeLDeOwsW1LN9ohpqT18wyOJjMQtt0AA==
X-Received: by 2002:a17:90a:8987:: with SMTP id v7mr389198pjn.85.1569293390898;
	Mon, 23 Sep 2019 19:49:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:48:57 -0700
Message-Id: <7ea494fa882d25cbd4e87f5fd505b5c4d37ceea1.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 17/50] psmisc: Fix dependency for USE_NLS=no
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:50 -0000

From: Jason Wessel <jason.wessel@windriver.com>

When using USE_NLS="no" in the local.conf psmisc will fail to
compile as follows:

| autoreconf: Entering directory `.'
| autoreconf: running: autopoint --force
| autoreconf: failed to run autopoint: No such file or directory
| autoreconf: autopoint is needed because this package uses Gettext
| ERROR: autoreconf execution failed.

This is because the gettext.bbclass returns gettext-minimal-native for
the host dependency which does not include autopoint.  The autopoint
utility is required to build psmisc, so it needs to list
gettext-native as a dependency.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/psmisc/psmisc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 82ef947..594a10c 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -7,7 +7,7 @@ command sends a specified signal (SIGTERM if nothing is specified) to \
 processes identified by name.  The fuser command identifies the PIDs \
 of processes that are using specified files or filesystems."
 SECTION = "base"
-DEPENDS = "ncurses virtual/libintl"
+DEPENDS = "ncurses virtual/libintl gettext-native"
 LICENSE = "GPLv2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
-- 
2.7.4


