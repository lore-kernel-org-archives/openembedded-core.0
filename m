Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UOrpY-0004RE-C9
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Apr 2013 17:48:36 +0200
Received: by mail-da0-f51.google.com with SMTP id g27so2239787dan.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2013 08:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=J06j44nSFlopdwTTs/RbzQs4G84NrBJOYklm1lNqg8Y=;
	b=IlFmgJy6GTC0TNO4DbT1GhGF29kY3XtgfMLL4i0s1soqY0lQF2Gzin04pqGgWr8e+1
	hFeLWwRYig6iQtDSjs8YtEYWhtLspDcoKdpAMdUaKwoCUkO6knCF1xeh4pOdON1/T22b
	5pF0skAr2c4g+UJaN8cgja5cis62Wb9FvePPfFbL2jWFLQjJJvPsBOiNYhtJG/I440U6
	LfYw/smsAD6skSoUhBZmEgEPXDfoJkQo2PCEVNwhvKlMYRTHon9koCS+dwZhMB1nwNuc
	9GONVbBp6r+siNpqauFDJENjjDX+26obwo3NZJhxmYVyysl5LVmRCyWbb+SWpy+Iw9Cw
	K75A==
X-Received: by 10.66.220.197 with SMTP id py5mr29213929pac.86.1365348672139;
	Sun, 07 Apr 2013 08:31:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ve7sm30660967pab.11.2013.04.07.08.31.09
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 07 Apr 2013 08:31:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Apr 2013 17:30:59 +0200
Message-Id: <1365348659-31566-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] layer.conf: add systemd-serialgetty to SIGGEN_EXCLUDERECIPES_ABISAFE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Apr 2013 15:48:36 -0000

* it was imported from meta-systemd without SIGGEN_EXCLUDERECIPES_ABISAFE
  change

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 81f1071..23ef09a 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -31,4 +31,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   keymaps \
   udev-extraconf \
   packagegroup-x11-xserver \
+  systemd-serialgetty \
 "
-- 
1.8.1.5



