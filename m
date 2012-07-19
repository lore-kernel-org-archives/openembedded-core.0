Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Srpf4-0003iI-Sn
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 14:16:55 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 05:05:31 -0700
Received: by weyt11 with SMTP id t11so1520407wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 05:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=x4JE2Vzw5gGuwhBT0Ts/wohCzYoziBGfyJY9dZA9RuM=;
	b=BSTNM6r+XBUsokLG+fKGy498icmAjFZrhB7PBlVz0IvLZgWRQtRfUl7U81QAkOkou4
	0hQm4bDkiOg4ygADCF7iPvZQRHRyQ97h4woMELdKgUp+zpeOym4+RsZRhX29QnlVZxJF
	RG+M9tC/1UFKY1jWDtk0VykW7a3HgpqHasr5IfCyA+g5IKHh9KuCIJ/PGJ/DphomvcJv
	u5nQUU3jTybwVIWnT73rED7t2fSJSRYCIoQ5MeOyqtZJj0bgZQzDlQnHAU2uG6RMi+HQ
	43CN4acn9tbb5ASqb4QB2doq6vo9fZhBQJdHZgQ3+YPIes9tqQ/gRsYVckSR0LC+7fro
	zhtQ==
Received: by 10.216.68.3 with SMTP id k3mr986912wed.202.1342699529252;
	Thu, 19 Jul 2012 05:05:29 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t8sm38149972wiy.3.2012.07.19.05.05.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 05:05:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 13:05:06 +0100
Message-Id: <cover.1342699470.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlFkFPt6cKa6sHszcYYhXuOkmghO3bra426+++NsrludBxqUQIQS8zmdMc+x8lubGvCwcVE
Subject: [PATCH 0/3] Remove eggdbus
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
X-List-Received-Date: Thu, 19 Jul 2012 12:16:55 -0000

eggdbus isn't actually used anything anymore, so remove the dependencies and
delete the package.
 
The following changes since commit 09d11c2794f445a4311f6cba3fdd79bfc216abc5:

  package_ipk.bbclass: Fix python whitespace (2012-07-19 12:24:50 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/eggdbus

for you to fetch changes up to c45181c5fcaee663c5ade1c81c78efd81fbd9875:

  eggdbus: remove, nothing uses it (2012-07-19 13:01:51 +0100)

----------------------------------------------------------------
Ross Burton (3):
      libgnome-keyring: remove eggdbus dependency, it has an in-tree copy
      polkit: remove dbus-glib and eggdbus dependencies, polkit uses gio for DBus
      eggdbus: remove, nothing uses it

 meta/conf/multilib.conf                            |    1 -
 meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch    |   34 --------------------
 meta/recipes-core/eggdbus/eggdbus/marshal.patch    |   28 ----------------
 meta/recipes-core/eggdbus/eggdbus_0.6.bb           |   31 ------------------
 meta/recipes-extended/polkit/polkit_0.104.bb       |    4 +--
 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    4 +--
 6 files changed, 4 insertions(+), 98 deletions(-)
 delete mode 100644 meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch
 delete mode 100644 meta/recipes-core/eggdbus/eggdbus/marshal.patch
 delete mode 100644 meta/recipes-core/eggdbus/eggdbus_0.6.bb

Ross Burton (3):
  libgnome-keyring: remove eggdbus dependency, it has an in-tree copy
  polkit: remove dbus-glib and eggdbus dependencies, polkit uses gio
    for DBus
  eggdbus: remove, nothing uses it

 meta/conf/multilib.conf                            |    1 -
 meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch    |   34 --------------------
 meta/recipes-core/eggdbus/eggdbus/marshal.patch    |   28 ----------------
 meta/recipes-core/eggdbus/eggdbus_0.6.bb           |   31 ------------------
 meta/recipes-extended/polkit/polkit_0.104.bb       |    4 +--
 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    4 +--
 6 files changed, 4 insertions(+), 98 deletions(-)
 delete mode 100644 meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch
 delete mode 100644 meta/recipes-core/eggdbus/eggdbus/marshal.patch
 delete mode 100644 meta/recipes-core/eggdbus/eggdbus_0.6.bb

-- 
1.7.10



