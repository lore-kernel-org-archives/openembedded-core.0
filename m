Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T2Qwv-00055y-6j
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 20:07:09 +0200
Received: from localhost (c-50-137-42-92.hsd1.or.comcast.net [50.137.42.92])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 97D123047C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 13:55:04 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 10:54:39 -0700
Message-Id: <cover.1345225925.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 97D123047C.5579A
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] runqemu fix for yocto-bsp kernels
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
X-List-Received-Date: Fri, 17 Aug 2012 18:07:09 -0000

The yocto-bsp tool generates kernels with additional strings within
the filename, e.g. zImage-myqemuarm.bin. Loosen the MACHINE detection
regex to work with these filenames.

Fixes [YOCTO #2890].

Scott

The following changes since commit bb74035190c7794fcebaa7f6ba247672a4c34cde:

  libsamplerate: depends on libsdnfile (2012-08-17 18:04:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sgarman/runqemu-yocto-bsp-oe
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=runqemu-yocto-bsp

Scott Garman (1):
  runqemu: work with yocto-bsp created kernel filenames

 scripts/runqemu |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5



