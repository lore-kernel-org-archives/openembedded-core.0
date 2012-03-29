Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDGAj-0001q6-Rt
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 16:17:53 +0200
Received: by wgbdr12 with SMTP id dr12so1490375wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 07:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=gIzsgeLEzPKJzFiFGJYgOf6F2NnkuozAw4WQQMUAfB0=;
	b=zojGrby0HDsNZK30NsLUn+BTi164inRmG+zDk0YpqC7RBw6YA6bvg5aA+U7OAkOYel
	/p2A3F2opue4QltHPODpUQbwnhFrwPypXabDRWvFlZk/mA+DS72Y0Gdt9oanLpGCj/4r
	wuf8sxhQguLMEhrZIT1weKYv2d/vCH2H5+8xIix1lFYpvyq//fBquOrBmVPZcp0oZI7r
	rkkp0CjiY+cxMb7sJYYnv/khAuAovDtKmmQjK7tSPhC8l9FDHHJfmDc7xWcM+T6dP4QY
	PouxvDYD88IN9Sy+nxv4zk6WQGiZ01f79i/DekWhV/hxdJPwf/zP2xX5lBgzHDJ6Nb22
	kNtA==
Received: by 10.180.88.67 with SMTP id be3mr5920508wib.20.1333030130392;
	Thu, 29 Mar 2012 07:08:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex2sm29190746wib.8.2012.03.29.07.08.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 07:08:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 16:08:43 +0200
Message-Id: <cover.1333028738.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1333001415.git.Martin.Jansa@gmail.com>
References: <cover.1333001415.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 0/2] more kernel.bbclass updates
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
X-List-Received-Date: Thu, 29 Mar 2012 14:17:54 -0000

The following changes since commit 432e36300d7231c9b01cd2c6c4b39b84cf4fddca:

  rpm: Ensure we depend on file (2012-03-28 18:40:20 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/kernel2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/kernel2

Martin Jansa (2):
  kernel.bbclass: merge uboot_mkimage improvements from meta-oe
  kernel.bbclass: unify white spaces

 meta/classes/kernel.bbclass |   67 ++++++++++++++++++++++++------------------
 1 files changed, 38 insertions(+), 29 deletions(-)

-- 
1.7.8.5



