Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web08.9751.1605209182484260817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 11:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ky8itNuk;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id m16so3897369vsl.8
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 11:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JS+T7hy/GiJMajTeQgvCVsynit3h5PTdG5cGT4em3ac=;
        b=ky8itNukt/FXDagw5eqCpChR92tvsrX+coXLYPHKhupy2jTsQvQsENNTEo5nJPj+J5
         BDGc2LdnH6ZRSDYu7KJWGByy0D3ShiUMQ7SpN7c9eBjKAnPS3msbw2Ec/7qOx0DL5D7D
         s99K2yINV/rq2OQ2jYTNfmDnOFDYqVNGBtK3BS7qn1AnlVnpV7P5SczCQ23K+BktiMY9
         KfU/moQ0Txtb/0Wpmg2Aqpuc0oZmXXdq4sUmVrtoPr11cAisyTmn9hIE5sKt/03S2tig
         J7/LgmXfVpGVcc5ZX8DtG8x4tfCQCiY/c+939wTZ0/cFaq75Eb6KtNOhxCc46HPJdy/+
         NHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JS+T7hy/GiJMajTeQgvCVsynit3h5PTdG5cGT4em3ac=;
        b=TO1qFSANBkfxmkcktiPCJSuGdhGkkp9AbOd2VKF9ss9lFEdQUoDsCbNW6nNBkzNJDy
         I6HC806ycffKvEt1QL7QLyzULhEGwlT+SccbUga3IbA7XM4Xau9v6Rc4nkogFDH38ofK
         mm6Dq0MbL2WERYnjPHd31bR8JnoKbC58kJzBp7HRAyWZyC3obgtSyVN8izLFF3IW23PA
         EpRg4ffkOUTiYkzHDepUIaN2iF4uzMTyh8o8dkwx30bVMXoer6FlR5STAT5sB5UcvFMU
         2YMKE2k0zE1lZRUclOUW3Lni8xGguYzXup5i5XOeYubA981xBEpcfd4w6YyuM5/H2fki
         kJHQ==
X-Gm-Message-State: AOAM532AZqLxQcwKk0gXZ770qbLTrKi1aDexkJnTqv8LH/+ZhbJjCrqt
	1S8sP5R/U/BzumbjY/cvhw3pQSYnTfa5yoBQgjf52ffM+yzKUA==
X-Google-Smtp-Source: ABdhPJzS5H4HbMTPIpklAk3cUQM4MZLNLbjlZqkSOk4uN/yGGKrAoo79eldqT0KaMN0Zn2dWv/OCvzO/LTnbL/CKQHM=
X-Received: by 2002:a05:6102:3222:: with SMTP id x2mr1307674vsf.20.1605209181689;
 Thu, 12 Nov 2020 11:26:21 -0800 (PST)
MIME-Version: 1.0
References: <CAGvkhOK+dMYYW2NegYOYWOzNbHRczjJ7Wdb8bwFFxRXVrda+Vw@mail.gmail.com>
 <CANNYZj9JdPhyyTyj9rwRKHNpKdAaK6QiwnbE5_a1AuXyE1zk0w@mail.gmail.com>
 <CANNYZj-v01JoQuXWg5-erikr3zBzVHwy00nRk2YLWGtX8w6ONw@mail.gmail.com> <CAGvkhOJQVz+p=tczxnXWfCGkiG8pLQBr149Pfu0-mBMa07y5yg@mail.gmail.com>
In-Reply-To: <CAGvkhOJQVz+p=tczxnXWfCGkiG8pLQBr149Pfu0-mBMa07y5yg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 12 Nov 2020 20:26:09 +0100
Message-ID: <CANNYZj_YxwZXjTctmjORX8enxMTJWrs-1FpiJP+MOLE63k9b+w@mail.gmail.com>
Subject: Re: [OE-core] python3-native sysconfig failing to load in dunfell
To: Glenn Stroz <gstroz@uber.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000010a6a205b3ede311"

--00000000000010a6a205b3ede311
Content-Type: text/plain; charset="UTF-8"

Thanks - I have a preliminary fix here (needs thorough testing):
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=d6b6a6f67cc967c0ead6dbab3c95435b7ca85246

Alex

On Thu, 12 Nov 2020 at 19:46, Glenn Stroz <gstroz@uber.com> wrote:

