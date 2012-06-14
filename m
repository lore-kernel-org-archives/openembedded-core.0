Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SfCo7-0001pD-B8
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 18:22:03 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 14 Jun 2012 09:11:02 -0700
Received: by wibhn6 with SMTP id hn6so1632621wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 09:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=63ypHZey9XQZH9AZv2XIyPgTgrr+01o0UMEdQpkilO8=;
	b=gsPdumFa5MVlQrLSY+DLHfTZuXnnBoz2VfZnvFqrUyGLsJZoupQsCEHe9lSiRTebdM
	2vtI3/q6u3oVPlbECD+fr/C5lXij6xyqDFu/40kmOWTixQI6PDvbkvhqo9hv8xwY7gy/
	U4Wqm4cZmmShUrj71KyhK4sBgIl9XI8J00BbOsxhPHfvcPX7b/kngTsp0Jrtp6BjtJmb
	Q3k8JOhQIGDMkfXu+G13Jn4C9X/OcJ0gvOeRGQbCde8+2MoD4I+URZtZjloXHFWkYJlb
	5+gwdLcg2zbIrYBzFcHZoXIAgxoFyNVh+h/IsVSfK5HHJZzYIiryryppl+YHjxTp5kSb
	7p1w==
Received: by 10.180.83.197 with SMTP id s5mr5574418wiy.9.1339690260656;
	Thu, 14 Jun 2012 09:11:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPS id eb8sm19433631wib.11.2012.06.14.09.10.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jun 2012 09:10:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 17:10:53 +0100
Message-Id: <cover.1339689908.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnbd4RITQr8d3qp+/6NQtP2eHEnfDhamTsrcqGLRa7Wa6j74SJVO8BgTzLhVnXKsgx6PtyA
Subject: [PATCH 0/2] V3 ConnMan 1.0 / connman-gnome
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
X-List-Received-Date: Thu, 14 Jun 2012 16:22:03 -0000

V3 of the connman 1.0 patches.  The connman patch has been rebased onto master,
and connman-gnome has been tested on my Intel/iwlagn board.

The following changes since commit 4ff6160d909e2a39e357c8a51f37d803dab64d5d:

  methodpool: Improve method already seen error message (2012-06-14 14:20:51 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/connman
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/connman

Ross Burton (2):
  connman: upgrade to 1.0
  connman-gnome: update to ConnMan 1.0 DBus API

 ...0001-Monitor-the-Manager-s-State-property.patch |   48 -
 ...e-fix-segfault-due-to-unchecked-null-val.patch} |    6 +-
 .../0002-Update-for-ConnMan-0.79-API-changes.patch |  865 ------------------
 .../0002-Update-for-ConnMan-1.0-DBus-API.patch     |  179 ++++
 .../0003-Fix-setting-IPv4-configuration.patch      |   85 --
 ...Handle-WiFi-authentication-using-an-agent.patch |  923 --------------------
 ...emove-all-handling-of-Passphrase-property.patch |  249 ------
 ...ix-status-descriptions-in-properties-tree.patch |   42 -
 .../connman/connman-gnome_0.5.bb                   |   13 +-
 meta/recipes-connectivity/connman/connman.inc      |   26 +-
 ...ange-visibility-to-default-for-debug-symb.patch |   35 -
 .../connman/connman/disable_alg-test.patch         |   46 -
 .../connman/connman/ethernet_default.patch         |   22 -
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 --
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 --
 meta/recipes-connectivity/connman/connman_0.79.bb  |   14 -
 meta/recipes-connectivity/connman/connman_1.0.bb   |    9 +
 17 files changed, 213 insertions(+), 2454 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/0001-Monitor-the-Manager-s-State-property.patch
 rename meta/recipes-connectivity/connman/connman-gnome/{0007-connman-gnome-fix-segfault-due-to-unchecked-null-val.patch => 0001-connman-gnome-fix-segfault-due-to-unchecked-null-val.patch} (84%)
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/0002-Update-for-ConnMan-0.79-API-changes.patch
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0002-Update-for-ConnMan-1.0-DBus-API.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/0003-Fix-setting-IPv4-configuration.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/0004-Handle-WiFi-authentication-using-an-agent.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/0005-Remove-all-handling-of-Passphrase-property.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/0006-Fix-status-descriptions-in-properties-tree.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/ethernet_default.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman_0.79.bb
 create mode 100644 meta/recipes-connectivity/connman/connman_1.0.bb

-- 
1.7.10



