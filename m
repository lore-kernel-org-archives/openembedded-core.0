Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 283E86FF84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 23:42:35 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id j3so2612343paj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 16:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NOP5vbCFS7OzBfwimLl+DLsB4vcttfWX/pBx/pbS6Es=;
	b=vZltbSSdxx1Hx/xyAHO/03tvsAYr7fYO7dccg5CMZ7coX68FGcW21ZvcQ5rX7eQv/0
	g1CelP+w1quG+hwwp1STK/FXAFZ0dFdAtr4xBO/FPqwO6D+sdthTyQVKP1ZRfA7XxTl2
	whcQeCALT6a0Xz727Nu2+6utWTSAYHnp1mIxqskQe8s3/zOf4jyqDFEFuHxl1Y0Qq1oN
	TTxXgeUYspm6mAnmfGLCgAhDS9cmuVzg3vBuatnVh5knC/GW6teYbcrvUUnxXvOsmrGZ
	uxJK+bJ1z1Zp7IRA9WmjeXHpIL/tiNE9NasVkFJS9RcMQW0DbpBj1r0jw79OyXH0H83N
	SUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NOP5vbCFS7OzBfwimLl+DLsB4vcttfWX/pBx/pbS6Es=;
	b=KQHVWRYHqp6r8qu1lizN0mCzF/hCSyyQzXgRSB1HH8UO7k4Ccj1KWe5cXfadGh3UH9
	669l1Zx+xm4x5sfvHmSmSit0tRxq42QKftZ8fs95e1FFJD6cYziK8D3fCcMkuIjQzbVN
	zsPy9obMrl5RwzwD3HT7KN6NAmgkTuviqFa/KR7wT5uUOitSUeg2JbgR7anj+3n8W7bv
	STa5Uoq39YzWE7Zmm6gySzLIGDuvHSyAw4k8FHqM87jpsk2bOwuc7kbiEqSZ7lYEIMYj
	Q5pe68C63oOINSi6sKLryHdCE4xlW+eTl6gexJzms19kvTtAO7wL7arR58rrPT0d8Bmu
	+7sA==
X-Gm-Message-State: AA6/9RlGESu2XlPYCCtjzj4lig4yDliYIRW1ebU+fIHSdnzO0PHmKJGX0eCkFIk4wnatDQ==
X-Received: by 10.66.249.170 with SMTP id yv10mr24286851pac.16.1475106157452; 
	Wed, 28 Sep 2016 16:42:37 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	b125sm14979340pfg.36.2016.09.28.16.42.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Sep 2016 16:42:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2016 16:42:35 -0700
Message-Id: <1475106155-18988-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475106155-18988-1-git-send-email-akuster808@gmail.com>
References: <1475106155-18988-1-git-send-email-akuster808@gmail.com>
Subject: [Master][Krogoth][Jethro][PATCH 2/2] tzdata: update to 2016g
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
X-List-Received-Date: Wed, 28 Sep 2016 23:42:36 -0000

From: Armin Kuster <akuster@mvista.com>

LICENSE md5sum changed do to rewording some text not released to the license.
see https://github.com/eggert/tz/commit/8c143a2b65fdfd43a7911be6fdb700c9c4553f58

  Changes to future time stamps

    Turkey switched from EET/EEST (+02/+03) to permanent +03,
    effective 2016-09-07.  (Thanks to Burak AYDIN.)  Use "+03" rather
    than an invented abbreviation for the new time.

    New leap second 2016-12-31 23:59:60 UTC as per IERS Bulletin C 52.
    (Thanks to Tim Parenti.)

  Changes to past time stamps

    For America/Los_Angeles, spring-forward transition times have been
    corrected from 02:00 to 02:01 in 1948, and from 02:00 to 01:00 in
    1950-1966.

    For zones using Soviet time on 1919-07-01, transitions to UT-based
    time were at 00:00 UT, not at 02:00 local time.  The affected
    zones are Europe/Kirov, Europe/Moscow, Europe/Samara, and
    Europe/Ulyanovsk.  (Thanks to Alexander Belopolsky.)

  Changes to past and future time zone abbreviations

    The Factory zone now uses the time zone abbreviation -00 instead
    of a long English-language string, as -00 is now the normal way to
    represent an undefined time zone.

    Several zones in Antarctica and the former Soviet Union, along
    with zones intended for ships at sea that cannot use POSIX TZ
    strings, now use numeric time zone abbreviations instead of
    invented or obsolete alphanumeric abbreviations.  The affected
    zones are Antarctica/Casey, Antarctica/Davis,
    Antarctica/DumontDUrville, Antarctica/Mawson, Antarctica/Rothera,
    Antarctica/Syowa, Antarctica/Troll, Antarctica/Vostok,
    Asia/Anadyr, Asia/Ashgabat, Asia/Baku, Asia/Bishkek, Asia/Chita,
    Asia/Dushanbe, Asia/Irkutsk, Asia/Kamchatka, Asia/Khandyga,
    Asia/Krasnoyarsk, Asia/Magadan, Asia/Omsk, Asia/Sakhalin,
    Asia/Samarkand, Asia/Srednekolymsk, Asia/Tashkent, Asia/Tbilisi,
    Asia/Ust-Nera, Asia/Vladivostok, Asia/Yakutsk, Asia/Yekaterinburg,
    Asia/Yerevan, Etc/GMT-14, Etc/GMT-13, Etc/GMT-12, Etc/GMT-11,
    Etc/GMT-10, Etc/GMT-9, Etc/GMT-8, Etc/GMT-7, Etc/GMT-6, Etc/GMT-5,
    Etc/GMT-4, Etc/GMT-3, Etc/GMT-2, Etc/GMT-1, Etc/GMT+1, Etc/GMT+2,
    Etc/GMT+3, Etc/GMT+4, Etc/GMT+5, Etc/GMT+6, Etc/GMT+7, Etc/GMT+8,
    Etc/GMT+9, Etc/GMT+10, Etc/GMT+11, Etc/GMT+12, Europe/Kaliningrad,
    Europe/Minsk, Europe/Samara, Europe/Volgograd, and
    Indian/Kerguelen.  For Europe/Moscow the invented abbreviation MSM
    was replaced by +05, whereas MSK and MSD were kept as they are not
    our invention and are widely used.

  Changes to zone names

    Rename Asia/Rangoon to Asia/Yangon, with a backward compatibility link.
    (Thanks to David Massoud.)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzdata/{tzdata_2016f.bb => tzdata_2016g.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2016f.bb => tzdata_2016g.bb} (97%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2016f.bb b/meta/recipes-extended/tzdata/tzdata_2016g.bb
similarity index 97%
rename from meta/recipes-extended/tzdata/tzdata_2016f.bb
rename to meta/recipes-extended/tzdata/tzdata_2016g.bb
index a66603f..3ee4b5a 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016f.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016g.bb
@@ -2,15 +2,15 @@ SUMMARY = "Timezone data"
 HOMEPAGE = "http://www.iana.org/time-zones"
 SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ef1a352b901ee7b75a75df8171d6aca7"
 
 DEPENDS = "tzcode-native"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "b20b3c1618db1984aac685e763de001d"
-SRC_URI[tzdata.sha256sum] = "ed8c951008d12f1db55a11e96fc055718c6571233327d9de16a7f8475e2502b0"
+SRC_URI[tzdata.md5sum] = "3c7e97ec8527211104d27cc1d97a23de"
+SRC_URI[tzdata.sha256sum] = "3c7137b2bc47323b0de47b77786bacf81ed503d4b2c693ff8ada2fbd1281ebd1"
 
 inherit allarch
 
-- 
2.7.4


