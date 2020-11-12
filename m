Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.9882.1605209984315019892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 11:39:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lht/Grin;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id dk16so9715843ejb.12
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 11:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YjNXZ01zygLjb3sqAFeGN7FiAgBZkVwd0fnzbYfd/9o=;
        b=lht/GrinNLWISMMEh0NS2VfWNhy6jvCa/+UJoT0XkF7GqHn383DFN0qfDDVL9BPC42
         K+B2xCUIXHzojb/lGM9M28BkFnBQ0a+9OoTuXYNQ3EcfFekQbR6sDvTC2jTaUBozBfuA
         836xOOiOfeJxdwiZhkqD0p3rHgi/FbZ01i2YGuaHhKsfZVx4vV5EINdCLYCrxQomHreF
         +eH9CQwDmDIMJMqBJw9dCp0hltI3zxzsk/ZHJYmrII/VzMz8dXianvZvmEhSlCMnfTB9
         Alwqlhg1OJypueEp1hmqzmVQF0TQNAdqEVTLHQPGAO4v8KqWL6XckfXx1zXfhXV84j7C
         ujkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YjNXZ01zygLjb3sqAFeGN7FiAgBZkVwd0fnzbYfd/9o=;
        b=iG+S3os8p5TYMkIPi7DhsCwGcsGFL1Ri3+D+q7MNiFj0DVcXlVtcqZERkefu/eQL8w
         w6ubQOOt/OuS/Ovif+azmxJ1dD+jinfP+QKc4qIYug3W7OGqTY6/jUM+NKDTFdLKjAbM
         HMUoOHpPgk4fa4nwvT3L6kMOVSCIc3GsUdJECmJmV1+GjWHyXwZfKOLvND3Mg1n38T91
         Kc1ifb4h7wpQ/Z9A6QOTQgmKGYNqo9EBnX0JIj7Rm173w/YfVtyFbUwulYbzcHQDAq4m
         HulM1fPcgr7iBd/QHK8L9Jf8svJM6J125cxYPKlPEpazml9Dib1JvetG9imQhHCdSi4w
         kr1Q==
X-Gm-Message-State: AOAM532k8xu8CeIMCbLbXv3DDRY+auhSlOicT9zVngij913yi5FTIByy
	BFr9L5/L+rJDb5HAPIJG3vR3Uyq9kDSH53c/hqw=
X-Google-Smtp-Source: ABdhPJxc1RbzkhGvR6Yqfkxpo4IR/9AgP33n4yEzbKmuWQam8tLcGJuvW2yzrfY6RiTj8B0k2PqfQj/PZqkoQa32wx8=
X-Received: by 2002:a17:906:94d4:: with SMTP id d20mr884019ejy.392.1605209982785;
 Thu, 12 Nov 2020 11:39:42 -0800 (PST)
MIME-Version: 1.0
References: <CAGvkhOK+dMYYW2NegYOYWOzNbHRczjJ7Wdb8bwFFxRXVrda+Vw@mail.gmail.com>
 <CANNYZj9JdPhyyTyj9rwRKHNpKdAaK6QiwnbE5_a1AuXyE1zk0w@mail.gmail.com>
 <CANNYZj-v01JoQuXWg5-erikr3zBzVHwy00nRk2YLWGtX8w6ONw@mail.gmail.com>
 <CAGvkhOJQVz+p=tczxnXWfCGkiG8pLQBr149Pfu0-mBMa07y5yg@mail.gmail.com> <CANNYZj_YxwZXjTctmjORX8enxMTJWrs-1FpiJP+MOLE63k9b+w@mail.gmail.com>
In-Reply-To: <CANNYZj_YxwZXjTctmjORX8enxMTJWrs-1FpiJP+MOLE63k9b+w@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2020 20:39:31 +0100
Message-ID: <CA+chaQdce+rk3RMqqbPntG-eCWjkDpMMBQyMHYgEQh5pQz40kw@mail.gmail.com>
Subject: Re: [OE-core] python3-native sysconfig failing to load in dunfell
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Glenn Stroz <gstroz@uber.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d05e0905b3ee1212"

--000000000000d05e0905b3ee1212
Content-Type: text/plain; charset="UTF-8"

