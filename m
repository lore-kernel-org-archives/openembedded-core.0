Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1jmx-0008Du-5D
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 19:25:11 +0100
Received: by iwn10 with SMTP id 10so6839001iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 11:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=MI4efr8yZTKauKn5BgucK2kIUaDwc+6B5qFBHTIbvmc=;
	b=cc6zfnk4num809XPsEsKgJwMcygrB6rFp7kR8nVOF45RV7IOKp0TRyvxGdX7gISKSo
	9dNvbWSCjjceOBU28X1tRzyAcRG/yD7DGfRBNiw+BS7B1VoDFV07F79dmurXg6SPeGnC
	VI9jzlQy2x5E9vnIuqB8xWb84upSOOd/GwgZ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=sI+SnXDVR0hUwQEWczyolg9XG5oJolqYZNJI0jR1QH4I9Ro3b+CLTgLz6rQQI2dsks
	2J6MeGdg50zuEMIRfO+z0r9x8hKd619Z2PKy3k2NYdkW0dbVsfaHN48R3BOMy9DkM9YZ
	FLWa8xsejYMHIu/FPasgJld5AC3guLQ+YqyKU=
Received: by 10.42.132.198 with SMTP id e6mr7126889ict.328.1300731801732;
	Mon, 21 Mar 2011 11:23:21 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id wo11sm4103778icb.20.2011.03.21.11.23.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 11:23:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2011 11:23:16 -0700
Message-Id: <cover.1300731672.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Fix perl-native compilation on ubuntu 11.04
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
X-List-Received-Date: Mon, 21 Mar 2011 18:25:11 -0000

Ubuntu decided to move libc and friends to /usr/lib/$ARCH-linux-gnu
so we need to know that in perl's configure


Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/perl
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/perl

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (1):
  perl-native_5.12.2.bb: Fix compliation on ubuntu 11.04-alpha

 .../perl/files/Configure-multilib.patch            |   10 +++++++---
 meta/recipes-devtools/perl/perl-native_5.12.2.bb   |    4 +++-
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
1.7.4.1



