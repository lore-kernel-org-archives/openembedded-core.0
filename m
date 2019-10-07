Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id A18E57D6C5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:06 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id p1so6617754pgi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ymkRFCWUx10ycgLFNunG7/yu1TjVc3WwCcaBRFt8fM8=;
	b=IKZmB6Q62gLqPs/PgFynwLltDqmzy77oCXQrfwf/QzJXI4l27NJF9Dp10NYpUhi/12
	Fi9Kvby/ofKTsmjNkBLmaWFoSVyK+jyRbejlfL2V9ytQTs6zbkI44ZBDb4u6nMxng9fT
	wDJ79ojpz3bb9ld1h3LmeMIZfIZq6eMJKrkCNQylk18BuZTsRvB1KksXynJqTdDMD6vV
	PFM+/tq5Iyc6aL8ee/O/DeKYp0bsK0GwfUfPYyXehBT5Ia4TRfpmHn+ED2hhZ/K2JKZH
	RsSmmU/b+yw4ethU4kMoTQiU/MlxR9ul9T+by3teq11jsfHsGQdbhKuBKDjSUVO59+Rv
	Bjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ymkRFCWUx10ycgLFNunG7/yu1TjVc3WwCcaBRFt8fM8=;
	b=MGF+Mb3mJB1BId/i/SIFbfT1AEg4gcAhz0El7pcR6y2y8iJuNgptOLnrMYgsXqr5z4
	ZH7b4N3tRb4TQllcXCPoyFy3wbYtMOh8x3zlpgCWeczOYrpgqyGT9o0DqrSVlKuUBeUP
	6kLiv2JDeZug8lvz21m7YE6lajcel2MMwmxcinbMavvGPubZfodInu/O4P4vHpzz/nAx
	+ppr/+149U6CYWQN6wIQuCIR56dKW8egngwMfJ4MJm0xhHM4Bgw1i9v8GOen5x3a1ZnI
	NWw4Kds6HhgyUbUS9n0PW+0u/Hiu4wSajD9U/x/FxSpxFyxCK2KRzPKd+eGv7QZLM+Cl
	aFGQ==
X-Gm-Message-State: APjAAAUEjB7hC4QPotN9Y8amil53XLP6fc58W3CLbxaGe/LvLHQAkopX
	HO2QMZXAkoGVZk6JaLyEf/Eri0yah+4=
X-Google-Smtp-Source: APXvYqxd7Mj9hxwRjFe3EakPw2+WcJJlcYmU+spBAxlvF5zgcywCA9/ea3qTINPF57LqsukASvxd1g==
X-Received: by 2002:a63:1608:: with SMTP id w8mr31360267pgl.223.1570461067655; 
	Mon, 07 Oct 2019 08:11:07 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:38 -0700
Message-Id: <f965ecbf558b6db1959e4ba8e599d65a5c8022b2.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 01/26] buildhistory: call a dependency parser only on actual dependency lists
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:07 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

Previously it was also called on filelists and possibly other items which
broke the parser.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/buildhistory_analysis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index ad7fceb..d3cde4f 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -127,7 +127,7 @@ class ChangeRecord:
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
 
-            if not removed and not added:
+            if not removed and not added and self.fieldname in ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RREPLACES', 'RCONFLICTS']:
                 depvera = bb.utils.explode_dep_versions2(self.oldvalue, sort=False)
                 depverb = bb.utils.explode_dep_versions2(self.newvalue, sort=False)
                 for i, j in zip(depvera.items(), depverb.items()):
-- 
2.7.4


