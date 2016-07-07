Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id AE1B560119
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:35:20 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c74so348710pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 18:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EmPHnKqHj6w2PCnYTzJJe7RkkgEEktX21EWg3S91v08=;
	b=s2zLQVhcPOMeKh0nHF3s9Sjn1nIqcbgSKyRfTvgfy86V/yBJBgBZ1Sr/r4Xm87LmXl
	A45SMqKKX+Lf9aylm+qJVMYNBMAJPAA4kA/p7cBKnZZvc169oGrP7hBbIArGfwHCyEd4
	LHNQXi8q2FlCEaGexmyNb7hn4lDGx5qrPrL7S48SU6wzrSnWLD8n+YVMgcqoqmKCGKZL
	+rq+F/4hrvgxJyG0TU/z43weUp5X7+TINtBcOupnqFXFoeYBEu9390KejlxWH6yaWoPx
	lQKeMwEuqT2Xeurutg7ViJKzVXjp7m0jYwEK2catvHWR/ObPhfZ68zZ6XBD95FnfSEOX
	A2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EmPHnKqHj6w2PCnYTzJJe7RkkgEEktX21EWg3S91v08=;
	b=YjH1V3GWzsYnYKFp6HOz/94xiLYBx8IExbeNAL/ev8qzoUK4DRPH2PkajPu9JNwRxn
	+gLUipEq4TEZOrAyGxBZ4eTZpN0lLxohHXV8hS1O/T0QaYS2a4ykG/W6bbQZuwEmSg/i
	n7W67VFy9W5IlpCJoiOfQFPUDhi3lilvZtw7S97dA/GqtEsJ35ILEa11ciiz6Pt+VgE7
	Mc5DKDjXAYbiC3uidaaRe1jzidGhGCEfqgPVdHITAU5cDHqihmDEVKK/gTszDSgDrK5R
	pD2Iixfjy3qqt9mJBc+6o85dRjuztNVXpnQ/8zbgcRXg6gx0uwM+oZsdJl65ngfP1k/n
	ijaQ==
X-Gm-Message-State: ALyK8tLIxNbBPd9NQr1PqMETmqDFpRer+01gpyBWmZV2S0UeOVTiChLSyMUmvWcw95Rb7Q==
X-Received: by 10.98.79.194 with SMTP id f63mr692264pfj.95.1467855320959;
	Wed, 06 Jul 2016 18:35:20 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id ct7sm447197pac.13.2016.07.06.18.35.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jul 2016 18:35:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Wed,  6 Jul 2016 18:35:14 -0700
Message-Id: <1467855314-5646-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467855314-5646-1-git-send-email-akuster808@gmail.com>
References: <1467855314-5646-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] tzdata: update to 2016f
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
X-List-Received-Date: Thu, 07 Jul 2016 01:35:20 -0000

 Changes affecting future time stamps

    The Egyptian government changed its mind on short notice, and
    Africa/Cairo will not introduce DST starting 2016-07-07 after all.
    (Thanks to Mina Samuel.)

    Asia/Novosibirsk switches from +06 to +07 on 2016-07-24 at 02:00.
    (Thanks to Stepan Golosunov.)

  Changes to past and future time stamps

    Asia/Novokuznetsk and Asia/Novosibirsk now use numeric time zone
    abbreviations instead of invented ones.

  Changes affecting past time stamps

    Europe/Minsk's 1992-03-29 spring-forward transition was at 02:00 not 00:00.
    (Thanks to Stepan Golosunov.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/{tzdata_2016e.bb => tzdata_2016f.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2016e.bb => tzdata_2016f.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2016e.bb b/meta/recipes-extended/tzdata/tzdata_2016f.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2016e.bb
rename to meta/recipes-extended/tzdata/tzdata_2016f.bb
index ac05726..a66603f 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016e.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016f.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "43f9f929a8baf0dd2f17efaea02c2d2a"
-SRC_URI[tzdata.sha256sum] = "ba00f899f18dc4048d7fa21f5e1fdef434496084eedc06f6caa15e5ecdb6bd81"
+SRC_URI[tzdata.md5sum] = "b20b3c1618db1984aac685e763de001d"
+SRC_URI[tzdata.sha256sum] = "ed8c951008d12f1db55a11e96fc055718c6571233327d9de16a7f8475e2502b0"
 
 inherit allarch
 
-- 
1.9.1


