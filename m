Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 91099606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 10:39:20 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id j185so9856393oih.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 03:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/6KrHmL2yCDYFmov/QkN0vAL4HLdQcq6F2eDQcd9c7I=;
	b=EZY0VSFfkfpoy+EEHMBNb84J8qlsFTytTkgoLuWpXSPDAS1tmU8l38muDgenuxjN7z
	/Qf/n5gnEWQsJVvHU8oxoiVEcxq1UfNF9eJKOnRyW04XcrIPf8sq5pEa35ApZFs8ToAx
	1YxVFusX+ld8M8rBFdWHkKZ6s01V4Ftm9fIn3YMUB4TYM88CZllJh5P0xalw+tmGNkxn
	qmTy9RBObkqXFiPWKmrT7JneniAFogiCEX/V7tN2YO+83sw6b+dNVZPMYtq3j3n5qu3m
	5spWDSWXkCKHJeEIlyni11sxLNnqRGjZBRLE28NZXNY8WmePXVUHbdT8hqXFkROWe/gT
	xEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/6KrHmL2yCDYFmov/QkN0vAL4HLdQcq6F2eDQcd9c7I=;
	b=UdBMmJVQDW3K36mz75x6jV7KoI8iBiJtybn5/YeFL0H8vJTwW6B0pWe0fBguHTPe8b
	yzLWVUVhQHxnCyvV3AvRRIYCqixAt3tmU6qspyYRiPwXSOUNgDB5aSBA0bUhzUHXIwMB
	oV0/AZbWgGdml/WrsADebYOIgSUnSOq+565s/ro+zSafltj77k1g/pdKiUae2Nz3Guev
	sMH+HiB9JyL/KNApCzQsuAqYeS/ox1vTRqmArFAiMb5/FkwIgPT4x66JQO9BgG90idkm
	xOv3CSpPS3YXMv33uYTKtA0HeacWWmm5UCd8UWM0ytJD+RK9JTCO4n41tLx6nS/ac2HH
	Q2zw==
X-Gm-Message-State: ALyK8tKYosfOSAOgg+jq7sgnfs60ygNFnrcLI8h9UoeXJCQfcIX94sWRcZUs3vnaS0ZHFfB9ovvX0w2COcIBlkgK
X-Received: by 10.202.228.133 with SMTP id b127mr13344424oih.168.1468319960001;
	Tue, 12 Jul 2016 03:39:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.199.134 with HTTP; Tue, 12 Jul 2016 03:38:50 -0700 (PDT)
In-Reply-To: <71487947-2b12-ecb8-110f-be7002efb8d4@linux.intel.com>
References: <cover.1467905611.git.jussi.kukkonen@intel.com>
	<b0ba31b71ad1e9d540ab007713fe034a3bc1f7d1.1467905611.git.jussi.kukkonen@intel.com>
	<CAJTo0LZ67c7MXQrsBYzK6c+dQ3DGq0Xp5To+pz64qo=Cu8qeKQ@mail.gmail.com>
	<CAHiDW_G_NZWhoq-Grt=jjpc4H+pkkuOdbGL7kf5Omho1dLhNFA@mail.gmail.com>
	<71487947-2b12-ecb8-110f-be7002efb8d4@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 12 Jul 2016 13:38:50 +0300
Message-ID: <CAHiDW_EGQ3d1ndn3HjJqU4EmVrYVMyG+Ouk6d2miT_qW02pasA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] python-six: Add to oe-core
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
X-List-Received-Date: Tue, 12 Jul 2016 10:39:23 -0000
Content-Type: multipart/alternative; boundary=001a1141b28aa204e905376de125

--001a1141b28aa204e905376de125
Content-Type: text/plain; charset=UTF-8

On 11 July 2016 at 17:27, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 07/11/2016 02:46 PM, Jussi Kukkonen wrote:
>
> Not sure where a URL like that comes from or why it would be accessed
>> during build? Li Xin, any comment?
>>
>
> A few recipes in meta-oe have this issue, for example python-mccabe:
>
> DEBUG: Executing shell function do_compile
> Download error on https://pypi.python.org/simple/pytest-runner/: [Errno
> 110] Connection timed out -- Some packages may not be found!
> Couldn't find index page for 'pytest-runner' (maybe misspelled?)
> Download error on https://pypi.python.org/simple/: [Errno 110] Connection
> timed out -- Some packages may not be found!
> No local packages or download links found for pytest-runner
> Traceback (most recent call last):
>   File "setup.py", line 57, in <module>
>     'Topic :: Software Development :: Quality Assurance',
>   File
> "/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/core.py",
> line 111, in setup
>     _setup_distribution = dist = klass(attrs)
>   File
> "/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/setuptools/dist.py",
> line 269, in __init__
>   File
> "/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/setuptools/dist.py",
> line 313, in fetch_build_eggs
>

So mccabe recipe doesn't depend on pytest-runner but does have it in
"setup_requires": as a result setuptools tries to download and unpack the
pytest-runner egg. I think that might be solved by depending on
pytest-runner, although  "setup_requires" handling does have some issues so
I'm not sure about that: https://github.com/pypa/pip/issues/410 .

Interestingly  python-cryptography does not have six in "setup_requires" so
I still don't understand why it would do this. I'll do a few tests on that
before sending the updated patch set.

Jussi


  File
