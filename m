Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id DCD7D6011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 15:30:57 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id k135so3954773lfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 08:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=exg+l27HUeSXF8PJ9XyHtNCnxIzARLd468CBOdlrZzU=;
	b=EgJ7Y2nhHaGdBEMqqAO9dEKWLTK5s+ude10C1/ek1+OJV4yIc3Jrt9SZRhZXBuu0z/
	nqH8s37dz/jpOcIZZyQKMPbTNWAunb6Z+GRfZAdqbe8qfxJd+33YvUT+KxPhHgoYkVee
	f7akXvWRpvzHa9Q06N5u9Qw9x2K/g9SPgh+7yGsF127QjAtwuAZq5hxwpHLi7Bk2AXIr
	DL/Q0PGsOcVavz9BJYFPTqakeIO1/5PfhIjFaI16ftDN4/iY5isYtvOR2I0wKEy3COsB
	5zuRTUBnok1054p6kCgqLoxYUMaEGzaVTowrli1FLQM53xQuOypTz9PtaRjfzBzqeirQ
	/sJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=exg+l27HUeSXF8PJ9XyHtNCnxIzARLd468CBOdlrZzU=;
	b=fvA5/O3m9zMOXyz4tyuoeEwVKhnrAN89g7J8a3JE73T1UmxfXrY1MpCkp5Iu/6t9Wa
	HkoNs6tRb20MWUmHxHwFyLtn8OID2moKJFrypjs+QHwO/cqJO4Y9QBrL7jh8nvn9VdsX
	uv5BIfHn54gGRVRBKaG/pB+okqW8FznPT1gGlNc6ZmTkSiWVgQlYJs8fX5UbJ1h8RqfI
	fQk11L6NgrXgoBn5NR5CsxGU17FwU+KXUy4cdXtiU0qbMRX7eRgWr2df5fGXQjHppcmm
	1nn7P6VsX/ciZTtXzOZoo7RRUPANFYBTtLy4p4RCF8xazjWV2SYzBoecrDxBZ3LRd8vj
	qEjA==
X-Gm-Message-State: AE9vXwP1dJQYXK53NBNOtQMoGkPsGPEBh8Xumr7uUhEJ694qFj0t81aXKf1YHHZhTnnITA==
X-Received: by 10.46.71.19 with SMTP id u19mr1573538lja.23.1472225457488;
	Fri, 26 Aug 2016 08:30:57 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id 21sm4084344ljf.7.2016.08.26.08.30.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Aug 2016 08:30:56 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@intel.com
Date: Fri, 26 Aug 2016 17:30:54 +0200
Message-Id: <20160826153054.27316-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH v2] python-3.5-manifest.inc: the core module RDEPENDS on misc
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
X-List-Received-Date: Fri, 26 Aug 2016 15:31:01 -0000

Fixes:

root@qt5022:~# python3
Python 3.5.1 (default, Aug  5 2016, 13:25:54)
[GCC 5.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import collections
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.5/collections/__init__.py", line 10, in <module>
    from operator import itemgetter as _itemgetter, eq as _eq
ImportError: No module named 'operator'
>>>

root@qt5022:~# dpkg -S /usr/lib/python3.5/collections/__init__.py
python3-core: /usr/lib/python3.5/collections/__init__.py

Reported-by: Dimitrios Katsaros <patcherwork@gmail.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---

v2: also hack the generate file
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 304611432e37..fb05d6d36df3 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -38,7 +38,7 @@ RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs ${PN}-importlib ${PN}-thread
 FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/tarfile.* ${libdir}/python3.5/lib-dynload/bz2.*.so ${libdir}/python3.5/lib-dynload/zlib.*.so "
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
-RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math"
+RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math ${PN}-misc"
 FILES_${PN}-core="${libdir}/python3.5/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/ast.* ${libdir}/python3.5/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/configparser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/getopt.* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/new.* ${libdir}/python3.5/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/struct.* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/site.* ${libdir}/python3.5/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/types.* ${libdir}/python3.5/platform.* ${bindir}/python* ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/config/Makefile ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
 SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 2906cc66d042..1cac9a7fe1c6 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -166,7 +166,7 @@ if __name__ == "__main__":
     # Parameters: revision, name, description, dependencies, filenames
     #
 
-    m.addPackage( "${PN}-core", "Python interpreter and core modules", "${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math",
+    m.addPackage( "${PN}-core", "Python interpreter and core modules", "${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math ${PN}-misc",
     "__future__.* _abcoll.* abc.* ast.* copy.* copyreg.* configparser.* " +
     "genericpath.* getopt.* linecache.* new.* " +
     "os.* posixpath.* struct.* " +
-- 
2.9.3


