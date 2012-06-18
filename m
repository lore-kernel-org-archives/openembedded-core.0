Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SgUF0-00018R-OW
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 07:11:06 +0200
Received: by werg55 with SMTP id g55so3219810wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2012 22:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=A+QaaGhSSgywWkJs+a7rSXA25nbHzQNpZQUiHLuFETs=;
	b=XRe5su2RWMW3jnJy5p4bAr95kA26zrYZDYoYZilZSqZ4ZNFwx2s5nsMLb28IbFkPtD
	JGY9CF5buUkNMMSwKwfQFtKv8+svhlRUiC2ilHye/xgmUIrUoYmr4c0+WAaDBh58nt3t
	0Tz8T9Ij4KkanVVOmggQ0d885F2SfKzIH25XjMAF/F0b0GpaPYnZv0Lu9UAi0G+yG35H
	uOEslpGYtwXHH8IldTr0YUXnJNbcYHwycIgWmK6jrXSCcPuk6S2jzAuzcniO03Jq4hN5
	uOE3o7j1wMPE58vV9T/ltvwiy8oDJm2HXwKPjGjLZh+gOZzt0ihB3nZ5whtHKTf0n9Iv
	qvOw==
Received: by 10.216.198.162 with SMTP id v34mr8054869wen.75.1339995623450;
	Sun, 17 Jun 2012 22:00:23 -0700 (PDT)
Received: from [10.142.74.208] ([84.241.215.65])
	by mx.google.com with ESMTPS id e20sm23462854wiv.7.2012.06.17.22.00.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 17 Jun 2012 22:00:21 -0700 (PDT)
References: <cover.1339799869.git.dvhart@linux.intel.com>
	<4FDCFEFB.3090004@linux.intel.com>
	<5351B318-5055-410D-91E9-7A0460FC451D@dominion.thruhere.net>
	<2995235.0tdnUIKyVU@helios>
In-Reply-To: <2995235.0tdnUIKyVU@helios>
Mime-Version: 1.0 (1.0)
Message-Id: <282073B0-0EB0-4DCA-9042-151F7003BC46@dominion.thruhere.net>
X-Mailer: iPhone Mail (9B206)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 18 Jun 2012 07:00:19 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQliD74HjFq3OhwCeBz4b2wlydPcjDJ5Kokm6ShiQ8alXs4EgS/3wv570nTThjUp59J2Xwwc
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: Include setsid and cttyhack in defconfig
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
X-List-Received-Date: Mon, 18 Jun 2012 05:11:06 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 17 jun. 2012 om 23:14 heeft Paul Eggleton <paul.eggleton@linux.intel.com>=
 het volgende geschreven:

> On Saturday 16 June 2012 21:41:53 Koen Kooi wrote:
>> Op 16 jun. 2012, om 16:47 heeft Darren Hart het volgende geschreven:
>>> Note that poky-tiny is not currently in its own layer, but is included
>>> in the meta-intel layer. I will look into ways to accomplish this
>>> without adding to the core busybox config and not having to break out
>>> poky-tiny into its own layer.
>>=20
>> What is it with you intel folks (bless their hearts) wanting to combine B=
SP
>> and distro? baerion, guacamayo and poky-tiny all force you to include the=

>> distro stuff if you want any of their recipes. I don't want to have all t=
he
>> hostnames on my boards changed to 'baerion' when I build mediatomb!
>=20
> All of these efforts are separate and put together by different people.
>=20
> Firstly, I think when Darren said "meta-intel" he meant to say "meta-yocto=
"=20
> which is where the poky-tiny distro config can be found (and indeed that i=
s=20
> where I would expect to find it).
>=20
> Secondly, you already asked me about Baryon and I already agreed that it=20=

> needed reorganising and promised to do it; but I haven't had time yet. I'd=
=20
> also point out in any case that it does not contain any BSP and the mere=20=

> presence of the baryon distro config does not force you to use it as you=20=

> suggest.

it does force the distro bbappends onto everyone, messing up /etc/hostname



>=20
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


