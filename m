Received: from mail-wi0-f181.google.com ([209.85.212.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0Cjk-0005Og-CX
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 16:04:51 +0100
Received: by mail-wi0-f181.google.com with SMTP id c10so473430wiw.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 06:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=UwUq5paQ2qtgG+zMKju/g2f9QJcNrPTqxlZVowIpkJw=;
	b=mMx8SWg7YOy1w/FrTR324fuIPEv5mEq4dEHei+4HL+Xrm7VAHOEwVNQh0Rio3z7Rcs
	jrSyl8zniK98WQcuPYhVTOGZn2KBifYDLc2NRRmnGw+6ouxCy7kuAYX4FaaURqR+LkbW
	seS+lB2yDDxBuZwC/z1118faEoqLXVpRhJTYfPmEK0Ofk2moJfu+hNfSjgmxiEpJmWMe
	b3E7hgKBt4BS9Qzc//7l9/RZbeBD1AO5QPI5KxEyL5RVjzlAQuJpCLVmDHUeOmhqxvbY
	RTxHuksLX+a29mnS7gbM126Bqn7hDBPPmGb85lghrdmUNQDuMUS7+9tg3Ff1TchSn4VK
	Iq7g==
X-Received: by 10.180.77.68 with SMTP id q4mr2946070wiw.10.1359470936495;
	Tue, 29 Jan 2013 06:48:56 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hb9sm3431600wib.3.2013.01.29.06.48.55
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 06:48:55 -0800 (PST)
Date: Tue, 29 Jan 2013 15:49:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130129144900.GO16904@jama.palm1.palmone.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: OSError: [Errno 7] Argument list too long in sstate_install
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
X-List-Received-Date: Tue, 29 Jan 2013 15:04:56 -0000
X-List-Received-Date: Tue, 29 Jan 2013 15:04:56 -0000
X-Groupsio-MsgNum: 34641
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G23JYFG0d77Z6i/3"
Content-Disposition: inline

--G23JYFG0d77Z6i/3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

When building bigger world-image I always get this error from
populate_lic. There is debug output to show what copytree/Popen/execute_chi=
ld=20
was calling and it looks OK to me.

Could it be caused by pseudo or something like that? do_populate_lic works =
fine in other recipes.

Running the same cmdline in shell works fine and running it from small .py =
file also works fine:
$ PYTHONPATH=3D"openembedded-core/meta/lib/:bitbake/lib:bitbake/lib/bb" ./c=
opytree.test.py
copytree cmd 'tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-=
eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir -ps=
 . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/de=
ploy/licenses'
Calling Popen '('tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir =
-ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/licenses',)' '{'shell': True, 'stderr': -2}'
execute_child(args, executable, preexec_fn, close_fds,
cwd, env, universal_newlines,
startupinfo, creationflags, shell,
p2cread, p2cwrite,
c2pread, c2pwrite,
errread, errwrite)
execute_child(tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-=
eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir -ps=
 . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/de=
ploy/licenses, None, None, False,
None, None, False,
None, 0,
True,
None, None,
3, 4,
None, 4)

$ cat copytree.test.py=20
#!/usr/bin/env python
import bb
import oe.path
src=3D'/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-=
oe-linux-gnueabi/world-image/1.0-r0/license-destdir'
dst=3D'/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/licens=
es'
oe.path.copytree(src, dst)

src has only few files, dst has a lot of directories:

$ find /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-=
oe-linux-gnueabi/world-image/1.0-r0/license-destdir
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-linu=
x-gnueabi/world-image/1.0-r0/license-destdir
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-linu=
x-gnueabi/world-image/1.0-r0/license-destdir/world-image
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-linu=
x-gnueabi/world-image/1.0-r0/license-destdir/world-image/generic_MIT
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-linu=
x-gnueabi/world-image/1.0-r0/license-destdir/world-image/COPYING.MIT
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-linu=
x-gnueabi/world-image/1.0-r0/license-destdir/world-image/LICENSE

$ ls /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/licenses=
 -1 | wc -l
1696

Complete error as shown in work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0=
/temp/log.do_populate_lic:

DEBUG: Executing python function sstate_task_prefunc
DEBUG: Removing manifest: /home/jenkins/oe/shr-core-branches/shr-core/tmp-e=
glibc/deploy/licenses/world-image/
DEBUG: Python function sstate_task_prefunc finished
DEBUG: Executing python function do_populate_lic
DEBUG: Python function do_populate_lic finished
DEBUG: Executing python function sstate_task_postfunc
DEBUG: Staging files from /home/jenkins/oe/shr-core-branches/shr-core/tmp-e=
glibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir to /=
home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/licenses
DEBUG: Staging files from /home/jenkins/oe/shr-core-branches/shr-core/tmp-e=
glibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir to /=
home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/licenses
copytree cmd 'tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-=
eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir -ps=
 . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/de=
ploy/licenses'
Calling Popen '('tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir =
-ps . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/licenses',)' '{'shell': True, 'stderr': -2}'
execute_child(args, executable, preexec_fn, close_fds,
cwd, env, universal_newlines,
startupinfo, creationflags, shell,
p2cread, p2cwrite,
c2pread, c2pwrite,
errread, errwrite)
execute_child(tar -cf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-=
eglibc/work/qemuarm-oe-linux-gnueabi/world-image/1.0-r0/license-destdir -ps=
 . | tar -xf - -C /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/de=
ploy/licenses, None, None, False,
None, None, False,
None, 0,
True,
None, None,
20, 21,
None, 21)
ERROR: Error executing a python function in /home/jenkins/oe/shr-core-branc=
hes/shr-core/openembedded-core/meta/recipes-core/images/world-image.bb:
OSError: [Errno 7] Argument list too long

ERROR: The stack trace of python calls that resulted in this exception/fail=
ure was:
ERROR:   File "sstate_task_postfunc", line 12, in <module>
ERROR:
ERROR:   File "sstate_task_postfunc", line 4, in sstate_task_postfunc
ERROR:
ERROR:   File "sstate.bbclass", line 76, in sstate_install
ERROR:
ERROR:   File "/home/jenkins/oe/shr-core-branches/shr-core/openembedded-cor=
e/meta/lib/oe/path.py", line 85, in copytree
ERROR:     check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
ERROR:
ERROR:   File "/home/jenkins/oe/shr-core-branches/shr-core/openembedded-cor=
e/meta/lib/oe/path.py", line 141, in check_output
ERROR:     process =3D subprocess.Popen(stdout=3Dsubprocess.PIPE, *popenarg=
s, **kwargs)
ERROR:
ERROR:   File "/usr/lib/python2.7/subprocess.py", line 679, in __init__
ERROR:     errread, errwrite)
ERROR:
ERROR:   File "/usr/lib/python2.7/subprocess.py", line 1249, in _execute_ch=
ild
ERROR:     raise child_exception
ERROR:
ERROR: The code that was being executed was:
ERROR:      0008:            bb.build.exec_func(intercept, d)
ERROR:      0009:        sstate_package(shared_state, d)
ERROR:      0010:
ERROR:      0011:
ERROR:  *** 0012:sstate_task_postfunc(d)
ERROR:      0013:
ERROR: [From file: 'sstate_task_postfunc', lineno: 12, function: <module>]
ERROR:      0001:
ERROR:      0002:def sstate_task_postfunc(d):
ERROR:      0003:    shared_state =3D sstate_state_fromvars(d)
ERROR:  *** 0004:    sstate_install(shared_state, d)
ERROR:      0005:    enabled =3D d.getVar('SSTATE_CREATE_PKG', True)
ERROR:      0006:    if enabled and enabled =3D=3D "1":
ERROR:      0007:        for intercept in shared_state['interceptfuncs']:
ERROR:      0008:            bb.build.exec_func(intercept, d)
ERROR: [From file: 'sstate_task_postfunc', lineno: 4, function: sstate_task=
_postfunc]
ERROR:      0072:    f.close()
ERROR:      0073:
ERROR:      0074:    # Run the actual file install
ERROR:      0075:    for state in ss['dirs']:
ERROR:  *** 0076:        oe.path.copytree(state[1], state[2])
ERROR:      0077:
ERROR:      0078:    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True)=
 or '').split():
ERROR:      0079:        bb.build.exec_func(postinst, d)
ERROR:      0080:
ERROR: [From file: 'sstate.bbclass', lineno: 76, function: sstate_install]
DEBUG: Python function sstate_task_postfunc finished
ERROR: Function failed: sstate_task_postfunc


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G23JYFG0d77Z6i/3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEH4VwACgkQN1Ujt2V2gBxaKQCgoefFQa93EbVgFbwmNqiXO2RD
BHsAoLXXGR9XwgTgbdLxkowxEOzfo0Xk
=PWp4
-----END PGP SIGNATURE-----

--G23JYFG0d77Z6i/3--
