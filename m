Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Th70g-0003mX-S9
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Dec 2012 00:07:10 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so751606lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2012 14:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=CyMVRRRz0fkL0XnhvVXo5YzKhevK343fRFChFGlKxnw=;
	b=S1msPEGMiP68IowEVunGZq0C3hkpMGLUON8vRsxm9Simxv5TKkMcBE0s0ohAGiQhM5
	e0PjX+BovQTjX6x4ZSWy+iPqxXYGkYC7P7L64JaPAAUHWciImnl822ExRF/z4VCLTjlm
	hBrf90drz0KmZ3gzuIdmjS4ya+m14UNJYwXfPxLXdAJ0R5OnJtkIDzwKFxV/vCi1tjJw
	tfeuPlS43Z+vX+uX5z7JxOyWczrRiDO4+MF53b/4bkSDO+pbc66t1ckpK3GusmNjuYjb
	Qt7Ct+Mw1YsmgUReVUZui+g1SNC9f3oDnrvIy/v3hC/6jySON8z+OCoHeqqVc9GmryW9
	VWLQ==
Received: by 10.152.105.68 with SMTP id gk4mr6772843lab.48.1354920763484;
	Fri, 07 Dec 2012 14:52:43 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id jc2sm5094287lab.16.2012.12.07.14.52.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Dec 2012 14:52:42 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1Th6md-0006gm-Q4
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Dec 2012 00:52:39 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Dec 2012 00:52:30 +0200
Message-Id: <1354920751-21102-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: libpng update to 1.5.13 V2
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
X-List-Received-Date: Fri, 07 Dec 2012 23:07:11 -0000


In openembedded-core itself, libmatchbox does not compile
against libpng15. Patch for that sent already.

In meta-openembedded, libsdl-image is known not to compile
against libpng15. Patch for that too sent already.

I have not been systematically testing build of all the
possible components. Above two problems are just the ones
I've encountered as part of my typical builds.


 - ML


