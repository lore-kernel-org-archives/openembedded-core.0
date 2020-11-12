Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web11.10204.1605211350524036189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 12:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I0msrO1z;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id m6so1620880vkl.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 12:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SGToyNSkhJzzAYhw9i3ckz+WnxUb9plB9TLOVz+rkPM=;
        b=I0msrO1z1CK5PtMdZWwKhgDrkbSMcMT+TeE86tdKpYnhHgGvNh430+UB6kTCLSJ/bv
         oxl8zjvvxr+wRoKOg/ffZYIdK2BSaETXyn1QrUUPmA0Hlw9mRpOmS1CNM5U55TdQs/Sw
         J1INvsT3YG6mg1cZYspSD948isbATZC59PTawje6/YBxUZzbk4lfVId5k5EhuSUb1ruZ
         86ypcHYXuvXLjNt0a55GtTSaWyVPc0QTt6ejkFnz7V2gtkQgsGL/S4i0Vs8APXTeEO+p
         TR6VUKI93V3vnP4quuqisCRuTGwYS01f2IMW+5EA+r670yCuCurBuX4gGYW3kdthO9/F
         wjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SGToyNSkhJzzAYhw9i3ckz+WnxUb9plB9TLOVz+rkPM=;
        b=dkTUrcZS5jAF3TwOSsottDbharUrFl9f57MnwhLPLRq8rA9P6hLtmyepL8cGwxFHL9
         yLpf00vdwyROFM0clt+U8VeISeQtE9HuWVzUv7tTXKpBm0ta2UpimzFuUdOFvOgKvFMJ
         KKJQkpzAZOgxwur04wnOawvhRNrOOe+be3b3chaZ3v8nxSadriHG/l5SPQHLhkqD1XQZ
         rYqo7aiKn8oyyQB0CjP9U6lpFeW/3jXBOmB/z/nsOfaeF+1JOhUOQRUSufoaEKZ27BND
         mwCqZCc4XycYlrBcGfb565dNU86/gYylJ2hw4wArPoX9ShTsUqnybe+Ts96Z8JS9IMgO
         yweQ==
X-Gm-Message-State: AOAM533qH9UA33SOU5RmjKuLWIwJNqNvPUSsHl/U7d3cGV8Xw3D0e3PD
	7xFSyVQgD23XvZlEjluLJxkqdeWsZ0MJB5eLiVo=
X-Google-Smtp-Source: ABdhPJzMWpVYBveKJ+nhTjSiHO3pFtblY4zy8UUK8F+grqFukL0Yl2SLMf3sbDo1fdl3ofOa+ynsL+wsmZzWFJOhrv0=
X-Received: by 2002:a1f:a4cf:: with SMTP id n198mr1308604vke.0.1605211349601;
 Thu, 12 Nov 2020 12:02:29 -0800 (PST)
MIME-Version: 1.0
References: <CAGvkhOK+dMYYW2NegYOYWOzNbHRczjJ7Wdb8bwFFxRXVrda+Vw@mail.gmail.com>
 <CANNYZj9JdPhyyTyj9rwRKHNpKdAaK6QiwnbE5_a1AuXyE1zk0w@mail.gmail.com>
 <CANNYZj-v01JoQuXWg5-erikr3zBzVHwy00nRk2YLWGtX8w6ONw@mail.gmail.com>
 <CAGvkhOJQVz+p=tczxnXWfCGkiG8pLQBr149Pfu0-mBMa07y5yg@mail.gmail.com>
 <CANNYZj_YxwZXjTctmjORX8enxMTJWrs-1FpiJP+MOLE63k9b+w@mail.gmail.com> <CA+chaQdce+rk3RMqqbPntG-eCWjkDpMMBQyMHYgEQh5pQz40kw@mail.gmail.com>
In-Reply-To: <CA+chaQdce+rk3RMqqbPntG-eCWjkDpMMBQyMHYgEQh5pQz40kw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 12 Nov 2020 21:02:18 +0100
Message-ID: <CANNYZj82CFv74uUw6Xf5pSrOmYdmOBNVtAhGQ_eJK9D_SwMj2w@mail.gmail.com>
Subject: Re: [OE-core] python3-native sysconfig failing to load in dunfell
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Glenn Stroz <gstroz@uber.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004851f705b3ee64c4"

--0000000000004851f705b3ee64c4
Content-Type: text/plain; charset="UTF-8"

