Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 59A5577389
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:53:33 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id yy13so2541856pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Yk3L5Rgg7Fazklb/QZS/FvHkZwxTu/miKHiJiH9VUc4=;
	b=C9zna8pyFIvwqKx2bFd7Evrbh/SLcR+1wHI18X15WowaSdDhzUlJFis5A07YjkNttp
	mp2kwLOhEMFHmm3JeFAFH3C2pCBqmcfkPL2qtpX55/j1j/raXEsE3gQXMg8H2PFfkUyp
	UR0iMqDVF+zYwKBs/Y+PAwgEGUTaByeZinkuXUSZrcbTecqBp0GeM8WiIrIOU2894R73
	HfQzTNr3a7ReBm/VVxuvhCppBQdR5to5OjDBQ33ma7E7v3OXc4OTgw20mboL0fJAlXdd
	WULHO+cQ8RgG37F3FStkI+K07z5LPmP8d2DdJh34r4Da58rZWvCNYYbeOvxEjhfJ2Qx/
	vz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Yk3L5Rgg7Fazklb/QZS/FvHkZwxTu/miKHiJiH9VUc4=;
	b=mgA0JlqwQC1Td3rtYWtS5rf0ZQPVtzlsuGRqQzi2TcUCQ/sUL/cuVGsBtmLj5xoCbg
	JigkEOI4cknjy0qGkKkRtpA1iz57H0cCDodBhObIlBddkw7mDhEJg9eCavxll+Wn6iUJ
	XHuB/bPth/JoSYsoLcH5Y9Iaf3njay7nk4AEWad9xycHuH2EWtumiIwIIanPREqYNKE8
	KSccJwatkKxZAXOEKDxu20YDtM+9EoyyAwt4ilccQlNP29Bec1LLjNjRshf4MU5ohHp6
	E30iPbZvvNyQsKCpoualwXbkb4/EgGmOsW0iizvPLi4ZqzoImKCw5vzZwzmKmPJkDYdN
	oW5A==
X-Gm-Message-State: AG10YOSgaM4p4tuxNYgMARw51aHg+eAnHqdeM6+Y9E8XnDtKse7fhq+F+3JsJf3d4oH5xQ==
X-Received: by 10.66.185.225 with SMTP id ff1mr20103021pac.97.1454684014795;
	Fri, 05 Feb 2016 06:53:34 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	o184sm25144290pfo.36.2016.02.05.06.53.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 06:53:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri,  5 Feb 2016 06:53:20 -0800
Message-Id: <e3836ae4dbda805fe8389ed19b2cf55c4dc850ec.1454683625.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454683625.git.akuster@mvista.com>
References: <cover.1454683625.git.akuster@mvista.com>
In-Reply-To: <cover.1454683625.git.akuster@mvista.com>
References: <cover.1454683625.git.akuster@mvista.com>
Subject: [PATCH 1/4] foomatic-filters: Security fixes CVE-2015-8327
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
X-List-Received-Date: Fri, 05 Feb 2016 14:53:34 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8327 cups-filters: foomatic-rip did not consider the back tick as an illegal shell escape character

this time with the recipe changes.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../foomatic-filters-4.0.17/CVE-2015-8327.patch    | 23 ++++++++++++++++++++++
 .../foomatic/foomatic-filters_4.0.17.bb            |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch

diff --git a/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch b/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch
new file mode 100644
index 0000000..aaedc88
--- /dev/null
+++ b/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Backport
+
+
+http://bzr.linuxfoundation.org/loggerhead/openprinting/cups-filters/revision/7406
+
+Hand applied change to util.c. Fix was for cups-filters but also applied to foomatic-filters.
+
+CVE: CVE-2015-8327
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
+-const char* shellescapes = "|;<>&!$\'\"#*?()[]{}";
++const char* shellescapes = "|;<>&!$\'\"`#*?()[]{}";
+ 
+ const char * temp_dir()
+ {
diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
index 7d0d717..58ef1f5 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca
 SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.tar.gz"
 
 SRC_URI += "file://CVE-2015-8560.patch \
+            file://CVE-2015-8327.patch \
            "
 
 SRC_URI[md5sum] = "b05f5dcbfe359f198eef3df5b283d896"
-- 
2.3.5


