Return-Path: <wills.wang.open@gmail.com>
Received: from mail-oa0-f67.google.com (mail-oa0-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id 142CF612D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 12:12:51 +0000 (UTC)
Received: by mail-oa0-f67.google.com with SMTP id l10so1345058oag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 05:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TQZ6JZTMUX7EPRa5GOfQYBca7vCjYkbQ41AmFVSfNdM=;
	b=lV6Bf9oQhzv/pROJakxykkgOLMa5O+/mFcU7zyab6kPTYPBsA0NmGOHYqzFS0vF2Qu
	1EJcjQPNr8AR7VzSUGska3HSrd8DLgQd1qdFpsNuhWyCvR9F1PacJ0F16N9ox+tY7EfE
	G74thWxQm7aeB6aB5QLLVcrFdmcNabEO2K0upm/iibr//oSJuMMg4ZAarovlmxGbhBgH
	yrdE2uEvXs59VzQ6ureFjAAfSib0t5H6jvNwic29UiTI4QFi6Gj+uLAHCH5sYz3O+8mB
	zYryRUH7bQzw2pmsP/knRluPX4WF7Uhy1imh3BrV4HI6la2rEsaR2XmK6fusk5H358ED
	2fTQ==
MIME-Version: 1.0
X-Received: by 10.60.95.198 with SMTP id dm6mr6896009oeb.44.1372507971647;
	Sat, 29 Jun 2013 05:12:51 -0700 (PDT)
Received: by 10.60.144.39 with HTTP; Sat, 29 Jun 2013 05:12:51 -0700 (PDT)
In-Reply-To: <CAC6FaqyMxgZP4ODaZiACA8qPBCNRZUAg=UV_WufTqe1hZkdUdw@mail.gmail.com>
References: <CAC6FaqyMxgZP4ODaZiACA8qPBCNRZUAg=UV_WufTqe1hZkdUdw@mail.gmail.com>
Date: Sat, 29 Jun 2013 20:12:51 +0800
Message-ID: <CAC6FaqyHsqMPbvZa=gO4S8E+_ZyckNAvqe+X_O5cdJH5uYxexg@mail.gmail.com>
From: Wills Wang <wills.wang.open@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qt4e: override variables OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Sat, 29 Jun 2013 12:12:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

override variables OE_QMAKE_QT_CONFIG to compile Qt/Embedded apps

diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
index de2a68d..13b1050 100755
--- a/meta/classes/qt4e.bbclass
+++ b/meta/classes/qt4e.bbclass
@@ -9,6 +9,7 @@ QT_LIBINFIX = "E"
 # override variables set by qmake-base to compile Qt/Embedded apps
 #
 export QMAKESPEC =
"${STAGING_DATADIR}/${QT_DIR_NAME}/mkspecs/${TARGET_OS}-oe-g++"
+export OE_QMAKE_QT_CONFIG =
"${STAGING_DATADIR}/${QT_DIR_NAME}/mkspecs/qconfig.pri"
 export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/${QT_DIR_NAME}"
 export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
 export OE_QMAKE_LIBS_QT = "qt"

