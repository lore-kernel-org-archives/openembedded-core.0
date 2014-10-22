Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id CEFEA65D50
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 20:29:21 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id p10so2182570pdj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 13:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=KKZvd0kM3uNCB0v9kvFgG+ZpzMCTSu/wycnBpDPn2GE=;
	b=sLuNHTNG8wDbxCuzZU3si1C8jIZ7WF+ve9aBTjp5ckLIeqgKD6c0FZUewAm7LaApRe
	gHG2MCdO4M+5Gsgp8XRkW6WrqZS9EhE7SwiOJrmX7llDQiNg+LFv8s4xQ2zVJcqyLwze
	NsGPDgFGDNbpV6XbgtlnmyLB8LfSnYq0U8ZzMHKP5jfLM0++fSQ8gfx4eeh221zzW0Xj
	qlT0e6nNL6ADBt+z/j8Xsc7k4sJl8+aq45raxNtSgaiKRWzIwgqhZ4tm6VSP7yGVulD9
	dvoTY3UIgDmYPZ9tQn6rrw11y8X5RtcZRAhSiaDhWV1eu4VV+wVU7EGf1vrfzdvK0Bm0
	oOzQ==
X-Received: by 10.70.35.111 with SMTP id g15mr176152pdj.155.1414009762357;
	Wed, 22 Oct 2014 13:29:22 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id k9sm15031331pdj.41.2014.10.22.13.29.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Oct 2014 13:29:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Oct 2014 13:29:14 -0700
Message-Id: <1414009754-26738-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1414009754-26738-1-git-send-email-akuster808@gmail.com>
References: <1414009754-26738-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] tzdata: update to 2014i
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
X-List-Received-Date: Wed, 22 Oct 2014 20:29:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes affecting future time stamps

Pacific/Fiji will observe DST from 2014-11-02 02:00 to
2015-01-18 03:00.  (Thanks to Ken Rylander for the heads-up.)
Guess that future years will use a similar pattern.

A new Zone Pacific/Bougainville, for the part of Papua New
Guinea that plans to switch from UTC+10 to UTC+11 on
2014-12-28 at 02:00.  (Thanks to Kiley Walbom for the
heads-up.)

Changes affecting time zone abbreviations

Since Belarus is not changing its clocks even though Moscow
is, the time zone abbreviation in Europe/Minsk is changing
from FET to its more-traditional value MSK on 2014-10-26 at
01:00.  (Thanks to Alexander Bokovoy for the heads-up about
Belarus.)

The new abbreviation IDT stands for the pre-1976 use of UT+8
in Indochina, to distinguish it better from ICT (UT+7).

Changes affecting past time stamps

Many time stamps have been corrected for Asia/Ho_Chi_Minh
before 1976 (thanks to Trần Ngọc Quân for an indirect pointer
to Trần Tiến Bình's authoritative book).  Asia/Ho_Chi_Minh has
been added to zone1970.tab, to give tzselect users in Vietnam
two choices, since north and south Vietnam disagreed after our
1970 cutoff.

Asia/Phnom_Penh and Asia/Vientiane have been turned into
links, as they differed from existing zones only for older
time stamps.  As usual, these changes affect pre-1970 time
stamps only.  Their old contents have been moved to the
'backzone' file. `

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2014h.bb | 6 ------
 meta/recipes-extended/tzdata/tzdata_2014i.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014h.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014i.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2014h.bb b/meta/recipes-extended/tzdata/tzdata_2014h.bb
deleted file mode 100644
index 9334a62..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2014h.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "ed05111948beba8a0f30956baa46b272"
-SRC_URI[tzdata.sha256sum] = "e78152f616fb07c1dea124215ffca57d0de66d8897e00896086542e3de30f69e"
-
-require tzdata.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2014i.bb b/meta/recipes-extended/tzdata/tzdata_2014i.bb
new file mode 100644
index 0000000..cab9b84
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2014i.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "00adeb62a0897aac5ba67da838351adb"
+SRC_URI[tzdata.sha256sum] = "2af331bdd2b794ec59b8ded7300fb29dc3573a009ec14183f5c9ad38e3886153"
+
+require tzdata.inc
-- 
1.9.1


