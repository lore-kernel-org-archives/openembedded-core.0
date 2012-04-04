Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SFKd9-0000NZ-UD
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 09:27:48 +0200
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id E05F14B011A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2012 09:18:35 +0200 (CEST)
Date: Wed, 4 Apr 2012 09:18:34 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120404091834.367f9617@eb-e6520>
In-Reply-To: <loom.20120404T082801-1@post.gmane.org>
References: <loom.20120404T082801-1@post.gmane.org>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: How to rebuilt the package after modified the source code in open embedded bitbake ...
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
X-List-Received-Date: Wed, 04 Apr 2012 07:27:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Surenda,

Le Wed, 4 Apr 2012 06:34:39 +0000 (UTC),
surendra dhobale <surendra.dhobalelinux@gmail.com> a =E9crit :
>  I am working with the open embedded environment.=20
>=20
> I have added one u-boot package in that. First time by default the compil=
ation
> done successfully using the bitbake. But Now i made some changes in the s=
ource
> code , which is created in the Temp work directory.
>=20
> Now i have to built the same package with neglecting the fetch() stage.=20
> and rebuilt it means need to compilation.
>=20
> Is any commands for that...
> Can please anyone explain me in deatails about that. I am newbie in the o=
pen
> embedded.
>=20
bitbake u-boot -c cleansstate
bitbake u-boot

Eric


