Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9247E7BFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:51:43 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id f65so2402141ywc.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:51:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YSElZM1DI+Y7+4JWz/9qwbqBj0HE+LfDWysx4NRMpzc=;
	b=MsFKvWe3oe/TfFOlAGl9HyThbm0+et9BgiQhvFc+hwdPtF/3UXyUvuir9BVTA05Vpf
	3TyuD4ioFdC1tA+1YAEEUWVDAiZ/MjLkyZxo+OEXnEiqtrMvuwTSNZCzxP5UUi9OeA+l
	Ren2FxsChqkZD85FKjMcyKh0ONjuSht7Nq8dR6duw3Lh7hKb3GcSHArzj0oiuTfAKjNP
	2Ck3iriybLwQkwQO77w710S4zXg/ZqQGIZC6+aOWEOwZeLwpNkSqSfmnp5Y06hzo5fpu
	y5AEIyRbq2LMJhS1p1idiZBV7558DSr3HBgSfUy8ul/hFyN7KwbMcGjW/G4SZDXP9cSO
	pLtQ==
X-Gm-Message-State: AJcUukd5WUKjLA3HLYtssQ2d7TeZjDAONfPM8oS7zImaWoFxHQ9VeHF3
	pvtQ7g5VvNxqfLZiwxwpAeNIzDSV
X-Google-Smtp-Source: ALg8bN7jkBlcBXn1M4NC9zGTpTg45JBUcIbPy4lxhn/3aacjC8V2UckFjOpIxG2aq+Yl6Q/qIWl8CQ==
X-Received: by 2002:a81:52c5:: with SMTP id g188mr7558879ywb.252.1547643104500;
	Wed, 16 Jan 2019 04:51:44 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y63sm6194558ywy.1.2019.01.16.04.51.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:51:43 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:51:22 +0000
Message-Id: <20190116125124.20177-14-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116125124.20177-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v4 13/15] util-linux: move /etc/default/mountall into -mount subpackage
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
X-List-Received-Date: Wed, 16 Jan 2019 12:51:43 -0000
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
index 000db880a1..47264028f2 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -44,19 +44,19 @@ python util_linux_binpackages () {
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
 
 # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
@@ -92,11 +92,14 @@ PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-pytho
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


