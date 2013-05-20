Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UeRwE-00042S-FD
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 17:23:54 +0200
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id CEA62952B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 16:05:31 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 16:05:17 +0100
Message-Id: <1369062325-30335-1-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <51969025.6040407@linux.intel.com>
References: <51969025.6040407@linux.intel.com>
Subject: updates for cogl, clutter and mx
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
X-List-Received-Date: Mon, 20 May 2013 15:23:59 -0000
X-List-Received-Date: Mon, 20 May 2013 15:23:59 -0000


> There are some issues with this patch set, some of the included patches
> either do not have Upstream-Status or Signed-off-by tags, please review 
> that.

Updated the various patch headers in v.2.

> Also, I want to confirm that these are all new recipes and will not cause 
> backward PRs (ie do you need PE bumps to these)?

I renamed the mx recipe also to mx-1.0 for consistency, so yes, these are all 
different packages now.

> Finally, I think you need to update the packagegroup-core-clutter recipe. 

Done.

Tomas


