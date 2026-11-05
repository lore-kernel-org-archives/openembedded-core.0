Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30058.1793868227518436409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=CtsazFqF;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e10a70540so967576f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868226; x=1794473026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iCa7Q5TtCSEemoH3Ww23JWJ+UCEqT86IO2EacuvaYMY=;
        b=CtsazFqFOahZhCIli16hni9Tp82v9i1q/WQg8hTGmajz55obM+erCVyHZOncEgUuWl
         iHx4+/nDyldb1a0dhqxnBJiEy7ToGaIFrUg2+P04GBL6assemNMD7LUExHYIvzO3XVWg
         ztimkyRisE3XExa9WKFQXWOQw4RBW7iGY9UmBfuOTNA2thNjbWJ81EdNsiVGETLmb+S+
         QBC6clE6TBdGzmlsHaz6IFNj8Qbw6ET+AJG9IF/athmKcSsHChGokeP/IFPUqJdi4Vbq
         Repg5O11zkhG3jdmZMHas5k9PwUmHdHYvSpa8Lep4/LblGLHcs2CrGg/iSmVNOC+0aLa
         yZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868226; x=1794473026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iCa7Q5TtCSEemoH3Ww23JWJ+UCEqT86IO2EacuvaYMY=;
        b=yu6wyVH/ES2IKkTbyJ+R/q8075c43xvmtZt4sRiG6A9x30hMt3AsBNtO8pPpg8eq6/
         tvbArdmBnu4vcE/LKWbKfNeXf6lykrGWqc+tahMt50U+WWibOG8oTKA8/ROFHblabh0S
         +P7/iAmLJCOoQX23n1SIGn2gNLd9BruJCTDTWPV4SI2Zsex96lFopFyUEWse2HY0Lk6j
         Re9b3AsbRUCaay/aXW9lUlqbE/NjlJJA8Bu2CkLzzjZgMCWicHlYTBo66IchWuIqitvA
         eQ3EBymBaW1DA/2aN5B64KStubBnGyj1wwnzzFalulgDz+CDUqGhNC/0geVwPI//zS4B
         tu5A==
X-Gm-Message-State: APuU4Z8M8cgLBku8AN3iMbGjx4+5pxtRfyLv2SoCuddZgJp2+Bu165LV
	anlvaPz9Kdc2t/BaoR2lfQjwM0Hl+y+am0Nlhu0hQnv+B8q1p26fumCaLNHcOMRrXGwc/EhP+k2
	mJ9r60vw=
X-Gm-Gg: AYBFou2mnBhUfPvulCnVstIqVMQ7ZqTvVNfD3CXezyi55WNXwpBFPIwJf3I3d0lvCfm
	z9RdIztWBcvV487HTC9dqgMq+uxkQJDtbVhqcglwvIQkIQ+2ZQgz1/NhyTZ3SQ2AzhqJG9QbS6k
	PKMpXFQrL49WSLcFZ9xmEWdqirA096LF7dIoO+A7bQ4j1Y3MubzDjQu5fA1s/oIXluJzdcB33+l
	hCpSmZMOcwZ0eUzSy+6EtrPs6EgmjTYdaSXIbqufL2wmG4DL9Hz1FI+6enVNv9ivMyqKK7Kxw/V
	GBKE5jCGAAdijKFGqNkTvcisRIsXd53eTk2YOkAWxphRRlL0vDoSd6K/6FDPie+WFJsetf6uLzo
	FxHdmeeB6gUGgrpxpQQ+lr5V3XDi+/mlHm4QW15VyZ9WBiuzZY/Lm0nRofrtFlF5EvXvtUkAeKL
	OoXglj+JwKgNU8Z/CfljCuL9pkqIsMKQPh1ktUv7OSaR2rqZxnPL4O9ChsYNzBx3hO+tK2XTt+Y
	Z/vN8JuXGOjMqWXGLunw26LMzNWQuCkrv9Tc0W4R0gMd+aURKH30hT6L/2VN4/ItOwN9eB9QdEe
	JsbervWOhf/fbNjw97lY5h1zWW81NAO8e6qDo6tpEbz6dkIn6/o/DLntr5BsTfw8xKD+IK1/xzJ
	9pcZvvt/6T/RyTUqOzCwWKFOHrktKFw==
