Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D95947EE52
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 21:16:20 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z1so33466667wru.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 14:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8DZIUPBC+opBUP9mGowaOXS6MELUB47PXPekBnbovbY=;
	b=Kb8lPFCXUjj+qrQIImambFhfa5gGo5v5mPubFsCN3/vGdOnNWfEeuc80Rxu5XanlKm
	BzWkS7vBHH9YtbcXOn9YfrzWLu+e6xgk4jCHHiwpp27LsQeJjkG9wmhXwU2FWi84edCO
	ErZ2DH/vC4lqXcxrBz30H43GHEGJtTXGWcGoUq+haaFB6BEvl7Q2zrUc0m2ZgCHqOusI
	h4MRD11TtI/2ZSNSYhgFS/SmRaW60Ffv3zORpmwuRvMX3Qa8ijvjyK5k6pTmBYJG8kiw
	BjzKpiHv/BiVKBYPDKBun/h8T11+TWuCwiTU7MwcDkjCBnDLB7jU6T4bu4y2ltg1JDGf
	Rcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8DZIUPBC+opBUP9mGowaOXS6MELUB47PXPekBnbovbY=;
	b=o0Hsgq6LhtzsqHU8TYuBx/SHxrpB1xxh8xG4WV0UWc/aJjhKF3TBaoKhTn9CpGILXh
	vjIahwDlem3UM+w6iB1Uk/Ue7S6TQjHBAlCtTMDFlDWM0oPwcMjeyLoJknwLnvJH1maU
	0pBdiqDs1oZRQNd4f40MdWFRzZyGuxjOh/mryb1Mdg1SVP33dWB++L0RErLjQUtRL5zp
	Not2AF++8Un1pq4qvpkTmRGHM8LY5ZQRBVpnmyeXQZQi4DG4LdR40Q9duz2OfNtQ1xR6
	kGfGE97dNBjoFL/ClFc2mhuTR+od74rt8bKRjzCN6Un+Nj25g2/Dj6kOBLrQgysJwV/+
	pBiw==
X-Gm-Message-State: APjAAAVoH5V++oHDEr90tP5kIljmLlnL3qcZs2yh52WAIm5n+08LBPsO
	UYhjOdDeAtrZ6b6RyuD3Pi0RTIg8Xpc=
X-Google-Smtp-Source: APXvYqzuKWjQwIjzCQRkHzNlxk7CsUc239034qkTBiOIo4ZohJtDF4mC5ffQi2Z85hVxORAibfNQEg==
X-Received: by 2002:a5d:4205:: with SMTP id n5mr50184149wrq.52.1563570981258; 
	Fri, 19 Jul 2019 14:16:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y16sm31061479wrw.33.2019.07.19.14.16.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 14:16:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 22:16:19 +0100
Message-Id: <20190719211619.25345-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] freetype: upgrade to 2.10.1
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
X-List-Received-Date: Fri, 19 Jul 2019 21:16:21 -0000
Content-Transfer-Encoding: 8bit

Also switch SRC_URI to the nongnu mirrors as they're more reliable than
Sourceforge.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../freetype/{freetype_2.10.0.bb => freetype_2.10.1.bb}   | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.10.0.bb => freetype_2.10.1.bb} (86%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.10.0.bb b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
similarity index 86%
rename from meta/recipes-graphics/freetype/freetype_2.10.0.bb
rename to meta/recipes-graphics/freetype/freetype_2.10.1.bb
index 200f43c21be..b179a0ed473 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.0.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
@@ -12,16 +12,14 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
                     file://docs/FTL.TXT;md5=9f37b4e6afa3fef9dba8932b16bd3f97 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://use-right-libtool.patch \
           "
+SRC_URI[md5sum] = "bd42e75127f8431923679480efb5ba8f"
+SRC_URI[sha256sum] = "16dbfa488a21fe827dc27eaf708f42f7aa3bb997d745d31a19781628c36ba26f"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-SRC_URI[md5sum] = "a717e6925b61b9dda946322ecd278a42"
-SRC_URI[sha256sum] = "fccc62928c65192fff6c98847233b28eb7ce05f12d2fea3f6cc90e8b4e5fbe06"
-
 inherit autotools pkgconfig multilib_header
 
 # Adapt autotools to work with the minimal autoconf usage in freetype
-- 
2.20.1


