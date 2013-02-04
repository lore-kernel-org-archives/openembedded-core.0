Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.spam.filter@gmail.com>) id 1U2O6b-0005h9-RF
	for openembedded-core@openembedded.org; Mon, 04 Feb 2013 16:37:15 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so3314273eek.4
	for <openembedded-core@openembedded.org>;
	Mon, 04 Feb 2013 07:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=DnYGwhNeyZ5iyjnANpd6xaGRN1Z0Fl0ZAIrLxdEHVNs=;
	b=VIfPXFtiWGfwyVY3WqJV7B7zKJzoTDuJHsRz04mQqYHzXxJgPOk9t3K78Ha4rdhQrD
	Utf1I9RMbfxdSGALlFJ1LgCtBk8ZzaCV3PpvkF8S56WWdnp3BEWhC2WKNwRlPUhBPxX1
	r4680VMsCdCWjxdml8CGf47FsuYSWsr+qiCX/Q5CQDKrh8sGs5QPtwkRow0Jn72px4fq
	7d9TYjghXwpODbesy/LbzIUBUuIY3WhkZjqsIsXozMgu1QZZoTbHuAzr4Zwubw1Ap4/L
	9OI/J+eD8JDWftIJPgri+5o4iAAuPD0WV+Uh7Mr8rENXbOO+9wyel51b/SATQ5NwywJm
	uJ8g==
MIME-Version: 1.0
X-Received: by 10.14.176.133 with SMTP id b5mr58085186eem.37.1359991285751;
	Mon, 04 Feb 2013 07:21:25 -0800 (PST)
Received: by 10.14.45.11 with HTTP; Mon, 4 Feb 2013 07:21:25 -0800 (PST)
In-Reply-To: <CAFG9TD453=c9GNrhCUUEYOAJ5g8z8DcOW4LkTgbnd98EXoiLjw@mail.gmail.com>
References: <CAFG9TD453=c9GNrhCUUEYOAJ5g8z8DcOW4LkTgbnd98EXoiLjw@mail.gmail.com>
Date: Mon, 4 Feb 2013 10:21:25 -0500
Message-ID: <CAFG9TD42wer3mQib+s9PDeeG3d=_71pf2c=tcT2udn9+-WPZnQ@mail.gmail.com>
From: Andy Dalton <a.spam.filter@gmail.com>
To: openembedded-core@openembedded.org
Subject: [PATCH] Update SRC_URI to point to new file location.
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
X-List-Received-Date: Mon, 04 Feb 2013 15:37:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

From acc4b1f597013f6bbcc1125adbd3d0119cff048f Mon Sep 17 00:00:00 2001

The existing SRC_URI pointed to a Gentoo developer's private web
space.  It appears that that developer has retired and that his web
space is no longer active.  I've updated the SRC_URI to point to a
location where the file can now be found.

Signed-off-by: Andy Dalton <a.spam.filter@gmail.com>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index ce1fe7a..3c77f25 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -9,7 +9,7 @@ DEPENDS = "virtual/kernel"
 RRECOMMENDS_${PN} = "kernel-module-uvesafb"
 PR = "r1"

-SRC_URI = "http://dev.gentoo.org/~spock/projects/uvesafb/archive/v86d-${PV}.tar.bz2
\
+SRC_URI = "http://distfiles.gentoo.org/distfiles/${P}.tar.bz2 \
            file://fbsetup \
            file://ar-from-env.patch"

--
1.7.10.4


