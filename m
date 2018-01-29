Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 65ED578544
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 17:11:18 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id g21so8035744wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 09:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=uapo68wqcYTrezhSNtPBJyd0UL9WBb5piVYG++aSV7g=;
	b=r+5iTQjL9XGoskZxZwyUlZTT+ec1OiDEzEG3CGnUq2z7x2elZfCrGuyGDuxB7ZZwY8
	VNTZbs52xkoU4VmBE8Cyee1eUg266c+GMuwAS3+yN/22dCJVs4bGU7bP70F7QUIj6eGg
	KTWf0r3nQ+4im8IVKdiPV5Q3WEONHIbOazbaXNqI7N2cd3hZuWXB8Z7a8K4cp7JCTOt6
	eudvMRVmon+OeB5iAwjss+GAwEXfmn+2vhoTNJ8VAX9uj+0eRJUxb5zDrgFpD7S/JO5P
	I88fig1kLms/eLDl7vonwR3wymeoOCmb7WdpO6Njn5YCAmDOku7aQCQ10BhDsvt4LLN9
	awYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uapo68wqcYTrezhSNtPBJyd0UL9WBb5piVYG++aSV7g=;
	b=d34uV0ZvjJfj6f7zDBRSDgJJsytql+QKo8TGQDX1aXXol3p4jScF0qHXUmkfIVy08D
	5BxhC07kYg3stk92c947zW3YLbHAGZ1fx/jsDe9r12PPRJSQuaaTcXzVMKcfEQYWFVwE
	2zvZW0LAi3WYZbWKCFWSzojz63rv6aHBVgCpojAy9BdwP6bQlOM6RAbfimgvulussPTs
	BvFx9zZ5kK0jaOV4KQg5bvAw5Ce4X1hiF56SrkA1fIwdsDbowrGZSpEogEbyacr/Rhpk
	n04FBsML3BDcGnZr/J0/iwuVvUE6iTJSCdESKWIyqZg4BM3/hqXOAajVde0ikAInzIPu
	fcSw==
X-Gm-Message-State: AKwxytft1CgCDlIIwe7Fwey2TqI5KR+d0FFTm6rs5o/0KWpBNE1r59pE
	dbOvZZYPPQZeLtvFkJgjAYekK9Mr
X-Google-Smtp-Source: AH8x227VgMABH/8EvShzAnsY9Zr/1zZab5Xr1Naja8FSPwVLtBj98XPNRWC1ecfpUTAKwPtLWORQeQ==
X-Received: by 10.223.146.33 with SMTP id 30mr4816051wrj.14.1517245878888;
	Mon, 29 Jan 2018 09:11:18 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e16sm11515244wre.5.2018.01.29.09.11.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 09:11:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 17:11:07 +0000
Message-Id: <20180129171111.14502-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/5] ofono: only depend on pygobject if its going to work
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
X-List-Received-Date: Mon, 29 Jan 2018 17:11:18 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/ofono/ofono.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 676a0c0042a..4443a95c2f7 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -5,7 +5,7 @@ LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
 
-inherit autotools pkgconfig update-rc.d systemd bluetooth
+inherit autotools pkgconfig update-rc.d systemd bluetooth gobject-introspection-data
 
 DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info"
 
@@ -29,7 +29,6 @@ do_install_append() {
 
   # Ofono still has one test tool that refers to Python 2 in the shebang
   sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/ofono/test/set-ddr
-
 }
 
 PACKAGES =+ "${PN}-tests"
@@ -39,4 +38,5 @@ RRECOMMENDS_${PN} += "kernel-module-tun mobile-broadband-provider-info"
 
 FILES_${PN} += "${systemd_unitdir}"
 FILES_${PN}-tests = "${libdir}/${BPN}/test"
-RDEPENDS_${PN}-tests = "python3 python3-pygobject python3-dbus"
+RDEPENDS_${PN}-tests = "python3 python3-dbus"
+RDEPENDS_${PN}-tests += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-pygobject', '', d)}"
-- 
2.11.0


