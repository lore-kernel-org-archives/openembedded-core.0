Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A265E70791
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:38:33 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so52195wgh.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=a8t443dhfayuOBJqIYD1PxtDm5LO12AzhMEIKzvokaY=;
	b=a7Rt1Nl8ldc3sqUFmYf2E2BSNxfXaRMnMu9xzcWB99k66bjxLozYQxwDJ4pQaYZPML
	E9kNjBkVLrWhdIGbPDE+jv/NnaAgCxmlv5ymqLgLGca6KYPxZiX9+gBgTD/eOh3aItHv
	7K+BVUe04fm11RJ7QX6FLq9MzSW13+c+dqY+pEkjWHXKCT/3UeXw3apiTDfrnY23gfr3
	U/XUYDc/usaCeBYa2tOmCy3iL8na4RPBdA1e+RCq0/WxCVa9G7MT9+W52xYEESQIflob
	I1KzTl/EhZ99NnEaWbCCNUl+K9sa9UzPveDIdr7bMmsb4eKzzgceU+U7hP7Q5akzuJcC
	RM5w==
X-Gm-Message-State: ALoCoQn4Y9I/a0WSpMbnNgMz9aRWVFEgDrR9I5XHOGpPig55yWsQ5e1p1/J/hEzua0uGG+4ACv1g
X-Received: by 10.180.14.5 with SMTP id l5mr17546086wic.50.1406054314665;
	Tue, 22 Jul 2014 11:38:34 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jy8sm2847638wjc.7.2014.07.22.11.38.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 11:38:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 19:38:15 +0100
Message-Id: <1406054301-9027-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
References: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 05/11] gnome-common: upgrade to 3.12.0
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
X-List-Received-Date: Tue, 22 Jul 2014 18:38:37 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnome/{gnome-common_3.7.4.bb => gnome-common_3.12.0.bb}        |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome/{gnome-common_3.7.4.bb => gnome-common_3.12.0.bb} (73%)

diff --git a/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb b/meta/recipes-gnome/gnome/gnome-common_3.12.0.bb
similarity index 73%
rename from meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
rename to meta/recipes-gnome/gnome/gnome-common_3.12.0.bb
index 1fd2d83..d3b6683 100644
--- a/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
+++ b/meta/recipes-gnome/gnome/gnome-common_3.12.0.bb
@@ -10,8 +10,8 @@ inherit gnomebase allarch
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "974cd54626f1d1787481288ef26bd4ba"
-SRC_URI[archive.sha256sum] = "2af2d97010d2a9aeb3b99dd2ce07d1ef023e15a27b412ffe4f067f016ff7117b"
+SRC_URI[archive.md5sum] = "da903a1c89b0a24e062227fa97d42fe7"
+SRC_URI[archive.sha256sum] = "18712bc2df6b2dd88a11b9f7f874096d1c0c6e7ebc9cfc0686ef963bd590e1d8"
 
 EXTRA_AUTORECONF = ""
 DEPENDS = ""
-- 
1.7.10.4


