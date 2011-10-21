Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHAO2-0003FZ-3M
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:23:30 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so4820551bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 01:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=pDVbOtrMOSnmmyXY0luBYi1FgPtogD+71uXg/ohfmak=;
	b=rX3bYoVIkrM1DkAFJ703UhuVpoaXpNA9B7keIw3lRdul4CNsyRAqvqsHZe9D+bkNwe
	jSgyHJBxSPQsgXE4H4+tqRwuWCXyVhYA1nzf2m02fw7PE6Y7o+tO/eKpuxOsfns9C+8b
	w0d6uAAP3vYSUJDNLWtZPG+o7X+quh4tNXgO4=
Received: by 10.204.8.24 with SMTP id f24mr9908228bkf.6.1319185059179;
	Fri, 21 Oct 2011 01:17:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a27sm12518940bku.9.2011.10.21.01.17.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 01:17:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 10:17:24 +0200
Message-Id: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1319184832.git.Martin.Jansa@gmail.com>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/8] pulseaudio-0.9.23: inherit perlnative to work around build on host without XML/Parser.pm
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
X-List-Received-Date: Fri, 21 Oct 2011 08:23:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
index 33f5e15..4ac2418 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
@@ -4,7 +4,7 @@ PR = "r5"
 
 DEPENDS += "gdbm speex"
 
-inherit gettext
+inherit gettext perlnative
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.gz \
   file://buildfix.patch \
-- 
1.7.7



