Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1Sn9wD-0008Ce-Co
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 16:55:17 +0200
Received: from mail-bk0-f52.google.com ([209.85.214.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 06 Jul 2012 07:44:10 -0700
Received: by bkcjf3 with SMTP id jf3so3307334bkc.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2012 07:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=kppEiMmOFj4YpMRqbx9BDv8ThR0cNSdDnSkgLudlsOA=;
	b=SGO/pqh/Uw6DzgEsafTIw/NuaAxQ1Vv0Sh8YVqgp4qtXZZXPPeLeKMeRjjyPRyXs8E
	h6s0gEv4yXBccVyJ1kn8I1hALK85ua/CDJyQgv3O08oIKXu3RDteBpc5U8tgB2YyS4F2
	nN7+suiN7fX8lSM0ucXqHdsbeDIXLudq3X0nEV89T0qP/pIUe600SpOsNQspnEUSKGSi
	Ii3VxUV46lSh8vDgz/cfjrwsbNIBi+NdtJ2tGa/cch3QLDJHcZUljygRkJnkN6PZuR0V
	gnT+n9rIbN0OL+1hknHy4qaNdPO0oRo6jtlybDfYmdowKCsrxcc6imOwkrQNecrUbmvO
	0AGQ==
MIME-Version: 1.0
Received: by 10.152.146.67 with SMTP id ta3mr30367380lab.27.1341585848297;
	Fri, 06 Jul 2012 07:44:08 -0700 (PDT)
Received: by 10.112.38.132 with HTTP; Fri, 6 Jul 2012 07:44:08 -0700 (PDT)
Date: Fri, 6 Jul 2012 17:44:08 +0300
Message-ID: <CAJ2CSBuJYeUMYEa8RycpMzZA551xoR0Fe5QJi8GgBg7f=C1PLA@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkiVbId11lDUqFv5jSlY911gnOv3rqzSThsjNQvKoS9ogfBM/2XdbmD9iLPIXH1OJZVYt5X
Subject: python error when building various packages
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
X-List-Received-Date: Fri, 06 Jul 2012 14:55:17 -0000
Content-Type: multipart/alternative; boundary=e89a8f22c72bec66fa04c42a4b92

--e89a8f22c72bec66fa04c42a4b92
Content-Type: text/plain; charset=ISO-8859-1

Hi guys,

I started to see this error today, anybody seen this before ?

Cheers,
Alex

NOTE: Creating RPM package for python-man
| DEBUG: Python function write_specfile finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common',
'common-linux', 'common-glibc', 'i586-linux', 'common']
| DEBUG: Executing shell function BUILDSPEC
| Building target platforms: i586-poky-linux
| Processing files: libpython2.7-1.0-2.7.3-r0.0.i586
| Traceback (most recent call last):
|   File "/usr/lib/python2.7/site.py", line 562, in <module>
|     main()
|   File "/usr/lib/python2.7/site.py", line 544, in main
|     known_paths = addusersitepackages(known_paths)
|   File "/usr/lib/python2.7/site.py", line 271, in addusersitepackages
|     user_site = getusersitepackages()
|   File "/usr/lib/python2.7/site.py", line 246, in getusersitepackages
|     user_base = getuserbase() # this will also set USER_BASE
|   File "/usr/lib/python2.7/site.py", line 236, in getuserbase
|     USER_BASE = get_config_var('userbase')
|   File "/usr/lib/python2.7/sysconfig.py", line 577, in get_config_var
|     return get_config_vars().get(name)
|   File "/usr/lib/python2.7/sysconfig.py", line 476, in get_config_vars
|     _init_posix(_CONFIG_VARS)
|   File "/usr/lib/python2.7/sysconfig.py", line 337, in _init_posix
|     makefile = _get_makefile_filename()
|   File "/usr/lib/python2.7/sysconfig.py", line 331, in
_get_makefile_filename
|     return
os.path.join(get_path('platstdlib').replace("/usr/local","/usr",1),
"config" + (sys.pydebug and "_d" or ""), "Makefile")
| AttributeError: 'module' object has no attribute 'pydebug'
| error: Command
"/home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/python-2.7.3-r0.0/python.provides"
failed, exit(1)
| Finding  Provides:
/home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/python-2.7.3-r0.0/python.provides
| error: Failed to find Provides:
| Requires(interp): /bin/sh
| Requires(post): /bin/sh
| Requires(interp): /bin/sh
| Requires(post): /bin/sh
|
|
| RPM build errors:
|     Command
"/home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/python-2.7.3-r0.0/python.provides"
failed, exit(1)

--e89a8f22c72bec66fa04c42a4b92
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi guys,<br><br>I started to see this error today, anybody seen this before=
 ?<br><br>Cheers,<br>Alex<br><br>NOTE: Creating RPM package for python-man<=
br>| DEBUG: Python function write_specfile finished<br>| DEBUG: SITE files =
[&#39;endian-little&#39;, &#39;bit-32&#39;, &#39;ix86-common&#39;, &#39;com=
mon-linux&#39;, &#39;common-glibc&#39;, &#39;i586-linux&#39;, &#39;common&#=
39;]<br>
| DEBUG: Executing shell function BUILDSPEC<br>| Building target platforms:=
 i586-poky-linux<br>| Processing files: libpython2.7-1.0-2.7.3-r0.0.i586<br=
>| Traceback (most recent call last):<br>|=A0=A0 File &quot;/usr/lib/python=
2.7/site.py&quot;, line 562, in &lt;module&gt;<br>
|=A0=A0=A0=A0 main()<br>|=A0=A0 File &quot;/usr/lib/python2.7/site.py&quot;=
, line 544, in main<br>|=A0=A0=A0=A0 known_paths =3D addusersitepackages(kn=
own_paths)<br>|=A0=A0 File &quot;/usr/lib/python2.7/site.py&quot;, line 271=
, in addusersitepackages<br>
|=A0=A0=A0=A0 user_site =3D getusersitepackages()<br>|=A0=A0 File &quot;/us=
r/lib/python2.7/site.py&quot;, line 246, in getusersitepackages<br>|=A0=A0=
=A0=A0 user_base =3D getuserbase() # this will also set USER_BASE<br>|=A0=
=A0 File &quot;/usr/lib/python2.7/site.py&quot;, line 236, in getuserbase<b=
r>
|=A0=A0=A0=A0 USER_BASE =3D get_config_var(&#39;userbase&#39;)<br>|=A0=A0 F=
ile &quot;/usr/lib/python2.7/sysconfig.py&quot;, line 577, in get_config_va=
r<br>|=A0=A0=A0=A0 return get_config_vars().get(name)<br>|=A0=A0 File &quot=
;/usr/lib/python2.7/sysconfig.py&quot;, line 476, in get_config_vars<br>
|=A0=A0=A0=A0 _init_posix(_CONFIG_VARS)<br>|=A0=A0 File &quot;/usr/lib/pyth=
on2.7/sysconfig.py&quot;, line 337, in _init_posix<br>|=A0=A0=A0=A0 makefil=
e =3D _get_makefile_filename()<br>|=A0=A0 File &quot;/usr/lib/python2.7/sys=
config.py&quot;, line 331, in _get_makefile_filename<br>
|=A0=A0=A0=A0 return os.path.join(get_path(&#39;platstdlib&#39;).replace(&q=
uot;/usr/local&quot;,&quot;/usr&quot;,1), &quot;config&quot; + (sys.pydebug=
 and &quot;_d&quot; or &quot;&quot;), &quot;Makefile&quot;)<br>| AttributeE=
rror: &#39;module&#39; object has no attribute &#39;pydebug&#39;<br>
| error: Command &quot;/home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linu=
x/python-2.7.3-r0.0/python.provides&quot; failed, exit(1)<br>| Finding=A0 P=
rovides: /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/python-2.7.3=
-r0.0/python.provides<br>
| error: Failed to find Provides:<br>| Requires(interp): /bin/sh<br>| Requi=
res(post): /bin/sh<br>| Requires(interp): /bin/sh<br>| Requires(post): /bin=
/sh<br>| <br>| <br>| RPM build errors:<br>|=A0=A0=A0=A0 Command &quot;/home=
/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/python-2.7.3-r0.0/python.p=
rovides&quot; failed, exit(1)<br>
<br>

--e89a8f22c72bec66fa04c42a4b92--
