Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 452787DD5C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 21:12:55 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id x132so1974859lfd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 14:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=LSzioJlsC38DUpxeAavfAfjUh2GJ4SxdBfQG2i22bDE=;
	b=NawIUCy2SzEYwukjQ6nXP2Uppos8A5RjoUtaW+GJjGDSJRvj9WsQe39ahAlLgCR5hS
	iMnsW9mdNA4yp7sO6oND2eflvL2rm3lwZpo1p8/GVq9CPi4P6QvWIBdrXhLWUXHLtN2u
	UV2kvrbv8SA8dGeFDsNJ3mH0M++vKX7d4MP9dT129Zm6YPRWn15gdVtKMOym5eng5vNm
	LT6M77YF/WmiAKNF0QA2x+8atRtb0eIM3AW975PyOeTd3Pjid5OpcLwFUWwC8PXFWfCV
	1ICz8KKSKsSZeQcMyZk4D/TrFZUgxvF/Lc8XdlupGrfn7KsLiXQlPqsEY0t3QAjh9or9
	+fEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LSzioJlsC38DUpxeAavfAfjUh2GJ4SxdBfQG2i22bDE=;
	b=WrdQE2p9KRLoop5hESMQdTeqbb2o9Ly/NOiRI50Mmj/fCkZwzoJoCHMcsFWHZRAisX
	vY3lZfEDtrJX7GqljAOTOIhAuVs8z0c6LnPukS0ktzZ0Zs64vQqsT6Ec9JIbv4ZdreCH
	hcqUOPWwfm3JntffTke82lfXdeVpHVoZpMlsEE5wPTL4qO3hoSEf4Nu/fZ8L2JywTza3
	H5xVYi7G9EPxuskRcdR7eWjffEXPSX6eirWaWpYF5z5l0lw4MK/jiTci2pHz8Usz3Bxz
	ZNVtgSnF8+87AZW6o8YHQE7/nQySbGSK919nUWYmbVVLEo8ez5bde53/InzzsrEoazQ0
	ErXg==
X-Gm-Message-State: APjAAAVmyeRrYFxbMP6go1Fg8t9cBE/AHnqQWsQfFKPON2kxNkvBi6t6
	Lc2YnsCjfIZhFV7fM5A+rOeIxv5vSFU=
X-Google-Smtp-Source: APXvYqyhzkXm0NH5S3aYOrgGDXMHSvjVgWYiJi0mMq3zhDtyp/Y27Vifq9HXrnxslW0hLaUN2qnXcA==
X-Received: by 2002:a19:81c7:: with SMTP id c190mr18120261lfd.55.1557263575631;
	Tue, 07 May 2019 14:12:55 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j19sm3537484lfj.52.2019.05.07.14.12.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 14:12:54 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 23:12:52 +0200
Message-Id: <20190507211252.19378-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] bitbake.conf: use https instead of http
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
X-List-Received-Date: Tue, 07 May 2019 21:12:56 -0000

Use HTTPS instead of HTTP whenever one is available.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/conf/bitbake.conf | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 14b0764f22..c13e4f3f71 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -631,28 +631,28 @@ BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
 ##################################################################
 # Settings used by bitbake-layers.
 ##################################################################
-BBLAYERS_LAYERINDEX_URL ??= "http://layers.openembedded.org/layerindex/"
+BBLAYERS_LAYERINDEX_URL ??= "https://layers.openembedded.org/layerindex/"
 BBLAYERS_FETCH_DIR ??= "${COREBASE}"
 
 ##################################################################
 # Download locations and utilities.
 ##################################################################
 
-APACHE_MIRROR = "http://archive.apache.org/dist"
+APACHE_MIRROR = "https://archive.apache.org/dist"
 DEBIAN_MIRROR = "http://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://gitlab.gnome.org/GNOME"
-GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
-GNU_MIRROR = "http://ftp.gnu.org/gnu"
+GNOME_MIRROR = "https://ftp.gnome.org/pub/GNOME/sources"
+GNU_MIRROR = "https://ftp.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
-KERNELORG_MIRROR = "http://cdn.kernel.org/pub"
-SOURCEFORGE_MIRROR = "http://downloads.sourceforge.net"
-XLIBS_MIRROR = "http://xlibs.freedesktop.org/release"
+KERNELORG_MIRROR = "https://cdn.kernel.org/pub"
+SOURCEFORGE_MIRROR = "https://downloads.sourceforge.net"
+XLIBS_MIRROR = "https://xlibs.freedesktop.org/release"
 XORG_MIRROR = "http://xorg.freedesktop.org/releases"
-SAVANNAH_GNU_MIRROR = "http://download.savannah.gnu.org/releases"
-SAVANNAH_NONGNU_MIRROR = "http://download.savannah.nongnu.org/releases"
-CPAN_MIRROR = "http://search.cpan.org/CPAN"
+SAVANNAH_GNU_MIRROR = "https://download.savannah.gnu.org/releases"
+SAVANNAH_NONGNU_MIRROR = "https://download.savannah.nongnu.org/releases"
+CPAN_MIRROR = "https://search.cpan.org/CPAN"
 
 SRC_URI[vardepsexclude] += "\
     APACHE_MIRROR \
-- 
2.17.1


