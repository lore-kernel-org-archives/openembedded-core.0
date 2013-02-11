Received: from mail-bk0-f45.google.com ([209.85.214.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1U4kxi-00070g-K3
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 05:26:06 +0100
Received: by mail-bk0-f45.google.com with SMTP id i18so2432278bkv.18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2013 20:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=m6CAW7Nmlik7jzJ3nwMNUvw+9Whgmeb+v3+ONiWrkQo=;
	b=zfqRB9f6Md/SYZqq9kb0FYs9PXyq/hJEmT9rlCwqli1sH54IoD75kLiKmwcB+vqljc
	GdZMdYr7ANiy32j5lRJNhTfifEY7jeNkeGNddQ01+laSQxbyIOaX4/ek2Oi0YByT4qGw
	4IWhGljps4zIqz1Xy1Eh2nn67SovMm+ziKzEKcJ0iOgsNi5tJau2ga+eSMYeMyi1PxKs
	KfQ/N1TDRCv0RxeN4Be723AdqXKwg4jhp+KHza2rNLlUxhrHNmq6/YLSuVdbIPIF13QY
	/0jwiEsYOWcJ613MoZEc1lzW3ZU+CcC3XnqMW9RkfGVA8Yz5C+C3ifKRRbH6pqoziiW2
	12dA==
X-Received: by 10.204.146.22 with SMTP id f22mr3633640bkv.120.1360555793025;
	Sun, 10 Feb 2013 20:09:53 -0800 (PST)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPS id r17sm12680472bkw.21.2013.02.10.20.09.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 10 Feb 2013 20:09:52 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1U4kiD-0007uv-0R; Mon, 11 Feb 2013 06:09:49 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 06:09:46 +0200
Message-Id: <cover.1360555540.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/6] automake-1.13 fixes (batch 5)
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
X-List-Received-Date: Mon, 11 Feb 2013 04:26:10 -0000

I'm now using automake-1.13 patched so that AM_CONFIG_HEADER is
supported. There's no longer patches that merely replace AM_CONFIG_HEADER
with AC_CONFIG_HEADERS, though I've done that as part of these patches
when ever applicable.

 - ML

The following changes since commit adfa83bfa1ccb52b1a5d086aff36fe27271d0e59:

  dbus-native: Don't install dbus-launch (2013-02-08 14:46:13 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/am13
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/am13

Marko Lindqvist (6):
  libevent: fix build with automake-1.13
  texinfo: remove help2man dependency
  libidn: remove help2man dependency
  systemtap: replace obsolete automake macros with working ones
  diffutils: replace obsolete automake macros with working ones
  gamin: replace obsolete automake macros with working ones

 .../diffutils-3.2/obsolete_automake_macros.patch   |   14 ++++
 meta/recipes-extended/diffutils/diffutils_3.2.bb   |    6 +-
 .../gamin-0.1.10/obsolete_automake_macros.patch    |   23 ++++++
 meta/recipes-extended/gamin/gamin_0.1.10.bb        |    6 +-
 .../libidn/libidn/dont-depend-on-help2man.patch    |   23 ++++++
 meta/recipes-extended/libidn/libidn_1.26.bb        |    6 +-
 .../texinfo-4.13a/dont-depend-on-help2man.patch    |   79 ++++++++++++++++++++
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    3 +-
 .../systemtap/obsolete_automake_macros.patch       |   27 +++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 .../libevent/libevent-2.0.21/disable_tests.patch   |   15 ++++
 .../libevent-2.0.21/obsolete_automake_macros.patch |   15 ++++
 meta/recipes-support/libevent/libevent_2.0.21.bb   |    7 +-
 14 files changed, 217 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-extended/gamin/gamin-0.1.10/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/dont-depend-on-help2man.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/libevent/libevent-2.0.21/disable_tests.patch
 create mode 100644 meta/recipes-support/libevent/libevent-2.0.21/obsolete_automake_macros.patch

-- 
1.7.10.4



