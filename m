Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web09.2530.1605264358152579402
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 02:45:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NMJo/386;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id u24so4960029vsl.9
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 02:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kbLOxwJ9KYVQSZ3T/7ObS+BgH6jqq3khgkD3f3IgPio=;
        b=NMJo/386L/E17Xe7XfEFXwfycQbKGr2J1csn8XpDn6ehvShKr+QLTIIjIhFl93jcy+
         k9VN3p0DB/DeCHpY03KssnypIoryZSo/VagmMk4wVNCZntwMOQNf4mjD01roQVZuUyOI
         zyNozKDpC1JOL7pYN1eVT4QRDxYR5KuAh/jI7dsXlOfqpsbrXzosZP8ufY58Fw8ELWd8
         8f1XIuLFgqt87/TtFWtxviSNHFlgIMiJ0OFXkM0UmPTTg36uWzPso5XcowhowmNbf/cX
         UEgSyLXajpkHRQlYasiuA566Qf9c23XalrcNj3gL0ptpZpwmFEIaJ2LfmgQLzzQ9cx8s
         mdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kbLOxwJ9KYVQSZ3T/7ObS+BgH6jqq3khgkD3f3IgPio=;
        b=YdkxEnWGgp/HcVF5UZU0UyxZAkmB8THLtZDI0BeI53gW0xHTdZKHOocDd97CDD7VDE
         DjKaTl0jhprhnxdcebcbS/ZePBunb+wG6BdcFMAua4tTVOEg4wgqbZpV106XKE/TmjW1
         t3b/n+t3aP/9S7GHHYj6Efk05S0GuhMFCRVCPk0cvyZmCQXMXGaKCcFTniOH6qblLC7D
         hiS4OyqxR65+XECsSaQammS8VnjGFLbCVoU61rfwaqyadisT92k8wpNRoY3qT1t7d2cQ
         l2Wj+2UnfTDhsg0yNKReSGk38vRMMp2Oo3FkCAmaCCQZeq196MGfp1ht8UGLn5h5czqp
         qvuA==
X-Gm-Message-State: AOAM531vcJGkKnUUO3SMKYTt9VqsYF5rcH3rqzT3icmF1cucaNOjs+6r
	vjvTX9gn1jk+8bswP3yvXrD0vEq8kh6Al4xjawU=
X-Google-Smtp-Source: ABdhPJy4sI1lqaVpSoYuW2WVDDa6fi+JMN4N+OrWijnnZXNn1zDsaFM4WrzCgvdR4HLefDrhTpdai2SGIJM0dfjBR+E=
X-Received: by 2002:a67:403:: with SMTP id 3mr564184vse.54.1605264357261; Fri,
 13 Nov 2020 02:45:57 -0800 (PST)
MIME-Version: 1.0
References: <CAGvkhOK+dMYYW2NegYOYWOzNbHRczjJ7Wdb8bwFFxRXVrda+Vw@mail.gmail.com>
 <CANNYZj9JdPhyyTyj9rwRKHNpKdAaK6QiwnbE5_a1AuXyE1zk0w@mail.gmail.com>
 <CANNYZj-v01JoQuXWg5-erikr3zBzVHwy00nRk2YLWGtX8w6ONw@mail.gmail.com>
 <CAGvkhOJQVz+p=tczxnXWfCGkiG8pLQBr149Pfu0-mBMa07y5yg@mail.gmail.com>
 <CANNYZj_YxwZXjTctmjORX8enxMTJWrs-1FpiJP+MOLE63k9b+w@mail.gmail.com>
 <CA+chaQdce+rk3RMqqbPntG-eCWjkDpMMBQyMHYgEQh5pQz40kw@mail.gmail.com> <1646DB3807FF110F.29274@lists.openembedded.org>
In-Reply-To: <1646DB3807FF110F.29274@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 13 Nov 2020 11:45:46 +0100
Message-ID: <CANNYZj886=_PnV6AhyPbMmLek_-1KsNfB0py4FLLx8QoFRuZGw@mail.gmail.com>
Subject: Re: [OE-core] python3-native sysconfig failing to load in dunfell
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, Glenn Stroz <gstroz@uber.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c9054805b3fabbb8"

