Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id DEB67786C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:35 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id p9-v6so12042722pls.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zm/h2/bqln/Sq/DfrnHxdxwBFEp7Cl9jLCx7LnKBEb0=;
	b=fzB2hoEy4RVajo2TMLH5hwU9hACZrMQgP6grb92Yl+t1H0qW3csWUDso/TOjNgibI0
	uLSYQ9hmQ4Dv6FJzSioA7B9C0KxipmOQliUZekBKN30OtBbDdQCRFmCjW/+dn6YHUNRu
	HcOvbSRt9Uqv7QzDdcP2r3j95RmurSSYg6qflOeNALrrotuCCPTHJFj8yivrYfx5Q7iB
	A/7NchLM2kRVSUAgb/rL3XDdU8sAScYILWtSs6QKAyoUfzqndpMqVGIK/XlJqreBQpXT
	iCxs2+ORz4IPtA9rGoSZ+JMH6MyFv97fRJMxhKSaEaqiL+u78+sjiS9nQGMmbuvyHIQ0
	1xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zm/h2/bqln/Sq/DfrnHxdxwBFEp7Cl9jLCx7LnKBEb0=;
	b=JxKXIUUJsB7x2XMlGNeu4CgYHStbuW+TjUB/NoSa5GqIB77O7kQpGqByrQYSqkVCfV
	e4zVvB/nO9891yp6OpUYwDeE1QBeE8ZUyiENsvQ5M8nqLrWztvxXibtWZADd8sEsdPVl
	OC8rMPkyECt8IQ1qPJxHS5ZTWWgZAoV8ONGrmxHXfBuihavTsAwM9VMsPrs0cQ3WiJVj
	qI3DKMUMFxXVq1cly2FqeDqgYM4uCgi0ZgPy57L5OK1yFTvI1s6GL9ZwNqRxlqVK1eDK
	wuu150/agbQ9eZ9AT4kf/sFIiWCLuyi7K8Mf1TyKCkWwWnRxU0aL3iU68AGv0ExhFL9z
	gSoQ==
X-Gm-Message-State: AElRT7E6UsmIKmnJjdrWzJCPLG4r7Yc/mia3YF2TDkUayQOext0ucaCI
	OEaiQV9mDsAnvVRJDBUa0lk+bQ==
X-Google-Smtp-Source: AG47ELvG7SpRsA+h8swTuWS0p5IWRi/ys5aiUu3NXI1CryDcsOv40kJnKA4Xxh6n/QLxiKGPMiZUfg==
X-Received: by 2002:a17:902:d892:: with SMTP id
	b18-v6mr41573446plz.241.1522074697039; 
	Mon, 26 Mar 2018 07:31:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:24 -0700
Message-Id: <9e5bbdc7bfcfbd72a2ad70c7c65ef6d9755a4c58.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 21/21] tzdata: update to 2018d
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:36 -0000

