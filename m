Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id E9DFD78542
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:39:45 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id m88so7903148pfi.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 11:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y35doNApefBUgG2evhDhpltVCyf0jUUU3V0DuX7lun4=;
	b=UBiPMIEw4ctxsfgW4hSuW8P1QMB+KvGfDpdBBYkM5z6V2uOptpI6eabTPsyOetuwCB
	sR1Tx7MosBFar4nFWlYEk4t+29J3Ns4LJbft0aJMOz1lgKHLYyLO3Tw/vCxa2M0/QZ5y
	N9wRBQn/ZRFYB7N/jP/rMU002pb3hQFfVa1x/vWBbM1b9Tgp4IlRP2c4UoKfEQXjBGgr
	6TRuuSUkY7B88ktB18UGBg9EOzOunviTTC6LCxKpQIOICvJJuiCAkNEMBufFYgZw08Vy
	4s36xhXcP2URRq+ZdSdq12zRsHHTNcWHSCoWQ8JFOX9PVvu+x0ViMcDxvzTNhvtEvhN5
	qSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y35doNApefBUgG2evhDhpltVCyf0jUUU3V0DuX7lun4=;
	b=ig4xONpf3JRagBws5h19lpr1WmXha05dD6Rk7JXevt87x9LSaReodZsFmLQKgHXs+u
	A908ZbsFmAzJkKD5OOaE9p6Bv6ZHGv9nR+kIQYEXBKzo55J23N4zgea7MobISKD0MgwN
	zH6uKLAAHE8GQbsOJuoFJo4jDZgw7AFS45HGVRz/ow69DUjQye57gNtJtm+Tj1m7oWhc
	6Z70d75wctkY2WbdCjVUqhLeeC0BIfHSnS6AEdt9QgU/QM58BrZsvzsw9C+VSxsbEXaW
	1/4LbXnlmExEgo+YbpmR8obNM6FcOcSTxArRU+37f/a0aiBijFZMYTaCqntdabV1WfIt
	Ltfg==
X-Gm-Message-State: AJaThX4khvaGzpwg9J1X/A5yIl3tAC+yodYb/k/LvM7bO6OFZhtIMJND
	QwGhcPXsfPF6R8jKhG0h3D7/uQ==
X-Google-Smtp-Source: AGs4zMaHZ4T8CXOLCE5NPhEngWiJJWLG4t6wz9IcTZAphxSyrRpfQiBeYpqpEdTSxbhiayr108KFCQ==
X-Received: by 10.98.220.218 with SMTP id c87mr8307263pfl.229.1510688387213;
	Tue, 14 Nov 2017 11:39:47 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f4sm30804162pgs.30.2017.11.14.11.39.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Nov 2017 11:39:46 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 11:39:23 -0800
Message-Id: <1510688364-32667-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510688364-32667-1-git-send-email-armccurdy@gmail.com>
References: <1510688364-32667-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/6] systemd: use consistent indenting and coding style in do_install()
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
X-List-Received-Date: Tue, 14 Nov 2017 19:39:46 -0000

Make the polkit fixup etc at the end of do_install() more consistent
with the rest of the function. Also indent do_install_ptest() with
tabs instead of spaces to make do_install_ptest() consistent with
do_install().

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 49 ++++++++++++++++----------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 1e2377a..d4e0b1f 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -219,7 +219,6 @@ do_install() {
 	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
 	touch ${D}${sysconfdir}/machine-id
 
-
 	install -d ${D}${sysconfdir}/udev/rules.d/
 	install -d ${D}${sysconfdir}/tmpfiles.d
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
@@ -275,39 +274,39 @@ do_install() {
 	fi
 	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 
-       # If polkit is setup fixup permissions and ownership
-       if [ "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'polkit', '', d)}" = "polkit" ] ; then
-           if [ -d ${D}${datadir}/polkit-1/rules.d ] ; then
-               chmod 700 ${D}${datadir}/polkit-1/rules.d
-               chown polkitd:root ${D}${datadir}/polkit-1/rules.d
-           fi
-       fi
+	# If polkit is setup fixup permissions and ownership
+	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
+		if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
+			chmod 700 ${D}${datadir}/polkit-1/rules.d
+			chown polkitd:root ${D}${datadir}/polkit-1/rules.d
+		fi
+	fi
 }
 
 do_install_ptest () {
-       # install data files needed for tests
-       install -d ${D}${PTEST_PATH}/tests/test
-       cp -rfL ${S}/test/* ${D}${PTEST_PATH}/tests/test
-       # python is disabled for systemd, thus removing these python testing scripts
-       rm ${D}${PTEST_PATH}/tests/test/*.py
-       sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/tests/test/udev-test.pl
+	# install data files needed for tests
+	install -d ${D}${PTEST_PATH}/tests/test
+	cp -rfL ${S}/test/* ${D}${PTEST_PATH}/tests/test
+	# python is disabled for systemd, thus removing these python testing scripts
+	rm ${D}${PTEST_PATH}/tests/test/*.py
+	sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/tests/test/udev-test.pl
 
-       install -d ${D}${PTEST_PATH}/tests/catalog
-       install ${S}/catalog/* ${D}${PTEST_PATH}/tests/catalog/
+	install -d ${D}${PTEST_PATH}/tests/catalog
+	install ${S}/catalog/* ${D}${PTEST_PATH}/tests/catalog/
 
-       install -D ${S}/build-aux/test-driver ${D}${PTEST_PATH}/tests/build-aux/test-driver
+	install -D ${S}/build-aux/test-driver ${D}${PTEST_PATH}/tests/build-aux/test-driver
 
-       install -d ${D}${PTEST_PATH}/tests/rules
-       install ${B}/rules/* ${D}${PTEST_PATH}/tests/rules/
+	install -d ${D}${PTEST_PATH}/tests/rules
+	install ${B}/rules/* ${D}${PTEST_PATH}/tests/rules/
 
-       # This directory needs to be there for udev-test.pl to work.
-       install -d ${D}${libdir}/udev/rules.d
+	# This directory needs to be there for udev-test.pl to work.
+	install -d ${D}${libdir}/udev/rules.d
 
-       # install actual test binaries
-       install -m 0755 ${B}/test-* ${D}${PTEST_PATH}/tests/
-       install -m 0755 ${B}/.libs/test-* ${D}${PTEST_PATH}/tests/
+	# install actual test binaries
+	install -m 0755 ${B}/test-* ${D}${PTEST_PATH}/tests/
+	install -m 0755 ${B}/.libs/test-* ${D}${PTEST_PATH}/tests/
 
-       install ${B}/Makefile ${D}${PTEST_PATH}/tests/
+	install ${B}/Makefile ${D}${PTEST_PATH}/tests/
 }
 
 python populate_packages_prepend (){
-- 
1.9.1


