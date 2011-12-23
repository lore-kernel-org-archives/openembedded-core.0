Received: from e06smtp18.uk.ibm.com ([195.75.94.114])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1Re4Su-0006Za-U6
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 13:43:13 +0100
Received: from /spool/local
	by e06smtp18.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <openembedded-core@lists.openembedded.org> from
	<ken.werner@linaro.org>; Fri, 23 Dec 2011 12:25:52 -0000
Received: from d06nrmr1806.portsmouth.uk.ibm.com ([9.149.39.193])
	by e06smtp18.uk.ibm.com ([192.168.101.148]) with IBM ESMTP SMTP
	Gateway: Authorized Use Only! Violators will be prosecuted; 
	Fri, 23 Dec 2011 12:25:50 -0000
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by d06nrmr1806.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id pBNCPnRd2916372
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 12:25:49 GMT
Received: from d06av02.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id pBNCPnWD024235
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 05:25:49 -0700
Received: from bolide.boeblingen.de.ibm.com
	(dyn-9-152-224-84.boeblingen.de.ibm.com [9.152.224.84])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id pBNCPnee024230; Fri, 23 Dec 2011 05:25:49 -0700
From: Ken Werner <ken.werner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Dec 2011 13:25:41 +0100
Message-Id: <1324643142-29474-1-git-send-email-ken.werner@linaro.org>
X-Mailer: git-send-email 1.7.5.4
x-cbid: 11122312-6892-0000-0000-0000008BA312
Subject: [PATCH] Replace -mno-thumb by -marm
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
X-List-Received-Date: Fri, 23 Dec 2011 12:43:13 -0000

Hi,

The OE-Core qemuarm MACHINE configuration uses "-march=armv5te -mno-thumb"
in order to generate code for the ARM instruction set. Recent versions of
GCC for ARM reject the -mno-thumb option [*] and expects developers to use
the -marm instead. Since -marm also works for older GCC versions I just
replaced -mno-thumb by -marm.
Since OE-Core is using a GCC 4.6.3 based toolchain this isn't an issue yet.
But it causes some trouble for users who build OE-Core with a recent external
toolchain (depending on the ARM_INSTRUCTION_SET).

Ken Werner (1):
  Change -mno-thumb to -marm

 .../conf/machine/include/arm/feature-arm-thumb.inc |    4 ++--
 meta/conf/machine/include/tune-thumb.inc           |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

Regards,
Ken

[*] http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47930
-- 
1.7.5.4



