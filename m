Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7192D7E63F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 23:30:22 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z3so4844167pgp.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 16:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Cj2dCrWZUoY4aKZs1/V4ilTp+MK433KofeReLEXGbX8=;
	b=qc7iXiuiG5YKZ3Tod6RABCKuA0x3NaO7j4W72KlZQMzvHKy6xyzoLjDY6pmYkd/aLV
	wpBeHSPF285KzIrRzDXp5qIq+1mVMQcAZKPTHrHWRy9xBePfzuc+FvUA8Ef9fnIrVDR1
	CAtfVmxURa9js/kxINeIA66v7JzTXokJ2QWmXynd9RL4Ejz0fnjgotgbovRDlCSAN5+3
	0Y+QkredPsk0SviW0eYcPSDR1i78lbn6uhF9tLlKJGmezDz+05PGetkrydlDwq7YkNiO
	UtS5u3fU5BbIw1kdRIO79v/daezHdWyi4tyMUCEieWlVSBF0YznAyZ/tKZyB8YI/sUTS
	JZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Cj2dCrWZUoY4aKZs1/V4ilTp+MK433KofeReLEXGbX8=;
	b=neumAaZCDmp1SmJpvXV11ltxhcTfzuf/0Z9e7FN/mXrUHxOleMgmyqPQwEyO2YVSj7
	TXkY8kncSevN7yOUTwVynXatW3quOqBEw/wJcaLXxei6LcHXT8aEsrKBwvzk+H14Ft0F
	7MolU0+vDDOkUk602ocl0CodzFAI5s6GGeBMzKsV7akYrrMJNrd1yXDr4RZbHgBxjoSk
	dPzK5faBLw3mVFBRIkF9cIlK174fFHgpd7y84YJ3g0unqfxmnrnkj69dEi8rWge1Ehtk
	zRBUQgeVZoDuLCD2jCGN2DxPvxpRG9U1Vf/ruEGeTvmzRS3Lwd4wLcJ79zh/VYndk0rR
	vOGA==
X-Gm-Message-State: APjAAAVjb70wMg2tIGBwAV32KAwspBVqzMtMXlNqEwPI/lQSbV9jZJRj
	OFf0m7LCiYFD7Lk1TCj6jO8fIKXw
X-Google-Smtp-Source: APXvYqy2QOpL85E9Zzo4ZTZpra89aXB8aRZ3xbtQwu2Ho3pEm5fyzyURatFjhagbNxktrdqO9huIjg==
X-Received: by 2002:a17:90a:bf01:: with SMTP id
	c1mr12670967pjs.78.1559345423250; 
	Fri, 31 May 2019 16:30:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d8eb:da43:9914:3fc9])
	by smtp.gmail.com with ESMTPSA id u1sm7199631pfh.85.2019.05.31.16.30.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 May 2019 16:30:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 16:30:17 -0700
Message-Id: <1559345417-17830-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559345417-17830-1-git-send-email-akuster808@gmail.com>
References: <1559345417-17830-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 4/4] go: update to minor update 1.11.10
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
X-List-Received-Date: Fri, 31 May 2019 23:30:22 -0000

From: Armin Kuster <akuster@mvista.com>

Source: golang.org
MR: 97548,
Type: Security Fix
Disposition: Backport from https://github.com/golang/go/issues?q=milestone%3AGo1.11.5
ChangeID: 54377c454f038a41bf35dd447a784e3e66db6268
Description:

Bug fix updates only
https://golang.org/doc/devel/release.html#go1.11

Fixes:
Affects <= 1.11.6
CVE-2019-6486
CVE-2019-9741

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/go/go-1.11.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.11.inc b/meta/recipes-devtools/go/go-1.11.inc
index d03e26c..401e71f 100644
--- a/meta/recipes-devtools/go/go-1.11.inc
+++ b/meta/recipes-devtools/go/go-1.11.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.11"
-GO_MINOR = ".4"
+GO_MINOR = ".10"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -19,5 +19,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "a77697673215be465d1b583680ef2318"
-SRC_URI[main.sha256sum] = "4cfd42720a6b1e79a8024895fa6607b69972e8e32446df76d6ce79801bbadb15"
+SRC_URI[main.md5sum] = "f2d2e44b9954b827daa8ad4d936a7a82"
+SRC_URI[main.sha256sum] = "df27e96a9d1d362c46ecd975f1faa56b8c300f5c529074e9ea79bdd885493c1b"
-- 
2.7.4


