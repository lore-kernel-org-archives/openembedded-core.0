Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UPCWw-0006NA-08
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 15:54:44 +0200
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id B8BBD4B028C;
	Mon,  8 Apr 2013 15:37:19 +0200 (CEST)
Date: Mon, 8 Apr 2013 15:37:18 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20130408153718.78a8dfb3@e6520eb>
In-Reply-To: <CAP9ODKqfL7o1pjTALefq148uiLQcUBOzv5Tdc5d_wMwfZW8PFw@mail.gmail.com>
References: <1365268668-15483-1-git-send-email-otavio@ossystems.com.br>
	<20130406200203.6eca6094@e6520eb>
	<CAP9ODKoG2xAL+45oqL++9rWWGC+CRBQyFa3jtX-fFUYKdvCOMA@mail.gmail.com>
	<20130407073745.54c2d0e8@e6520eb>
	<CAP9ODKqfL7o1pjTALefq148uiLQcUBOzv5Tdc5d_wMwfZW8PFw@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Fix matching of SOC_FAMILY in COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 08 Apr 2013 13:54:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio,

Le Mon, 8 Apr 2013 10:31:17 -0300,
Otavio Salvador <otavio@ossystems.com.br> a =C3=A9crit :

> On Sun, Apr 7, 2013 at 2:37 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> > Le Sat, 6 Apr 2013 17:58:30 -0300,
> > Otavio Salvador <otavio@ossystems.com.br> a =C3=A9crit :
> >
> >> On Sat, Apr 6, 2013 at 3:02 PM, Eric B=C3=A9nard <eric@eukrea.com> wro=
te:
> >> > Hi Otavio,
> >> >
> >> > Le Sat,  6 Apr 2013 14:17:48 -0300,
> >> > Otavio Salvador <otavio@ossystems.com.br> a =C3=A9crit :
> >> >> +            compat_machines =3D [d.getVar('MACHINE', True)]
> >> >> +            compat_machines.extend((d.getVar('SOC_FAMILY', True) o=
r "").split(":"))
> >> >> +            for this_machine in compat_machines:
> >> >> +                if re.match(need_machine, this_machine):
> >> >> +                    break
> >> >> +            else:
> >> >> +                raise bb.parse.SkipPackage("incompatible with mach=
ine %s (not in COMPATIBLE_MACHINE)" % this_machine)
> >> >>
> >> > aren't you breaking this log here vs what is was supposed to
> >> > print before ?
> >>
> >> The 'else' is used when no 'break' is done inside of for loop.
> >>
> > but will this_machine contain the value of the MACHINE variable ?
>=20
> Yes, check:
>=20
> ...
> +            compat_machines =3D [d.getVar('MACHINE', True)]
> +            compat_machines.extend((d.getVar('SOC_FAMILY', True) or
> "").split(":"))
> ...
>=20
I'm not very experienced in python so sorry is that's a stupid
remark but after these lines you are using this_machine to go
through the content of compat_machines so in the end, when it reach the
log message it will contain the last value in compat_machine (and thus
the last one in SOC_FAMILY instead of the machine name) ?

Eric


