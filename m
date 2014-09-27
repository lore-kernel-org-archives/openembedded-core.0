Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC506DA74
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Sep 2014 07:22:33 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi2so2119943wib.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Sep 2014 00:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T1C14Llyjb2sHtbuA00+dcGpXve2KR6R1E304aeFXzs=;
	b=C+rjW5lzUFcGu2vKzOhPMy+MzLs6G6L1KNTO/xEoX6F/BCrPc03+p5opa5+8FOYDyc
	xREObAle0I5QudK5Vsl/6bdaC7ymVX9aDZI8C96oYXhwms25vZP2yFqjNp35LknAf/XV
	bwa5kgF38J+67FXh06SxYoIVho09gjDk61Sw0JHjwcmzdiszqs3pxy7laMJEZgIazG2w
	W5NMyKQVDsiElsY7Yy823PUYVJtLbGOKu13zE36E9V8/HgGGzzyTjMksApXhCpfD2qwf
	WQTrOqCHpMUn3/CrU/4zKNH5CPfoAaR1GqXeFooN46l/ky6LJ0PLzBa8U7nG9BlPU2M/
	Ofmg==
X-Gm-Message-State: ALoCoQkv6vfDFRC318cuY24r3TvdX1TZMlCG3mENp2y4TRkewe0uR+DOwb3JiOh6/xo6mbamM/2L
X-Received: by 10.194.110.135 with SMTP id ia7mr65500wjb.128.1411802554972;
	Sat, 27 Sep 2014 00:22:34 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id et1sm8584473wjd.11.2014.09.27.00.22.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 27 Sep 2014 00:22:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Sep 2014 09:22:25 +0200
Message-Id: <1411802545-17081-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1411802545-17081-1-git-send-email-koen@dominion.thruhere.net>
References: <1411802545-17081-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] systemd 216: add system user factory files to CONFFILES
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
X-List-Received-Date: Sat, 27 Sep 2014 07:22:34 -0000

These generate passwd and group files, so keeping user changes is very
important.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/systemd/systemd_216.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 3e572e8..97af897 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -220,7 +220,10 @@ RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
 CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
                 ${sysconfdir}/systemd/logind.conf \
                 ${sysconfdir}/systemd/system.conf \
-                ${sysconfdir}/systemd/user.conf"
+                ${sysconfdir}/systemd/user.conf \
+                ${libdir}/sysusers.d/systemd.conf \
+                ${libdir}/sysusers.d/basic.conf \
+                "
 
 FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/bash-completion \
-- 
1.9.0


