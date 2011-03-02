Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PumyW-00013Y-76
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 15:24:24 +0100
Received: by wwb29 with SMTP id 29so4050169wwb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 06:22:47 -0800 (PST)
Received: by 10.216.22.131 with SMTP id t3mr7353709wet.2.1299075765796;
	Wed, 02 Mar 2011 06:22:45 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id j49sm3102354wer.14.2011.03.02.06.22.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 06:22:44 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAAC3B86-7A58-45EC-AB74-E97D109CA153@dominion.thruhere.net>
Date: Wed, 2 Mar 2011 15:22:41 +0100
Message-Id: <3B344EE1-5720-4167-97D5-89DF87BA0DE0@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
	<1E24B52E-D324-48D3-94C1-D14301824FBF@dominion.thruhere.net>
	<CAAC3B86-7A58-45EC-AB74-E97D109CA153@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCH 00/50] Merge in yocto changes made since split
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
X-List-Received-Date: Wed, 02 Mar 2011 14:24:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

And Richard fixed it with =
http://cgit.openembedded.org/cgit.cgi/bitbake/commit/?id=3Dc6c31b5c58a5027=
03879243ca37585e058e09c71 :)

Op 2 mrt 2011, om 10:00 heeft Koen Kooi het volgende geschreven:

> This is still present as of this morning. Richard, you mentioned you =
had a fix for this?
>=20
> Op 27 feb 2011, om 18:04 heeft Koen Kooi het volgende geschreven:
>=20
>>=20
>> Op 27 feb 2011, om 10:28 heeft Koen Kooi het volgende geschreven:
>>=20
>>> This merges in the yocto changes that were made since we split off =
oe-core, minus changes made to bitbake since oe-core doesn't ship that =
anymore.
>>>=20
>>> Pull URL: =
git://dominion.thruhere.net/var/cache/git/openembedded-core.git
>>> Branch: poky-merge-20110227
>>> Browse: =
http://dominion.thruhere.net/git/cgit.cgi/openembedded-core//log/?h=3Dpoky=
-merge-20110227
>>>=20
>>> Thanks,
>>>   Koen Kooi <koen@dominion.thruhere.net>
>>=20
>> After merging all that I get:
>>=20
>> RROR: Error executing a python function in =
/OE/tentacle/sources/openembedded-core/meta/recipes-kernel/linux-libc-head=
ers/linux-libc-headers_2.6.37.2.bb:
>> TypeError: join_deps() got an unexpected keyword argument 'commasep'
>>=20
>> ERROR: The stack trace of python calls that resulted in this =
exception/failure was:
>> ERROR:   File "populate_packages", line 144, in <module>
>> ERROR:
>> ERROR:   File "populate_packages", line 141, in populate_packages
>> ERROR:
>> ERROR: The code that was being executed was:
>> ERROR:      0140:                               bb.note("%s contains =
dangling symlink to %s" % (pkg, l))
>> ERROR:      0141:               bb.data.setVar('RDEPENDS_' + pkg, =
bb.utils.join_deps(rdepends, commasep=3DFalse), d)
>> ERROR:      0142:
>> ERROR:      0143:
>> ERROR:  *** 0144:populate_packages(d)
>> ERROR:      0145:
>> ERROR: (file: 'populate_packages', lineno: 144, function: <module>)
>> ERROR:      0137:                                                     =
  rdepends[p] =3D ""
>> ERROR:      0138:                                               break
>> ERROR:      0139:                       if found =3D=3D False:
>> ERROR:      0140:                               bb.note("%s contains =
dangling symlink to %s" % (pkg, l))
>> ERROR:  *** 0141:               bb.data.setVar('RDEPENDS_' + pkg, =
bb.utils.join_deps(rdepends, commasep=3DFalse), d)
>> ERROR:      0142:
>> ERROR:      0143:
>> ERROR:      0144:populate_packages(d)
>> ERROR:      0145:
>> ERROR: (file: 'populate_packages', lineno: 141, function: =
populate_packages)
>> ERROR: Function 'populate_packages' failed
>> ERROR: Logfile of failure stored in: =
/OE/tentacle/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/=
linux-libc-headers-2.6.37.2-r0/temp/log.do_package.6059
>> Log data follows:
>> | sort: open failed: =
/OE/tentacle/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/=
linux-libc-headers-2.6.37.2-r0/debugsources.list: No such file or =
directory
>> | ERROR: Error executing a python function in =
/OE/tentacle/sources/openembedded-core/meta/recipes-kernel/linux-libc-head=
ers/linux-libc-headers_2.6.37.2.bb:
>> | TypeError: join_deps() got an unexpected keyword argument =
'commasep'
>> |
>> | ERROR: The stack trace of python calls that resulted in this =
exception/failure was:
>> | ERROR:   File "populate_packages", line 144, in <module>
>> | ERROR:
>> | ERROR:   File "populate_packages", line 141, in populate_packages
>> | ERROR:
>> | ERROR: The code that was being executed was:
>> | ERROR:      0140:                             bb.note("%s contains =
dangling symlink to %s" % (pkg, l))
>> | ERROR:      0141:             bb.data.setVar('RDEPENDS_' + pkg, =
bb.utils.join_deps(rdepends, commasep=3DFalse), d)
>> | ERROR:      0142:
>> | ERROR:      0143:
>> | ERROR:  *** 0144:populate_packages(d)
>> | ERROR:      0145:
>> | ERROR: (file: 'populate_packages', lineno: 144, function: <module>)
>> | ERROR:      0137:                                                   =
  rdepends[p] =3D ""
>> | ERROR:      0138:                                             break
>> | ERROR:      0139:                     if found =3D=3D False:
>> | ERROR:      0140:                             bb.note("%s contains =
dangling symlink to %s" % (pkg, l))
>> | ERROR:  *** 0141:             bb.data.setVar('RDEPENDS_' + pkg, =
bb.utils.join_deps(rdepends, commasep=3DFalse), d)
>> | ERROR:      0142:
>> | ERROR:      0143:
>> | ERROR:      0144:populate_packages(d)
>> | ERROR:      0145:
>> | ERROR: (file: 'populate_packages', lineno: 141, function: =
populate_packages)
>> | ERROR: Function 'populate_packages' failed
>> NOTE: package linux-libc-headers-2.6.37.2-r0: task do_package: Failed
>> NOTE: package flex-2.5.35-r2: task do_unpack: Succeeded
>> ERROR: Task 1121 =
(/OE/tentacle/sources/openembedded-core/meta/recipes-kernel/linux-libc-hea=
ders/linux-libc-headers_2.6.37.2.bb, do_package) failed with exit code =
'1'
>> Waiting for 1 active tasks to finish:
>> 0: eglibc-2.12-r13 do_compile (pid 19675)
>>=20
>> Maybe that's missing something in vanilla bitbake, will have a look =
again during office hours.
>>=20
>=20



