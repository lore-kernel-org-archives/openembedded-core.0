Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1UCc0J-0004ym-AM
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 21:29:00 +0100
Received: by mail-pb0-f46.google.com with SMTP id uo15so3344614pbc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 12:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:content-type:content-transfer-encoding:subject
	:message-id:date:to:mime-version:x-mailer;
	bh=VngK591rj0SG+yRQfVX0CR0cYXPaS/BTCnX+YX4Cnf8=;
	b=J9ZPTi70IJM5aV6Aq7mocd0ql+LhZncKdeGYIeZFJJjOlomVcSLy24oLkJkzBBmjRu
	EKcE7WqQXgF8CUMwlPMBzMc/itoFOIkY87+TSKB3eL4DwUm7DAPNL5qqGdpaYvRqaQSb
	YZJ4E3WMGw/dz9dRTBf36+PGK23SjBx+7RW/TndR3rlkixXWd7LAo7T5DSxbQ33hEN0N
	CNBEZe0BA8GK6JM2+IRJkVLUuwMyGdp6TgkWBe7aTvc0pJFLZW4t7biAR17GMnfzWnwy
	gjfLtWURNVvraiTMwmADbzvuNibV+fQk0xhVl+lAykHVB/mjbgtNqLTjUmCo30Q4XHZX
	PHvA==
X-Received: by 10.68.48.227 with SMTP id p3mr30794953pbn.34.1362427950086;
	Mon, 04 Mar 2013 12:12:30 -0800 (PST)
Received: from [192.168.1.100] ([94.205.106.4])
	by mx.google.com with ESMTPS id gf6sm23484081pbc.24.2013.03.04.12.12.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 12:12:28 -0800 (PST)
From: Elvis Dowson <elvis.dowson@gmail.com>
Message-Id: <6BF736AB-19CF-4DF3-B136-E462875292B5@gmail.com>
Date: Tue, 5 Mar 2013 00:12:21 +0400
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
X-Mailer: Apple Mail (2.1499)
Subject: Enabling microblaze support for gcc-4.7.2
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
X-List-Received-Date: Mon, 04 Mar 2013 20:29:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      I'm trying to build the toolchain for the microblaze processor, =
but I get an error with gcc-cross-initial_4.7.bb:

opening microblaze-c.o: No such file or directory.

If I look in the =
build/tmp/work/microblaze-poky-linux/gcc-cross-initial/4.7.2-r18/gcc-4.7.2=
/gcc/config folder

I can only see the following processor architectures
i386
mips
rs6000
s390
sparc

If I search for microblaze-c.o, it hasn't been built.

I using the meta-xilinx tree, and the yocto/poky master branch for this =
build.

How do I go about enabling support in gcc to get it to build a toolchain =
for the microblaze processor?

Elvis Dowson=


