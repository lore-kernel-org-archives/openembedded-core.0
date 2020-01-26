Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9C1C09169E
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:12 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id q13so2870227pls.1
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=T1IzNyC4Hplo0hLEAKdaO7BB85anPQkbPnFkxyc1UTg=;
	b=ix2QjwbJxD97Y2vpK5B0jOV0oQvrxoNipA0a4Q4oGWiZ/v6vjy+Fuw/OwNJVNqXrnJ
	uySzp7SryK351ts5lc+Dhr40k6m6P+DxoRBcd6RZpsHu7jztQh5LnR76P0EhPT0gMNMj
	KBEeV3eL2fCtS04MQ+c2RyOpvax6iOEmfUs+jCnpfs5M8VKS8IkiElKZyJkOpoiW6oBZ
	E20b53WFXptXh1JigrqT1t+V6g+Esu3DVuGNwc0iWYpoxLBCamdU7UsDm+C/FMW12mEm
	D0RUL/0d+fI6U7qnvUlO+mRMElk7cUh5LMWXoJjehkvp5csI8KXFuXkdPvaiaZALU5r3
	1xKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=T1IzNyC4Hplo0hLEAKdaO7BB85anPQkbPnFkxyc1UTg=;
	b=NZ0XmXTx+K+aJmWzaW3eC5goHeIvHZ+k+E8whXZWSqhy3C29DuyyVEueLdsOMQJolp
	KKrbOFZuTPzKl3LUfPY9B8aX5z6iCxTcKAXoVD2QNl7r+/DWEqFlBQFrmyldxt4hzMqn
	WUbsDSkuoljhxzHbRAqn2J68k4NSfBuwdi3OjITg6l/sKKiTcGbB/de2DLjO4pRbQcSl
	FuTlWvKwfyHr+bYS6uHP4ntLF+d07kQ6jTFaSLpfD77sLwLBaTwkuYSCJVYj02++SswY
	uWeEfzRQuq8JeclljC7OaBGm3BTf7wKZGwljad0WB8IuG3RvzZ6DcSrPS9YoaEJQJ4CL
	rs5Q==
X-Gm-Message-State: APjAAAVcPUJY/Y6B0075+rRyMKeq7K2DdTRRNEoLcm3zcEdTcBzRlgHh
	3h+DWDhl8qSemXlNCWW6jSt7Ig22
X-Google-Smtp-Source: APXvYqxEcm7uo9OISAcaoWmXWGcJlYeg90Wgr3qSHD1cj3Tk3EFTFqDZjchpItgZswAc+WZA8n40KQ==
X-Received: by 2002:a17:902:8a81:: with SMTP id
	p1mr13629597plo.284.1580055913638; 
	Sun, 26 Jan 2020 08:25:13 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.13
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:46 -0800
Message-Id: <d328696acfd4967d19e32680033d9594dd00b92c.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 21/29] systemd: Whitelist CVE-2018-21029 CVE-2019-3843 CVE-2019-3844
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:12 -0000

From: Adrian Bunk <bunk@stusta.de>

One does not strictly apply to 241, for the other two a fix
was already backported to the 241 branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/systemd/systemd.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 2b9c291959..cb41ac5b22 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,6 +14,13 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
+# DNSOverTLS strict mode was added in 243
+# https://github.com/systemd/systemd/issues/9397
+CVE_CHECK_WHITELIST += "CVE-2018-21029"
+
+# Commit dc903ec516cb on the 241 branch
+CVE_CHECK_WHITELIST += "CVE-2019-3843 CVE-2019-3844"
+
 SRCREV = "511646b8ac5c82f210b16920044465756913d238"
 SRCBRANCH = "v241-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
-- 
2.17.1


