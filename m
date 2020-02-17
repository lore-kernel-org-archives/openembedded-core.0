Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3F72B614FE
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:01:05 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id t6so6884727plj.5
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7a30cRVlQ3S+xUJZMVAhOwSBp4vOBseGaLPPDoumVvk=;
	b=WqiZ4dhRUPasbcHmtvXFMN8Bu6OjRcsXxivurnsEGtgfDESdGwnYTtcxMYXHmoZwGC
	dk+dVCbaCX2h9julkj3giv8o3T7KVVwAuhxtGG0Ka4ujYjqVPASo72vxGrxviNzVs6yn
	1gmNcGTZeWrGwOCjs8ZWkMgWm5RfC4+ul273Pa+w9gQCkva7TXsHFFUCHqv41jdrXzMl
	j4lRoLUoPMjZqv3FtCJayQ2V2aR8+21BjZvuX0YGM+vtp/wAEmk3b46qCs82qkq7eDKK
	r8FFr7FA4coAeQJhK3nCb1greO8DYpLJwn+29KbO4894HfYJDbIMbCY9sGyNKPU/DkBE
	UlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7a30cRVlQ3S+xUJZMVAhOwSBp4vOBseGaLPPDoumVvk=;
	b=Wh4+DLZz5/tvU8oxIsN6al7niqfWUobtg43Y1w8hk7m300UMZp5rL4FCsumbWlzZg7
	r3g8Y8DtWnjIVr2zUwmfSdEVmV0ge7gWguCbRRhFCZw3Qa/O0UbUbalYUGgAVYikLKUs
	XKZnUWb/WPmXwEZaHEnkE2ftaRxu5TRhTqnmZScjdxA8OzoKRcHGgYLcWo3SIt29Frmh
	WVu7ZzdyZyUVPO3Ccqq4qv+oZ8GWsCnhXkRTRGotpaF2J8Q1bTlxxcABM1QS29dDM1c1
	jwPMrKb/Zce7gI4anvCvk9lChC/W6PtMt7yMPGrzPJ/L8I5mmhNVX7WxKW/WbKEWPdN0
	ovQw==
X-Gm-Message-State: APjAAAWPu1tf/RGwPS5sydoktXMjiRYgoVhXzEspvyTkLNTy6EoqKFQN
	ITR/Tp3/TnTj9+/erB5/yQRJ9qhN
X-Google-Smtp-Source: APXvYqyo5bM56xVltLx3Gzcbloy6j9zNS5noHA6rF2Wa9W87FpbZ/Fgz+j5Tqb9DZucRu0SuunfzKQ==
X-Received: by 2002:a17:902:b215:: with SMTP id
	t21mr16611289plr.190.1581955266283; 
	Mon, 17 Feb 2020 08:01:06 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.01.05
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:01:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:47 -0800
Message-Id: <1d1dcea1d2de02cb49950235586adbe4593f0eb7.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581955142.git.akuster808@gmail.com>
References: <cover.1581955142.git.akuster808@gmail.com>
Subject: [warrior 09/14] timezone: update to 2019b
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
X-List-Received-Date: Mon, 17 Feb 2020 16:01:06 -0000

Briefly:
  Brazil no longer observes DST.
  'zic -b slim' outputs smaller TZif files; please try it out.
  Palestine's 2019 spring-forward transition was on 03-29, not 03-30.

Changes to future timestamps

  Brazil has canceled DST and will stay on standard time indefinitely.
  (Thanks to Steffen Thorsen, Marcus Diniz, and Daniel Soares de
  Oliveira.)

  Predictions for Morocco now go through 2087 instead of 2037, to
  work around a problem on newlib when using TZif files output by
  zic 2019a or earlier.  (Problem reported by David Gauchard.)

Changes to past and future timestamps

  Palestine's 2019 spring transition was 03-29 at 00:00, not 03-30
  at 01:00.  (Thanks to Sharef Mustafa and Even Scharning.)  Guess
  future transitions to be March's last Friday at 00:00.

