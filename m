Received: from mail-bk0-f41.google.com ([209.85.214.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TvCdN-000754-AU
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 20:57:25 +0100
Received: by mail-bk0-f41.google.com with SMTP id jg9so301676bkc.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 11:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Otl+ObTisf9QWtTp7WNTnMDWb5rz8Ch848oqXEv42W4=;
	b=oij6rTF1L/XXh9yx/MfX6RPQcF31+cHCRsp1ZcZq8u7zhZoKdR1wPMfwjamApzut1P
	ZctU5je7n3gjWlqU3CmMUdCUNdR/xLmfBdEpqDNtWOd0yB8pPZizfy+pdufqg4bBB/Ec
	ej5TZZ5AZyN6CbL/5vOA8IemdwlXtX+wyz3+kRt183MqOKhoqkPBfKh0jpgSg28U7/93
	GJUv9KqBtr/RYf0UEigSExm4c6CAJXjjY7h+ZdydNIG5cYRaH6UAIB1DqHUZe0u8hRl6
	eoOd17OWsDEONCQ8NZT5XrHPtVhhAnFfcs6XYwa8pd19iu3i9HT+cglocwWAK3Tmwhi6
	YA8g==
X-Received: by 10.204.147.8 with SMTP id j8mr41749852bkv.105.1358278920661;
	Tue, 15 Jan 2013 11:42:00 -0800 (PST)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPS id f24sm13782424bkv.7.2013.01.15.11.41.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 11:41:59 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TvCOS-00060r-KI; Tue, 15 Jan 2013 21:41:56 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 21:41:54 +0200
Message-Id: <cover.1358278681.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/9] Fix license segment boundaries
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
X-List-Received-Date: Tue, 15 Jan 2013 19:57:26 -0000

Found that also "firstline" has been used in several recipes instead
of "beginline". This set fixes those.
It was impossible to fetch affected libidn version at all (for testing
the md5sum change) because of missing SRC checksums so fix for that is
included too.

The following changes since commit 6080d1dc719c38fd97c2abd38e0ad938fbf6f452:

  connman: fixed init script so connman can runs over nfs (2013-01-15 08:09:30 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/beginline
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/beginline

Marko Lindqvist (9):
  libidn: add checksums to version 0.6.14 recipe
  gzip: fix license segment md5sum boundary
  iptables: fix license segment md5sum boundary
  shadow: fix license segment md5sum boundary
  ethtool: fix license segment md5sum boundary
  gperf: fix license segment md5sum boundary
  libidn: fix license segment md5sum boundary
  dbus: fix license segment md5sum boundary
  apmd: fix license segment md5sum boundary

 meta/recipes-bsp/apmd/apmd_3.2.2-14.bb                |    2 +-
 meta/recipes-core/dbus/dbus-glib.inc                  |    2 +-
 meta/recipes-core/dbus/dbus-ptest_1.6.4.bb            |    2 +-
 meta/recipes-core/dbus/dbus.inc                       |    2 +-
 meta/recipes-extended/ethtool/ethtool_3.7.bb          |    2 +-
 meta/recipes-extended/gperf/gperf.inc                 |    2 +-
 meta/recipes-extended/gperf/gperf_3.0.3.bb            |    2 +-
 meta/recipes-extended/gzip/gzip.inc                   |    2 +-
 meta/recipes-extended/iptables/iptables_1.4.16.3.bb   |    2 +-
 meta/recipes-extended/libidn/libidn_0.6.14.bb         |    7 +++++--
 meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb |    2 +-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb        |    2 +-
 12 files changed, 16 insertions(+), 13 deletions(-)

-- 
1.7.10.4



