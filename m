Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8914F916C2
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:13 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id s64so3906799pgb.9
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=F1FjgZ446OkLcBWt0ghR0fDb4HYZyp0eoir2BNXK/n4=;
	b=Q+ocwFsl1gE2eR44tS+myeWF9PfVR7gmpa0gurSN4sFXsSyW/+Qhx0J0/hlKBObS2a
	pvg6N8G24AWV2SiHN725E5sKYZlnkQo1ryTG+uh7SRXKFO2rRWsEE5QufHePFazRnPbK
	03ZqYrAZuuduSUctS0MoWMuUe5SimJd70Llx4Q2kMDH/FVkLY7sgcP6/lFnStkr9Rr0h
	CrKuIgF4BbJF1UGjuZqWHjJo1tViUrW2yqFBfjagHonNk1LP/OYXnTuNp2aQPLHwsoSd
	jZSeAsmdVYR3oh3Cg0jPpE1uKneb80ZUGp3BQRzPJAYoUT4JqaqJIVlrjZOAlZW1n2ce
	USsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=F1FjgZ446OkLcBWt0ghR0fDb4HYZyp0eoir2BNXK/n4=;
	b=spkHe5O8V8IRAHpORUhGZL+cXzzhXs8KkXcX2aHEaxDGYa5au351MSKkbWejpStEO+
	CwqchT8rj9cWqrlki2WyVJSYr3HyNSE9BmBZSEOpykTrcR0iZzDXU4nv6uWc7OhrGJJ5
	a4jsxnt6mHKa7Rusws5Uyq1dyQX4Nj8K/yBxYHSb9iaDx4OMCoYkgnMM7KyD8JZb6jjW
	siLLMqOrQlDcm8uPVUH+DdDPNxQMOBRr5Jb8+OEdd10PbMX9TmGLDNMFi/cDoO84bPdE
	TLQgyfV/I3c90qQSJTcn0r4ERkgAmnkx/K1jCNe1V6UBzqt8D3wmoMqjbhLSWASvQIbw
	BT+Q==
X-Gm-Message-State: APjAAAW10jDR0Vq+3vyIYK2A9ZiUQ/Jgw/QnZRkaHl4eD+Ti3mShuTEj
	GdLFs+Svj62AJUhx9IeTmZfscLvL
X-Google-Smtp-Source: APXvYqwtlcOUVZH7RsFBG/gv52HqzKdz0SEzoX50dNm/HXIFEr6Vy4OOTLhN/7sE2Uu+5L5xjtvaJw==
X-Received: by 2002:a65:484d:: with SMTP id i13mr15270450pgs.32.1580055914377; 
	Sun, 26 Jan 2020 08:25:14 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.13
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:47 -0800
Message-Id: <9160dc4dbee6fb13f1a46963ced7961505154213.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 22/29] systemd: Upgrade to a more recent snapshot from the 241 branch
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:13 -0000

From: Adrian Bunk <bunk@stusta.de>

Bugfix-only changes on the 241 stable branch,
including a fix for a breakage with OpenSSL >= 1.1.1c.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/systemd/systemd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index cb41ac5b22..3161a6c543 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -21,7 +21,7 @@ CVE_CHECK_WHITELIST += "CVE-2018-21029"
 # Commit dc903ec516cb on the 241 branch
 CVE_CHECK_WHITELIST += "CVE-2019-3843 CVE-2019-3844"
 
-SRCREV = "511646b8ac5c82f210b16920044465756913d238"
+SRCREV = "d1cc09a6eac5f8d62e630cc31d604095e30d2d84"
 SRCBRANCH = "v241-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
-- 
2.17.1


