Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 301FB6612C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:27:19 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id k135so3881219lfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 07:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oHNFKKbW9hM3sb60f5CQqj5x4FlAbqTKomOgYt5zi14=;
	b=rZqIrhmYSxIESzeZav0+jQIR54T9zkqd/Azd759H8TlXxvSL6muxX8Wup1/NRmPMj8
	MjN3LQrYgM91RdOPOFUbrAwkXp+Pkv9RiE+q8EADDbHrPjkuqKqpD/0sWIT1abP6enLz
	ukoooRd+1GXGe6+NTPJcIzmqt+7oy12UCFJ+bDMbDD8tki0k7JtC4nZ4tDrFBN6eUX4K
	7fCyao6a/6y/N1yJ3T20+BygiP2cCTkY4fxXjYUIyWudVudbW7eQJ624h/v6/jnfxbYt
	wYZyPqILd2ZiwzQpHps9/82/SrP6V5YGcz6kug41PKD4WPd0KfnSTWtz+jmd2TOeHvrZ
	SsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oHNFKKbW9hM3sb60f5CQqj5x4FlAbqTKomOgYt5zi14=;
	b=Ht7YmmRu2jc5ZrZZaD9GZ/S0VXOsmIebjQ7Q8LmiNo0yxB8R5cydd3bWxV/LoGbi1b
	sg6WpcaQzPBzy5nsFfi/GvVDWDrwt73hpUDfNyJa2xUvURYoxsrfFLaWpU/BJwbSwMUf
	OYMLlK8Q1lPJyYVpnJuQSWv1WJR70sFEXj96u/AI3pGQ860h7Xvk3ZqxQHctfuzX6Mfl
	x/CAj5Of0h8qTgXYwetJlkHsBimHppDZ3bg5kPB7xUgo7smIiuBZWpsVnKg2hcOHmNcO
	XVqRHUrDnlra3v8yHNg5iV0UiV4n2y+Ry5uTqtZ8aeOwkDV4Ey+apQditcER1E6pTeZ6
	BWUw==
X-Gm-Message-State: AE9vXwM2gR2di01Jv4WfitVVksH2fiios6FiKWnjqC+9m6J7waim9CfeI3c6s4aZhrX8Dw==
X-Received: by 10.25.218.75 with SMTP id r72mr1281206lfg.131.1472221639475;
	Fri, 26 Aug 2016 07:27:19 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id g3sm3995122lfe.14.2016.08.26.07.27.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Aug 2016 07:27:18 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@intel.com
Date: Fri, 26 Aug 2016 16:27:13 +0200
Message-Id: <20160826142713.18380-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] python-3.5-manifest.inc: the core module RDEPENDS on misc
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
X-List-Received-Date: Fri, 26 Aug 2016 14:27:21 -0000

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
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.9.3


