Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id ACB0978985
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 16:00:51 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o15so11251504wrf.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jan 2018 08:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XIzMjsHImPm2A5dgFalIj+AQgtSVrakOIhqqYcRarRU=;
	b=ND4NiPR7x0dhQQ0+dXnkCRtReaN2oD/Koi5KZ1Pd7T2tYRDdDYQrVNxJCc3Vixgxk5
	xuuaLM63hrya/lSz11oZIfb6NG8jT7hGI3ryYtf/YcYYcu7xsxwzy9Jkds2XenRml5jg
	2mqlbbng8VfJ7acEOsFaRYvMwaHvrPHywBsVOl5c0QjK2xYFAEOorVpaVKiwpB4ZPpza
	d2CY4dKf7EWi0urFHZr2H6gUZ8kIA0lXI+QIZqQ0+Dx33eytE30LtSdrBUtPAutRro+M
	HaS2hoATQU67D6DT7eptoffRkdIX9JyOP402xRJBdQgxUuqPs7DCops8IdJnNRwdq7Zs
	7X2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XIzMjsHImPm2A5dgFalIj+AQgtSVrakOIhqqYcRarRU=;
	b=ESU1kQihDpkQvKlIaNxpsEi/O9gizKDo1sp9OvtjKYLS9K0UEwKtZvNCb/NWol+tSt
	GNvaTXs590cfp9/l7sIXIleeB6lViIvsgsxafWXvQJ+t22KNox3DDqIE64XmFgA91m9f
	YIM8kMUjXbHtcmmMUvRia3NotPu7zjNy5TqUChQMxUnhLgLHDDitAjUTIXNC8cV1Iwzs
	8Ia3lPx3fWIzFWnR3reFU+o57+fkPC4Iv1YLo5mxwiqBgmY7klX8xqxw2045Qsht7wfo
	Kb2qrCs2t3KXsIu0Ck5Pr6ewllwcjSbYA11mdsVYtxfOALAuURqaIMS513Cl2gU0Ija9
	9+fQ==
X-Gm-Message-State: AKGB3mLa7m8aYBoDXU2nZZ4lwxJxeMOmEeZdtt5v2W8+oiNp1z0NJG9U
	eqGsR4CG8dNbsgMwWD9CKj9S5QWT
X-Google-Smtp-Source: ACJfBou01erMZeavslyiE4cnTMVMyIgiwH+ivzwVrhvQFzZ6Ha2BWCj1VC0WI4Bhz+2/YuVs/9D4dQ==
X-Received: by 10.223.139.78 with SMTP id v14mr10568071wra.136.1515427248565; 
	Mon, 08 Jan 2018 08:00:48 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b15sm11386658wrh.5.2018.01.08.08.00.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 08:00:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 16:00:17 +0000
Message-Id: <20180108160021.4715-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180108160021.4715-1-ross.burton@intel.com>
References: <20180108160021.4715-1-ross.burton@intel.com>
Subject: [PATCH 5/9] native/cross: remove redundant DEPENDS_GETTEXT assignment
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
X-List-Received-Date: Mon, 08 Jan 2018 16:00:52 -0000

DEPENDS_GETTEXT defaults to gettext-native, so there's no need to set it again
in these classes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cross.bbclass  | 2 --
 meta/classes/native.bbclass | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index e9fafed7835..4e85cab2d19 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -41,8 +41,6 @@ LDFLAGS_build-darwin = "-L${STAGING_LIBDIR_NATIVE}"
 
 TOOLCHAIN_OPTIONS = ""
 
-DEPENDS_GETTEXT = "gettext-native"
-
 # This class encodes staging paths into its scripts data so can only be
 # reused if we manipulate the paths.
 SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 9c434dce83e..a911f2aebdb 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -52,8 +52,6 @@ STAGING_BINDIR_CROSS = "${STAGING_BINDIR_NATIVE}"
 # native pkg doesn't need the TOOLCHAIN_OPTIONS.
 TOOLCHAIN_OPTIONS = ""
 
-DEPENDS_GETTEXT = "gettext-native"
-
 # Don't build ptest natively
 PTEST_ENABLED = "0"
 
-- 
2.11.0


