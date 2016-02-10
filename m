Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8250573219
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:43:44 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id s5so890747qkd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Xt6za3NtqgmB0Q5xAW+x33aKwY7cqo+sg04YXpwX0b0=;
	b=DVYZJHAvuNewURJfvMmY1d8jtNVYc31qp5shw9710EGRdVRKDXWqs7FHA9N0rNOe4w
	57iTPMxXFKRYbn5M9354eAiyZa5/6tpMqHN4WdbQhXCbswOI6/Hy30tAMntORC+YmpEw
	Whr/Hkz7UnIvLmeGSEVagYBxo7pRjxoEUk0kh7g9gg3OWfsmgdu0skYMveuF9j9z7nAJ
	JDhuyr0cot9m/NyY6TlMq77mHPKzBL9788UiDg8UmuwWkHOPYwC47fLqtYbGQR+J24w+
	2G1auYzF4kEqJPBM+mJKvQjXa/ffWyYR3O0GjxiWpOfT7kmorr8LVMhzja8dKWkWbZtM
	t/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Xt6za3NtqgmB0Q5xAW+x33aKwY7cqo+sg04YXpwX0b0=;
	b=Ae2Wk6GdPX0/JTAB4BKzizwJnMPlBtclE7wCXKIcLNWyH2mv0qR5QlazNeIFgB3urB
	HClB3/1hjMbEV6cTm4Ex18G0DU+9hDhLfXc9+OduULenoIXse+KSN0dcoPGgT03Z9UO0
	0JtLcQWbFNkf2oIiaU4VAwruWDVx+4kgeAoo+oTVhKZwtqHCSLrzKdEebSR01PN4pIGB
	NX9n5eX7r4tqYdB1DHZ7sILytfsvexWiM+7BOPHXCANgUpDcr2D1+C8mAk++4mInWSlf
	/xOt1dlqteIdBsKDacgAEuPpSeL3i4wGbFpIypcFMy4xLviPD0K9773Pzj0EyiTCFhLu
	3v8w==
X-Gm-Message-State: AG10YORAjXCerqLdX385B70SwFl7ufrQDgxODoqKPOaa04zLEVghji78ajICjO3ScyUgJA==
X-Received: by 10.55.75.131 with SMTP id y125mr49649356qka.61.1455126224936;
	Wed, 10 Feb 2016 09:43:44 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	a66sm1724349qkb.20.2016.02.10.09.43.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 09:43:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 17:43:35 +0000
Message-Id: <cda896f43f7f79126c1d5733734e727b26918eaa.1455126045.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
References: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
In-Reply-To: <cover.1455126045.git.raj.khem@gmail.com>
References: <cover.1455126045.git.raj.khem@gmail.com>
Subject: [PATCH 8/9] gdb: drop unnecessary CC_FOR_BUILD etc exports
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
X-List-Received-Date: Wed, 10 Feb 2016 17:43:44 -0000

From: Andre McCurdy <armccurdy@gmail.com>

These exports are all provided by autotool.bbclass

  http://git.openembedded.org/openembedded-core/commit/?id=edf30561184ec42e5692a55fdf93304fac0fdb1b

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 6baeb0b..06272a9 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -22,16 +22,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
 		file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
 		file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
+
 inherit autotools texinfo
 
 SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
           "
-export CC_FOR_BUILD = "${BUILD_CC}"
-export CXX_FOR_BUILD = "${BUILD_CXX}"
-export CPP_FOR_BUILD = "${BUILD_CPP}"
-export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
-export CXXFLAGS_FOR_BUILD = "${BUILD_CXXFLAGS}"
-export CPPFLAGS_FOR_BUILD = "${BUILD_CPPFLAGS}"
 
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-- 
2.7.1


