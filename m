Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QS5gW-0001Nv-D9
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 13:03:28 +0200
Received: by bwz5 with SMTP id 5so956522bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 04:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=YQaHNr2zL9MAKjLqhj3Bz9FPr2Bpr6I/jG76N2Jqej4=;
	b=R801CUmJm1z+4QV0L5fKqryx1+Q5ddRI9nJ58V8IWkJJiDXp+abw24QBXNpdZ+CnSy
	d+rRw7vqtuq8wlNEGTjX76oXHPia9l3RuDqkT/rFNtGFrAtP6stv9m1DCaHycXPuvqNN
	F8KZyvbLtGtgP3TYuS9IkRk1/JOAWQn2Axer8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MnSszdvo+bv5DeMknIJ6x+7uwYGfPEvgMv74tbFVTzuUuHtMQrBdYce4xoAjbwCNjl
	V54SPhk/WM6Z9/rgWlaIgXppWrg6i3RRJKCrGxgRXXbJCvJb8HN5SeEA+tymkvHh72aP
	0HZ+XLxNtFcdoPvJwco7aLuQJja1+VgR9ivGA=
Received: by 10.204.19.6 with SMTP id y6mr583248bka.159.1307012416439;
	Thu, 02 Jun 2011 04:00:16 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id ag6sm369557bkc.6.2011.06.02.04.00.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 04:00:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 13:00:06 +0200
Message-Id: <1307012406-11055-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <1307007513.27470.473.camel@rex>
References: <1307007513.27470.473.camel@rex>
Subject: [PATCH] gnutls: add --with-libdl-prefix and --with-libpthread-prefix
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
X-List-Received-Date: Thu, 02 Jun 2011 11:03:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 9f8d81b..03aed6a 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -22,6 +22,8 @@ inherit autotools binconfig pkgconfig gettext
 EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
               --with-libtasn1-prefix=${STAGING_DIR_HOST}${prefix} \
               --with-libgcrypt --with-libgcrypt-prefix=${STAGING_DIR_HOST}${prefix} \
+              --with-libdl-prefix=${STAGING_DIR_HOST}${prefix} \
+              --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
               --with-lzo --disable-guile \
               "
 do_configure_prepend() {
-- 
1.7.5.3



