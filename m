Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 423C87391C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 10:51:18 +0000 (UTC)
Received: by wggy19 with SMTP id y19so10027481wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 03:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ElxDC6DrNPVtWShMlFHOGcnVaKty0MzPT3oWCkoixho=;
	b=En4HXxSdkoP+6UWIIgR+gXSDgqZKT8s3yp7TSavp/WG6soH/2H+jkASZmTH/jpz+2z
	t5IkI34QTFl8DUlKZ0oJa++IsOQcJUShCgltBLP6K7VeXjSN55CxoTNk5fvLDJ4TLd0U
	8tRymdPM3igueIhijpWzvdAJEM5h57vg0qso4LHlANeRZWP8VZIvTx6H/DZmimHenQrp
	azIt+mcwYBHy0jiAs/6h5Qe8uXGBSIBcoTNxkNXlAftN/3chGKJ0dwhREunqFeuyAE6J
	+Bq8zVHMdUdOxaJV7aQb2T7Zoac1S+gNDLbMUgzpmZ9z11lNdVyCAA9w6FsWmCr4yqJh
	KrTg==
X-Gm-Message-State: ALoCoQl8JAIy+Tta6mLYfSWMlOWKEflXdQEEVPoz/jcMM4SONE4GrLidbmparFHnnbw1EokaE/eZ
X-Received: by 10.194.61.51 with SMTP id m19mr57243454wjr.39.1425898279835;
	Mon, 09 Mar 2015 03:51:19 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id j7sm14993013wix.4.2015.03.09.03.51.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Mar 2015 03:51:19 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2015 11:51:11 +0100
Message-Id: <1425898271-10881-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] bitbake.conf: use http:// for GNU_MIRROR instead of ftp://
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
X-List-Received-Date: Mon, 09 Mar 2015 10:51:23 -0000

The past few weeks ftp://ftp.gnu.org has been intermittently giving errors like this:

WARNING: Failed to fetch URL ftp://ftp.gnu.org/gnu/emacs/emacs-23.4.tar.gz;name=tarball, attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 4, output:
Cannot parse PASV response.
accept: Connection timed out
Cannot parse PASV response.
Error in server response, closing control connection.

Which is annoying because binutils lives there. Using http://ftp.gnu.org hasn't given any problems so far.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 10ee42a..f3586da 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -565,7 +565,7 @@ DEBIAN_MIRROR = "ftp://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://git.gnome.org"
 GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
-GNU_MIRROR = "ftp://ftp.gnu.org/gnu"
+GNU_MIRROR = "http://ftp.gnu.org/gnu"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
 KERNELORG_MIRROR = "http://kernel.org/pub"
 SOURCEFORGE_MIRROR = "http://downloads.sourceforge.net"
-- 
1.9.3


