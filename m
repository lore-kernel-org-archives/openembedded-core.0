Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 143357E600
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:30 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 19so6705341pfa.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DfEIV1FhyaK/WQyvAw7CLFfd/1LC+bWYXbImnyB+Ovc=;
	b=QkLex7jNVxu0KARmgLfso18mca5D8GyU9VrC1WQs5hxSup5v4D6PeLdvKYcfQfOvGc
	gIEWQOo9+lZYzuLICtGDwPcgXfi8Th/W/LsLRuYSuqXT7QoKdbSYN2ZOPEhqIvfdc/XT
	BX9h1Acu3oxFJg3kqOaEVpgjYW5nUDPr3sFEmK4aG3+UMZceMEd2DrDeOKnUNLgByyEX
	yvzwjlTBfBcW4XrU5rpTBDy1icZWmQNjmyGL4A5aGixJISgoYxnmKRgNLKx1qT46ArSk
	KQomN9LeAWv6RkP04pRY9H0+am1avn4xjQf2HDpQNCGhBJqg0c0qClLfYTBhMuyKwybx
	YNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DfEIV1FhyaK/WQyvAw7CLFfd/1LC+bWYXbImnyB+Ovc=;
	b=q3kpIOVlLW26XYKjTWiSWFk3i2fzAwMxeb3eRhVdo3nksu2jG+wPAKgn2g901RgWLq
	xY/1iTZCLiQR3lWefS+ecUalEYHVed0M6K4KRWxGNZ4L6sCKxdnNZF/IaGf+sRtGO/lo
	SlL0a9IRaZjwB7NiJAtcSXrondltZwskcqBKzxlSu5cxd3ZZ9XKCagAI7R3wra5Z+XMF
	Ev+/fhUI8PmnII2dqfG4BgnDvbC/DCJDAQO2T0MZEc+tRER8ZjL/Lr92LxMe/7cC/R5x
	ikVeyVdaCGLOxFL+SdgRLZ0Pd8EcfO0PlxemfHLTEXwhpH0mUbvuz1DIY4zx82PYwb/j
	C6NA==
X-Gm-Message-State: APjAAAVA470I2ak6vvmtG5Mh1pb54v9o2pa3GT9X4/vVO6dZWSxJZ6A0
	zXQS/ngSX9kQ3K16ZR0auCoqySSWGAw=
X-Google-Smtp-Source: APXvYqxqcoEyQQRdHbEFeMC92f3VdTrUvMf8dbypOFa4PTbkRTo4qhAA3dRrfe6x9wGgPsqv73PADQ==
X-Received: by 2002:a65:66d1:: with SMTP id c17mr19094328pgw.293.1561348472019;
	Sun, 23 Jun 2019 20:54:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:09 -0700
Message-Id: <8e057e3e3603eb4a88a86e1f42922c614ed78234.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 10/19] manifest.py: fix test_SDK_manifest_entries
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:31 -0000

From: Chen Qi <Qi.Chen@windriver.com>

TOOLCHAIN_OUTPUTNAME could be overridden. So use this variable directly
instead of its default value ${SDK_NAME}-toolchain-${SDK_VERSION}.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/manifest.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index c0b25ab..5d13f35 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -86,11 +86,8 @@ class VerifyManifest(OESelftestTestCase):
         try:
             mdir = self.get_dir_from_bb_var('SDK_DEPLOY', self.buildtarget)
             for k in d_target.keys():
-                bb_vars = get_bb_vars(['SDK_NAME', 'SDK_VERSION'], self.buildtarget)
-                mfilename[k] = "{}-toolchain-{}.{}.manifest".format(
-                        bb_vars['SDK_NAME'],
-                        bb_vars['SDK_VERSION'],
-                        k)
+                toolchain_outputname = get_bb_var('TOOLCHAIN_OUTPUTNAME', self.buildtarget)
+                mfilename[k] = "{}.{}.manifest".format(toolchain_outputname, k)
                 mpath[k] = os.path.join(mdir, mfilename[k])
                 if not os.path.isfile(mpath[k]):
                     self.logger.debug("{}: {} does not exist".format(
-- 
2.7.4


