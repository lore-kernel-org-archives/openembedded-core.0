Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id A7F267E500
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:25 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id y15so2059764pfn.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HokWNm03tbEgDbaEk8dWV+fvkcfh8/CGSmzFWMaIq3o=;
	b=NiueP8TzeeHGuY6G9ndBJY3FMTtw9P4iKeKBIFW2h8QzeRkVtnnM8YuxaAJO2SHTlK
	HbAm1JuufEp+35YbZmobB/P+AE04v4o1iiCdvdPBGqimUATsLb20c3FsAF6rSOqoP5dZ
	5vm37wxzpyXCnztexeN3tnfo1C+8LtIFYkzFYXZ7L6UsmWNnbMxVoRK+eDNSE88nfFVq
	KBwnKTUy3Ly0IkalJRZBzfP5J0L2zNVGdTe08yorYe6nWpnAoWGpDpFR+1hHcJrz5dcj
	BOiQ77FG79kij2R7vd2gmtSMihz+i71gN68x41bRzsWvu/jMPJshdTUO2H+Ly2JP0CKT
	ZNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HokWNm03tbEgDbaEk8dWV+fvkcfh8/CGSmzFWMaIq3o=;
	b=d7loyhYvwD9keB8qM5PnfeQ0hJubG4NKHbi2NRb6K6LoOGmDNfld/z8q/vjz97dy5R
	V/iruuEKicztmlXCKHyNbCwhlPUqnLeO0q6v74q5uJxG2+ey7IGOLa4UY+7g2bqy86Xx
	nqD5kOT/RjzWjcWw9cDe86t9r5j5pgfcZ0EC/qVMkt9g1qZN1pAqLi1O21SdJQ2TY4t/
	lC7xBqYNW4r818JhGrKNyfj6fuCk7iI645P4RJt0c+d5fLPvWvNIWBFUO8NZYUUTTfg/
	/G9BnpQuDWeTgVrT/VxYL+8qZGY1iDDrMiWHQz/igIswZILng3YJv3sXhPulw/KWfO6t
	6oWQ==
X-Gm-Message-State: APjAAAVfiQb2o45LyF2d0HjAvXA4C/lB9qGgxJiEohcgaiPNLY7dqOK0
	ieXOhwjm7zboqVcEQ8BCwXsyaTZs4g8=
X-Google-Smtp-Source: APXvYqzb6AyqKNmVG13JSsgvOgkPudtQiAiB37sU6EaPM25+LE6duLiWHA3ph89T4E42yclhNEezAw==
X-Received: by 2002:a63:f953:: with SMTP id q19mr30657980pgk.367.1561348466573;
	Sun, 23 Jun 2019 20:54:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:03 -0700
Message-Id: <d1d082bf5191fd45aa0bbd0d69730fabe620e654.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 04/19] diffutils/run-ptest: support to run at arbitrary path
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:25 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

1. Run run-ptest at arbitrary path

2. Fix large-subopt.in1 not found
...
|diff: /lib32-diffutils/3.7-r0/build/../diffutils-3.7/tests/large-subopt.in1:
No such file or directory
|diff: /lib32-diffutils/3.7-r0/build/../diffutils-3.7/tests/large-subopt.in2:
No such file or directory
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/diffutils/diffutils/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/diffutils/diffutils/run-ptest b/meta/recipes-extended/diffutils/diffutils/run-ptest
index 695c5e8..ad467d9 100644
--- a/meta/recipes-extended/diffutils/diffutils/run-ptest
+++ b/meta/recipes-extended/diffutils/diffutils/run-ptest
@@ -1,3 +1,4 @@
 #!/bin/sh
 
-make -C tests check-TESTS
+abs_ptestdir=`echo "$(cd "$(dirname "$0")"; pwd)"`
+make -C $abs_ptestdir/tests check-TESTS abs_top_srcdir="$abs_ptestdir"
-- 
2.7.4