> Hi Alex,
>
> We have a custom fetcher implemented as a bbclass that calls out to a
> python script.  That is why we see these issues with native. Here's a
> sample bbclass and recipe that reproduces the issue:
>
> impfail.bbclass
> ```
> inherit python3native
>
> do_unpack[noexec] = "1"
> do_patch[noexec] = "1"
> do_install[noexec] = "1"
>
> do_fetch() {
>     python3 -c "import pydoc"
> }
> ```
>
> classrunner_0.0.1.bb
> ```
> SUMMARY = "Python runner"
> LICENSE = "CLOSED"
> inherit impfail
> ```
>
> -Glenn
>
>
> On Thu, Nov 12, 2020 at 4:52 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> A quick fix may be to add a target python3 dependency to your recipe, yes
>> ugly, but I can't figure out how to provide target python configuration to
>> native python used in the context of building target recipes otherwise.
>>
>> Alex
>>
>>
>> On Thu, 12 Nov 2020 at 10:49, Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> On Thu, 12 Nov 2020 at 02:23, Glenn Stroz via lists.openembedded.org
>>> <gstroz=uber.com@lists.openembedded.org> wrote:
>>>
>>>> We've been upgrading our work to Dunfell and have encountered an issue
>>>> with python3-native.
>>>>
>>>> One of our python3-native scripts uses pydoc and that in turn
>>>> eventually pulls in python's sysconfig. However, this is failing to import
>>>> with the following stack trace:
>>>>
>>>> ```
>>>>     import pydoc
>>>>   File
>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
>>>> line 366, in <module>
>>>>     class Doc:
>>>>   File
>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
>>>> line 396, in Doc
>>>>     def getdocloc(self, object, basedir=sysconfig.get_path('stdlib')):
>>>>   File
>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>> line 519, in get_path
>>>>     return get_paths(scheme, vars, expand)[name]
>>>>   File
>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>> line 509, in get_paths
>>>>     return _expand_vars(scheme, vars)
>>>>   File
>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>> line 172, in _expand_vars
>>>>     _extend_dict(vars, get_config_vars())
>>>>   File
>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>> line 558, in get_config_vars
>>>>     _init_posix(_CONFIG_VARS)
>>>>   File
>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>> line 428, in _init_posix
>>>>     _temp = __import__(name, globals(), locals(), ['build_time_vars'],
>>>> 0)
>>>> ModuleNotFoundError: No module named '_sysconfigdata'
>>>> ```
>>>>
>>>> I did a little digging and the following commit seems to reference
>>>> related work:
>>>>
>>>>
>>>> https://github.com/openembedded/openembedded-core/commit/02714c105426b0d687620913c1a7401b386428b6
>>>>
>>>> I see that there is a patch added which adds the following to
>>>> `sysconfig.py`:
>>>>
>>>> ```
>>>>   if 'STAGING_LIBDIR' in os.environ:
>>>>
>>>> sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
>>>> ```
>>>>
>>>> However, STAGING_LIBDIR does not contain this path:
>>>>
>>>> ```
>>>> ls
>>>> /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata
>>>>
>>>> ls: cannot access
>>>> '/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata':
>>>> No such file or directory
>>>> ```
>>>>
>>>> It appears as if this should really be pointing
>>>> to STAGING_LIBDIR_NATIVE which does exist:
>>>>
>>>> ```
>>>> ls
>>>> /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python-sysconfigdata
>>>> _sysconfigdata.py
>>>> ```
>>>>
>>>> The referenced commit made efforts to combine the native and cross
>>>> python3 bbclass files into one. However, I think this may be something that
>>>> needs to be treated differently.
>>>>
>>>> Anyone have any thoughts on how to proceed?
>>>>
>>>
>>> Can you share the exact context where this is happening? Is your script
>>> coming from a recipe and can you show that recipe?
>>>
>>> Alex
>>>
>>>
>>

--00000000000010a6a205b3ede311
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks - I have a preliminary fix here (needs thoroug=
h testing):</div><div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/=
poky-contrib/commit/?h=3Dakanavin/package-version-updates&amp;id=3Dd6b6a6f6=
7cc967c0ead6dbab3c95435b7ca85246">http://git.yoctoproject.org/cgit/cgit.cgi=
/poky-contrib/commit/?h=3Dakanavin/package-version-updates&amp;id=3Dd6b6a6f=
67cc967c0ead6dbab3c95435b7ca85246</a></div><div><br></div><div>Alex<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, 12 Nov 2020 at 19:46, Glenn Stroz &lt;<a href=3D"mailto:gstroz@ub=
er.com">gstroz@uber.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr">Hi Alex,<div><br></div><div>We have=
 a custom fetcher implemented as a bbclass that calls out to a python scrip=
