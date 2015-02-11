Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2094773303
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 18:10:37 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id y19so5130137wgg.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dLCViuE2ncDHHtSwQJJX7x0EToB+e2373khuqEM6ueg=;
	b=Qkbg9Vt4U0/VgS73otf5/OQIIkKPKmvh7DXcmjQbWUrcDY7mr0dhFgfBz4VxdBkR9C
	AfhCn3aGUaM8pD7BtuS/jDDvfjWfXyzFz+vvKr1up0GHQ7kWmz92eHdlYADAsOyh/9Gl
	d2VK6e//sfSBdMXfwLtdEtw6n/MaH6F5Z0LIidNkgNsNGhqBOYjiM4ymMTRZPtnaFraV
	oc+sQCenhLktwXkZIv7igAEuCUD3CVx2dTGwY9yaiUClhcWKysIFI3GmRtafvZruaRlw
	ndCiDDqdqpXwUTIixra/XN9718ej5vdmEzOgYUaoF/HLRUrA7yyfkDh1GK6Toa6ifvbW
	af0Q==
X-Gm-Message-State: ALoCoQngM4V8VDafLSkARVnfDVkSEu5Udu0m4w/IAolaSHsnJ62K0CuqzYkMoB/5/f2cpcHrCThd
X-Received: by 10.180.211.45 with SMTP id mz13mr11750358wic.20.1423678237601; 
	Wed, 11 Feb 2015 10:10:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id hn2sm2309857wjc.5.2015.02.11.10.10.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Feb 2015 10:10:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 18:08:27 +0000
Message-Id: <1423678110-27633-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/4] gstreamer1.0-plugins-base: move data to the right subpackage
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
X-List-Received-Date: Wed, 11 Feb 2015 18:10:45 -0000

The libgsttag library has a data file that was packaged in
gstreamer1.0-plugins-base, so was never actually installed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 972ff18..eb5db46 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -35,6 +35,6 @@ EXTRA_OECONF += " \
     ${GSTREAMER_1_0_ORC} \
 "
 
-FILES_${PN} += "${datadir}/gst-plugins-base"
+FILES_libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
 
 CACHED_CONFIGUREVARS_append_i586 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
-- 
1.7.10.4


