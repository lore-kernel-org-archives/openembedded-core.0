Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 049977EE16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:38 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id y8so17889404plr.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vt3k/KwEIzIPAWv/ah4tguWFDOLXf7/zEaeyrWZUM1k=;
	b=Fv3roeyiPomC51+9zG3FSY0NcKvgBXdxKAnZFV2USLKftObsL/oQAwuJrSy80N0CfT
	gnuQSmBg/OItSruA2ypOykZfBlr3fxC1t79JS4H7E2DNuOZFCsk1+7Os6Fl2jIi25wJ0
	KGHnuBDJLx3zE5zclQ3GnR+DavSdPvIMx4exvbaSe63xMfRAYthSgC52Y5NApP3xoapt
	4JBU77k81UzQhaHFMh5iYvaVlfq5KH7oF897yaRCoQAHC6ldjZgtAyJ9NvkB8lYpOHSD
	JM+hrK7bcGFxjIlCHA2uo7lzicsodRSYlEaQSscrvoVdzbcTrdl+y/djmeKD+cfNHP3i
	PKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vt3k/KwEIzIPAWv/ah4tguWFDOLXf7/zEaeyrWZUM1k=;
	b=OkkqN+NDX2u8w58o/4eRuodNdxu0dqs8t08edAOslAx2UOi5n4/IPwyGUCijQ6FQZk
	sDEV5FyUf4nEoA+qqOYB8wthxN1nlbazbbtaZLzXy31hozhhJ4VMS550E27yQ32+MBgG
	A4UJu4sXlAKjfsHkMkfa0RItZMTIPyiUYdwEYyf5EUT/uQrlht85Cwb/wl7vuYa05Mox
	JNYIxN+PlRuLhSDgrhY4DtO8DLj1s4Z+tN7mKWPrS0H/vaUphsC2CC295vFEzxp0pfA0
	ZqjO+2aklPdGkOjFEp6/1H6lTvWDmWX98IEWrj+JSuUl+IeFb+9usATvM5scXHCss/qC
	VNqA==
X-Gm-Message-State: APjAAAUOLlruu6uTyPw6ldrxQL/zVDBcO+cS6qtXL81c0lgmCKTOFb/+
	IsAQy5WwgSsUZb8Ij5pxaZ8bx2tx
X-Google-Smtp-Source: APXvYqz84LJj77Vf6G/Ap46RPkIUe/nRhjd8gjTZnxtgxYUUgyq9gobWaHw1uD8aWfwXx+oo2PCt+A==
X-Received: by 2002:a17:902:aa41:: with SMTP id
	c1mr69610737plr.201.1563719139166; 
	Sun, 21 Jul 2019 07:25:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:04 -0700
Message-Id: <4e40da53851c550f1a38eff5737d4b69c8cd0afb.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 15/30] go: update to minor update 1.11.10
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:38 -0000

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


