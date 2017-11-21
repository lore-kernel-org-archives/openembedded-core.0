Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1F988787EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 21:11:40 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id m191so3681818itg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 13:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pFaI/QZmCd497C1yJj3ccBz3BYRrUt0+8EpiBNqjdPQ=;
	b=f733J7dxT/KKsCN+0eEIvy0xWgdHotedr3Dj2VVHmIq4p2DAsNH/kJz7o55osCtsxc
	GPgMWM+N8x/2xMNBbYNICOaAt+LjI+cMHvcarFxS1vRwGOqMAfCFOn3gvPlJ/R4xdYCB
	skhfC23l9Zsn6FhrKjlOlK7OkpZ3Pe5ZtxmJKzrU4l5F1sEiuMcD9RbC24FH4Wz7l1hY
	ab3GXt54Jif2ktdYVLyV1DprvjKJkGFsNRk38q6Zx0uoPQ0EQcgmb1i63/KJ3RnaEx6p
	RgpFG0iA7NS8BuADyx93XDTroemxhhCxzSiqD9vCz27kQU9zjefgvybsHKwSbT+uD58A
	AKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pFaI/QZmCd497C1yJj3ccBz3BYRrUt0+8EpiBNqjdPQ=;
	b=oqa1JgL8ezUZOyDLDMhfwUn5ChQ3KNtJC0pd9OXjaxAfHZ/82wzrh1aMm/neNyl2pM
	UuSkzUgrjI9id9j9eA0kn5juWF4V+IMU7bsHQi2artPqo6+IOwd1rQVkx9YdCL0/41OU
	8HGS1UKoM0s1ZcBvnjb1DMc1DGU25xPySSqijGIpKErx8iLoLtnGZ9yHLEsSU3JTr9x1
	hPvGE1/KFzUOLkLPTR/smYsEge/SVdKo966gJAKssk9y4i/QsgFcmnMPqUS8BFHvfS6K
	QFvqZmPkwqwGyW8U9aTt/PNV6AU+DS0ql52pBXO8qMRFysMNVZ8AztGHHMP4F1B0Bupi
	GY5g==
X-Gm-Message-State: AJaThX6uTdeUuXkhfJVB56ZKrt83Ybtps7+0f7zauoyKcQBcdAN/KPHy
	baDt+8ZpuxBur5ynRuO6vcX2Nci6QF5GYDxmEUiNy37m
X-Google-Smtp-Source: AGs4zMaZ8ZH7vHJHZjVSIPH40nfOa7chPbsvFQSO8gXwWXsbOey03K/MoD7RaqGPgKTsHc2k5Ag1tLzbGn19JEEfodk=
X-Received: by 10.36.162.65 with SMTP id o1mr3806492iti.85.1511298701913; Tue,
	21 Nov 2017 13:11:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Tue, 21 Nov 2017 13:11:21 -0800 (PST)
In-Reply-To: <20171113191153.32753-1-thomas.perrot@tupi.fr>
References: <20171113191153.32753-1-thomas.perrot@tupi.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Nov 2017 21:11:21 +0000
Message-ID: <CAJTo0LZFzoXr6kWyinJchFgvKa26q_8jUvC5KMt=C=LSVtMR1Q@mail.gmail.com>
To: Thomas Perrot <thomas.perrot@tupi.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] toolchain-scripts: Add PYTHONHOME in sdk env script
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
X-List-Received-Date: Tue, 21 Nov 2017 21:11:41 -0000
Content-Type: multipart/alternative; boundary="f403045fbd844733df055e84a67d"

--f403045fbd844733df055e84a67d
Content-Type: text/plain; charset="UTF-8"

This fails all over the autobuilders:

======================================================================
ERROR: test_python_stdout (python.PythonTest)
----------------------------------------------------------------------
Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/lib/oeqa/sdk/cases/python.py",
line 23, in test_python_stdout
    output = self._run('python %s/test.py' % self.tc.sdk_dir)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/lib/oeqa/sdk/case.py",
line 12, in _run
    stderr=subprocess.STDOUT, universal_newlines=True)
  File "/usr/lib64/python3.6/subprocess.py", line 336, in check_output
    **kwargs).stdout
  File "/usr/lib64/python3.6/subprocess.py", line 418, in run
    output=stdout, stderr=stderr)
subprocess.CalledProcessError: Command '.
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato/1.0-r0/testimage-sdk/environment-setup-armv5e-poky-linux-gnueabi
> /dev/null; python
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato/1.0-r0/testimage-sdk//test.py;'
returned non-zero exit status 1.

My guess is that its running host Python with PYTHONHOME set to the SDK,
which then fails massively as the binary parts won't be compatible.

Ross


