Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 303656013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:19:30 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id u8so50377647lbk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 04:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Y3JtpLNuAc2znW3mAZafgM39OpqHAkRFzGcPHP/c3tA=;
	b=yvksiLEaoD8Bvxx7cFrOxfxb0DBquKmxYKgeUyzOXLqYE3NDSqnImHLwK6/OuOTTnA
	DGnMUbvtxjH8y1Ojf8zwWtqJYksAUHMeyK1oDLsnrScDP/dhxg+V0YNGcbjpDsKGfl34
	PHzO5ijjDjHb1PqDSEntWqcO5078fibC5b4vAqkgcJqleW8NTi6tVXBYUie5vR/mBRSn
	64ex+l+hJdDvJPdkUWlzwt/IXUUUHs+jFW2HQdma6Ll2MZwffBEZfP/RyBf83sXeqLpY
	Qn44NeH2o+daVulnivwv8w2lirhB89UOe/4T3Kum80yYXn5FpkekB3MI4A4GvVeudhuf
	MRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y3JtpLNuAc2znW3mAZafgM39OpqHAkRFzGcPHP/c3tA=;
	b=ldeM9OLHcgdJcj4cojqUbPJVkC/3z7RA65z86ImWTenMtiX127zT0EcKOr0UF+hC55
	Np2hgiIIjL9gpKAP4Et/OVI6e2BkXs8bzNBC9TzBylJf+ci1Qy9i+1yEez+TSQ3rxH+y
	Kn4pNNIxSfwe5dO7lNRy9narIa06wC8/5Z9XYXbt4/SCsQ+GwAAMRUONG3Io+jJZN/7S
	V+3ofkggEfXb2MoZBm7eI4swg9bNMYvrkUSFcUAjToEGDD1VfuQO8HuYOIEoTN0xqX4g
	bfwV3rvi9sB8N9LnAs/9hpW0fRY/8ehVFfERDSE77DQQqOeIH5lhuJjGIDIwr81lWGTZ
	Tmtw==
X-Gm-Message-State: AD7BkJKFGwafea3lmZk6JQzJtOOBG6/5sNXOqhuYtUbsaY0GvQVCrq+qofGBs+aFZi4H1g==
X-Received: by 10.112.17.5 with SMTP id k5mr6238303lbd.46.1459423169609;
	Thu, 31 Mar 2016 04:19:29 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id f7sm1280295lfg.19.2016.03.31.04.19.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 04:19:28 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Thu, 31 Mar 2016 13:19:27 +0200
Message-Id: <1459423167-3365-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] pyton-numpy: Add definition of off_t size
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
X-List-Received-Date: Thu, 31 Mar 2016 11:19:34 -0000

NPY_SIZEOF_OFF_T must be defined. Otherwise:

/home/ricardo/curro/qt5022/oe/openembedded-core/build/tmp-glibc/sysroots
/qemux86-64/usr/lib/python2.7/site-packages/numpy/core/include/numpy/
npy_common.h:140:9: warning: "NPY_SIZEOF_OFF_T" is not defined [-Wundef]
     #if NPY_SIZEOF_OFF_T == NPY_SIZEOF_SHORT
         ^
/home/ricardo/curro/qt5022/oe/openembedded-core/build/tmp-glibc/sysroots/
qemux86-64/usr/lib/python2.7/site-packages/numpy/core/include/numpy
/npy_common.h:142:11: warning: "NPY_SIZEOF_OFF_T" is not defined [-Wundef]
     #elif NPY_SIZEOF_OFF_T == NPY_SIZEOF_INT
           ^
/home/ricardo/curro/qt5022/oe/openembedded-core/build/tmp-glibc/sysroots/
qemux86-64/usr/lib/python2.7/site-packages/numpy/core/include/numpy/
npy_common.h:144:11: warning: "NPY_SIZEOF_OFF_T" is not defined [-Wundef]
     #elif NPY_SIZEOF_OFF_T == NPY_SIZEOF_LONG
           ^
/home/ricardo/curro/qt5022/oe/openembedded-core/build/tmp-glibc/sysroots/
qemux86-64/usr/lib/python2.7/site-packages/numpy/core/include/numpy/
npy_common.h:146:11: warning: "NPY_SIZEOF_OFF_T" is not defined [-Wundef]
     #elif NPY_SIZEOF_OFF_T == NPY_SIZEOF_LONGLONG
           ^
/home/ricardo/curro/qt5022/oe/openembedded-core/build/tmp-glibc/sysroots/
qemux86-64/usr/lib/python2.7/site-packages/numpy/core/include/numpy/
npy_common.h:149:10: error: #error Unsupported size for type off_t
         #error Unsupported size for type off_t

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
index be57ac27bf1b..5a896c8efc29 100644
--- a/meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
+++ b/meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
@@ -5,6 +5,7 @@
 #define NPY_SIZEOF_FLOAT 4
 #define NPY_SIZEOF_COMPLEX_FLOAT 8
 #define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_OFF_T 8
 #define NPY_SIZEOF_COMPLEX_DOUBLE 16
 #define NPY_SIZEOF_LONGDOUBLE 16
 #define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-- 
2.8.0.rc3


