Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SsN5T-0004gQ-4s
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 01:58:23 +0200
Received: by obcva7 with SMTP id va7so5510458obc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=jK1wJUkEJilU9Rw+nxhnCCfsL+vHd+twCCfB90A8OeY=;
	b=qwO6a4BFouOJ/PxGjuV7hWgIXorxPk897ZCIjyTODOgLKe6oKW9lmXz0aRxO/qz6KO
	UvKEQ+D4g0c+jFQX/B+Vk+fzvXQpNYVEoRXQUSQXFFwXYFsZoKOQUu3r9QqvshVwcgIM
	TKqg+B39HPyPSQJis7tak3OqnERuMXdg7iKkrKfgNFHbkTbj8znAyG81bfQ6OhHmK+uS
	SIaksi01AoVxJ/snBhDZQbdNXzN4Qop5GjsgrR9Apks3RQ6TDK4wJh1SRgScs2MO/SvC
	4uXIQv0r0S4devBvTCBn597sAkcucEW2faiNWmKaE2sNP8AYzf0FhNC5wT7YGk6NiiwF
	2foA==
Received: by 10.182.222.39 with SMTP id qj7mr9546116obc.16.1342828018543;
	Fri, 20 Jul 2012 16:46:58 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id i5sm3448352oei.4.2012.07.20.16.46.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 16:46:57 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 16:46:38 -0700
Message-Id: <cover.1342827927.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] A few random pending fixes
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
X-List-Received-Date: Fri, 20 Jul 2012 23:58:23 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit ef637e417ae1c2dff7fc0ad6cb30989e72ac35ab:

  grub-efi-native: remove help2man dependency (2012-07-20 12:32:13 +0100)

are available in the git repository at:

  git://github.com/kergoth/oe-core.git misc

Christopher Larson (3):
  bluez4: use PACKAGECONFIG to control 'pie'
  initscripts: don't bg mk_dirs in populate-volatile
  libpcap: fix pcap-config to not return -Wl,-rpath

 meta/recipes-connectivity/bluez/bluez4.inc         |    6 +++++-
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    2 +-
 meta/recipes-connectivity/libpcap/libpcap.inc      |    3 ++-
 .../initscripts-1.0/populate-volatile.sh           |    4 ++--
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 5 files changed, 11 insertions(+), 6 deletions(-)

-- 
1.7.9.5



