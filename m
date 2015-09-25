Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id F063D76FFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 22:32:22 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so36635765wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 15:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dxyVjpRCOT1neczuhjXwmtan2eAJrPKIlMefq5zRVyY=;
	b=LLgaDhBjKI610Ia6eXUZJIszuPATUg++iPHbPXMVsg13XTTi7beh5FiH7JM2Hn/xGY
	WHUrc8dhc3ZVhHaEVzwuY85XfOmRoAmm0WfJJwzsvT/whwNkIF6o4DK569daSbYNyICe
	m8850zcIOD5rpvH8IuL7tUOMtUJzNGejwvJoB1EgqgPG54tpHBA7pCu6XU4KlQ0sY/dy
	hogHkBYdcjBAnciA5xmVXljjPwDsVj5OW3zKDdTp8X4xoZgVAR0VkUsCEdepga1xCUMG
	SSrjthTM5d6EDc9gY41QR0bZrjpSBRmpWfJM9z5dCiFbeA47Yqc9SQSHsYca+sHqpUQZ
	Jw3g==
X-Gm-Message-State: ALoCoQnI8IgKs8f7wJuqN2ORerUBIEjOENfO78OyWnOon21V/jzH9BU9KOJWajeGdiM0/U0iOBc5
X-Received: by 10.194.179.103 with SMTP id df7mr9653876wjc.69.1443220342856;
	Fri, 25 Sep 2015 15:32:22 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	ki7sm5408816wjc.28.2015.09.25.15.32.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Sep 2015 15:32:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 23:25:13 +0100
Message-Id: <1443219913-18502-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443219913-18502-1-git-send-email-ross.burton@intel.com>
References: <1443219913-18502-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] librsvg: tell configure where gdk-pixbuf-query-loaders is
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
X-List-Received-Date: Fri, 25 Sep 2015 22:32:23 -0000

Now that gdk-pixbuf-query-loaders isn't in the path, tell configure where to
find it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.40.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
index a8b0e4f..06552c2 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
@@ -17,6 +17,8 @@ SRC_URI += "file://gtk-option.patch"
 SRC_URI[archive.md5sum] = "fadebe2e799ab159169ee3198415ff85"
 SRC_URI[archive.sha256sum] = "965c807438ce90b204e930ff80c92eba1606a2f6fd5ccfd09335c99896dd3479"
 
+CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
+
 EXTRA_OECONF = "--disable-introspection --disable-vala"
 
 # The older ld (2.22) on the host (Centos 6.5) doesn't have the
-- 
2.1.4