From: Armin Kuster <akuster@mvista.com>

  Briefly:

  Palestine starts DST a week earlier in 2018.
  Add support for vanguard and rearguard data consumers.
  Add subsecond precision to source data format, though not to data.

  Changes to future time stamps

    In 2018, Palestine starts DST on March 24, not March 31.
    Adjust future predictions accordingly.  (Thanks to Sharef Mustafa.)

  Changes to past and future time stamps

    Casey Station in Antarctica changed from +11 to +08 on 2018-03-11
    at 04:00.  (Thanks to Steffen Thorsen.)

  Changes to past time stamps

    Historical transitions for Uruguay, represented by
    America/Montevideo, have been updated per official legal documents,
    replacing previous data mainly originating from the inventions of
    Shanks & Pottenger.  This has resulted in adjustments ranging from
    30 to 90 minutes in either direction over at least two dozen
    distinct periods ranging from one day to several years in length.
    A mere handful of pre-1991 transitions are unaffected; data since
    then has come from more reliable contemporaneous reporting. These
    changes affect various timestamps in 1920-1923, 1936, 1939,
    1942-1943, 1959, 1966-1970, 1972, 1974-1980, and 1988-1990.
    Additionally, Uruguay's pre-standard-time UT offset has been
    adjusted westward by 7 seconds, from UT-03:44:44 to UT-03:44:51, to
    match the location of the Observatory of the National Meteorological
    Institute in Montevideo.
    (Thanks to Jeremie Bonjour, Tim Parenti, and Michael Deckers.)

    Enderbury and Kiritimati skipped New Year's Eve 1994, not
    New Year's Day 1995.  (Thanks to Kerry Shetline.)

    Fix the 1912-01-01 transition for Portugual and its colonies.
    This transition was at 00:00 according to the new UT offset, not
    according to the old one.  Also assume that Cape Verde switched on
    the same date as the rest, not in 1907.  This affects
    Africa/Bissau, Africa/Sao_Tome, Asia/Macau, Atlantic/Azores,
    Atlantic/Cape_Verde, Atlantic/Madeira, and Europe/Lisbon.
    (Thanks to Michael Deckers.)

    Fix an off-by-1 error for pre-1913 timestamps in Jamaica and in
    Turks & Caicos.

  Changes to past time zone abbreviations

    MMT took effect in Uruguay from 1908-06-10, not 1898-06-28. There
    is no clock change associated with the transition.

  Changes to build procedure

    The new DATAFORM macro in the Makefile lets the installer choose
    among three source data formats.  The idea is to lessen downstream
    disruption when data formats are improved.

    * DATAFORM=vanguard installs from the latest, bleeding-edge
      format.  DATAFORM=main (the default) installs from the format
      used in the 'africa' etc. files.  DATAFORM=rearguard installs
      from a trailing-edge format.  Eventually, elements of today's
      vanguard format should move to the main format, and similarly
      the main format's features should eventually move to the
      rearguard format.

    * In the current version, the main and rearguard formats are
      identical and match that of 2018c, so this change does not
      affect default behavior.  The vanguard format currently contains
      one feature not in the main format: negative SAVE values. This
      improves support for Ireland, which uses Irish Standard Time
      (IST, UTC+01) in summer and GMT (UTC) in winter.  tzcode has
      supported negative SAVE values for decades, and this feature
      should move to the main format soon.  However, it will not move
      to the rearguard format for quite some time because some
      downstream parsers do not support it.

    * The build procedure constructs three files vanguard.zi, main.zi,
      and rearguard.zi, one for each format.  The files represent the
      same data as closely as the formats allow.  These three files
      are intended for downstream data consumers and are not
      installed.  Zoneinfo parsers that do not support negative SAVE values
      should start using rearguard.zi, so that they will be unaffected
      when the negative-DST feature moves from vanguard to main.
      Bleeding-edge Zoneinfo parsers that support the new features
      already can use vanguard.zi; in this respect, current tzcode is
      bleeding-edge.

    The Makefile should now be safe for parallelized builds, and 'make
    -j to2050new.tzs' is now much faster on a multiprocessor host
    with GNU Make.

    When built with -DSUPPRESS_TZDIR, the tzcode library no longer
    prepends TZDIR/ to file names that do not begin with '/'. This is
    not recommended for general use, due to its security implications.
    (From a suggestion by Manuela Friedrich.)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzdata/{tzdata_2018c.bb => tzdata_2018d.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2018c.bb => tzdata_2018d.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2018c.bb b/meta/recipes-extended/tzdata/tzdata_2018d.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2018c.bb
rename to meta/recipes-extended/tzdata/tzdata_2018d.bb
index ff5ec1c..ec24f44 100644
--- a/meta/recipes-extended/tzdata/tzdata_2018c.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2018d.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "c412b1531adef1be7a645ab734f86acc"
-SRC_URI[tzdata.sha256sum] = "2825c3e4b7ef520f24d393bcc02942f9762ffd3e7fc9b23850789ed8f22933f6"
+SRC_URI[tzdata.md5sum] = "871a7ef808eb42ebc551acdb3d661554"
+SRC_URI[tzdata.sha256sum] = "5106eddceb5f1ae3a91dbd3960e1b8b11ba0dc08579a31cf0724a7691b10c054"
 
 inherit allarch
 
-- 
2.7.4


