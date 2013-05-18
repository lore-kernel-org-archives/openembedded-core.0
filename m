Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Udd0z-0006Rt-0M
	for openembedded-core@lists.openembedded.org;
	Sat, 18 May 2013 11:01:25 +0200
Received: by mail-ea0-f179.google.com with SMTP id z16so2924627ead.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2013 01:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=P9Zp8vV+hWMbYguFO8fGZRL4NR5L0FZn95kcD0kJpgY=;
	b=FRC8ASXnahUUawwIRbZ0BBpLpnlwEJIWEsR0MMkfOsXpi7aDPe1wtkb6LYHO3tERga
	nSHUzxbkIst2lcFx3xdOUlPA+n2WC4hcUiAzaUdrR8UFu6rN89krcM/6szSicb8RUU6n
	u7YDLnx5B7mazDbkOAkGiazg2GBraObnl6vDMgXJPbHNaWGXj8R0/p9ubnycx7an3hie
	xZ2uTSq+XwHSg76llavIjSkrVtmoVJil5wRxvQTZSOBCDHOORMGV9YEZeFayeHj5eGGj
	iqY3ho4SX0pCSyk7dl2XNdkyPzLTCB1VljF6v5HOWwKjirLHd2rhrPn6pqgFO5JarTH3
	dYvQ==
X-Received: by 10.14.179.133 with SMTP id h5mr139877196eem.34.1368866584345;
	Sat, 18 May 2013 01:43:04 -0700 (PDT)
Received: from localhost.localdomain (p4FDF11F2.dip0.t-ipconnect.de.
	[79.223.17.242])
	by mx.google.com with ESMTPSA id t9sm24534586eeo.11.2013.05.18.01.43.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 18 May 2013 01:43:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2013 10:42:51 +0200
Message-Id: <1368866573-18112-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH/V2 0/2] glib-updates
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
X-List-Received-Date: Sat, 18 May 2013 09:01:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since I have done all my tests with meta-oe I prefer to update to 2.36.2 

V1->V2: rebase to current master

The following changes since commit ae28ee3f7a060b9e0d13154a84f2444a98490b5b:

  python-pygobject-native: fix build dependency on python-native (2013-05-17 09:38:39 +0300)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/oe-core.git glib-update

Andreas Müller (2):
      glib-2.0: update to 2.36.2
      glib-networking: update to 2.36.2

 .../{glib-2.0_2.36.1.bb => glib-2.0_2.36.2.bb}     |    4 ++--
 ...working_2.36.0.bb => glib-networking_2.36.2.bb} |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.36.1.bb => glib-2.0_2.36.2.bb} (92%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.36.0.bb => glib-networking_2.36.2.bb} (85%)

-- 
1.7.4.4



