Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QQ2Ww-0005BT-G2
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 21:17:06 +0200
Received: by wwb17 with SMTP id 17so1834511wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 12:13:57 -0700 (PDT)
Received: by 10.227.61.142 with SMTP id t14mr2411095wbh.84.1306523637521;
	Fri, 27 May 2011 12:13:57 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fm14sm1392667wbb.58.2011.05.27.12.13.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 12:13:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTi=1oT=af2XGiQ2CNrJXJRZ3OhGhmw@mail.gmail.com>
Date: Fri, 27 May 2011 21:13:55 +0200
Message-Id: <59D75656-9941-483E-AC0F-D8DAA0823A63@dominion.thruhere.net>
References: <cover.1306477652.git.lianhao.lu@intel.com>
	<1306515635.27470.284.camel@rex>
	<7DC6724C-BF20-4EA1-A87D-32FBEEECDA3B@dominion.thruhere.net>
	<BANLkTi=1oT=af2XGiQ2CNrJXJRZ3OhGhmw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 00/11] Add PR service and integrate PKGV/PKGR from OE
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
X-List-Received-Date: Fri, 27 May 2011 19:17:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

FWIW, F14 has python 2.7


Op 27 mei 2011, om 21:08 heeft Otavio Salvador het volgende geschreven:

> Same here.
>=20
> On Fri, May 27, 2011 at 18:48, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>=20
>> Op 27 mei 2011, om 19:00 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> Hi Lianhao,
>>>=20
>>> On Fri, 2011-05-27 at 14:31 +0800, Lianhao Lu wrote:
>>>>  git://git.pokylinux.org/poky-contrib llu/PR-service
>>>>  =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dllu/PR-service
>>>>=20
>>>> Lianhao Lu (11):
>>>>  Added the PR service.
>>>>  conf/bitbake.conf: Added variables for PR service.
>>>>  meta-yocto/local.conf.sample: Added PRSERV_HOST and PRSERV_PORT.
>>>>  classes/package(prserv).bbclass: Get PRAUTO and use PKGV/PKGR.
>>>>  classes/package_xxx.class: Use PKGE/PKGV/PKGR.
>>>>  udev: use EXTENDPKGV instead of EXTENDPV.
>>>>  xcb: use EXTENDPKGV instead of EXTENDPV.
>>>>  xorg-proto: use EXTENDPKGV instead of EXTENDPV.
>>>>  xorg-util/util-macros: use EXTENDPKGV instead of EXTENDPV.
>>>>  linux-libc-headers: use EXTENDPKGV instead of EXTENDPV.
>>>>  conf/bitbake.conf: Removed EXTENDPV and EXTENDPEVER.
>>>=20
>>> I merged this but I did make some tweaks to both the patch series =
and
>>> one of the patches. The changes I made were:
>>>=20
>>> a) Squash the EXTENDPV and EXTENDPEVER changes into the base patch
>>> making all the associated changes in one go.
>>>=20
>>> b) Not include the DISTRO_PR variable for now
>>>=20
>>> c) Not change the default signature handler to basichash.
>>>=20
>>> For c), I'd suggest a follow up patch changing the default in =
poky.conf
>>> in meta-yocto and we'll test this there. This should wait until the
>>> PACKAGE_ARCH =3D "all" sstate issues we've been seeing are addressed
>>> though.
>>=20
>> On Fedora 14 I get this when trying to rebuild console-image:
>>=20
>> ERROR: (file: 'package_get_auto_pr', lineno: 4, function: =
package_get_auto_pr)
>> ERROR: Function 'package_get_auto_pr' failed
>> ERROR: Logfile of failure stored in: =
/home/koen/angstrom-core/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angs=
trom-linux-gnueabi/dbus-1.4.1-r5/temp/log.do_package.24742
>> Log data follows:
>> | ERROR: Error executing a python function in =
/home/koen/angstrom-core/sources/openembedded-core/meta/recipes-core/dbus/=
dbus_1.4.1.bb:
>> | ImportError: No module named xmlrpc
>> |
>> | ERROR: The stack trace of python calls that resulted in this =
exception/failure was:
>> | ERROR:   File "package_get_auto_pr", line 11, in <module>
>> | ERROR:
>> | ERROR:   File "package_get_auto_pr", line 4, in package_get_auto_pr
>> | ERROR:
>> | ERROR:   File "prserv.bbclass", line 8, in prserv_get_pr_auto
>> | ERROR:
>> | ERROR:   File "prserv.bbclass", line 2, in prserv_make_conn
>> | ERROR:
>> | ERROR:   File =
"/home/koen/angstrom-core/sources/bitbake/lib/prserv/serv.py", line 6, =
in <module>
>> | ERROR:     import bb.server.xmlrpc
>> | ERROR:
>> | ERROR: The code that was being executed was:
>> | ERROR:      0007:                     return
>> | ERROR:      0008:             d.setVar('PRAUTO',str(auto_pr))
>> | ERROR:      0009:
>> | ERROR:      0010:
>> | ERROR:  *** 0011:package_get_auto_pr(d)
>> | ERROR:      0012:
>> | ERROR: (file: 'package_get_auto_pr', lineno: 11, function: =
<module>)
>> | ERROR:      0001:
>> | ERROR:      0002:def package_get_auto_pr(d):
>> | ERROR:      0003:     if d.getVar('USE_PR_SERV', True):
>> | ERROR:  *** 0004:             auto_pr=3Dprserv_get_pr_auto(d)
>> | ERROR:      0005:             if auto_pr is None:
>> | ERROR:      0006:                     bb.fatal("Can NOT get auto PR =
revision from remote PR service")
>> | ERROR:      0007:                     return
>> | ERROR:      0008:             d.setVar('PRAUTO',str(auto_pr))
>> | ERROR: (file: 'package_get_auto_pr', lineno: 4, function: =
package_get_auto_pr)
>> | ERROR: Function 'package_get_auto_pr' failed
>>=20
>> It doesn't seem to trigger on my debian box, though
>>=20
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>=20
>=20
>=20
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



