Return-Path: <ruslan@babayev.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 889E571633
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 23:14:00 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so23845347pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 15:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=babayev.com; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type;
	bh=VCNhaN6nmhx6z3uRz/aV3aZWWVs9LAcNU7M20NNu43k=;
	b=OggBavCQgtAZlBiXIl3Ai1VurO7G6KCa4+JzjpdibKdRAwHfMTXccDA785xruOiDZF
	9zeHEb8wXCpCOFmr4ETOjlLOrk7CDbO2vugH+YM7iCpbavpfh1gPbyyy7XqO/SvAXENA
	kfZog440lEcIpDRDQW7EqWsFyIZtpGL01egzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-type;
	bh=VCNhaN6nmhx6z3uRz/aV3aZWWVs9LAcNU7M20NNu43k=;
	b=byPaDySCodXbJHcPyh2/TXHazg/vSHEWFJg6HTO+ERTx1ystFU5vfZc5TCaDGPxQsV
	p+oinBAPN7p3fs87XawaekofENY2zTUuNhbyuFCk/svXuoPtsWq/PZVSZ5ulgkS/xvL7
	CTdwQRAtXwpkW4kxS3SjJFzPlOXsxEK73lBwOEH0af8tnDgUhRmDOKmrPagQOkqGReX9
	0JOyGxBukO2P7wd9R8yZK6YWtrRZbztRS8eKkqp7HV7f83oVINLm6rsAaVxbOResKHnO
	XVOY8oXRhcb3BPpBpbT65q88vqDsA38W+svsFlHObdUzevWCk0/PKWQIxjKdn0zHq0Rb
	rPvQ==
X-Gm-Message-State: ALoCoQm2tcVgOwqi+0iBL2ThHKwAhEkBJk/IKnxzv4ZNGgEYfzElLr4H8tar7FtLX26foI9uJ4lX
X-Received: by 10.68.220.194 with SMTP id py2mr36135717pbc.37.1446592441233;
	Tue, 03 Nov 2015 15:14:01 -0800 (PST)
Received: from localhost ([50.247.64.110]) by smtp.gmail.com with ESMTPSA id
	yh3sm31406861pbb.82.2015.11.03.15.14.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Nov 2015 15:14:00 -0800 (PST)
References: <87d1vqk67s.fsf@babayev.com>
	<CAJTo0LbrjPSFEdc0q1yZmSsCyPQ0gPUxkCodiaUrve9B8ybKoA@mail.gmail.com>
User-agent: mu4e 0.9.15; emacs 24.5.1
From: Ruslan Babayev <ruslan@babayev.com>
To: "Burton\, Ross" <ross.burton@intel.com>
In-reply-to: <CAJTo0LbrjPSFEdc0q1yZmSsCyPQ0gPUxkCodiaUrve9B8ybKoA@mail.gmail.com>
Date: Tue, 03 Nov 2015 16:14:01 -0800
Message-ID: <87a8quk4dy.fsf@babayev.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Add LibreSSL support
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
X-List-Received-Date: Tue, 03 Nov 2015 23:14:02 -0000
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain


Burton, Ross writes:

>
> I think I'd prefer oe-core to have just the one provider of the openssl
> APIs, so if oe-core sticks with openssl then libressl should go into
> another layer, meta-networking maybe?
>

Thanks for feedback Ross. Moved it to meta-networking.


--=-=-=
Content-Type: text/x-patch
Content-Disposition: inline;
 filename=0001-meta-networking-recipes-connectivity-add-libressl-re.patch

From 5b41fed5cea2123bffd13c0d724c4ff75e8a5d8a Mon Sep 17 00:00:00 2001
From: Ruslan Babayev <ruslan@babayev.com>
Date: Tue, 3 Nov 2015 15:08:34 -0800
Subject: [PATCH] meta-networking: recipes-connectivity: add libressl recipe

Signed-off-by: Ruslan Babayev <ruslan@babayev.com>
---
 .../libressl/files/gnuc_prereq.patch                 | 13 +++++++++++++
 .../recipes-connectivity/libressl/libressl.inc       | 20 ++++++++++++++++++++
 .../recipes-connectivity/libressl/libressl_2.2.4.bb  |  6 ++++++
 3 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libressl/files/gnuc_prereq.patch
 create mode 100644 meta-networking/recipes-connectivity/libressl/libressl.inc
 create mode 100644 meta-networking/recipes-connectivity/libressl/libressl_2.2.4.bb

diff --git a/meta-networking/recipes-connectivity/libressl/files/gnuc_prereq.patch b/meta-networking/recipes-connectivity/libressl/files/gnuc_prereq.patch
new file mode 100644
index 0000000..61fa51a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libressl/files/gnuc_prereq.patch
@@ -0,0 +1,13 @@
+Index: libressl-2.2.4/crypto/bn/bn_lcl.h
+===================================================================
+--- libressl-2.2.4.orig/crypto/bn/bn_lcl.h
++++ libressl-2.2.4/crypto/bn/bn_lcl.h
+@@ -259,7 +259,7 @@ extern "C" {
+ #  endif
+ # elif defined(__mips) && defined(_LP64)
+ #  if defined(__GNUC__) && __GNUC__>=2
+-#   if __GNUC__>=4 && __GNUC_MINOR__>=4 /* "h" constraint is no more since 4.4 */
++#   if __GNUC_PREREQ(4,4) /* "h" constraint is no more since 4.4 */
+ #     define BN_UMULT_HIGH(a,b)		 (((__uint128_t)(a)*(b))>>64)
+ #     define BN_UMULT_LOHI(low,high,a,b) ({	\
+ 	__uint128_t ret=(__uint128_t)(a)*(b);	\
diff --git a/meta-networking/recipes-connectivity/libressl/libressl.inc b/meta-networking/recipes-connectivity/libressl/libressl.inc
new file mode 100644
index 0000000..d0acdc4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libressl/libressl.inc
@@ -0,0 +1,20 @@
+SUMMARY = "LibreSSL fork of OpenSSL"
+DESCRIPTION = "Secure Socket Layer (SSL) binary and related cryptographic tools."
+HOMEPAGE = "http://www.libressl.org/"
+SECTION = "libs/network"
+
+LICENSE = "openssl"
+LIC_FILES_CHKSUM = "file://COPYING;md5=01f9bb4d275f5eeea905377bef3de622"
+
+SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${PV}.tar.gz"
+
+S = "${WORKDIR}/libressl-${PV}"
+
+inherit pkgconfig autotools
+
+PROVIDES += "openssl"
+
+RPROVIDES_${PN} += "openssl"
+RCONFLICTS_${PN} += "openssl"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-networking/recipes-connectivity/libressl/libressl_2.2.4.bb b/meta-networking/recipes-connectivity/libressl/libressl_2.2.4.bb
new file mode 100644
index 0000000..f2f6fc2
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libressl/libressl_2.2.4.bb
@@ -0,0 +1,6 @@
+require libressl.inc
+
+SRC_URI += " file://gnuc_prereq.patch"
+
+SRC_URI[md5sum] = "bae037598bd63987666302f9644de237"
+SRC_URI[sha256sum] = "6b409859be8654afc3862549494e097017e64c8d167f12584383586306ef9a7e"
-- 
2.6.2


--=-=-=--
