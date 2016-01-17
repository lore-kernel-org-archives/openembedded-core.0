Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6729975C51
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:52 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id e65so142598195pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=cQRakqP9AhaMH1SFftPWme7zVwgvpQ7Mj+bPjN+PAlg=;
	b=LZ8jbQ7m9O5N3UNxyshop+Tc5nxZIqqYK49nzm7SuLowXOFaJmmmux/di2XNEj3iBQ
	tkYYgX5UZNCv/7Kqdx5eBncHR4Ft6EruZQkQWdPFwPivoNxJmbGVv0Kz4eo863EHKMDp
	kY2myjXOO9welrQ+m51ToMkevbp+yxal7JY96v4KD6JEHCEHynlx0naTCMpixec6N9RT
	T37kaLCV/MAkXYspbw+X1ChlBz4QEuf8J5xYHtFQ8/FDONSNbnTVpmJdLbXQriw6DkKS
	jc/UJq6xyJYv8XVatOVvcxV9TmBZOUI1Uy6+3jn+PNvWxm7OVYa8BD0+UJ9zdLwCjr0+
	R2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=cQRakqP9AhaMH1SFftPWme7zVwgvpQ7Mj+bPjN+PAlg=;
	b=Yaf5YhG6AY4u/68+Ep0XGsrf+0obF3c02WtzqakB1fk3VnVQEMFGPomkB33shlus6Q
	kSgxThYldJsefRFgDt0lNJKjPouvhOr4H0EBqdtEPy3Bf/mOFW9AlEz5eQER/xydNCO7
	fZGMr3NscSBef4pI7ywoweuvRk4g12pMxqn7B4nOOhChmDuOYsMXyJBY/DyKBzChQYWi
	wMpiXbJc9JkizUVTEGy9MeXsAGaFIe14tUkB+lz2masdspj0mn132eVloevkEQJICZTm
	8yYXYsu2UXEjwqCQJETiOWvptejw01us4CKeLZWizca/k3NHGDhOV4Azfm6WNT3z0QF2
	3blA==
X-Gm-Message-State: ALoCoQl0t93D0tRpYNvB08PhSLoc6cASyvdy5NAI/d7StFeMZ73KoH/6C+jQZcQZsjXBDPJDydbIQ9vgQY6op/9PLB6dg33Rjg==
X-Received: by 10.98.42.81 with SMTP id q78mr28146776pfq.142.1453030673471;
	Sun, 17 Jan 2016 03:37:53 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:33 -0800
Message-Id: <c36daa51aaacdaf7ea41d734757fd4a615a087a2.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 60/73] bsd-headers: Package cdefs.h
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:52 -0000

Its used in several packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/bsd-headers/bsd-headers.bb       |  2 ++
 .../bsd-headers/bsd-headers/sys-cdefs.h            | 26 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-core/bsd-headers/bsd-headers/sys-cdefs.h

diff --git a/meta/recipes-core/bsd-headers/bsd-headers.bb b/meta/recipes-core/bsd-headers/bsd-headers.bb
index ae659ab..12a2cca 100644
--- a/meta/recipes-core/bsd-headers/bsd-headers.bb
+++ b/meta/recipes-core/bsd-headers/bsd-headers.bb
@@ -7,6 +7,7 @@ SECTION = "devel"
 
 SRC_URI = "file://sys-queue.h \
            file://sys-tree.h \
+           file://sys-cdefs.h \
           "
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
@@ -18,6 +19,7 @@ S = "${WORKDIR}"
 do_install() {
 	install -Dm 0644 ${S}/sys-queue.h ${D}${includedir}/sys/queue.h
 	install -Dm 0644 ${S}/sys-tree.h ${D}${includedir}/sys/tree.h
+	install -Dm 0644 ${S}/sys-cdefs.h ${D}${includedir}/sys/cdefs.h
 }
 #
 # We will skip parsing for non-musl systems
diff --git a/meta/recipes-core/bsd-headers/bsd-headers/sys-cdefs.h b/meta/recipes-core/bsd-headers/bsd-headers/sys-cdefs.h
new file mode 100644
index 0000000..209a623
--- /dev/null
+++ b/meta/recipes-core/bsd-headers/bsd-headers/sys-cdefs.h
@@ -0,0 +1,26 @@
+#warning usage of non-standard #include <sys/cdefs.h> is deprecated
+
+#undef __P
+#undef __PMT
+
+#define __P(args)	args
+#define __PMT(args)	args
+
+#define __CONCAT(x,y)	x ## y
+#define __STRING(x)	#x
+
+#ifdef  __cplusplus
+# define __BEGIN_DECLS	extern "C" {
+# define __END_DECLS	}
+#else
+# define __BEGIN_DECLS
+# define __END_DECLS
+#endif
+
+#if defined(__GNUC__) && !defined(__cplusplus)
+# define __THROW	__attribute__ ((__nothrow__))
+# define __NTH(fct)	__attribute__ ((__nothrow__)) fct
+#else
+# define __THROW
+# define __NTH(fct)     fct
+#endif
-- 
2.7.0