X-Received: by 2002:a05:600c:630d:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4ac150b38abmr398922805e9.3.1793868225642;
        Thu, 05 Nov 2026 00:43:45 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 15/60] libical: upgrade 4.0.6 -> 4.0.7
Date: Thu,  5 Nov 2026 09:42:34 +0100
Message-ID: <c0f850bd3d4e9b723e6f97f667b56500766c9d2c.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249474
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

- libicalvcard:
  - `vcardcomponent_clone()` and friends now deep-copy TEXTLIST values (e.g. NICKNAME, CATEGORIES)
    and structured parameters (JSCOMPS), and keep the property group.
  - Fixed a use-after-free and a memory leak when converting a vCalendar procedure alarm (PALARM)
    whose attachment is a plain path name.
- libical:
  - Fix busy status of recurring events in `icalcomponent_foreach_recurrence()`.
  - Fix `icalvalue_decode_ical_string()` and `icallangbind_property_eval_string()` reading past
    the end of a string that ends in a backslash or a newline.
  - `icaltimezone_truncate_vtimezone()` no longer reads the RRULE after freeing it when the new
     DTSTART is within a year of UNTIL (RSCALE rules), and no longer uses an uninitialized onset
     when no RRULE occurrence falls before the window close.
  - Fix IMAGE and STRUCTURED-DATA given by URI (with or without VALUE=URI) parsing to a URI value,
    whose string `icalproperty_get_image()` and `icalproperty_get_structureddata()` then read as
    an icalattach pointer.
  - Fix use-after-free and double free in `icalcomponent_merge_component()` when both calendars
    have a VTIMEZONE with the same TZID. Every VTIMEZONE of the merged calendar is now merged,
    and a conflicting VTIMEZONE is added under a renamed TZID (e.g. "Zone1") that its events use.
  - Fix out-of-bounds access to the year days bitmask in the recurrence iterator when an RSCALE
    date falls outside the year (e.g. BYWEEKNO with a DTSTART before the calendar's epoch).
  - Fix `icalrecur_iterator_set_range()` for a reverse range on a rule without UNTIL, which
    started the iteration at year 0 instead of at 'from'.
  - Fix `icalparser_clean()` for proper reuse by resetting internal structure values and clearing
    the root component to avoid a use-after-free.
  - Behavior change: The typed icalvalue getters now check that the value type of the icalvalue
    uses the same union member as the expected value type of the getter, as the vcardvalue getters
    have done since version 4.0.6. If the type mismatches, then they return the zero value for the
    expected value type. The typed setters error with ICAL_BADARG_ERROR instead of overwriting a
    value held in another union member.
- libicalss:
  - Fix heap-buffer-overflow in `icalspanlist_as_freebusy_matrix()` for busy spans that start
    before or end after the spanlist. `icalspanlist_from_vfreebusy()` now sets the spanlist
    start/end from DTSTART/DTEND and marks FBTYPE=FREE periods as free (all others as busy).
- Buildsystem changes:
  - Fix CMake command target_link_libraries() to use all-keywords as required since CMake v4.4.4.
  - When cross-compiling, don't build/install ical-glib-src-generator w/o existing binary

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 0646b1d8b6ad5a4c49afd72487e2f28b7fa7b6c3)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libical/{libical_4.0.6.bb => libical_4.0.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_4.0.6.bb => libical_4.0.7.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_4.0.6.bb b/meta/recipes-support/libical/libical_4.0.7.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_4.0.6.bb
rename to meta/recipes-support/libical/libical_4.0.7.bb
index 7b9185c3742..cbfcb0675e6 100644
--- a/meta/recipes-support/libical/libical_4.0.6.bb
+++ b/meta/recipes-support/libical/libical_4.0.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6d9294493d031c817783b0400a126c89 \
 SECTION = "libs"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "2e3729cb69c282d3bb17a8d2b198af6e4bc7502fd3621c9adf573921fe9dceb0"
+SRC_URI[sha256sum] = "47c05bc96e41416578cf1803bb2ba3f8d292cb17d5ac2fca539dee922bae8a94"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
