Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1SpFN0-0005fv-Li
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 11:07:35 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 12 Jul 2012 01:56:19 -0700
Received: by lbbgj3 with SMTP id gj3so2609239lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 01:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=75Krg/G/8liJf2vllgxy04LZip+nlELVRN33lLLBZbU=;
	b=BjZ0tsx+4fSslzqefRrrYOX95sdgoGrJGgik4UWDsZE/oQVQdnI1KjbGek1uwgIAnz
	2tnvD3FCrPp0rRZyuQGc8L6K/Dbf5RnI7QvCMbI21Rgk5jQYG97vmCVIWAahmunYKZ58
	atq6xiymL1Z0hFXsSDqL7X0t3DfdIqK9SrCGwJvvyO5HAwhbcPEiW7m1xHo3vn1tg4Vo
	Z5Q8su1Y+sYknhiLej2ywGnUthfHsrTkmK43/U8T/Z9hKLDaK3LCoi639yv11hZCqIYs
	mkg64O+ivICTXBFct3mQzt/sB2FJLRrAuGl8zuha0zv43JexUgu83UVRTLpyZEcPoLIQ
	QCyA==
MIME-Version: 1.0
Received: by 10.152.108.144 with SMTP id hk16mr52319863lab.2.1342083376781;
	Thu, 12 Jul 2012 01:56:16 -0700 (PDT)
Received: by 10.112.38.132 with HTTP; Thu, 12 Jul 2012 01:56:16 -0700 (PDT)
In-Reply-To: <CAJ2CSBuJYeUMYEa8RycpMzZA551xoR0Fe5QJi8GgBg7f=C1PLA@mail.gmail.com>
References: <CAJ2CSBuJYeUMYEa8RycpMzZA551xoR0Fe5QJi8GgBg7f=C1PLA@mail.gmail.com>
Date: Thu, 12 Jul 2012 11:56:16 +0300
Message-ID: <CAJ2CSBt+NSLH0_WhdDfMN8GUw5epy_u31aeESaZxT=7rQ90WfQ@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkuofiR3iURahA0sfLza82cfVvyIDeb0CJppw97zL9+I+5+SW2pbGDX3RcZ9FLRKtOngHvx
Subject: Re: python error when building various packages
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
X-List-Received-Date: Thu, 12 Jul 2012 09:07:35 -0000
Content-Type: multipart/alternative; boundary=bcaec54d4dd6ee9b1d04c49e2247

--bcaec54d4dd6ee9b1d04c49e2247
Content-Type: text/plain; charset=ISO-8859-1

Solved by do_clean on the packages.

Still Alex doesn't know what triggers the error.
-

On Fri, Jul 6, 2012 at 5:44 PM, Damian, Alexandru <
alexandru.damian@intel.com> wrote:

> Hi guys,
>
> I started to see this error today, anybody seen this before ?
>
> Cheers,
> Alex
>
> NOTE: Creating RPM package for python-man
> | DEBUG: Python function write_specfile finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common',
> 'common-linux', 'common-glibc', 'i586-linux', 'common']
> | DEBUG: Executing shell function BUILDSPEC
> | Building target platforms: i586-poky-linux
> | Processing files: libpython2.7-1.0-2.7.3-r0.0.i586
> | Traceback (most recent call last):
> |   File "/usr/lib/python2.7/site.py", line 562, in <module>
> |     main()
> |   File "/usr/lib/python2.7/site.py", line 544, in main
> |     known_paths = addusersitepackages(known_paths)
> |   File "/usr/lib/python2.7/site.py", line 271, in addusersitepackages
> |     user_site = getusersitepackages()
> |   File "/usr/lib/python2.7/site.py", line 246, in getusersitepackages
> |     user_base = getuserbase() # this will also set USER_BASE
> |   File "/usr/lib/python2.7/site.py", line 236, in getuserbase
> |     USER_BASE = get_config_var('userbase')
> |   File "/usr/lib/python2.7/sysconfig.py", line 577, in get_config_var
> |     return get_config_vars().get(name)
> |   File "/usr/lib/python2.7/sysconfig.py", line 476, in get_config_vars
> |     _init_posix(_CONFIG_VARS)
> |   File "/usr/lib/python2.7/sysconfig.py", line 337, in _init_posix
> |     makefile = _get_makefile_filename()
> |   File "/usr/lib/python2.7/sysconfig.py", line 331, in
> _get_makefile_filename
> |     return
> os.path.join(get_path('platstdlib').replace("/usr/local","/usr",1),
> "config" + (sys.pydebug and "_d" or ""), "Makefile")
> | AttributeError: 'module' object has no attribute 'pydebug'
> | error: Command
> "/home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/python-2.7.3-r0.0/python.provides"
> failed, exit(1)
> | Finding  Provides:
> /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/python-2.7.3-r0.0/python.provides
> | error: Failed to find Provides:
> | Requires(interp): /bin/sh
> | Requires(post): /bin/sh
> | Requires(interp): /bin/sh
> | Requires(post): /bin/sh
> |
> |
> | RPM build errors:
> |     Command
> "/home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/python-2.7.3-r0.0/python.provides"
> failed, exit(1)
>
>

--bcaec54d4dd6ee9b1d04c49e2247
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Solved by do_clean on the packages.<br><br>Still Alex doesn&#39;t know what=
 triggers the error.<br>-<br><br><div class=3D"gmail_quote">On Fri, Jul 6, =
2012 at 5:44 PM, Damian, Alexandru <span dir=3D"ltr">&lt;<a href=3D"mailto:=
alexandru.damian@intel.com" target=3D"_blank">alexandru.damian@intel.com</a=
>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi guys,<br><br>I started to see this error =
today, anybody seen this before ?<br><br>Cheers,<br>Alex<br><br>NOTE: Creat=
ing RPM package for python-man<br>
| DEBUG: Python function write_specfile finished<br>| DEBUG: SITE files [&#=
39;endian-little&#39;, &#39;bit-32&#39;, &#39;ix86-common&#39;, &#39;common=
-linux&#39;, &#39;common-glibc&#39;, &#39;i586-linux&#39;, &#39;common&#39;=
]<br>

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
</blockquote></div><br>

--bcaec54d4dd6ee9b1d04c49e2247--
