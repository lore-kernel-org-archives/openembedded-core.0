Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44818.1795622119948183385
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 07:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=CKJaW2B0;
 spf=pass (domain: baylibre.com, ip: 209.85.219.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-921318b2eb8so74890636d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 07:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795622119; x=1796226919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VWUf5+wgjZL2tlRhG8lJp1A1fqmPhaN8WQNrV19HrPE=;
        b=CKJaW2B0oJumoAzsYd662Q/qA3ZNXrKnP7AmJthQkgsEWbLkDUpmW+OWwvmMOhkX8D
         FLdNRl9D8B5VH76rLN48dsZCeta4lla3F0L1H2gfcN6G9YsT7+c/+dbotNLM5W/h9JvH
         utR3f6R+eDvWLZYdALSmv4SjOhEetVl8eaMpoMArzpc9573ZOH9AMo0vtUe1AvGCJk9G
         TTT1frRw8eaD8KMsfossbVrBD2yT5qiYPjEBTUj9Jbnt1cYh7oX68vDbx7oTiZTBk9+0
         B0plsuAE9y09GF3IzJtSw8TjpjBLtQ12Dv9ELGUdqPqwYPZNaD/fAC441o1yjNgJGfZN
         OhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622119; x=1796226919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VWUf5+wgjZL2tlRhG8lJp1A1fqmPhaN8WQNrV19HrPE=;
        b=HWXRU4F8qZ2OrzDVbQ0Moq81q7riw8SlsclcAUkqcB0j/n6p18cqF86IH6+mlxArKF
         Fkej0c/jFjvj1kPs1fOFZqSeL+wf3KnhwVnIMCDk6/fJyRQQlCreAdHHIkojbsttlS7G
         /QdoRf7maFUYEKa7lQc3x3T5oKnem2xL5hL/jkYn42YYFTxPkBI4muBIltSn2TetXnAs
         m+wGM3rvH7fmKJ7tQ/f4yAwk9LYevpm0ljpyonBi1ZosVx2wRICXrh/CE8ttj7BevaIo
         B49FEYsnM0n5kGfed2cDHHEfqIZMvvlISnMxkc2Jmdn435qm1KS8STymnHBnco4t+dlc
         EfiA==
X-Gm-Message-State: APuU4Z8Og6/CetolwJ3BE4RzGa3cR//uATWC7kxBOlCYd2KduVaJADrW
	LC6CnUy3oZ2Ywym53qruNRSSlbtBL+HA7V4GtcqOeSeTp08eFdWUqTGklWVVlBQeSNtCbyPdcbc
	NBO4C
X-Gm-Gg: AZFdTZfQVz2fSkwGiXPhhRwPMeCJvxVv3BCIgcjp/JberU+yHpYLmyuOjIqVuO8ieJa
	d6jeqHHdIVOqj2sce8scJClSS4Ar7t2Hm/CpWMtRx7dbUxHbVisV75XNmbX+BGV0Xk/aBsuq4Q5
	4lRiBAKsvIAJMEzQUGkzkSylRoJGNJhHmwuHx3D041dVgNibcSvxHKYlufF/isuAgZ1ksfA3CyS
	bc8t9o9K2A8xVDr+Q+1dqSbMQgXrIrcd6N4QmtJsD/6Xax9Y9prwhWaJ30DDP7hdbIoi62gMjL/
	kUdizKyWpMmuR3jIwbhnK8ib1OkZEuNz+3+jLCbaUkic3BoW56xaqJkYO6gI4NZ15XjJOi0UpAx
	zzK9S2afcro9Eff/CVXz5DVrVZ97P8M2J8UTTB92jjLl9IrxTTR0zKNkDu6BFKHgJlSCPNeTmjT
	13RjJ04sU4rpNqwX/Wm18VF2ysUfjAurIi8sK2enA+ix+RdvSgOF+XLyn9pyYF5doZSFLD0dLb+
	+AnL+z6f7YBiK/CI/S0zYjdBsfh9rkS0Kta+WcJNtAX6xcTWSShT/qNPXxI84SOA9fSfhpW9QH0
	fTGScVkruY3cjz3hsQjtu8+IyVZZz85l83s1gNqocwqIevPfT3p+5Jne2zbVWBN3sOwpQhzCLmd
	lPen4fngYqyfmEbDgc1qTWRL2X+2JzZM=
X-Received: by 2002:a05:6214:820e:20b0:921:3004:7f46 with SMTP id 6a1803df08f44-92134af9247mr261128536d6.53.1795622118583;
        Wed, 25 Nov 2026 07:55:18 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm167601326d6.15.2026.11.25.07.55.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:55:17 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/6] librsvg: make ptest symlink creation idempotent
Date: Wed, 25 Nov 2026 10:55:06 -0500
Message-ID: <20261125155508.3024814-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125155508.3024814-1-tgamblin@baylibre.com>
References: <20261125155508.3024814-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 15:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251202
Content-Type: text/plain; charset="utf-8"

do_install_ptest:append() for librsvg was creating a link for 'ptest'
outside of PTEST_PATH, so it wasn't being removed during cleanup and
would remain present on rebuild. This created a self-referencing link,
leading to errors like:

|     1509:             follow_symlinks=follow_symlinks)
|     1510:
|     1511:def get_terminal_size(fallback=(80, 24)):
|     1512:    """Get the size of the terminal window.
|Exception: OSError: [Errno 40] Too many levels of symbolic links: '/home/tgamblin/workspace/ypbuilds/riscv-maint/build/tmp/work/x86-64-v3-oe-linux/librsvg/2.63.4/image/usr/lib/librsvg/ptest/ptest'
|
|ERROR: Logfile of failure stored in: /home/tgamblin/workspace/ypbuilds/riscv-maint/build/tmp/work/x86-64-v3-oe-linux/librsvg/2.63.4/temp/log.do_install_ptest_base.2703564
|ERROR: Task (/home/tgamblin/workspace/ypbuilds/riscv-maint/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_install_ptest_base) failed with exit code '1'

Treat the link name as a normal file if it's a directory ('-n'; i.e.
don't follow the link) and force-overwrite it ('-f') so that the link
gets recreated on subsequent runs.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.63.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb b/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb
index 6e88270075..a6fd4cea28 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb
@@ -87,7 +87,7 @@ do_install_ptest:append() {
 	# the api tests look for the required files in rsvg folder, so simulate it
 	# with a symlink that points to the current folder
 	ln -s . ${D}${PTEST_PATH}/rsvg
-	ln -s ptest ${D}${PTEST_PATH}/../rsvg
+	ln -snf ptest ${D}${PTEST_PATH}/../rsvg
 }
 
 PACKAGES =+ "librsvg-gtk rsvg"
-- 
2.56.1

