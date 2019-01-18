Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id EF9BA7C0C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 13:54:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q18so15130600wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 05:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=EbtDqFOMehj9E3N1O1kDIHDe4TYHKilHCJLxdeEmu5Y=;
	b=kYgPW6eAkhlBMOl37XQPzt1qjA28GOwOVvyugS9OyqxcOQRsqznKngG315Mf8jMttQ
	NiE2mCKhX/1pGTtXPFNppnwOW8qtFdksWTT8nRq5Za8Ja0elOHua3B8yJl45LTFVG71R
	A4HwjmSzJ4O5vg7UWMhkXVzg/vJukoq8tWz+4Mzj/3g0Q3Fzaa8geWAEje0g44nvA5sB
	YMjT0ni/vHyZkN2flBE0nVe/nV2V+Qpfrau7wwLvo3qWEi0UEcwtodSGXithy6ZLL0iE
	iV/ChvvTBWtemnzOT1GajwkImANg5mdQmENWQ8g3K0eRvuU19LmW7js9fGoMH5OWfqhH
	Y4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EbtDqFOMehj9E3N1O1kDIHDe4TYHKilHCJLxdeEmu5Y=;
	b=Qbm6eVjslBwobP813VhK/ez75jOqATDhI5HVgvGxaN4En8qrd9Zn+aS66wNyrDKavh
	s1ZH+3DoYmOsP6exz7y7ttJVsLoGajqiTJEPZX7LRE2o+IZk6k4ThS143KSXOT53TVgW
	sjURalpvcA0Q7GFMMuiBvXPM+0ONczblgIj07RA3rXKikNv7cr5OLsSbEv/4e6GSviaT
	nD9agkZuJUtwg0Y5pc94PFrX7fLGAyMugJYhsjExrRShk3O54lTZvpVwj2mHvKQfijBG
	RK0wQOCNPTzzy0l6QF/u8c2rarLRQA70DncQdikuj/bR7Ht5PbNmE8fJk2DFnaBSaW7e
	SNhg==
X-Gm-Message-State: AJcUukerDBCQ+VYjAPdbuejomX5tnOgyBcwVyVNE6CSfljrQJA0F9DXT
	sCmVLMElxPCSClfuxgg7FkUE2xRQbg4=
X-Google-Smtp-Source: ALg8bN7LkwBzZkg4r7wId8NCKriRzpIQG0O6eASg8Po77OpAXdw70srlJCSjHa6eV+bV0Ee9xqVReA==
X-Received: by 2002:a5d:444a:: with SMTP id x10mr17182008wrr.162.1547819653463;
	Fri, 18 Jan 2019 05:54:13 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 3sm52811739wmw.46.2019.01.18.05.54.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jan 2019 05:54:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2019 13:54:11 +0000
Message-Id: <20190118135411.12847-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libxslt: install documentation into an unversioned directory
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
X-List-Received-Date: Fri, 18 Jan 2019 13:54:13 -0000

The version number isn't useful in /usr/share/doc as we can only install one
copy of libxslt, and this reduces noise in buildhistory-diff reports.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.33.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.33.bb b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
index 0e0c10d8168..fd442d44f72 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.33.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
@@ -30,7 +30,7 @@ do_configure_prepend () {
 	touch ${S}/doc/xsltproc.1
 }
 
-EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
+EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto --with-html-subdir=${BPN}"
 # older versions of this recipe had ${PN}-utils
 RPROVIDES_${PN}-bin += "${PN}-utils"
 RCONFLICTS_${PN}-bin += "${PN}-utils"
-- 
2.11.0