> "/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/pkg_resources/__init__.py",
> line 826, in resolve
>   File
> "/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/pkg_resources/__init__.py",
> line 1092, in best_match
>   File
> "/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/pkg_resources/__init__.py",
> line 1104, in obtain
>   File
> "/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/setuptools/dist.py",
> line 380, in fetch_build_egg
>   File
> "/home/ak/development/poky/build-meta-openembedded/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.egg/setuptools/command/easy_install.py",
> line 659, in easy_install
> distutils.errors.DistutilsError: Could not find suitable distribution for
> Requirement.parse('pytest-runner')
> WARNING: exit code 1 from a shell command.
> ERROR: Function failed: do_compile (log file is located at
> /home/ak/development/poky/build-meta-openembedded/tmp/work/i586-poky-linux/python-mccabe/0.4.0-r0/temp/log.do_compile.3493)
>
>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141b28aa204e905376de125
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
1 July 2016 at 17:27, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin=
@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;border-left-color:rgb(204,204,204);padding-left:1ex"><span>On 07/11/2=
016 02:46 PM, Jussi Kukkonen wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);p=
adding-left:1ex">
Not sure where a URL like that comes from or why it would be accessed<br>
during build? Li Xin, any comment?<br>
</blockquote>
<br></span>
A few recipes in meta-oe have this issue, for example python-mccabe:<br>
<br>
DEBUG: Executing shell function do_compile<br>
Download error on <a href=3D"https://pypi.python.org/simple/pytest-runner/"=
 rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/simple/pytest=
-runner/</a>: [Errno 110] Connection timed out -- Some packages may not be =
found!<br>
Couldn&#39;t find index page for &#39;pytest-runner&#39; (maybe misspelled?=
)<br>
Download error on <a href=3D"https://pypi.python.org/simple/" rel=3D"norefe=
rrer" target=3D"_blank">https://pypi.python.org/simple/</a>: [Errno 110] Co=
nnection timed out -- Some packages may not be found!<br>
No local packages or download links found for pytest-runner<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;setup.py&quot;, line 57, in &lt;module&gt;<br>
=C2=A0 =C2=A0 &#39;Topic :: Software Development :: Quality Assurance&#39;,=
<br>
=C2=A0 File &quot;/home/ak/development/poky/build-meta-openembedded/tmp/sys=
roots/x86_64-linux/usr/lib/python2.7/distutils/core.py&quot;, line 111, in =
setup<br>
=C2=A0 =C2=A0 _setup_distribution =3D dist =3D klass(attrs)<br>
=C2=A0 File &quot;/home/ak/development/poky/build-meta-openembedded/tmp/sys=
roots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.=
egg/setuptools/dist.py&quot;, line 269, in __init__<br>
=C2=A0 File &quot;/home/ak/development/poky/build-meta-openembedded/tmp/sys=
roots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.=
egg/setuptools/dist.py&quot;, line 313, in fetch_build_eggs<br></blockquote=
><div><br></div><div>So mccabe recipe doesn&#39;t depend on pytest-runner b=
ut does have it in &quot;setup_requires&quot;: as a result setuptools tries=
 to download and unpack the pytest-runner egg. I think that might be solved=
 by depending on pytest-runner, although =C2=A0&quot;setup_requires&quot; h=
andling does have some issues so I&#39;m not sure about that: <a href=3D"ht=
tps://github.com/pypa/pip/issues/410" target=3D"_blank">https://github.com/=
pypa/pip/issues/410</a> .</div><div><br></div><div>Interestingly =C2=A0pyth=
on-cryptography does not have six in &quot;setup_requires&quot; so I still =
don&#39;t understand why it would do this. I&#39;ll do a few tests on that =
before sending the updated patch set.<br></div><div><br></div><div>Jussi</d=
iv><div><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;bor=
der-left-color:rgb(204,204,204);padding-left:1ex">
=C2=A0 File &quot;/home/ak/development/poky/build-meta-openembedded/tmp/sys=
roots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.=
egg/pkg_resources/__init__.py&quot;, line 826, in resolve<br>
=C2=A0 File &quot;/home/ak/development/poky/build-meta-openembedded/tmp/sys=
roots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.=
egg/pkg_resources/__init__.py&quot;, line 1092, in best_match<br>
=C2=A0 File &quot;/home/ak/development/poky/build-meta-openembedded/tmp/sys=
roots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.=
egg/pkg_resources/__init__.py&quot;, line 1104, in obtain<br>
=C2=A0 File &quot;/home/ak/development/poky/build-meta-openembedded/tmp/sys=
roots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.=
egg/setuptools/dist.py&quot;, line 380, in fetch_build_egg<br>
=C2=A0 File &quot;/home/ak/development/poky/build-meta-openembedded/tmp/sys=
roots/x86_64-linux/usr/lib/python2.7/site-packages/setuptools-22.0.5-py2.7.=
egg/setuptools/command/easy_install.py&quot;, line 659, in easy_install<br>
distutils.errors.DistutilsError: Could not find suitable distribution for R=
equirement.parse(&#39;pytest-runner&#39;)<br>
WARNING: exit code 1 from a shell command.<br>
ERROR: Function failed: do_compile (log file is located at /home/ak/develop=
ment/poky/build-meta-openembedded/tmp/work/i586-poky-linux/python-mccabe/0.=
4.0-r0/temp/log.do_compile.3493)<br>
<br>
<br>
Alex<span><font color=3D"#888888"><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--001a1141b28aa204e905376de125--
