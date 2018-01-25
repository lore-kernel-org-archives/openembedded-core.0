Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 409C8787E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 16:33:44 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id b25so6128125pfd.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 08:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WOFgMH3bC6D0FhNWy8PYJUTE51HvK+/SeDrKgCJHcwY=;
	b=mlIb7jCKwrvubUbb8kSAMXNu05zBIwiifGybTObBu3013ZCMVNzpirZKz6gxWb+Hmq
	UGXl0TNjvnc9HTOTiQjQJUjaxzvZmd9IQ3Zdsd005X7QHs8+OfYR/Tdli73Kc8PG0UlA
	Eld1HE1wdfwO1axoxTKDlh6aSUGLAZHmpI1D1e9/MtnHRf2uJGuB2Zr2cOZY7QfIA7f4
	rQ2Yf5YvjX5LQZnHQ0FinfKoqWmGoZYyorqEACiZuZR2z+OYL8QdTdgObdn5PICOEgHa
	M0N9B7TnlM1R8pyVnSxsmPs0o8cMax1FtqBNT+s06D/bVzZfSuWVGH8fa63AmNg1EMPm
	qt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WOFgMH3bC6D0FhNWy8PYJUTE51HvK+/SeDrKgCJHcwY=;
	b=ik1TFmDfLYr+HYX/g4x5EMS56A9ThaRtKKISXLKgR2tif0UyoSVlevIzDBqZQdAw0s
	Xe+PjCxQRp3D7Yv//qqR4Xh8RjzGX4mm+3W4Ih+pifjiCtZYH7r/A+f1i0qB8iEy0I1M
	Id1aqtXrcUFMqV0r63C6JZgBxUcpJ4MY8hxYCw+om9yNI1MJS3yocXL7igWcnI6tOt2E
	u1p8Geek/ZZLgo+ONZqlR7bR+KVbNeEoeBHFCpjWrnqSQcNiXrz6Fg7pemKJ5aM9prRd
	qEjE5eQZP5WbR5A4K6Lp217EiUStqq/g/s4szKm8AyQHE3GqKZdJEe7LBzGN615q9uYm
	W8NQ==
X-Gm-Message-State: AKwxytcEUqmePnNEd6NMr4u5omEsHgmpDLVkB4xayc0MV3sQnEmKt2Fj
	6cGc6/DXzESbwlkLFZGO9/E=
X-Google-Smtp-Source: AH8x227bU+74sbXxLL75ICdGYqxxvuheKbGIyaYbMw2AF7cE4WBgOtYNlRFphtnio6imtIKgfpw0/A==
X-Received: by 10.98.105.199 with SMTP id e190mr16321790pfc.233.1516898026251; 
	Thu, 25 Jan 2018 08:33:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:e8f5:e813:6261:124d])
	by smtp.gmail.com with ESMTPSA id
	g2sm7738478pfh.134.2018.01.25.08.33.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Jan 2018 08:33:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Jan 2018 08:33:43 -0800
Message-Id: <1516898023-1986-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516898023-1986-1-git-send-email-akuster808@gmail.com>
References: <1516898023-1986-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] tzdata: update to 2018c
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
X-List-Received-Date: Thu, 25 Jan 2018 16:33:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 2018c release of the tz code and data is available. It follows on the 2018a and 2018b releases, which were published but were not announced until now, due to problems discovered late in their release processes. 2018a had a build-failure typo, and 2018a and 2018b both had problems with ICU and Java, downstream packages which do not support a feature (negative DST offsets) used in 2018a and 2018b. The typo has been fixed, and data changes using negative DST offsets have been reverted pending development of a mechanism to export data to platforms lacking support for such data.

  Briefly:
  São Tomé and Príncipe switched from +00 to +01.
  Brazil's DST will now start on November's first Sunday.
  Use Debian-style installation locations, instead of 4.3BSD-style.
  New zic option -t.

  Changes to past and future time stamps

    São Tomé and Príncipe switched from +00 to +01 on 2018-01-01 at
    01:00.  (Thanks to Steffen Thorsen and Michael Deckers.)

  Changes to future time stamps

    Starting in 2018 southern Brazil will begin DST on November's
    first Sunday instead of October's third Sunday. (Thanks to
    Steffen Thorsen.)

  Changes to past time stamps

    Japanese DST transitions (1948-1951) were Sundays at 00:00, not
    Saturdays or Sundays at 02:00.  (Thanks to Takayuki Nikai.)

    A discrepancy of 4 s in timestamps before 1931 in South Sudan has
    been corrected.  The 'backzone' and 'zone.tab' files did not agree
    with the 'africa' and 'zone1970.tab' files.  (Problem reported by
    Michael Deckers.)

    The abbreviation invented for Bolivia Summer Time (1931-2) is now
    BST instead of BOST, to be more consistent with the convention
    used for Latvian Summer Time (1918-9) and for British Summer Time.

  Changes to build procedure

    The default installation locations have been changed to mostly
    match Debian circa 2017, instead of being designed as an add-on to
    4.3BSD circa 1986.  This affects the Makefile macros TOPDIR,
    TZDIR, MANDIR, and LIBDIR.  New Makefile macros TZDEFAULT, USRDIR,
    USRSHAREDIR, BINDIR, ZDUMPDIR, and ZICDIR let installers tailor
    locations more precisely.  (This responds to suggestions from
    Brian Inglis and from Steve Summit.)

    The default installation procedure no longer creates the
    backward-compatibility link US/Pacific-New, which causes
    confusion during user setup (e.g., see Debian bug 815200).
    Use 'make BACKWARD="backward pacificnew"' to create the link
    anyway, for now.  Eventually we plan to remove the link entirely.

    tzdata.zi now contains a version-number comment.
    (Suggested by Tom Lane.)

    The Makefile now quotes values like BACKWARD more carefully when
    passing them to the shell.  (Problem reported by Zefram.)

    Builders no longer need to specify -DHAVE_SNPRINTF on platforms
    that have snprintf and use pre-C99 compilers. (Problem reported
    by Jon Skeet.)

    The build procedure now works around mawk 1.3.3's lack of support
    for character class expressions.  (Problem reported by Ohyama.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/{tzdata_2017c.bb => tzdata_2018c.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2017c.bb => tzdata_2018c.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2017c.bb b/meta/recipes-extended/tzdata/tzdata_2018c.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2017c.bb
rename to meta/recipes-extended/tzdata/tzdata_2018c.bb
index 9e5b929..ff5ec1c 100644
--- a/meta/recipes-extended/tzdata/tzdata_2017c.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2018c.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "1e751e7e08f8b68530674f04619d894d"
-SRC_URI[tzdata.sha256sum] = "d6543f92a929826318e2f44ff3a7611ce5f565a43e10250b42599d0ba4cbd90b"
+SRC_URI[tzdata.md5sum] = "c412b1531adef1be7a645ab734f86acc"
+SRC_URI[tzdata.sha256sum] = "2825c3e4b7ef520f24d393bcc02942f9762ffd3e7fc9b23850789ed8f22933f6"
 
 inherit allarch
 
-- 
2.7.4


