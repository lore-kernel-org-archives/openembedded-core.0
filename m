Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMSFp-0006L4-Pa
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 23:56:38 +0200
Received: by pvc30 with SMTP id 30so448024pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=k2ESAQI1NkOFYqj0CGEiNLdS0lTxyrKzgGSMh/nyOOA=;
	b=flU3ZBc3pgfH1jEF8gLL+THZNmYgbzh9k1AU4RVM+psGmd4FHiBT7spZeYhR9YRSie
	gzlQD5Lb+H3I1puhrj1xm3ijsto+uAYm5jPx/WGqpmF4sX0ymYc9Xqru3vaSNpzD1Ub8
	vsk0L70xqrxQxWNWTgoVhaurl92nsAtG4n+VU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=g2FfF0911izBpo4qlm1yVlcQhyAs02tOuMqPKlcoZduWdW6sVg304wlnGdVKFOxPY7
	oMto+Jejv3qGeOzfMcn5yyRJHvYG4q41eHJ3McprxVDjvnOLncG/kkzb7vSJR7UcgUxz
	WzzQebpAOBGuG9EnI2SPjGDcIXloBpQVLqbhA=
Received: by 10.68.44.200 with SMTP id g8mr1822725pbm.362.1305669223054;
	Tue, 17 May 2011 14:53:43 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g5sm609709pbj.62.2011.05.17.14.53.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 14:53:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: koen@dominion.thruhere.net,
	OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2011 14:53:32 -0700
Message-Id: <cover.1305668854.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCHv2 0/1] Define some distro overridable varibles
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
X-List-Received-Date: Tue, 17 May 2011 21:56:38 -0000

This is V2. Additionally the variables are image specific
and added through image class and not through task

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/distrovars
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/distrovars

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (1):
  conf: Create distro overridable IMAGE varibales

 meta/classes/image.bbclass                      |    9 ++++++++-
 meta/conf/distro/include/default-distrovars.inc |   13 +++++++++++++
 meta/recipes-core/tasks/task-core-boot.bb       |    4 ----
 3 files changed, 21 insertions(+), 5 deletions(-)

-- 
1.7.4.1



