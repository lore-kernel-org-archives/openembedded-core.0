Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4CE7678953
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 16:20:16 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id y207-v6so23147285oie.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 09:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Vv3wa6v0rA18v+UYKMG5rfEqHviLgErQc39g+qY7+/c=;
	b=DBsYYYVI0vS54LEMYr5QI8nJMpQEasZtHFMXYGAnWjrncxAQdDD3KSt7GUyFIRo3pR
	RXfJfRHn1iJQ3uYZR2RC4muP3/g3MXzMHV2t2v61+d+W3QCtiUCheGSh9GS/DdbWDzIN
	OSjUn0ehu9YW5UXlEXZZwC9DjQAoSCQCEeaGG3wmMDja7KLzCrkA1PTGf8H6zefGs8pn
	MlgKtvi3ZbmT0LJJlxKWUhDGqEaLQPIJfF66qNEgynIEmiSIItwOkx+/orZeG2GqdbcY
	DRtv3COfpObtUT1KIZrSsfpTxp6qKgE85nkcqiuTK4mluLemjK9yHuuO00LKI6JvOiEl
	EOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Vv3wa6v0rA18v+UYKMG5rfEqHviLgErQc39g+qY7+/c=;
	b=Q6pIk7/2bl3BzMuk5e4k0+qVYBbi9IMW5HrdOtt3z+ITEPFnXkiCeF1X+3ZkmTsY6e
	a91Ri2xafHYsgjZIv+4W/vNvCjezpdeAaUOcgsOi844FhMKOZOSEB8BsiAtMdQFksI0z
	3+sfu4fn5U0FWkSE+9Bc70CEr3PTd2oEXEZrypDi2Ol2oeWyMKSkepHXXxDoGkPYWcQ3
	waMnkjbXxn5j2X+PQkAxUz6WNZuveRmugNd3miEN/5Fn8b1c9pyjrFqvgQu3VbVg5ANE
	qMgYqBdA7k3ApB9iY5q5qmeF7BH9sZFzBxs5IQbElVgwPidfuTHLkemf9tcUuv2lfAQW
	aJYA==
X-Gm-Message-State: AOUpUlFmmKqViAoftkpxu98mEF05yjpjr/Zn02BXomN2x2R2x2keUsy6
	tPN5yJKgUJAZoKhN9WJyFhw=
X-Google-Smtp-Source: AAOMgpfZsLTmOR5ufgGcoPh2ZtMLigsTS0Rtgl6duyR/b1wjwb+uYtr14sRjAH8DLJ0lxTWkYIr/nA==
X-Received: by 2002:aca:bb04:: with SMTP id
	l4-v6mr16037182oif.42.1533572417190; 
	Mon, 06 Aug 2018 09:20:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	p132-v6sm11896374oia.31.2018.08.06.09.20.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 09:20:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 09:20:07 -0700
Message-Id: <1533572407-3066-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
References: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 8/8] linux-yocto-tiny/4.9: update to 4.9.113
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
X-List-Received-Date: Mon, 06 Aug 2018 16:20:16 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 4d46802..78b2a96 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.82"
+LINUX_VERSION ?= "4.9.113"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "eb3b2079ea43b451e06be443f8bc146736f9c4bc"
-SRCREV_meta ?= "0774eacea2a7d3a150594533b8c80d0c0bfdfded"
+SRCREV_machine ?= "1b742cf55fc29d0ffc9d651520ad7d59145bbc07"
+SRCREV_meta ?= "5e993963afb54bdc82a02077c29ecdbc0b12368e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.7.4