t.=C2=A0 That is why we see these issues with native. Here&#39;s a sample b=
bclass and recipe that reproduces the issue:</div><div><br></div><div>impfa=
il.bbclass<br>```<br>inherit python3native<br><br>do_unpack[noexec] =3D &qu=
ot;1&quot;<br>do_patch[noexec] =3D &quot;1&quot;<br>do_install[noexec] =3D =
&quot;1&quot;<br><br>do_fetch() {<br>=C2=A0 =C2=A0 python3 -c &quot;import =
pydoc&quot;<br>}<br><div>```</div><div><br></div><div><a href=3D"http://cla=
ssrunner_0.0.1.bb" target=3D"_blank">classrunner_0.0.1.bb</a> <br>```</div>=
<div>SUMMARY =3D &quot;Python runner&quot;<br>LICENSE =3D &quot;CLOSED&quot=
;<br>inherit impfail</div><div>```</div><div><br><div><div dir=3D"ltr"><div=
 dir=3D"ltr">-Glenn</div></div></div><br></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 12, 2020=
 at 4:52 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>A quick fix =
may be to add a target python3 dependency to your recipe, yes ugly, but I c=
an&#39;t figure out how to provide target python configuration to native py=
thon used in the context of building target recipes otherwise.</div><div><b=
r></div><div>Alex<br></div><br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, 12 Nov 2020 at 10:49, Alexander Kana=
vin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.ka=
navin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Thu, 12 Nov 2020 at 02:=
23, Glenn Stroz via <a href=3D"http://lists.openembedded.org" target=3D"_bl=
ank">lists.openembedded.org</a> &lt;gstroz=3D<a href=3D"mailto:uber.com@lis=
ts.openembedded.org" target=3D"_blank">uber.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr">We&#39;ve been upgrading our work to=
 Dunfell and have encountered an issue with python3-native.=C2=A0<div><br><=
/div><div>One of our python3-native scripts uses pydoc and that in turn eve=
ntually pulls in python&#39;s sysconfig. However, this is failing to import=
 with the following stack trace:</div><div><br></div><div>```</div><div>=C2=
=A0 =C2=A0 import pydoc<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos=
_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/=
2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py&quot;, line=
 366, in &lt;module&gt;<br>=C2=A0 =C2=A0 class Doc:<br>=C2=A0 File &quot;/h=
ome/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei=
7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/py=
thon3.8/pydoc.py&quot;, line 396, in Doc<br>=C2=A0 =C2=A0 def getdocloc(sel=
f, object, basedir=3Dsysconfig.get_path(&#39;stdlib&#39;)):<br>=C2=A0 File =
&quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/wo=
rk/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/us=
r/lib/python3.8/sysconfig.py&quot;, line 519, in get_path<br>=C2=A0 =C2=A0 =
return get_paths(scheme, vars, expand)[name]<br>=C2=A0 File &quot;/home/gst=
roz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-po=
ky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8=
/sysconfig.py&quot;, line 509, in get_paths<br>=C2=A0 =C2=A0 return _expand=
_vars(scheme, vars)<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gst=
roz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020=
.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py&quot;, line=
 172, in _expand_vars<br>=C2=A0 =C2=A0 _extend_dict(vars, get_config_vars()=
)<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dun=
fell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-=
sysroot-native/usr/lib/python3.8/sysconfig.py&quot;, line 558, in get_confi=
g_vars<br>=C2=A0 =C2=A0 _init_posix(_CONFIG_VARS)<br>=C2=A0 File &quot;/hom=
e/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-=
64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/pyth=
on3.8/sysconfig.py&quot;, line 428, in _init_posix<br>=C2=A0 =C2=A0 _temp =
=3D __import__(name, globals(), locals(), [&#39;build_time_vars&#39;], 0)<b=
r>ModuleNotFoundError: No module named &#39;_sysconfigdata&#39;<br></div><d=
iv>```</div><div><br></div><div>I did a little digging and the following co=
mmit seems to reference related work:</div><div><br></div><div><a href=3D"h=
ttps://github.com/openembedded/openembedded-core/commit/02714c105426b0d6876=
20913c1a7401b386428b6" target=3D"_blank">https://github.com/openembedded/op=
enembedded-core/commit/02714c105426b0d687620913c1a7401b386428b6</a></div><d=
iv><br></div><div>I see that there is a patch added which adds the followin=
g to `sysconfig.py`:</div><div><br></div><div>```</div><div>=C2=A0 if &#39;=
STAGING_LIBDIR&#39; in os.environ:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.path.=
append(os.environ[&#39;STAGING_LIBDIR&#39;]+&#39;/python-sysconfigdata&#39;=
)<br></div><div>```</div><div><br></div><div>However, STAGING_LIBDIR does n=
ot contain this path:</div><div><br></div><div>```</div><div>ls /home/gstro=
z/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky=
-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigda=
ta <br>ls: cannot access &#39;/home/gstroz/.cache/avos/_avos_gstroz/avos/yo=
cto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/=
recipe-sysroot/usr/lib/python-sysconfigdata&#39;: No such file or directory=
<br></div><div>```</div><div><br></div><div>It appears as if this should re=
ally be pointing to=C2=A0STAGING_LIBDIR_NATIVE which does exist:</div><div>=
<br></div><div>```<br></div><div>ls /home/gstroz/.cache/avos/_avos_gstroz/a=
vos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.=
17-r0/recipe-sysroot-native/usr/lib/python-sysconfigdata</div>_sysconfigdat=
a.py<br><div>```</div><div><br></div><div>The referenced commit made effort=
s to combine the native and cross python3 bbclass files into one. However, =
I think this may be something that needs to be treated differently.</div><d=
iv><br></div><div>Anyone have any thoughts on how to proceed?=C2=A0</div></=
div></blockquote><div><br></div><div>Can you share the exact context where =
this is happening? Is your script coming from a recipe and can you show tha=
t recipe?</div><div><br></div><div>Alex<br></div><div>=C2=A0</div></div></d=
iv>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--00000000000010a6a205b3ede311--
