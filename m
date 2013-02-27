Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAi7S-0003e1-Fk
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:36:57 +0100
Received: by mail-wi0-f174.google.com with SMTP id hi8so6325545wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:20:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=VrfPKJ8cCeFS0lk90841H38cudzXyN06zBVdn4HViGg=;
	b=Y7y4T0RwXPkSqPzrmarPi+vq1WSLuUsDUg13vGzwHp9LzTI89wujFmSwUeARFHSwDk
	fXanACc0YHwFtJUkXjKFGFuzqsFF0EpPGh2TNt/yOkz1IeLYdvX5a1fybMFDh52snrBt
	Yqd7a833HzxYI/nI9HMlb6cQFCReKOc0JFOsEa2i2CyWL7SezhG5taHDh5N1tHqBI96T
	C5eZ9hbF9KEiCRDjfYbS9/KNRvne+uB80194QkDHBUTQPNzVRQYh29C7GWBeF6VZ/jG3
	TlqdYxveaUlf/rPThAtlo85/dVlJ+0uVfCqutZcDagug9BnZrC2/jI3UZcJjq7RuWUuW
	JFiw==
X-Received: by 10.194.89.169 with SMTP id bp9mr4217169wjb.57.1361974809752;
	Wed, 27 Feb 2013 06:20:09 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bs6sm9053829wib.4.2013.02.27.06.20.08
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 06:20:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 14:17:39 +0000
Message-Id: <cover.1361974597.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQm8X1wBtNG6IUvbOgD8Rp+BGrRTFwZOPziXpvXp6IELMWdiu8gDC02WvXDWbGfzmLAyE+Ac
Subject: [PATCH 0/7] systemd tweaks
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
X-List-Received-Date: Wed, 27 Feb 2013 14:37:11 -0000

Hi,

Whilst whittling down the install footprint of systemd I made several fixes.
Here are the simple ones, including a fixed /bin/kill patch.

Ross

The following changes since commit 2cc4fe4a0874c42421b1bf3fa100160a9e60a9da:

  upstream_tracking.inc: Coonectivity and multimedia packages updates (2013-02-25 05:58:20 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/systemd-good

for you to fetch changes up to b4fdb05f5e0f97b427125f27e4d824f09eb7c651:

  systemd: set the location of the kill binary (2013-02-27 14:12:03 +0000)

----------------------------------------------------------------
Ross Burton (7):
      systemd: systemd uses libkmod instead of modprobe, remove dependencies
      systemd: don't recommend IPv6 kernel module
      systemd: make gcrypt support (for signing the journal) optional
      systemd: remove unused cached configure variables
      systemd: make xz support (compressed journal) optional
      systemd: remove --with-distro option, it's not used
      systemd: set the location of the kill binary

 meta/recipes-core/systemd/systemd_197.bb |   23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

Ross Burton (7):
  systemd: systemd uses libkmod instead of modprobe, remove
    dependencies
  systemd: don't recommend IPv6 kernel module
  systemd: make gcrypt support (for signing the journal) optional
  systemd: remove unused cached configure variables
  systemd: make xz support (compressed journal) optional
  systemd: remove --with-distro option, it's not used
  systemd: set the location of the kill binary

 meta/recipes-core/systemd/systemd_197.bb |   23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

-- 
1.7.10.4



