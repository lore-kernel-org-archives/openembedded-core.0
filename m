Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1646C7CA5D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 22:30:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 446NFw4VvWz9m;
	Sat, 23 Feb 2019 23:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1550961044;
	bh=CP0pdqaHTx3WQ6Lw9JTQLyizDP58diMeHhulZh4U7qE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNNQhJOMIhGcQrnGxCxCwJ8m1o6hg3WnvF2jebq4xXba+A9M2sbNbhzj1Uqp0baQf
	b0vY0fycnwJn44HCrtv+uVcCZWstmDOgRmMupp/rtOgdXSaYEbQ9ZJlx8NMGafJNtu
	B96QBGJdtDj2iKd1dzk+sg1UWv2PxCuAAiBO6UU7mFnh668DcgSfLiGbmI01qV7qUh
	9yiV02puf/jBRWavLdeDRhWdVIEuVXzvOb6ks9jVLfpdV1npAAlqNOQrWt4Sr2ADGc
	42hQatFcJA9/9Khag0FPLQuzY+PgAmuvdy6QFzSdw1Jfqb0EaW6KYMvjXYt+iFyX4n
	coQa81P16ZLiIDqDVYHuvTo6qYye4XGoABXQ7TeS50DqXsmGQpWWwWUloY9pKlRKvG
	kcKyFLFzQHHWJXuqG8NpV9bg0haSopQIMBOrNjepc37aYCkGbsLD55SZXwYjUMb5gh
	AtNMbL9r0usOfewEHi+hpWJboytlq5CXrf2m0c5WkOck1g/a/lAxXjbguX34FY7+FE
	zTZtdPNVshPwFaPY8LEIC1oyK7OuAw8Xx3ok0otiXRB6G7NbsjP+stKbCuAotDc0vn
	pzx35IjA4VZ5tKuMkxfYlAhO4EabH6bxPAS9WiRqPLfBDm2UP5rbxLRCuMwz/w7Koi
	HOj9Chfi4H6aMHO2kRvK6vhc=
Date: Sun, 24 Feb 2019 00:30:43 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190223223043.GB24699@localhost>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
	<bd7acae5310c012ee39c5142fa0059c88fcc4b57.1550845989.git.alex.kanavin@gmail.com>
	<CAMKF1sqHzK6Q8-GNLV6Yc5_QuWjKaUMWO==twypXYmRtmvGpKg@mail.gmail.com>
	<CANNYZj8pxkyaYwp+Ob2ZzH=G2iA=F_E1PzOz-L4-q5LdC-C06g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8pxkyaYwp+Ob2ZzH=G2iA=F_E1PzOz-L4-q5LdC-C06g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] virglrenderer: add a recipe
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
X-List-Received-Date: Sat, 23 Feb 2019 22:30:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Feb 22, 2019 at 08:11:27PM +0100, Alexander Kanavin wrote:
> Probably this is the very first time virgl is built for mips :-)
>...

Builds fine in Debian:
https://buildd.debian.org/status/package.php?p=virglrenderer

> Alex

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


