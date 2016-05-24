Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 93FB46FF5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:22 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 24 May 2016 04:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498238"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:33 +0300
Message-Id: <7538d28f4e18965ee4487bede6c6c7f5690a3824.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 44/45] python-numpy: move recipe to own directory
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
X-List-Received-Date: Tue, 24 May 2016 11:54:23 -0000

This is done so that patches can be shared with python3-numpy

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch       | 0
 .../{python/python-numpy => python-numpy/files}/aarch64/_numpyconfig.h    | 0
 .../python-numpy/powerpc64 => python-numpy/files/aarch64}/config.h        | 0
 .../{python/python-numpy => python-numpy/files}/add-glibc-check.patch     | 0
 .../{python/python-numpy/mipsel => python-numpy/files/arm}/config.h       | 0
 .../{python/python-numpy/mipsel => python-numpy/files/arm}/numpyconfig.h  | 0
 .../{python/python-numpy => python-numpy/files}/armeb/config.h            | 0
 .../{python/python-numpy => python-numpy/files}/armeb/numpyconfig.h       | 0
 .../{python/python-numpy => python-numpy/files}/mips/_numpyconfig.h       | 0
 .../{python/python-numpy => python-numpy/files}/mips/config.h             | 0
 .../python-numpy/powerpc64 => python-numpy/files/mips64}/_numpyconfig.h   | 0
 .../{python/python-numpy/mips64n32 => python-numpy/files/mips64}/config.h | 0
 .../{python/python-numpy => python-numpy/files}/mips64n32/_numpyconfig.h  | 0
 .../{python/python-numpy/mips64 => python-numpy/files/mips64n32}/config.h | 0
 .../{python/python-numpy/arm => python-numpy/files/mipsel}/config.h       | 0
 .../{python/python-numpy/arm => python-numpy/files/mipsel}/numpyconfig.h  | 0
 .../{python/python-numpy => python-numpy/files}/powerpc/_numpyconfig.h    | 0
 .../{python/python-numpy => python-numpy/files}/powerpc/config.h          | 0
 .../python-numpy/mips64 => python-numpy/files/powerpc64}/_numpyconfig.h   | 0
 .../python-numpy/aarch64 => python-numpy/files/powerpc64}/config.h        | 0
 .../files}/remove-build-path-in-comments.patch                            | 0
 .../{python/python-numpy => python-numpy/files}/x86-64/_numpyconfig.h     | 0
 .../{python/python-numpy => python-numpy/files}/x86-64/config.h           | 0
 .../{python/python-numpy => python-numpy/files}/x86/config.h              | 0
 .../{python/python-numpy => python-numpy/files}/x86/numpyconfig.h         | 0
 meta/recipes-devtools/{python => python-numpy}/python-numpy_1.10.4.bb     | 0
 26 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/aarch64/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/powerpc64 => python-numpy/files/aarch64}/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/add-glibc-check.patch (100%)
 rename meta/recipes-devtools/{python/python-numpy/mipsel => python-numpy/files/arm}/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/mipsel => python-numpy/files/arm}/numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/armeb/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/armeb/numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/mips/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/mips/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/powerpc64 => python-numpy/files/mips64}/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/mips64n32 => python-numpy/files/mips64}/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/mips64n32/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/mips64 => python-numpy/files/mips64n32}/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/arm => python-numpy/files/mipsel}/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/arm => python-numpy/files/mipsel}/numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/powerpc/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/powerpc/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/mips64 => python-numpy/files/powerpc64}/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/aarch64 => python-numpy/files/powerpc64}/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/remove-build-path-in-comments.patch (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/x86-64/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/x86-64/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/x86/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/x86/numpyconfig.h (100%)
 rename meta/recipes-devtools/{python => python-numpy}/python-numpy_1.10.4.bb (100%)

diff --git a/meta/recipes-devtools/python/python-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
rename to meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
diff --git a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/aarch64/_numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/aarch64/_numpyconfig.h
diff --git a/meta/recipes-devtools/python/python-numpy/powerpc64/config.h b/meta/recipes-devtools/python-numpy/files/aarch64/config.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/powerpc64/config.h
rename to meta/recipes-devtools/python-numpy/files/aarch64/config.h
diff --git a/meta/recipes-devtools/python/python-numpy/add-glibc-check.patch b/meta/recipes-devtools/python-numpy/files/add-glibc-check.patch
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/add-glibc-check.patch
rename to meta/recipes-devtools/python-numpy/files/add-glibc-check.patch
diff --git a/meta/recipes-devtools/python/python-numpy/mipsel/config.h b/meta/recipes-devtools/python-numpy/files/arm/config.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/mipsel/config.h
rename to meta/recipes-devtools/python-numpy/files/arm/config.h
diff --git a/meta/recipes-devtools/python/python-numpy/mipsel/numpyconfig.h b/meta/recipes-devtools/python-numpy/files/arm/numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/mipsel/numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/arm/numpyconfig.h
diff --git a/meta/recipes-devtools/python/python-numpy/armeb/config.h b/meta/recipes-devtools/python-numpy/files/armeb/config.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/armeb/config.h
rename to meta/recipes-devtools/python-numpy/files/armeb/config.h
diff --git a/meta/recipes-devtools/python/python-numpy/armeb/numpyconfig.h b/meta/recipes-devtools/python-numpy/files/armeb/numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/armeb/numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/armeb/numpyconfig.h
diff --git a/meta/recipes-devtools/python/python-numpy/mips/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mips/_numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/mips/_numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/mips/_numpyconfig.h
diff --git a/meta/recipes-devtools/python/python-numpy/mips/config.h b/meta/recipes-devtools/python-numpy/files/mips/config.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/mips/config.h
rename to meta/recipes-devtools/python-numpy/files/mips/config.h
diff --git a/meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mips64/_numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/mips64/_numpyconfig.h
diff --git a/meta/recipes-devtools/python/python-numpy/mips64n32/config.h b/meta/recipes-devtools/python-numpy/files/mips64/config.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/mips64n32/config.h
rename to meta/recipes-devtools/python-numpy/files/mips64/config.h
diff --git a/meta/recipes-devtools/python/python-numpy/mips64n32/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mips64n32/_numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/mips64n32/_numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/mips64n32/_numpyconfig.h
diff --git a/meta/recipes-devtools/python/python-numpy/mips64/config.h b/meta/recipes-devtools/python-numpy/files/mips64n32/config.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/mips64/config.h
rename to meta/recipes-devtools/python-numpy/files/mips64n32/config.h
diff --git a/meta/recipes-devtools/python/python-numpy/arm/config.h b/meta/recipes-devtools/python-numpy/files/mipsel/config.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/arm/config.h
rename to meta/recipes-devtools/python-numpy/files/mipsel/config.h
diff --git a/meta/recipes-devtools/python/python-numpy/arm/numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsel/numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/arm/numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/mipsel/numpyconfig.h
diff --git a/meta/recipes-devtools/python/python-numpy/powerpc/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/powerpc/_numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h
diff --git a/meta/recipes-devtools/python/python-numpy/powerpc/config.h b/meta/recipes-devtools/python-numpy/files/powerpc/config.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/powerpc/config.h
rename to meta/recipes-devtools/python-numpy/files/powerpc/config.h
diff --git a/meta/recipes-devtools/python/python-numpy/mips64/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/powerpc64/_numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/mips64/_numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/powerpc64/_numpyconfig.h
diff --git a/meta/recipes-devtools/python/python-numpy/aarch64/config.h b/meta/recipes-devtools/python-numpy/files/powerpc64/config.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/aarch64/config.h
rename to meta/recipes-devtools/python-numpy/files/powerpc64/config.h
diff --git a/meta/recipes-devtools/python/python-numpy/remove-build-path-in-comments.patch b/meta/recipes-devtools/python-numpy/files/remove-build-path-in-comments.patch
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/remove-build-path-in-comments.patch
rename to meta/recipes-devtools/python-numpy/files/remove-build-path-in-comments.patch
diff --git a/meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/x86-64/_numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/x86-64/_numpyconfig.h
diff --git a/meta/recipes-devtools/python/python-numpy/x86-64/config.h b/meta/recipes-devtools/python-numpy/files/x86-64/config.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/x86-64/config.h
rename to meta/recipes-devtools/python-numpy/files/x86-64/config.h
diff --git a/meta/recipes-devtools/python/python-numpy/x86/config.h b/meta/recipes-devtools/python-numpy/files/x86/config.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/x86/config.h
rename to meta/recipes-devtools/python-numpy/files/x86/config.h
diff --git a/meta/recipes-devtools/python/python-numpy/x86/numpyconfig.h b/meta/recipes-devtools/python-numpy/files/x86/numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy/x86/numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/x86/numpyconfig.h
diff --git a/meta/recipes-devtools/python/python-numpy_1.10.4.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.10.4.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-numpy_1.10.4.bb
rename to meta/recipes-devtools/python-numpy/python-numpy_1.10.4.bb
-- 
2.8.1


