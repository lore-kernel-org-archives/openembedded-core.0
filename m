Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHAOG-0003FZ-QX
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:23:44 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so4820551bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 01:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=n3nPoDuXXnscHblKQX6cd30HW8J8t9n9QdPcNfgtOXU=;
	b=r3prFD7k/ye9IQYYhI5n4hwnIG4H03eYiEgWneZwR8lq7g8lC0HiFXXM96EIncMv5E
	TchLJoAQoD6yLZEnJSFXdazI7ftL2cE8sdhVtXhZdGH6MwS+xGQjN6M489atvB7DcSX/
	J1jAQo8BudL7ORfOJisTAQFCeecCSQ1/bltv4=
Received: by 10.204.141.8 with SMTP id k8mr10150539bku.14.1319185073956;
	Fri, 21 Oct 2011 01:17:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w8sm12512819bks.11.2011.10.21.01.17.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 01:17:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 10:17:26 +0200
Message-Id: <9e9f9e73e7bfa4a5184196b874cfb1dfe179be24.1319184832.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
References: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319184832.git.Martin.Jansa@gmail.com>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/8] pulseaudio-0.9.23: force ARM mode
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
X-List-Received-Date: Fri, 21 Oct 2011 08:23:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pulseaudio/pulseaudio_0.9.23.bb                |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
index 4ac2418..2f872b8 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
@@ -23,3 +23,4 @@ do_compile_prepend() {
     cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
 }
 
+ARM_INSTRUCTION_SET = "arm"
-- 
1.7.7



