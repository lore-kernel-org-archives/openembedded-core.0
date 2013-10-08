Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A02226CE9E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 21:12:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r98LCtZP017713
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Oct 2013 14:12:56 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 8 Oct 2013 14:12:55 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 8 Oct 2013 17:12:53 -0400
Message-ID: <cover.1381266484.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Tue, 08 Oct 2013 21:12:57 -0000
Content-Type: text/plain

Richard/Saul,

3rd time is a charm, and I finally have the right incantation to
build the scripts in:

  tmp/sysroots/<machine>/usr/src/kernel/scripts/mod

This works in my environment, for my test cases, but I don't have Khem's
exact external module build case handy.

Khem: if you can try this patch and ack it if it works, that would be
fantastic.

Cheers,

Bruce

p.s. I'm out of the office for the next week, but will track this
via my gmail account.


The following changes since commit 72ca7801f3b733f7fc63326c1d8c98a3c32a519f:

  linux-yocto/3.10: integrate lxc kernel feature and 32 bit x86 config (2013-10-08 16:44:54 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (1):
  kernel: restore scripts in the sysroot

 meta/classes/kernel.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
1.8.1.2


