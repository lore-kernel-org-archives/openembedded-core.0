Return-Path: <joe@deserted.net>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 94E85776BE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 13:56:19 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id 68so7984844ioh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 05:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=0qeJuE9ViAG6VIJHKswIiNXuzUj1/s+TX5B9dYLkIyo=;
	b=Sp1HqrWgtRaxwpmqIVmY9kPr1tVCvaC84fa8ZU/pU/rVKu1qZEvB+cyqgkHqHjbnSZ
	OFuEY6pldvvkh/klgceXduw9UY34TOrjI0PRtLvygv65PjJ/scaDkFpJjftSGf/wcSU2
	c12KP8kYcWHKroUasJzqjZkEY/weGGu6Z1/NUKWXNUzi13kKwva3ctOfUjEOilxlejc4
	Ny19Gggp3i1Xb0nJRhz4AJi23AlaedcA4d1oviFAmKCXlcoYvz6GWJQCFQyiRzOn7f0M
	6GDg1l+MwZI588cE9nDN+3UYcs4pTXnio5bV4RrOiQ0GYbvdLUadUZQRdsMOd3RBm6VB
	8jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=0qeJuE9ViAG6VIJHKswIiNXuzUj1/s+TX5B9dYLkIyo=;
	b=Dt+SwlJ7Jsp/GcIC8gRjU82TcRU08Z32EzCLZzkxZofpSPBdmfi8HRZjiC17J2lEzR
	bxvNFafs2SmVyjjOZGAlvdPSUJ4pcFWmzr7C4FCOrnH/e5ZAOpi2EGIgxLKtWwF4bm/X
	JZ54CiQNAofQXL7bnSzqeb90J4jlcJvrakcSCtvJRk/+EXRHcPwiR1zigLcWhJus7b0O
	xWnbKDEz1kK7Y3zCz3kuSvXCp/Fw1hLMJMgl+DWfKhp2FPUUSG1WPQ4L4wScsfat1qGZ
	3BcQe2GzJIX2mWB2PY0779TUwzAQtTklh3eznQSCOK5POQkvpcxfVXXu7hPRCxa8qiip
	CmFg==
X-Gm-Message-State: AMke39k6697wqskE7g2kDow32Sznq/xk4hqJPTS2ru+iGW0pUukadZUnT/pgTgOYszkzdA==
X-Received: by 10.107.56.11 with SMTP id f11mr2751191ioa.131.1488549380815;
	Fri, 03 Mar 2017 05:56:20 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id n6sm870641itb.25.2017.03.03.05.56.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Mar 2017 05:56:19 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 08:57:24 -0500
Message-Id: <1488549444-20010-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
References: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
Subject: [PATCH v4] deprecated.bbclass: Add a PNDEPRECATED variable for recipes
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
X-List-Received-Date: Fri, 03 Mar 2017 13:56:22 -0000

Based on the blacklist behaviour, recipes can be tagged as deprecated.
Such recipes will produce a warning message when included in a build but
unlike blacklisted recipes, the build will continue.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

Literally no different than v1, differs from v3 in that the doccumentation for
PNDEPRECATED has been removed again, since updates to documentation have to go
to a different list.

 meta/classes/deprecated.bbclass    | 16 ++++++++++++++++
 meta/conf/distro/defaultsetup.conf |  3 ++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/deprecated.bbclass

diff --git a/meta/classes/deprecated.bbclass b/meta/classes/deprecated.bbclass
new file mode 100644
index 0000000..3dcdadb
--- /dev/null
+++ b/meta/classes/deprecated.bbclass
@@ -0,0 +1,16 @@
+# To use the deprecated recipe check, a distribution should
+# include this class in the INHERIT_DISTRO
+#
+# Features:
+#
+# * To add a package to the deprecated list, set:
+#   PNDEPRECATED[pn] = "message"
+#
+
+addtask check_deprecated before do_fetch
+python do_check_deprecated () {
+    deprecated = d.getVarFlag('PNDEPRECATED', d.getVar('PN', True), False)
+
+    if deprecated:
+        bb.warn("Recipe is deprecated: ", (deprecated))
+}
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index ca2f917..16ece3a 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -20,5 +20,6 @@ CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
 INHERIT_BLACKLIST = "blacklist"
+INHERIT_DEPRECATED = "deprecated"
 INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
-INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST}"
+INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} ${INHERIT_DEPRECATED}"
-- 
1.9.1


