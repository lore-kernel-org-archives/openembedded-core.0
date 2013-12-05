Return-Path: <scott.a.garman@intel.com>
Received: from masterfoo.zenlinux.com (masterfoo.zenlinux.com [207.192.74.254])
	by mail.openembedded.org (Postfix) with ESMTP id 54C3D6DF96
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 21:58:18 +0000 (UTC)
Received: from localhost (c-50-139-96-211.hsd1.or.comcast.net [50.139.96.211])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 6950A2FD94
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 16:57:35 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 13:57:30 -0800
Message-Id: <cover.1386279548.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.8.1.2
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 6950A2FD94.1E258
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] runqemu fix for bug #5617
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2013 21:58:19 -0000

Hi all,

It's been a while since I've submitted a patch, let's see if I can get
this process right the first time. ;)

This is a fix for Yocto bug #5617. Ross Burton wasn't a fan of the image
filename whitelist, and I have to agree - it's not very maintainable. So
when we have to guess the image filename, instead just pick the most
recently modified imgage filename that conforms to our typical naming
conventions, *image*machine.fstype

Scott

The following changes since commit 300760193c6bcfd20f1d4908f912bebd53e86281:

  tcl: fix tclConfig.sh to point to the correct private headers (2013-12-05 16:48:17 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgarman/runqemu-imgfn-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/runqemu-imgfn-fix

Scott Garman (1):
  runqemu: remove core-image-* whitelist

 scripts/runqemu | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

-- 
1.8.1.2


