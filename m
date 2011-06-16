Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QXHhI-0003Ag-0Z
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 20:53:44 +0200
Received: from localhost.localdomain (c-76-115-40-57.hsd1.or.comcast.net
	[76.115.40.57])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 208CB30520;
	Thu, 16 Jun 2011 14:50:06 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2011 11:49:59 -0700
Message-Id: <cover.1308249837.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 208CB30520.8FC9E
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 0/1] Fix for runtime errors due to login.defs
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
X-List-Received-Date: Thu, 16 Jun 2011 18:53:44 -0000

Hi,

This fixes an issue Koen reported where logging in and running
various shadow-utils commands could result in the following:

configuration error - unknown item 'FAILLOG_ENAB' (notify administrator) configuration error - unknown item 'LASTLOG_ENAB' (notify administrator) configuration error - unknown item 'OBSCURE_CHECKS_ENAB' (notify administrator) configuration error - unknown item 'PORTTIME_CHECKS_ENAB' (notify administrator) configuration error - unknown item 'QUOTAS_ENAB' (notify administrator)
...and so on.

The following changes since commit e1f6ebba3ab2fc8a469c1d96fc6d4c4b8f16845c:

  meta-yocto: use FILESEXTRAPATHS_prepend := in all bbappends (2011-06-15 11:49:42 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/login-defs-fix-rebased
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/login-defs-fix-rebased

Scott Garman (1):
  base-passwd: disable problematic login.defs options

 .../base-passwd/base-passwd-3.5.22/login.defs      |   32 ++++++++++----------
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |    2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)



