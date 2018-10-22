Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id EC70179C4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:43 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y144-v6so10461424wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=e2OeqDKsbfKD4QPDo4cVoqpIVrKxfp2BmjODJ79WewE=;
	b=FEO+2RB4ZcGMxgaqBM1cM0+WBGBZV1Kw+ydYdRyNDi8hPCyrixzk5Iuq2PVSckCmSG
	Qc/h6IdKdbOrRTqXbdj0prDECE9j5h2kL85FsXAGEr3j8EDHH1pqyxQs4KlVOzEN+NeC
	PV37eXu+0uAuELS1mWjI45X6eSUs36p4VgLE+OS6tX6j6EJqlSKXK5svM3bBXU6m1FNX
	JobJQ1g6+6PD1WOPOza9glFFxf2RjKBxKRbPZ8zusdcpePKOk5rQcVkTKw5Zrl5Sq0hN
	Jbm/yYoEVe/WD9055qFTOqkVpO+uC9/kH97+1yThlkpxxPI5dBNIToG0QF0yq6y6jeY+
	0+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=e2OeqDKsbfKD4QPDo4cVoqpIVrKxfp2BmjODJ79WewE=;
	b=NsXDH7RY3lRNcHe1OtcOiSomXROFKeGi/fp7coLp8NSSW2JdJjKp8+lh1prarwI9wa
	/xW43AFkULSJS837/I+GvKLNXUAL+FXGaYFwjSXkiczn5zrffdB3TwQRthD/saD8t5oS
	pgSyLwlebqxg6p+ZrN++CvnskjnTG97B3ukL/ow2yjZ3/yF/31ftaBd5y0nVXvN0Xjvk
	6tvEfWIwlC6DG0coCQTEzjANhe8La2qj/OcE4r+ejcMrIKZnGX0fpvoXvmFCxtSNng9r
	O/nxUSasR02UNY/JPUbw/WOe2Iu/HUQhoRmFeoDyeRz6IuULLFxTi1pHUNTPQ+2ZfP19
	C3Hg==
X-Gm-Message-State: ABuFfoi9+HPXJrLNWPtw33pigOwDnJsYtDWHyytF8pyZDCk1xEEsiH89
	BV6loCw9mhafjZJ3g4vLytv2dQYjM5Q=
X-Google-Smtp-Source: ACcGV63UZGIXSnKV049A5WInP27ko4ooKHvrT1aKTJYL/0O+wgu+uKUEwPSePinfoz1bAinw3M6UJg==
X-Received: by 2002:a1c:2081:: with SMTP id
	g123-v6mr15970979wmg.144.1540217144483; 
	Mon, 22 Oct 2018 07:05:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:05:12 +0100
Message-Id: <1540217112-24479-14-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 13/13] tzdata: update to 2018f
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
X-List-Received-Date: Mon, 22 Oct 2018 14:05:44 -0000

 Briefly:
  Volgograd moves from +03 to +04 on 2018-10-28.
  Fiji ends DST 2019-01-13, not 2019-01-20.
  Most of Chile changes DST dates, effective 2019-04-06.

  Changes to future timestamps

    Volgograd moves from +03 to +04 on 2018-10-28 at 02:00.
    (Thanks to Alexander Fetisov and Stepan Golosunov.)

    Fiji ends DST 2019-01-13 instead of the 2019-01-20 previously
    predicted.  (Thanks to Raymond Kumar.)  Adjust future predictions
    accordingly.

    Most of Chile will end DST on the first Saturday in April at 24:00 mainland
    time, and resume DST on the first Saturday in September at 24:00 mainland
    time.  The changes are effective from 2019-04-06, and do not affect the
    Magallanes region modeled by America/Punta_Arenas.  (Thanks to Juan Correa
    and Tim Parenti.)  Adjust future predictions accordingly.

  Changes to past timestamps

    The 2018-05-05 North Korea 30-minute time zone change took place
    at 23:30 the previous day, not at 00:00 that day.

    China's 1988 spring-forward transition was on April 17, not
    April 10.  Its DST transitions in 1986/91 were at 02:00, not 00:00.
    (Thanks to P Chan.)

    Fix several issues for Macau before 1992.  Macau's pre-1904 LMT
    was off by 10 s.  Macau switched to +08 in 1904 not 1912, and
    temporarily switched to +09/+10 during World War II.  Macau
    observed DST in 1942/79, not 1961/80, and there were several
    errors for transition times and dates.  (Thanks to P Chan.)

    The 1948-1951 fallback transitions in Japan were at 25:00 on
    September's second Saturday, not at 24:00.  (Thanks to Phake Nick.)
    zic turns this into 01:00 on the day after September's second
    Saturday, which is the best that POSIX or C platforms can do.

    Incorporate 1940-1949 Asia/Shanghai DST transitions from a 2014
    paper by Li Yu, replacing more-questionable data from Shanks.

  Changes to time zone abbreviations

    Use "PST" and "PDT" for Philippine time.  (Thanks to Paul Goyette.)

 Changes to documentation

    New restrictions: A Rule name must start with a character that
    is neither an ASCII digit nor "-" nor "+", and an unquoted name
    should not use characters in the set "!$%&'()*,/:;<=>?@[\]^`{|}~".
    The latter restriction makes room for future extensions (a
    possibility noted by Tom Lane).

    tzfile.5 now documents what time types apply before the first and
    after the last transition, if any.

    Documentation now uses the spelling "timezone" for a TZ setting
    that determines timestamp history, and "time zone" for a
    geographic region currently sharing the same standard time.

    The name "TZif" is now used for the tz binary data format.

    tz-link.htm now mentions the A0 TimeZone Migration utilities.
    (Thanks to Aldrin Martoq for the link.)

  Changes to build procedure

    New 'make' target 'rearguard_tarballs' to build the rearguard
    tarball only.  This is a convenience on platforms that lack lzip
    if you want to build the rearguard tarball.  (Problem reported by
    Deborah Goldsmith.)

    tzdata.zi is now more stable from release to release.  (Problem
    noted by Tom Lane.)  It is also a bit shorter.

    tzdata.zi now can contain comment lines documenting configuration
    information, such as which data format was selected, which input
    files were used, and how leap seconds are treated.  (Problems
    noted by Lester Caine and Brian Inglis.)  If the Makefile defaults
    are used these comment lines are absent, for backward
    compatibility.  A redistributor intending to alter its copy of the
    files should also append "-LABEL" to the 'version' file's first
    line, where "LABEL" identifies the redistributor's change.
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/{tzdata_2018e.bb => tzdata_2018f.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2018e.bb => tzdata_2018f.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2018e.bb b/meta/recipes-extended/tzdata/tzdata_2018f.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2018e.bb
rename to meta/recipes-extended/tzdata/tzdata_2018f.bb
index f806d5b..b167540 100644
--- a/meta/recipes-extended/tzdata/tzdata_2018e.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2018f.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "97d654f4d7253173b3eeb76a836dd65e"
-SRC_URI[tzdata.sha256sum] = "6b288e5926841a4cb490909fe822d85c36ae75538ad69baf20da9628b63b692e"
+SRC_URI[tzdata.md5sum] = "e5e84f00f9d18bd6ebc8b1affec91b15"
+SRC_URI[tzdata.sha256sum] = "0af6a85fc4ea95832f76524f35696a61abb3992fd3f8db33e5a1f95653e043f2"
 
 inherit allarch
 
-- 
2.7.4


