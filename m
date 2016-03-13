Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 456FE70030
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:37 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n205so11548673wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=gVvqKgAbM1x9HSchEmJF8terUSLBpqSJQK3+t1X+Ms8=;
	b=07ghEK0Mwo0JSkZylML853sV1Kp6N6CACY9ei/VmlzNsBtT2/25Ia3tvZWE4QhMeic
	4+hG+LF4dprixduOSyo7mUcE3d0kVOEB5/MPfm3nywMt93O0WNBOgaY9vFWbZ6jGdk9h
	b95Xrrc5nHOfVU5xy2OeX3j950PQh9AViJSwmNP1PguiTFA+un/ahLQEOk5ac9lh7ssU
	267hltUv/yCMyA1wH1SFIDZP/w7V5Ae4ORlpch+1Hmwu92Rj4o6Bgn2/yxHR/3yMUxd3
	GbSkoBi42LoF47NqO3Er3c/0nKAnM/QbjE/NMHw1NXeZzgLBWfpVUgRzpcIsRn6cQOmK
	7RPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=gVvqKgAbM1x9HSchEmJF8terUSLBpqSJQK3+t1X+Ms8=;
	b=G9wxGwhkEfn6XtOYJ4D9gniK9JeMmA+x/lJ1/JGRjisiMqTgWloPcPph+ZAYFv73xp
	92ydqvUvr+1feyp88HZZWl18jGqnUOfHMLH1zGq+IvR3dpDfjww29TSmt0Rl5nGOullz
	H6gqvothr5k47fDztYL6QMwRmj179KZvCXbpGDt5pA/Z1lw7R+/DknH5FAOE+x7n5ch0
	2vxSl4VKDtR9phukbeBaUx6njTytjV2wUt1fNwbpUjoUUNvmOoYBh4pvVVQBgzdPFD3t
	W6XZ82NYe0FEMPYAvRNifOGHZIzdLk0qPfUP+cYPdDbZMBTnVymEp+QMwij1q6B280O/
	a/7A==
X-Gm-Message-State: AD7BkJKOkVPg4oATUexy+qWIAuXjj9SZsjCvJubJpINOjvmseVtV29B+Mbr3GR6LCSst7Q==
X-Received: by 10.194.87.161 with SMTP id az1mr20490502wjb.163.1457896477889; 
	Sun, 13 Mar 2016 12:14:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:36 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:01 +0100
Message-Id: <f489864c5ab61ca09283ebe5bc919c68edd4c0fc.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 03/42] apmd: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:37 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
index 4ff6ad0..e66a553 100644
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
+++ b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
@@ -72,10 +72,10 @@ do_install() {
 	sed -e 's,/usr/sbin,${sbindir},g; s,/etc,${sysconfdir},g;' ${WORKDIR}/init > ${D}${sysconfdir}/init.d/apmd
 	chmod 755 ${D}${sysconfdir}/init.d/apmd
 
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/apmd.service ${D}${systemd_unitdir}/system/
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/apmd.service ${D}${systemd_system_unitdir}/
 	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-		-e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/apmd.service
+		-e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/apmd.service
 }
 
 PACKAGES =+ "libapm apm"
-- 
2.7.1


