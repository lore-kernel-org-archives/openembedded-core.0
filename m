Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 68D1B60974
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 22:30:10 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id o10so5105596lbi.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 15:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mvtFbP/Gm/G7imZc6pOgH/ey4QUzHfvsjeIGaOOiCtU=;
	b=p9oYAbVjf0fqZGEv/eWy8q/ty3AdTGW7U96wDpViX3URi9lvgT71QQF+FofcQNpP0n
	VnyOgVSOzVTHNMZy5UM5+U+AsnXc8db8IgqkOqZ90iGNr4+ZBC+AHauTzDJgqaiQVGNS
	/uj5N6BjuhmKF6yssvlSwJmXdQnD9MRZO6VXsqncTM36mPU6ZreU7pyJypTd65xmX6n+
	JK9sXPHvqr1SVKGt01EdRAf2eNLBt74tEyYxQ3KZ0raNBjH1cUIY9xla1R3xJX7V8J+Q
	mzd/XvaS2vMm4PPxmpBjtl5xnue8AvpFBRbZ+aIIiSLgfiNPEG8lVIZaifQW23q8nVr4
	mKVA==
X-Received: by 10.112.181.38 with SMTP id dt6mr9881551lbc.3.1369434610251;
	Fri, 24 May 2013 15:30:10 -0700 (PDT)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPSA id rr7sm2403455lbb.0.2013.05.24.15.30.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 24 May 2013 15:30:09 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Ug0Ux-0000XO-5x; Sat, 25 May 2013 01:30:07 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 May 2013 01:30:05 +0300
Message-Id: <cover.1369434403.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] pkg-config obsolete automake macro fix
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
X-List-Received-Date: Fri, 24 May 2013 22:30:10 -0000

glib tree included in pkg-config distribution uses AM_PROG_CC_STDC
that is deprecated at best. It will be obsolete, and give error, in
future automake versions, as well as with automake 1.13.0 and 1.13.1.

The following changes since commit 8f5bc47729edb8cb051d81e9ff1680cb8d2eca25:

  dropbear: a fix for hang in dropbearkey, built for x32 (2013-05-24 14:14:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/misc

Marko Lindqvist (1):
  pkg-config: remove obsolete AM_PROG_CC_STDC

 .../pkgconfig-0.28/obsolete_automake_macros.patch      |   16 ++++++++++++++++
 meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb      |    1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.28/obsolete_automake_macros.patch

-- 
1.7.10.4


