Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id CCF107F845
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:50 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b19so1903318pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UnB+qFtf7XRTf1acXkY+pelryarBLz4L3x6kJa6PSfw=;
	b=GBd4hTLDqRDLmErNKt3wzw3TeChDDOJmQua+azvxeKytMiff3idMxuGhQmjOf1ks0u
	vqS89YlT9IQRHXgDuAY+VJb5VlWKHzSmznkFPUCrSk55rhtZDhsX6Jrn6lxF1KOjkLjA
	PbGuQ4lkVmGcHjTwoy050sMt8kvUCqc55ZlMe1PkkgddNC85Wc7aKXc4z1AzRDox0B9i
	lyAqK/tqE58M59Gp7V23Kpt8PjteVcM9WBRz/kXvvTUDOFkATG1jPUQddFIN+/nCvGu1
	G4dggZG97G+D9ak7FuIBeO9/nkLKYcT0/SjKcaUNkduW6rWk15KEJCiubIwlRudNfB3c
	JQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UnB+qFtf7XRTf1acXkY+pelryarBLz4L3x6kJa6PSfw=;
	b=TsGb0XDCOhVMLg3s+aQxY4uB6loWGDGxDkmmrAB664hT1GpcTbkEsjvkJhOugzg4Sp
	XtvqX5pxFEv7vWEkxDltjle40TO/gmDeo4L0nQKzWc03XE+tzTcivA0ePUZ7vZpg4BOP
	58EBQ5AnTsIsFqsVpjdEvP5L1vFJmqhNoLRtX4gWwxucPHhJyNi4B9sBXznfUN1wtzPb
	RrD4cNSU5UgNAWF2UZUGbwh5L+Csaqt6vjYnzyGyqbj0poR/aFyn5ubzHXjDoc7IqjCf
	wl3EW0CEnbHjxJry5qEUflvbyZPD5JnLdKFY7OaaR+apA+wZJnEA8tiJrVKPqI6StO/T
	rfKA==
X-Gm-Message-State: APjAAAXGhqiVS5tf4nDdOAqgOCF4So6lsvh4sIHkg59F5Imb9H8LNN5Y
	/gm3EhXLnvcJmV+u4ozgKU/1eCaM
X-Google-Smtp-Source: APXvYqxNLsvAUSja8y1MWQTtssbAMXMmaYARCzwzcvqTJnUtL4if5YzcyH4Mtxdp/GgZ28KaMFZz7w==
X-Received: by 2002:a65:6704:: with SMTP id u4mr4450006pgf.419.1573659171613; 
	Wed, 13 Nov 2019 07:32:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:32:08 -0800
Message-Id: <41b1d53cea0302f1c3954c6ab048366c908cf754.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 26/31] patch: the CVE-2019-13638 fix also handles CVE-2018-20969
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:51 -0000

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


