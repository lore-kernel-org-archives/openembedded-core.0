Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QSDZa-0000Oq-De
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 21:28:50 +0200
Received: by yia28 with SMTP id 28so252189yia.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 12:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=zs6UZo9pEAaTptPM98upUxDluNYtzCj+9pb2tEk2q8Y=;
	b=IVuk9qwvHNan++1OFndENS77QMS5i68SgyxCWADrjsgxksTYtEhewCCG2z0UH7oBkd
	zv3DVp3UgtupZEXaEAez6lIcleBELd74D6Z0hJDu6vS5X7vjVVtnHGlTX8JQ2Up07r+C
	89oQ4Ck98DfoiIzLsf37wLj5sDya1k5NhV2Lw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=ll9Upz6Fl4LmfCAQdDl7RxgddBzAQxiOm/ppE/I58OE4ZFlRw5wMuHuYzMQk2PT4vc
	8zmjQwp0filRMS0Gmbr+D8cPw4Ulauu/Y6a46yTdezBzD3oFF/g3mOh7i8d0wKwFCw0c
	5AioPyvfnpYhd6k+BaZPGDEQ6xcSXlIEkuLwQ=
Received: by 10.236.155.41 with SMTP id i29mr1359527yhk.235.1307042738054;
	Thu, 02 Jun 2011 12:25:38 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o45sm689081yhk.63.2011.06.02.12.25.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 12:25:37 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 19:25:16 +0000
Message-Id: <55f131b01f5673b0307862416f234676c1c296d2.1307042670.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1307042670.git.otavio@ossystems.com.br>
References: <cover.1307042670.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1307042670.git.otavio@ossystems.com.br>
References: <cover.1307042670.git.otavio@ossystems.com.br>
Subject: [PATCH 3/4] gnutls: add p11tool into gnutls-bin
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
X-List-Received-Date: Thu, 02 Jun 2011 19:28:50 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-support/gnutls/gnutls.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 03aed6a..9257880 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -39,6 +39,7 @@ FILES_${PN}-bin = "${bindir}/gnutls-serv \
                    ${bindir}/gnutls-cli \
                    ${bindir}/srptool \
                    ${bindir}/psktool \
+                   ${bindir}/p11tool \
                    ${bindir}/certtool \
                    ${bindir}/gnutls-srpcrypt"
 
-- 
1.7.2.5



