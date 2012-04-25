Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SNBqR-0002Qf-PM
	for openembedded-core@lists.linuxtogo.org;
	Thu, 26 Apr 2012 01:41:59 +0200
Received: by lagw12 with SMTP id w12so531594lag.6
	for <openembedded-core@lists.linuxtogo.org>;
	Wed, 25 Apr 2012 16:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=QNB2UdV571XjN/rC+q2Pf8Gpu69p4/1zYcRpL9+TsAg=;
	b=cNKvlL8ckJVJBRYqJz/9OYnQkhXJc4h6Jdv4FV/kYQ8NCo1GHeB1DOc+hrNiJMnnih
	5h4eeOogY/0rYa89/VSL9f2X/jy4vjdeSdZR3v4AhHIvSuoICkJX4ouRkOYC+W0UU33/
	m37rHBtVSBJFDqxjQFbwL8tVDL+kGFFrlzILOgw6ZDDs9Mc1o+YdP4TFhT9MtlRAEBJ4
	k5B3QnoKs6H9idGeof8C+58BZqH3hpVTScpUZqxo1EIzhTuPgRfW1lWbkMaRmY/ApV54
	/uNsK4dKJaLEHldUxPJi19mfPzKnsto7cp2Gt2ShgNCFXO40ZWYaC/ORq4SVP2wBDYiZ
	vhTQ==
Received: by 10.152.145.228 with SMTP id sx4mr3571358lab.45.1335396743351;
	Wed, 25 Apr 2012 16:32:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Wed, 25 Apr 2012 16:31:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Apr 2012 16:31:53 -0700
Message-ID: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
Subject: gcc 4.7 + mips64 architecture support
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
X-List-Received-Date: Wed, 25 Apr 2012 23:41:59 -0000
Content-Type: text/plain; charset=UTF-8

Hello

Now that release is almost out of door. I would like some eyes on the
gcc-4.7 work
and mips64 architecture support that I have done meanwhile

I have made sure that gcc-4.6 still keeps working and I have patches
for gcc-4.5 too
for meta-oe too. I have repeatedly built core-image-sato and
core-image-minimal for uclibc/eglibc
but more coverage would be nicer.

The patches are posted here

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc

I would appreciate any feedback or testing on this

Thanks
-Khem


