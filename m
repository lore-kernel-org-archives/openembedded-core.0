Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0I0R-0006gW-Dd
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 21:42:13 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so392908dak.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 12:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7Wt+6Y5uZe3UxfTK+u80VE/GNRebQK0Yp8P/9EGE+Qo=;
	b=DOS1sOnsNBuNr+uxih+ItF7xxRh8eZoIWlnVNfYbPPiL/mFY2cnuhAzoZAPAmbYAGV
	t71m1AYMQ2Fy0J9AqBEGeeJIChLCZeaDy4UYmi5IgqxxTKZ3UUMB0txyyYfXCar1TmW5
	lPu9vnCHCbAcODmhJalVse2mOzis6Hp7299CJT9DVhwLCSjpdweXRmkLF4EpEaRWzKd5
	G6tqUqcxQ6/7Lud6/Izw+OusJURfqmXShlQBGvFuDklH9f/Th5Ausw2yKljNb1FEl7gn
	RXa4r6qtsyI12uZmnF1W0WPaAsHX9hTpJ8lPyWorzhhGzaaXPbrljZh37AGlTBwwIJUU
	6O3Q==
X-Received: by 10.66.73.167 with SMTP id m7mr5585801pav.68.1359491190375;
	Tue, 29 Jan 2013 12:26:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ux4sm9092500pbc.25.2013.01.29.12.26.27
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 12:26:29 -0800 (PST)
Date: Tue, 29 Jan 2013 21:26:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130129202630.GR16904@jama.palm1.palmone.com>
References: <20130129144900.GO16904@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20130129144900.GO16904@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: OSError: [Errno 7] Argument list too long in sstate_install
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
X-List-Received-Date: Tue, 29 Jan 2013 20:42:17 -0000
X-Groupsio-MsgNum: 34667
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhvJQTq3ZY7+0psJ"
Content-Disposition: inline

--AhvJQTq3ZY7+0psJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 03:49:00PM +0100, Martin Jansa wrote:
> When building bigger world-image I always get this error from
> populate_lic. There is debug output to show what copytree/Popen/execute_c=
hild=20
> was calling and it looks OK to me.

and here is strace from that shell, no idea where that close(4294967295) ca=
me from

