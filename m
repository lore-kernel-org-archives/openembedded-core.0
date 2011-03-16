Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzhpK-0008J4-9G
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 04:55:14 +0100
Received: by iyb26 with SMTP id 26so1294629iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 20:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=HJcLorVRmgQxmuD/jDtcypEpYrgbwFZPMZdzS8hjtLE=;
	b=G44aIGyMfLjSL/R/5yLp56MMgIjTfbCt83YbO8tWgZ2hep+VgYjVtue9jQqZNSbApK
	2Vg08/fpsewv0dyT57i8kFkFByHKT5yW65h8ivS/7cQDpkqbwZZtSzBF10S/YDf8sL8A
	hmwRkP4GmEnTnLu4wOBxRJA03Up1h1+A2LxBw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Dh3tA+PJDqmeYdQvowd91vqhB8ci+WPjjvqMlfGQ17EMx52MgWOF1hE8LOEWf9JYxS
	xYVWiM+3z0/pCVQ3/troHXmdV4f3bP+ut8KGcRZxv2mhlk3Poyaezc7DP10UrBfDPj/B
	7QFoJLGuF4m8HxXOg+zSrchoRz5L8xkXxxATA=
Received: by 10.43.134.1 with SMTP id ia1mr285920icc.127.1300247607795;
	Tue, 15 Mar 2011 20:53:27 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 8sm330109iba.16.2011.03.15.20.53.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 20:53:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Mar 2011 20:53:23 -0700
Message-Id: <cover.1300247367.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH,v2 0/1] Grok git config sendmail.to if available
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
X-List-Received-Date: Wed, 16 Mar 2011 03:55:14 -0000

includes Darren's review comments

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/scripts
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/scripts

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (1):
  send-pull-request: Fetch TO email address from git config if
    specified

 scripts/send-pull-request |   21 +++++++++++++++------
 1 files changed, 15 insertions(+), 6 deletions(-)

-- 
1.7.4.1



