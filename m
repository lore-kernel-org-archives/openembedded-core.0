Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QHx37-0001EI-U7
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 13:48:53 +0200
Received: by wye20 with SMTP id 20so1730483wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2011 04:46:14 -0700 (PDT)
Received: by 10.216.82.77 with SMTP id n55mr2388705wee.52.1304595973728;
	Thu, 05 May 2011 04:46:13 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	t11sm1045468wes.41.2011.05.05.04.46.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 May 2011 04:46:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1304595529.20791.25.camel@rex>
Date: Thu, 5 May 2011 13:46:10 +0200
Message-Id: <40F9395F-41E1-4780-9E0C-6F0A91362CEB@dominion.thruhere.net>
References: <cover.1304520272.git.paul.eggleton@linux.intel.com>
	<21e4929e2ef79647b16852bb6f15537939012b02.1304520272.git.paul.eggleton@linux.intel.com>
	<1304595529.20791.25.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: poky@yoctoproject.org
Subject: Re: [PATCH 3/3] meta-yocto: add pieces removed from oe-core for beagleboard & atom-pc
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
X-List-Received-Date: Thu, 05 May 2011 11:48:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 mei 2011, om 13:38 heeft Richard Purdie het volgende geschreven:

> Hi Paul,
>=20
> Great work in doing this, thanks. I was just looking at it with a view
> to making machine support cleaner and I think there are still things =
we
> can likely to do help with this. As one example:
>=20
> On Wed, 2011-05-04 at 15:51 +0100, Paul Eggleton wrote:
>> +++ b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.6.3.bbappend
>> @@ -0,0 +1,2 @@
>> +QT_GLFLAGS_atom-pc =3D "-opengl"
>> +
>> diff --git a/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend =
b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend
>> new file mode 100644
>> index 0000000..076ade2
>> --- /dev/null
>> +++ b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend
>> @@ -0,0 +1,2 @@
>> +QT_GLFLAGS_atom-pc =3D "-opengl"
>=20
> could we set QT_GLFLAGS in the machine.conf file instead of using a
> bbappend?

Putting such USEFLAGS in machines sounds like a bad idea. In this case =
enabling it globally and falling back to mesa sw rendering at runtime is =
a better idea. The GL flag only enables extra API and libs, so it's good =
to have.

regards,

Koen=


