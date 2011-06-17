Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QXaSc-0004YP-Gb
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 16:55:51 +0200
Received: by mail-yw0-f47.google.com with SMTP id 12so857481ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 07:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=Sxloq7pnJcdtx9chKK/jBL3Y/pqT5B24QvQ5QLHnmmc=;
	b=xGJCUdLnGpZDMjZHERaJtAcxoeaafLdtCapxDoiyLpY19UOSSYKLJlmglkzFYe0Fzp
	jbqQZJ5D5cdoGWUqN2s/ONTMLVYDDCQPQNYpIAHi07le0i9o8NEaOuB0oLMkGvnWInN9
	92GIaZBM3Ejh08iXaLt0M9gPXo6uB0GozIp+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=FEJW75PC+xujVtF8MgDgLTuc7yGfVS5NUUPB0wwnfLZW+IynsC8K9gmRK90CyEQo9j
	1Uj2sIPpstcpCcyNyKR30rgWNZcD14S79Pby7tvsyvn2KgrpUTHYNCb4Hr1176QcuwMh
	IlXGlEBnGX9QIpuaGY2pBBikhnBQxTm67dJLg=
Received: by 10.236.135.97 with SMTP id t61mr3584360yhi.91.1308322343846;
	Fri, 17 Jun 2011 07:52:23 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id k10sm1754092yhj.50.2011.06.17.07.52.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2011 07:52:22 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2011 14:51:40 +0000
Message-Id: <ee06cfaded572de28fc9dfa513420e68d100b9ae.1308322247.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1308322247.git.otavio@ossystems.com.br>
References: <cover.1308322247.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1308322247.git.otavio@ossystems.com.br>
References: <cover.1308322247.git.otavio@ossystems.com.br>
Subject: [PATCH 6/9] lib_package.bbclass: move static libraries to ${PN}-staticdev
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
X-List-Received-Date: Fri, 17 Jun 2011 14:55:51 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/lib_package.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/lib_package.bbclass b/meta/classes/lib_package.bbclass
index 82c9370..5ce8727 100644
--- a/meta/classes/lib_package.bbclass
+++ b/meta/classes/lib_package.bbclass
@@ -5,6 +5,6 @@ FILES_${PN} = "${libexecdir} ${libdir}/lib*${SOLIBS} \
 	    ${base_libdir}/*${SOLIBS} \
 	    ${datadir}/${PN} ${libdir}/${PN}"
 FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
-		${libdir}/*.a ${libdir}/pkgconfig /lib/*.a /lib/*.o \
+		${libdir}/*.o ${libdir}/pkgconfig /lib/*.o \
 		${datadir}/aclocal ${bindir}/*-config"
 FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"
-- 
1.7.2.5



