Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4C4F26CBAC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 13:08:05 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so671055wes.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 06:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=f1vaI3wsx27RQpmZ++QW1CBWhtschsuuuotaDXKU8ms=;
	b=nF3bCsRU6LZw97A2rwaCTELGG3IlLTFOo4sSy6gnKRZDPggKJNF24772ny0dwtA9LS
	N0ZPICU10EOUdBAg4kUPlo7Vr2446toqMl/fzzg00/nqi6QVBx4ze5XM5pJUV6Raftrk
	TYjsUh+uAFPF5PCwelrqdLJ5xPupkKVXQ6Fy+hUw+c8nNpBMbthoTfMMPkvK+TSMoZ6x
	zxcSSWug4dzaKnBXtAxqBT77+4BH/jCzvURyI+rzFGmo6gwvPQGnFSmOjMlU2L20C7fQ
	1GSgm/+RC1TaYgayFihNNGZ8CNNqZ/Nh9ZAlT8Uzn3AbQcBmhEO2VI8AP1nJiRdW5s+x
	bZRA==
X-Gm-Message-State: ALoCoQmjrPEU3wivum3f2oCGlcT51LGaztTgBHihuZ7Lt2ys37yVcRmiZ48FEPcEQ+vNmRSBnJbC
X-Received: by 10.180.100.33 with SMTP id ev1mr21142562wib.18.1381928884833;
	Wed, 16 Oct 2013 06:08:04 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	bs15sm5756770wib.10.2013.10.16.06.08.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Oct 2013 06:08:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 14:07:59 +0100
Message-Id: <1381928879-17161-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] packagegroup-base: if zeroconf DISTRO_FEATURE enabled, add libnss-mdns
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
X-List-Received-Date: Wed, 16 Oct 2013 13:08:06 -0000

mDNS name resolution is a key part of mDNS, so if the DISTRO_FEATURE is enabled
then install libnss-mdns.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 1c0c757..eee8bd9 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -353,6 +353,7 @@ RRECOMMENDS_packagegroup-base-nfs = "\
 
 SUMMARY_packagegroup-base-zeroconf = "Zeroconf support"
 RDEPENDS_packagegroup-base-zeroconf = "\
+    libnss-mdns \
     avahi-daemon"
 
 SUMMARY_packagegroup-base-ipv6 = "IPv6 support"
-- 
1.7.10.4


