Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QYyQF-00073j-Uf
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 12:43:08 +0200
Received: by fxm19 with SMTP id 19so1183232fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 03:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=mZhrdtBwYMiAado02kdfWU3GJKdrqccNNcKMwofU/cU=;
	b=VwKPV32R86dYaRtChiwNBurTtl+EVpF7vTKDDcVYFH5/I5JScULa3KkHkLrSc1ekIb
	8eOdZEknkvzmZPTp51keg2StBNlYeLntGr4Nni4uRUcQROloFdWLh29E8UuIl0vHbJac
	zf5Ay4BWldZo2/Fp+o2ZlkznjDEiAGzX35v2Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dpV6O32vetO9dQ5yEEBm/kSU757zvlZbqBWtvtOYG9Ipg9ARYER717uQFVxW99IZtI
	uDVJe3N2Gk664Qm17sjQHZdescCdXQ6QMe7fc5WmjzlJ9qslclWbck5PTQxn0vSxN3/o
	eR7RUG3WuztodNWquxgcoibYDStFGJzLN7d0g=
MIME-Version: 1.0
Received: by 10.223.94.129 with SMTP id z1mr3604043fam.144.1308652774828; Tue,
	21 Jun 2011 03:39:34 -0700 (PDT)
Received: by 10.223.114.1 with HTTP; Tue, 21 Jun 2011 03:39:34 -0700 (PDT)
In-Reply-To: <165E34A0-6D6F-4214-A61B-9DD86562AC47@dominion.thruhere.net>
References: <cover.1308642976.git.dongxiao.xu@intel.com>
	<42f214f6550292a92714dc3e0d29eaf8d2e5d250.1308642976.git.dongxiao.xu@intel.com>
	<1308647576.21613.10.camel@phil-desktop>
	<BANLkTin6-QheW3=aOKNB9h9RcOo4SL9nhA@mail.gmail.com>
	<165E34A0-6D6F-4214-A61B-9DD86562AC47@dominion.thruhere.net>
Date: Tue, 21 Jun 2011 12:39:34 +0200
Message-ID: <BANLkTintTwOPk_+xWb_oYO+ze=f2n=tJHQ@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] connman: Upgrade to version 0.75
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
X-List-Received-Date: Tue, 21 Jun 2011 10:43:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2011 at 11:54, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
>
> Op 21 jun 2011, om 11:34 heeft Anders Darander het volgende geschreven:
>
>> On Tue, Jun 21, 2011 at 11:12, Phil Blundell <pb@pbcl.net> wrote:
>>> On Tue, 2011-06-21 at 16:08 +0800, Dongxiao Xu wrote:
>>>> -DEPENDS =A0=3D "libgdbus dbus glib-2.0 hal iptables"
>>>> -RDEPENDS_${PN} =3D "wpa-supplicant resolvconf"
>>>> +DEPENDS =A0=3D "libgdbus dbus glib-2.0 hal iptables ofono wpa-supplic=
ant resolvconf bluez4"
>>>
>>> What does the dependency stack for ofono look like? =A0If it's non-triv=
ial
>>> then I am not sure it is a good idea to add ofono to DEPENDS
>>> unconditionally.
>>
>> Although Koen showed that the dependcies were quite trivial, I'd
>> prefer to not build ofono if it is possible.
>>
>>> Ditto bluez4, I don't think that should be in there unless
>>> DISTRO_FEATURES requested it.
>>
>> Yes, I certainly agree with you on bluez4. If we don't have bluetooth
>> enabled for our machine/distro, I definitely prefere to not build it.
>>
>> To me it's not only about the risk that we increase the rootfs, but
>> also about build-times. Even if we have quite fast machines today, it
>> is a waste of CPU cycles to build lots of SW that aren't going to be
>> used...
>>
>> Adding a dependency etc is easily done in a bbappen-file, which makes
>> the reversed desire quite easy. I'm not sure if there is an easy way
>> of removing item from e.g. DEPENDS and EXTRA_OECONF etc.
>
> I'd trade extra build time over not having to use bbappends anytime. Espe=
cially where upstream has proper plugin support like connman.

In cases like connman (with proper plugin-support, and a good
packaging), yes, then it is only about build time. And sure, in some
cases I completely agree with you.

However, occasionally when building a really tiny image adding a small
package could result in a complete build of X and lots of other stuff.
In such cases it's not always that funny. (Sorry, it was a long time
ago on .dev that this happened, so I don't remember what package it
was). Apart from these kind of situations, it's normally not a big
problem, unless you're in a development stage where you need frequent
clean rebuilds...

(Another drawback, although it is really only on the first build, is
that building lots of unnecessary packages increases the risk of
build/fetch problems.)

Currently I can't access cgit.openembedded.org (probably the local
network), so I can't check it. But isn't e.g. bluetooth found
somewhere in either DISTRO_FEATURES or MACHINE_FEATURES? If so, bluez4
and configure options should probably be set conditionally.

/Anders


