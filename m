Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1jy0-0008PV-Qr
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 19:36:37 +0100
Received: by pvc30 with SMTP id 30so755436pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 11:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=lNx2rRosiqdAhTrVfdiztk1fGsXQQLbYQz8KHQoHyjI=;
	b=wEyUA9IRcxzZvhWL+PpbZeIdy9nMvfuNcQsjI/fOZUKH9hZtx0lSoUBoCSGxbgvG9r
	epRoz6tL6f2jqbkjuEFVtew3DiWs0GCen5CD8KqaxucUexTdJLpfSjMcSr9mgL6+x/od
	/vkwRo93klflFT4KNcn+x50J16h4BlkaIRL3U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=gc0KoaMJJEtBxeGvmhM6JcB/sSTSUgcX5Iwi2YyGpITtJcYbpsSm+0lzAnP39WZDUE
	InoimuR0Ianzv6qQL53xiw1t7L9w1Z0TPQYkjQXd/svQagReHlHSDKDKdeealEeU9NNj
	sdNzwBeUEbbBsii0vDZIYuZL4ensAHS/ce4dE=
Received: by 10.143.27.17 with SMTP id e17mr3409590wfj.297.1300732485746;
	Mon, 21 Mar 2011 11:34:45 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n4sm7590126wfl.14.2011.03.21.11.34.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 11:34:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2011 11:34:40 -0700
Message-Id: <cover.1300732395.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH V2 0/1] Call stty sane before exiting qemu
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
X-List-Received-Date: Mon, 21 Mar 2011 18:36:37 -0000

In nographic mode when qemu is exited e.g. qemuppc then the shell
does not respond as expected (experienced on ubuntu). So we add
a call to stty sane just before exit which fixes the issue.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/qemu-stty-sane
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-stty-sane

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (1):
  scripts/poky-qemu-internal: Add call to stty

 scripts/poky-qemu-internal |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

-- 
1.7.4.1



