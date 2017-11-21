Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id B9DCF78802
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 20:01:43 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 17so10589158pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 12:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wVOTL4SFPYcrXH1AU1jX5TTtwVmxhr/IB95LwO2Vwsg=;
	b=ZYscrILmwztJehWXZuuag2MqhVMQuL/jZJcsXh1Z3TpSf1jwPI1fQj7QYo6Y5qCK3Q
	KezHVflGS6HH49dGjScHJq3l9qlIXXYbw1yH17q5rPNUiwtVi6uq9o+UcWOhmI2KZH40
	c6JPdgkakyJ+tckCnvjHAkujO9x9x82tF7Fp1s2FxXNRDwh0rE2veWKfV3J1Cg5EaLms
	FJXi1HL1LUlLz2vWskBYEX8mIXwc5AB1Q5W7/rGVPnLyMB6kyUcvgmtsM//cZ79LdtAU
	R+j8Owrvz4f2w55IpL4dn2LaRNmSUPwk7XWUnfRlngGVLE6L9q2e/mwqA8fif9DGVGvU
	vEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wVOTL4SFPYcrXH1AU1jX5TTtwVmxhr/IB95LwO2Vwsg=;
	b=I5CqgfPeu4otRMjdx08ElwATwv9CzTCOkTA92zD9PEGXVKNM7L7L7E/fQChXq44Wmm
	5PgigQJ2+Vl4AjfS3jmgmF0KFozUlRFD2xtCXCqG4rd5wmLn7iDCl60ngtwG2vxtyI0a
	3qbVdAK+BVMiafLxWCKf/p3OnYZYYSgU/hwwgSgTcKvgTN9wWlP7ml9xnRFWJpnnGu0I
	ZYN2oSCOarjTLd5/ywg1141wftmRUsIf8nZbbK8bqKskmSAaQUjPGtrLHoBUE85dUVAi
	3gNVjrhptDQYwBb6adYzUHqAO8FDKuALSubHQTh48bi3pQbkPhFBuvyUNZ2i2sKSYYPM
	9erg==
X-Gm-Message-State: AJaThX7whtxOMx2I+KQisu0OOpXAtjTBVzfJfTMAIOVlsXW+b7G4WOb2
	yz82f8o8GWCwQFbVXGbkY+E7jw==
X-Google-Smtp-Source: AGs4zMZaf/RKq0WnUHGCX5l+G9n7KEYP6PFzKmmHSPNNM9ITz+4uggev7SAW89Ab7d1xZIH7xjUanw==
X-Received: by 10.99.62.10 with SMTP id l10mr17964229pga.376.1511294505407;
	Tue, 21 Nov 2017 12:01:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	d28sm26770154pfb.105.2017.11.21.12.01.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Nov 2017 12:01:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 12:01:34 -0800
Message-Id: <6f7541ec57c1676250179b96808ea28c5e65dbca.1511294278.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511294278.git.akuster808@gmail.com>
References: <cover.1511294278.git.akuster808@gmail.com>
Subject: [PATCH 3/5] nss: update to 3.34
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
X-List-Received-Date: Tue, 21 Nov 2017 20:01:43 -0000

From: Armin Kuster <akuster@mvista.com>

for more info see:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.34_release_notes

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/nss/{nss_3.33.bb => nss_3.34.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nss/{nss_3.33.bb => nss_3.34.bb} (98%)

diff --git a/meta/recipes-support/nss/nss_3.33.bb b/meta/recipes-support/nss/nss_3.34.bb
similarity index 98%
rename from meta/recipes-support/nss/nss_3.33.bb
rename to meta/recipes-support/nss/nss_3.34.bb
index e3d4f96..f1fbbb0 100644
--- a/meta/recipes-support/nss/nss_3.33.bb
+++ b/meta/recipes-support/nss/nss_3.34.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://Fix-compilation-for-X32.patch \
            "
 
-SRC_URI[md5sum] = "43663c850e2b2ed48ecb8910b055f5a9"
-SRC_URI[sha256sum] = "98f0dabd36408e83dd3a11727336cc3cdfee4cbdd9aede2b2831eb2389c284e4"
+SRC_URI[md5sum] = "1e30b8e5b13b5b08bbc489c265948d82"
+SRC_URI[sha256sum] = "0d45954181373023c7cfc33e77c8c636d394ec7e55b93e059149ed7888652af5"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4


