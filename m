Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QSDZb-0000Oj-QR
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 21:28:53 +0200
Received: by gyf1 with SMTP id 1so518094gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 12:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=GhWFj1FG3hUX0DF+kxGNSQJJKzgMWPxqcwCMww514YA=;
	b=sCjg1GhJ2Pr5ZZ9h20zh4VaBH8GEgyf0ePwf5PdEVcZWwDOPyJaRyselb+JC0zHXCF
	n4B2QVwnSEqhTRgXmM0XbDWaaLWaOcfAGeG2ESq7TQi639i23z9g8kNbopP0ZGBUpt5Y
	VLu/KgBQSSNPtuvM9cXpq07mCy771jUR8F3bw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=a0lBBMw9g8FksZbLCR6wynfxTWnVc4qZBWc29PPdWxS4/BWK3m6tzuuK/H7JX+5hZs
	dtoDlLq3y11wvtDDzaOic0dU6GTB5xJC7N+igi3IX9/EQK7qUHKMarfDSdJx8zamMoFj
	v7oWTePnIVmQkatLrilEgHkjdojmSfRAFLhyo=
Received: by 10.236.78.106 with SMTP id f70mr1319042yhe.266.1307042735583;
	Thu, 02 Jun 2011 12:25:35 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o45sm689081yhk.63.2011.06.02.12.25.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 12:25:34 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 19:25:15 +0000
Message-Id: <50d59eab3df2a383c2eae71e075ca5c4d5e63f3a.1307042670.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1307042670.git.otavio@ossystems.com.br>
References: <cover.1307042670.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1307042670.git.otavio@ossystems.com.br>
References: <cover.1307042670.git.otavio@ossystems.com.br>
Subject: [PATCH 2/4] gnutls: use INC_PR on 2.12.5 version recipe
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
X-List-Received-Date: Thu, 02 Jun 2011 19:28:53 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-support/gnutls/gnutls_2.12.5.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls_2.12.5.bb b/meta/recipes-support/gnutls/gnutls_2.12.5.bb
index b27a065..9d3f5ab 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.5.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.5.bb
@@ -1,6 +1,6 @@
 require gnutls.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://gnutls-openssl.patch \
             file://configure-fix.patch"
-- 
1.7.2.5



