Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9077FFD0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 19:27:55 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id m13so2211752pjb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LM9bvfol8y7ho7c7Yj0MdDnS6z65v/UXPbMZK1Qea/E=;
	b=LSZpf717e8AzfJIHXDHfFm9XaoDC6NJAx9aGjvpgB0DHKOXaDs8mfXAH9KOYDjzshg
	x9AQyRZa2eGMlTkP33YHWmHQaGfxB9sW1T8e7GIUWRKBbdmqnDY7Ag9bz/PuE7MB1iUh
	seyqpeba7pWMVsH0ydnQt0TNFsdMLxgFSgDcZob8zHi7jVzCz6+k8Jm4LLGSO+TcHtYB
	+R9tIDT19+PrbNf/h03W55eRtuiZ8IwZJ/Xu8B2/PgrGl6ttZq5Xyd238xZV9450a3xt
	Ky92CTvuI1E6XRjpFIZuzjrk7WBiIVw7ohb5xFgKgWOxLp5LTQr1GKZFl6owPNLJUSjP
	+lxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LM9bvfol8y7ho7c7Yj0MdDnS6z65v/UXPbMZK1Qea/E=;
	b=DxdE6nv9x96b7iQ55y8NTjQIykbjteIeV95U92+TyXRJlvh2FpTuAxzfmlWjzAe7bs
	FYu/rFP4XAFCTkH0kWtNlCYn3dINGxftQeiy7hqZNO1RUZjH8VFtu0thrpmRucNlG9Bs
	aMC5mesKutEtvOS4lXi8146P4LujXmaFeMoBBI12qHZVCp69zwcl41jIfHLnkGc2Klvr
	vfZD0Fb9HNNyInJfXAxWTz+3RUC4gF6kdtZY3t0REHofjTxr0tONiGp6C1/NKA2IlHFR
	7U8T7JVFnxCq0XXM9CHXseSAKBCOqaWV1OkFWqMA7KFavcPXoBYBrHYU4hU1heUGyKPP
	5jOQ==
X-Gm-Message-State: APjAAAU/gkbvz9s1F/6vLFKRv1vjVponcB0HQBI2Vls2UXrTonEISAup
	90dmzk9DzgrQvjbRPX8sn8ueoY+nEx4=
X-Google-Smtp-Source: APXvYqwwYp+EULj9d80TqFn7v5SF4eTQPECQM+wrzz13Lm21zUAkhf03GLy1vO+O9ZaYIv5T0ALuYw==
X-Received: by 2002:a17:902:8495:: with SMTP id
	c21mr14448352plo.279.1580066875957; 
	Sun, 26 Jan 2020 11:27:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u20sm12987091pgf.29.2020.01.26.11.27.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 11:27:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 11:27:45 -0800
Message-Id: <7f030538e2e5e4b70e89c6f70ce847d7b152efe9.1580066507.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580066507.git.raj.khem@gmail.com>
References: <cover.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/13] gettext: Drop overloadable attibute for getcwd declaration
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
X-List-Received-Date: Sun, 26 Jan 2020 19:27:55 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gettext/gettext-0.20.1/overloadable.patch | 22 -------------------
 meta/recipes-core/gettext/gettext_0.20.1.bb   |  2 --
 2 files changed, 24 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.20.1/overloadable.patch

diff --git a/meta/recipes-core/gettext/gettext-0.20.1/overloadable.patch b/meta/recipes-core/gettext/gettext-0.20.1/overloadable.patch
deleted file mode 100644
index 1b41cb464e..0000000000
--- a/meta/recipes-core/gettext/gettext-0.20.1/overloadable.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Use overloadable attribute to aid clang
-
-Fixes
-dcigettext.c:147:7: error: redeclaration of 'getcwd' must have the 'overloadable' attribute
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/gettext-runtime/intl/dcigettext.c
-+++ b/gettext-runtime/intl/dcigettext.c
-@@ -144,7 +144,11 @@ char *getwd ();
- #  if VMS
- #   define getcwd(buf, max) (getcwd) (buf, max, 0)
- #  else
--char *getcwd ();
-+char 
-+#ifdef __clang__
-+__attribute__((overloadable))
-+#endif
-+*getcwd ();
- #  endif
- # endif
- # ifndef HAVE_STPCPY
diff --git a/meta/recipes-core/gettext/gettext_0.20.1.bb b/meta/recipes-core/gettext/gettext_0.20.1.bb
index 3b576f45e9..214803f767 100644
--- a/meta/recipes-core/gettext/gettext_0.20.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.20.1.bb
@@ -25,9 +25,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://serial-tests-config.patch \
            file://0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
-           file://overloadable.patch \
            "
-
 SRC_URI[md5sum] = "bb5b0c0caa028105f3ca1905ddc306e2"
 SRC_URI[sha256sum] = "66415634c6e8c3fa8b71362879ec7575e27da43da562c798a8a2f223e6e47f5c"
 
-- 
2.25.0


