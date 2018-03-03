Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 72FD178A61
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 16:34:55 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y186so5354366pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 08:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ulr5SvS8UNA4JsY8GsR9vG9j0gk5AAdVJ5w/+wMOQac=;
	b=oyFhON0I3g0EQXhSSiWns/j9I06q/fYQznDVzo+qOD4AHif9vQQ/dzy9+W2YjsQVjl
	4/M+08kT8mddM0L1RVZ/5ACFEJdJNX6OK0rlv0/T/4DhG3mDeWpcZHp9L68u6DM4Bte2
	/SKKZNytCagl8QP1TsDzAzUhfn7xRObkK9mUByB/rGVTfpUqzZzaiup7m4JdCVduZcc5
	DWfS5ldcLkO3Xq37Zhs0J0jHCLM8teSeuUKo4kJL7JhmMGuCVKQST1puGswsVs+Ye6S7
	qJijJ3isk7FmTgF50GsX774Rsoc+yVFdvV+V4MoGG2RXmZGJAjcb/ousOSlITRjEnqp+
	U5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ulr5SvS8UNA4JsY8GsR9vG9j0gk5AAdVJ5w/+wMOQac=;
	b=QRQ7ZJcH9Ys1LutXwYtiqIJtCV8IgSaELVxkNt5wwCd7hErfXmPD71tpph54X5SWGA
	eC+HZ/yyexQxlASb+ESgg9h+wwRrD6JTs+Vuy+bu35lOw0v0OUoUX8HQ9gSMB7Kw1Q6P
	EPG2fi6nbLaEsK/VTxJb1Rv5dC61iYRdcf8EXNkCaKW2tPbyjrl7gSzEVydFNj6s6ZOG
	TEg/qIADbnItZ053IHCzTRFbNaag1Msa+tJX+Epl0cn0nTzcFCll6O3MG4JBrD2dHowA
	LzCROONtFhlKZIcE9onqH7HhJ+tOmbBIS1RVsWjoA6OI6fRW79NcSQQF6Nf+1avmALxY
	IYiA==
X-Gm-Message-State: APf1xPDACmOSiJyJ1jwxJ5YCC/53li7z3bIA3xv60uBhOmo9fr19lrd0
	F+tG5/EIXqdZXwrvBWBKfuj5HA==
X-Google-Smtp-Source: AG47ELtSuqOfVkq0OaYuqunj/VOPaYhIWKx43sOACnCweq44i6D9x6v+dFqeacNcdHXjFyKAdgkS2A==
X-Received: by 10.99.159.10 with SMTP id g10mr7547545pge.407.1520094896334;
	Sat, 03 Mar 2018 08:34:56 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a6sm17276352pfi.22.2018.03.03.08.34.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Mar 2018 08:34:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2018 08:34:37 -0800
Message-Id: <20180303163437.8684-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180303163437.8684-1-raj.khem@gmail.com>
References: <20180303163437.8684-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] godep.bbclass: Add helper class to enable go-dep tool
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
X-List-Received-Date: Sat, 03 Mar 2018 16:34:55 -0000

Many go packages can take advantage of dep tool since
they manage their own dependencies, this class helps
in using go dep tool for such packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/godep.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta/classes/godep.bbclass

diff --git a/meta/classes/godep.bbclass b/meta/classes/godep.bbclass
new file mode 100644
index 0000000000..c82401c313
--- /dev/null
+++ b/meta/classes/godep.bbclass
@@ -0,0 +1,8 @@
+DEPENDS_append = " go-dep-native"
+
+do_compile_prepend() {
+    rm -f ${WORKDIR}/build/src/${GO_IMPORT}/Gopkg.toml
+    rm -f ${WORKDIR}/build/src/${GO_IMPORT}/Gopkg.lock
+    ( cd ${WORKDIR}/build/src/${GO_IMPORT} && dep init && dep ensure )
+}
+
-- 
2.16.2