Process 2553 attached - interrupt to quit
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 2554
--- SIGCHLD (Child exited) @ 0 (0) ---
rt_sigreturn(0x11)                      =3D 2554
stat("/home/jenkins/oe/shr-core-branches/shr-core/openembedded-core/scripts=
/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/armv5te-oe-linux-gnueabi/tar", 0x7fffc9269bf0) =3D -1 ENOEN=
T (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemua=
rm/usr/bin/crossscripts/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file o=
r directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/sbin/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or direc=
tory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or direct=
ory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/sbin/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux//bin/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/openembedded-core/scripts=
/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or directory)
stat("/home/jenkins/oe/shr-core-branches/shr-core/bitbake/bin/tar", 0x7fffc=
9269bf0) =3D -1 ENOENT (No such file or directory)
stat("/usr/local/bin/tar", 0x7fffc9269bf0) =3D -1 ENOENT (No such file or d=
irectory)
stat("/usr/bin/tar", 0x7fffc9269bf0)    =3D -1 ENOENT (No such file or dire=
ctory)
stat("/bin/tar", {st_mode=3DS_IFREG|0755, st_size=3D307760, ...}) =3D 0
pipe([10, 11])                          =3D 0
clone(child_stack=3D0, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGC=
HLD, child_tidptr=3D0x7f46963919d0) =3D 3068
close(11)                               =3D 0
clone(child_stack=3D0, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGC=
HLD, child_tidptr=3D0x7f46963919d0) =3D 3069
close(10)                               =3D 0
close(4294967295)                       =3D -1 EBADF (Bad file descriptor)
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3068
--- SIGCHLD (Child exited) @ 0 (0) ---
rt_sigreturn(0x11)                      =3D 3068
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 3069
--- SIGCHLD (Child exited) @ 0 (0) ---
rt_sigreturn(0x11)                      =3D 3069
exit_group(0)                           =3D ?
Process 2553 detached


>=20
> Could it be caused by pseudo or something like that? do_populate_lic work=
s fine in other recipes.
>=20
> Running the same cmdline in shell works fine and running it from small .p=
y file also works fine:
> $ PYTHONPATH=3D"openembedded-core/meta/lib/:bitbake/lib:bitbake/lib/bb" .=
/copytree.test.py
> copytree cmd 'tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/tm=
p-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir -=
ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/=
deploy/licenses'
> Calling Popen '('tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdi=
r -ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-egli=
bc/deploy/licenses',)' '{'shell': True, 'stderr': -2}'
> execute_child(args, executable, preexec_fn, close_fds,
> cwd, env, universal_newlines,
> startupinfo, creationflags, shell,
> p2cread, p2cwrite,
> c2pread, c2pwrite,
> errread, errwrite)
> execute_child(tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/tm=
p-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir -=
ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/=
deploy/licenses, None, None, False,
> None, None, False,
> None, 0,
> True,
> None, None,
> 3, 4,
> None, 4)
>=20
> $ cat copytree.test.py=20
> #!/usr/bin/env python
> import bb
> import oe.path
> src=3D'/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuar=
m-oe-linux-gnueabi/world-image/1.0-r0/license-destdir'
> dst=3D'/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/lice=
nses'
> oe.path.copytree(src, dst)
>=20
> src has only few files, dst has a lot of directories:
>=20
> $ find /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuar=
m-oe-linux-gnueabi/world-image/1.0-r0/license-destdir
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-li=
nux-gnueabi/world-image/1.0-r0/license-destdir
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-li=
nux-gnueabi/world-image/1.0-r0/license-destdir/world-image
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-li=
nux-gnueabi/world-image/1.0-r0/license-destdir/world-image/generic_MIT
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-li=
nux-gnueabi/world-image/1.0-r0/license-destdir/world-image/COPYING.MIT
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-li=
nux-gnueabi/world-image/1.0-r0/license-destdir/world-image/LICENSE
>=20
> $ ls /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/licens=
es -1 | wc -l
> 1696
>=20
> Complete error as shown in work/qemuarm-oe-linux-gnueabi/world-image/1.0-=
r0/temp/log.do_populate_lic:
>=20
> DEBUG: Executing python function sstate_task_prefunc
> DEBUG: Removing manifest: /home/jenkins/oe/shr-core-branches/shr-core/tmp=
-eglibc/deploy/licenses/world-image/
> DEBUG: Python function sstate_task_prefunc finished
> DEBUG: Executing python function do_populate_lic
> DEBUG: Python function do_populate_lic finished
> DEBUG: Executing python function sstate_task_postfunc
> DEBUG: Staging files from /home/jenkins/oe/shr-core-branches/shr-core/tmp=
-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir to=
 /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/licenses
> DEBUG: Staging files from /home/jenkins/oe/shr-core-branches/shr-core/tmp=
-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir to=
 /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/licenses
> copytree cmd 'tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/tm=
p-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir -=
ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/=
deploy/licenses'
> Calling Popen '('tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdi=
r -ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-egli=
bc/deploy/licenses',)' '{'shell': True, 'stderr': -2}'
> execute_child(args, executable, preexec_fn, close_fds,
> cwd, env, universal_newlines,
> startupinfo, creationflags, shell,
> p2cread, p2cwrite,
> c2pread, c2pwrite,
> errread, errwrite)
> execute_child(tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/tm=
p-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir -=
ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/=
deploy/licenses, None, None, False,
> None, None, False,
> None, 0,
> True,
> None, None,
> 20, 21,
> None, 21)
> ERROR: Error executing a python function in /home/jenkins/oe/shr-core-bra=
nches/shr-core/openembedded-core/meta/recipes-core/images/world-image.bb:
> OSError: [Errno 7] Argument list too long
>=20
> ERROR: The stack trace of python calls that resulted in this exception/fa=
ilure was:
> ERROR:   File "sstate_task_postfunc", line 12, in <module>
> ERROR:
> ERROR:   File "sstate_task_postfunc", line 4, in sstate_task_postfunc
> ERROR:
> ERROR:   File "sstate.bbclass", line 76, in sstate_install
> ERROR:
> ERROR:   File "/home/jenkins/oe/shr-core-branches/shr-core/openembedded-c=
ore/meta/lib/oe/path.py", line 85, in copytree
> ERROR:     check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
> ERROR:
> ERROR:   File "/home/jenkins/oe/shr-core-branches/shr-core/openembedded-c=
ore/meta/lib/oe/path.py", line 141, in check_output
> ERROR:     process =3D subprocess.Popen(stdout=3Dsubprocess.PIPE, *popena=
rgs, **kwargs)
> ERROR:
> ERROR:   File "/usr/lib/python2.7/subprocess.py", line 679, in __init__
> ERROR:     errread, errwrite)
> ERROR:
> ERROR:   File "/usr/lib/python2.7/subprocess.py", line 1249, in _execute_=
child
> ERROR:     raise child_exception
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0008:            bb.build.exec_func(intercept, d)
> ERROR:      0009:        sstate_package(shared_state, d)
> ERROR:      0010:
> ERROR:      0011:
> ERROR:  *** 0012:sstate_task_postfunc(d)
> ERROR:      0013:
> ERROR: [From file: 'sstate_task_postfunc', lineno: 12, function: <module>]
> ERROR:      0001:
> ERROR:      0002:def sstate_task_postfunc(d):
> ERROR:      0003:    shared_state =3D sstate_state_fromvars(d)
> ERROR:  *** 0004:    sstate_install(shared_state, d)
> ERROR:      0005:    enabled =3D d.getVar('SSTATE_CREATE_PKG', True)
> ERROR:      0006:    if enabled and enabled =3D=3D "1":
> ERROR:      0007:        for intercept in shared_state['interceptfuncs']:
> ERROR:      0008:            bb.build.exec_func(intercept, d)
> ERROR: [From file: 'sstate_task_postfunc', lineno: 4, function: sstate_ta=
sk_postfunc]
> ERROR:      0072:    f.close()
> ERROR:      0073:
> ERROR:      0074:    # Run the actual file install
> ERROR:      0075:    for state in ss['dirs']:
> ERROR:  *** 0076:        oe.path.copytree(state[1], state[2])
> ERROR:      0077:
> ERROR:      0078:    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', Tru=
e) or '').split():
> ERROR:      0079:        bb.build.exec_func(postinst, d)
> ERROR:      0080:
> ERROR: [From file: 'sstate.bbclass', lineno: 76, function: sstate_install]
> DEBUG: Python function sstate_task_postfunc finished
> ERROR: Function failed: sstate_task_postfunc
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AhvJQTq3ZY7+0psJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEIMHYACgkQN1Ujt2V2gBylUQCgni396tU0hsDLA7LzD7EoXBZg
6OoAnRX0yPd9f3BzVow4UJGxGTJeZ0UN
=cbwz
-----END PGP SIGNATURE-----

--AhvJQTq3ZY7+0psJ--
