Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id CCA7A60667
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:43 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n205so11549144wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ilZ2JlN8PRrzOCAA+VcxhXfshtU31kWRQpdCog4vl0c=;
	b=YNw8AP40i7KDNI3TkS9+g1nKMCcQfiixogMoVBaEz/ylpNZKKphWDeQKQj3J6sqvXp
	jvjNZKk5PGqVtCmjJj9pqZAluwyOvMxhqXJIjB8Rg7HFO3eyneSI1xXJ/K2aUfdIet5T
	gFtAiRV0OsQMbJm5oTw5HaXvaHk9FNoW49J1/RTkylKyLJrcRpDVfDug1XILhiqy1rIW
	MrzgaD2HYLEx9O3hk0uSIgc6a3ZVh1s6DYKWca2dtf7gnIGuWW+Hl5m8EaLHJsr3GaDl
	mAXGwVb9UCKk4XpkeTpyBrFgVlyzX1defzUAfCZUB4BCPt8wOLJxbppRlqseaF/2+G1Q
	iMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ilZ2JlN8PRrzOCAA+VcxhXfshtU31kWRQpdCog4vl0c=;
	b=lWH+DD+3MIPB5KTW0zcR8ROEN03en8Lg3ZCQjolVKQP1GF1tnSQ2tVq81Ap07bWvyA
	PNf5PNHO3JtHRfvbtUKcgnJLRbxi5iSsBi3q0fx0AY0rsZchBe75aj5/r/ZYX22syP6a
	wAgd6eI6gpQ0Xr058E6+ykNCLsv9rICoqNE72HcTVIYv2bAvZNWqZ1QMO+IIwOn5jt2Y
	CEBA8iOUn9jEbJRHBDskNdGHThHWDGA3o6GGtZKKnx7bJN/SlmidJpWnVGxWWLoOkhnP
	qFecmRu84fCYbLfvMzUF0kH8AERwr2YDHWEPeRcHaLXSfu9t1nXq+vFDHYC/d5nN+wlC
	n1EQ==
X-Gm-Message-State: AD7BkJKANnuue8013STIrXtrMvjU+v1VTDSsQFa8UDBfcmtHNGWN4XOOMI64dESX5mb9Tg==
X-Received: by 10.194.71.70 with SMTP id s6mr20391529wju.1.1457896484456;
	Sun, 13 Mar 2016 12:14:44 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:43 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:06 +0100
Message-Id: <f0330d75f873015079ccea6d50d466922282bdb5.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 08/42] neard: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:44 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-connectivity/neard/neard_0.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.15.bb b/meta/recipes-connectivity/neard/neard_0.15.bb
index 93bddb3..be593fb 100644
--- a/meta/recipes-connectivity/neard/neard_0.15.bb
+++ b/meta/recipes-connectivity/neard/neard_0.15.bb
@@ -21,7 +21,7 @@ inherit autotools pkgconfig systemd update-rc.d bluetooth
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/ --with-systemduserunitdir=${systemd_unitdir}/user/,--disable-systemd"
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}/ --with-systemduserunitdir=${systemd_user_unitdir}/,--disable-systemd"
 
 EXTRA_OECONF += "--enable-tools"
 
-- 
2.7.1


