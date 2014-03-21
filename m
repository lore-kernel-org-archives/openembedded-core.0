Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id C3D0C6FA59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 18:22:08 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi5so770188wib.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 11:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zudlSUSc1GCdKBZl9F5+WxvxtYPCUtMVYcdcpcBGPbY=;
	b=Mywp09kHX4y7o4HghHBqVmr4M2DjGDnG+bk36wbGNALqExRArzz9d8V0sewUY7YrvO
	uXTGFA8T7jzuBJH4847DqjrddfY4sbn8swUlnVGiWKG3v6G96HaKd6zCZuVPRhORtiB4
	TDOpO6A1lpwacBu+Po5NGnPA8uEDXngwj4rdNBRt9EMoDcg3qWKZtqaqO+WTevq36xMx
	usSY/LPgCrD2/pRd3rN5Cacm0Cd13G2gjp9KU0W7u2m3GL8E2BgACoDnvPd7jEoQL+dq
	XzpfBS/0DxyrfxVE7yGr+VktTs8WYg9GHO0Od4KZrVhU4eiDN0zxwuk2/WCTyRnbcPX8
	SgxQ==
X-Gm-Message-State: ALoCoQlFESrGkhI0X1uFiuphNfqPGdaXKCul24n8yTksaPJO7hIYxZTVUPbq/D/mUU3lUe2T7fHa
X-Received: by 10.180.7.227 with SMTP id m3mr3501937wia.59.1395426128970;
	Fri, 21 Mar 2014 11:22:08 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id r1sm7652048wia.5.2014.03.21.11.22.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Mar 2014 11:22:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Mar 2014 18:21:58 +0000
Message-Id: <1395426119-3011-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] gtk-engines: don't inherit gtk-icon-cache
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
X-List-Received-Date: Fri, 21 Mar 2014 18:22:09 -0000

This was accidently left in and can be removed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 940d130..5255f00 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -26,7 +26,7 @@ FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/engines/.debug"
 
 CFLAGS_prepend = "-DHAVE_ANIMATION "
 
-inherit gnomebase gtk-icon-cache
+inherit gnomebase
 
 python populate_packages_prepend() {
     engines_root = os.path.join(d.getVar('libdir', True), "gtk-2.0/2.10.0/engines")
-- 
1.7.10.4


