Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 48C2673710
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 20:37:48 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so204672635wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 13:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=TaNbE+mf+ly5aN9feZj8MY0BhPhlK4t1PqU/xyXoaec=;
	b=f4DZQkebiu3MhKB3q4fm4U9gCdKGtjjj0uHAvD0BPXuCmzW732DerCcZ5wDaCpX3sh
	682ImvGUAbt16GDKgsOT3zkj9cR/LwnGTOftzVupa5h87Hq5d3Oc8igZV8BN7YSZDAvy
	+TR/QUy7iLHH/VHkjZC2TghCSaCs4rBRo4diVBCjIpxFZXROLLhuKyCfPUtrp8QKdqHL
	T6rciHurYnE1RdmAlCvtkum9WHvlgq7VDvzNvrbnAF8isp8kK3DymGIQNcJGnsxhxxWi
	QQ/93iy4WLGR7580i4L3NErxwFomOgwAfna9ws51Ag7i1nw8r4fnDdS30uyUJfP8tA2A
	iK1g==
X-Received: by 10.194.114.104 with SMTP id jf8mr43950972wjb.155.1444768668258; 
	Tue, 13 Oct 2015 13:37:48 -0700 (PDT)
Received: from [172.22.60.125] (ip-109-91-252-249.hsi12.unitymediagroup.de.
	[109.91.252.249]) by smtp.gmail.com with ESMTPSA id
	wb11sm1899291wic.16.2015.10.13.13.37.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Oct 2015 13:37:47 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <AEAA8709-CF45-4759-BDEF-24201C0B19DE@gmail.com>
Date: Tue, 13 Oct 2015 22:37:47 +0200
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [PATCH 2/2] ARM: handle missing thumb suffix
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
X-List-Received-Date: Tue, 13 Oct 2015 20:37:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


When enabling tune for arm926ejs, poky optionally appends suffixes for
thumb and dsp support. Since sometimes arm926ejse (ARM code) and =
sometime
arm926ejste (thumb code) is used in PACKAGE_ARCH, allow both.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/conf/machine/include/tune-arm926ejs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-arm926ejs.inc =
b/meta/conf/machine/include/tune-arm926ejs.inc
index 335e4e0..a310c9d 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -8,4 +8,4 @@ TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"arm926ejs", " -mtune=3Darm9
 AVAILTUNES +=3D "arm926ejs"
 ARMPKGARCH_tune-arm926ejs =3D "arm926ejs"
 TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} =
arm926ejs"
-PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste"
+PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste arm926ejse"
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


