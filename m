Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHy6g-0003hl-Lg
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 16:01:10 +0200
Received: by wibhj13 with SMTP id hj13so3856996wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 06:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ElHHC4gpVPhG6Y6Et+1Whk2OMm0KpfdwkOq4Boior2U=;
	b=NDHzVYMezG/jHJ4TuCMWBL60jLAC6QP482Cq4E1WC0JNbhKpzUT+o1965kMduqhKzp
	g1xBUVLkfJZmdsw72sDknkJrJdc19IjBTKUrA0u6riIrmBsw77s28wRQQV5YESTmQBDo
	bMNuV2tXBpqqP03StWzRq+islVTcXNgKkw/UBIzWXpg9si8AK4ArX2LZHGtGUa2zuKlW
	uUT7RKoBAS/JL5fX6dZ5VPKXAsKfTRsC0upluc60IBvyvIvfbjwV6z7dWsD0fczjcbVR
	W7e+b8PPJK15R+gGuXPzqXHAUPHDhj45FddNhxggqWQDHKZYmHq2NgUx8Nk9rZM6Kv+y
	7+8A==
Received: by 10.216.132.18 with SMTP id n18mr8757051wei.81.1334152311602;
	Wed, 11 Apr 2012 06:51:51 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id n8sm9856268wix.10.2012.04.11.06.51.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 06:51:51 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 16:51:45 +0300
Message-Id: <cover.1334152146.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQkV7FhjM7Csnu+2ShTA9VIC0OJxvOdaTUVNWVT6MKbk96gypjz5l9rz9wusf3T0BeKDuhHw
Subject: [PATCH 0/1] Integrate new js185 as a new bb file
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
X-List-Received-Date: Wed, 11 Apr 2012 14:01:10 -0000

This is a temporary solution until we know what to do with packages like web
or web-webkit.

The following changes since commit 190f6d791d51aaa4cfb9f1cf932bc205ff674fb5:

  runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:47 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ag/js
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/js

Andrei Gherzan (1):
  js185: Integrate version 1.8.5

 meta/recipes-support/js/files/link_with_gcc.patch |   12 +++----
 meta/recipes-support/js/files/usepic.patch        |   15 ++------
 meta/recipes-support/js/js185_1.0.0.bb            |   36 +++++++++++++++++++++
 3 files changed, 45 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-support/js/js185_1.0.0.bb

-- 
1.7.5.4