Right, I think this is better too. The only problematic bit is that
situations where target _sysconfigdata is needed can produce really
unhelpful errors (e.g. meson hides this behind a generic 'python is not
working' message), and it is not obvious that these errors can be resolved
by adding a target python dependency.

Alex

On Thu, 12 Nov 2020 at 20:39, Martin Jansa <martin.jansa@gmail.com> wrote:

> Do you remember kergoth's take on this? From "[RFC PATCH] devtool: remove
> _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack" thread and
> https://lists.yoctoproject.org/g/yocto/topic/74637733#49571
>
>
> https://github.com/openembedded/openembedded-core/compare/master...kergoth:python-sysconfig
>
> I think wrapper is a bit better, because it will also catch cases where
> host python3 is being called from e.g. do_compile (e.g. by full path -
> after debugging ROS catkin in last few days, some components are really
> creative how to find their preferred python) even when python3native is
> inherited. And also doesn't need another bbclass to be inherited in cases
> where target _sysconfigdata is really needed.
>
> On Thu, Nov 12, 2020 at 8:26 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> Thanks - I have a preliminary fix here (needs thorough testing):
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=d6b6a6f67cc967c0ead6dbab3c95435b7ca85246
>>
>> Alex
>>
>> On Thu, 12 Nov 2020 at 19:46, Glenn Stroz <gstroz@uber.com> wrote:
>>
>>> Hi Alex,
>>>
>>> We have a custom fetcher implemented as a bbclass that calls out to a
>>> python script.  That is why we see these issues with native. Here's a
>>> sample bbclass and recipe that reproduces the issue:
>>>
>>> impfail.bbclass
>>> ```
>>> inherit python3native
>>>
>>> do_unpack[noexec] = "1"
>>> do_patch[noexec] = "1"
>>> do_install[noexec] = "1"
>>>
>>> do_fetch() {
>>>     python3 -c "import pydoc"
>>> }
>>> ```
>>>
>>> classrunner_0.0.1.bb
>>> ```
>>> SUMMARY = "Python runner"
>>> LICENSE = "CLOSED"
>>> inherit impfail
>>> ```
>>>
>>> -Glenn
>>>
>>>
>>> On Thu, Nov 12, 2020 at 4:52 AM Alexander Kanavin <
>>> alex.kanavin@gmail.com> wrote:
>>>
>>>> A quick fix may be to add a target python3 dependency to your recipe,
>>>> yes ugly, but I can't figure out how to provide target python configuration
>>>> to native python used in the context of building target recipes otherwise.
>>>>
>>>> Alex
>>>>
>>>>
>>>> On Thu, 12 Nov 2020 at 10:49, Alexander Kanavin <alex.kanavin@gmail.com>
>>>> wrote:
>>>>
>>>>> On Thu, 12 Nov 2020 at 02:23, Glenn Stroz via lists.openembedded.org
>>>>> <gstroz=uber.com@lists.openembedded.org> wrote:
>>>>>
>>>>>> We've been upgrading our work to Dunfell and have encountered an
>>>>>> issue with python3-native.
>>>>>>
>>>>>> One of our python3-native scripts uses pydoc and that in turn
>>>>>> eventually pulls in python's sysconfig. However, this is failing to import
>>>>>> with the following stack trace:
>>>>>>
>>>>>> ```
>>>>>>     import pydoc
>>>>>>   File
>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
>>>>>> line 366, in <module>
>>>>>>     class Doc:
>>>>>>   File
>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
>>>>>> line 396, in Doc
>>>>>>     def getdocloc(self, object, basedir=sysconfig.get_path('stdlib')):
>>>>>>   File
>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>>> line 519, in get_path
>>>>>>     return get_paths(scheme, vars, expand)[name]
>>>>>>   File
>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>>> line 509, in get_paths
>>>>>>     return _expand_vars(scheme, vars)
>>>>>>   File
>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>>> line 172, in _expand_vars
>>>>>>     _extend_dict(vars, get_config_vars())
>>>>>>   File
>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>>> line 558, in get_config_vars
>>>>>>     _init_posix(_CONFIG_VARS)
>>>>>>   File
>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>>> line 428, in _init_posix
>>>>>>     _temp = __import__(name, globals(), locals(),
>>>>>> ['build_time_vars'], 0)
>>>>>> ModuleNotFoundError: No module named '_sysconfigdata'
>>>>>> ```
>>>>>>
>>>>>> I did a little digging and the following commit seems to reference
>>>>>> related work:
>>>>>>
>>>>>>
>>>>>> https://github.com/openembedded/openembedded-core/commit/02714c105426b0d687620913c1a7401b386428b6
>>>>>>
>>>>>> I see that there is a patch added which adds the following to
>>>>>> `sysconfig.py`:
>>>>>>
>>>>>> ```
>>>>>>   if 'STAGING_LIBDIR' in os.environ:
>>>>>>
>>>>>> sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
>>>>>> ```
>>>>>>
>>>>>> However, STAGING_LIBDIR does not contain this path:
>>>>>>
>>>>>> ```
>>>>>> ls
>>>>>> /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata
>>>>>>
>>>>>> ls: cannot access
>>>>>> '/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata':
>>>>>> No such file or directory
>>>>>> ```
>>>>>>
>>>>>> It appears as if this should really be pointing
>>>>>> to STAGING_LIBDIR_NATIVE which does exist:
>>>>>>
>>>>>> ```
>>>>>> ls
>>>>>> /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python-sysconfigdata
>>>>>> _sysconfigdata.py
>>>>>> ```
>>>>>>
>>>>>> The referenced commit made efforts to combine the native and cross
>>>>>> python3 bbclass files into one. However, I think this may be something that
>>>>>> needs to be treated differently.
>>>>>>
>>>>>> Anyone have any thoughts on how to proceed?
>>>>>>
>>>>>
>>>>> Can you share the exact context where this is happening? Is your
>>>>> script coming from a recipe and can you show that recipe?
>>>>>
>>>>> Alex
>>>>>
>>>>>
>>>>
>> 
>>
>>

--0000000000004851f705b3ee64c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, I think this is better too. The only problemat=
ic bit is that situations where target _sysconfigdata is needed can produce=
 really unhelpful errors (e.g. meson hides this behind a generic &#39;pytho=
n is not working&#39; message), and it is not obvious that these errors can=
 be resolved by adding a target python dependency. <br></div><div><br></div=
><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, 12 Nov 2020 at 20:39, Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
Do you remember kergoth&#39;s take on this? From &quot;[RFC PATCH] devtool:=
 remove _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack&quot; thread and <a hre=
f=3D"https://lists.yoctoproject.org/g/yocto/topic/74637733#49571" target=3D=
"_blank">https://lists.yoctoproject.org/g/yocto/topic/74637733#49571</a><di=
v><br></div><div><a href=3D"https://github.com/openembedded/openembedded-co=
re/compare/master...kergoth:python-sysconfig" target=3D"_blank">https://git=
hub.com/openembedded/openembedded-core/compare/master...kergoth:python-sysc=
onfig</a><br></div><div><br></div><div>I think wrapper is a bit better, bec=
ause it will also catch cases where host python3 is being called from e.g. =
do_compile (e.g. by full path - after debugging ROS catkin in last few days=
, some components are really creative how to find their preferred python) e=
ven when python3native is inherited. And also doesn&#39;t need another bbcl=
ass to be inherited in cases where target _sysconfigdata is really needed.<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Nov 12, 2020 at 8:26 PM Alexander Kanavin &lt;<a href=3D"mailt=
o:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>Thanks - I have a preliminary fix here (needs thorough testi=
ng):</div><div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-co=
ntrib/commit/?h=3Dakanavin/package-version-updates&amp;id=3Dd6b6a6f67cc967c=
0ead6dbab3c95435b7ca85246" target=3D"_blank">http://git.yoctoproject.org/cg=
it/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-version-updates&amp;i=
d=3Dd6b6a6f67cc967c0ead6dbab3c95435b7ca85246</a></div><div><br></div><div>A=
lex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, 12 Nov 2020 at 19:46, Glenn Stroz &lt;<a href=3D"mailt=
o:gstroz@uber.com" target=3D"_blank">gstroz@uber.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Ale=
x,<div><br></div><div>We have a custom fetcher implemented as a bbclass tha=
t calls out to a python script.=C2=A0 That is why we see these issues with =
native. Here&#39;s a sample bbclass and recipe that reproduces the issue:</=
div><div><br></div><div>impfail.bbclass<br>```<br>inherit python3native<br>=
<br>do_unpack[noexec] =3D &quot;1&quot;<br>do_patch[noexec] =3D &quot;1&quo=
t;<br>do_install[noexec] =3D &quot;1&quot;<br><br>do_fetch() {<br>=C2=A0 =
=C2=A0 python3 -c &quot;import pydoc&quot;<br>}<br><div>```</div><div><br>=
</div><div><a href=3D"http://classrunner_0.0.1.bb" target=3D"_blank">classr=
unner_0.0.1.bb</a> <br>```</div><div>SUMMARY =3D &quot;Python runner&quot;<=
br>LICENSE =3D &quot;CLOSED&quot;<br>inherit impfail</div><div>```</div><di=
v><br><div><div dir=3D"ltr"><div dir=3D"ltr">-Glenn</div></div></div><br></=
div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Nov 12, 2020 at 4:52 AM Alexander Kanavin &lt;<a href=3D"=
mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div>A quick fix may be to add a target python3 dependency to =
your recipe, yes ugly, but I can&#39;t figure out how to provide target pyt=
hon configuration to native python used in the context of building target r=
ecipes otherwise.</div><div><br></div><div>Alex<br></div><br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 12 Nov=
 2020 at 10:49, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"l=
tr">On Thu, 12 Nov 2020 at 02:23, Glenn Stroz via <a href=3D"http://lists.o=
penembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;gstroz=3D=
<a href=3D"mailto:uber.com@lists.openembedded.org" target=3D"_blank">uber.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">We&#39=
;ve been upgrading our work to Dunfell and have encountered an issue with p=
ython3-native.=C2=A0<div><br></div><div>One of our python3-native scripts u=
ses pydoc and that in turn eventually pulls in python&#39;s sysconfig. Howe=
ver, this is failing to import with the following stack trace:</div><div><b=
r></div><div>```</div><div>=C2=A0 =C2=A0 import pydoc<br>=C2=A0 File &quot;=
/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/cor=
ei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/=
python3.8/pydoc.py&quot;, line 366, in &lt;module&gt;<br>=C2=A0 =C2=A0 clas=
s Doc:<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yoct=
o-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/re=
cipe-sysroot-native/usr/lib/python3.8/pydoc.py&quot;, line 396, in Doc<br>=
=C2=A0 =C2=A0 def getdocloc(self, object, basedir=3Dsysconfig.get_path(&#3=
9;stdlib&#39;)):<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz=
/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.28=
2.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py&quot;, line 51=
9, in get_path<br>=C2=A0 =C2=A0 return get_paths(scheme, vars, expand)[name=
]<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dun=
fell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-=
sysroot-native/usr/lib/python3.8/sysconfig.py&quot;, line 509, in get_paths=
<br>=C2=A0 =C2=A0 return _expand_vars(scheme, vars)<br>=C2=A0 File &quot;/h=
ome/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei=
7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/py=
thon3.8/sysconfig.py&quot;, line 172, in _expand_vars<br>=C2=A0 =C2=A0 _ext=
end_dict(vars, get_config_vars())<br>=C2=A0 File &quot;/home/gstroz/.cache/=
avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/eb=
pf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.=
py&quot;, line 558, in get_config_vars<br>=C2=A0 =C2=A0 _init_posix(_CONFIG=
_VARS)<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yoct=
o-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/re=
cipe-sysroot-native/usr/lib/python3.8/sysconfig.py&quot;, line 428, in _ini=
t_posix<br>=C2=A0 =C2=A0 _temp =3D __import__(name, globals(), locals(), [&=
#39;build_time_vars&#39;], 0)<br>ModuleNotFoundError: No module named &#39;=
_sysconfigdata&#39;<br></div><div>```</div><div><br></div><div>I did a litt=
le digging and the following commit seems to reference related work:</div><=
div><br></div><div><a href=3D"https://github.com/openembedded/openembedded-=
core/commit/02714c105426b0d687620913c1a7401b386428b6" target=3D"_blank">htt=
ps://github.com/openembedded/openembedded-core/commit/02714c105426b0d687620=
913c1a7401b386428b6</a></div><div><br></div><div>I see that there is a patc=
h added which adds the following to `sysconfig.py`:</div><div><br></div><di=
v>```</div><div>=C2=A0 if &#39;STAGING_LIBDIR&#39; in os.environ:<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 sys.path.append(os.environ[&#39;STAGING_LIBDIR&#39;]+=
&#39;/python-sysconfigdata&#39;)<br></div><div>```</div><div><br></div><div=
>However, STAGING_LIBDIR does not contain this path:</div><div><br></div><d=
iv>```</div><div>ls /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfel=
l/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sys=
root/usr/lib/python-sysconfigdata <br>ls: cannot access &#39;/home/gstroz/.=
cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-li=
nux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata&=
#39;: No such file or directory<br></div><div>```</div><div><br></div><div>=
It appears as if this should really be pointing to=C2=A0STAGING_LIBDIR_NATI=
VE which does exist:</div><div><br></div><div>```<br></div><div>ls /home/gs=
troz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-p=
oky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python-s=
ysconfigdata</div>_sysconfigdata.py<br><div>```</div><div><br></div><div>Th=
e referenced commit made efforts to combine the native and cross python3 bb=
class files into one. However, I think this may be something that needs to =
be treated differently.</div><div><br></div><div>Anyone have any thoughts o=
n how to proceed?=C2=A0</div></div></blockquote><div><br></div><div>Can you=
 share the exact context where this is happening? Is your script coming fro=
m a recipe and can you show that recipe?</div><div><br></div><div>Alex<br><=
/div><div>=C2=A0</div></div></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>

--0000000000004851f705b3ee64c4--
