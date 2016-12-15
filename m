Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id C6D38772BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 15:21:44 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e9so6504285pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 07:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tie/EJowcA8Vwje2QyOKgG5WgWShheaypUctl3mI7GM=;
	b=NA4B8q6Jc6pwf31MDV826jcDmgUFFQySWCczy0d5m0+TClkSSQjg+CyOHFo8ofuVt/
	YZWYP9U1X1SdWVJ3XvcSMLYO7gXSqk7Nr+MLw7RDbgfjHwKkHxwE/YzbToAs8F/uQiV3
	iG3KFzij7SoiyoyTwMWtVB0IShW+d7U1lG2iUlClkzrk36akHRca2lSbCWrG6TQMLkNO
	7/Kj/QxQ4n2GMW6soxLf2YaeofIjL0DLhuZwarc5UJ1MHpRUdjHcLaRUep/H6BoYcoTj
	LM0AVfZoTK3cWIkFUcmsZELD7pcQwANcsS6YvtNPHwlbX7MptKjqpf0fEDyX393ONUtk
	oGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tie/EJowcA8Vwje2QyOKgG5WgWShheaypUctl3mI7GM=;
	b=KXbS/AalJCFAAXD1e2lbC2Eli0sSc2HNv0nlrTU10ptY5daCKGwi/9DmhEQB6WDtWq
	n9cc+On0mZ5ngrrENh5owI7FuINcgzkgf8/OO5AwPwYJ9UvWoORxka7Jojz7oSktAKim
	3cLHVz2Wc7bw9qUYZB4Y/JK3kUtYCvxu9pad5Wo8zBSAZ5UXXFvtfbbUyE6jL60Aid70
	i7S8RrSWX8gUkq+eu7g3UG9P+ow8neXy92fAhqWXJkO90bwHnd0KYsjAk95n7FMdcek2
	PM7b+LxjuVsOlS1FY9p5qHHeP47AP6uVbC+nVMR5Ar7BnvS52P6+riH2Eh0tMl6PstHS
	ccvw==
X-Gm-Message-State: AKaTC00TFJ5KkkkLgE5yWgRippLNk+v1zZHKxQ62kJ2WKma9PbWu6Aq/7/xTYw3gAmSFYg==
X-Received: by 10.84.210.13 with SMTP id z13mr3414694plh.167.1481815306246;
	Thu, 15 Dec 2016 07:21:46 -0800 (PST)
Received: from akuster-ThinkPad-X240.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id 24sm5412214pfh.41.2016.12.15.07.21.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Dec 2016 07:21:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 07:21:44 -0800
Message-Id: <1481815305-8690-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] 1/2] tzcode-native: update to 2016j
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
X-List-Received-Date: Thu, 15 Dec 2016 15:21:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes to code

    zic no longer mishandles file systems that lack hard links, fixing
    bugs introduced in 2016g.  (Problems reported by Tom Lane.)
    Also, when the destination already contains symbolic links, zic
    should now work better on systems where the 'link' system call
    does not follow symbolic links.

Changes to documentation and commentary

    tz-link.htm now documents the relationship between release version
    numbers and development-repository commit tags.  (Suggested by
    Paul Koning.)

    The 'Theory' file now documents UT.

    iso3166.tab now accents "Curaçao", and commentary now mentions
the names "Cabo Verde" and "Czechia". (Thanks to Jiří Boháč.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tzcode/{tzcode-native_2016i.bb => tzcode-native_2016j.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016i.bb => tzcode-native_2016j.bb} (69%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016i.bb b/meta/recipes-extended/tzcode/tzcode-native_2016j.bb
similarity index 69%
rename from meta/recipes-extended/tzcode/tzcode-native_2016i.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2016j.bb
index 9d3d5a1..630fd42 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2016i.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016j.bb
@@ -9,10 +9,10 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "8fae14cba9396462955b7859cf04ba48"
-SRC_URI[tzcode.sha256sum] = "411e8adcb6288b17d6c2624fde65e7d82654ca69b813ae121504ff66f0cfba7b"
-SRC_URI[tzdata.md5sum] = "73912ecfa6a9a8048ddf2e719d9bc39d"
-SRC_URI[tzdata.sha256sum] = "b6966ec982ef64fe48cebec437096b4f57f4287519ed32dde59c86d3a1853845"
+SRC_URI[tzcode.md5sum] = "0684b98eb184fab250b6ca946862078d"
+SRC_URI[tzcode.sha256sum] = "b9effc4fb4051df4a356cbe5857bf99e2fa32e00d8340f2e8a4d58f0c9ccb0b7"
+SRC_URI[tzdata.md5sum] = "db361d005ac8b30a2d18c5ca38d3e8ab"
+SRC_URI[tzdata.sha256sum] = "f5ee4e0f115f6c2faee1c4b16193a97338cbd1b503f2cea6c5a768c82ff39dc8"
 
 S = "${WORKDIR}"
 
-- 
2.7.4


