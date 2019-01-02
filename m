Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id EB1076BA9C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:36:17 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id w4so14723304plz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TTAQwt3IcxHFrYyjQEwk7On/1lZTq0CqWbMWsBg8mNs=;
	b=R3wQ/fakeZaURVSXydX/UMA8YYRL8nAZKV6fXAkykwuc/c4nu6yfMQWWBBlkMWhzb0
	SSedqzkzuOVcCQSOS1fJuc0MfN5yPrOYjubBkgTbUX4H+2vbwkHKVyzxvfhOOLquUNb2
	XTi1f+ca9374QlJzLyusN7AqNfsJfIkiWsgFcbSuYvPjUCWvLQ+E6ixtFoEdQsi+PgKH
	5rS964FEjC1lLy4vUt5NvgotHIN48Z9twoRXjLeaAZOkIBoPrYQVsRC6mgelCJiWoqYc
	B54XFCKjfcANNjrsYRyQ2z/62KE4gkUv9bdtyqIJM5BzquxL767nCEOAJFiL7V3zh6hb
	ARbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TTAQwt3IcxHFrYyjQEwk7On/1lZTq0CqWbMWsBg8mNs=;
	b=e9dAyseN1FvAv6SGEfr6wsQIxlp21j143ZkTdHvck/1VLhJXpp/cJv7Wt3OgGhrzAn
	uNrCrD9uoPYZ6zYxPzazj90VkTqDFWYrp4ZY3Xmcpzg5X9mRGEiyBMLyzzWRwYHGis4e
	7JuDJ5HioBV53kvR9noxy1fhlUIws03zAgFg4rd/vvK3xLnWvnVYkxqEcEHhDPJX5GuB
	7v9gpko8TMINuLrJfcOc+/vf/MXuttNb7ZEJ2LZD4YyqPPFRhL3ocUy5rWOAhvRWgmZA
	KMRonAbRuZfBybUrZYswisItrstQAmOWN8jYGRTa9u3m2gORVDtbFlSR6UmIr3y0YmV9
	BJ1Q==
X-Gm-Message-State: AJcUukeIEGiSvOzPdn3E8Qt1DMuhW+0EDnl2RcqG4DPBZQJ0gLzT30OV
	+N+uBOgRTLqvvpZBLYfGxIs=
X-Google-Smtp-Source: ALg8bN5WCwqDlh0LurrRGct3LNcanJz4a3lRMxFzQ0GdgM8L72nYT9KlJlC4s9a9FjCLS7p5ctUMsw==
X-Received: by 2002:a17:902:7443:: with SMTP id
	e3mr44115303plt.304.1546446978785; 
	Wed, 02 Jan 2019 08:36:18 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:b176:14d6:5577:24f])
	by smtp.gmail.com with ESMTPSA id
	v89sm62973472pfj.164.2019.01.02.08.36.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Jan 2019 08:36:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 08:36:10 -0800
Message-Id: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/8] tzdata/tzcode-native: update to 2018i
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
X-List-Received-Date: Wed, 02 Jan 2019 16:36:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2018i:

  Briefly:
    São Tomé and Príncipe switches from +01 to +00 on 2019-01-01.

  Changes to future timestamps

    Due to a change in government, São Tomé and Príncipe switches back
    from +01 to +00 on 2019-01-01 at 02:00.  (Thanks to Vadim
    Nasardinov and Michael Deckers.)

