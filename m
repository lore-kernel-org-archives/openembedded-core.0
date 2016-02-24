Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 30301770F9;
	Wed, 24 Feb 2016 16:19:38 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id g62so37322787wme.0;
	Wed, 24 Feb 2016 08:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LXRorvYR6UkKGvT60AKPpwC7eorQqzwTyER75Jn/utM=;
	b=OgBwkgOAxBHG5jzwORiJ5vm2xdAx6A2Sh02DCuuXXoRkHECiERTvVOyJc4jxFGvUbF
	57SnWVCnWAFL3NE+CgX04BHsU74MhjCXBMBrzbFa3kAepssDYVha+udjZbFcomf4u1n0
	Gzbb1bbq4sDQaH9dUltmiPIVuGLM0E/sskE531OhTAnZGhBfL98dtgDm1C3FCm9w2XbP
	v8+j5I6Jk2aKzj4BpGQeDYrCkvrbJOx3N0ZHaMRP2mr9a2qgX+mvTDfWvUnLaZ+ASqEa
	qc4+G+K9hgr8TJrE17B1kAupfS0VqJ5Qv4OogWq9BUVIFUhBbh1hZ6LFZyt1/ss3Nrkh
	UJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LXRorvYR6UkKGvT60AKPpwC7eorQqzwTyER75Jn/utM=;
	b=SSEcRhtsr/9IPHlkffFZmSi1kOaV4jTZ3ap5Fh+nkFzkPySXLjhomK39gnwUropYnm
	1cRJC0TYTC7FrVhV512NT+RvgXA0M+ENY6jY+wEZcHQugdRxGGM/TB/3Ay6gTQQdh7X+
	YaUpSijj6TRKPrqyQHFKqIVbl8l73PABF5ZLeOA6/xmdTqBMd0iRXSA9ri32SxYovVWa
	jNUxkDTn7AvRyfy3E0Tbh6i5GYER4XBrbSrB+m50hrqJkdbP0ekUhT/Wj7vPMb5qQzQq
	LkFqwRJHgcrOZb2R8FvIkYkxUQchmhso9HDA1CQc6mCuoKY5JoEGTFOfOlMwZAVHN+2G
	G/gQ==
X-Gm-Message-State: AG10YOQGftnBS77qPHkP0LNxG0uaZ4nxFpW7x57DwVcComC3mbxeSNEwUWDwPyqmbEx+vg==
X-Received: by 10.28.5.203 with SMTP id 194mr26570898wmf.101.1456330778831;
	Wed, 24 Feb 2016 08:19:38 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	198sm4174940wml.22.2016.02.24.08.19.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 08:19:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Feb 2016 17:20:44 +0100
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20160224162044.GF2560@jama>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
	<1456148105-9644-8-git-send-email-derek@asterius.io>
	<20160224130413.GD7560@jama>
MIME-Version: 1.0
In-Reply-To: <20160224130413.GD7560@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Derek Straka <derek@asterius.io>
Subject: python-setuptools fetch issues Was: [oe] [meta-python][PATCH 08/11] python-mock: update to 1.3.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Feb 2016 16:19:39 -0000
X-Groupsio-MsgNum: 78611
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NQTVMVnDVuULnIzU"
Content-Disposition: inline

--NQTVMVnDVuULnIzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2016 at 02:04:13PM +0100, Martin Jansa wrote:
> On Mon, Feb 22, 2016 at 08:35:02AM -0500, Derek Straka wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>

After fixing the download issue, I can see another error, which has the same
root cause (various fetch failures from my jenkins slave when SSLv2 is used=
).

But more important question is why are setuptools trying to fetch pbr from
outside network and how will we prevent it.

Bitbake builds should be able to create an image just from pre-populated
downloads directory (also when BB_NO_NETWORK is set), this breaks that
principle.

NOTE: recipe python-mock-1.3.0-r0: task do_compile: Started
NOTE: recipe python-mock-1.3.0-r0: task do_populate_lic: Succeeded
ERROR: python-mock-1.3.0-r0 do_compile: python setup.py build execution fai=
led.
ERROR: python-mock-1.3.0-r0 do_compile: Function failed: do_compile (log fi=
le is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-=
linux-gnueabi/python-mock/1.3.0-r0/temp/log.do_compile.12826)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/python-mock/1.3.0-r0/temp/log.do_compile.=
12826 =20
NOTE: recipe python-mock-1.3.0-r0: task do_compile: Failed
ERROR: Task 6 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python-mock_1.3.0.bb, do_compile) failed with exi=
t code '1'
NOTE: Tasks Summary: Attempted 853 tasks of which 847 didn't need to be rer=
un and 1 failed.


DEBUG: Executing shell function do_compile
Download error on https://pypi.python.org/simple/pbr/: [SSL: UNKNOWN_PROTOC=
OL] unknown protocol (_ssl.c:590) -- Some packages may not be found!
Couldn't find index page for 'pbr' (maybe misspelled?)
Download error on https://pypi.python.org/simple/: [SSL: UNKNOWN_PROTOCOL] =
unknown protocol (_ssl.c:590) -- Some packages may not be found!
No local packages or download links found for pbr>=3D1.3
Traceback (most recent call last):
  File "setup.py", line 18, in <module>
    pbr=3DTrue)
  File "/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr=
/lib/python2.7/distutils/core.py", line 111, in setup
    _setup_distribution =3D dist =3D klass(attrs)
  File "build/bdist.linux-x86_64/egg/setuptools/dist.py", line 269, in __in=
it__
  File "build/bdist.linux-x86_64/egg/setuptools/dist.py", line 313, in fetc=
h_build_eggs
  File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 827, =
in resolve
  File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 1072,=
 in best_match
  File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 1084,=
 in obtain
  File "build/bdist.linux-x86_64/egg/setuptools/dist.py", line 380, in fetc=
h_build_egg
  File "build/bdist.linux-x86_64/egg/setuptools/command/easy_install.py", l=
ine 634, in easy_install
distutils.errors.DistutilsError: Could not find suitable distribution for R=
equirement.parse('pbr>=3D1.3')
WARNING: exit code 1 from a shell command.
ERROR: python setup.py build execution failed.
ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe=
/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/python-mock/1.3.0-r=
0/temp/log.do_compile.12826)



--NQTVMVnDVuULnIzU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbN2FsACgkQN1Ujt2V2gBw45wCglxuGlsPX110HbQvO9Qfl/Tls
XsoAnAtOHpuLrVltVwNaQFHLSyRKMKYI
=d55c
-----END PGP SIGNATURE-----

--NQTVMVnDVuULnIzU--
