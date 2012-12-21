Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm28m-00041o-N8
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 13:55:57 +0100
Received: from mail-la0-f70.google.com ([209.85.215.70])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 04:41:05 -0800
Received: by mail-la0-f70.google.com with SMTP id e12so3470665lag.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 04:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=FCS5NIuclWMn3trHtGbHlSSXi69eDM9Jfy7TevLXkcQ=;
	b=GNtkzTKn5RjCEvI48qBBPQvht/dkTMoO8/kGYb1zFP/oyVerxpx6/lOMce3JisjuNF
	bxwcJfmm1L5MIR9Hdvl94ymdyofDSL4pHZws4D4zDr7cqdIOxRR8zYLvuXuxSGSOwTqT
	nMOhzNugY0jVNQ9lS8JrlymE9/5FrJbD7v2LrPx0tjQCpg1arbeHeve2tNZqrx9D6SiO
	vlNf5cxTcT15KOYcvQUB4diQf+ykFg+ejpGmjhlsrgZWuvhoEE77ocQebe1ifS2JfIhA
	rYlKxSU4H3D5rDjUeshg3IhQ9DLFfozlSUWLT6VqvFwDMQNEosOMUCanzyKEoyGs62x0
	Hj3Q==
X-Received: by 10.194.76.165 with SMTP id l5mr23430291wjw.14.1356093663010;
	Fri, 21 Dec 2012 04:41:03 -0800 (PST)
X-Received: by 10.194.76.165 with SMTP id l5mr23429353wjw.14.1356093653130;
	Fri, 21 Dec 2012 04:40:53 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id i2sm29653446wiw.3.2012.12.21.04.40.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 04:40:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2012 12:39:07 +0000
Message-Id: <1356093547-21765-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkJYOtTnSxHxNU2GWQps8LgxTAWHi+D71WPOD+i0PSU2wtOC4zJYPv/1cU3pZ/V3THAjnlnZ2GSBE33P/qzEsCki1a5tCCGZD7+WVYCQXv0UHd8q0bgqnESh7QHLFqsfytpiXr7zXTn66sAPywuIcMz61NiZfhurxyjxWKN55SX8t+4x+IlFkP90fSwrTyghrnVFJEi
Subject: [PATCH] vala-stub: add a stub for vala-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 12:55:57 -0000

Some packages have optional support for Vala but require vala.m4 to provide
VALA_PROG_VAPIGEN so that autoreconf works.

vala-stub provides a dummy VALA_PROG_VAPIGEN which doesn't do anything, so the
configure script runs and believes that vala isn't present.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/vala/files/vala.m4 |    2 ++
 meta/recipes-devtools/vala/vala-stub.bb  |   16 ++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/vala/files/vala.m4
 create mode 100644 meta/recipes-devtools/vala/vala-stub.bb

diff --git a/meta/recipes-devtools/vala/files/vala.m4 b/meta/recipes-devtools/vala/files/vala.m4
new file mode 100644
index 0000000..1776c6d
--- /dev/null
+++ b/meta/recipes-devtools/vala/files/vala.m4
@@ -0,0 +1,2 @@
+# A stub defintion that does nothing
+AC_DEFUN([VALA_PROG_VAPIGEN],[])
diff --git a/meta/recipes-devtools/vala/vala-stub.bb b/meta/recipes-devtools/vala/vala-stub.bb
new file mode 100644
index 0000000..6d5ff08
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala-stub.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Stub vala.m4 for building without vala support"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://vala.m4;md5=f38dd167c10adc458a1bcbc96443cdfa"
+PROVIDES = "vala"
+
+SRC_URI = "file://vala.m4"
+inherit allarch
+
+S = "${WORKDIR}"
+
+do_install() {
+	install -d ${D}${datadir}/aclocal
+	install -m 0644 ${WORKDIR}/vala.m4 ${D}${datadir}/aclocal/
+}
+
+BBCLASSEXTEND = "native"
-- 
1.7.10



