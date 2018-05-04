Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA4774CB8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 17:05:17 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id o76so17900378pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 10:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Etm4VItjnvicJCeakO9ze3G6JHDUGiXawzvLIV61t18=;
	b=AIHIk1nFlQx+fs1Vo2I/IV9yGTs8cUNUutdUyKgBLUeaCj4h+FzTQpO+ch93Q7dGEb
	t9yo78g5g8Jww0e8wTSnAAQXxziRWUtyLpO6qr2cx1fiFlIJ2SkNgOXAJSR93g2+4lnA
	LOpSyctjkJ6h7O6eoiUgpWQfz7/I5Lw2K+/RXWyE7ZHSaBAPCgdhrWAVfaH8QXVkl03G
	TpwE0kQwIEbS2tG3C82dvRS8C0FQA4RVCAe+yUmisVf58aaUtYmW5asi75hG0fJm9enb
	ou8kbljOseuO/1CGrH8KA74PbLs7BNdjsbMDHjZ6+R3mKupkPQjsTfZmb7933hxhG4aN
	GtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Etm4VItjnvicJCeakO9ze3G6JHDUGiXawzvLIV61t18=;
	b=SThvLNUi5hU5dWN+PTSkPLxBWF4Zu7Kvegz05bjRJwXklO0GA/K/hz797frIzBbRHm
	PLX3ozdxEB1/oBvGTzdS7kBvQXUIgaIKzQ5zQzexpxl6Dx/jG3PYz9isNtBCbLfyIx0I
	ZZ+Y451BsfDiiDYTMmAa5+eRySH354xgldUa4H+aDjJygXJsnEG4xY93IhADVnaTw933
	4f/Z+Y6YaK+ynxITR9Twq73Lhel8AZfZjx85+6Pdg880RmJy2ntPVceLy5fibBezl0q/
	iyPTVHYAtJh4Hdp5hIN7J5iH2gxePAl+HOIYmlmu+3HZQW3zi2uJMTUM5TFWcZOLBxjT
	p6WA==
X-Gm-Message-State: ALQs6tBobUdBG1avi3ATssF574Efjsg1Xs+uNAcpmD7GqLiviQGNpBn8
	d7yj7BLcGGhbezjOLqPkFqc=
X-Google-Smtp-Source: AB8JxZqaPnjkfQ1p9CKpqGRp2P1cCCqYHC0/TuiufGylUjM5PftY554YT1/d6o8JRUcFcy6QM/Vl0A==
X-Received: by 2002:a17:902:2804:: with SMTP id
	e4-v6mr28604364plb.153.1525453518278; 
	Fri, 04 May 2018 10:05:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	k13sm39807126pfj.186.2018.05.04.10.05.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 10:05:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 10:05:15 -0700
Message-Id: <1525453516-12693-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] tzcode-native: updatet to 2018e
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
X-List-Received-Date: Fri, 04 May 2018 17:05:17 -0000

  Changes to build procedure

    The command 'make tarballs' now also builds the tarball
    tzdataVERSION-rearguard.tar.gz, which is like tzdataVERSION.tar.gz
    except that it uses rearguard format intended for trailing-edge
    data parsers.

  Changes to data format and to code

    The SAVE column of Rule and Zone lines can now have an 's' or 'd'
    suffix, which specifies whether the adjusted time is standard time
    or daylight saving time.  If no suffix is given, daylight saving
    time is used if and only if the SAVE column is nonzero; this is
    the longstanding behavior.  Although this new feature is not used
    in tzdata, it could be used to specify the legal time in Namibia
    1994-2017, as opposed to the popular time (see below).

  Changes to past time stamps

    From 1994 through 2017 Namibia observed DST in winter, not summer.
    That is, it used negative DST, as Ireland still does.  This change
    does not affect UTC offsets; it affects only the tm_isdst flag and
    the abbreviation used during summer, which is now CAT, not WAST.
    Although (as noted by Michael Deckers) summer and winter time were
    both simply called "standard time" in Namibian law, in common
    practice winter time was considered to be DST (as noted by Stephen
    Colebourne).  The full effect of this change is only in vanguard
    format; in rearguard and main format, the tm_isdst flag is still
    zero in winter and nonzero in summer.

    In 1946/7 Czechoslovakia also observed negative DST in winter.
    The full effect of this change is only in vanguard format; in
    rearguard and main formats, it is modeled as plain GMT without
    daylight saving.  Also, the dates of some 1944/5 DST transitions
    in Czechoslovakia have been changed.
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tzcode/{tzcode-native_2018d.bb => tzcode-native_2018e.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2018d.bb => tzcode-native_2018e.bb} (70%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2018d.bb b/meta/recipes-extended/tzcode/tzcode-native_2018e.bb
similarity index 70%
rename from meta/recipes-extended/tzcode/tzcode-native_2018d.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2018e.bb
index 7933a5d..9a4e465 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2018d.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2018e.bb
@@ -11,10 +11,10 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "96612b4f5d7e8804fd9a0981c021be90"
-SRC_URI[tzcode.sha256sum] = "7de44e85baad748d217e3fd60706f599f9aec68bce6356b163f52b0dbd40a8d9"
-SRC_URI[tzdata.md5sum] = "871a7ef808eb42ebc551acdb3d661554"
-SRC_URI[tzdata.sha256sum] = "5106eddceb5f1ae3a91dbd3960e1b8b11ba0dc08579a31cf0724a7691b10c054"
+SRC_URI[tzdata.md5sum] = "97d654f4d7253173b3eeb76a836dd65e"
+SRC_URI[tzdata.sha256sum] = "6b288e5926841a4cb490909fe822d85c36ae75538ad69baf20da9628b63b692e"
+SRC_URI[tzcode.md5sum] = "c4d7df0fff7ba5588b32c5f27e2caf97"
+SRC_URI[tzcode.sha256sum] = "ca340cf20e80b699d6e5c49b4ba47361b3aa681f06f38a0c88a8e8308c00ebce"
 
 S = "${WORKDIR}"
 
-- 
2.7.4


