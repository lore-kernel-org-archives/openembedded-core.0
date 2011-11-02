Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLVYg-0001Rk-Mc
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 08:48:26 +0100
Received: by faas16 with SMTP id s16so136780faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 00:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=fR/ah2pF/WH28C7tN3C6H8hjevh/HcT7jwtT2rQJjAQ=;
	b=NToJUDhEk82j7zghCxq7ExZgsDtC/4kGqwGjzbkjIuqHwu2lWxz7J4ciZeXpGU66ss
	L3wuvF2oLKs+4PTLRCnhQNStIVULy6duYzLX94Ndx/Atc4e56w/6czflZNpfbg12RoM0
	uNe5md5YvTmw/iUwG7rMP8BtfjdkPAiB6FwH8=
Received: by 10.223.16.82 with SMTP id n18mr6737442faa.2.1320219736063;
	Wed, 02 Nov 2011 00:42:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm3824190fag.21.2011.11.02.00.42.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 00:42:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2011 08:42:07 +0100
Message-Id: <1320219727-9233-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <4EB08D70.4050602@intel.com>
References: <4EB08D70.4050602@intel.com>
Subject: [PATCH] libxslt: use Copyright in LIC_FILES_CHKSUM instead of COPYING
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
X-List-Received-Date: Wed, 02 Nov 2011 07:48:26 -0000

* COPYING is replaced by symlink to Copyright during do_configure
  (see configure.in), then we end with link to nonexistent file like this:

OE om-gta02@shr ~/shr-core $ ll tmp/deploy/licenses/libxslt/
total 40
drwxr-xr-x   2 bitbake bitbake  4096 Nov  2 00:27 ./
drwxr-xr-x 818 bitbake bitbake 32768 Nov  2 00:27 ../
lrwxrwxrwx   1 bitbake bitbake     9 Nov  2 00:27 COPYING ->  Copyright
lrwxrwxrwx   1 bitbake bitbake    52 Nov  2 00:27 generic_MIT ->  /OE/shr-core/tmp/deploy/licenses/common-licenses/MIT

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.26.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
index 96bffc6..addc863 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "http://xmlsoft.org/XSLT/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0cd9a07afbeb24026c9b03aecfeba458"
+LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 
 SECTION = "libs"
 DEPENDS = "libxml2"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch"
-- 
1.7.7.1