Changes to past timestamps

  Hong Kong's 1941-06-15 spring-forward transition was at 03:00, not
  03:30.  Its 1945 transition from JST to HKT was on 11-18 at 02:00,
  not 09-15 at 00:00.  In 1946 its spring-forward transition was on
  04-21 at 00:00, not the previous day at 03:30.  From 1946 through
  1952 its fall-back transitions occurred at 04:30, not at 03:30.
  In 1947 its fall-back transition was on 11-30, not 12-30.
  (Thanks to P Chan.)

Changes to past time zone abbreviations

  Italy's 1866 transition to Rome Mean Time was on December 12, not
  September 22.  This affects only the time zone abbreviation for
  Europe/Rome between those dates.  (Thanks to Stephen Trainor and
  Luigi Rosa.)

Changes affecting metadata only

  Add info about the Crimea situation in zone1970.tab and zone.tab.
  (Problem reported by Serhii Demediuk.)

Changes to code

  zic's new -b option supports a way to control data bloat and to
  test for year-2038 bugs in software that reads TZif files.
  'zic -b fat' and 'zic -b slim' generate larger and smaller output;
  for example, changing from fat to slim shrinks the Europe/London
  file from 3648 to 1599 bytes, saving about 56%.  Fat and slim
  files represent the same set of timestamps and use the same TZif
  format as documented in tzfile(5) and in Internet RFC 8536.
  Fat format attempts to work around bugs or incompatibilities in
  older software, notably software that mishandles 64-bit TZif data
  or uses obsolete TZ strings like "EET-2EEST" that lack DST rules.
  Slim format is more efficient and does not work around 64-bit bugs
  or obsolete TZ strings.  Currently zic defaults to fat format
  unless you compile with -DZIC_BLOAT_DEFAULT=\"slim\"; this
  out-of-the-box default is intended to change in future releases
  as the buggy software often mishandles timestamps anyway.

  zic no longer treats a set of rules ending in 2037 specially.
  Previously, zic assumed that such a ruleset meant that future
  timestamps could not be predicted, and therefore omitted a
  POSIX-like TZ string in the TZif output.  The old behavior is no
  longer needed for current tzdata, and caused problems with newlib
  when used with older tzdata (reported by David Gauchard).

  zic no longer generates some artifact transitions.  For example,
  Europe/London no longer has a no-op transition in January 1996.

Changes to build procedure

  tzdata.zi now assumes zic 2017c or later.  This shrinks tzdata.zi
  by a percent or so.

Changes to documentation and commentary

  The Makefile now documents the POSIXRULES macro as being obsolete,
  and similarly, zic's -p POSIXRULES option is now documented as
  being obsolete.  Although the POSIXRULES feature still exists and
  works as before, in practice it is rarely used for its intended
  purpose, and it does not work either in the default reference
  implementation (for timestamps after 2037) or in common
  implementations such as GNU/Linux (for contemporary timestamps).
  Since POSIXRULES was designed primarily as a temporary transition
  facility for System V platforms that died off decades ago, it is
  being decommissioned rather than institutionalized.

  New info on Bonin Islands and Marcus (thanks to Wakaba and Phake
  Nick).

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bbbb985808e5c301cdb7fdb1ff677706e99b4785)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 1ade0075e6..ce16524ebb 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2019a"
+PV = "2019b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -12,7 +12,7 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "27585a20bc5401324f42c8deb6e4677f"
-SRC_URI[tzcode.sha256sum] = "8739f162bc30cdfb482435697f969253abea49595541a0afd5f443fbae433ff5"
-SRC_URI[tzdata.md5sum] = "288f7b1e43018c633da108f13b27cf91"
-SRC_URI[tzdata.sha256sum] = "90366ddf4aa03e37a16cd49255af77f801822310b213f195e2206ead48c59772"
+SRC_URI[tzcode.md5sum] = "91e0978d947496fd6aaf46d351f9c41d"
+SRC_URI[tzcode.sha256sum] = "2e479d409337da41408629ce6c3b4d8410b10ba6d4431d862e22d2b137d7756d"
+SRC_URI[tzdata.md5sum] = "b26b5d7d844cb96c73ed2fb6d588daaf"
+SRC_URI[tzdata.sha256sum] = "05d9092c90dcf9ec4f3ccfdea80c7dcea5e882b3b105c3422da172aaa9a50c64"
-- 
2.17.1


