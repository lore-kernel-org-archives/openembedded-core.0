Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 52AD86D46F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 12:45:32 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so3351466wes.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 04:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fa6jN/zvjcTVOH8ORqxMBKgIoXe+Udf/Lnh012kafnc=;
	b=Bt8Ycyltt+dmgrBqBeG8hr6o6Vg57+CIQJplaYmt8R3T5+7pSf1tojnuQD9yNTcaYO
	27qrs2APWnMao1fRWN+QW2qin/Fc/wO8zTT9ISfGgXAMMUyTE+C+tcOVS/o3DffCRRzL
	zqsM6jJA/Hr8Vg7aSTMKD+vuwm4LUqHGdl0E3hGxPaMmcc0VGws3PP2lu5w3mSzO09Nb
	7RHE3EBAlhs3dlTRhld9duPZID+16p/RmCwB9QuuCfIPSQY2s0+8QZ9Y7e8qia4Kk27q
	qIiuwbzKcPtocc7vzqsPxKz//KDeXuc5lBXaPOAoagZinsvRp6jTmrfNBC33jU/uh3XM
	+B4g==
X-Gm-Message-State: ALoCoQl9xi9CBKm1UQ9RILWdS35n0Fd020EYCTaQqTWNDyfZ5gqFA/NNRRXKIvY7jOSIV1ZPUyc4
X-Received: by 10.194.2.79 with SMTP id 15mr1820033wjs.90.1386593130582;
	Mon, 09 Dec 2013 04:45:30 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id hv5sm24570762wib.2.2013.12.09.04.45.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Dec 2013 04:45:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2013 12:45:26 +0000
Message-Id: <1386593126-24470-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] freetype: upgrade to 2.5.2
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
X-List-Received-Date: Mon, 09 Dec 2013 12:45:33 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../freetype/{freetype_2.5.1.bb => freetype_2.5.2.bb}              |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.5.1.bb => freetype_2.5.2.bb} (91%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.5.1.bb b/meta/recipes-graphics/freetype/freetype_2.5.2.bb
similarity index 91%
rename from meta/recipes-graphics/freetype/freetype_2.5.1.bb
rename to meta/recipes-graphics/freetype/freetype_2.5.2.bb
index 8e59840..2521b5e 100644
--- a/meta/recipes-graphics/freetype/freetype_2.5.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.5.2.bb
@@ -16,8 +16,8 @@ SECTION = "libs"
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "93eba7854094f46d7d98a9a2370af4d6"
-SRC_URI[sha256sum] = "d715faa92b37980280c857ce9d356fff4361c5a7bd9b5c3f867fc24f598d8f45"
+SRC_URI[md5sum] = "10e8f4d6a019b124088d18bc26123a25"
+SRC_URI[sha256sum] = "4ff4bd393aa01071ec7b849d035508a505a78f88b2bcf25ff11e58e43c0b9def"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.10.4


