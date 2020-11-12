Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web08.2030.1605174570714063126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 01:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aW6C6ctp;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id k12so1664527uae.13
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 01:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V5v+LO/vNwbT+DBeiXzbGW4DDBqLcLMPsdKBGlnRr6c=;
        b=aW6C6ctp/sv/cm+sHrAP8tTVwJtO203RZMP98yMdAcZaSkx/bYPyDi/qp2sA61gfer
         gs4gYZqXgWCBfvv1CbK5nAJGoFlQGvIGeMYEK3WOOAK0K3gu7l8yzdKb2Ot54i/4+p+R
         nltuxmdevKqCw9d9mltmWgWwAI9dUhhCVfiTuFKkqGaJZUsv9+OPWFhidDU9s0GddLjs
         7rIomkZ3gmp6wsXRnxYHR2V2xR1zmAct+ncKDPs1jX2EmG/jsAGhsvUU1AfCbCQd/aCh
         nynlZ58qRyElusVSAWZbTpWK4D7YVlBJImL5qsLUE3BZTU4N8SP1iLZUfWSqU7O6fm9y
         a09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V5v+LO/vNwbT+DBeiXzbGW4DDBqLcLMPsdKBGlnRr6c=;
        b=GV30mndKiOD91OaSsf7xzZ3n5/xC2CmIoVqfnlgtb0kR56xbW0yL1nTIgOATl1HLA8
         bhKWsqQmhEoIY00zla5cmY/hYlBtkbEReWUbd6mTT2KEPSlgq0iO8/i6cb0RaQ+rQitu
         fKVcObB0rH2vR5n4Ynv8YOXqMFP0Z8TWKZwTL9XmwrkZY8syE/GBBQVRja7ChV7VLaQf
         TshgRBxY4ltu8EIAnOqEkNdW/1GqZCQLBO6mu+prWB1B5+fxHuOGdIzDQtcbJLm3MThW
         aX3lk9WkPkjmqodS63BFyn9BZZBdEjtCQogcd4FGwcqr+3CZ5RaTPOGhVpdjOqxnk30q
         RF8g==
X-Gm-Message-State: AOAM530qUG+mJm2ge17FSUlYJZeoBQ9lXNvuYdbMmEmeUdS5hlhPYZCN
	ebUXp/68vcd8JcWqlnWemuNChfLvtRrNp33lYOg=
X-Google-Smtp-Source: ABdhPJz1CmOocEg+A0F6zX2gJasV3T5po+DyzarG5pEZlukncwOYgAOUbBIP7iVFGBodCWqv5u/jOHh9/VDQESTAcM8=
X-Received: by 2002:ab0:3751:: with SMTP id i17mr15016775uat.71.1605174569809;
 Thu, 12 Nov 2020 01:49:29 -0800 (PST)
MIME-Version: 1.0
References: <CAGvkhOK+dMYYW2NegYOYWOzNbHRczjJ7Wdb8bwFFxRXVrda+Vw@mail.gmail.com>
In-Reply-To: <CAGvkhOK+dMYYW2NegYOYWOzNbHRczjJ7Wdb8bwFFxRXVrda+Vw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 12 Nov 2020 10:49:18 +0100
Message-ID: <CANNYZj9JdPhyyTyj9rwRKHNpKdAaK6QiwnbE5_a1AuXyE1zk0w@mail.gmail.com>
Subject: Re: [OE-core] python3-native sysconfig failing to load in dunfell
To: gstroz@uber.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000093b2605b3e5d47f"

--000000000000093b2605b3e5d47f
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2020 at 02:23, Glenn Stroz via lists.openembedded.org
<gstroz=uber.com@lists.openembedded.org> wrote:

> We've been upgrading our work to Dunfell and have encountered an issue
> with python3-native.
>
> One of our python3-native scripts uses pydoc and that in turn eventually
> pulls in python's sysconfig. However, this is failing to import with the
> following stack trace:
>
> ```
>     import pydoc
>   File
> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
> line 366, in <module>
>     class Doc:
>   File
> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
> line 396, in Doc
>     def getdocloc(self, object, basedir=sysconfig.get_path('stdlib')):
>   File
> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
> line 519, in get_path
>     return get_paths(scheme, vars, expand)[name]
>   File
> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
> line 509, in get_paths
>     return _expand_vars(scheme, vars)
>   File
> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
> line 172, in _expand_vars
>     _extend_dict(vars, get_config_vars())
>   File
> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
> line 558, in get_config_vars
>     _init_posix(_CONFIG_VARS)
>   File
> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
> line 428, in _init_posix
>     _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
> ModuleNotFoundError: No module named '_sysconfigdata'
> ```
>
> I did a little digging and the following commit seems to reference related
> work:
>
>
> https://github.com/openembedded/openembedded-core/commit/02714c105426b0d687620913c1a7401b386428b6
>
> I see that there is a patch added which adds the following to
> `sysconfig.py`:
>
> ```
>   if 'STAGING_LIBDIR' in os.environ:
>
> sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
> ```
>
> However, STAGING_LIBDIR does not contain this path:
>
> ```
> ls
> /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata
>
> ls: cannot access
> '/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata':
> No such file or directory
> ```
>
> It appears as if this should really be pointing to STAGING_LIBDIR_NATIVE
> which does exist:
>
> ```
> ls
> /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python-sysconfigdata
> _sysconfigdata.py
> ```
>
> The referenced commit made efforts to combine the native and cross python3
> bbclass files into one. However, I think this may be something that needs
> to be treated differently.
>
> Anyone have any thoughts on how to proceed?
>

