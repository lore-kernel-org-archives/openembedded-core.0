Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qbh2b-0003VT-0S
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 00:45:57 +0200
Received: by pvf24 with SMTP id 24so437893pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 15:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=eEI+vUa9KeXl0k961edtRuwfE/oB3xjpJMzGUOGuxZw=;
	b=gusCY8gIiKqMm7L1O7FzGGpy4hSd0beSvmOAlfw4koqUQTBpF5/UMThbdwOFpdtQxh
	bcRuqdQFNG3KADU8hI4Hvm6drnH9VfnvHOe5azcfU7ctFCaqRa6vvaJAh0oEXZOByEoH
	f3C8ihSEVyjkXewRW1vuWwHiwVi9yaBX86a4Q=
Received: by 10.68.12.65 with SMTP id w1mr144227pbb.294.1309300932076; Tue, 28
	Jun 2011 15:42:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Tue, 28 Jun 2011 15:41:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jun 2011 15:41:42 -0700
Message-ID: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Conflicting providers for ssh/sshd (dropbear and openssh)
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
X-List-Received-Date: Tue, 28 Jun 2011 22:45:57 -0000
Content-Type: text/plain; charset=UTF-8

ERROR: Multiple .bb files are due to be built which each provide ssh
(/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.52.bb
/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-connectivity/openssh/openssh_5.8p2.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide sshd
(/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.52.bb
/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-connectivity/openssh/openssh_5.8p2.bb).
 This usually means one provides something the other doesn't and should.

reason is that dropbear only provides ssh and sshd packages openssh
provides a few more e.g. openssh-sftp-server which is demanded by
some images and at same time wants dropbear to provide sshd and ssh

Now both recipes are to be built but are in contention for providing
ssh and sshd

How to solve this problem. ? Are other packages that openssh provides
strictly depending on ssh/sshd from openssh ? or will they work on
any ssh/sshd ?

If they are independent then may be the openssh recipe should be
divided into openssh-ssh and openssh-rest so one can use openssh
provided daemon or dropbear provided as they wish

Thanks
-Khem


