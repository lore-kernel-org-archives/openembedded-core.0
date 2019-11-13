Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3950D7F685
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:20:09 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x28so1870833pfo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UnB+qFtf7XRTf1acXkY+pelryarBLz4L3x6kJa6PSfw=;
	b=SSAXnmWwiHokAbx6dEZF8a7NEYzqsUzBWLia7fXEzZq7pR9wOLLua3yMJIyTYldwBP
	hQ3OpIMDYOCMCGuheotqkqAwxBm9TgFS/4ofgi+q2j4XU/ozLU+iOpbILZyoFFKWqs6E
	EXwjMepC1UUSSclgPCupjcs9hSLVrPbZ8m3biqNMRX8mjzfuEsqmgI6QsTJcUI9e8BmI
	FAdqDVqvWtjFxFzGCa6sN0Is1GgRxB8mFBd2ivSEjj6uNGx9B5vql8Am1kVzipBYB5tm
	YwuNYDC4HwFIe6dDW/+kfIVQj+5vkGrm2nykaFDUDELaDXl60mT5g0+Ls9igLgzCIrJf
	8lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UnB+qFtf7XRTf1acXkY+pelryarBLz4L3x6kJa6PSfw=;
	b=TIE4FRx/P2oeoxvobRKnC8/oAWM+v6Z8VtAKGG9UpKdNouTm3pikjANmGeneLn5Pc7
	ydgOFrpjMALokSElRWHY8CRguerZPqG3FA5fqWEeZuMrzhfAji5GJMkdui3+gig4cwIg
	goSQawTLLthBy9dZTL8pKhrHPcndKJJZ7eTL4HftZ0mXfGG230niu8WwErsmu1Wm30wK
	oYa2GazHrcoKyO+MsM3F9xayX2Of0u4HE4NtZUBDv4LBzf15LJcZ2Vduo4kgkVHiMbuI
	6WxVkIC0fPC5/kvKCAYdpHh+k8+7jx10CBie5urJpRXkk7oTo1ydOU65sTfV56/2j613
	FDWw==
X-Gm-Message-State: APjAAAWAPdi4LDE/LjKk12Ld9iOghlE+BnSBKy9Gs5EcgXCMW6TAiSK7
	rigvlbfUi/Yig7yu5UEpj36ZAs45
X-Google-Smtp-Source: APXvYqzXe/8lm64cehic0qMTszdE9bmj1Bp5ToEZztH02+YyTsQfOFj3lDOmx+ESBl2RqPi4kXltew==
X-Received: by 2002:a17:90a:1424:: with SMTP id
	j33mr5859674pja.2.1573658410000; 
	Wed, 13 Nov 2019 07:20:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.20.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:20:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:27 -0800
Message-Id: <fec797a6ae981efa81896fd915933621699bca4e.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 24/25] patch: the CVE-2019-13638 fix also handles CVE-2018-20969
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
X-List-Received-Date: Wed, 13 Nov 2019 15:20:09 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
index f60dfe8..d13d419 100644
--- a/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
+++ b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
@@ -6,8 +6,8 @@ Subject: [PATCH] Invoke ed directly instead of using the shell
 * src/pch.c (do_ed_script): Invoke ed directly instead of using a shell
 command to avoid quoting vulnerabilities.
 
-CVE: CVE-2019-13638
-Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/patch.git/patch/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
+CVE: CVE-2019-13638 CVE-2018-20969
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/patch.git/patch/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 
 ---
-- 
2.7.4


