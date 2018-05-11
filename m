Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id B334B78222
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 18:11:18 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id i14-v6so6184583wre.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 11:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qTt5yhS1q1XiG2XsI2Qlg/Lpp0pumv22uUZIcr6qCK0=;
	b=INbqaaF0Ym689kuqqcIyMO5hD5am4mGjSNQA2zjH7oqEd/U6szFOkvbV2I/APZ8ayz
	bsXxiBAcheGICDIqvUn8kWUgRYenz2R+jHQDuPYJuVU86db0PmHcP5BK5KryCgaZPxyr
	piT5ngBzWg7FIVP2ney/qVrByb+1qMEFECVGwYl1MC86ZrG97EJsjV/kZYyGlSDcztKg
	EUOE39gGeVGCJyYJN2Nj6MgX8b2QGylQSCuUqQf/eAsK3arSUyblhM2eBRoxUjvHKsi0
	/jE7/cvRlhR3EnwWVNxKuE9PbSucpPDkbnaw722j6yI0jSEpZKnBl5v9mmIReDjzydbo
	NlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qTt5yhS1q1XiG2XsI2Qlg/Lpp0pumv22uUZIcr6qCK0=;
	b=H1xPo5zsUnHLIeozlCgHOfeQPmJ3rU0t2KV6FvQ5jl5kZ/f65jtG13rZvT6mnh4vWi
	r0QXuPtxO+4CBX6rNFr09iv5M48Q44X2SAkdt0l0j0m4P+DuotW4tcixktxdQGi5Zg6p
	l3Hq1K6QwKYRCn5JqNk0tMa2KZJe7hhk1ZNEkVbyF7l2k/wDGStfocA9YO87pjzYggCb
	bD7uPJw+vtS3Wm9vLdAy3JBdMqLotdfmBMjSBN3kz9LCoy8xgWHe7wBGjW34Q5AvUvYZ
	ObrJs3Z6+/X2OH/GOLDWzJLCU3MMsCbIbIeGjJ8g2LgD0/xPS+0XR3xYR4gdp12XpH8N
	1//w==
X-Gm-Message-State: ALKqPwf5XRFnNdfVO89aIkhTDfJ7M2347TaZXmqpaLGpN1wovm97anBn
	+Q3H3QKVoBlF2eTrZFxRWLoV9w==
X-Google-Smtp-Source: AB8JxZopbZ5IF1eQGRtUZfTSpCuBKHo6YEmw66BaltZmJTIqyH24AxwXCk16Yy/Qy1yvuxHxjpYM/Q==
X-Received: by 2002:adf:9615:: with SMTP id b21-v6mr37755wra.253.1526062278862;
	Fri, 11 May 2018 11:11:18 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	4-v6sm1951012wmg.40.2018.05.11.11.11.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 11:11:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 18:11:18 +0000
Message-Id: <20180511181118.11476-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <CAMKF1spEW+dY4R+YObdtLr+NXK=D8MHK1gBjeBWD1hD-wBrTZA@mail.gmail.com>
References: <CAMKF1spEW+dY4R+YObdtLr+NXK=D8MHK1gBjeBWD1hD-wBrTZA@mail.gmail.com>
Subject: [PATCH] perl-ptest: drop runtime dependency on libssp
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
X-List-Received-Date: Fri, 11 May 2018 18:11:18 -0000

* We use ssp impl directly from glibc/musl now.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 6a7a2d7cb3..8d46448566 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -50,7 +50,7 @@ python populate_packages_prepend() {
             '${PN}-ptest%s', '%s', recursive=True, match_path=True)
 }
 
-RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc sed libssp"
+RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc sed"
 
 # The perl-ptest package contains Perl internal modules and generating file
 # dependencies for it causes problems.
-- 
2.17.0


