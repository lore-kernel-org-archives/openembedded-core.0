Return-Path: <blloyd@familyhonor.net>
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mail.openembedded.org (Postfix) with ESMTP id 7193360702
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jun 2014 15:49:24 +0000 (UTC)
Received: from [98.142.68.171] (helo=lloydserv.home.familyhonor.net)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1X0usX-0008wH-7s for openembedded-core@lists.openembedded.org;
	Sat, 28 Jun 2014 15:49:25 +0000
Received: from omclinuxballt.home.familyhonor.net ([192.168.0.83])
	(authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.7/8.14.6) with ESMTP id
	s5SFn9wp022766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sat, 28 Jun 2014 10:49:20 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.68.171
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX1+9yV7Ie52It5CDkPBn/zABAFIvZd+QOsE=
From: Brian Lloyd <blloyd@familyhonor.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Jun 2014 10:48:23 -0500
Message-Id: <1403970504-26097-1-git-send-email-blloyd@familyhonor.net>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/1] initramfs-lib-boot: move boot media to /media/realroot
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
X-List-Received-Date: Sat, 28 Jun 2014 15:49:28 -0000

This patch is to let systems easily find the boot media used for the current 
boot in a deterministic manner.  Previously, you would have to assume the boot
disk or else walk through mounted disks looking for one that matches a live
boot disk and is in use (and if paranoid, ensure there isn't another that
also exists). 

Brian Lloyd (1):
  Move boot media to /media/realroot for easy access after boot.

 meta/recipes-core/initrdscripts/files/init-live.sh         | 10 +++++++++-
 meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb |  4 ++--
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
1.9.0


