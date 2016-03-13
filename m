Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 52B077316D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:13 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n205so11551000wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=pD7b/3KnZ74RLuht8hiatM5+liPw4MQ48dlnrzQX1uE=;
	b=XcucCc7NKyfRrip91Coj+/wus1ksrwnz/gqnrT3w3LY55V00V4ntKHYR8bUiR4pyUs
	WXyJubK1997pP2916mw1T9v1lnTFH9k/M9oZnUakEB9ch+rELzbTkoIPF25VOitGMlNA
	PDI81i2awaAWg37KiKJk0ULgCJqZMX89VTsEQ/4ObFxvz3ib0TwTe9AglytWtfMSpwp6
	Soe7TGI/50Yy32udXWwP8xqcskO9eBOa2pQTK0aojy+6G1Wn0z6CppVBh28qks/J4uOd
	YC6cNjFpMg1Qja3SxJd/wX/Go11MNEW+cjKoEDcYIHKcfmjQSk12QRewWlL8QB4pSQ1J
	aTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=pD7b/3KnZ74RLuht8hiatM5+liPw4MQ48dlnrzQX1uE=;
	b=LdtYSCo8MMgs5q5Q2dRuUJFFWjBdFyk0GDl+AhHqC8VMjddLmVjj/Jvsaoc3922ib4
	1OgQC+LRPlbrFgqw3oXLoDEA7H2ZhxCHKCQIw1GSunDNTFDHHjcaetygvnnjGgJWKIf1
	2zliZg2rmSJbg4NXgaVHb9VM+aQYynvnXTgAoPPAV1UiKx3dYxgTWqWfgk+lfGlHw5fz
	HFPfqkm2FX9482unuiz12gau6tOcTyUNNMTQE3yFPUdsjN0d/7wbDlGpx5nygbIGWIDm
	w2M3Nl8CaaClG1UtKEehV/atZl9zR/2GCf1lq8HZtmlDTERnPcPxX7mgvIG4mNK+7Imd
	lZhw==
X-Gm-Message-State: AD7BkJJALh0aE5rFTxzWJSB10uvFfNpMhBpqpXvD7iJ2jjNID6OyyCh5xuJk+Gc4QHMNKw==
X-Received: by 10.194.5.194 with SMTP id u2mr20659786wju.139.1457896513936;
	Sun, 13 Mar 2016 12:15:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:13 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:28 +0100
Message-Id: <16d1356503ec7a78f02000e39a76e89cdfc03acf.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 30/42] xinetd: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:13 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 6bfaabe..98d66d3 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -67,11 +67,11 @@ do_install() {
 	install -m 664 ${S}/contrib/xinetd.d/* ${D}${sysconfdir}/xinetd.d
 
 	# Install systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/xinetd.service ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/xinetd.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 	       -e 's,@SBINDIR@,${sbindir},g' \
-	       ${D}${systemd_unitdir}/system/xinetd.service
+	       ${D}${systemd_system_unitdir}/xinetd.service
 }
 
 CONFFILES_${PN} = "${sysconfdir}/xinetd.conf"
-- 
2.7.1


