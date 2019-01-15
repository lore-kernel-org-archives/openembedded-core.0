Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8BF7C126
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:45:45 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id x2so1104414ywc.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GwtH/qsRsgOwsJ2v2qqaalk8dwSJiMzr/bX5/iVSBWY=;
	b=JfQD3GRLx8xuGAVRidpNTI7fp1QO11MIVJHWTdc8BzL/k6alIj1tFvCfKVa6rmp4WP
	FZMoP+BrzCnmsBKZTXLkst1/iG0xH3MDo7G5rQH+ngrpAeml/M5A8Ef0EESQ3OaJS22s
	rgHabYaTMIa29em4z5Hd4MuHZ0Hief6+IP3aVMX8wsIxLrxIVUH6BQcKDUp5NqbOEGNq
	aB7yPcouZfBrGMmJ4rpk+3yxrSGXeOmLMl9WWRf3cjzVyF03y9oN4idGQviTY/0mNlSs
	HZkZjObBcfLzDKDLDTTXGU25LmABGGCOQevp4+xTSensjl0bDYR6GRn25f06uPWG2Cy1
	qfvg==
X-Gm-Message-State: AJcUukdqV7qc7t1bMPwehUamIkhXrrBIUyGk+F2MrcDbIQahXfrWUK0H
	ZdkPSrwq3sTfIaAWFtvcJTmBrPzX
X-Google-Smtp-Source: ALg8bN5MXqAjry4L0kp5+Bzs+HxDf2sWIcHF4nqUJMxQlh08ihppgnyLVcsblBHTi/wN/9EAMcEBVA==
X-Received: by 2002:a81:2a55:: with SMTP id q82mr3099709ywq.311.1547563546439; 
	Tue, 15 Jan 2019 06:45:46 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i13sm1261220ywe.53.2019.01.15.06.45.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 06:45:45 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 14:45:23 +0000
Message-Id: <20190115144525.29388-14-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115144525.29388-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190115144525.29388-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 13/15] util-linux: move /etc/default/mountall into -mount subpackage
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
X-List-Received-Date: Tue, 15 Jan 2019 14:45:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

This should probably be there and now the main package is a real
meta-package only.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index f3c3ae65c8..6ff947a34a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -44,19 +44,19 @@ python apply_update_alternative_renames_prepend () {
     do_split_packages(d, root='${base_sbindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
-                      hook=pkg_hook, extra_depends='', prepend=True)
+                      hook=pkg_hook, extra_depends='')
     do_split_packages(d, root='${base_bindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
-                      hook=pkg_hook, extra_depends='', prepend=True)
+                      hook=pkg_hook, extra_depends='')
     do_split_packages(d, root='${sbindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
-                      hook=pkg_hook, extra_depends='', prepend=True)
+                      hook=pkg_hook, extra_depends='')
     do_split_packages(d, root='${bindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
-                      hook=pkg_hook, extra_depends='', prepend=True)
+                      hook=pkg_hook, extra_depends='')
 }
 
 PACKAGES_DYNAMIC = "^util-linux-.*"
@@ -89,11 +89,14 @@ PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-pytho
 # Readline support
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN} = ""
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 
 FILES_${PN}-last = "${bindir}/lastb"
+FILES_${PN}-mount = "${sysconfdir}/default/mountall"
 FILES_util-linux-runuser = "${sysconfdir}/pam.d/runuser*"
 FILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
 CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
-- 
2.20.1


