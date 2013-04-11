Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQKfs-0000jm-U9
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 18:48:39 +0200
Received: by mail-wg0-f41.google.com with SMTP id y10so744159wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 09:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=f69FXxNXBOZG5KVx/d9uo9RuJSTFH2UroMjzaSPpd2Q=;
	b=cK836MTm9T5nGGN3YT8SilPxGoFg3xIMe2V3sCimlhRkav71CAkuILE5q15qgjLWxO
	vW7oxrTfTrMi/wPVJberL3D0cXnPQIGSu5kk3iAGGDbHPqIegt4t7otq88YQPQKCNDwC
	5y58w0V7jzkkEztWveq7Z4S1ZljRa/mhM6kHLLBnTiS/82ZO5FB5VvU05foRCdAFZAv2
	lbiHmL0KaVqJ7veid5lNktp1m6/mrsfxVxeQVVfR6N4FJAcXQIKGxq1oJeHb8VxZ8aMT
	1fwNmRJAmKZNjb0a7FVKhl8wtZ9CMGCdfYeKLjVhJ8PhTvC40+2VSEo092AI38kfAM2R
	g6Ew==
X-Received: by 10.194.89.169 with SMTP id bp9mr11995329wjb.57.1365697873111;
	Thu, 11 Apr 2013 09:31:13 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q13sm4179375wie.0.2013.04.11.09.31.11
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 09:31:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2013 17:28:24 +0100
Message-Id: <cover.1365697555.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQllQWkt4mM3iKoGR0MaRwZEwFerILPWRey9mXsmVBLY3VXZ04O0tVLmrfNxujZtJssRT/t0
Subject: [PATCH 0/2] Move systemd binaries to /sbin/systemd
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
X-List-Received-Date: Thu, 11 Apr 2013 16:48:39 -0000

Hi,

Following the example set by udev, move the binaries to /sbin/systemd and
hardcode less paths in general.  Tested on atom-pc with a .hddimg so the live
boot/initrd paths were tested.

Ross

The following changes since commit 2ef72c3174c8c111678ac7e3cf3d866eaf2c8d77:

  wayland: add necessary dependencies to fix build error (2013-04-11 16:41:13 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/systemd

for you to fetch changes up to 0154334c32234d70dc064fb7dac6b499ca91cf3a:

  initrdscripts: look for new systemd-udevd location (2013-04-11 17:18:19 +0100)

----------------------------------------------------------------
Ross Burton (2):
      systemd: move the binaries to /sbin/systemd
      initrdscripts: look for new systemd-udevd location

 meta/recipes-core/initrdscripts/files/init-live.sh |    2 +-
 .../initrdscripts/initramfs-framework/udev         |    2 +-
 meta/recipes-core/systemd/systemd/init             |   14 +++---
 meta/recipes-core/systemd/systemd_199.bb           |   46 +++++++-------------
 4 files changed, 25 insertions(+), 39 deletions(-)

-- 
1.7.10.4