On 13 November 2017 at 19:11, Thomas Perrot <thomas.perrot@tupi.fr> wrote:
>
> Otherwise, the host Python environment is used instead of Python
environment
> provided by the SDK.
>
> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> ---
>  meta/classes/toolchain-scripts.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass
b/meta/classes/toolchain-scripts.bbclass
> index 9bcfe708c7..03bc652cd7 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -51,6 +51,7 @@ toolchain_create_sdk_env_script () {
>         echo "export OECORE_NATIVE_SYSROOT=\"$sdkpathnative\"" >> $script
>         echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
>         echo "export OECORE_ACLOCAL_OPTS=\"-I
$sdkpathnative/usr/share/aclocal\"" >> $script
> +       echo "export PYTHONHOME=\"$sdkpathnative$libdir\"" >> $script
>         echo 'unset command_not_found_handle' >> $script
>
>         toolchain_shared_env_script
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--f403045fbd844733df055e84a67d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fails all over the autobuilders:<br><br>=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>ERROR: test_python_stdo=
ut (python.PythonTest)<br>-------------------------------------------------=
---------------------<br>Traceback (most recent call last):<br>=C2=A0 File =
&quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta=
/lib/oeqa/sdk/cases/python.py&quot;, line 23, in test_python_stdout<br>=C2=
=A0 =C2=A0 output =3D self._run(&#39;python %s/test.py&#39; % self.tc.sdk_d=
ir)<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nig=
htly-arm/build/meta/lib/oeqa/sdk/case.py&quot;, line 12, in _run<br>=C2=A0 =
=C2=A0 stderr=3Dsubprocess.STDOUT, universal_newlines=3DTrue)<br>=C2=A0 Fil=
e &quot;/usr/lib64/python3.6/subprocess.py&quot;, line 336, in check_output=
<br>=C2=A0 =C2=A0 **kwargs).stdout<br>=C2=A0 File &quot;/usr/lib64/python3.=
6/subprocess.py&quot;, line 418, in run<br>=C2=A0 =C2=A0 output=3Dstdout, s=
tderr=3Dstderr)<br>subprocess.CalledProcessError: Command &#39;. /home/poky=
build/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemua=
rm-poky-linux-gnueabi/core-image-sato/1.0-r0/testimage-sdk/environment-setu=
p-armv5e-poky-linux-gnueabi &gt; /dev/null; python /home/pokybuild/yocto-au=
tobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-=
gnueabi/core-image-sato/1.0-r0/testimage-sdk//test.py;&#39; returned non-ze=
ro exit status 1.<br><br>My guess is that its running host Python with PYTH=
ONHOME set to the SDK, which then fails massively as the binary parts won&#=
39;t be compatible.<div><br></div><div>Ross<br><br><br>On 13 November 2017 =
at 19:11, Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@tupi.fr">thomas=
.perrot@tupi.fr</a>&gt; wrote:<br>&gt;<br>&gt; Otherwise, the host Python e=
nvironment is used instead of Python environment<br>&gt; provided by the SD=
K.<br>&gt;<br>&gt; Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thoma=
s.perrot@tupi.fr">thomas.perrot@tupi.fr</a>&gt;<br>&gt; ---<br>&gt; =C2=A0m=
eta/classes/toolchain-scripts.bbclass | 1 +<br>&gt; =C2=A01 file changed, 1=
 insertion(+)<br>&gt;<br>&gt; diff --git a/meta/classes/toolchain-scripts.b=
bclass b/meta/classes/toolchain-scripts.bbclass<br>&gt; index 9bcfe708c7..0=
3bc652cd7 100644<br>&gt; --- a/meta/classes/toolchain-scripts.bbclass<br>&g=
t; +++ b/meta/classes/toolchain-scripts.bbclass<br>&gt; @@ -51,6 +51,7 @@ t=
oolchain_create_sdk_env_script () {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 ech=
o &quot;export OECORE_NATIVE_SYSROOT=3D\&quot;$sdkpathnative\&quot;&quot; &=
gt;&gt; $script<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;export OECORE=
_TARGET_SYSROOT=3D&quot;$SDKTARGETSYSROOT&quot;&#39; &gt;&gt; $script<br>&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;export OECORE_ACLOCAL_OPTS=3D\&qu=
ot;-I $sdkpathnative/usr/share/aclocal\&quot;&quot; &gt;&gt; $script<br>&gt=
; + =C2=A0 =C2=A0 =C2=A0 echo &quot;export PYTHONHOME=3D\&quot;$sdkpathnati=
ve$libdir\&quot;&quot; &gt;&gt; $script<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 echo &#39;unset command_not_found_handle&#39; &gt;&gt; $script<br>&gt;<br>=
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 toolchain_shared_env_script<br>&gt; --<br>=
&gt; 2.13.6<br>&gt;<br>&gt; --<br>&gt; ____________________________________=
___________<br>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailt=
o:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openemb=
edded.org</a><br>&gt; <a href=3D"http://lists.openembedded.org/mailman/list=
info/openembedded-core">http://lists.openembedded.org/mailman/listinfo/open=
embedded-core</a></div></div>

--f403045fbd844733df055e84a67d--
