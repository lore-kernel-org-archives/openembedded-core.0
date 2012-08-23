Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T4Qzt-0007r2-M7
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 08:34:30 +0200
Received: by eekb57 with SMTP id b57so82716eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 23:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=9dohnl0r5wF63HHTcKrAN3WLj1dz+0wHX0qiTZXBOnI=;
	b=fyhgY+wLZy4/c424RVy58ANOrMSzujCqNWgYjJjlMEP/obqujAot5OGnKOc/s9ohIm
	xaAQgprK7Srx7AJ2E/sUsvrCgk+ve35Iw/QOgVucA3v76zbiu0mfzoZM+0THcG0lDR9M
	pQLN8gej9j1TaI0GNKhFtPC4yn7cY1FgMo7z3qJmHku73JB9eqnSVh1tNJ4Wjhgj5pIW
	ui75mmTIxIfs+TlyzOzILjKYp/JAoal9ayBGyGc4NpUMoJs7z3i3zkzz1jQCNxCffm8P
	Zi2NkYjvZWh8oVOX5fvthEP++gRiZFxw45YGQz5Vk6m74QvusU+jULEH7aU6SG3m+NMd
	sMdQ==
Received: by 10.14.202.131 with SMTP id d3mr520987eeo.32.1345702943817;
	Wed, 22 Aug 2012 23:22:23 -0700 (PDT)
Received: from ?IPv6:2001:610:612::5d9b:a748:f171:8e6e?
	([2001:610:612:0:5d9b:a748:f171:8e6e])
	by mx.google.com with ESMTPS id v3sm18554670eep.10.2012.08.22.23.22.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 23:22:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CABcZANkyW52k-h1zfpA482b4+q4GyV_nZU2e=giKJExeqWws0A@mail.gmail.com>
Date: Thu, 23 Aug 2012 08:22:21 +0200
Message-Id: <0B0C7CC8-F9B5-4107-942F-1F24D21C629C@dominion.thruhere.net>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<2E13D0D74D03406FAF576083ED655376@gmail.com>
	<CANBf+V29JZm0SqE_YgvAB9PxR7SOvQOUGzGAVKkm6en7ZsGysw@mail.gmail.com>
	<CABcZANkyW52k-h1zfpA482b4+q4GyV_nZU2e=giKJExeqWws0A@mail.gmail.com>
To: Chris Larson <kergoth@gmail.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQmoEgnnv77So/W0uiqrFoVC2SZJfBWqduo02yHYpsa31PsMJwwdgUO/VUboZOGsoK3Yr2mp
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Thu, 23 Aug 2012 06:34:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 aug. 2012, om 21:22 heeft Chris Larson <kergoth@gmail.com> het =
volgende geschreven:

> On Wed, Aug 22, 2012 at 11:59 AM, Joe MacDonald <joe@deserted.net> =
wrote:
>> On Wed, Aug 22, 2012 at 2:20 PM, Christopher Larson =
<kergoth@gmail.com> wrote:
>>> On Friday, June 15, 2012 at 8:15 AM, Joe MacDonald wrote:
>>>=20
>>> We've been talking about this on-and-off at Wind River for a while =
now,
>>> but it now seems like a reasonable time to bring a proposal to the =
OE
>>> community at large. We're thinking about creating a new layer to =
house
>>> recipes, etc. for networking packages. I'll try to address what seem =
to
>>> be the most immediate questions (certainly the ones we've been =
thinking
>>> most about any time I've discussed this with anyone):
>>>=20
>>> Has their been any progress on the creation of this layer?
>>=20
>> Absolutely.  I think at least some of my mail on the subject have =
been
>> bouncing from the lists but the short version is at the end of July
>> the existing "meta-openembedded" pieces were done in my tree and =
there
>> was a list of stuff that needed fixing in migrating the oe-classic
>> bits into the new meta-networking layer (the list I laid out in my
>> initial email).  I was on vacation between then and Monday, so
>> nothing's happened since then but this week I'm back looking at the
>> best way to handle these older recipes that are in need of love in
>> order to work with the current meta-oe and we should be good to go.  =
I
>> think what's likely to happen is there will be some of them updated
>> right away and others will be integrated and updated soon after.
>=20
> Sounds good, thanks for the update. Is this repository-in-progress
> available somewhere public yet?

I'd very much welcome a patch creating an empty layer in =
meta-openembedded with just the README, layer.conf and COPYING.MIT=


