Return-Path: <akuster808@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id D8A1C6FFFB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 21:43:39 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id y89so8343737qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 14:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PbnkYj5hpL81ewH4tHPoTPRPBp1SAQ4Tw2S+X6RcRY4=;
	b=snWQFLP0aLaz4Rriwjo51ySTwRq3sxKtYvODo3jriuBpnLt1/0OFJaxvnSGpSntqcN
	JSCbCcsOrCYTEmMhLlSBn00wLeWT4LJh3ZdsAhd+8sKnTY97GWQicLJR3o3oR6aKwkWH
	8ZhrWdQkhbjIkTGbdiSKLJxHxCB399Ij17d+eDGUcDP9mDVH9yhZgKWg6GgRiEKRh7+p
	5xvyIjqRDi066XaP8tnEIcuNBCGt+kDeDejVfDb6cUN1rsh6E5K5Ku1xMk6j8XSwNx86
	q6XyTApHdvjzOU6yf8q+4PlFMoYIo/6x9O0it/sZVnW1WugZtgPWqrn8sfwzZ8vx6nOq
	WYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PbnkYj5hpL81ewH4tHPoTPRPBp1SAQ4Tw2S+X6RcRY4=;
	b=Fc2sGrOG+qCzDoTe38KrilnFYpqac7oEP7ND8fsyDrdG5/zHUpJIx31ZGg5KnJIQzX
	3/pl+1vdFedhEBRCbgMl2rhfXrv6tmn5GIPVHsJIlwGiQlejfu8+9zk2Oeh/2kPZlIvr
	SqHELavH9sUP5wHlMDZHJtacJU/f/KPXHGj+hTyughaTPjqbvQXqdKA6kcbfSOHYh6hO
	RlH5HZNltxfIZ24mP1dzIl/fwEr09U00+htHlynfd49ukSzJsH1wLwcsmiCrkV7nthln
	+JKW92tThI6znEfmo+8pXJqO0YG6nFxmgwP6fUhCIfug2VTmtQro6e6GcU5kZoHb6H9T
	3iEA==
X-Gm-Message-State: AD7BkJK2I25V0uhdwDbBPxYpA5PMCe7eVSE3aRfphlQYENRLm1Wwval4sZSlcv3Lv8KwFQ==
X-Received: by 10.140.174.2 with SMTP id u2mr25704516qhu.35.1458337420322;
	Fri, 18 Mar 2016 14:43:40 -0700 (PDT)
Received: from localhost.localdomain ([151.124.160.55])
	by smtp.gmail.com with ESMTPSA id
	s77sm6871630qkl.29.2016.03.18.14.43.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Mar 2016 14:43:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Mar 2016 14:43:18 -0700
Message-Id: <1458337398-1462-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458337398-1462-1-git-send-email-akuster808@gmail.com>
References: <1458337398-1462-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] tzdata: update to 2016b
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
X-List-Received-Date: Fri, 18 Mar 2016 21:43:41 -0000

updated SRC_URI to http as it seems more stable.

Changes affecting future time stamps

     New zones Europe/Astrakhan and Europe/Ulyanovsk for Astrakhan and
     Ulyanovsk Oblasts, Russia, both of which will switch from +03 to +04 on
     2016-03-27 at 02:00 local time.  They need distinct zones since their
     post-1970 histories disagree.  New zone Asia/Barnaul for Altai Krai and
     Altai Republic, Russia, which will switch from +06 to +07 on the same date
     and local time.  Also, Asia/Sakhalin moves from +10 to +11 on 2016-03-27
     at 02:00.  (Thanks to Alexander Krivenyshev for the heads-up, and to
     Matt Johnson and Stepan Golosunov for followup.)

     As a trial of a new system that needs less information to be made up,
     the new zones use numeric time zone abbreviations like "+04"
     instead of invented abbreviations like "ASTT".

     Haiti will not observe DST in 2016.  (Thanks to Jean Antoine via
     Steffen Thorsen.)

     Palestine's spring-forward transition on 2016-03-26 is at 01:00, not 00:00.
     (Thanks to Hannah Kreitem.) Guess future transitions will be March's last
     Saturday at 01:00, not March's last Friday at 24:00.

Changes affecting past time stamps

     Europe/Chisinau observed DST during 1990, and switched from +04 to
     +03 at 1990-05-06 02:00, instead of switching from +03 to +02.
     (Thanks to Stepan Golosunov.)

     1991 abbreviations in Europe/Samara should be SAMT/SAMST, not
     KUYT/KUYST.  (Thanks to Stepan Golosunov.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/{tzdata_2016a.bb => tzdata_2016b.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2016a.bb => tzdata_2016b.bb} (97%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2016a.bb b/meta/recipes-extended/tzdata/tzdata_2016b.bb
similarity index 97%
rename from meta/recipes-extended/tzdata/tzdata_2016a.bb
rename to meta/recipes-extended/tzdata/tzdata_2016b.bb
index cacc480..b9e386a 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016a.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016b.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
 
 DEPENDS = "tzcode-native"
 
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "0d3123eb1b453ec0620822bd65be4c42"
-SRC_URI[tzdata.sha256sum] = "5efa6b324e64ef921ef700ac3273a51895f672684a30e342f68e47871c6a8cd1"
+SRC_URI[tzdata.md5sum] = "f638ec0d4d7a17f001ce475860255c85"
+SRC_URI[tzdata.sha256sum] = "6392091d92556a32de488ea06a055c51bc46b7d8046c8a677f0ccfe286b3dbdc"
 
 inherit allarch
 
-- 
1.9.1


