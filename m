Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QHxkj-0005gy-EG
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 14:33:57 +0200
Received: by wye20 with SMTP id 20so1764239wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2011 05:31:17 -0700 (PDT)
Received: by 10.227.170.71 with SMTP id c7mr2467261wbz.104.1304598677666;
	Thu, 05 May 2011 05:31:17 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	o23sm1323293wbc.61.2011.05.05.05.31.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 May 2011 05:31:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1304598075.29269.2.camel@rex>
Date: Thu, 5 May 2011 14:31:13 +0200
Message-Id: <148CCAB7-27BE-4DA5-B1FB-409976E2A918@dominion.thruhere.net>
References: <cover.1304520272.git.paul.eggleton@linux.intel.com>
	<21e4929e2ef79647b16852bb6f15537939012b02.1304520272.git.paul.eggleton@linux.intel.com>
	<1304595529.20791.25.camel@rex>
	<40F9395F-41E1-4780-9E0C-6F0A91362CEB@dominion.thruhere.net>
	<1304598075.29269.2.camel@rex>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1084)
Cc: poky@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 3/3] meta-yocto: add pieces removed from oe-core for beagleboard & atom-pc
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
X-List-Received-Date: Thu, 05 May 2011 12:33:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 mei 2011, om 14:21 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-05-05 at 13:46 +0200, Koen Kooi wrote:
>> Op 5 mei 2011, om 13:38 heeft Richard Purdie het volgende geschreven:
>>=20
>>> Hi Paul,
>>>=20
>>> Great work in doing this, thanks. I was just looking at it with a =
view
>>> to making machine support cleaner and I think there are still things =
we
>>> can likely to do help with this. As one example:
>>>=20
>>> On Wed, 2011-05-04 at 15:51 +0100, Paul Eggleton wrote:
>>>> +++ b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.6.3.bbappend
>>>> @@ -0,0 +1,2 @@
>>>> +QT_GLFLAGS_atom-pc =3D "-opengl"
>>>> +
>>>> diff --git a/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend =
b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend
>>>> new file mode 100644
>>>> index 0000000..076ade2
>>>> --- /dev/null
>>>> +++ b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend
>>>> @@ -0,0 +1,2 @@
>>>> +QT_GLFLAGS_atom-pc =3D "-opengl"
>>>=20
>>> could we set QT_GLFLAGS in the machine.conf file instead of using a
>>> bbappend?
>>=20
>> Putting such USEFLAGS in machines sounds like a bad idea. In this =
case
>> enabling it globally and falling back to mesa sw rendering at runtime
>> is a better idea. The GL flag only enables extra API and libs, so =
it's
>> good to have.
>=20
> Agreed, longer term I think this is going to be the better way to =
handle
> this. In this day and age, defaulting to sw rendering is probably the
> sane thing to do.

Something like SOC_FAMILY would help here.

> Equally, moving this from a .bbappend to the machine file is a bit
> cleaner too though :)

Is it? Do you really want the machine to know about all the knobs in all =
the different layers? The .bbappends clearly signals a change to the =
recipe, hiding it in the machine.conf will just confuse people. And when =
changing options you need to edit the machine and then use PR_INC in a =
different file. Using a bbappend limits that to a single file=


