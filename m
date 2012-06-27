Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sjlch-0003Ls-Ot
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 08:21:09 +0200
Received: by dalh21 with SMTP id h21so895239dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 23:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=UEo7UOihad0wVtQE08H/fw+CQcy9MqmveVaAdSL4nlQ=;
	b=Sdi1xMe0LuVpN3uhrcDzImDaaH65brGFwIgai2YcqZHr5iadoOLoi+VplNFH8h51IY
	Fx3Zi15IoABLggdeD5fLr/W1iF4khdjhWffyJhEaBStDy9SzLyJowl6dv5PF+ZI1CrHN
	Z8+Iaqc7mHYl1a9KWKcbGHlSdZjrIDjI1BDntkofCQ/hr1YiOGCZLjhoHfXNynx5IWM/
	WdniMcb9cD2cks3I1zHN0c/v2jbZGULqXqw9ZiN0UojnceqU5CiUUfiIug8WS/JplLyp
	f/74jQJHx5M5Yu8yOmuFdLN0cKbg6mYwR81OtORrYZZiGzJvd55wI8mijSrsYdLHms2e
	WV0w==
Received: by 10.68.203.66 with SMTP id ko2mr60330372pbc.84.1340777413849;
	Tue, 26 Jun 2012 23:10:13 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ob9sm14168304pbb.28.2012.06.26.23.10.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jun 2012 23:10:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2012 23:09:50 -0700
Message-Id: <5dc122fc8875b60ab5f7ee8e910ee668206505b7.1340777116.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <55a411d66293b6d2196e98376f0fb9e4487b4bdf.1340777116.git.raj.khem@gmail.com>
References: <55a411d66293b6d2196e98376f0fb9e4487b4bdf.1340777116.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340777115.git.raj.khem@gmail.com>
References: <cover.1340777115.git.raj.khem@gmail.com>
Subject: [PATCH 6/7] bison: link in librt on uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2012 06:21:10 -0000

uclibc has some functions in librt that are needed
by bison build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/bison/bison_2.5.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/bison/bison_2.5.bb b/meta/recipes-devtools/bison/bison_2.5.bb
index c5113cd..fc3bb6d 100644
--- a/meta/recipes-devtools/bison/bison_2.5.bb
+++ b/meta/recipes-devtools/bison/bison_2.5.bb
@@ -21,6 +21,7 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI[md5sum] = "687e1dcd29452789d34eaeea4c25abe4"
 SRC_URI[sha256sum] = "722def46e4a19a5b7a579ef30db1965f86c37c1a20a5f0113743a2e4399f7c99"
 
+LDFLAGS_prepend_libc-uclibc = " -lrt "
 DEPENDS_virtclass-native = "gettext-minimal-native"
 SRC_URI_virtclass-native = "${BASE_SRC_URI}"
 
-- 
1.7.9.5



