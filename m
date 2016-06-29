Return-Path: <embedded@die-kriestens.de>
X-Greylist: delayed 529 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 29 Jun 2016 19:33:05 UTC
Received: from outbound1.flatbooster.com (outbound1.flatbooster.com
	[84.200.50.201])
	by mail.openembedded.org (Postfix) with ESMTP id BE7D660043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 19:33:05 +0000 (UTC)
Received: from localhost (outbound1.flatbooster.com [127.0.0.1])
	by outbound1.flatbooster.com (Postfix) with ESMTP id 8A6886D6474B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 21:24:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outbound1.flatbooster.com
Received: from outbound1.flatbooster.com ([127.0.0.1])
	by localhost (outbound1.flatbooster.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id QamZ0AqMLDcJ
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 21:24:14 +0200 (CEST)
Received: from rex23.flatbooster.com (rex23b.flatbooster.com [93.186.195.156])
	by outbound1.flatbooster.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 21:24:14 +0200 (CEST)
Received: from vpn-199-169.hrz.tu-chemnitz.de (vpn-199-169.hrz.tu-chemnitz.de
	[134.109.199.169])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: web130220p1)
	by rex23.flatbooster.com (Postfix) with ESMTPSA id 699EA1B30BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 21:24:14 +0200 (CEST)
From: Daniel Kriesten <embedded@die-kriestens.de>
Message-Id: <1586B03B-3244-4FB3-82F7-803CFD983532@die-kriestens.de>
Date: Wed, 29 Jun 2016 21:24:13 +0200
To: openembedded-core@lists.openembedded.org
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Subject: Building Perl-5.22.1-r0 on Arch Linux fails with QA Issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2016 19:33:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dear List,

Building a Yocto BSP fails with
ERROR: QA Issue: Architecture did not match (=E2=80=A6) on =
work/i586-poky-linux/perl/5.22.1-r0/packages=E2=80=A6

My build host is running a 64-bit Arch Linux*. I downgraded to =
gcc-multilibs-5.3.0, the rest of the system is up-to-date.

I tried several traget architectures (i586, i.MX6) as well as different =
BSPs. But they all fail with the perl QA Issue. Unfortunately, I don=E2=80=
=99t get a answer out of google. Thus, I hope someone here can lend me a =
hand?

*I know, it=E2=80=99s not perfect. But I do not have an other machine at =
hand, yet.

--=20
Daniel Kriesten
daniel@die-kriestens.de
http://www.die-kriestens.de


