Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QM2Y5-0007qo-FQ
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 20:29:45 +0200
Received: by pxi6 with SMTP id 6so3670386pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 11:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=loJ2hgbsrdvoQntVYO0obO0FJor8tOk2ZsnFgmiTZlc=;
	b=qA8KZaJCsGJMZvCMJOJ2DGT4fc4cGoc+VvBkVjSA2orqHQjbHImzBgOPWwEC/45AHS
	WdzrpkcsvedS0zmbWo7hQLAPboF89KzPBd27yEhp3ucEQHcLhDox7uqAKIQWol0tOxBi
	o0PdN5S8JuitBe93u9MbYdjSxwWy17pyZNoIc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=dtd/GIFNrBeNM+2yl+nhI7Tlzyxh6gk/y8B7CikLyLm5vhRBUIB51oP9TX0BOeoN/3
	YjXnwE0IwgLiC4JnMGAJq/q8XUS6Vk57AShsCTVVirtiuaH2+nm55FL2EC1bAdaH27m/
	ua9iN3O/3nrFoR2SYCCoqNKze36yxmJEMy6hE=
Received: by 10.142.191.3 with SMTP id o3mr3136423wff.59.1305570409223;
	Mon, 16 May 2011 11:26:49 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w14sm4877864wfh.20.2011.05.16.11.26.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 11:26:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2011 11:26:39 -0700
Message-Id: <cover.1305570339.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Bugfix in PRINC increment
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
X-List-Received-Date: Mon, 16 May 2011 18:29:45 -0000


Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/princ
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/princ

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (1):
  base.bbclass: Fix PR increment bug when PR number is a single digit

 meta/classes/base.bbclass |   19 ++++++-------------
 1 files changed, 6 insertions(+), 13 deletions(-)

-- 
1.7.4.1



