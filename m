Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 708DF60670
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 14:21:44 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so28059439wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 06:21:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=A8/DfrzBuoj4ze5s24Tu6eMFiQS2lO/lnKNBa9UdDt4=;
	b=I8wQeZfj8YyUUo1IJlvNlrXr41AyXPLOCxidmatTkNOYWZROdZgyPwjcXCcAKCZm1k
	9qPHKbtw6scU9VbJMfu3UzF4IxvtA+rUyFyiskQ9i23AfdOio7CJA9TrMWl+J8480mTZ
	7r+K683xijtYNQt9S8NEQw77X+9OWJTX916Jv3cSib7c+e2gNaZIySbtVUcVSp71EAPo
	k5hGZeIzhIzqyY/AZdNxR/fVcogMiWCrEc/yaDqfGZnGOghJmHloGpc22OZOD3OjgljZ
	4gXtnQSfvoWKtvSf4nZrEBt53bvYkXpwxeNfyqko8vVb8AYjSIZF3JZo1MStU+MbbDMn
	0Krg==
X-Gm-Message-State: ALoCoQmK4ZK1yorBR0V8cAbff4/SEJisavqWMNwEATsnbghN1bJXbyXBLw56smWjqB6QLuV6U9jV
X-Received: by 10.194.187.235 with SMTP id fv11mr16452748wjc.16.1417702905260; 
	Thu, 04 Dec 2014 06:21:45 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	pl1sm25499820wic.16.2014.12.04.06.21.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Dec 2014 06:21:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 14:21:09 +0000
Message-Id: <1417702870-27012-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1417702870-27012-1-git-send-email-ross.burton@intel.com>
References: <1417702870-27012-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] gnome-doc-utils: set CLEANBROKEN
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
X-List-Received-Date: Thu, 04 Dec 2014 14:21:50 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index e148ce3..9587506 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -10,6 +10,8 @@ DEPENDS_class-native = "libxml2-native libxslt-native intltool-native glib-2.0-n
 
 inherit gnomebase gettext python-dir pythonnative autotools-brokensep
 
+CLEANBROKEN = "1"
+
 EXTRA_OECONF += "--disable-scrollkeeper"
 
 do_install_append() {
-- 
1.7.10.4


