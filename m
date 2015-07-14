Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id E2F0E75F18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:56:43 +0000 (UTC)
Received: by wiga1 with SMTP id a1so102061150wig.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 07:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hsiPGN8maAklsT41WUrq2bzRTMonnKOt3LcZEmnt+WE=;
	b=iPwkZA7/je6chCb8L4HSKI/aOrTG/bIsWLOayOiOPn9FwP+TcgsLavyaScaETWgliO
	7R/7OWiFHbCGfTIfBQHy2EFP1wQHyXlGHemEwR8DYe8UMzlu1eQsxsU3rME14o5Nq1J/
	Qmtv45PGbxJl71N1GJ3Ds9obf/3bNC89FKsMlfj4LvI1zRzqNfmnGexmx0OcYiiYLIH6
	njK5UrwdZlLM6YLd6KhZWlbULuw72vtIV2RlAA4o9R5YhXKXMe6A0HWfPuo7b7cTZ0Ug
	HAHU36k0Q/rwx6e0Xhpv/8ST+I0XH5cML+vqS/F6WUC4NW29svdHbhAx4hEwQ516lEh/
	qfSw==
X-Gm-Message-State: ALoCoQlYb1fjH9ArPI310LTZAaV4TWSdy8ztUliqaorn5GRlF+He9BlPnJb7w01sbzqbUCp4pycw
X-Received: by 10.180.92.40 with SMTP id cj8mr6020829wib.92.1436885803385;
	Tue, 14 Jul 2015 07:56:43 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lj14sm3644571wic.18.2015.07.14.07.56.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jul 2015 07:56:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 15:51:00 +0100
Message-Id: <1436885463-4577-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1436885463-4577-1-git-send-email-ross.burton@intel.com>
References: <1436885463-4577-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/7] depmodwrapper-cross: set S correctly
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
X-List-Received-Date: Tue, 14 Jul 2015 14:56:44 -0000

This recipe doesn't unpack any source, so set S to ${WORKDIR}.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 44b7650..8acb3a8 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -2,6 +2,8 @@ SUMMARY = "Wrapper script for the Linux kernel module dependency indexer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+S = "${WORKDIR}"
+
 INHIBIT_DEFAULT_DEPS = "1"
 # The kernel and the staging dir for it is machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.1.4


