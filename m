Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2B867770CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 21:41:09 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so64827421wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 14:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ip7PKL2hJycN1sUyaB1tLWHsisIFKWA5Mwb+Hl72tTI=;
	b=VKk8whhU5Tq/Bp4XexvIoR3y9CwCMY6Djfy3fCOTIF2MtbkZhoULuQnnV0buPyNuzj
	/AZUakEmATiyPJi4FKei9LkDQar6SBSTQss0EPSH28H2sVFeCHMuDt+EzimezIWh6i0k
	tNshmw1tJQGgoWqeWFyzP+oeMERU4dSU2VIcvz89cgv5ecK71y35kEvpOeILG5WOq3U3
	TNdAQ/KG6MZtvnP84F7+NakM/eQLBmq31qetgbMSfqa6hoJtKOaa6Y6/2EtBuS79hSXt
	FnTmKEjWridvMrSXeSYjAGP+1vLh7F1ykAqzDo784CHFxUMTSlB2zm3/wMNB+O1kncKi
	7bRw==
X-Gm-Message-State: ALoCoQl6FHwHWdlPCcYOT2uJ27qozGw+ukfnCXEE1SSGYd7Yngr/cy9P8h3pNomX3Py34XIggQGB
X-Received: by 10.194.173.42 with SMTP id bh10mr7425107wjc.141.1445377269657; 
	Tue, 20 Oct 2015 14:41:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lf10sm6209805wjb.23.2015.10.20.14.41.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 14:41:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 22:33:29 +0100
Message-Id: <1445376809-25202-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1445376809-25202-1-git-send-email-ross.burton@intel.com>
References: <1445376809-25202-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V3 5/5] subversion: add explicit dependency on file-replacement-native for native builds
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
X-List-Received-Date: Tue, 20 Oct 2015 21:41:11 -0000

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


