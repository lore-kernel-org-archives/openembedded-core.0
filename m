Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.22663.1598544759575709748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 09:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DBFAnQak;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: grembeter@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id t6so2857196qvw.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 09:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9KNt2QutFc85Qbo4xsoWcujY/3/l/62yYvjyn1yOJYw=;
        b=DBFAnQakiWvXFwzvsD6TAlw6RRh3m6UOyc0SRO5uajDTdSpcex4NE2NzJoUPu99hyc
         9ta13fjaA88Dj79kLDGrYhj95Pj5vfP/kGz7xKwrg7tBhxMV1/fBEAxWyNTRYaIw0s7z
         asPU5Lq+MCPd4n/aj2rF4akTtnOtzM2JzZDSMFQ1UQ+eS364GnHF0ixnSTR61omx3OVZ
         EXhU4LfLxwbRBJFudv4TAQo3979M8WGoiknYVZr/Bqd/3XElopzZo0kyFVNhUToNvkP9
         uOiogb45fLyQZcC9/X7Cxm7ckg0bHzyTccwttmU+7QC+bJ6MXF0cojZlLSyvf1RnYc+1
         INuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9KNt2QutFc85Qbo4xsoWcujY/3/l/62yYvjyn1yOJYw=;
        b=oOSAShxY85/xsbjAH4zyxYK13f9IW/zCb4rQvGir8X6STDPwQrwYRoYAM6yvc5Odmi
         EsBmzYa70ODwm4yELSCH/mcqJystDlkOCCGZ1qKliWGzX6lrEFSVzjlVH5mPjk6Ljnoc
         oCu2FA8+mUElv7Nas9g9c7ip5jlRiHTWaYDFfwiNAq7Lr+1JbFW37hfzZa2toA3sRnQQ
         EMU1dNRxVYzWJ+k2E3BpmDPvHSkuwOkOWr4TR3t0sKFchideEIxUA95REsEf45V0ZdNr
         oiXVj9Hf83ld2jXy341l3s6btwZ0RYI/NRGlvFJsyt8EDIyoxostN//HAaDczIGuK01B
         Z2Ig==
X-Gm-Message-State: AOAM531kXxdFOqDiBAZz/1b5sFeP6XPSToZBUp0H59zoVYP3nt4d+SdC
	aLypWggPub/RsdeQ/zSpvNgFy/GxZfrZL8dh+vk=
X-Google-Smtp-Source: ABdhPJz6wBwTWHvYNNbYcWy1nkDEBHXUkeXJ2K4uyugeofgJ1ojTZLR1v6xR5eS1qFEY8zFKJTh72P5P3v2CdcWIcl0=
X-Received: by 2002:a05:6214:1709:: with SMTP id db9mr19842183qvb.142.1598544758710;
 Thu, 27 Aug 2020 09:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200827131040.439308-1-grygorii.tertychnyi@leica-geosystems.com> <CANNYZj9v3sY-XcvS3Xy1G6+789BUV3PvxWxy_W2_O1XSRfRaAg@mail.gmail.com>
In-Reply-To: <CANNYZj9v3sY-XcvS3Xy1G6+789BUV3PvxWxy_W2_O1XSRfRaAg@mail.gmail.com>
From: "gr embeter" <grembeter@gmail.com>
Date: Thu, 27 Aug 2020 18:12:26 +0200
Message-ID: <CAGFuAuw9USqrHR0Gzskq_4HycMK-699nG6curEqA3v++wseBKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: unset _PYTHON_SYSCONFIGDATA_NAME
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
Content-Type: multipart/alternative; boundary="0000000000008024ab05adde3433"

--0000000000008024ab05adde3433
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex

On Thu, Aug 27, 2020 at 4:59 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:
>
> I am able to execute that exact same command without any errors. How can
this be reproduced?

Did you run it on Ubuntu 20.04 with Python 3.8?

 =C2=BB python3 --version
Python 3.8.2

 =C2=BB apt-cache policy python3.8
python3.8:
  Installed: 3.8.2-1ubuntu1.2
  Candidate: 3.8.2-1ubuntu1.2
  Version table:
 *** 3.8.2-1ubuntu1.2 500
        500 http://ch.archive.ubuntu.com/ubuntu focal-updates/main amd64