--000000000000c9054805b3fabbb8
Content-Type: text/plain; charset="UTF-8"

I think I have to go back to my original patch. Using a wrapper for native
python is problematic for two reasons:
- thwarts target python build as target python needs native python, but
*without* the environment variable set
- adds an unconditional dependency on target python to a few items, even if
those items only want to run some scripts

I think we're better off separating the two classes: python3native for
those who need native python, python3targetconfig for those
who also want to use target python config.

Alex

On Thu, 12 Nov 2020 at 21:02, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> Right, I think this is better too. The only problematic bit is that
> situations where target _sysconfigdata is needed can produce really
> unhelpful errors (e.g. meson hides this behind a generic 'python is not
> working' message), and it is not obvious that these errors can be resolved
> by adding a target python dependency.
>
> Alex
>
> On Thu, 12 Nov 2020 at 20:39, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> Do you remember kergoth's take on this? From "[RFC PATCH] devtool: remove
>> _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack" thread and
>> https://lists.yoctoproject.org/g/yocto/topic/74637733#49571
>>
>>
>> https://github.com/openembedded/openembedded-core/compare/master...kergoth:python-sysconfig
>>
>> I think wrapper is a bit better, because it will also catch cases where
>> host python3 is being called from e.g. do_compile (e.g. by full path -
>> after debugging ROS catkin in last few days, some components are really
>> creative how to find their preferred python) even when python3native is
>> inherited. And also doesn't need another bbclass to be inherited in cases
>> where target _sysconfigdata is really needed.
>>
>> On Thu, Nov 12, 2020 at 8:26 PM Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> Thanks - I have a preliminary fix here (needs thorough testing):
>>>
>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=d6b6a6f67cc967c0ead6dbab3c95435b7ca85246
>>>
>>> Alex
>>>
>>> On Thu, 12 Nov 2020 at 19:46, Glenn Stroz <gstroz@uber.com> wrote:
>>>
>>>> Hi Alex,
>>>>
>>>> We have a custom fetcher implemented as a bbclass that calls out to a
>>>> python script.  That is why we see these issues with native. Here's a
>>>> sample bbclass and recipe that reproduces the issue:
>>>>
>>>> impfail.bbclass
>>>> ```
>>>> inherit python3native
>>>>
>>>> do_unpack[noexec] = "1"
>>>> do_patch[noexec] = "1"
>>>> do_install[noexec] = "1"
>>>>
>>>> do_fetch() {
>>>>     python3 -c "import pydoc"
>>>> }
>>>> ```
>>>>
>>>> classrunner_0.0.1.bb
>>>> ```
>>>> SUMMARY = "Python runner"
>>>> LICENSE = "CLOSED"
>>>> inherit impfail
>>>> ```
>>>>
>>>> -Glenn
>>>>
>>>>
>>>> On Thu, Nov 12, 2020 at 4:52 AM Alexander Kanavin <
>>>> alex.kanavin@gmail.com> wrote:
>>>>
>>>>> A quick fix may be to add a target python3 dependency to your recipe,
>>>>> yes ugly, but I can't figure out how to provide target python configuration
>>>>> to native python used in the context of building target recipes otherwise.
>>>>>
>>>>> Alex
>>>>>
>>>>>
>>>>> On Thu, 12 Nov 2020 at 10:49, Alexander Kanavin <
>>>>> alex.kanavin@gmail.com> wrote:
>>>>>
>>>>>> On Thu, 12 Nov 2020 at 02:23, Glenn Stroz via lists.openembedded.org
>>>>>> <gstroz=uber.com@lists.openembedded.org> wrote:
>>>>>>
>>>>>>> We've been upgrading our work to Dunfell and have encountered an
>>>>>>> issue with python3-native.
>>>>>>>
>>>>>>> One of our python3-native scripts uses pydoc and that in turn
>>>>>>> eventually pulls in python's sysconfig. However, this is failing to import
>>>>>>> with the following stack trace:
>>>>>>>
>>>>>>> ```
>>>>>>>     import pydoc
>>>>>>>   File
>>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
>>>>>>> line 366, in <module>
>>>>>>>     class Doc:
>>>>>>>   File
>>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
>>>>>>> line 396, in Doc
>>>>>>>     def getdocloc(self, object,
>>>>>>> basedir=sysconfig.get_path('stdlib')):
>>>>>>>   File
>>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>>>> line 519, in get_path
>>>>>>>     return get_paths(scheme, vars, expand)[name]
>>>>>>>   File
>>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>>>> line 509, in get_paths
>>>>>>>     return _expand_vars(scheme, vars)
>>>>>>>   File
>>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>>>> line 172, in _expand_vars
>>>>>>>     _extend_dict(vars, get_config_vars())
>>>>>>>   File
>>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>>>> line 558, in get_config_vars
>>>>>>>     _init_posix(_CONFIG_VARS)
>>>>>>>   File
>>>>>>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>>>>>>> line 428, in _init_posix
>>>>>>>     _temp = __import__(name, globals(), locals(),
>>>>>>> ['build_time_vars'], 0)
>>>>>>> ModuleNotFoundError: No module named '_sysconfigdata'
>>>>>>> ```
>>>>>>>
>>>>>>> I did a little digging and the following commit seems to reference
>>>>>>> related work:
>>>>>>>
>>>>>>>
>>>>>>> https://github.com/openembedded/openembedded-core/commit/02714c105426b0d687620913c1a7401b386428b6
>>>>>>>
>>>>>>> I see that there is a patch added which adds the following to
>>>>>>> `sysconfig.py`:
>>>>>>>
>>>>>>> ```
>>>>>>>   if 'STAGING_LIBDIR' in os.environ:
>>>>>>>
>>>>>>> sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
>>>>>>> ```
>>>>>>>
>>>>>>> However, STAGING_LIBDIR does not contain this path:
>>>>>>>
>>>>>>> ```
>>>>>>> ls
>>>>>>> /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata
>>>>>>>
>>>>>>> ls: cannot access
>>>>>>> '/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata':
>>>>>>> No such file or directory
>>>>>>> ```
>>>>>>>
>>>>>>> It appears as if this should really be pointing
>>>>>>> to STAGING_LIBDIR_NATIVE which does exist:
>>>>>>>
>>>>>>> ```
>>>>>>> ls
>>>>>>> /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python-sysconfigdata
>>>>>>> _sysconfigdata.py
>>>>>>> ```
>>>>>>>
>>>>>>> The referenced commit made efforts to combine the native and cross
>>>>>>> python3 bbclass files into one. However, I think this may be something that
>>>>>>> needs to be treated differently.
>>>>>>>
>>>>>>> Anyone have any thoughts on how to proceed?
>>>>>>>
>>>>>>
>>>>>> Can you share the exact context where this is happening? Is your
>>>>>> script coming from a recipe and can you show that recipe?
>>>>>>
>>>>>> Alex
>>>>>>
>>>>>>
>>>>>
>>>
>>>
>>>
> 
>
>

--000000000000c9054805b3fabbb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think I have to go back to my original patch. Using=
 a wrapper for native python is problematic for two reasons:</div><div>- th=
warts target python build as target python needs native python, but *withou=
t* the environment variable set</div><div>- adds an unconditional dependenc=
y on target python to a few items, even if those items only want to run som=
e scripts</div><div><br></div><div>I think we&#39;re better off separating =
the two classes: python3native for those who need native python, python3tar=
getconfig for those</div><div>who also want to use target python config.</d=
iv><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, 12 Nov 2020 at 21:02, Alexande=
r Kanavin via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Right, I think th=
is is better too. The only problematic bit is that situations where target =
_sysconfigdata is needed can produce really unhelpful errors (e.g. meson hi=
des this behind a generic &#39;python is not working&#39; message), and it =
is not obvious that these errors can be resolved by adding a target python =
dependency. <br></div><div><br></div><div>Alex<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 12 Nov 2020=
 at 20:39, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" targe=
t=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Do you remember kergoth=
&#39;s take on this? From &quot;[RFC PATCH] devtool: remove _PYTHON_SYSCONF=
IGDATA_NAME to fix do_unpack&quot; thread and <a href=3D"https://lists.yoct=
oproject.org/g/yocto/topic/74637733#49571" target=3D"_blank">https://lists.=
yoctoproject.org/g/yocto/topic/74637733#49571</a><div><br></div><div><a hre=
f=3D"https://github.com/openembedded/openembedded-core/compare/master...ker=
goth:python-sysconfig" target=3D"_blank">https://github.com/openembedded/op=
enembedded-core/compare/master...kergoth:python-sysconfig</a><br></div><div=
><br></div><div>I think wrapper is a bit better, because it will also catch=
 cases where host python3 is being called from e.g. do_compile (e.g. by ful=
l path - after debugging ROS catkin in last few days, some components are r=
eally creative how to find their preferred python) even when python3native =
is inherited. And also doesn&#39;t need another bbclass to be inherited in =
cases where target _sysconfigdata is really needed.</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 12, 20=
20 at 8:26 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Thanks - I=
 have a preliminary fix here (needs thorough testing):</div><div><a href=3D=
"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanavi=
n/package-version-updates&amp;id=3Dd6b6a6f67cc967c0ead6dbab3c95435b7ca85246=
" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/=
commit/?h=3Dakanavin/package-version-updates&amp;id=3Dd6b6a6f67cc967c0ead6d=
bab3c95435b7ca85246</a></div><div><br></div><div>Alex<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 12 N=
ov 2020 at 19:46, Glenn Stroz &lt;<a href=3D"mailto:gstroz@uber.com" target=
=
=3D"_blank">gstroz@uber.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Alex,<div><br></div><div>We=
 have a custom fetcher implemented as a bbclass that calls out to a python =
script.=C2=A0 That is why we see these issues with native. Here&#39;s a sam=
ple bbclass and recipe that reproduces the issue:</div><div><br></div><div>=
impfail.bbclass<br>```<br>inherit python3native<br><br>do_unpack[noexec] =
=3D &quot;1&quot;<br>do_patch[noexec] =3D &quot;1&quot;<br>do_install[noex=
ec] =3D &quot;1&quot;<br><br>do_fetch() {<br>=C2=A0 =C2=A0 python3 -c &quot=
;import pydoc&quot;<br>}<br><div>```</div><div><br></div><div><a href=3D"ht=
tp://classrunner_0.0.1.bb" target=3D"_blank">classrunner_0.0.1.bb</a> <br>`=
``</div><div>SUMMARY =3D &quot;Python runner&quot;<br>LICENSE =3D &quot;CLO=
SED&quot;<br>inherit impfail</div><div>```</div><div><br><div><div dir=3D"l=
tr"><div dir=3D"ltr">-Glenn</div></div></div><br></div></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 12=
, 2020 at 4:52 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>A quic=
k fix may be to add a target python3 dependency to your recipe, yes ugly, b=
ut I can&#39;t figure out how to provide target python configuration to nat=
ive python used in the context of building target recipes otherwise.</div><=
div><br></div><div>Alex<br></div><br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, 12 Nov 2020 at 10:49, Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">a=
lex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Thu, 12 Nov 2020 =
at 02:23, Glenn Stroz via <a href=3D"http://lists.openembedded.org" target=
=3D"_blank">lists.openembedded.org</a> &lt;gstroz=3D<a href=3D"mailto:uber=
.com@lists.openembedded.org" target=3D"_blank">uber.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr">We&#39;ve been upgrading our=
 work to Dunfell and have encountered an issue with python3-native.=C2=A0<d=
iv><br></div><div>One of our python3-native scripts uses pydoc and that in =
turn eventually pulls in python&#39;s sysconfig. However, this is failing t=
o import with the following stack trace:</div><div><br></div><div>```</div>=
<div>=C2=A0 =C2=A0 import pydoc<br>=C2=A0 File &quot;/home/gstroz/.cache/av=
os/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf=
-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py&quo=
t;, line 366, in &lt;module&gt;<br>=C2=A0 =C2=A0 class Doc:<br>=C2=A0 File =
&quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/wo=
rk/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/us=
r/lib/python3.8/pydoc.py&quot;, line 396, in Doc<br>=C2=A0 =C2=A0 def getdo=
cloc(self, object, basedir=3Dsysconfig.get_path(&#39;stdlib&#39;)):<br>=C2=
=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/bu=
ild/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot=
-native/usr/lib/python3.8/sysconfig.py&quot;, line 519, in get_path<br>=C2=
=A0 =C2=A0 return get_paths(scheme, vars, expand)[name]<br>=C2=A0 File &qu=
ot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/=
corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/l=
ib/python3.8/sysconfig.py&quot;, line 509, in get_paths<br>=C2=A0 =C2=A0 re=
turn _expand_vars(scheme, vars)<br>=C2=A0 File &quot;/home/gstroz/.cache/av=
os/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf=
-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py=
&quot;, line 172, in _expand_vars<br>=C2=A0 =C2=A0 _extend_dict(vars, get_c=
onfig_vars())<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/av=
os/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.1=
7-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py&quot;, line 558, =
in get_config_vars<br>=C2=A0 =C2=A0 _init_posix(_CONFIG_VARS)<br>=C2=A0 Fil=
e &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/=
work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/=
usr/lib/python3.8/sysconfig.py&quot;, line 428, in _init_posix<br>=C2=A0 =
=C2=A0 _temp =3D __import__(name, globals(), locals(), [&#39;build_time_va=
rs&#39;], 0)<br>ModuleNotFoundError: No module named &#39;_sysconfigdata&#3=
9;<br></div><div>```</div><div><br></div><div>I did a little digging and th=
e following commit seems to reference related work:</div><div><br></div><di=
v><a href=3D"https://github.com/openembedded/openembedded-core/commit/02714=
c105426b0d687620913c1a7401b386428b6" target=3D"_blank">https://github.com/o=
penembedded/openembedded-core/commit/02714c105426b0d687620913c1a7401b386428=
b6</a></div><div><br></div><div>I see that there is a patch added which add=
s the following to `sysconfig.py`:</div><div><br></div><div>```</div><div>=
=C2=A0 if &#39;STAGING_LIBDIR&#39; in os.environ:<br>=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 sys.path.append(os.environ[&#39;STAGING_LIBDIR&#39;]+&#39;/python-s=
ysconfigdata&#39;)<br></div><div>```</div><div><br></div><div>However, STAG=
ING_LIBDIR does not contain this path:</div><div><br></div><div>```</div><d=
iv>ls /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/wo=
rk/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/p=
ython-sysconfigdata <br>ls: cannot access &#39;/home/gstroz/.cache/avos/_av=
os_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemo=
n/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata&#39;: No such =
file or directory<br></div><div>```</div><div><br></div><div>It appears as =
if this should really be pointing to=C2=A0STAGING_LIBDIR_NATIVE which does =
exist:</div><div><br></div><div>```<br></div><div>ls /home/gstroz/.cache/av=
os/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf=
-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python-sysconfigdata</=
div>_sysconfigdata.py<br><div>```</div><div><br></div><div>The referenced c=
ommit made efforts to combine the native and cross python3 bbclass files in=
to one. However, I think this may be something that needs to be treated dif=
ferently.</div><div><br></div><div>Anyone have any thoughts on how to proce=
ed?=C2=A0</div></div></blockquote><div><br></div><div>Can you share the exa=
ct context where this is happening? Is your script coming from a recipe and=
 can you show that recipe?</div><div><br></div><div>Alex<br></div><div>=C2=
=A0</div></div></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>

--000000000000c9054805b3fabbb8--
