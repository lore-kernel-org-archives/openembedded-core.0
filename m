Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1jjM-00080b-Ds
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 19:21:28 +0100
Received: by iyb26 with SMTP id 26so6826727iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=qvi7EUVJ7FmAyJRBNlcgVu37V4g891b27aeBdaE3hIE=;
	b=E8lPfpvQOMhSyCG2ltKZOm5igx9D1Bf1nDm3uOzm8YowPWC3FRZxASZFEIh/bLBa/5
	lLsEa0cgaUjXJ9CL31TEpuDEvu9bHr7HB5LaSzYg8aL8QsPBBfXYOqvHnTjEGUOog0DC
	RWi5jEWkCz1Q9RiL8czxgQ8AIQ3c3V4PD8r9k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ixf94gefVjMmeNADI9bJSycjiFgBJku+w5D6SKoQWwFYStdLEaCQIYnL/c/n1f+wrJ
	erKvL6aMtCd7eawqPMVDrn53ME8aXRcJPVDEpyLWL054C3ZNlbW2ta9IVCks0yx8ycZU
	rK9+4biGb07w7kCERsxk45WpLJjjT07PkCNek=
Received: by 10.42.156.135 with SMTP id z7mr7477803icw.59.1300731578342;
	Mon, 21 Mar 2011 11:19:38 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id wo11sm4102203icb.20.2011.03.21.11.19.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 11:19:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2011 11:19:33 -0700
Message-Id: <cover.1300731432.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Call stty sane before exiting qemu
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
X-List-Received-Date: Mon, 21 Mar 2011 18:21:28 -0000

In nographic mode when qemu is exited e.g. qemuppc then the shell
does not respond as expected (experienced on ubuntu). So we add
a call to stty sane just before exit which fixes the issue.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/qemu-sane-stty
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-sane-stty

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (1):
  scripts/poky-qemu-internal: Add call to stty

 scripts/poky-qemu-internal |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.4.1



