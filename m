Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2307177055
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 22:03:21 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so19144342wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 15:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ip7PKL2hJycN1sUyaB1tLWHsisIFKWA5Mwb+Hl72tTI=;
	b=S0k1CQqfdEmd8eoqFpSAUmgYIsHT0nW2JcStF5bIE7tLSkRl6uZEvfgBEw2Zv2rbb/
	GoGMZg18UZW3ohsi4Ckquov6gAk64STiux3cEunjuPNm+veEih276uV2s+S4pe32MICA
	lU0VX6/eVkDJIsc8jfg0f7GW58AFkym5Bpu7Dxaoqjrc6yEhe/DNXVZzxITOGG3abMVt
	8HJFoQ6mPdrt10tArNqhri/6KHocZ/wxmNB5BJmOq7iLSrZbSlw8DyKCJZyLe/Hw4h9n
	u9lvQRdpZTAYYNhP2CollbnS4g0+49GxDp5YLhUQ1VUvxANLEBLlI5FCu5rK1tJVkiVm
	vpkg==
X-Gm-Message-State: ALoCoQnggBORkATo0bEiUI9U7ABPEh6ZDWdwn2gvCDeIpw9QDAnxAzoL4Appqa+vHcsIJRoRHwNF
X-Received: by 10.194.179.231 with SMTP id dj7mr34120626wjc.146.1445292201584; 
	Mon, 19 Oct 2015 15:03:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	jd7sm42607072wjb.19.2015.10.19.15.03.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 15:03:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 22:55:43 +0100
Message-Id: <1445291743-6618-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1445291743-6618-1-git-send-email-ross.burton@intel.com>
References: <1445291743-6618-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 5/5] subversion: add explicit dependency on file-replacement-native for native builds
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
X-List-Received-Date: Mon, 19 Oct 2015 22:03:22 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/subversion/subversion_1.8.13.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.8.13.bb b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
index f843b95..9c9bdb1 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.13.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Subversion (svn) version control system client"
 SECTION = "console/network"
 DEPENDS = "apr-util serf sqlite3 file"
+DEPENDS_append_class-native = " file-replacement-native"
 RDEPENDS_${PN} = "serf"
 LICENSE = "Apache-2"
 HOMEPAGE = "http://subversion.tigris.org"
-- 
2.1.4


