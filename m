Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLqxl-00050J-13
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 08:07:30 +0200
Received: by pxi6 with SMTP id 6so3225525pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2011 23:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=HbYFl1TD1BO8QQwnaD7yVdrPyz0PSvY4LG1NhDhZFoU=;
	b=F0Ebqbiv034J5VzD8hm8/F22O3NrEiIjrRImBTG6wKA4pWIetAtEXiej5QUJDF/o47
	x6n8NBSsJWqFfUBH+SXdsZ4fnJ1Sr+YQyhJspyZkfy0W3v+SPjehdt5PIv2f8k+SmU1h
	sF9cf4ME0lR1tfvZWgzmmG7Q0hHCQ9SFZ7/XA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=FuRiUTrajIymaSKmr/3LYXO14aDOEoMzmH4k4s9r9KZBRkXZZZTWWWdN1jVFQ5vTh7
	WdC0X/wGa9dcuyK76HEINX5niyJrPpLKYOPHH/iL8QjffQidbmFc981JNPqlbP77c5/8
	hjv6FAVeHSjafrJQsEvPemLez578AkTc3BOPo=
Received: by 10.68.68.243 with SMTP id z19mr6626274pbt.276.1305525862084;
	Sun, 15 May 2011 23:04:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p2sm3086877pbq.6.2011.05.15.23.04.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2011 23:04:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sun, 15 May 2011 23:04:13 -0700
Message-Id: <cover.1305525725.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Adjust default distrovars
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
X-List-Received-Date: Mon, 16 May 2011 06:07:30 -0000

These changes make sure that uclibc based images still build
and some tasks do not get added forcibly to distros

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/default-distro
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/default-distro

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (2):
  default-distrovars.inc: Do not add DISTRO_EXTRA_RDEPENDS and
    DISTRO_EXTRA_RRECOMMENDS
  tclibc-uclibc.inc: Append -uclibc only to target recipes

 meta/conf/distro/include/default-distrovars.inc |    3 ---
 meta/conf/distro/include/tclibc-uclibc.inc      |    5 ++---
 2 files changed, 2 insertions(+), 6 deletions(-)

-- 
1.7.4.1