2018h:
Briefly:
    Qyzylorda, Kazakhstan moved from +06 to +05 on 2018-12-21.
    New zone Asia/Qostanay because Qostanay, Kazakhstan didn't move.
    Metlakatla, Alaska observes PST this winter only.
    Guess Morocco will continue to adjust clocks around Ramadan.
    Add predictions for Iran from 2038 through 2090.

  Changes to future timestamps

    Guess that Morocco will continue to fall back just before and
    spring forward just after Ramadan, the practice since 2012.
    (Thanks to Maamar Abdelkader.)  This means Morocco will observe
    negative DST during Ramadan in main and vanguard formats, and in
    rearguard format it stays in the +00 timezone and observes
    ordinary DST in all months other than Ramadan.  As before, extend
    this guesswork to the year 2037.  As a consequence, Morocco is
    scheduled to observe three DST transitions in some Gregorian years
    (e.g., 2033) due to the mismatch between the Gregorian and Islamic
    calendars.

    The table of exact transitions for Iranian DST has been extended.
    It formerly cut off before the year 2038 in a nod to 32-bit time_t.
    It now cuts off before 2091 as there is doubt about how the Persian
    calendar will treat 2091.  This change predicts DST transitions in
    2038-9, 2042-3, and 2046-7 to occur one day later than previously
    predicted.  As before, post-cutoff transitions are approximated.

  Changes to past and future timestamps

    Qyzylorda (aka Kyzylorda) oblast in Kazakhstan moved from +06 to
    +05 on 2018-12-21.  This is a zone split as Qostanay (aka
    Kostanay) did not switch, so create a zone Asia/Qostanay.

    Metlakatla moved from Alaska to Pacific standard time on 2018-11-04.
    It did not change clocks that day and remains on -08 this winter.
    (Thanks to Ryan Stanley.)  It will revert to the usual Alaska
    rules next spring, so this change affects only timestamps
    from 2018-11-04 through 2019-03-10.

  Change to past timestamps

    Kwajalein's 1993-08-20 transition from -12 to +12 was at 24:00,
    not 00:00.  I transcribed the time incorrectly from Shanks.
    (Thanks to Phake Nick.)

    Nauru's 1979 transition was on 02-10 at 02:00, not 05-01 at 00:00.
    (Thanks to Phake Nick.)

    Guam observed DST irregularly from 1959 through 1977.
    (Thanks to Phake Nick.)

    Hong Kong observed DST in 1941 starting 06-15 (not 04-01), then on
    10-01 changed standard time to +08:30 (not +08).  Its transition
    back to +08 after WWII was on 1945-09-15, not the previous day.
    Its 1904-10-30 change took effect at 01:00 +08 (not 00:00 LMT).
    (Thanks to Phake Nick, Steve Allen, and Joseph Myers.)  Also,
    its 1952 fallback was on 11-02 (not 10-25).

    This release contains many changes to timestamps before 1946 due
    to Japanese possession or occupation of Pacific/Chuuk,
    Pacific/Guam, Pacific/Kosrae, Pacific/Kwajalein, Pacific/Majuro,
    Pacific/Nauru, Pacific/Palau, and Pacific/Pohnpei.
    (Thanks to Phake Nick.)

    Assume that the Spanish East Indies was like the Philippines and
    observed American time until the end of 1844.  This affects
    Pacific/Chuuk, Pacific/Kosrae, Pacific/Palau, and Pacific/Pohnpei.

  Changes to past tm_isdst flags

    For the recent Morocco change, the tm_isdst flag should be 1 from
    2018-10-27 00:00 to 2018-10-28 03:00.  (Thanks to Michael Deckers.)
    Give a URL to the official decree.  (Thanks to Matt Johnson.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tzcode/{tzcode-native_2018g.bb => tzcode-native_2018i.bb}     | 8 ++++----
 meta/recipes-extended/tzdata/{tzdata_2018g.bb => tzdata_2018i.bb} | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2018g.bb => tzcode-native_2018i.bb} (70%)
 rename meta/recipes-extended/tzdata/{tzdata_2018g.bb => tzdata_2018i.bb} (98%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2018g.bb b/meta/recipes-extended/tzcode/tzcode-native_2018i.bb
similarity index 70%
rename from meta/recipes-extended/tzcode/tzcode-native_2018g.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2018i.bb
index 3e2b60a..f056370 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2018g.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2018i.bb
@@ -11,10 +11,10 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "b48f0282b80bb7dbe16e35626f446ae9"
-SRC_URI[tzcode.sha256sum] = "aa53f4fb6570f02081be61dc11ade19ea5a280c23822a5b4016ce0c6be23c427"
-SRC_URI[tzdata.md5sum] = "e71cb1f9d8d53c43904d79d7aeeedc1b"
-SRC_URI[tzdata.sha256sum] = "02dfde534872f6513ae4553a3388fdae579441e31b862ea99170dfc447f46a16"
+SRC_URI[tzcode.md5sum] = "6a6d98be8fa2fa3485e25343e79188b4"
+SRC_URI[tzcode.sha256sum] = "aaacdb876ca6fb9d58e244b462cbc7578a496b1b10994381b4b32b9f2ded32dc"
+SRC_URI[tzdata.md5sum] = "b3f0a1a789480a036e58466cd0702477"
+SRC_URI[tzdata.sha256sum] = "82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c6550740587c6ac5a7108c00d9"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-extended/tzdata/tzdata_2018g.bb b/meta/recipes-extended/tzdata/tzdata_2018i.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2018g.bb
rename to meta/recipes-extended/tzdata/tzdata_2018i.bb
index dba82ac..4482e89 100644
--- a/meta/recipes-extended/tzdata/tzdata_2018g.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2018i.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "e71cb1f9d8d53c43904d79d7aeeedc1b"
-SRC_URI[tzdata.sha256sum] = "02dfde534872f6513ae4553a3388fdae579441e31b862ea99170dfc447f46a16"
+SRC_URI[tzdata.md5sum] = "b3f0a1a789480a036e58466cd0702477"
+SRC_URI[tzdata.sha256sum] = "82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c6550740587c6ac5a7108c00d9"
 
 inherit allarch
 
-- 
2.7.4