Do you remember kergoth's take on this? From "[RFC PATCH] devtool: remove
_PYTHON_SYSCONFIGDATA_NAME to fix do_unpack" thread and
https://lists.yoctoproject.org/g/yocto/topic/74637733#49571

https://github.com/openembedded/openembedded-core/compare/master...kergoth:python-sysconfig

I think wrapper is a bit better, because it will also catch cases where
host python3 is being called from e.g. do_compile (e.g. by full path -
after debugging ROS catkin in last few days, some components are really
creative how to find their preferred python) even when python3native is
inherited. And also doesn't need another bbclass to be inherited in cases
where target _sysconfigdata is really needed.

On Thu, Nov 12, 2020 at 8:26 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Thanks - I have a preliminary fix here (needs thorough testing):
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=d6b6a6f67cc967c0ead6dbab3c95435b7ca85246
>
> Alex
>
> On Thu, 12 Nov 2020 at 19:46, Glenn Stroz <gstroz@uber.com> wrote:
>
>> Hi Alex,
>>
>> We have a custom fetcher implemented as a bbclass that calls out to a
>> python script.  That is why we see these issues with native. Here's a
>> sample bbclass and recipe that reproduces the issue:
>>
>> impfail.bbclass
>> ```
>> inherit python3native
>>
>> do_unpack[noexec] = "1"
>> do_patch[noexec] = "1"
>> do_install[noexec] = "1"
>>
>> do_fetch() {
>>     python3 -c "import pydoc"
>> }
>> ```
>>
>> classrunner_0.0.1.bb
>> ```
>> SUMMARY = "Python runner"
>> LICENSE = "CLOSED"
>> inherit impfail
>> ```
>>
>> -Glenn
>>
>>
>> On Thu, Nov 12, 2020 at 4:52 AM Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> A quick fix may be to add a target python3 dependency to your recipe,
>>> yes ugly, but I can't figure out how to provide target python configuration
>>> to native python used in the context of building target recipes otherwise.
>>>
>>> Alex
>>>
>>>
>>> On Thu, 12 Nov 2020 at 10:49, Alexander Kanavin <alex.kanavin@gmail.com>
>>> wrote:
>>>
>>>> On Thu, 12 Nov 2020 at 02:23, Glenn Stroz via lists.openembedded.org
>>>> <gstroz=uber.com@lists.openembedded.org> wrote:
>>>>
>>>>> We've been upgrading our work to Dunfell and have encountered an issue
>>>>> with python3-native.
>>>>>
>>>>> One of our python3-native scripts uses pydoc and that in turn
>>>>> eventually pulls in python's sysconfig. However, this is failing to import
>>>>> with the following stack trace:
>>>>>
>>>>> ```
>>>>>     import pydoc
>>>>>   File
>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
>>>>> line 366, in <module>
>>>>>     class Doc:
>>>>>   File
>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
>>>>> line 396, in Doc
>>>>>     def getdocloc(self, object, basedir=sysconfig.get_path('stdlib')):
>>>>>   File
>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>> line 519, in get_path
>>>>>     return get_paths(scheme, vars, expand)[name]
>>>>>   File
>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>> line 509, in get_paths
>>>>>     return _expand_vars(scheme, vars)
>>>>>   File
>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>> line 172, in _expand_vars
>>>>>     _extend_dict(vars, get_config_vars())
>>>>>   File
>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>> line 558, in get_config_vars
>>>>>     _init_posix(_CONFIG_VARS)
>>>>>   File
>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>> line 428, in _init_posix
>>>>>     _temp = __import__(name, globals(), locals(), ['build_time_vars'],
>>>>> 0)
>>>>> ModuleNotFoundError: No module named '_sysconfigdata'
>>>>> ```
>>>>>
>>>>> I did a little digging and the following commit seems to reference
>>>>> related work:
>>>>>
>>>>>
>>>>> https://github.com/openembedded/openembedded-core/commit/02714c105426b0d687620913c1a7401b386428b6
>>>>>
>>>>> I see that there is a patch added which adds the following to
>>>>> `sysconfig.py`:
>>>>>
>>>>> ```
>>>>>   if 'STAGING_LIBDIR' in os.environ:
>>>>>
>>>>> sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
>>>>> ```
>>>>>
>>>>> However, STAGING_LIBDIR does not contain this path:
>>>>>
>>>>> ```
>>>>> ls
>>>>> /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata
>>>>>
>>>>> ls: cannot access
>>>>> '/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata':
>>>>> No such file or directory
>>>>> ```
>>>>>
>>>>> It appears as if this should really be pointing
>>>>> to STAGING_LIBDIR_NATIVE which does exist:
>>>>>
>>>>> ```
>>>>> ls
>>>>> /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python-sysconfigdata
>>>>> _sysconfigdata.py
>>>>> ```
>>>>>
>>>>> The referenced commit made efforts to combine the native and cross
>>>>> python3 bbclass files into one. However, I think this may be something that
>>>>> needs to be treated differently.
>>>>>
>>>>> Anyone have any thoughts on how to proceed?
>>>>>
>>>>
>>>> Can you share the exact context where this is happening? Is your script
>>>> coming from a recipe and can you show that recipe?
>>>>
>>>> Alex
>>>>
>>>>
>>>
> 
>
>

