Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9265977328
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 16:12:06 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id y124so22990203iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 08:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Kc+xz+WrNOR0ucJNw2Ya9QX+zqgI77PF33J/3cnxYik=;
	b=DC47BKCp2qt8cFCGM38WccwTUIWUdD8NnwVUB1AGIGIrz5YTWLiwvyVd2UoUHfyBnB
	BSB0uL3Nlp0/Fuuf+eLIeLgFDkZYy4HVDYjYgc/0KazeAHIOOFiVXOOMVVO7mJaRb/uF
	jkNj+FWNQanHnEnlL6KGbdLRDrP0zJdYgVmYVPMHTuW2vczgkJJMsLW1gEey9gemts0X
	2ky3C72F8b8eHVdsrrAxQKb8obHLfSycraOwrds5xbPmf9cxA/6ggP6IGSp5ptt1y8ww
	lu97OI9skrQnTQ5pt3qOcigtqwxk8DLo1Vk6A6d3IfPVdNGZHLhMp5jdCFGpYMb1Dwct
	BI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Kc+xz+WrNOR0ucJNw2Ya9QX+zqgI77PF33J/3cnxYik=;
	b=LGfYHheb+Cs3JPgGOgOMUgKh8NpSRugWSNBb0zp0DZ6ObpN0dnPpOjKA1+laVxynSw
	nB7UbwWXs2dMZfTI35y4XgKJ1r4XuRzmuOqYwSDSZi6vtJGgBjAf0EdWWe7gJMf9kr7e
	TsH6ybUIr+TvSmWJ2r4x7MlG2R68zWeMmrfdCT6pn1HNTPwwLwCSTLtC8gdjNL7/oDjq
	lAVlNtBftLPM0dSUfyjTmivNlnDTchR8pd+rSIgZfWnTyQDy7Xmxucg84WLUWCMHmotA
	eAmixbIcYArxQNALgHFvwfhP7gsHAdiNrXLrYkPvkbMe8CY/KEhf0PcXHuXk8IM6leA8
	TLzQ==
X-Gm-Message-State: AIkVDXJf522P1P2cAlppFLvDyoaYQ5EVb8A0gZ7go/EvaaiKcrvNLNZbVwdKh9NdneGuaQ==
X-Received: by 10.107.138.142 with SMTP id c14mr752681ioj.135.1482250327634;
	Tue, 20 Dec 2016 08:12:07 -0800 (PST)
Received: from openSUSE-i7.site ([45.72.129.229])
	by smtp.gmail.com with ESMTPSA id
	k130sm9131101ita.20.2016.12.20.08.12.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Dec 2016 08:12:07 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2016 11:11:58 -0500
Message-Id: <20161220161158.15673-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.10.0.129.g35f6318
Subject: [PATCH] ncurses.inc: add v6 binconfig-disabled entries
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
X-List-Received-Date: Tue, 20 Dec 2016 16:12:09 -0000

Newer host distributions are moving to ncurses6, therefore add entries so the
host's ncurses{w}6-config scripts aren't picked up.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes/binconfig-disabled.bbclass | 1 +
 meta/recipes-core/ncurses/ncurses.inc   | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/binconfig-disabled.bbclass b/meta/classes/binconfig-disabled.bbclass
index 602a669..096b670 100644
--- a/meta/classes/binconfig-disabled.bbclass
+++ b/meta/classes/binconfig-disabled.bbclass
@@ -15,6 +15,7 @@ do_install_append () {
 		echo "echo 'ERROR: $x should not be used, use an alternative such as pkg-config' >&2" >> ${D}$x
 		echo "echo '--should-not-have-used-$x'" >> ${D}$x
 		echo "exit 1" >> ${D}$x
+		chmod +x ${D}$x
 	done
 }
 
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index ff0117b..3f4bf67 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -7,7 +7,8 @@ SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_class-native = ""
 
-BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config"
+BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config \
+	${bindir}/ncurses6-config ${bindir}/ncursesw6-config"
 
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
@@ -278,6 +279,8 @@ FILES_${PN} = "\
   ${bindir}/tset \
   ${bindir}/ncurses5-config \
   ${bindir}/ncursesw5-config \
+  ${bindir}/ncurses6-config \
+  ${bindir}/ncursesw6-config \
   ${datadir}/tabset \
 "
 
-- 
2.10.2


