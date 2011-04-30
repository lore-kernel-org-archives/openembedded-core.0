Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QGDAn-0005Gc-TL
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Apr 2011 18:37:38 +0200
Received: by eye27 with SMTP id 27so1412456eye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Apr 2011 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=JCzKak+zRvPiIjAeNAgb2gdYHyBLqZRl6ysP5J5k6GY=;
	b=U17X47yw5gLv5t2vcEw/Ino6TwrnKtuh8OCDA+E9bBD4Gdo8L+RpE62hpeWLmyQVI3
	PIs6TFUX1qMqV3+qik0Fbrl8rriZ2myDl9oziRu6t/rbHgzOpzon5lpbiZHMXRxMJ2ro
	oWS3nmVO5Duv8EbaObVlYCVMLmklCp+HAVtm4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=DqvC33Y0TQ57WnPMH7FaUDZwzqF6xBVahq3K3kLLzejF5X+FKG0wku9Gz4HBJGwarX
	DpGzpSbZo0yR14fg9cYoJQS9PnhJb71RLuSdPw2PVeBwujo+9AeZFLNViSC1ylSDScMq
	VkCN/oNOolymJO+JX3r/uJpJXqRfECo0YKMrw=
Received: by 10.14.4.32 with SMTP id 32mr2620274eei.141.1304181300307; Sat, 30
	Apr 2011 09:35:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Sat, 30 Apr 2011 09:34:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Apr 2011 09:34:30 -0700
Message-ID: <BANLkTi=f-GL8RbJLCAikFTtkON5C9NDvDw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: qemu segfaulting when booting ext3 image
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
X-List-Received-Date: Sat, 30 Apr 2011 16:37:38 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I am seeing qemu segfaulting when booting ext3 image. The same rootfs
boots fine over nfs. It does not give any useful message
as to what happened. I am using the runqemu script. Same used to work
fine 3 weeks back. I tried to blame compilers but the behavior
is same irrespective of gcc version I use or even eglibc/uclibc

Its on x86_64/ubuntu 11.04 host.

Anyone experiencing it ? bisecting can be a long excercise for this.

Thanks
-Khem


