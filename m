Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 32AA17210C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 16:19:12 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id fp1so7415704pdb.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 08:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Vb5erGxHsE0VkNCdwoixWk4Mg79yY1AZhCtmamzukxQ=;
	b=IMoQzvGPVtVJnNLJvHeskk+MwRGh+EvvRRBi3YAgXw/uLYNyjNv6pzefsN/UrPw4oF
	J+2R5kkItqoATzlvgDOO9/K5k0qu/xDMYemH8f9ON67w13M+V1XSgmSdUG6Qnqw+JNt2
	cWEqtAl6M5vcQQUYpCEwdfat26HH+qyKebETpOGkrXumAd7O+zdcYeNNCjITmhvrf6mR
	w5kdpo0dJgdRcXHojYS9Z9cI3R4UHncCk3C/ygiixxfmko8ab2klOGOPUMb1t85rLIoh
	xZIAqT5b4yPVtVqL+fLcBiT3x/80OHW9wLSv53IVhRjFUyrV8pxromMR9P6FxXlECbv4
	u2Ig==
X-Received: by 10.67.14.129 with SMTP id fg1mr18227413pad.114.1416327553447;
	Tue, 18 Nov 2014 08:19:13 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	ex4sm38470695pdb.17.2014.11.18.08.19.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Nov 2014 08:19:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Nov 2014 08:18:31 -0800
Message-Id: <e69653b01dd8ad9fda2355b8112a65c813ce7fd5.1416241492.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416241492.git.akuster808@gmail.com>
References: <cover.1416241492.git.akuster808@gmail.com>
In-Reply-To: <cover.1416241492.git.akuster808@gmail.com>
References: <cover.1416241492.git.akuster808@gmail.com>
Subject: [PATCH 6/6] tzdata: update to 2014j
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
X-List-Received-Date: Tue, 18 Nov 2014 16:19:13 -0000

(From OE-Core rev: 3ab9dfb703835fee21fd73c4e5cbad1c34c6a163)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2014j.bb | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014j.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2014j.bb b/meta/recipes-extended/tzdata/tzdata_2014j.bb
new file mode 100644
index 0000000..f0388c2
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2014j.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "2d7ea9c309f0d4e162e426e568290ca3"
+SRC_URI[tzdata.sha256sum] = "a2d870320694d40535df822ac8074dc629a90e92abafa5d3373314f78ddc0e0d"
+
+require tzdata.inc
-- 
1.9.1


