Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1RqRq9-00027y-Rb
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 17:06:22 +0100
Received: by obbuo9 with SMTP id uo9so752524obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 07:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=LHgYwuLQn3Q0CK87ye48/JgB4SMrRwxkEC+CiCLkkZg=;
	b=fQTAJrxQwoPyHFedwEeTJPdNRlazMrRh6hxyigu5UQRnFVYKf2yXOsVADbs8in7yLe
	P3gAENU4gEpbV4HixWs1Zi4wK+7TAdT8PIyPeYAznDovdVQNcfTfK+Fc3fOyKkh6aY9S
	hb2dOlOU77YVnCyZVrNME/VJulnIDqwUWyDcg=
MIME-Version: 1.0
Received: by 10.182.109.106 with SMTP id hr10mr2834907obb.27.1327593513575;
	Thu, 26 Jan 2012 07:58:33 -0800 (PST)
Received: by 10.182.96.131 with HTTP; Thu, 26 Jan 2012 07:58:33 -0800 (PST)
Date: Thu, 26 Jan 2012 18:58:33 +0300
Message-ID: <CAFZPMobN7nGs=J39VJUWYATHs2-8L8yVih6Et5eQdQQDt9NEsQ@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: python-2.7.2 is broken
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
X-List-Received-Date: Thu, 26 Jan 2012 16:06:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

oe-core build of python 2.7.2 is broken regarding the following modules:

Python build finished, but the necessary bits to build these modules
were not found:
_bsddb             _curses            _curses_panel
_tkinter           bsddb185           dbm
dl                 imageop            linuxaudiodev
ossaudiodev        sunaudiodev
To find the necessary bits, look in setup.py in detect_modules() for
the module's name.

This is 100% reproducible for more than 2 months with build from
scratch on my build system
at least. This results in almost NO C-based built in modules in python
rendering python
almost useless.

resulting python-misc:

dpkg-deb -c ~/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/deploy/ipk/armv5te/python-misc_2.7.2-r0.5_armv5te.ipk
drwxr-xr-x root/root         0 2012-01-26 19:23 ./
drwxr-xr-x root/root         0 2012-01-26 19:18 ./usr/
drwxr-xr-x root/root         0 2012-01-26 19:18 ./usr/lib/
drwxr-xr-x root/root         0 2012-01-26 19:18 ./usr/lib/python2.7/
-rw-r--r-- root/root      5467 2012-01-26 19:16 ./usr/lib/python2.7/macpath.pyo
-rw-r--r-- root/root     11805 2012-01-26 19:14 ./usr/lib/python2.7/ast.py
-rw-r--r-- root/root      1218 2012-01-26 19:16 ./usr/lib/python2.7/this.pyo
drwxr-xr-x root/root         0 2012-01-26 19:18 ./usr/lib/python2.7/importlib/
-rw-r--r-- root/root      1142 2012-01-26 19:16
./usr/lib/python2.7/importlib/__init__.pyo
-rw-r--r-- root/root      1327 2012-01-26 19:16
./usr/lib/python2.7/importlib/__init__.py
-rw-r--r-- root/root     87802 2012-01-26 19:14 ./usr/lib/python2.7/argparse.py
-rw-r--r-- root/root     17452 2012-01-26 19:16 ./usr/lib/python2.7/asyncore.pyo
drwxr-xr-x root/root         0 2012-01-26 19:18
./usr/lib/python2.7/site-packages/
-rw-r--r-- root/root       119 2012-01-26 19:14
./usr/lib/python2.7/site-packages/README
-rw-r--r-- root/root     24283 2012-01-26 19:14
./usr/lib/python2.7/modulefinder.py
-rw-r--r-- root/root      3658 2012-01-26 19:16 ./usr/lib/python2.7/Bastion.pyo
-rw-r--r-- root/root      5968 2012-01-26 19:16 ./usr/lib/python2.7/timeit.pyo
-rw-r--r-- root/root     10698 2012-01-26 19:14 ./usr/lib/python2.7/runpy.py
-rw-r--r-- root/root     25764 2012-01-26 19:14 ./usr/lib/python2.7/imputil.py
-rw-r--r-- root/root      4603 2012-01-26 19:14
./usr/lib/python2.7/os2emxpath.py
-rw-r--r-- root/root     18082 2012-01-26 19:14 ./usr/lib/python2.7/ntpath.py
-rw-r--r-- root/root      3572 2012-01-26 19:16
./usr/lib/python2.7/os2emxpath.pyo
-rw-r--r-- root/root      2371 2012-01-26 19:14
./usr/lib/python2.7/nturl2path.py
-rw-r--r-- root/root      7216 2012-01-26 19:16 ./usr/lib/python2.7/filecmp.pyo
-rw-r--r-- root/root        60 2012-01-26 19:14
./usr/lib/python2.7/antigravity.py
-rw-r--r-- root/root      4576 2012-01-26 19:14 ./usr/lib/python2.7/netrc.py
-rw-r--r-- root/root     16392 2012-01-26 19:16 ./usr/lib/python2.7/plistlib.pyo
-rw-r--r-- root/root      6840 2012-01-26 19:16 ./usr/lib/python2.7/runpy.pyo
-rw-r--r-- root/root      8783 2012-01-26 19:16
./usr/lib/python2.7/fileinput.pyo
-rw-r--r-- root/root     20650 2012-01-26 19:14 ./usr/lib/python2.7/asyncore.py
-rwxr-xr-x root/root     15021 2012-01-26 19:14 ./usr/lib/python2.7/mimify.py
-rw-r--r-- root/root      6733 2012-01-26 19:16 ./usr/lib/python2.7/pyclbr.pyo
-rw-r--r-- root/root      1477 2012-01-26 19:16
./usr/lib/python2.7/nturl2path.pyo
-rw-r--r-- root/root     26782 2012-01-26 19:16 ./usr/lib/python2.7/mhlib.pyo
-rw-r--r-- root/root      6252 2012-01-26 19:14 ./usr/lib/python2.7/macpath.py
-rw-r--r-- root/root      7427 2012-01-26 19:14 ./usr/lib/python2.7/mailcap.py
-rw-r--r-- root/root      7518 2012-01-26 19:14 ./usr/lib/python2.7/symtable.py
-rw-r--r-- root/root     12293 2012-01-26 19:16
./usr/lib/python2.7/fractions.pyo
-rw-r--r-- root/root     17500 2012-01-26 19:16 ./usr/lib/python2.7/ihooks.pyo
-rw-r--r-- root/root      2138 2012-01-26 19:16 ./usr/lib/python2.7/sched.pyo
-rw-r--r-- root/root       777 2012-01-26 19:16 ./usr/lib/python2.7/user.pyo
-rw-r--r-- root/root     14143 2012-01-26 19:14 ./usr/lib/python2.7/fileinput.py
-rw-r--r-- root/root       187 2012-01-26 19:14
./usr/lib/python2.7/wsgiref.egg-info
drwxr-xr-x root/root         0 2012-01-26 19:18 ./usr/lib/python2.7/lib-dynload/
-rw-r--r-- root/root      1524 2012-01-26 19:14
./usr/lib/python2.7/lib-dynload/Python-2.7.2-py2.7.egg-info
-rwxr-xr-x root/root     40428 2012-01-26 19:18
./usr/lib/python2.7/lib-dynload/_testcapi.so
-rwxr-xr-x root/root      4900 2012-01-26 19:18
./usr/lib/python2.7/lib-dynload/future_builtins.so
-rwxr-xr-x root/root      6960 2012-01-26 19:18
./usr/lib/python2.7/lib-dynload/spwd.so
-rw-r--r-- root/root     15176 2012-01-26 19:14 ./usr/lib/python2.7/plistlib.py
drwxr-xr-x root/root         0 2012-01-26 19:18 ./usr/lib/python2.7/wsgiref/
-rw-r--r-- root/root      5224 2012-01-26 19:16
./usr/lib/python2.7/wsgiref/simple_server.pyo
-rw-r--r-- root/root     13120 2012-01-26 19:16
./usr/lib/python2.7/wsgiref/validate.pyo
-rw-r--r-- root/root      5879 2012-01-26 19:16
./usr/lib/python2.7/wsgiref/headers.py
-rw-r--r-- root/root      5576 2012-01-26 19:16
./usr/lib/python2.7/wsgiref/util.py
-rw-r--r-- root/root       127 2012-01-26 19:16
./usr/lib/python2.7/wsgiref/__init__.pyo
-rw-r--r-- root/root     14731 2012-01-26 19:16
./usr/lib/python2.7/wsgiref/validate.py
-rw-r--r-- root/root     15932 2012-01-26 19:16
./usr/lib/python2.7/wsgiref/handlers.py
-rw-r--r-- root/root     10370 2012-01-26 19:16
./usr/lib/python2.7/wsgiref/handlers.pyo
-rw-r--r-- root/root      4743 2012-01-26 19:16
./usr/lib/python2.7/wsgiref/simple_server.py
-rw-r--r-- root/root       586 2012-01-26 19:16
./usr/lib/python2.7/wsgiref/__init__.py
-rw-r--r-- root/root      4187 2012-01-26 19:16
./usr/lib/python2.7/wsgiref/headers.pyo
-rw-r--r-- root/root      4372 2012-01-26 19:16
./usr/lib/python2.7/wsgiref/util.pyo
-rw-r--r-- root/root     13282 2012-01-26 19:14 ./usr/lib/python2.7/pyclbr.py
-rw-r--r-- root/root      3052 2012-01-26 19:16
./usr/lib/python2.7/contextlib.pyo
-rw-r--r-- root/root     33434 2012-01-26 19:14 ./usr/lib/python2.7/mhlib.py
-rw-r--r-- root/root      7297 2012-01-26 19:16 ./usr/lib/python2.7/ast.pyo
-rw-r--r-- root/root     16909 2012-01-26 19:16
./usr/lib/python2.7/webbrowser.pyo
-rw-r--r-- root/root        64 2012-01-26 19:14
./usr/lib/python2.7/__phello__.foo.py
-rw-r--r-- root/root      7264 2012-01-26 19:16 ./usr/lib/python2.7/tabnanny.pyo
-rw-r--r-- root/root      4699 2012-01-26 19:14 ./usr/lib/python2.7/fpformat.py
-rw-r--r-- root/root     14231 2012-01-26 19:16 ./usr/lib/python2.7/LICENSE.txt
-rw-r--r-- root/root      9252 2012-01-26 19:16 ./usr/lib/python2.7/ntpath.pyo
-rw-r--r-- root/root     21704 2012-01-26 19:14
./usr/lib/python2.7/webbrowser.py
-rw-r--r-- root/root     23948 2012-01-26 19:16 ./usr/lib/python2.7/aifc.pyo
-rw-r--r-- root/root     22390 2012-01-26 19:14 ./usr/lib/python2.7/fractions.py
-rw-r--r-- root/root      3275 2012-01-26 19:14
./usr/lib/python2.7/macurl2path.py
-rw-r--r-- root/root      5590 2012-01-26 19:16 ./usr/lib/python2.7/mailcap.pyo
-rw-r--r-- root/root       520 2012-01-26 19:16 ./usr/lib/python2.7/statvfs.pyo
-rw-r--r-- root/root       123 2012-01-26 19:16
./usr/lib/python2.7/__phello__.foo.pyo
-rw-r--r-- root/root     12059 2012-01-26 19:14 ./usr/lib/python2.7/timeit.py
-rw-r--r-- root/root      9503 2012-01-26 19:14 ./usr/lib/python2.7/filecmp.py
-rw-r--r-- root/root      5091 2012-01-26 19:14 ./usr/lib/python2.7/sched.py
-rw-r--r-- root/root      4381 2012-01-26 19:16
./usr/lib/python2.7/multifile.pyo
-rw-r--r-- root/root     14739 2012-01-26 19:16 ./usr/lib/python2.7/binhex.pyo
-rw-r--r-- root/root     10901 2012-01-26 19:16 ./usr/lib/python2.7/symtable.pyo
-rw-r--r-- root/root      3677 2012-01-26 19:16 ./usr/lib/python2.7/fpformat.pyo
-rw-r--r-- root/root     11402 2012-01-26 19:14 ./usr/lib/python2.7/asynchat.py
-rw-r--r-- root/root     12050 2012-01-26 19:16 ./usr/lib/python2.7/imputil.pyo
-rw-r--r-- root/root     12073 2012-01-26 19:14 ./usr/lib/python2.7/cgitb.py
-rw-r--r-- root/root     54799 2012-01-26 19:16 ./usr/lib/python2.7/argparse.pyo
-rw-r--r-- root/root     16353 2012-01-26 19:16 ./usr/lib/python2.7/rexec.pyo
-rw-r--r-- root/root     20184 2012-01-26 19:16 ./usr/lib/python2.7/trace.pyo
-rw-r--r-- root/root      2376 2012-01-26 19:16
./usr/lib/python2.7/macurl2path.pyo
-rw-r--r-- root/root       498 2012-01-26 19:14 ./usr/lib/python2.7/dbhash.py
drwxr-xr-x root/root         0 2012-01-26 19:18 ./usr/lib/python2.7/plat-linux3/
-rw-r--r-- root/root       195 2012-01-26 19:16
./usr/lib/python2.7/plat-linux3/regen
-rwxr-xr-x root/root     11336 2012-01-26 19:14 ./usr/lib/python2.7/tabnanny.py
-rw-r--r-- root/root       633 2012-01-26 19:16 ./usr/lib/python2.7/dbhash.pyo
-rw-r--r-- root/root     20148 2012-01-26 19:14 ./usr/lib/python2.7/rexec.py
-rw-r--r-- root/root       201 2012-01-26 19:16
./usr/lib/python2.7/antigravity.pyo
-rw-r--r-- root/root     33246 2012-01-26 19:14 ./usr/lib/python2.7/aifc.py
-rw-r--r-- root/root      8003 2012-01-26 19:14 ./usr/lib/python2.7/posixfile.py
-rw-r--r-- root/root      4424 2012-01-26 19:14
./usr/lib/python2.7/contextlib.py
-rw-r--r-- root/root      4820 2012-01-26 19:14 ./usr/lib/python2.7/multifile.py
-rw-r--r-- root/root       898 2012-01-26 19:14 ./usr/lib/python2.7/statvfs.py
-rw-r--r-- root/root      5549 2012-01-26 19:16
./usr/lib/python2.7/posixfile.pyo
-rw-r--r-- root/root      1002 2012-01-26 19:14 ./usr/lib/python2.7/this.py
-rw-r--r-- root/root     17706 2012-01-26 19:16
./usr/lib/python2.7/modulefinder.pyo
-rw-r--r-- root/root     10475 2012-01-26 19:16 ./usr/lib/python2.7/cgitb.pyo
-rw-r--r-- root/root      3649 2012-01-26 19:16 ./usr/lib/python2.7/netrc.pyo
-rw-r--r-- root/root     30156 2012-01-26 19:14 ./usr/lib/python2.7/trace.py
-rw-r--r-- root/root     18986 2012-01-26 19:14 ./usr/lib/python2.7/ihooks.py
-rw-r--r-- root/root      7200 2012-01-26 19:16 ./usr/lib/python2.7/asynchat.pyo
-rw-r--r-- root/root      1627 2012-01-26 19:14 ./usr/lib/python2.7/user.py
-rw-r--r-- root/root     14476 2012-01-26 19:14 ./usr/lib/python2.7/binhex.py
-rw-r--r-- root/root     10582 2012-01-26 19:16 ./usr/lib/python2.7/mimify.pyo
-rw-r--r-- root/root      5744 2012-01-26 19:14 ./usr/lib/python2.7/Bastion.py

so basic modules like IN, _curses, etc. are missing.

Logs for build are available at http://ossfans.org/py/ but I don't see
any errors there.

Any help is appreciated, I can't see where I can go from here.

All the best,
S.


