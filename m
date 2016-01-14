Return-Path: <george.mccollister@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0A21C607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:58:43 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id ik10so20906237igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5HInMjXNjgaUU+c8qWQ7Ei37UHl1GkGrg2gdqAqR66U=;
	b=tmN1ySykyWoCFV2RYQYNfKIvrCUc59gqpm/78iHTMZS70i4ZnFapEAR/ImvGuWiyJy
	HwPBjzDzAzGdL3A3Y/xPNhUTEMN++EtlIXnAheovAvzBbFMNsOEYAUURwxDLDKvXFK1C
	w5bE4JfQDE4D8g0NESM5mrhsbb0DihWkkJ2bt88x+bE7vZyL4BP2bBUGrNqVNZ1lZdXp
	PU3Czja1/yVTDnhwJzsXFa/mhGKFkzvqg9k+Ex1MFpsAuRQbXHQAKGsTW5v+DMC2krDw
	XmtvHzMs8GzijzH3rLM3cXsRUpF5Q/Tk/DGjUB5OjEMEHEhSJ7cTiM81EpaMlsafXj4u
	onrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5HInMjXNjgaUU+c8qWQ7Ei37UHl1GkGrg2gdqAqR66U=;
	b=foZaGfdVOlkOwBXpQ4KK7BKcjwN5riYooUI/4EwZoH0z91KVS82zFsR3+Y2vayMYLV
	9SigG8GR8dX5oUtf55pxS9BJKBs+xnX1wJOb6G8bx+6xKTL/tql3l6/+7k3OhSgvntnG
	20eqjVXzpr7dH5L8Qh4m8ZIfqVZezeEyUWpOOOx6b34gfIsRp1ndoOhglX2ylyUzrYBg
	9Y/09mHdj8oxQtfUKkgSCcCUshXC/FcIeDt7z79QF4EmfXL18bBgX56WW5enpiIrNQEt
	bK5Fdbx8SsBpV7GOYP0w3jTKL5HScieoCQ5QQy5PxiAnaHwHZk3TtE8JudgaTR53Tcco
	52wA==
X-Gm-Message-State: ALoCoQmh9WvRP9n9MgYBDg0ReKSv2IvB6GpaVwR+9vZ0vweVTdERhb/MFsUC2rlIvOk+/cELXreJ30r4eRxjRC1KQgELjBM3VA==
X-Received: by 10.50.161.8 with SMTP id xo8mr30113870igb.27.1452805124873;
	Thu, 14 Jan 2016 12:58:44 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	204sm3203278iob.44.2016.01.14.12.58.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 12:58:44 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:56:36 -0600
Message-Id: <1452804997-20926-9-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
References: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
Subject: [RFC][PATCH 8/9] kmod: use bash-completion.bbclass
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
X-List-Received-Date: Thu, 14 Jan 2016 20:58:44 -0000

Use bash-completion.bbclass to package bash completions.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index e0bb95c..69185b2 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -39,7 +39,7 @@ do_compile_prepend() {
             sed -i 's/ac_pwd=/#ac_pwd=/' config.status ; sed -i "/#ac_pwd=/a\ac_pwd='.'" config.status
 }
 
-inherit update-alternatives
+inherit update-alternatives bash-completion
 
 ALTERNATIVE_PRIORITY = "60"
 
@@ -56,8 +56,7 @@ ALTERNATIVE_TARGET[lsmod] = "${base_bindir}/lsmod.${BPN}"
 
 ALTERNATIVE_LINK_NAME[depmod] = "${base_sbindir}/depmod"
 
-PACKAGES =+ "libkmod ${PN}-bash-completion"
+PACKAGES =+ "libkmod"
 
 FILES_libkmod = "${base_libdir}/libkmod*${SOLIBS} ${libdir}/libkmod*${SOLIBS}"
 FILES_${PN} += "${base_libdir}/depmod.d ${base_libdir}/modprobe.d"
-FILES_${PN}-bash-completion = "${datadir}/bash-completion"
-- 
2.4.5


