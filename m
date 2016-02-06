Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0F5AA772A7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:42 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c10so6527922pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=nYCYVp04lqHfpDtVimfENpEbfcAc58aU/+wfJdATgSA=;
	b=RRu/6XbyGEXRed1c026kIrPZpxLfB4K+EnYOiqgfU8mv0uydqhDclzcU85C7arlj4d
	xOh3lHYi9YOjJVhlB/zAd6n1yJKSr+eVUdkImGi/d5cxAeL1ju7VS+w4c57r4M4+kpI3
	poPhk/JhDiIs3krugDOQl5ZtnqdsxRomBfC3XD3qDHxQCJyvikXrZT+k4ywzviJduehT
	IzOtOyIjy1kEiRCl16lg/2dNJL62w8yAR3mBrlLn2czhFgRp8N3EUl2c8kzFQvNXmQq1
	ZjW0+G0afjck1qTDPl2uBLM7qCHRWrUVSwqOc+Re+oObTJ5vcAUpG/YSIzJvEQ4zTAwT
	rOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=nYCYVp04lqHfpDtVimfENpEbfcAc58aU/+wfJdATgSA=;
	b=EEHdWDahbLhUxbxhdOsA67Mv10sGj3CHp3QuG8OLzksuPqpwuNQY8OB2WZ/j9icXAh
	SdrcJLIdk9XCc/u3JXA0QffuOh3l4uJyp6Lty2+68cLqn9CCsNhaFGbMc1dS7+c6BSnJ
	71r9Rvrw2rjw7sITyITJEAyE4b47LNJe1KT/TRFaSXaeVD9Q0P6rrO32OTUPImRZlskd
	p5s7sjoLwmLwNAp+IRSa04uEF3uMVcJuZ4iHeAWNjrJDniYYC12KT0WiDOYUIYSc0hHX
	M8PEZDIxw7Xwsgdr7n9i3/y5uQCmvAz0i4h9U3rw7SE10u4OUg4yRWrKq1OUeQ8b8jxb
	9+lA==
X-Gm-Message-State: AG10YOS3WU3bM7xJlv9zmhdjbjMFwnKvrebRhGJ+BJaVwnrKDTjQg96Re6SVxBmnKbX7Fw==
X-Received: by 10.98.12.8 with SMTP id u8mr2115536pfi.36.1454800543980;
	Sat, 06 Feb 2016 15:15:43 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:57 -0800
Message-Id: <9166869052bd0bf2f9b4b9d00e85a37ce4da5183.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 16/21] tzdata: update to 2016a
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:43 -0000

From: Armin Kuster <akuster@mvista.com>

Changed LIC_CHKSUM_FILES to a new LICENSE  file.
Add BSD-3-clause to licenses

Changes affecting future time stamps

America/Cayman will not observe daylight saving this year after all.
Revert our guess that it would.  (Thanks to Matt Johnson.)

Asia/Chita switches from +0800 to +0900 on 2016-03-27 at 02:00.
(Thanks to Alexander Krivenyshev.)

Asia/Tehran now has DST predictions for the year 2038 and later,
to be March 21 00:00 to September 21 00:00.  This is likely better
than predicting no DST, albeit off by a day every now and then.

Changes affecting past and future time stamps

America/Metlakatla switched from PST all year to AKST/AKDT on
2015-11-01 at 02:00.  (Thanks to Steffen Thorsen.)

America/Santa_Isabel has been removed, and replaced with a
backward compatibility link to America/Tijuana.  Its contents were
apparently based on a misreading of Mexican legislation.

Changes affecting past time stamps
Asia/Karachi's two transition times in 2002 were off by a minute.
(Thanks to Matt Johnson.)

(From OE-Core rev: 790315dbd2dcb5b2024948ef412f32d2788cb6b5)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 39e231cfabda8d75906c935d2a01f37df6121b84)
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tzdata/{tzdata_2015g.bb => tzdata_2016a.bb}                | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2015g.bb => tzdata_2016a.bb} (96%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2015g.bb b/meta/recipes-extended/tzdata/tzdata_2016a.bb
similarity index 96%
rename from meta/recipes-extended/tzdata/tzdata_2015g.bb
rename to meta/recipes-extended/tzdata/tzdata_2016a.bb
index 5b2afa6..6ba5f81 100644
--- a/meta/recipes-extended/tzdata/tzdata_2015g.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016a.bb
@@ -1,15 +1,15 @@
 SUMMARY = "Timezone data"
 HOMEPAGE = "http://www.iana.org/time-zones"
 SECTION = "base"
-LICENSE = "PD & BSD"
-LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=996a9811747aa48db91ed239e5b355a1 \
-                    file://README;md5=d0ff93a73dd5bc3c6e724bb4343760f6"
+LICENSE = "PD & BSD & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
+
 DEPENDS = "tzcode-native"
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "8d46e8b225b9a04c75f5c39636435ad6"
-SRC_URI[tzdata.sha256sum] = "b923cdbf078491696b17bc8d069c74bce73fabc5774629da2f410c9b31576161"
+SRC_URI[tzdata.md5sum] = "0d3123eb1b453ec0620822bd65be4c42"
+SRC_URI[tzdata.sha256sum] = "5efa6b324e64ef921ef700ac3273a51895f672684a30e342f68e47871c6a8cd1"
 
 inherit allarch
 
-- 
2.3.5


