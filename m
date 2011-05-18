Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMkgo-0006DG-Ja
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:37:44 +0200
Received: by wye20 with SMTP id 20so1506639wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 10:34:28 -0700 (PDT)
Received: by 10.227.197.83 with SMTP id ej19mr2079321wbb.105.1305739756660;
	Wed, 18 May 2011 10:29:16 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id bd8sm1097239wbb.14.2011.05.18.10.29.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 10:29:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305738527.18415.126.camel@lenovo.internal.reciva.com>
Date: Wed, 18 May 2011 19:29:10 +0200
Message-Id: <8A91C5F6-313A-4A0F-A18E-094CFC3BB337@dominion.thruhere.net>
References: <cover.1305665459.git.raj.khem@gmail.com>
	<cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
	<1305734038.18415.108.camel@lenovo.internal.reciva.com>
	<BANLkTikiNW0UEfLM_UtKeekTcrW5UNNfUA@mail.gmail.com>
	<1305738527.18415.126.camel@lenovo.internal.reciva.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
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
X-List-Received-Date: Wed, 18 May 2011 17:37:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 mei 2011, om 19:08 heeft Phil Blundell het volgende geschreven:

> On Wed, 2011-05-18 at 09:40 -0700, Khem Raj wrote:
>> Problem I have is, I dont want udev in RDEPENDS which is added by
>> task-core-boot
>> and task-core-boot is added to DISTRO_EXTRA_RDEPENDS through
>> default-distrovars.inc -> defaultsetup.conf -> bitbake.conf
>>=20
>> and my distro adds DISTRO_EXTRA_RDEPENDS to its RDEPENDS
>> as I think the variable is meant for distro's to define some extra
>> stuff if needed.
>>=20
>> How should I solve this problem ?
>=20
> Well, what I did in micro-base-image was simply to not use
> task-core-boot at all.  But in your case I was thinking that you could
> overlay that recipe with from your distro's layer and make it do
> whatever you wanted.

The fact that we have layers does not mean we need to follow the silo =
mentality you seem to prefer. If task-base in oe-core stops being =
usefull we should fix it, now play around in our own little sandboxes.=


