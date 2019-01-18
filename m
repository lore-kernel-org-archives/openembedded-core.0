Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9F77C22B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 11:02:54 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t27so14520400wra.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 03:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z6MpSMRo2efOMFAT8XPVbylIx2tDwcN61c9g5I5BSpA=;
	b=cMzRhPgeVOrStPz/p7Y4phFgpsbYUsC7XuyBIdKt8Srz8e+NQ2JG9NTZlXJLVpkEzd
	ZUp2mHml760NJCKIPSVp3La1M9F4Ya06VSbUDoE+k8e/NZXm2GcXf1bMlXrll2VAMNtl
	2YrPp5ncRxLtBpVQL2TZUVt3GXHMOhRjeiDl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z6MpSMRo2efOMFAT8XPVbylIx2tDwcN61c9g5I5BSpA=;
	b=N+t39vpGobz8hBMUK6Zfr3ijIzp3+SGc4oHlGHb+AHiRia9mF65wIjY2Q/Ht88bCS7
	jgS8g1lbEbeuZYaKERXLe1m/cN8Zh2DWUkgdAfmq2lJP7zMMI9TVFzLcwTyNfoVKfGsN
	rVSMxmdhF3OqGaC/SZvMlt6TAyyM2maxxNR0RNaBaohijdvGRcBSgVm1pIphB07euBOi
	BaNqaTulUGy7zTkCDlvzSAvg43W0mEr3AB6DJHBVpuFHXIgSvtZo/92GFjN8FXWSOFLU
	ecouJjMFi2Adp42pLlUpwk4z+ixU2fJ7pNxKs/bkPPYFEDBvBOuiwbMV7QTMPfYeVFKQ
	x4BA==
X-Gm-Message-State: AJcUukfzkL+yoL/XN3LZ1gVVBA+HUChHMJxJzb9fBggeW3MVbgr26PIU
	fGX8izCI6nQqLacdGAtEB7KnVM1fAYg=
X-Google-Smtp-Source: ALg8bN5sW5dtiEvEzKM6DvobApXwLOokmhdp4onSrmmpOVUFizQU0ecBJmsyMuclN52oSIcSpAQdeQ==
X-Received: by 2002:a05:6000:51:: with SMTP id
	k17mr15114366wrx.259.1547809375419; 
	Fri, 18 Jan 2019 03:02:55 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s66sm35171621wmf.34.2019.01.18.03.02.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jan 2019 03:02:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2019 11:02:52 +0000
Message-Id: <20190118110253.8273-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/2] subversion: Upgrade 1.11.0 -> 1.11.1
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
X-List-Received-Date: Fri, 18 Jan 2019 11:02:55 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../subversion/{subversion_1.11.0.bb => subversion_1.11.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.11.0.bb => subversion_1.11.1.bb} (96%)

diff --git a/meta/recipes-devtools/subversion/subversion_1.11.0.bb b/meta/recipes-devtools/subversion/subversion_1.11.1.bb
similarity index 96%
rename from meta/recipes-devtools/subversion/subversion_1.11.0.bb
rename to meta/recipes-devtools/subversion/subversion_1.11.1.bb
index 9e05d34639a..8abac7408e5 100644
--- a/meta/recipes-devtools/subversion/subversion_1.11.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.11.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            "
 
-SRC_URI[md5sum] = "b0401a17fe9f4a769e36fcfcfad93461"
-SRC_URI[sha256sum] = "87c44344b074ac2e9ed7ca9675fb1e5b197051c3deecfe5934e5f6aefbf83e56"
+SRC_URI[md5sum] = "5797bf701d2d868fa964c7bbc4931267"
+SRC_URI[sha256sum] = "9efd2750ca4d72ec903431a24b9c732b6cbb84aad9b7563f59dd96dea5be60bb"
 
 inherit autotools pkgconfig gettext
 
-- 
2.19.1


