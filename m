Return-Path: <dominic.sacre@gmx.de>
X-Greylist: delayed 313 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Jul 2015 15:04:29 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by mail.openembedded.org (Postfix) with ESMTP id 63C6760125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 15:04:29 +0000 (UTC)
Received: from dastp.fritz.box ([79.253.156.126]) by mail.gmx.com (mrgmx002)
	with ESMTPSA (Nemesis) id 0M1msU-1Z44nh25mc-00tiVO;
	Tue, 28 Jul 2015 16:59:15 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2015 16:58:34 +0200
Message-Id: <1438095518-7513-1-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.4.6
MIME-Version: 1.0
X-Provags-ID: V03:K0:9SB2oAtqQoylRwTGvlYjO8PpOo0A7F7S3kkCARMx82Blt7d3KGS
	MykTpKout1xGowbIp6aBEu9DRWh20Xk7tCbsjAQ5kYVD4EZN44W54oYQWG/NtLTyslqrChO
	o4Xo8dWEffy3w4KoGCUxVZBKA654X6GR0U71g2lRh5OqcNhkXVoQDtVF3IrlyCxnfSyQ6oU
	AGRX+9IXaVoiKbMEZqLWA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:p4a75OGImmA=:P1ifWwVatc4Dmdow3le+uq
	VdKt3dhY/YldyAakQQ1424bNsNsSpkFABgD4s7RNjJso7NsgFjyqtmVKqTT4z8jYFbMU7ulXs
	Xexhx+eD4sYIItT/u3kurTgF2ckpUJZyZ6S/sUiseWvbjt7KyFcFqANQnnpgBOvg9f4Y8WFOc
	Z92JDWv+u4wSI8UDWv5iFME+Q1MF8KIXtsXhPdW9d79GDmX0pf+Z/BIKCkKkPVw7RWX50jf3I
	HCjuK2lYFZcSS8XBHks1Ltdy5z5Lat8CppbFKcbj/3nY12zgW3fZ84gLQom0rRsO9tD3CFc3X
	2fGmcntoFx1RznWoWpNa6l4rMDvjAggdXmbrA0FfNxBrPErk2h4Cs1Ebp6QLOkxQgvTEmWWHo
	FMTHJJjqUBhHJXIATp9luz2EDsZpNlr8IKXTkGX0hr/IBMOhEk7sxg3OvU2G/2M/LcyDPK9zI
	F4lLedyxMYlXdxHUxb+JJ+T2mWlslt1n5JQ2ZJv7+rJZJEQrhZCf61L8mo9BBqNR/iU2LD9CQ
	MYUg/BLN+eNPUML7+ETOC1TwPkYNKgldG9fB18IWTCnKX/A5MTWO62DimuxW4DqofQ8sOzDaa
	robiSXg5QUGTjUCwfDH4KGfM7pIA8FIwzEdxeNu8rz6w5XVkE7doI5+ggS1+AhFICaIky9+UE
	+4wzkwKRDJLDa+D+SHE700sI0PbTzyJtmShg6hRqTBHO3l7enYxEJce8JY33Es1/kkIE=
Subject: [PATCH 0/4] python3: fix building extension modules, make python3-modules installable
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
X-List-Received-Date: Tue, 28 Jul 2015 15:04:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series of patches fixes several issues with the python3 recipe.
These caused packages to be incomplete or missing, and prevented the
python3-modules package from being installed.

[YOCTO #8048]

Dominic Sacré (4):
  python3: detect libraries in STAGING_LIBDIR
  python3: remove package python3-robotparser
  python3: remove 2to3 symlink from package python3-2to3
  python3: delete patches that don't get applied anywhere

 .../python/python-3.4-manifest.inc                 | 12 ++---
 .../python3/06-ctypes-libffi-fix-configure.patch   | 44 ---------------
 .../python/python3/fix-ast.h-dependency.patch      | 26 ---------
 .../python/python3/fix_ssl_include_dir.patch       | 41 --------------
 .../python3/pip_build_directory_unclean.patch      | 28 ----------
 ...python3-fix-build-error-with-Readline-6.3.patch | 62 ----------------------
 .../python/python3/remove_sqlite_rpath.patch       | 19 -------
 .../setup.py-find-libraries-in-staging-dirs.patch  | 30 +++++++++++
 meta/recipes-devtools/python/python3_3.4.3.bb      |  5 +-
 scripts/contrib/python/generate-manifest-3.4.py    |  5 +-
 10 files changed, 39 insertions(+), 233 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
 delete mode 100644 meta/recipes-devtools/python/python3/fix-ast.h-dependency.patch
 delete mode 100644 meta/recipes-devtools/python/python3/fix_ssl_include_dir.patch
 delete mode 100644 meta/recipes-devtools/python/python3/pip_build_directory_unclean.patch
 delete mode 100644 meta/recipes-devtools/python/python3/python3-fix-build-error-with-Readline-6.3.patch
 delete mode 100644 meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
 create mode 100644 meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch

-- 
2.4.6


