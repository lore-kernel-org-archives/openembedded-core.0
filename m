Received: from gate.crashing.org ([63.228.1.57])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qw1mv-0007r1-HK
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 02:57:53 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7O0qvNH005767;
	Tue, 23 Aug 2011 19:52:57 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Tue, 23 Aug 2011 19:52:56 -0500
Message-Id: <A182C128-8E5F-48F0-B72B-39DA62E6E1F4@kernel.crashing.org>
To: dongxiao.xu@intel.com
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: why do we poison -Os?
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
X-List-Received-Date: Wed, 24 Aug 2011 00:57:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Dongxiao,

Can you explain why this was needed:

commit ce456306dad3fdf42494830011dacae213c48edf
Author: Dongxiao Xu <dongxiao.xu@intel.com>
Date:   Sat Sep 25 10:16:26 2010 +0800

    gcc: enable poison parameters detection
    
    If not configured with --enable-target-optspace, gcc will report
    errors if there is '-Os' optimization in parameters.
    
    This fixes [BUGID #342]
    
    Also add "--enable-target-optspace" option to arm gcc configuration.
    
    Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>


- k


