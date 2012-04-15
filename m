Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SJQgq-0003WP-BY
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Apr 2012 16:44:32 +0200
Received: by wgbdr12 with SMTP id dr12so3707499wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 07:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:references
	:to:message-id:mime-version:x-mailer:x-gm-message-state;
	bh=juJh+GVUZ/9UwiYwXtmEObUJoDfkYuns5SBi+eKi664=;
	b=Gf8PoTryks7y8Z/UAa+6N8GX51HKYXVbSXh5cFxpcXN3RPd+6Ep/VvgpPYhpI+57Vl
	cE6n6vHLCWDINP24ML5zzXDKslqVOEmy28jE6PYR+dfivbMRD/79V1I2EBD4iyMF0dab
	n+fDnnwyFE/+3pBsZwNIvkjwsQtHn2eyLFIDE2MDilK8QSuL3YOFaE+tpJ9oPbiJGfbm
	MItoCPxVEqE6QC/XLm5SYQ6IOv1RXL+SOijDyKqmqI7kkUEEGIK3buOUZITn4XmVxQbZ
	R1wSzM1Ilc+zmqGxz1qWBBJCMi3x+VIXx6gzyQmWQpimsbTd6ILwh52h9ShCtlhvM6zm
	F04Q==
Received: by 10.216.131.206 with SMTP id m56mr4561808wei.92.1334500508286;
	Sun, 15 Apr 2012 07:35:08 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w10sm20373437wiy.3.2012.04.15.07.35.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 Apr 2012 07:35:06 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 15 Apr 2012 16:35:09 +0200
References: <4F8AC160.7020405@kth.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-Id: <44025B47-33F8-44B8-94A1-2C8E8B866C1E@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1257)
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQn7eIPxJmwSieL6ANxDKrUgyTYE12ii7qJLY2t0/bT1igyb8yS0dIE4BeK2q00p9Bpny+1K
Subject: [Angstrom-devel] Python library hashlib is missig hash-code.
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
X-List-Received-Date: Sun, 15 Apr 2012 14:44:32 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

My theory is that this is caused by the openssl /usr changes, can anyone =
confirm or deny that?

Begin doorgestuurd bericht:

