Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 93B157D28A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 15:59:25 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id a184so3310811wma.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 08:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W3YSeMS5SZdobwxHxmvK/Kzp8xWl19u09/ohJt52qfU=;
	b=jhVs0hdLj5q7xK/L97wDalAJWXDQcwEbJSvHxj1Bsa+a88F3RiezGp8ClSnLvUTSdE
	KZcz5s7EU121k5NXJVxVoXCBK/R0mNamFMpzR5VYEKYA7bebhdMQAFBFTQJCAWrRYUbL
	WioLihT/ASRqZ/j/+bJm4tT5ISM7xjjiDzEc9MbFqnpNlOjWQ2uOw6Rp9VgFt2MtlEll
	StAfR2L2QrobAJ2G2EZrxpP9sC3oz+V50aUcOz5GzApN3bck0jl0LgamOA5sGzNjpkP4
	hsoytbYYs8NlCxIj/br9spUPH7k0uY23RQOTHSfm9DsNhkC7s9JLfyJrsLICfPPsA56u
	m32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=W3YSeMS5SZdobwxHxmvK/Kzp8xWl19u09/ohJt52qfU=;
	b=WbwXoYFIfkCNMv2RpYmayHSecQaxJXzRNa0Xl4yzhthxXCcjbce5wvxgvM0FAgca0M
	Hd9WAXzuqTQmNbCxaKPqZGFwLXAPDsgSI2H8U0SWOFpDHGOkmRvEde0GgVe638t3HvOi
	b2l0+S+pVMCj01ceVQ632dWcgEC0cODhyPy3mFNJ+9rlPFztmhPeDM79zpyRbld7sZRf
	jCUrV+A9EfyHLfTtxcdgwMRBlPIo5VyVA8Y+s+Y6lgWXgINrraxT3dv5fDlXh4mmOU12
	+s6feWNxulunO1sWftV1lXxqOmOKMJgdE6fqyEy+83GPSfEDnFFz1XPCsE43gpFtCoU7
	pJ+Q==
X-Gm-Message-State: APjAAAUhbuoCM9Gneo4gku9WFiO0knsuy+ThZVuU1Y0Isp1z+y5G7OTh
	ufuzVhKUHgAJz295UXrXJyg/TJld1Ns=
X-Google-Smtp-Source: APXvYqwuKPCuTF+LsFycvLhEQLJk7NAUpmKOenzfUMMgZJxe1yUVb+auWBnrA3ofBpRoA9uQTlR5uA==
X-Received: by 2002:a05:600c:249:: with SMTP id
	9mr3650109wmj.149.1555603165923; 
	Thu, 18 Apr 2019 08:59:25 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	r196sm1761006wmf.22.2019.04.18.08.59.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Apr 2019 08:59:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2019 17:59:16 +0200
Message-Id: <20190418155918.40653-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190418155918.40653-1-alex.kanavin@gmail.com>
References: <20190418155918.40653-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/5] python3: add another multilib fix
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
X-List-Received-Date: Thu, 18 Apr 2019 15:59:25 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-fix-another-place-where-lib-is-hard.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.3.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
new file mode 100644
index 00000000000..b97583682a6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
@@ -0,0 +1,31 @@
+From a21f4f8fa5e5c0601898740b4ac08ec84f41e190 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 18 Apr 2019 17:11:06 +0200
+Subject: [PATCH] Lib/sysconfig.py: fix another place where 'lib' is hardcoded
+ as the library path
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Lib/sysconfig.py | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
+index d15cec8..87fa5e6 100644
+--- a/Lib/sysconfig.py
++++ b/Lib/sysconfig.py
+@@ -20,10 +20,10 @@ __all__ = [
+ 
+ _INSTALL_SCHEMES = {
+     'posix_prefix': {
+-        'stdlib': '{installed_base}/lib/python{py_version_short}',
+-        'platstdlib': '{platbase}/lib/python{py_version_short}',
+-        'purelib': '{base}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
++        'stdlib': '{LIBDEST}',
++        'platstdlib': '{LIBDEST}',
++        'purelib': '{LIBDEST}/site-packages',
++        'platlib': '{LIBDEST}/site-packages',
+         'include':
+             '{installed_base}/include/python{py_version_short}{abiflags}',
+         'platinclude':
diff --git a/meta/recipes-devtools/python/python3_3.7.3.bb b/meta/recipes-devtools/python/python3_3.7.3.bb
index ea46b0535b9..3a1c8f5be6f 100644
--- a/meta/recipes-devtools/python/python3_3.7.3.bb
+++ b/meta/recipes-devtools/python/python3_3.7.3.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://ptesthack.patch \
+           file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1


