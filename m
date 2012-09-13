Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TCDFv-0002nf-Ns
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 19:31:11 +0200
Received: by pbcwy7 with SMTP id wy7so4055858pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 10:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=PPzmhcYnNFapERrz2BC6h6Ll7kRstVnrWRuUq8yOJ+I=;
	b=pBUw08XcwtAa75GsDhJXJkHM/FeyEaxuiWO8nWYBNUS0ILCyG4Z2TpibxMGekspA3U
	PlK1MMiX2XVhtnsX2M/l1bFtSIst7ZUQnVsiBqERHcJ/L+S7fy9RkBTKQPrx+K2TDjAT
	VGv32FrGhz0vvRl9jWaRNd4nbe/ePZjX+TqkL3+VtLf0lPCEfU+ba/G83JS1aX+BSCoT
	HvisFTz0heywGMiFY+nrNUoFmLxu/xTPRG5memdifWbfYmS1yVbWdALJbb6nd7HaiYDp
	ek/8BO59fg4fn6CWTpQimcsxD7+Zyn1A7sJo+julLFGez3cwwGJkbdGiynPsfweXDSb0
	b/gg==
Received: by 10.68.221.72 with SMTP id qc8mr490288pbc.63.1347556717365;
	Thu, 13 Sep 2012 10:18:37 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id pq7sm13381550pbb.25.2012.09.13.10.18.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Sep 2012 10:18:36 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 20:18:26 +0300
Message-Id: <cover.1347556625.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQk+a0RMbWttPhnspviTfUqqhxN+PP/y5V7/wZyRwXaepnrYRzVL2JQ4xu3ua3s+IKVcSRJ5
Subject: [PATCH V3 0/1] Round up ROOTFS_SIZE after base_size check
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
X-List-Received-Date: Thu, 13 Sep 2012 17:31:12 -0000

V3:
Do the whole thing in the same awk

The following changes since commit 0f55a5868457300a3defc7fa7451ef191d19e018:

  adt-installer: Allow changing YOCTOADT_REPO (2012-09-05 23:28:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ag/rootfs_size
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/rootfs_size

Andrei Gherzan (1):
  image_types.bbclass: Round up ROOTFS_SIZE after base_size check

 meta/classes/image_types.bbclass |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.9.5



