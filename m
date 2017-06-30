Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 735337825E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 09:25:53 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id g21so9579053lfk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6uebA0a3ywOA+2hXSI1bpUryenq1MNcA6ummvZ7k3XM=;
	b=Xw00CIvkkAHutSeA41pVrPHR2cRADX29NkrUs2Z8qadXUOUrDNZvPYGVRsA4XrP2C5
	l/Xo+u3/slISq42UC2P0kkz2buSeodBWEdlIPhBjo0OiDYzD0djsQQZPVJ1/zGbJcSom
	tLMII43Qgmsdjewp8kzWyUjINQf8Sv9S9fz7lMQcaWRMa+DiPm+oSktq8uBYTcpHU5Se
	sqZmYYY6CzKkw/G/b4+OoHxOH1wqjZGom/SRWUSBNoLwRE/EmrXsVfoTE/Aymh8wGXUE
	gQhSiFF+UGRlcI/57IUIPnWozp85nNY9EmpFrq1zxbvy/16ou19CvfFw0nUf/4FlWjM5
	EfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6uebA0a3ywOA+2hXSI1bpUryenq1MNcA6ummvZ7k3XM=;
	b=PItQ5Bb6WYxzFxk+Ynh8Vo5SNltkjW3NlEMYalWO0x0oARezfNoFWKZYoBETif4EBL
	ZxWo3BMYdwyEQ+/MnmeJaZMFz/Mk2UJDZcjqOckVN2uKHs9gYMktNz8u3XPUpDGY0Yc4
	ep30R4UBIsJJALQj17uX4qKVXOcqKKkwJT8Pb9my9eubcHpzdtObCR1u2mtKA2w31SPA
	dFCBwLpbVGwqsOjWZRc1El0nP2tinGTSR8i0QqSkcI1/YyTzYrccZkDbGQYArWU7kY9n
	yyMx7sp6imFgZaSkhzgqauHLZRr1fITqfCSvXpU2e/bCHEWOC43d6gZyQmam0iFtGSEt
	Vg4g==
X-Gm-Message-State: AKS2vOxkL6wEQNPmQCa+kYtA2kVJydg+jbU4thigvYqMchpjHdBAX6HB
	sQMIGQSGK3wr0QShhCE=
X-Received: by 10.46.83.75 with SMTP id t11mr6244167ljd.28.1498814754203;
	Fri, 30 Jun 2017 02:25:54 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	g133sm1891377lfe.40.2017.06.30.02.25.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 02:25:53 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 11:25:43 +0200
Message-Id: <20170630092543.3151-3-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170630092543.3151-1-ricardo.ribalda@gmail.com>
References: <20170630092543.3151-1-ricardo.ribalda@gmail.com>
Subject: [PATCH v2 3/3] libgfortran: Add missing fincludes
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
X-List-Received-Date: Fri, 30 Jun 2017 09:25:53 -0000

ERROR: libgfortran-6.3.0-r0 do_package: QA Issue: libgfortran:
Files/directories were installed but not shipped in any package:
/usr/lib/gcc/x86_64-poky-linux/6.3.0/finclude
/usr/lib/gcc/x86_64-poky-linux/6.3.0/finclude/ieee_features.mod
/usr/lib/gcc/x86_64-poky-linux/6.3.0/finclude/ieee_arithmetic.mod
/usr/lib/gcc/x86_64-poky-linux/6.3.0/finclude/ieee_exceptions.mod

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 3b94c1b85b70..5f5d4af7589d 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -54,6 +54,7 @@ FILES_${PN}-dev = "\
     ${libdir}/libgfortran.la \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
+    ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude/ \
 "
 FILES_${PN}-staticdev = "${libdir}/libgfortran.a"
 
-- 
2.11.0


