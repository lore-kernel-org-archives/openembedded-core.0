Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id B4F557E95F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:52:43 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id t28so2863862lje.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=fn7MsOAZd4NFUELKzdUPaPCfTMoJgn2lIKT2VznHz6I=;
	b=YgSXyh4eJLJkRRiY8sFszq0XpoJ6zAApisUn3DcpHXRYzD+x75UELszMz5ypP/fT5z
	pxZfD9boT0d0Ho6GQQ6lSvbVYYT9RXEgW4RdGR9tX0wAA1boTweJ57DHk+3Pk5geK+ET
	4mz3qe+Qq8smOcsE+CCNzq45qiGMa14KMsU6sKk2hUs/FbatTQUQA9ed/qIgH6WSVA8b
	EHmeCmwyHYXR+kMMlg18lVfam8MRdHbL7JVX+GrMdjCwe91ik1ttYe7a1v0XxUGkFv56
	PLT+FiCVX7X1iH67+Vh7sa9ywLeYiJx3gohq+prEYk7/bsEE7udA/dpD3jGiy0pkOoxO
	4sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fn7MsOAZd4NFUELKzdUPaPCfTMoJgn2lIKT2VznHz6I=;
	b=ZiFS4c53w8U1Hs3Xk/JvKGofACKa3k6UaV7IvIMquVURa1y9mQ2d1rVn8ZIjcpLo0V
	eMHqvDrXYjGI0Khq5mhgwBTHKWavczPX7jB/qh4JZu/V7qobCWfNQ52QFK48E/bYqQ9w
	re2E1PqMfOW+dNVYM3izSUsPCy+NICjMHcDky/zvrPwT64MreGK4yRnUV4I+f+GRtoEI
	cAxxKdhpm2h+P70ce3A1wSwegXFS5a9czziKJ06tx5qsCWHp49upTAGOD4PXrMesMFG0
	D5toG2FTazWJJkJm4zVrJvfJbkBzxYb63NC5t0ETmuHMsCLYqzWCCkzRwQZx8H86iN/R
	I0iQ==
X-Gm-Message-State: APjAAAXQZmHEBOueYZrCnu2NjOXg9tGDA8ZEJxnmaR80QxjAdJRJUkio
	R4QFpBaLM9qnSFkSN2qObDnZtsYn8ic=
X-Google-Smtp-Source: APXvYqwGBVRhfL8lkcqhV94Umb7Hld0xZAyeEF3wB7zJ6gljWeJj+aZuvd6CdPN8whmvhS1To2WaJg==
X-Received: by 2002:a2e:8846:: with SMTP id z6mr3030331ljj.20.1561650764183;
	Thu, 27 Jun 2019 08:52:44 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id d10sm493722ljc.15.2019.06.27.08.52.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 08:52:43 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 17:52:42 +0200
Message-Id: <20190627155242.16307-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-pbr: update to 5.3.1
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
X-List-Received-Date: Thu, 27 Jun 2019 15:52:44 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python3-pbr_5.2.0.bb | 5 -----
 meta/recipes-devtools/python/python3-pbr_5.3.1.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.2.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.3.1.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.2.0.bb b/meta/recipes-devtools/python/python3-pbr_5.2.0.bb
deleted file mode 100644
index ed6832e4af..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.2.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-SRC_URI[md5sum] = "2bca008fd08d035a2f78c606d876a6db"
-SRC_URI[sha256sum] = "d950c64aeea5456bbd147468382a5bb77fe692c13c9f00f0219814ce5b642755"
-
diff --git a/meta/recipes-devtools/python/python3-pbr_5.3.1.bb b/meta/recipes-devtools/python/python3-pbr_5.3.1.bb
new file mode 100644
index 0000000000..12892b60cf
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.3.1.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[md5sum] = "bdaec663a75d10e9e0f2224afa3a1318"
+SRC_URI[sha256sum] = "9181e2a34d80f07a359ff1d0504fad3a47e00e1cf2c475b0aa7dcb030af54c40"
-- 
2.17.1


