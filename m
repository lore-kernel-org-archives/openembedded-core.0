Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id E578D7D119
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 16:13:12 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k3so4779299pga.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 09:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=AhjE9bvcy59f7OlopJX7vvzDUOYuxdJjeENCPX8rgmc=;
	b=HfkAK6IqMXtT3lM4O7Vxqi8Ikmbz+3Tk1zXa7wxaSz/lR6fYFeKbkc8ZqrQ97TFyGq
	cTfC0d0w6TLVjpPpOddoLbgD37c0lERWCTHKmitNTs7ZUh5pU47VMkv+1C47Y0ilXKWf
	v+O4PHX/RHcGVqKpriLBwUuVEWVLGE4ml3ezp1uVY+hLctDoivCZf0K4ufwQulYfV2Pb
	GIlTjwbe2Z6WMPuwtVN9nHa2QhzvMCfgjLrJb5FP1axa3J4v22cuQOqgnF5W9SPc2rK3
	mlqWdQbuPu7ziRXSROd+8nySCvGQeAZH+vcIvk6BKUNUp8CCv9jKTm+QsJdTX9UuB7Pe
	g9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AhjE9bvcy59f7OlopJX7vvzDUOYuxdJjeENCPX8rgmc=;
	b=Br4SWjzyTy0eEBJg6FEPinQKecT+c3CAu9tzDNA75/TkmoIksq5SmJy5FHUNMfOvbI
	H8vSUmOBGAlu2XsYfaQ/9efJvt8Wb9VYN4ADQsTWwsHGr8QvlE+K6oGaw0FOUMZkeCY+
	Vm8Z7k0JMXjTRQioN/5zgateV92LAYIk0tGSSaaDMHWUcbemWQhu5O5lY4omMZyyb8/p
	6NamWtG08fig89ihEFhzyZ23cg3eRSRN2Ywu+fqCbo/rLbUjZHpFW9C7pyxDubGrG/db
	5ssmBczjx76u4HsqGR/I/gxvWWWCCYYQ7ORsio20Pmp+r/e6qgtWaXY/ZZRyrbhMCWrK
	LgIQ==
X-Gm-Message-State: APjAAAWWOFt3LT0MWg0RtpkuIKqzf6MffEWzQJpg3+AMt7f6DaLLnxuY
	AA4DczQ7SXug+0jfDcHTiuiBKvlm
X-Google-Smtp-Source: APXvYqw5OGtHLhHBU6jFSdEHn13lqYYwI6QWEGT61qaPaRDQh7EL7o4A/bSybonqQF6NNo3MxGIKgA==
X-Received: by 2002:a62:75d7:: with SMTP id q206mr7071010pfc.213.1553616793845;
	Tue, 26 Mar 2019 09:13:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:acc8:b522:e35e:e13c])
	by smtp.gmail.com with ESMTPSA id
	h11sm21187506pgq.57.2019.03.26.09.13.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Mar 2019 09:13:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2019 09:13:11 -0700
Message-Id: <1553616791-19212-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] timezone: update to 2009a
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
X-List-Received-Date: Tue, 26 Mar 2019 16:13:13 -0000

The 2019a release of the tz code and data is available. It reflects the following changes, which were either circulated on the tz mailing list or are relatively minor technical or administrative changes:

  Briefly:
    Palestine "springs forward" on 2019-03-30 instead of 2019-03-23.
    Metlakatla "fell back" to rejoin Alaska Time on 2019-01-20 at 02:00.

  Changes to past and future timestamps

    Palestine will not start DST until 2019-03-30, instead of 2019-03-23 as
    previously predicted.  Adjust our prediction by guessing that spring
    transitions will be between 24 and 30 March, which matches recent practice
    since 2016.  (Thanks to Even Scharning and Tim Parenti.)

    Metlakatla ended its observance of Pacific standard time,
    rejoining Alaska Time, on 2019-01-20 at 02:00.  (Thanks to Ryan
    Stanley and Tim Parenti.)

  Changes to past timestamps

    Israel observed DST in 1980 (08-02/09-13) and 1984 (05-05/08-25).
    (Thanks to Alois Treindl and Isaac Starkman.)

  Changes to time zone abbreviations

    Etc/UCT is now a backward-compatibility link to Etc/UTC, instead
    of being a separate zone that generates the abbreviation "UCT",
    which nowadays is typically a typo.  (Problem reported by Isiah
    Meadows.)

  Changes to code

    zic now has an -r option to limit the time range of output data.
    For example, 'zic -r @1000000000' limits the output data to
    timestamps starting 1000000000 seconds after the Epoch.
    This helps shrink output size and can be useful for applications
    not needing the full timestamp history, such as TZDIST truncation;
    see Internet RFC 8536 section 5.1.  (Inspired by a feature request
    from Christopher Wong, helped along by bug reports from Wong and
    from Tim Parenti.)

  Changes to documentation

    Mention Internet RFC 8536 (February 2019), which documents TZif.

    tz-link.html now cites tzdata-meta
    <https://tzdata-meta.timtimeonline.com/>.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 696f02d..1ade007 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2018i"
+PV = "2019a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -12,8 +12,7 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "6a6d98be8fa2fa3485e25343e79188b4"
-SRC_URI[tzcode.sha256sum] = "aaacdb876ca6fb9d58e244b462cbc7578a496b1b10994381b4b32b9f2ded32dc"
-SRC_URI[tzdata.md5sum] = "b3f0a1a789480a036e58466cd0702477"
-SRC_URI[tzdata.sha256sum] = "82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c6550740587c6ac5a7108c00d9"
-
+SRC_URI[tzcode.md5sum] = "27585a20bc5401324f42c8deb6e4677f"
+SRC_URI[tzcode.sha256sum] = "8739f162bc30cdfb482435697f969253abea49595541a0afd5f443fbae433ff5"
+SRC_URI[tzdata.md5sum] = "288f7b1e43018c633da108f13b27cf91"
+SRC_URI[tzdata.sha256sum] = "90366ddf4aa03e37a16cd49255af77f801822310b213f195e2206ead48c59772"
-- 
2.7.4


