Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id A7EBD6AC00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 18:00:31 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id 4so36502406pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 11:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=La3jfX628XbPeaLE5OrRx2v9So83KItIys0jbxRu1nY=;
	b=osGUgWg+dFXuvfOSA0Cf/w8LOuiM0yqibdNu+LJX1S665qn6WMcq71mAd5p8xOzoTs
	JSJZPk18RflSi1u6DaDuN0Ix+nIfxxmQzDaSZCbk9EgABtr+jFTj9UyX7PITku2++80u
	v0s3m1UpGOx20rlhB9EMTBqxP5piojheArEx9RBXOF45Xvv9EiSfBQz2u9UvzVN+2gkZ
	JXNCKUOzACBUx4S6cTAIywDTfXWQx3UdqklSunVyU4mtP1BH7oJM+Z9zPu+2PtIQhce7
	WeQXTSNS/mPWhfnVSIlg9xPvIib4FmVnC43SFJq7fSDWpwjRySx3gjiAVfuA+T8sAoyR
	s3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=La3jfX628XbPeaLE5OrRx2v9So83KItIys0jbxRu1nY=;
	b=PyeK1SrYb8K5ELKskhwSpv0tBzUVkWH7oT6B4MiLO6K7CaSIUqMQvfooldZWTe9KsW
	P96bJbHK84TU2q0TMPQ+4ZPTAzDp6kgP0rtSkStYB/4ugWhz7BWSqHtCykz8xjpwykI4
	O9/zZvLBQvh909HcIFXj+Z0dpjWp7DRYSXR6Jtih+0ZvdmAlYBZHr1Ckls1qnzElfNzR
	D66/EmC7rr5SoJpJJfx5igo3aMM22n/nr59brzQQCQ4uGMJymH1vz3pPFpEWGtsy74Sy
	N/Tzkc/gM2xzFtkrTBSRFMX5618kg7T2BAw4bQuDkF4hkLZGtG3keu1SeZaY1yqjX7X7
	1h5A==
X-Gm-Message-State: AD7BkJLp7h9N+FN9n0ez22NgKxg75GHsbG8U8ZqaeGtjKH8xUtFRXKP5oukMU6v9PIX2TA==
X-Received: by 10.98.86.28 with SMTP id k28mr6161430pfb.43.1458756031929;
	Wed, 23 Mar 2016 11:00:31 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id 79sm5644126pfq.65.2016.03.23.11.00.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 11:00:31 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 11:00:25 -0700
Message-Id: <1458756025-11452-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libmad: remove use of obsolete _thumb over-ride
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
X-List-Received-Date: Wed, 23 Mar 2016 18:00:31 -0000

The _thumb over-ride was first used by the libmad recipe in 2006 [1],
but should have been removed in 2007, when the libmad recipe dropped
support for building for thumb [2].

 [1] http://git.openembedded.org/openembedded-core/commit/?id=f1f8c5a6a7234a7b618f98efbb3d28e414890fa9
 [2] http://git.openembedded.org/openembedded-core/commit/?id=1aa801ac7b991790dce9cb2618d0816700e52a16

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 9e08b16..d431abd 100644
--- a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -26,8 +26,6 @@ S = "${WORKDIR}/libmad-${PV}"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "-enable-speed --enable-shared"
-# The ASO's don't take any account of thumb...
-EXTRA_OECONF_append_thumb = " --disable-aso --enable-fpm=default"
 EXTRA_OECONF_append_arm = " --enable-fpm=arm"
 
 do_configure_prepend () {
-- 
1.9.1


