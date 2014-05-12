Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (unknown [209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id D370060E79
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 12:22:39 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id bs8so4360313wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 05:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UsyvLH3rcFk14SV+mMHIeNpqdLg6HJSmsNzK9UUznr0=;
	b=OZHfhP0IYnx8WRjb4V+yzG+7U9bnXvJA4ujcfkRs6aZaj6RHw4j29bLMF8i5zTJ4hZ
	rq+IOhRfONLwhahqNsbHS4N1lAyG6PCsPC57l9TEB2pGXoMJwhnMJjlh/+jPPC88dUzH
	WKkrH+5O7L8eXbPuSvrVtlfB+AhMyelt9Jtyz12jmIZlsLwPXjyRxgAw1TRTc7r7csKE
	PNWUNO3fwGt30aCD7SRMQfngw7V8t/rDDieFq+fzrhEi3sFR2xJIDe0duBYPJdlxeH+r
	C0Gdo8Wn75Lbb0LGA5Px8qRuWhoXglhgXRbVb8+wFhIHiY7WWJ/l48rx403KR/0tPj4V
	bOmA==
X-Gm-Message-State: ALoCoQnvBsz67mbbynjgSvz5rwf7NrUZAH9Mg8lDOLeC1OGHHhQGfIpX8sKb1o6+we31zxd4vQy2
X-Received: by 10.194.80.7 with SMTP id n7mr21317005wjx.8.1399896907864;
	Mon, 12 May 2014 05:15:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ct2sm17699110wjb.33.2014.05.12.05.15.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 05:15:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:14:52 +0100
Message-Id: <1399896893-486-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399896893-486-1-git-send-email-ross.burton@intel.com>
References: <1399896893-486-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 6/7] json-glib: upgrade to 1.0.0
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
X-List-Received-Date: Mon, 12 May 2014 12:22:40 -0000

Inherit lib_package so that the newly added binary doesn't ship in the library
package.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../json-glib/{json-glib_0.16.2.bb => json-glib_1.0.0.bb}        |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/json-glib/{json-glib_0.16.2.bb => json-glib_1.0.0.bb} (74%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_0.16.2.bb b/meta/recipes-gnome/json-glib/json-glib_1.0.0.bb
similarity index 74%
rename from meta/recipes-gnome/json-glib/json-glib_0.16.2.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.0.0.bb
index 65da8c2..ce00709 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.16.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.0.0.bb
@@ -12,9 +12,9 @@ DEPENDS = "glib-2.0"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "0c6121741956fc34933a7ebae5868ec2"
-SRC_URI[archive.sha256sum] = "a95475364ec27ab1d2a69303cf579018558bfb6981e3498b3aaf1e6401f7422c"
+SRC_URI[archive.md5sum] = "d13485f5aa3b93227bbeb689ccfb596c"
+SRC_URI[archive.sha256sum] = "dbf558d2da989ab84a27e4e13daa51ceaa97eb959c2c2f80976c9322a8f4cdde"
 
-inherit gnome gettext
+inherit gnome gettext lib_package
 
 EXTRA_OECONF = "--disable-introspection"
-- 
1.7.10.4


