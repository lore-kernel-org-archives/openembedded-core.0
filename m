Return-Path: <kergoth@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0462978CD2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 17:24:50 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id p23-v6so3599530pgv.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 10:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kBgYV9mYiYHBKJ74xAM7i6b/t9ZA4jZEEMy+pzvwj9w=;
	b=kD1sxpY0WQ7R8IyrzBIDIa1YO+56giDUNUdDT0Z87r56HS4mc+QJqh9NT3YJrtVVhm
	osdYGQp0OLbooPP46JT/XnkUZotC1GMUVn6vKyBXchEFJWdRQPFg5zAoGBVEYAIXT0ED
	PVZFQX7IXZvnHyjhV+ZB3Uvdhxp0NahNN2ouRe1Zk3gCLtNc6SnqQFX5ZOaR9BogTAhb
	z/mSB1kqkViry88rgYcEJ0nKZrauVf1awM6fxADhK7glVItgK6gjhM/MucY5wEaTaJei
	5ieTRG+ViZ8tHuO4Q7M7v8mI/yEQaGW7ljSwNCb0YxTJbolEzJsylY4U35Ejej8OzBgu
	Z4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kBgYV9mYiYHBKJ74xAM7i6b/t9ZA4jZEEMy+pzvwj9w=;
	b=FVHQVrjGjY3POBsx+8J7BYVyB8Go1Pn+QAz2V7q/+bYgSO8bsfvA3aB9gdoZqeL+Sx
	AL3zh9mwG4rvOBEDWkFplAHOpJdg8QxsOFSB4mjLLcoXAD8rx4AalqRUJw5Uz7Hkk6DB
	ZlN5ub6uBtEgPVCuDvJv+6N9/jI0Y1tDnQZjzmPRcHEUFxNZZftO6Hc2gvda8COV6To3
	flh0o281xnfYHE7kmuG1RtJk/gOx8UTh73gt0zjeL3l4urTCRD2RtnzYhZMOxaOjiKbT
	Ndf4dEaTDLoL7ZRtu6kb/Klen77867HDX/JMLIk2tCO3fYz6CLJ2SaXx1bCynKTt92Ky
	+CpA==
X-Gm-Message-State: AOUpUlFbgrfHzVaI01MIkMHhJxVs1KL5O6ILsHz6YBNBN9uok1nwtmvo
	dwss2oSZY9wJ2toHF8XTrMd52dZPidc=
X-Google-Smtp-Source: AAOMgpekcdJFNKRn6z0fES1SD/nC3Rj/1V71Hs5F/719sXT0B2O8CzaWha6StO1bsM7D4b5iFoPW0w==
X-Received: by 2002:a65:60cf:: with SMTP id
	r15-v6mr6889095pgv.41.1532712291884; 
	Fri, 27 Jul 2018 10:24:51 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	v17-v6sm6399195pfn.177.2018.07.27.10.24.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 10:24:50 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 22:24:30 +0500
Message-Id: <fc32ec263034818cd182e093685d776b8d50a3a2.1532711448.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1532711448.git.chris_larson@mentor.com>
References: <cover.1532711448.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 4/4] populate_sdk_base.bbclass: inherit and use image-postinst-intercepts
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
X-List-Received-Date: Fri, 27 Jul 2018 17:24:51 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/populate_sdk_base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 7ffaf84a45d..c456c52866a 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -1,4 +1,4 @@
-inherit meta
+inherit meta image-postinst-intercepts
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
 # installed into the rootfs
@@ -307,4 +307,5 @@ do_populate_sdk[dirs] = "${PKGDATA_DIR} ${TOPDIR}"
 do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS').split()])}  ${@d.getVarFlag('do_rootfs', 'depends', False)}"
 do_populate_sdk[rdepends] = "${@' '.join([x + ':do_package_write_${IMAGE_PKGTYPE} ' + x + ':do_packagedata' for x in d.getVar('SDK_RDEPENDS').split()])}"
 do_populate_sdk[recrdeptask] += "do_packagedata do_package_write_rpm do_package_write_ipk do_package_write_deb"
+do_populate_sdk[file-checksums] += "${POSTINST_INTERCEPT_CHECKSUMS}"
 addtask populate_sdk
-- 
2.11.1


