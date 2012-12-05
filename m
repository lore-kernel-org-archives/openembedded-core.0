Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TgMaH-0007qf-CR
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 22:32:50 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so4374886lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=HOcUKoJeWhjZgiFyZfAAdkoL7mcJcLjkcOKcGouPmnc=;
	b=XOA9V7eEjGaKMB8yF+a8OPjgtnv/APwATC5toHTLaR2frDyVLr578y4PWb0PENv+V/
	hSf1iyvAu8Rey6+4yfBWwqpXy2COIonEl37AVkGcdbVbYPz06OLWSzzx+Ub5dGWLQP8H
	OBSRGWwYfoyx1eqWV0CN4+TMOyqSfRso8cvlH0rBT54sDOWc3KnWEpJ+khP3FDQ6DBVD
	RaxGstM4PggGHCVeIB6Dh38StJe02zmzCBBBDjpeNco8dBWlLw3VtDts6R5DFkS+S6AB
	Dt55z9Kw+3thrSddrOeuTX/00jR75SvpotqAhg/PZrgxx8M3vKRW+ViEmmM5loYdVsUv
	7Ajg==
Received: by 10.152.105.33 with SMTP id gj1mr18093480lab.49.1354742307239;
	Wed, 05 Dec 2012 13:18:27 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id so7sm2611445lab.0.2012.12.05.13.18.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:18:26 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TgLlo-00074M-Tm
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 22:40:40 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:40:31 +0200
Message-Id: <1354740033-18500-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: libpng-1.5.13
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
X-List-Received-Date: Wed, 05 Dec 2012 21:32:50 -0000


First preparatory patch makes it easier to add multiple major versions of
libpng. You may choose to commit this one only.

Second patch adds 1.5.13 recipe. This produces library named libpng15, while
old 1.2.50 recipe produces libpng12. Some older programs (and their recipes)
may fail to find newer library. So far I'm aware of one such case in
meta-openembedded; libsdl-image-1.2.10 needs update. I've already submitted
patch for that one.


