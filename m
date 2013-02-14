Received: from mail-wg0-f53.google.com ([74.125.82.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U63H3-0005NK-60
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 19:12:25 +0100
Received: by mail-wg0-f53.google.com with SMTP id fn15so2137355wgb.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 09:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=+xwP9YtlA50babcme8pErWrSQDI+f/mTJxypE0pjsrM=;
	b=B9QsDdCeGAcufdGjjQy5PqCA2LxApNXb5JwuPOw9FOXx/yHyWpYNYlGa2gQIRBCcYj
	h2NRCsQItXTKHqakzhfXKH+8uyRY8W+6CLiI+5ty8fgiOGavfplbwUjDxPdmd47XuGIw
	/iqgXaDEcyFenzRFWSL9mqI9rL9JSjh9ulbmn3eh8Kt4g8IduHBOJQf918GIV29e1E6t
	Yw+N5wesgL3EOqARZamPXhKFpDacR6730u34vXXkbM9NzK905Rj23h8YVPeOvOEFwVii
	ZKOm+2MwjFYHRcObefPeDETqreHG65N/eGcDcvM/WuPlZiAjQBH6UOwqZyjyHcaVTSit
	GNqw==
X-Received: by 10.194.118.166 with SMTP id kn6mr47616733wjb.18.1360864506204; 
	Thu, 14 Feb 2013 09:55:06 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id o8sm636905wix.7.2013.02.14.09.55.04
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 14 Feb 2013 09:55:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2013 17:52:49 +0000
Message-Id: <cover.1360864224.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQk+F8MEg1uhdw2jImfQkNcZCChtSBmRcVc2VdtBomu2o1i1b1c98xqW29ymhTJJrklXma7s
Subject: [PATCH 0/3] Allow xserver-xf86-config to ship no xorg.conf
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
X-List-Received-Date: Thu, 14 Feb 2013 18:13:48 -0000

Hi,

This series lets a BSP not ship a xorg.conf as not all BSPs need them.  This is
implemented by not installing empty xorg.conf files, and making the generic
xorg.conf empty (which is a good move, as it specified the intel driver).

There's a patch to package_ipkg that's required to sanity check the CONFFILES
variable, as otherwise building an opkg fails when the package is empty.

Ross

The following changes since commit b15730caf0d4c40271796887505507f2501958bb:

  mulitilib_header: Avoid sstate checksum issues for -native recipes (2013-02-14 12:36:08 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/xorg

for you to fetch changes up to d6c444561597e8546a7ae39aaa14da578456ab7d:

  xserver-xf86-config: empty generic xorg.conf (2013-02-14 17:48:56 +0000)

----------------------------------------------------------------
Ross Burton (3):
      package_ipk: check CONFFILES exist before adding them to metadata
      xserver-xf86-config: don't ship empty xorg.conf
      xserver-xf86-config: empty generic xorg.conf

 meta/classes/package_ipk.bbclass                   |    3 ++-
 .../xorg-xserver/xserver-xf86-config/xorg.conf     |   26 --------------------
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |   10 +++++---
 3 files changed, 8 insertions(+), 31 deletions(-)

Ross Burton (3):
  package_ipk: check CONFFILES exist before adding them to metadata
  xserver-xf86-config: don't ship empty xorg.conf
  xserver-xf86-config: empty generic xorg.conf

 meta/classes/package_ipk.bbclass                   |    3 ++-
 .../xorg-xserver/xserver-xf86-config/xorg.conf     |   26 --------------------
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |   10 +++++---
 3 files changed, 8 insertions(+), 31 deletions(-)

-- 
1.7.10.4



