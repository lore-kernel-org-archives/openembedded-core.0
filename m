Return-Path: <roman@khimov.ru>
Received: from roman.khimov.ru (roman.khimov.ru [82.146.54.17])
	by mail.openembedded.org (Postfix) with ESMTP id EEA6C731F3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 17:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khimov.ru;
	s=mail; 
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:Reply-To:To:From;
	bh=zn7dQgFuy5Qhm/z/5A6NVmn3fCdC8quNazqhfiFtELo=; 
	b=jn62/UxkFqm5YpGdXROKcGp4UTJGJsq+J51CP8jlMpvG20JuLFP+4bykA0gzqrCpibDfek1Eecbb2qTXsYbUZKwm0YcJyyhh8mioI2sEtF5nxY4+oK2Cx0Aujdug4OUDKNymzmrJRNW8eKGjjslN3FYU0sJVz8nIrbA5ZV5wWKN377PU9gy2+ae6PwYfkt3HwThC994GIa8RpJE2UCnWIXWPq2LjxMR03t+oJDczuY+x+45+qJ7Grf4AQmDLTQ2A+F43QxMTHGEjbf8q2H1A4050RbkkmxA6Ym23zq5nNNRbYdNC7/3dFZfchdxa4TaC3XVmNZxfCCNgiA5hAeitFA==;
Received: from [93.100.16.104] (helo=masala.hex)
	by roman.khimov.ru with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.84) (envelope-from <roman@khimov.ru>)
	id 1aIKA7-0005L3-Bj; Sun, 10 Jan 2016 20:52:20 +0300
From: Roman Khimov <roman@khimov.ru>
To: openembedded-core@lists.openembedded.org
Reply-To: roman@khimov.ru
Date: Sun, 10 Jan 2016 20:52:16 +0300
Message-ID: <2644403.ISKvOHQyRX@masala.hex>
User-Agent: KMail/4.14.10 (Linux/4.1.13-5-default; KDE/4.14.10; x86_64; ; )
In-Reply-To: <5692911F.1050601@universe-factory.net>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
	<568B0B5D.8000209@windriver.com>
	<5692911F.1050601@universe-factory.net>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] base-files: create ${base_bindir} etc. instead of /bin, /sbin and /lib
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
X-List-Received-Date: Sun, 10 Jan 2016 17:52:27 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 10 =D1=8F=D0=BD=
=D0=B2=D0=B0=D1=80=D1=8F 2016 18:13:03 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=
=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Matthias Schiffer =D0=BD=D0=B0=D0=
=BF=D0=B8=D1=81=D0=B0=D0=BB:
> * I stand by my opinion that moving files automatically is a bad idea=
,

But that's exactly what can make many of /usr merge changes automatical=
ly.=20
Take the kernel as an example, you just don't need the first two hunks =
of the=20
kernel.bbclass patch, fs-perms fixes that for you if it's told that /li=
b is a=20
symlink to 'usr/lib'.

> and the FILES issue mentioned in the other thread further backs my po=
int

IMO, FILES just shouldn't use hard-coded /lib or any other hard-coded p=
ath=20
like that.

--=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

