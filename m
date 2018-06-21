Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id EF18478520
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:08:43 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id a11-v6so2111447pff.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aXHQGUTxbIJsLA6J6euMR2ZdNQdyBmWZZeILtsMWW68=;
	b=GWZXnnE5AjlCJe9ou3Z7nNH/kxg5lvRRsfC91Apy//dGwa5HXMpdgUovayqII+fzHv
	yoKgGt8Q70c9e97vV0ZBzLVww7VWlIJ4+hNouEFeVJikPG9PFYd6Z+V3j8xrt3G6J0qg
	KzHeWXmb684OkIgmFQx9l+JkVrRQ7//juhKYbrfIn0P5ZP0t9JuybU7HMyizP8ojPOX5
	s4TmThebGX1IljdDM/dCiaN3DGCal69bMKqEhur2DgDkTbsj13GBHd4n/EDC0Wjo3Dyg
	cwLLqiSS/oJ40ulEIQ8W/kyXQ0auSXwvQ7JKCZv9AamD+1BfeFMMpKjNDyFWTaOScoqM
	Tb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aXHQGUTxbIJsLA6J6euMR2ZdNQdyBmWZZeILtsMWW68=;
	b=MVOyl+RBRXbFEtb5u+mbGqnOswDcY/kIiSsMEZhlqP7GHHQN5xKf22DhE0vG2zuFUX
	DO+88C5ROxyLaM5cvjw9Wf4eA1Ed5IuojZi25jyhDaVMhhBQFgwuNXYvVpiGyZEcBnat
	+w7TVuL1QXA8DHqOkVEfGjIKG8F2IKj7NSpM9c3R10JgeFobIv+5zd8q1uPROouJdcoE
	lKqKTeBaFenX551Lqxa/nNbMMBHyDPfEfUnTc7pJls3QsFdHL+fwkkmftszF7iiddhOj
	yH76+Ur8aoJhPFp4YPVME2xlablGwtnf5U08DHhgMWyknWxaOEi2StJRwB4xmVe8NJRj
	uECg==
X-Gm-Message-State: APt69E24qMV1dOkzgY/ZbA2IeQWRF/dyL322dkdwnecD/SpouFUIhW2p
	rZYQItITQzxdau2j62tKM3Aw4GLz
X-Google-Smtp-Source: ADUXVKK3lc6xoTX0Pc3rKxktmv9dlpgpJRiQvXEzgL578bnxXZdOvEOEU9DMHzeUOkMpyK5LcGxg7Q==
X-Received: by 2002:a65:6031:: with SMTP id
	p17-v6mr3143628pgu.140.1529615324828; 
	Thu, 21 Jun 2018 14:08:44 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	8-v6sm10513508pfk.132.2018.06.21.14.08.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:08:43 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:08:22 +0500
Message-Id: <be81af600ad798e64acb7e4350083e4ff042862e.1529603271.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529603271.git.chris_larson@mentor.com>
References: <cover.1529603271.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/5] image.bbclass: inherit and use bbpath-intercepts
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
X-List-Received-Date: Thu, 21 Jun 2018 21:08:44 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2247b305da8..29bd716f8d3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -191,7 +191,7 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IM
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
 
-inherit rootfs-postcommands
+inherit rootfs-postcommands bbpath-intercepts
 
 PACKAGE_EXCLUDE ??= ""
 PACKAGE_EXCLUDE[type] = "list"
@@ -262,6 +262,7 @@ fakeroot python do_rootfs () {
 do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[cleandirs] += "${S} ${IMGDEPLOYDIR}"
 do_rootfs[umask] = "022"
+do_rootfs[file-checksums] += "${POSTINST_INTERCEPT_CHECKSUMS}"
 addtask rootfs after do_prepare_recipe_sysroot
 
 fakeroot python do_image () {
-- 
2.11.1