Can you share the exact context where this is happening? Is your script
coming from a recipe and can you show that recipe?

Alex

--000000000000093b2605b3e5d47f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 12 Nov 2020 at 02:23, Glenn Stroz=
 via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &=
lt;gstroz=3D<a href=3D"mailto:uber.com@lists.openembedded.org">uber.com@lis=
ts.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">We&#39;ve be=
en upgrading our work to Dunfell and have encountered an issue with python3=
-native.=C2=A0<div><br></div><div>One of our python3-native scripts uses py=
doc and that in turn eventually pulls in python&#39;s sysconfig. However, t=
his is failing to import with the following stack trace:</div><div><br></di=
v><div>```</div><div>=C2=A0 =C2=A0 import pydoc<br>=C2=A0 File &quot;/home/=
gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64=
-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python=
3.8/pydoc.py&quot;, line 366, in &lt;module&gt;<br>=C2=A0 =C2=A0 class Doc:=
<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunf=
ell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-s=
ysroot-native/usr/lib/python3.8/pydoc.py&quot;, line 396, in Doc<br>=C2=A0 =
=C2=A0 def getdocloc(self, object, basedir=3Dsysconfig.get_path(&#39;stdlib=
&#39;)):<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yo=
cto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/=
recipe-sysroot-native/usr/lib/python3.8/sysconfig.py&quot;, line 519, in ge=
t_path<br>=C2=A0 =C2=A0 return get_paths(scheme, vars, expand)[name]<br>=C2=
=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/bui=
ld/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-=
native/usr/lib/python3.8/sysconfig.py&quot;, line 509, in get_paths<br>=C2=
=A0 =C2=A0 return _expand_vars(scheme, vars)<br>=C2=A0 File &quot;/home/gst=
roz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-po=
ky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8=
/sysconfig.py&quot;, line 172, in _expand_vars<br>=C2=A0 =C2=A0 _extend_dic=
t(vars, get_config_vars())<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_a=
vos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daem=
on/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py&quot=
;, line 558, in get_config_vars<br>=C2=A0 =C2=A0 _init_posix(_CONFIG_VARS)<=
br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfe=
ll/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sy=
sroot-native/usr/lib/python3.8/sysconfig.py&quot;, line 428, in _init_posix=
<br>=C2=A0 =C2=A0 _temp =3D __import__(name, globals(), locals(), [&#39;bui=
ld_time_vars&#39;], 0)<br>ModuleNotFoundError: No module named &#39;_syscon=
figdata&#39;<br></div><div>```</div><div><br></div><div>I did a little digg=
ing and the following commit seems to reference related work:</div><div><br=
></div><div><a href=3D"https://github.com/openembedded/openembedded-core/co=
mmit/02714c105426b0d687620913c1a7401b386428b6" target=3D"_blank">https://gi=
thub.com/openembedded/openembedded-core/commit/02714c105426b0d687620913c1a7=
401b386428b6</a></div><div><br></div><div>I see that there is a patch added=
 which adds the following to `sysconfig.py`:</div><div><br></div><div>```</=
div><div>=C2=A0 if &#39;STAGING_LIBDIR&#39; in os.environ:<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 sys.path.append(os.environ[&#39;STAGING_LIBDIR&#39;]+&#39;/p=
ython-sysconfigdata&#39;)<br></div><div>```</div><div><br></div><div>Howeve=
r, STAGING_LIBDIR does not contain this path:</div><div><br></div><div>```<=
/div><div>ls /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build=
/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/us=
r/lib/python-sysconfigdata <br>ls: cannot access &#39;/home/gstroz/.cache/a=
vos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebp=
f-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata&#39;: N=
o such file or directory<br></div><div>```</div><div><br></div><div>It appe=
ars as if this should really be pointing to=C2=A0STAGING_LIBDIR_NATIVE whic=
h does exist:</div><div><br></div><div>```<br></div><div>ls /home/gstroz/.c=
ache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-lin=
ux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python-sysconfi=
gdata</div>_sysconfigdata.py<br><div>```</div><div><br></div><div>The refer=
enced commit made efforts to combine the native and cross python3 bbclass f=
iles into one. However, I think this may be something that needs to be trea=
ted differently.</div><div><br></div><div>Anyone have any thoughts on how t=
o proceed?=C2=A0</div></div></blockquote><div><br></div><div>Can you share =
the exact context where this is happening? Is your script coming from a rec=
ipe and can you show that recipe?</div><div><br></div><div>Alex<br></div><d=
iv>=C2=A0</div></div></div>

--000000000000093b2605b3e5d47f--
