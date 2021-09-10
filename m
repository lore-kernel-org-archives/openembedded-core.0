Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web09.3918.1631240534757537773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 19:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.40.192.95])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 18A2MDkq022976
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Sep 2021 21:22:13 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v3 0/2] Fixes for reproducible build and externalsrc
Date: Thu,  9 Sep 2021 21:22:11 -0500
Message-Id: <20210910022213.28378-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

v3:
SAME AS V2, except I corrected a minor typographical error in a comment in
2/2.

v2:
I've reworked the patches completely based on the feedback and a discusion
with RP on IRC.

The first patch both simplifies and expands the description of what the
class is doing.  (To fully disable the behavior for a single recipe that
recipe would need to delVar SOURCE_DATE_EPOCH.  With this set, all sorts
of programs pay attention to the value, if it's blank it may error,
otherwise it falls back to either 0, or another date.)

The documentation is expanded to make it clear how to override the behavior
but it was not desired to explain how to 'disable' the behavior for a
single recipe.

For the externalsrc, the code was moved from the reproducible_build into
the externalsrc and made contingent on the do_unpack being removed.

Mark Hatle (2):
  reproducible_build: Remove BUILD_REPRODUCIBLE_BINARIES checking
  externalsrc: Work with reproducible_build

 meta/classes/externalsrc.bbclass        | 10 +++++
 meta/classes/reproducible_build.bbclass | 53 ++++++++++++++++---------
 2 files changed, 44 insertions(+), 19 deletions(-)

-- 
2.17.1