Packages
        500 http://security.ubuntu.com/ubuntu focal-security/main amd64
Packages
        100 /var/lib/dpkg/status
     3.8.2-1ubuntu1 500
        500 http://ch.archive.ubuntu.com/ubuntu focal/main amd64 Packages

Apparently one of ubuntu1.2 patches touches Lib/sysconfig.py:

 =C2=BB cat ./debian/patches/sysconfigdata-name.diff
--- a/Lib/sysconfig.py
+++ b/Lib/sysconfig.py
@@ -345,9 +345,8 @@ def get_makefile_filename():

 def _get_sysconfigdata_name():
     return os.environ.get('_PYTHON_SYSCONFIGDATA_NAME',
-        '_sysconfigdata_{abi}_{platform}_{multiarch}'.format(
+        '_sysconfigdata_{abi}_{multiarch}'.format(
         abi=3Dsys.abiflags,
-        platform=3Dsys.platform,
         multiarch=3Dgetattr(sys.implementation, '_multiarch', ''),
     ))

> Note that we already had the same patch proposed earlier and it was
rejected, as the problem
> pops up in various different places and needs to be understood and solve=
d
properly.

Haven't seen patches for devtool, thanks for the info.

> Alex
>
> On Thu, 27 Aug 2020 at 15:11, gr embeter <grembeter@gmail.com> wrote:
>>
>> On Ubuntu 20.04.1 LTS with Python 3.8.2 "devtool modify" fails with
>> Exception: ModuleNotFoundError: No module named '_sysconfigdata'
>>
>> e.g.: devtool modify --no-same-dir --branch fit u-boot
~/ws/w/dtool/u-boot-fit
>>
>> ERROR: Error executing a python function in exec_python_func()
autogenerated:
>>
>> The stack trace of python calls that resulted in this exception/failure
was:
>> File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
>>      0001:
>>  *** 0002:devtool_post_unpack(d)
>>      0003:
>>  [...]
>> File: '/usr/lib/python3.8/sysconfig.py', lineno: 421, function:
_init_posix
>>      0417:def _init_posix(vars):
>>      0418:    """Initialize the module as appropriate for POSIX
systems."""
>>      0419:    # _sysconfigdata is generated at build time, see
_generate_posix_vars()
>>      0420:    name =3D _get_sysconfigdata_name()
>>  *** 0421:    _temp =3D __import__(name, globals(), locals(),
['build_time_vars'], 0)
>>      0422:    build_time_vars =3D _temp.build_time_vars
>>      0423:    vars.update(build_time_vars)
>>      0424:
>>      0425:def _init_non_posix(vars):
>> Exception: ModuleNotFoundError: No module named '_sysconfigdata'
>>
>> It happens because u-boot (and likely other recipes) eventually inherit=
s
>> python3native.bbclass that sets
_PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
>> and this affects host Python.
>>
>> Hence, unset _PYTHON_SYSCONFIGDATA_NAME for devtool completely.
>>
>> Signed-off-by: Grygorii Tertychnyi <
grygorii.tertychnyi@leica-geosystems.com>
>> ---
>>  meta/classes/devtool-source.bbclass | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/classes/devtool-source.bbclass
b/meta/classes/devtool-source.bbclass
>> index 280d6009f3c2..95d6fe7a29e8 100644
>> --- a/meta/classes/devtool-source.bbclass
>> +++ b/meta/classes/devtool-source.bbclass
>> @@ -22,6 +22,8 @@
>>  DEVTOOL_TEMPDIR ?=3D ""
>>  DEVTOOL_PATCH_SRCDIR =3D "${DEVTOOL_TEMPDIR}/patchworkdir"
>>
>> +# host Python fails to import correct _sysconfigdata if this variable
is set
>> +_PYTHON_SYSCONFIGDATA_NAME[unexport] =3D "1"
>>
>>  python() {
>>      tempdir =3D d.getVar('DEVTOOL_TEMPDIR')
>> --
>> 2.25.1
>>
>>=20

--0000000000008024ab05adde3433
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alex</div><div><br></div><div>On Thu, Aug 27, 2020=
 at 4:59 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt; wrote:</div>&gt;<br>&gt; I am able to execu=
te that exact same command without any errors. How can this be reproduced?<=
br><div><br></div><div>Did you run it on Ubuntu 20.04 with Python 3.8?</div=
><div><br></div><div>=C2=A0=C2=BB python3 --version<br>Python 3.8.2<br></di=
v><div><br></div><div>=C2=A0=C2=BB apt-cache policy python3.8<br>python3.8:=
<br>=C2=A0 Installed: 3.8.2-1ubuntu1.2<br>=C2=A0 Candidate: 3.8.2-1ubuntu1.=
2<br>=C2=A0 Version table:<br>=C2=A0*** 3.8.2-1ubuntu1.2 500<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 500 <a href=3D"http://ch.archive.ubuntu.com/ubuntu">http=
://ch.archive.ubuntu.com/ubuntu</a> focal-updates/main amd64 Packages<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 500 <a href=3D"http://security.ubuntu.com/ubun=
tu">http://security.ubuntu.com/ubuntu</a> focal-security/main amd64 Package=
s<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 100 /var/lib/dpkg/status<br>=C2=A0 =C2=A0 =
=
=C2=A03.8.2-1ubuntu1 500<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 500 <a href=3D"htt=
p://ch.archive.ubuntu.com/ubuntu">http://ch.archive.ubuntu.com/ubuntu</a> f=
ocal/main amd64 Packages<br></div><div><br></div><div>Apparently one of ubu=
ntu1.2 patches touches Lib/sysconfig.py:</div><div><br></div><div>=C2=A0=C2=
=
=BB cat ./debian/patches/sysconfigdata-name.diff<br>--- a/Lib/sysconfig.py=
<br>+++ b/Lib/sysconfig.py<br>@@ -345,9 +345,8 @@ def get_makefile_filename=
():<br>=C2=A0<br>=C2=A0def _get_sysconfigdata_name():<br>=C2=A0 =C2=A0 =C2=
=A0return os.environ.get(&#39;_PYTHON_SYSCONFIGDATA_NAME&#39;,<br>- =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;_sysconfigdata_{abi}_{platform}_{multiarch}&#39;.=
format(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;_sysconfigdata_{abi}_{multiarc=
h}&#39;.format(<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abi=3Dsys.abiflags,<br=
>- =C2=A0 =C2=A0 =C2=A0 =C2=A0platform=3Dsys.platform,<br>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0multiarch=3Dgetattr(sys.implementation, &#39;_multiarch&#=
39;, &#39;&#39;),<br>=C2=A0 =C2=A0 =C2=A0))<br></div><div><br></div><div></=
div><div>&gt; Note that we already had the same patch proposed earlier and =
it was rejected, as the problem</div><div>&gt; pops up in various different=
 places and needs to be understood and solved properly.</div><div><br></div=
><div>Haven&#39;t seen patches for devtool, thanks for the info.<br></div><=
div><br></div>&gt; Alex<br>&gt;<br>&gt; On Thu, 27 Aug 2020 at 15:11, gr em=
beter &lt;<a href=3D"mailto:grembeter@gmail.com">grembeter@gmail.com</a>&gt=
; wrote:<br>&gt;&gt;<br>&gt;&gt; On Ubuntu 20.04.1 LTS with Python 3.8.2 &q=
uot;devtool modify&quot; fails with<br>&gt;&gt; Exception: ModuleNotFoundEr=
ror: No module named &#39;_sysconfigdata&#39;<br>&gt;&gt;<br>&gt;&gt; e.g.:=
 devtool modify --no-same-dir --branch fit u-boot ~/ws/w/dtool/u-boot-fit<b=
r>&gt;&gt;<br>&gt;&gt; ERROR: Error executing a python function in exec_pyt=
hon_func() autogenerated:<br>&gt;&gt;<br>&gt;&gt; The stack trace of python=
 calls that resulted in this exception/failure was:<br>&gt;&gt; File: &#39;=
exec_python_func() autogenerated&#39;, lineno: 2, function: &lt;module&gt;<=
br>&gt;&gt; =C2=A0 =C2=A0 =C2=A00001:<br>&gt;&gt; =C2=A0*** 0002:devtool_po=
st_unpack(d)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A00003:<br>&gt;&gt; =C2=A0[...]<=
br>&gt;&gt; File: &#39;/usr/lib/python3.8/sysconfig.py&#39;, lineno: 421, f=
unction: _init_posix<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A00417:def _init_posix(v=
ars):<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A00418: =C2=A0 =C2=A0&quot;&quot;&quot;=
Initialize the module as appropriate for POSIX systems.&quot;&quot;&quot;<b=
r>&gt;&gt; =C2=A0 =C2=A0 =C2=A00419: =C2=A0 =C2=A0# _sysconfigdata is gener=
ated at build time, see _generate_posix_vars()<br>&gt;&gt; =C2=A0 =C2=A0 =
=C2=A00420: =C2=A0 =C2=A0name =3D _get_sysconfigdata_name()<br>&gt;&gt; =
=C2=A0*** 0421: =C2=A0 =C2=A0_temp =3D __import__(name, globals(), locals(=
), [&#39;build_time_vars&#39;], 0)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A00422: =
=C2=A0 =C2=A0build_time_vars =3D _temp.build_time_vars<br>&gt;&gt; =C2=A0 =
=
=C2=A0 =C2=A00423: =C2=A0 =C2=A0vars.update(build_time_vars)<br>&gt;&gt; =
=C2=A0 =C2=A0 =C2=A00424:<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A00425:def _init_n=
on_posix(vars):<br>&gt;&gt; Exception: ModuleNotFoundError: No module named=
 &#39;_sysconfigdata&#39;<br>&gt;&gt;<br>&gt;&gt; It happens because u-boot=
 (and likely other recipes) eventually inherits<br>&gt;&gt; python3native.b=
bclass that sets _PYTHON_SYSCONFIGDATA_NAME=3D&quot;_sysconfigdata&quot;<br=
>&gt;&gt; and this affects host Python.<br>&gt;&gt;<br>&gt;&gt; Hence, unse=
t _PYTHON_SYSCONFIGDATA_NAME for devtool completely.<br>&gt;&gt;<br>&gt;&gt=
; Signed-off-by: Grygorii Tertychnyi &lt;<a href=3D"mailto:grygorii.tertych=
nyi@leica-geosystems.com">grygorii.tertychnyi@leica-geosystems.com</a>&gt;<=
br>&gt;&gt; ---<br>&gt;&gt; =C2=A0meta/classes/devtool-source.bbclass | 2 +=
+<br>&gt;&gt; =C2=A01 file changed, 2 insertions(+)<br>&gt;&gt;<br>&gt;&gt;=
 diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-so=
urce.bbclass<br>&gt;&gt; index 280d6009f3c2..95d6fe7a29e8 100644<br>&gt;&gt=
; --- a/meta/classes/devtool-source.bbclass<br>&gt;&gt; +++ b/meta/classes/=
devtool-source.bbclass<br>&gt;&gt; @@ -22,6 +22,8 @@<br>&gt;&gt; =C2=A0DEVT=
OOL_TEMPDIR ?=3D &quot;&quot;<br>&gt;&gt; =C2=A0DEVTOOL_PATCH_SRCDIR =3D &q=
uot;${DEVTOOL_TEMPDIR}/patchworkdir&quot;<br>&gt;&gt;<br>&gt;&gt; +# host P=
ython fails to import correct _sysconfigdata if this variable is set<br>&gt=
;&gt; +_PYTHON_SYSCONFIGDATA_NAME[unexport] =3D &quot;1&quot;<br>&gt;&gt;<b=
r>&gt;&gt; =C2=A0python() {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0tempdir =3D d.g=
etVar(&#39;DEVTOOL_TEMPDIR&#39;)<br>&gt;&gt; --<br>&gt;&gt; 2.25.1<br>&gt;&=
gt;<br>&gt;&gt; </div>

--0000000000008024ab05adde3433--
