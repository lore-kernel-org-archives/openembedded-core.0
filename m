Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3A3FE7C9C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:25 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id l5so21863782wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qGVbprTroNneVKY8DDySLTnn5Cky30P5rvgkKddvSns=;
	b=DPhfw7Tlrl+5Ed1toTxWe4N30EfXbFcaCUX4LsdpFHaegdKQU/QqBrwbNqDe9SY4Jj
	WyN/ZD33EddpPS+1KmDy/4I/YX7tkoCTRAyTYPoqKXy/oMJC8wI593FPGAjtpNBoK8Hi
	QshPo/Q4U2npOJxzZN4zcld/cgBqnIe92NBiyKEuwwBvB2uyKSpbTaq0DrjE/w3szPcO
	nJ3xWvyJ1Cd5utJ/HWjaWO+Jh1ioX4+ZaYubp8clLA8/lCri0OI2VWAS37ogeFdDXmEf
	un4TD1GWNUoH831ckDBTIf/EXcL2zxOoP2oFc9kx04e1WIYPgNq73FfE37FFM8Le7ZE1
	GZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qGVbprTroNneVKY8DDySLTnn5Cky30P5rvgkKddvSns=;
	b=nxMjMldLCWGWXxmzi8Rf5GD0yXA1PB4sn2aNHsY00bJ+SS4/AYDZQc3Xb4ZQqtE0Dt
	WReHYk/lhWv1cP+G+0H/CfQSWYwwghoCN3xp8jsbxkp5+/supkER6vPcAr/zDEWkjEJM
	uRAhzq32oV6BXhJR4HoVle3SurzS/IhtDMWxV19SMSIKJap9/NboPESLG73lFZ2uQYRw
	PI/MQCJ4ToS8U++23hxG37SaeT2K1C/QyUNZ6wvsbkD9JzlUVrbq8kZ0jhubS+18IPha
	G7BLZJmphT9geSm775rT2rkkTAq/tk8lRQHNBKdvawgOZOUbO8cSUOYgxSI6Xt3Beoak
	j3aw==
X-Gm-Message-State: AHQUAuZhK39jgoVU/nW8S8DK+70CTw2UTpkw5CL6TYQJOkT9mBp5MLFK
	ilz8EfB45yyes2J/NEJQIrJ4h3cD
X-Google-Smtp-Source: AHgI3IYeLN4P5h+u9iAK4Sy+ET9FQHfnsPFVow2Lc/6dDzK4CfRP3k7YMvsR/41+VbfnerUKEbCxKg==
X-Received: by 2002:adf:fb0d:: with SMTP id c13mr23482065wrr.285.1550598445647;
	Tue, 19 Feb 2019 09:47:25 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:46:57 +0100
Message-Id: <20190219174712.60694-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/20] libdnf: upgrade 0.24.1 -> 0.26.0
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:25 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/{libdnf_0.24.1.bb => libdnf_0.26.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.24.1.bb => libdnf_0.26.0.bb} (95%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.24.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.26.0.bb
similarity index 95%
rename from meta/recipes-devtools/libdnf/libdnf_0.24.1.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.26.0.bb
index a55acb2ef0e..9c2247c237d 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.24.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.26.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0001-include-missing-string-and-errno.h-headers.patch \
            "
 
-SRCREV = "04b71d78a2170e930a3c248d48a231b19f823064"
+SRCREV = "bd23204aa83d10e3d293a9f2d496cba6070f6a4d"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


