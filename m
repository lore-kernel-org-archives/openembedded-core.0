Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbNM9-0001iT-B4
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 03:44:49 +0200
Received: by pwi1 with SMTP id 1so3517970pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 18:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=+x8i+B98jV9qGewBC0kcY3zBCuwRfQVmZLoD5nSPTg0=;
	b=VPoDVUj56gGltpqTOM7NjzTAME/szhZQ3TQJCVnAjcQdhk7M6dpFcbOw2u9r5ZepjW
	V9/EcW9eOlgzV1zMTA8iPBXStlikXSfKLT5FINzDkI+3bCGByiP1QEKrr2EeGyhcGd22
	CtdLiNWFziV5Y5g4dEWJ4rOynyJPnmE4KeQzs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=r9bE7sKavY3iVIPArsNqpp9o1k7Y2hfafBlF5Q4DMv7pOOjrJS36Wl8Y9WJlDv6MrB
	niZYefFYzyo6ROfsBLWN0MtgZQHbvDj6HoBgMf7NPxaXExbd6YStu6oPwIRgJsNx+tq9
	Z0uE+yU8FrpSeWnLSA2kLu/VabZmuGvckLHtI=
Received: by 10.68.22.197 with SMTP id g5mr3473085pbf.254.1309225267630;
	Mon, 27 Jun 2011 18:41:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o2sm4725057pbj.17.2011.06.27.18.41.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 18:41:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2011 18:40:48 -0700
Message-Id: <1309225253-25795-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/5] uclibc: config Cleanups
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
X-List-Received-Date: Tue, 28 Jun 2011 01:44:49 -0000

Hi

This patch series is attempting to clean up the defconfig cruft
accumulated in uclibc recipes. I have built angstrom/console-image
using these patches (but not from scratch) for arm and x86
other architectures are still churning. Please review and provide
your feedback

Thanks
-Khem




