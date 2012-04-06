Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1SGFye-0007W1-Al
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 22:41:48 +0200
Received: by pbcum15 with SMTP id um15so2434215pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 13:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=xfzArkxy58QVP7Y8ISWvphZLwtGOih2dh7Rf4BkKCMY=;
	b=p5OlYhzpDj2fbB/AZaxrp3ktOJ/hnufDEXhqn/lVWo76V72CaGUDTnzz817UGFvbwy
	YABa6xqc0My43HwyxVw2FkYuv6sc1R6gh5NumRdHYjtxD24FyHh39+1coC9Kh31rI/4f
	yLzbO+/J3Zm5s27+9h9UmWKyt/Uks4yBu+WpCJivhQcpHi5E6XZviHbcypp2p6oIcpP3
	rWXeevMD5scUHH7VD5KZi/joPP3FMGsl1LQ1MQZAJQxG4QJaZZ9BUUoM1KqfGFQyjmkg
	t9ym65+Gm4g4vtnxkxJXbrfNWFH61K1PKlCIkJzSH5o19Kfni9I8DjV+KQk/6cm02oHt
	M2Cw==
Received: by 10.68.200.225 with SMTP id jv1mr18285300pbc.120.1333744354058;
	Fri, 06 Apr 2012 13:32:34 -0700 (PDT)
Received: from localhost (static-50-53-99-101.bvtn.or.frontiernet.net.
	[50.53.99.101])
	by mx.google.com with ESMTPS id r9sm7145698pbi.53.2012.04.06.13.32.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Apr 2012 13:32:32 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2012 13:32:26 -0700
Message-Id: <cover.1333744298.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQkXlW1xyNhtd2sNdinTQzNUS+UDLb25+yKP3rhLoliOdS6NLFWYqCUbUWdWxDS0LpsTfgU3
Cc: Darren Hart <dvhart@linux.intel.com>, Rahul Saxena <rahul.saxena@intel.com>
Subject: [PATCH 0/1][Yocto 1.2] grub-efi: Include GPT partition EXT FS support
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
X-List-Received-Date: Fri, 06 Apr 2012 20:41:48 -0000

The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:

  runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core efi
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=efi

Darren Hart (1):
  grub-efi: Include GPT partition EXT FS support

 meta/recipes-bsp/grub/grub-efi-native_1.99.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.5.4



