Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9B3037F939
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 18:45:37 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id g24so7178027wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 11:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0MO9anmAa2ArO6HKOzHjXKZZkDsU3yQA8xMQ3iCgPS8=;
	b=Qicj7CI1byDzG0PlOAuYqG1OGDvmXJBJ/t7Czxe7s5ksH0M1//jotoerOODgXh7kzi
	qophEUnnp1dPs6f2w0zXsVMxMVv/VyBN1cap1FqoamiJvXgGLQNULpFHVpx/sxINKZrk
	gfARXqkcfKXBOJlZ6nz3gjAh/4+K37pW+WyIvAk3pzdNVqsmyqBeREHT0hI9BQeJu/Er
	YmPx3CjYpS9fbpPoXv2rAsWrqOqQf2I0tFW9HdQC2hQPLeendE428riOvgTmYTBXhMuF
	5HhCc6/HJByn3ZZZyrbCzqX52ygnCtPbqCzJGjlOr0XuZQJ/U+eYjBBSYO+fOB34Fuc2
	nqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0MO9anmAa2ArO6HKOzHjXKZZkDsU3yQA8xMQ3iCgPS8=;
	b=UQH4bX5kxnFOq5DEm7YDXyRQmS+FOwcTbZFcFxonS9wcratf9ZJqwtZVwWNT0AlVKp
	Q0Z07M3GnBnfXpwCviPhqpVyrWqCzNryM28QMjOb5Xb+do0WwcYqrNMNrCoxGoKYt2We
	2lDWUwtFI/oHV4sAgoT61V7723sMrmOV1OzH2IOyj/1ps2GE/pea7oBAKqgfzsvNsl8o
	P161LAKWTw4fteEht+wtn0AOrR8i23rd9OQsTZ6OFd/EvN4HUuSUhCvA4LAS9j3llTFW
	rCHSu5OKewBPs0rR9dqUtvl8m5uVTegx+Y2LY0FdoIQ8J11agFtrFtto8ZOawqqFtuh4
	lfUA==
X-Gm-Message-State: APjAAAWKsoD7ZpGvq7j2nOL7DjjgzC3cbmk8X/4Njpjb2LxEaO7YdTVp
	+80qJiBEbpOhVo5V6dVlh+eUnT9n
X-Google-Smtp-Source: APXvYqwSHFmxgDdpbntP5TP0tns19MqM0Gt+k7A0uV4WpxEQelmYFciXns2vqy2JMP7xW6KxIPVbAQ==
X-Received: by 2002:a05:600c:22cd:: with SMTP id
	13mr8364299wmg.52.1572201937851; 
	Sun, 27 Oct 2019 11:45:37 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id q6sm9668484wrx.30.2019.10.27.11.45.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 11:45:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Oct 2019 19:45:29 +0100
Message-Id: <20191027184529.31214-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] Introduce IMAGE_LINGUAS_COMPLEMENTARY
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
X-List-Received-Date: Sun, 27 Oct 2019 18:45:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The allows layers adding packages other than locales automatically to images
according to what user selects in IMAGE_LINGUAS.

E.g if a layer has recipes creating packages as:
| ${PN}-foo-en-us / ${PN}-foo-en-gb / ${PN}-foo-de / ..

it would set
| IMAGE_LINGUAS_COMPLEMENTARY_append = " *-foo-%s"

in layer.conf to make those packages matching IMAGE_LINGUAS added to image.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/image.bbclass     | 2 +-
 meta/lib/oe/package_manager.py | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index f4633da3d5..c2824395c9 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -124,7 +124,7 @@ python () {
 def rootfs_variables(d):
     from oe.rootfs import variable_depends
     variables = ['IMAGE_DEVICE_TABLE','IMAGE_DEVICE_TABLES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE','IMAGE_ROOTFS_EXTRA_SPACE',
-                 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
+                 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS', 'IMAGE_LINGUAS_COMPLEMENTARY',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
                  'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS']
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index c841fdbf29..c7135ce918 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -570,6 +570,8 @@ class PackageManager(object, metaclass=ABCMeta):
 
             for lang in split_linguas:
                 globs += " *-locale-%s" % lang
+                for complementary_linguas in (self.d.getVar('IMAGE_LINGUAS_COMPLEMENTARY') or "").split():
+                    globs += (" " + complementary_linguas) % lang
 
         if globs is None:
             return
-- 
2.21.0


