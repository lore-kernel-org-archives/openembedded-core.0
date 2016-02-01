Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 62D3D7717A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 17:54:31 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gi1so7524355pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 09:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=26/TFVQs3y7yiw2vormNctaTIvbW8KxvJ2RNL9vnMiU=;
	b=iOqU+JC4aDgJ9opogKPGeXN+jb1PokPEm3GyooFVnHi1w8fTCyleU9yThQXDKmPEBm
	SQUkacjGCeBlsCX+4w6K0rXjbepgcyfvvPq94GWcu1ZHXDN00KuV4Uyb54hqnR0OBNUV
	LlnLxAUY05gcgExhBc/rDfjVMJPtLDnd0KNRUxJA9hxGWt9FJvsUBoYobZbW8yn+iAUo
	b9QbpygZxJ9yaZWVcRJdCjWuPbATQdAHP9FX54HmODzh/9OHoB0NmOyCvsdtxjX7nmEq
	XH7++iKcVt+5QxEqyklyFznssF7F9j0t5rRhlT/oLVOkerBACg5seIruAzPzd96djf3X
	t5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=26/TFVQs3y7yiw2vormNctaTIvbW8KxvJ2RNL9vnMiU=;
	b=TrARBoXis0S1c7Um58ciZxBBkZuE9wkjNZVIdH/BjuvzEazRq8i6faTvOZZI49VaqC
	0QEdQXXLHuqAvrBXmQVQGPg6QkiB8pSH+R9j51yZF0j9WRBobQ9tzuxMUMRZa4HTR+9L
	OcIGGbefU4U7ALpsGUtyPWpWY6J5IYenetKirSLKOdmmFBH5iHHYZh5nM2zo2nwpGri6
	kh65aq7HwFajmoZv+27NHamZWK7DnGFgcjKFg5MEMIPTi0XtEuSKqZ7MkvKhTK3xMUOU
	+F4WWH3htd1V+vSclZEByc7kzEypkWlYQSamqoYmIjTTUfxEjBW6YQJ8xZfuPiyPcWKo
	W2BA==
X-Gm-Message-State: AG10YOTJjqt3bBKh0HVTx4/8XNTMMNS50i6fDaXEMHIHtv8BtNN/MntPPjh24IVlKSRqHg==
X-Received: by 10.67.14.168 with SMTP id fh8mr39929485pad.11.1454349272434;
	Mon, 01 Feb 2016 09:54:32 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	85sm30790130pfl.18.2016.02.01.09.54.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Feb 2016 09:54:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Mon,  1 Feb 2016 09:54:21 -0800
Message-Id: <1d9edf46419c44c13817714e0a14b882006ec32a.1454349039.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454349039.git.akuster@mvista.com>
References: <cover.1454349039.git.akuster@mvista.com>
In-Reply-To: <cover.1454349039.git.akuster@mvista.com>
References: <cover.1454349039.git.akuster@mvista.com>
Subject: [PATCH 1/2] foomatic-filters: Security fix CVE-2015-8560
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
X-List-Received-Date: Mon, 01 Feb 2016 17:54:31 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8560 cups-filters: foomatic-rip did not consider semicolon as illegal shell escape character

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../foomatic-filters-4.0.17/CVE-2015-8560.patch    | 23 ++++++++++++++++++++++
 .../foomatic/foomatic-filters_4.0.17.bb            |  3 +++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch

diff --git a/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch b/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch
new file mode 100644
index 0000000..dc973c4
--- /dev/null
+++ b/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Backport
+
+
+http://bzr.linuxfoundation.org/loggerhead/openprinting/cups-filters/revision/7419
+
+Hand applied change to util.c. Fix was for cups-filters but also applied to foomatic-filters.
+
+CVE: CVE-2015-8560
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: util.c
+===================================================================
+--- a/util.c
++++ b/util.c
+@@ -31,7 +31,7 @@
+ #include <assert.h>
+ 
+ 
+-const char* shellescapes = "|<>&!$\'\"#*?()[]{}";
++const char* shellescapes = "|;<>&!$\'\"#*?()[]{}";
+ 
+ const char * temp_dir()
+ {
diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
index 790c981..7d0d717 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
@@ -17,6 +17,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca
 
 SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.tar.gz"
 
+SRC_URI += "file://CVE-2015-8560.patch \
+           "
+
 SRC_URI[md5sum] = "b05f5dcbfe359f198eef3df5b283d896"
 SRC_URI[sha256sum] = "a2e2e53e502571e88eeb9010c45a0d54671f15707ee104f5c9c22b59ea7a33e3"
 
-- 
2.3.5


