Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QK1C0-0005K0-K8
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 06:38:36 +0200
Received: by pvc30 with SMTP id 30so77336pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 21:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=hBLrLvwes8CaWiYbpPc384GdTorz1ryd8Qz6cGJsjtk=;
	b=rkGSyEWgdZnL7a8ZZc82GIomzYG3RSdIw1aRflZPVwJ78rcVGnSfBT7w8MC2A5SFkB
	EKYf3XXEYRYMz6ka33+Ey2Med8Fx72/7AyueqmYBj6JcjZOy1Xm7lWIn0csuZMH1mZDk
	NZ7KFSn7g3TgwgxZYrEOqAvmFbZyxcvcbm0rA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=QrwjMT0POlrARR0Q5Hv7gx1lebaDc9zbilWnXJeCEpMlZIXytdy1GYApPuY/jBkWFG
	POJH+wKWv8vpVxK9eez6jGf0cofxYxd6OMkHV+4zELyna9C88lJ9QfbsY+P2K4xuo7fh
	wzdLQNOIYCnFX6dl0C2LxAPCDZlvSxx3Lbyeg=
Received: by 10.142.195.12 with SMTP id s12mr5032205wff.307.1305088548235;
	Tue, 10 May 2011 21:35:48 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 25sm10356869wfb.10.2011.05.10.21.35.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 21:35:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2011 21:35:44 -0700
Message-Id: <cover.1305088327.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Do not depend on BBFILES to compute scm dirs
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
X-List-Received-Date: Wed, 11 May 2011 04:38:37 -0000

This fixes the problem that I described in 
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/001966.html

Additionally we do not need directories with */packages/* in BBFILES
anymore

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/misc-fixes
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (2):
  metadata_scm.bbclass: Use COREBASE to grok for SCM operations
  meta/conf/layer.conf: Remove packages/*bb from BBFILES

 meta/classes/metadata_scm.bbclass |    5 +----
 meta/conf/layer.conf              |    2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

-- 
1.7.4.1



