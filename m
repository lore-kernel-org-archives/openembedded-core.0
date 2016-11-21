Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id D8C186FEFA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 20:47:13 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id y205so16613978qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=vjP99+HucBK7gk1OiSymXjA+0nXcfsqs3tLVJEPMaKM=;
	b=QdY7zj1+MgdzOV0yA6a4noJNSjw8ewOsnSIoNeZRyMonMpzZ878PKS7EfdJjMUKTvV
	6Q2GHAzQBAc03AOZnSgPbxowm6yLkZ9xNvfNyRblxuRPyJYoN4CtrGZjjUX1yeothHog
	NVyHrFogtIca537pKatP8zbXFJJx00/q1uUsLYKumdrlB9vOtLdlpoaUhmdeTwAHRLXE
	JAAR1pXZTSwi281vaLH+A1xLO+p7c9JNd/sX+Dpw8PDgg5Ea5X3/qVPwAUR5jl0SO2+h
	TiuVTqU1xp3idJynbkBEkmuFi876301cHMWvBWEgM02eJ02IyOfWLwfe2rNLVAYrQXA3
	zQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=vjP99+HucBK7gk1OiSymXjA+0nXcfsqs3tLVJEPMaKM=;
	b=ZckE55u+GI73mnWML6/ZmtgTVFWDMB5PG0+7wD6qWRjDBzG3Gh0SN6BcNumgQONJI8
	LNqxXPq3p3feXIhXKoI6PUi7MfF2LwSSdexRnP7/5SyYb9FX99M8ON/H33rXZ3LQgWZo
	55q/Pv5me24gQHCAEx5RENKqU6T1XPgirdqEh5MqFsHfWjqTIpHjSQcdpEx19F6j4Ait
	3bi/P1Gy+ipLviMOfFO+gQa++CmZmqjapJFwiutmk3RDvBfnFDCcsLcBoQJGJSBMqkDR
	qw1xy3JMBlumVE0jWk1TuDHkZRkcSmdeA11VgP5GAsnzwSzkje6G3EX7GrgIREH/QU0O
	gKXg==
X-Gm-Message-State: AKaTC01G3pvYr4iNq8IX9hzH2B44aOhrkri4M0wzU/WJZtukKpm2szwBu/Vs1w/MU65Ogg==
X-Received: by 10.55.153.4 with SMTP id b4mr20304906qke.163.1479761234927;
	Mon, 21 Nov 2016 12:47:14 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	z29sm12117299qtz.16.2016.11.21.12.47.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Nov 2016 12:47:13 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 18:46:56 -0200
Message-Id: <1479761216-14138-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] libgpg-error: Update to version 1.25
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
X-List-Received-Date: Mon, 21 Nov 2016 20:47:16 -0000

License checksum changes are not related to license changes.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../libgpg-error/{libgpg-error_1.24.bb => libgpg-error_1.25.bb}    | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.24.bb => libgpg-error_1.25.bb} (86%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.24.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
similarity index 86%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.24.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
index 84a882a..9d402ff 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.24.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;endline=23;md5=cf562f60b9dba7df20d6ee3f97ea1d5a \
+                    file://src/gpg-error.h.in;endline=23;md5=64af9846baaf852793fd3a5af393acbf \
                     file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2b91225afbc"
 
 
@@ -15,8 +15,9 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
 	  "
-SRC_URI[md5sum] = "feb42198c0aaf3b28eabe8f41a34b983"
-SRC_URI[sha256sum] = "9268e1cc487de5e6e4460fca612a06e4f383072ac43ae90603e5e46783d3e540"
+
+SRC_URI[md5sum] = "d9fa545922a5060cbfbd87464bc31686"
+SRC_URI[sha256sum] = "f628f75843433b38b05af248121beb7db5bd54bb2106f384edac39934261320c"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.1.4