--000000000000d05e0905b3ee1212
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Do you remember kergoth&#39;s take on this? From &quot;[RF=
C PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack&quot; =
thread and <a href=3D"https://lists.yoctoproject.org/g/yocto/topic/74637733=
#49571">https://lists.yoctoproject.org/g/yocto/topic/74637733#49571</a><div=
><br></div><div><a href=3D"https://github.com/openembedded/openembedded-cor=
e/compare/master...kergoth:python-sysconfig">https://github.com/openembedde=
d/openembedded-core/compare/master...kergoth:python-sysconfig</a><br></div>=
<div><br></div><div>I think wrapper is a bit better, because it will also c=
atch cases where host python3 is being called from e.g. do_compile (e.g. by=
 full path - after debugging ROS catkin in last few days, some components a=
re really creative how to find their preferred python) even when python3nat=
ive is inherited. And also doesn&#39;t need another bbclass to be inherited=
 in cases where target _sysconfigdata is really needed.</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 12=
, 2020 at 8:26 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Thanks - I have a prelim=
inary fix here (needs thorough testing):</div><div><a href=3D"http://git.yo=
ctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-vers=
ion-updates&amp;id=3Dd6b6a6f67cc967c0ead6dbab3c95435b7ca85246" target=3D"_b=
lank">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dak=
anavin/package-version-updates&amp;id=3Dd6b6a6f67cc967c0ead6dbab3c95435b7ca=
85246</a></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 12 Nov 2020 at 19:=
46, Glenn Stroz &lt;<a href=3D"mailto:gstroz@uber.com" target=3D"_blank">gs=
troz@uber.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr">Hi Alex,<div><br></div><div>We have a custom =
fetcher implemented as a bbclass that calls out to a python script.=C2=A0 T=
hat is why we see these issues with native. Here&#39;s a sample bbclass and=
 recipe that reproduces the issue:</div><div><br></div><div>impfail.bbclass=
<br>```<br>inherit python3native<br><br>do_unpack[noexec] =3D &quot;1&quot;=
<br>do_patch[noexec] =3D &quot;1&quot;<br>do_install[noexec] =3D &quot;1&qu=
ot;<br><br>do_fetch() {<br>=C2=A0 =C2=A0 python3 -c &quot;import pydoc&quot=
;<br>}<br><div>```</div><div><br></div><div><a href=3D"http://classrunner_0=
.0.1.bb" target=3D"_blank">classrunner_0.0.1.bb</a> <br>```</div><div>SUMMA=
RY =3D &quot;Python runner&quot;<br>LICENSE =3D &quot;CLOSED&quot;<br>inher=
it impfail</div><div>```</div><div><br><div><div dir=3D"ltr"><div dir=3D"lt=
r">-Glenn</div></div></div><br></div></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 12, 2020 at 4:52 AM =
Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_=
blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div>A quick fix may be to ad=
d a target python3 dependency to your recipe, yes ugly, but I can&#39;t fig=
ure out how to provide target python configuration to native python used in=
 the context of building target recipes otherwise.</div><div><br></div><div=
>Alex<br></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, 12 Nov 2020 at 10:49, Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr">On Thu, 12 Nov 2020 at 02:23, Glenn St=
roz via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.o=
penembedded.org</a> &lt;gstroz=3D<a href=3D"mailto:uber.com@lists.openembed=
ded.org" target=3D"_blank">uber.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr">We&#39;ve been upgrading our work to Dunfell a=
nd have encountered an issue with python3-native.=C2=A0<div><br></div><div>=
One of our python3-native scripts uses pydoc and that in turn eventually pu=
lls in python&#39;s sysconfig. However, this is failing to import with the =
following stack trace:</div><div><br></div><div>```</div><div>=C2=A0 =C2=A0=
 import pydoc<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/av=
