Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SKTwb-0000no-3G
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 14:25:09 +0200
Received: by wibhj13 with SMTP id hj13so512341wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 05:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=QLmt2Z2wOTUJe1ufpYHcgbuYVF1JnVM1CjX/Q/04xGA=;
	b=H4tTtaDjxStRnLEei1B/d0ld4dPvZer/A/k0UCJWW+lKREePfCVcAUjvL37lxEctM3
	xvdj6RWUJZci3MC62GHu4VbTY+qVGw6c/QvSVNASxMj+30paONTeVrCxmFsnEfcN1Wg1
	LKgcIWJ67+fiB/Q3MLlTKU8isNBV4R2841v/lXfFlYx15SBIBxEYwqMsigr77Eajg4gu
	41X/rZUex019FAawE4lMOEGQTTGa9s9zzCduv67HDBoOR/dznbpP+LL82fiZ/5kAtGQP
	iwndSUC8aopEjtHqh1adGNOl4lzcMo7b6QSPcxJYqTTL7DL0TKlrN4SejtVdrKkBewzJ
	0KhQ==
Received: by 10.180.80.70 with SMTP id p6mr16243193wix.21.1334751342008;
	Wed, 18 Apr 2012 05:15:42 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ca3sm34184549wib.6.2012.04.18.05.15.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 05:15:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334750426.24091.73.camel@ted>
Date: Wed, 18 Apr 2012 14:15:38 +0200
Message-Id: <BE644AD6-3782-4B48-ABDC-3FEE8BE44E2F@dominion.thruhere.net>
References: <4F847380.6000401@windriver.com>
	<4F8489DE.1050905@opendreambox.org>
	<4F8C24CB.3080607@opendreambox.org> <1334587325.616.4.camel@ted>
	<4F8C379A.3070903@opendreambox.org> <4F8C3B19.40400@windriver.com>
	<4F8EA5CC.6010101@opendreambox.org> <1334749226.24091.67.camel@ted>
	<4F8EA972.1090304@opendreambox.org>
	<20120418115428.GJ3635@jama.jama.net>
	<1334750426.24091.73.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkUe9+0j6YxBdr6lcOkxJ2LPkkh9KJfcMq7WmjAZKj7p1RAFU5/RtrQ8YzzCuhCtW4w33Ya
Subject: Re: MIPS vs MIPS32 tunings -- summary and questions
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
X-List-Received-Date: Wed, 18 Apr 2012 12:25:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 apr. 2012, om 14:00 heeft Richard Purdie het volgende geschreven:

> On Wed, 2012-04-18 at 13:54 +0200, Martin Jansa wrote:
>> On Wed, Apr 18, 2012 at 01:45:54PM +0200, Andreas Oberritter wrote:
>>> On 18.04.2012 13:40, Richard Purdie wrote:
>>>> On Wed, 2012-04-18 at 13:30 +0200, Andreas Oberritter wrote:
>>>>> now, after having repacked all binary tarballs that had mipsel or
>>>>> mipsel-nf in their name and contents, and after having changed all
>>>>> occurrences of mipsel and mipsel-nf in my local recipes (where
>>>>> appropriate), and after having rebuilt everything from scratch =
again, it
>>>>> came to my attention that "mipsel" in PACKAGE_EXTRA_ARCHS breaks =
opkg,
>>>>> because no mipsel packages are being generated. That's what I told
>>>>> before, right?
>>>>=20
>>>> How is this breaking opkg? We often have architectures listed in =
there
>>>> for which there are no packages generated (all, noarch and any =
spring to
>>>> mind)?
>>>=20
>>> Downloading http://10.0.0.1/mipsel/Packages.gz.
>>> wget: server returned error: HTTP/1.1 404 Not Found
>>> Collected errors:
>>> * opkg_download: Failed to download =
http://10.0.0.1/mipsel/Packages.gz, wget returned 1.
>>=20
>> I had a lot of those (e.g. because armv7a-vfp-neon was including 20
>> arm*feed.conf variants in /etc/opkg most of them empty - without
>> Packages.gz).
>>=20
>> So I've added "filter" to distro-feed-configs
>> =
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D236=
aa553bb0f82f741c6edb793e96f421f24f4fa
>> to add only feeds I'm generating (and I also don't want armv5* =
packages
>> installed on armv7a-vfp-neon target unless user explicitly adds =
armv5*
>> feed).
>=20
> This is the better solution. I think we need to get a better default
> feed-config generation mechanism into the core. Distros may still need
> to tweak it but it would be good to share some of the best =
practises...

That's exactly why I invented FEED_ARCH a few years ago, which is now =
changed to BASE_PACKAGE_ARCH. The angstrom-feed-configs recipe which =
distro-feed-configs was based on doesn't support from the the above =
drawbacks.
This discussion about using all PACKAGE_*_ARCHS to generate URLs pops up =
every other year with people concluding that distro-feed-configs sucks.
I can only recommend to have an integrated solution to manage your =
binary feeds instead of trying to fit it into the (broken) =
distro-feed-config model.

regards,

Koen=


