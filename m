Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id ADBBF772DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 15:21:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c4so3047304pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 07:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fflr7HatO6i0GMBwdHnay7Huk64SLSW82lFJoFOi2Oc=;
	b=JyllEE6T9YDbAAXqN9LQEgfJnjRZlfsJ+drJIzIDK4W4wFIfAS23MGiZpeADrLhgnN
	el39pQXTFYQ2Yibzl0GJ59qMle9qEx8yXVA16gOI2zzXnUFFrcHWq3L5RR55ajGfb1CQ
	JNELnNrUiigFZEiimJw2gyXPWkY43XAhm6tR/gCp+ma4icYqdlLh1SeHogknBMCGJMvf
	Vb7cfNDNzEAhoc53Yh5qQ+JQg/fKnHyAS0u0W6VOJg5wGseamJ9O7LelWZWiarVP5ANB
	jBWYobs/MV2IhTgyTjc1dflZYyG5GVWIUssPhdD7xJtUXE/LaUaQWGy9bHYMeHtFoJvf
	Kv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fflr7HatO6i0GMBwdHnay7Huk64SLSW82lFJoFOi2Oc=;
	b=exbRevUr83LUSE2wDYnTKrz4cToggvSC3ull/aPdCfa5FF2oN+Bhnaydth6E1LFu98
	OCc7u9sJYjecSXEvNLP1a4IXAskRyxb2zqvqogcr+54jHfFz7CITmVKlW4rvFUkXw+YU
	HXzHNHQZTLyGF3s75PiOMzCtruUdUBZzLLikDq8+JTUGAvUxKKyzvyNEo8vOlPMfNtq3
	zDL5jKP3NZ5kUmfTpHfPgM1ILpJOSgpbo8aWk/IY4XOc6azChCAq9PijCC0AuTMQd1Rn
	x9yJSu06PEEG9K+DOyoIB2PE6W6Ud63qVsQA3rSPbcs81us1sGB2zxbz+eqOnsEQE40V
	tW6Q==
X-Gm-Message-State: AKaTC03fP7bk0gdZpwLKotHiGN9B8rQfctdwLVgLkYk3LDEZLdA0TXaT9i4orcTNXfejPg==
X-Received: by 10.99.209.81 with SMTP id c17mr3092566pgj.24.1481815306828;
	Thu, 15 Dec 2016 07:21:46 -0800 (PST)
Received: from akuster-ThinkPad-X240.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id 24sm5412214pfh.41.2016.12.15.07.21.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Dec 2016 07:21:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 07:21:45 -0800
Message-Id: <1481815305-8690-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481815305-8690-1-git-send-email-akuster808@gmail.com>
References: <1481815305-8690-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH] 2/2] tzdata: update to 2016j
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
X-List-Received-Date: Thu, 15 Dec 2016 15:21:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Briefly: Saratov, Russia moves from +03 to +04 on 2016-12-04.

  Changes to future time stamps

    Saratov, Russia switches from +03 to +04 on 2016-12-04 at 02:00.
    This hives off a new zone Europe/Saratov from Europe/Volgograd.
    (Thanks to Yuri Konotopov and Stepan Golosunov.)

  Changes to past time stamps

    The new zone Asia/Atyrau for Atyraū Region, Kazakhstan, is like
    Asia/Aqtau except it switched from +05/+06 to +04/+05 in spring
    1999, not fall 1994.  (Thanks to Stepan Golosunov.)

  Changes to past time zone abbreviations

    Asia/Gaza and Asia/Hebron now use "EEST", not "EET", to denote
summer time before 1948. The old use of "EET" was a typo.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/{tzdata_2016i.bb => tzdata_2016j.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2016i.bb => tzdata_2016j.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2016i.bb b/meta/recipes-extended/tzdata/tzdata_2016j.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2016i.bb
rename to meta/recipes-extended/tzdata/tzdata_2016j.bb
index 3801a3f..1ef330e 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016i.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016j.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "73912ecfa6a9a8048ddf2e719d9bc39d"
-SRC_URI[tzdata.sha256sum] = "b6966ec982ef64fe48cebec437096b4f57f4287519ed32dde59c86d3a1853845"
+SRC_URI[tzdata.md5sum] = "db361d005ac8b30a2d18c5ca38d3e8ab"
+SRC_URI[tzdata.sha256sum] = "f5ee4e0f115f6c2faee1c4b16193a97338cbd1b503f2cea6c5a768c82ff39dc8"
 
 inherit allarch
 
-- 
2.7.4