os/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.1=
7-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py&quot;, line 366, in &=
lt;module&gt;<br>=C2=A0 =C2=A0 class Doc:<br>=C2=A0 File &quot;/home/gstroz=
/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-=
linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/py=
doc.py&quot;, line 396, in Doc<br>=C2=A0 =C2=A0 def getdocloc(self, object,=
 basedir=3Dsysconfig.get_path(&#39;stdlib&#39;)):<br>=C2=A0 File &quot;/hom=
e/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-=
64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/pyth=
on3.8/sysconfig.py&quot;, line 519, in get_path<br>=C2=A0 =C2=A0 return get=
_paths(scheme, vars, expand)[name]<br>=C2=A0 File &quot;/home/gstroz/.cache=
/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/e=
bpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig=
.py&quot;, line 509, in get_paths<br>=C2=A0 =C2=A0 return _expand_vars(sche=
me, vars)<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/y=
octo-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0=
/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py&quot;, line 172, in _=
expand_vars<br>=C2=A0 =C2=A0 _extend_dict(vars, get_config_vars())<br>=C2=
=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/bu=
ild/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot=
-native/usr/lib/python3.8/sysconfig.py&quot;, line 558, in get_config_vars<=
br>=C2=A0 =C2=A0 _init_posix(_CONFIG_VARS)<br>=C2=A0 File &quot;/home/gstro=
z/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky=
-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/s=
ysconfig.py&quot;, line 428, in _init_posix<br>=C2=A0 =C2=A0 _temp =3D __im=
port__(name, globals(), locals(), [&#39;build_time_vars&#39;], 0)<br>Module=
NotFoundError: No module named &#39;_sysconfigdata&#39;<br></div><div>```</=
div><div><br></div><div>I did a little digging and the following commit see=
ms to reference related work:</div><div><br></div><div><a href=3D"https://g=
ithub.com/openembedded/openembedded-core/commit/02714c105426b0d687620913c1a=
7401b386428b6" target=3D"_blank">https://github.com/openembedded/openembedd=
ed-core/commit/02714c105426b0d687620913c1a7401b386428b6</a></div><div><br><=
/div><div>I see that there is a patch added which adds the following to `sy=
sconfig.py`:</div><div><br></div><div>```</div><div>=C2=A0 if &#39;STAGING_=
LIBDIR&#39; in os.environ:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.path.append(o=
s.environ[&#39;STAGING_LIBDIR&#39;]+&#39;/python-sysconfigdata&#39;)<br></d=
iv><div>```</div><div><br></div><div>However, STAGING_LIBDIR does not conta=
in this path:</div><div><br></div><div>```</div><div>ls /home/gstroz/.cache=
/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/e=
bpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata <br>l=
s: cannot access &#39;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunf=
ell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-s=
ysroot/usr/lib/python-sysconfigdata&#39;: No such file or directory<br></di=
v><div>```</div><div><br></div><div>It appears as if this should really be =
pointing to=C2=A0STAGING_LIBDIR_NATIVE which does exist:</div><div><br></di=
v><div>```<br></div><div>ls /home/gstroz/.cache/avos/_avos_gstroz/avos/yoct=
o-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/re=
cipe-sysroot-native/usr/lib/python-sysconfigdata</div>_sysconfigdata.py<br>=
<div>```</div><div><br></div><div>The referenced commit made efforts to com=
bine the native and cross python3 bbclass files into one. However, I think =
this may be something that needs to be treated differently.</div><div><br><=
/div><div>Anyone have any thoughts on how to proceed?=C2=A0</div></div></bl=
ockquote><div><br></div><div>Can you share the exact context where this is =
happening? Is your script coming from a recipe and can you show that recipe=
?</div><div><br></div><div>Alex<br></div><div>=C2=A0</div></div></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>

--000000000000d05e0905b3ee1212--
