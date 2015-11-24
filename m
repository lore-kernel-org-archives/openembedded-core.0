Return-Path: <roman@khimov.ru>
Received: from roman.khimov.ru (roman.khimov.ru [82.146.54.17])
	by mail.openembedded.org (Postfix) with ESMTP id B8BA16011C;
	Tue, 24 Nov 2015 18:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khimov.ru;
	s=mail; 
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:Reply-To:To:From;
	bh=FB1bhmoIgZHnHM3ycmmjKXxEUPTNO7XmjBnU9J3bOmk=; 
	b=R6GIj6c0fP83hd6JCbbtCmuI8vChHEKIKeAGSyerVFck6KCBpOdBP32vkdNaRkfz9mKxdqnwoDHoUJjGNTlWPTEeZPGQVJJ2IVOZPFXRntzz72T4X1miHtnO0hgUuDnNbPEJNPBGSbBiX2CXrvv2C9KKa8zoMuSm8kBIn3Bho0ph9elYuFoxfezGZN/Tw8r6J0SEE/U/FC81Ab0DhowkSRwUdJvbL7A2URXbJw0WwutRkHYEM3x+ZFFWKy9m8U23cKfQexe8wcdLL6PbkYqlaW5MjiM512LucRvfjm1GxTz2QP25kGoGi9rZKF0s4yKIh3JyX/J7zJ9M2u3CwBPtPw==;
Received: from [93.100.16.104] (helo=masala.hex)
	by roman.khimov.ru with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.84) (envelope-from <roman@khimov.ru>)
	id 1a1I2Y-0002MK-PW; Tue, 24 Nov 2015 21:10:07 +0300
From: Roman Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Reply-To: roman@khimov.ru
Date: Tue, 24 Nov 2015 21:10:06 +0300
Message-ID: <2424232.iiZWdud31T@masala.hex>
User-Agent: KMail/4.14.10 (Linux/4.1.12-1-default; KDE/4.14.10; x86_64; ; )
In-Reply-To: <56549099.6070301@linux.intel.com>
References: <56538808.5050606@linux.intel.com> <60350861.Ng52JMGuMb@bancha.hex>
	<56549099.6070301@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [oe] RFC: Reference updater filesystem
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
X-List-Received-Date: Tue, 24 Nov 2015 18:10:11 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 24 =D0=BD=D0=BE=
=D1=8F=D0=B1=D1=80=D1=8F 2015 10:30:17 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=
=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Lopez, Mariano =D0=BD=D0=B0=D0=BF=
=D0=B8=D1=81=D0=B0=D0=BB:
> > That's the right solution, although to do it really right (at least=
 IMO)
> > you need to implement the /usr merge [1] (and that's orthogonal to =
using
> > or not using systemd), which can also help you make your /usr read-=
only
> > (because that's just code and static data) with read-write / for us=
er
> > data of various sorts.
>=20
> To be honest I'm not familiar with /usr merge, I need to check on tha=
t
> to see if it is a good option with the current OE-core infrastructure=
.

It needs some patches for current OE, I hope I'll find some time to reb=
ase the=20
set I have for this (based on fido) and send it for discussion.

--=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

