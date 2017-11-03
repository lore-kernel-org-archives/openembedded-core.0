Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id D62DE77BD2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:54:53 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p87so2942310pfj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dfKF+ufFSbsshtpKTLYCDbfdYN2geOierZkCXnVSLxY=;
	b=VFKtGtd2OYKdyx17M6RxHMU2vyaBFtZH160nZbKvrcUdkHQqfg8CMPlI10sZaMZzk+
	BLsb2rP4VsVP2U9uqkT8S5hipxNOR7MtMEucgDUy7t/q63XN0C/JkVxhhrIr/BsJGGQb
	EaKS8fJ/86UMxD6ppUjuU57thl6hU2JXBzBUEYwD6KY9qMveAzxwhKeKU33f5fxEgroa
	3QtDRp8aMVTH+USDyItelSrFP4YJ4fDLka6dR08NdBOUkNoPcrx2dkFWOh9meid/YApG
	FPzzyrYCEQsdGk1iJIM7Pf1FE5mGfL92o7nW4MibBpwlHFZjdG0laJSHmlKpTMawVlm3
	YBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dfKF+ufFSbsshtpKTLYCDbfdYN2geOierZkCXnVSLxY=;
	b=GgJcTsormeRaw3T8mPEfsDLwNiK+ML1fHtJ9gcxtC27vAsNwYJKpK3BfaQDvg+6bY1
	SEqb7f5mh//VrbqcjYrcZZP9EcPRIGnaf3503uBLXpNgTqUfeaAQwfTvNuRYH/bNs5L1
	QWGbc2dAUGJMVKZw9xUOvfNjs1wz8/46gpMANEvkjmSSCqMHD6RlPnYegYI9tkH+icsf
	Z9ejL9HOf5gWJPF/VCfFdENU+kN8rtaOr1cE3+0tFtGCmlYMJz54wYF13/8qtMkr57Kh
	uesJsp12lKMAR2CA8sLJfPSvrL0ENvUirNHt3cHF6uR++Pln7MiYKguWbC7VoqRWil3Q
	+0OA==
X-Gm-Message-State: AMCzsaX8a7edOKQROvM5fz4Weuwa8WopKk7+rPyqLTJLOniu1LwHCMXG
	Rt7iUiJSsFAQ8fGFRxvdvbAqPw==
X-Google-Smtp-Source: ABhQp+SKrDggkN0TKljHChGtSAqxb8PWaB14ayBaDoksmnOwMDLjDpCF3nRa98zIjejhGB7sDyP7kQ==
X-Received: by 10.159.231.15 with SMTP id w15mr7916534plq.436.1509738894907;
	Fri, 03 Nov 2017 12:54:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.54.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:54:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:36 -0700
Message-Id: <f1725301f36876c0cb5c5bdd15005a03a0038452.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 02/15] tzdata: update 2017c
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
X-List-Received-Date: Fri, 03 Nov 2017 19:54:53 -0000

LICENSE changed do to rewording
https://github.com/eggert/tz/commit/7097a652778d35acf747d14f8bf7b3ced479bbc0#diff-9879d6db96fd29134fc802214163b95a

  Briefly:
  Northern Cyprus switches from +03 to +02/+03 on 2017-10-29.
  Fiji ends DST 2018-01-14, not 2018-01-21.
  Namibia switches from +01/+02 to +02 on 2018-04-01.
  Sudan switches from +03 to +02 on 2017-11-01.
  Tonga likely switches from +13/+14 to +13 on 2017-11-05.
  Turks & Caicos switches from -04 to -05/-04 on 2018-11-04.
  A new file tzdata.zi now holds a small text copy of all data.
  The zic input format has been regularized slightly.

  Changes to future time stamps

    Northern Cyprus has decided to resume EU rules starting
    2017-10-29, thus reinstituting winter time.

    Fiji ends DST 2018-01-14 instead of the 2018-01-21 previously
    predicted.  (Thanks to Dominic Fok.)  Adjust future predictions
    accordingly.

    Namibia will switch from +01 with DST to +02 all year on
    2017-09-03 at 02:00.  This affects UT offsets starting 2018-04-01
    at 02:00.  (Thanks to Steffen Thorsen.)

    Sudan will switch from +03 to +02 on 2017-11-01.  (Thanks to Ahmed
    Atyya and Yahia Abdalla.)  South Sudan is not switching, so
    Africa/Juba is no longer a link to Africa/Khartoum.

    Tonga has likely ended its experiment with DST, and will not
    adjust its clocks on 2017-11-05.  Although Tonga has not announced
    whether it will continue to observe DST, the IATA is assuming that
    it will not.  (Thanks to David Wade.)

    Turks & Caicos will switch from -04 all year to -05 with US DST on
    2018-03-11 at 03:00.  This affects UT offsets starting 2018-11-04
    at 02:00.  (Thanks to Steffen Thorsen.)

  Changes to past time stamps

    Namibia switched from +02 to +01 on 1994-03-21, not 1994-04-03.
    (Thanks to Arthur David Olson.)

    Detroit did not observe DST in 1967.

    Use railway time for Asia/Kolkata before 1941, by switching to
    Madras local time (UT +052110) in 1870, then to IST (UT +0530) in
    1906.  Also, treat 1941-2's +0630 as DST, like 1942-5.

    Europe/Dublin's 1946 and 1947 fallback transitions occurred at
    02:00 standard time, not 02:00 DST.  (Thanks to Michael Deckers.)

    Pacific/Apia and Pacific/Pago_Pago switched from Antipodean to
    American time in 1892, not 1879.  (Thanks to Michael Deckers.)

    Adjust the 1867 transition in Alaska to better reflect the
    historical record, by changing it to occur on 1867-10-18 at 15:30
    Sitka time rather than at the start of 1867-10-17 local time.
    Although strictly speaking this is accurate only for Sitka,
    the rest of Alaska's blanks need to be filled in somehow.

    Fix off-by-one errors in UT offsets for Adak and Nome before 1867.
    (Thanks to Michael Deckers.)

    Add 7 s to the UT offset in Asia/Yangon before 1920.

  Changes to zone names

    Remove Canada/East-Saskatchewan from the 'backward' file, as it
    exceeded the 14-character limit and was an unused misnomer anyway.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/{tzdata_2017b.bb => tzdata_2017c.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2017b.bb => tzdata_2017c.bb} (97%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2017b.bb b/meta/recipes-extended/tzdata/tzdata_2017c.bb
similarity index 97%
rename from meta/recipes-extended/tzdata/tzdata_2017b.bb
rename to meta/recipes-extended/tzdata/tzdata_2017c.bb
index 55e8976..9e5b929 100644
--- a/meta/recipes-extended/tzdata/tzdata_2017b.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2017c.bb
@@ -2,15 +2,15 @@ SUMMARY = "Timezone data"
 HOMEPAGE = "http://www.iana.org/time-zones"
 SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ef1a352b901ee7b75a75df8171d6aca7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 DEPENDS = "tzcode-native"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "50dc0dc50c68644c1f70804f2e7a1625"
-SRC_URI[tzdata.sha256sum] = "f8242a522ea3496b0ce4ff4f2e75a049178da21001a08b8e666d8cbe07d18086"
+SRC_URI[tzdata.md5sum] = "1e751e7e08f8b68530674f04619d894d"
+SRC_URI[tzdata.sha256sum] = "d6543f92a929826318e2f44ff3a7611ce5f565a43e10250b42599d0ba4cbd90b"
 
 inherit allarch
 
-- 
2.7.4