> Van: Mattias Millbro <mmillbro@kth.se>
> Onderwerp: [Angstrom-devel] Python library hashlib is missig =
hash-code.
> Datum: 15 april 2012 14:38:56 GMT+02:00
> Aan: angstrom-distro-devel@linuxtogo.org
> Antwoord aan: Discussion of the angstrom distribution development =
<angstrom-distro-devel@linuxtogo.org>
>=20
> Hi everybody,
>=20
> as a new member of this mailing list I'm not familiar to the proper =
procedure of this kids of questions/bug reports. But I'll give it a try =
and please let me know if any necessary information is missing.
>=20
> I'm running Angstrom on a Beaglebone using the =
Angstrom-systemd-image-eglibc-ipk-v2012.01-core-beaglebone.rootfs.tar.bz2 =
image from http://www.angstrom-distribution.org/demo/beaglebone/. I =
installed python and pyuthon-modules using opkg.
>=20
> I recently made a completely fresh install and discovered that the =
python library hashlib does no longer work properly. It does not seem to =
find code for sha hashes even tho python.org states
>=20
> "Included are the FIPS secure hash algorithms SHA1, SHA224, SHA256, =
SHA384, and SHA512 (defined in FIPS 180-2) as well as RSA=92s MD5 =
algorithm (defined in Internet RFC 1321).".
>=20
> All related packages seems to be up to date and I have spent several =
days googling and installing/reinstalling various packages without any =
success.
>=20
> This is what happens when importing hashlib:
>=20
> root@beaglebone:~# python
> Python 2.7.2 (default, Apr 13 2012, 21:18:55)
> [GCC 4.5.4 20120305 (prerelease)] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import hashlib
> ERROR:root:code for hash sha1 was not found.
> Traceback (most recent call last):
> File "/usr/lib/python2.7/hashlib.py", line 139, in <module>
> globals()[__func_name] =3D __get_hash(__func_name)
> File "/usr/lib/python2.7/hashlib.py", line 91, in =
__get_builtin_constructor
> raise ValueError('unsupported hash type %s' % name)
> ValueError: unsupported hash type sha1
> ERROR:root:code for hash sha224 was not found.
> Traceback (most recent call last):
> File "/usr/lib/python2.7/hashlib.py", line 139, in <module>
> globals()[__func_name] =3D __get_hash(__func_name)
> File "/usr/lib/python2.7/hashlib.py", line 91, in =
__get_builtin_constructor
> raise ValueError('unsupported hash type %s' % name)
> ValueError: unsupported hash type sha224
> ERROR:root:code for hash sha256 was not found.
> Traceback (most recent call last):
> File "/usr/lib/python2.7/hashlib.py", line 139, in <module>
> globals()[__func_name] =3D __get_hash(__func_name)
> File "/usr/lib/python2.7/hashlib.py", line 91, in =
__get_builtin_constructor
> raise ValueError('unsupported hash type %s' % name)
> ValueError: unsupported hash type sha256
> ERROR:root:code for hash sha384 was not found.
> Traceback (most recent call last):
> File "/usr/lib/python2.7/hashlib.py", line 139, in <module>
> globals()[__func_name] =3D __get_hash(__func_name)
> File "/usr/lib/python2.7/hashlib.py", line 91, in =
__get_builtin_constructor
> raise ValueError('unsupported hash type %s' % name)
> ValueError: unsupported hash type sha384
> ERROR:root:code for hash sha512 was not found.
> Traceback (most recent call last):
> File "/usr/lib/python2.7/hashlib.py", line 139, in <module>
> globals()[__func_name] =3D __get_hash(__func_name)
> File "/usr/lib/python2.7/hashlib.py", line 91, in =
__get_builtin_constructor
> raise ValueError('unsupported hash type %s' % name)
> ValueError: unsupported hash type sha512
> >>>
>=20
> Here is some additional information that might be useful:
>=20
> root@beaglebone:~# opkg list-installed | grep python
> libpython2.7-1.0 - 2.7.2-r2.11
> python-2to3 - 2.7.2-r2.11
> python-audio - 2.7.2-r2.11
> python-bsddb - 2.7.2-r2.11
> python-codecs - 2.7.2-r2.11
> python-compile - 2.7.2-r2.11
> python-compiler - 2.7.2-r2.11
> python-compression - 2.7.2-r2.11
> python-core - 2.7.2-r2.11
> python-crypt - 2.7.2-r2.11
> python-ctypes - 2.7.2-r2.11
> python-curses - 2.7.2-r2.11
> python-datetime - 2.7.2-r2.11
> python-db - 2.7.2-r2.11
> python-debugger - 2.7.2-r2.11
> python-difflib - 2.7.2-r2.11
> python-distutils - 2.7.2-r2.11
> python-doctest - 2.7.2-r2.11
> python-elementtree - 2.7.2-r2.11
> python-email - 2.7.2-r2.11
> python-fcntl - 2.7.2-r2.11
> python-gdbm - 2.7.2-r2.11
> python-hotshot - 2.7.2-r2.11
> python-html - 2.7.2-r2.11
> python-idle - 2.7.2-r2.11
> python-image - 2.7.2-r2.11
> python-io - 2.7.2-r2.11
> python-json - 2.7.2-r2.11
> python-lang - 2.7.2-r2.11
> python-logging - 2.7.2-r2.11
> python-mailbox - 2.7.2-r2.11
> python-math - 2.7.2-r2.11
> python-mime - 2.7.2-r2.11
> python-mmap - 2.7.2-r2.11
> python-modules - 2.7.2-r2.11
> python-multiprocessing - 2.7.2-r2.11
> python-netclient - 2.7.2-r2.11
> python-netserver - 2.7.2-r2.11
> python-numbers - 2.7.2-r2.11
> python-pickle - 2.7.2-r2.11
> python-pkgutil - 2.7.2-r2.11
> python-pprint - 2.7.2-r2.11
> python-profile - 2.7.2-r2.11
> python-pydoc - 2.7.2-r2.11
> python-re - 2.7.2-r2.11
> python-readline - 2.7.2-r2.11
> python-resource - 2.7.2-r2.11
> python-robotparser - 2.7.2-r2.11
> python-shell - 2.7.2-r2.11
> python-smtpd - 2.7.2-r2.11
> python-sqlite3 - 2.7.2-r2.11
> python-sqlite3-tests - 2.7.2-r2.11
> python-stringold - 2.7.2-r2.11
> python-subprocess - 2.7.2-r2.11
> python-syslog - 2.7.2-r2.11
> python-terminal - 2.7.2-r2.11
> python-tests - 2.7.2-r2.11
> python-textutils - 2.7.2-r2.11
> python-threading - 2.7.2-r2.11
> python-tkinter - 2.7.2-r2.11
> python-unittest - 2.7.2-r2.11
> python-unixadmin - 2.7.2-r2.11
> python-xml - 2.7.2-r2.11
> python-xmlrpc - 2.7.2-r2.11
> python-zlib - 2.7.2-r2.11
>=20
> root@beaglebone:~# opkg list-installed | grep openssl
> openssl - 1.0.0h-r15.1
>=20
> I'm grateful for any kind of help solving this issue.
>=20
> Best Regards
> / Mattias
>=20
> _______________________________________________
> Angstrom-distro-devel mailing list
> Angstrom-distro-devel@linuxtogo.org
> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/angstrom-distro-devel



