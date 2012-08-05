Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Lo-0007ds-PV
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:47 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1373222wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=exHWUqajbf/CjUrHWMJC4LL5kPgyFVYI4QK8CjIlJQk=;
	b=W9q36OsyuhQj/5VBuhjcD/+KHEdYElKlXaFM/XJGnAdHSWPhGQshtjj4I6aKZUSjGU
	IuABaM6PHLhSTOrNGWIR+muUopYhQjBecbIvJwrhSM5o9ZOd0tWM6KvAns527iGL8QFs
	uRSHtkWB7KbhjZy8ewNfZgQeMPHC1c8mX4HCoY40RHPidpwPPhfhFzhpi4dH8zEZ4KRP
	j+Gx621bpMbxDXc0kUkDimtgx7Bgt9Q7+WaCo7af4VisuLOK+CL5JIQBtXKL+gVOoWSG
	yIQ2JVw6rG9qG9nf+rszlGncmZQh6FDukhZQSXXlzasFyPqGgi0v5/N3j2NtAJv9DMCL
	bGXA==
Received: by 10.180.81.66 with SMTP id y2mr11420797wix.22.1344182103606;
	Sun, 05 Aug 2012 08:55:03 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:02 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:53:58 +0200
Message-Id: <1344182057-15981-12-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlOBKkHfftSJ0MCUdf1A1L66S6A2SxBM2PSfwFE2dmPexJM3OwSFmI4cCLF44EpZ/lNEJcK
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/30] lsb: use ${base_bindir} instead of /bin for packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 16:06:47 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/lsb/lsb_1.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_1.4.bb
index 15dbeaa..5734c5c 100644
--- a/meta/recipes-extended/lsb/lsb_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb_1.4.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/lsb-release-${PV}"
 
 do_install(){
 	oe_runmake install prefix=${D}  mandir=${D}/${datadir}/man/ DESTDIR=${D} 
-	mkdir -p ${D}/bin
+	mkdir -p ${D}${base_bindir}
 	mkdir -p ${D}/${baselib}
 	mkdir -p ${D}/etc/lsb-release.d
 	echo -n "LSB_VERSION=\"core-4.1-noarch:" > ${D}/etc/lsb-release
-- 
1.7.7.6



