Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QQ36s-0005bV-8p
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 21:54:14 +0200
Received: by wwb17 with SMTP id 17so1856609wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 12:51:05 -0700 (PDT)
Received: by 10.227.12.18 with SMTP id v18mr2469144wbv.72.1306525865395;
	Fri, 27 May 2011 12:51:05 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d19sm1411196wbh.42.2011.05.27.12.51.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 12:51:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTi=O=CFrCTNEow0=yxFbuooUP6DbyQ@mail.gmail.com>
Date: Fri, 27 May 2011 21:51:03 +0200
Message-Id: <768970BC-3718-474D-A707-BB5C846B72D7@dominion.thruhere.net>
References: <BANLkTi=O=CFrCTNEow0=yxFbuooUP6DbyQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Get PRAUTO and use PKGV/PKGR is causing problems
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
X-List-Received-Date: Fri, 27 May 2011 19:54:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I'm seeing the same on my fedora box, but not on my debian box. Otavio =
reported similar issues, see the patchset email thread.

Op 27 mei 2011, om 21:40 heeft Khem Raj het volgende geschreven:

> Hi
>=20
> I have started getting this error.
>=20
> ERROR: Error executing a python function in
> =
/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/uclib=
c/uclibc_git.bb:
> ImportError: No module named xmlrpc
>=20
> ERROR: The stack trace of python calls that resulted in this
> exception/failure was:
> ERROR:   File "package_get_auto_pr", line 11, in <module>
> ERROR:
> ERROR:   File "package_get_auto_pr", line 4, in package_get_auto_pr
> ERROR:
> ERROR:   File "prserv.bbclass", line 8, in prserv_get_pr_auto
> ERROR:
> ERROR:   File "prserv.bbclass", line 2, in prserv_make_conn
> ERROR:
> ERROR:   File "/home/kraj/work/slugos/bitbake/lib/prserv/serv.py",
> line 6, in <module>
> ERROR:     import bb.server.xmlrpc
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0007:                       return
> ERROR:      0008:               d.setVar('PRAUTO',str(auto_pr))
> ERROR:      0009:
> ERROR:      0010:
> ERROR:  *** 0011:package_get_auto_pr(d)
> ERROR:      0012:
> ERROR: (file: 'package_get_auto_pr', lineno: 11, function: <module>)
> ERROR:      0001:
> ERROR:      0002:def package_get_auto_pr(d):
> ERROR:      0003:       if d.getVar('USE_PR_SERV', True):
> ERROR:  *** 0004:               auto_pr=3Dprserv_get_pr_auto(d)
> ERROR:      0005:               if auto_pr is None:
> ERROR:      0006:                       bb.fatal("Can NOT get auto PR
> revision from remote PR service")
> ERROR:      0007:                       return
> ERROR:      0008:               d.setVar('PRAUTO',str(auto_pr))
> ERROR: (file: 'package_get_auto_pr', lineno: 4, function: =
package_get_auto_pr)
> ERROR: Function 'package_get_auto_pr' failed
> ERROR: Logfile of failure stored in:
> =
/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-uclibc/work/efikamx-ang=
strom-linux-uclibceabi/uclibc-0.9.31+0.9.32rc3-r2.2/temp/log.do_package.37=
15
> Log data follows:
> | ERROR: Error executing a python function in
> =
/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/uclib=
c/uclibc_git.bb:
> | ImportError: No module named xmlrpc
> |
> | ERROR: The stack trace of python calls that resulted in this
> exception/failure was:
> | ERROR:   File "package_get_auto_pr", line 11, in <module>
> | ERROR:
> | ERROR:   File "package_get_auto_pr", line 4, in package_get_auto_pr
> | ERROR:
> | ERROR:   File "prserv.bbclass", line 8, in prserv_get_pr_auto
> | ERROR:
> | ERROR:   File "prserv.bbclass", line 2, in prserv_make_conn
> | ERROR:
> | ERROR:   File "/home/kraj/work/slugos/bitbake/lib/prserv/serv.py",
> line 6, in <module>
> | ERROR:     import bb.server.xmlrpc
> | ERROR:
> | ERROR: The code that was being executed was:
> | ERROR:      0007:                     return
> | ERROR:      0008:             d.setVar('PRAUTO',str(auto_pr))
> | ERROR:      0009:
> | ERROR:      0010:
> | ERROR:  *** 0011:package_get_auto_pr(d)
> | ERROR:      0012:
> | ERROR: (file: 'package_get_auto_pr', lineno: 11, function: <module>)
> | ERROR:      0001:
> | ERROR:      0002:def package_get_auto_pr(d):
> | ERROR:      0003:     if d.getVar('USE_PR_SERV', True):
> | ERROR:  *** 0004:             auto_pr=3Dprserv_get_pr_auto(d)
> | ERROR:      0005:             if auto_pr is None:
> | ERROR:      0006:                     bb.fatal("Can NOT get auto PR
> revision from remote PR service")
> | ERROR:      0007:                     return
> | ERROR:      0008:             d.setVar('PRAUTO',str(auto_pr))
> | ERROR: (file: 'package_get_auto_pr', lineno: 4, function: =
package_get_auto_pr)
> | ERROR: Function 'package_get_auto_pr' failed
> NOTE: package uclibc-0.9.31+0.9.32rc3-r2.2: task do_package: Failed
> ERROR: Task 9 =
(/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/ucli=
bc/uclibc_git.bb,
> do_package) failed with exit code '1'
> ERROR: =
'/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/ucli=
bc/uclibc_git.bb'
> failed
>=20
>=20
> After bisecting this seems to be the point of cause. What am I =
missing.
> I am using angstrom. Is there something needed in config ?
>=20
> b1f6120c04731d3d66f322ce550b0d223c118dab is the first bad commit
> commit b1f6120c04731d3d66f322ce550b0d223c118dab
> Author: Lianhao Lu <lianhao.lu@intel.com>
> Date:   Wed May 18 21:15:01 2011 +0800
>=20
>    classes/package(prserv).bbclass: Get PRAUTO and use PKGV/PKGR.
>=20
>    1. Added package_get_auto_pr to PACKAGEFUNCS to get the auto
>    incremented value(PRAUTO) from remote PR service.
>=20
>    2. use PKGV/PKGR for pkgdata which will be used by =
package_write_xxx.
>=20
>    3. Added supporting functions in prserv.bbclass.
>=20
>    Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



