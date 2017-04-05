Return-Path: <vlsireddy@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 50E0A71ADD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 18:09:49 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id t20so26753247wra.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UniHbu/k++V7LwMrAEvGf5CKQHpPBmJK6h6P+BEZIJ0=;
	b=m+RVyvZYLF56owx4XD4PfJ5AkH5QP+PwQBrwNiXRXVinrQS/7eibyd93TySYuh4Lnj
	x5rf63b97zdk0ZUy3xqdPJ8U/htWdwSs2vHkgSGC1P30GGwDJwYB+Q/7BAEs0YdEKsQO
	g98BhdCkSWMjuqizhYup4/n3KV4LOW9Mso0cUu8CJHujDLv0BvWtgM+Dl10qH2Ls+U1D
	HlHRKur/Gr7uv79z9wosmJEi/xjwZ2LEBjbVzm1YADWQAYSn5O77oaN9k17gZ+iYq/SY
	cIB2NWKIPm31w2NCcUdiEqoTxI1isMRMTR+yQJlstLXqETISmQ9/kr1uIJacT1x6vq+O
	y1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UniHbu/k++V7LwMrAEvGf5CKQHpPBmJK6h6P+BEZIJ0=;
	b=q8GlbIRdiT0ZgybOUEZo/YvcMVZWm/5jaO7UTc7xvdnN+MB4dsaYTJzG4GXFg4qTs8
	pMOqfuKvDe7HuQHuGfDoYclIAg5DpmIybfoieEQnvER7EO4OdgrUF01hzKpcOpYPNqI7
	Vz9daFeLkZPklBpMjS/sSxCV1IAQWPM6liyXDypc62fjzcIsxmDmsx8eo9Fyjd2TG8HN
	RPelvyTgu6PDF0u1EEwtKK2vM24vUaTaYCpUBqXr2lVC1pwzLn97AAV69mSK5ykVMJTt
	0PSfR3agMvA0LS+H8zBk5xKKlzKqfCaYwhIwcM1H1A8vwNsdeZ5J6pwBrgEyGy4GIgoH
	ZqXQ==
X-Gm-Message-State: AFeK/H0IjNShzBSpgXBVmbuG6bGbctYiEyeYgIq9sJlL/RZm0JuGWc8Dh1yCBjQeB2Rjn+cz3F2ESaYwNSfz0Q==
X-Received: by 10.28.88.129 with SMTP id m123mr21245319wmb.28.1491415790933;
	Wed, 05 Apr 2017 11:09:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.35.214 with HTTP; Wed, 5 Apr 2017 11:09:50 -0700 (PDT)
In-Reply-To: <CAGQ4JX1DGeQuO3WhhpHZbJFsUpOg1uHmOou1fcQvgBy+hJpjOQ@mail.gmail.com>
References: <CAGQ4JX3rYtONiVv_eOhj-MK=2FA7=h3xCA_iytd=fpTF00rT6A@mail.gmail.com>
	<CAGQ4JX06AcUkSzRyg2255mZxxT=etOaE786_fVQqGp32EO8S2Q@mail.gmail.com>
	<CAEsOVNencj+9iW4xnqAUTzJAZ1_W=o8-N2-S6x0fr2pB-YJd9g@mail.gmail.com>
	<1491407333.17200.22.camel@linuxfoundation.org>
	<CAGQ4JX1DGeQuO3WhhpHZbJFsUpOg1uHmOou1fcQvgBy+hJpjOQ@mail.gmail.com>
From: Ravi chandra reddy <vlsireddy@gmail.com>
Date: Wed, 5 Apr 2017 14:09:50 -0400
Message-ID: <CAGQ4JX12JDMaffLGYO16626BhXCSAQ3wzVEzN21wzcrZ7mwJ5A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe [patch] modification to generate a static library instead of shared library
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
X-List-Received-Date: Wed, 05 Apr 2017 18:09:51 -0000
Content-Type: multipart/alternative; boundary=001a114416bc6e5cc1054c6f4c80

--001a114416bc6e5cc1054c6f4c80
Content-Type: text/plain; charset=UTF-8

Hi,
    Let me thank you guys for quick reply.
let me put my  email in correct steps

1. below local/local.conf changes makes bitbake fail.

                            IMAGE_INSTALL_append = "lib32-glibc
lib32-libgcc lib32-libstdc++ libedit libxml2-*staticdev*"

error:=============
================================== i get the following
errors==================================
ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
ERROR: Logfile of failure stored in: /home/polar/zcu_yocto/poky/
build/tmp/work/zcu102_zynqmp-poky-linux/core-image-minimal/
1.0-r0/temp/log.do_rootfs.17721
ERROR: Task 9 (/home/polar/zcu_yocto/poky/meta/recipes-core/images/core-
image-minimal.bb, do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2144 tasks of which 2143 didn't need to be
rerun and 1 failed.
===================================

2.  without staticdev changes [in local/local.conf], it
[bitbake-core-image-minimal] goes through and it builds [but there is only
.so [dynamic library] generated]

IMAGE_INSTALL_append = "lib32-glibc lib32-libgcc lib32-libstdc++ libedit
libxml2"


3. i ran the search and found that all "no-static" lines are commented

bitbake -e | grep static-libs


and all the "no-static-libs.inc" are commented [#]

Thanks
RC

On Wed, Apr 5, 2017 at 2:04 PM, Ravi chandra reddy <vlsireddy@gmail.com>
wrote:

> Hi,
>        in local/local.conf it [bitbake core-image-minimal] fails, if i use
> libxml2-staticdev
>
>   # Specify the 32-bit libraries to be added to all images
> IMAGE_INSTALL_append = "lib32-glibc lib32-libgcc lib32-libstdc++ libedit
> libxml2-staticdev"
>
> ================================== i get the following
> errors==================================
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
> ERROR: Logfile of failure stored in: /home/polar/zcu_yocto/poky/
> build/tmp/work/zcu102_zynqmp-poky-linux/core-image-minimal/
> 1.0-r0/temp/log.do_rootfs.17721
> ERROR: Task 9 (/home/polar/zcu_yocto/poky/meta/recipes-core/images/core-
> image-minimal.bb, do_rootfs) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2144 tasks of which 2143 didn't need to be
> rerun and 1 failed.
> ===================================
>
> if i use as below, there is no issue. however there is no .so
>
> # Specify the 32-bit libraries to be added to all images
> IMAGE_INSTALL_append = "lib32-glibc lib32-libgcc lib32-libstdc++ libedit
> libxml2"
>
> i ran
>
> bitbake -e | grep static-libs
>
> and all the "no-static-libs.inc" are commented [#]
>
> Thanks
> RC
>
>
>
> On Wed, Apr 5, 2017 at 11:48 AM, Richard Purdie <richard.purdie@
> linuxfoundation.org> wrote:
>
>> On Wed, 2017-04-05 at 10:33 -0500, Matthew McClintock wrote:
>> > On Wed, Apr 5, 2017 at 10:18 AM, Ravi chandra reddy <vlsireddy@gmail.
>> > com> wrote:
>> > >
>> > > Hi All,
>> > >           I am using meta-oe to generate libxml2 library using
>> > > AARCH64
>> > > compiler. However it generates shared object [.so] library.
>> > >
>> > > is there any setting in recipe to modify this, to generate static
>> > > library
>> > > [instead of shared library]
>> > >
>> > > if so, please point me to the recipe/file to change.
>> > >
>> > > if not, i will try to add it as patch, plz point me to appropriate
>> > > files to
>> > > change
>> > Is the ${PN}-staticdev package getting generated for you?
>>
>> Its possible you have conf/distro/include/no-static-libs.inc included
>> in your build (bitbake -e would tell you).
>>
>> If so, you could remove that include or set:
>>
>> DISABLE_STATIC = ""
>>
>> as it would currently be set to this if that include file is included:
>>
>> DISABLE_STATIC = " --disable-static"
>>
>> We tend not to build static libraries as they're a waste of space/time
>> on the most part.
>>
>> Cheers,
>>
>> Richard
>>
>
>

--001a114416bc6e5cc1054c6f4c80
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>=C2=A0 =C2=A0 Let me thank you guys for quick repl=
y.</div><div>let me put my =C2=A0email in correct steps</div><div><br></div=
><div>1. below=C2=A0<span style=3D"font-size:12.8px">local/local.conf chang=
es makes bitbake fail.</span></div><div><br></div><div><span style=3D"font-=
size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_INSTALL_append =3D &quot;lib32-gl=
ibc lib32-libgcc lib32-libstdc++ libedit libxml2-<b>staticdev</b>&quot;</sp=
an><br></div><div><span style=3D"font-size:12.8px"><br></span></div><div><s=
pan style=3D"font-size:12.8px">error:=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</span></div><div><div style=3D"font-size:12.8px">=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=
=3D=3D=3D=3D i get the following errors=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>=
</div><div style=3D"font-size:12.8px"><div>ERROR: core-image-minimal-1.0-r0=
 do_rootfs: Function failed: do_rootfs</div><div>ERROR: Logfile of failure =
stored in: /home/polar/zcu_yocto/poky/<wbr>build/tmp/work/zcu102_zynqmp-<wb=
r>poky-linux/core-image-minimal/<wbr>1.0-r0/temp/log.do_rootfs.<wbr>17721</=
div><div>ERROR: Task 9 (/home/polar/zcu_yocto/poky/<wbr>meta/recipes-core/i=
mages/<a href=3D"http://core-image-minimal.bb/" target=3D"_blank">core-<wbr=
>image-minimal.bb</a>, do_rootfs) failed with exit code &#39;1&#39;</div><d=
iv>NOTE: Tasks Summary: Attempted 2144 tasks of which 2143 didn&#39;t need =
to be rerun and 1 failed.</div></div><div style=3D"font-size:12.8px">=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<wbr>=3D=3D=3D=3D=3D</div></div><div style=3D"font-size:12.8px"><b=
r></div><div style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">2.=
 =C2=A0without staticdev changes [in=C2=A0</span><span style=3D"font-size:1=
2.8px">local/local.conf</span><span style=3D"font-size:12.8px">], it [bitba=
ke-core-image-minimal] goes through and it builds [but there is only .so [d=
ynamic library] generated]</span></div><div style=3D"font-size:12.8px"><br>=
</div><div style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">IMAG=
E_INSTALL_append =3D &quot;lib32-glibc lib32-libgcc lib32-libstdc++ libedit=
 libxml2</span><span style=3D"font-size:12.8px">&quot;</span><br></div><div=
 style=3D"font-size:12.8px"><span style=3D"font-size:12.8px"><br></span></d=
iv><div style=3D"font-size:12.8px"><span style=3D"font-size:12.8px"><br></s=
pan></div><div style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">=
3. i ran the search and found that all &quot;no-static&quot; lines are comm=
ented</span></div><div style=3D"font-size:12.8px"><span style=3D"font-size:=
12.8px"><br></span></div><div style=3D"font-size:12.8px"><span style=3D"fon=
t-size:12.8px">bitbake -e | grep static-libs</span></div><div><span style=
=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-size:12.8px=
"><br></span></div><div><span style=3D"font-size:12.8px">and all the &quot;=
no-static-libs.inc&quot; are commented [#]=C2=A0</span><span style=3D"font-=
size:12.8px"><br></span></div><div><span style=3D"font-size:12.8px"><br></s=
pan></div><div><span style=3D"font-size:12.8px">Thanks</span></div><div><sp=
an style=3D"font-size:12.8px">RC</span></div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Wed, Apr 5, 2017 at 2:04 PM, Ravi chan=
dra reddy <span dir=3D"ltr">&lt;<a href=3D"mailto:vlsireddy@gmail.com" targ=
et=3D"_blank">vlsireddy@gmail.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr">Hi,<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0in local=
/local.conf it [bitbake core-image-minimal] fails, if i use libxml2-staticd=
ev<br><div>=C2=A0 =C2=A0</div><div>=C2=A0 # Specify the 32-bit libraries to=
 be added to all images</div><div>IMAGE_INSTALL_append =3D &quot;lib32-glib=
c lib32-libgcc lib32-libstdc++ libedit libxml2-staticdev&quot;</div><div><b=
r></div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D i get the following errors=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wb=
r>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br></div><div><div>ERROR: core-image-minim=
al-1.0-r0 do_rootfs: Function failed: do_rootfs</div><div>ERROR: Logfile of=
 failure stored in: /home/polar/zcu_yocto/poky/<wbr>build/tmp/work/zcu102_z=
ynqmp-<wbr>poky-linux/core-image-minimal/<wbr>1.0-r0/temp/log.do_rootfs.<wb=
r>17721</div><div>ERROR: Task 9 (/home/polar/zcu_yocto/poky/<wbr>meta/recip=
es-core/images/<a href=3D"http://core-image-minimal.bb" target=3D"_blank">c=
ore-<wbr>image-minimal.bb</a>, do_rootfs) failed with exit code &#39;1&#39;=
</div><div>NOTE: Tasks Summary: Attempted 2144 tasks of which 2143 didn&#39=
;t need to be rerun and 1 failed.</div></div><div>=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=
=3D=3D=3D=3D</div><div><br></div><div>if i use as below, there is no issue.=
 however there is no .so</div><div><br></div><div><div># Specify the 32-bit=
 libraries to be added to all images</div><div>IMAGE_INSTALL_append =3D &qu=
ot;lib32-glibc lib32-libgcc lib32-libstdc++ libedit libxml2&quot;</div></di=
v><div><br></div><div>i ran</div><div><br></div><div>bitbake -e | grep stat=
ic-libs<br></div><div><br></div><div>and all the &quot;no-static-libs.inc&q=
uot; are commented [#]=C2=A0</div><div><br></div><div>Thanks</div><span cla=
ss=3D"HOEnZb"><font color=3D"#888888"><div>RC=C2=A0</div><div><br></div><di=
v><br></div></font></span></div></div><div class=3D"HOEnZb"><div class=3D"h=
5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Apr 5,=
 2017 at 11:48 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@<wbr>li=
nuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span>On Wed, 2017-04-05 at 10:33 -0500, Matthew McClintock wrote:<br>
&gt; On Wed, Apr 5, 2017 at 10:18 AM, Ravi chandra reddy &lt;vlsireddy@gmai=
l.<br>
&gt; com&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi All,<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0I am =
using meta-oe to generate libxml2 library using<br>
&gt; &gt; AARCH64<br>
&gt; &gt; compiler. However it generates shared object [.so] library.<br>
&gt; &gt;<br>
&gt; &gt; is there any setting in recipe to modify this, to generate static=
<br>
&gt; &gt; library<br>
&gt; &gt; [instead of shared library]<br>
&gt; &gt;<br>
&gt; &gt; if so, please point me to the recipe/file to change.<br>
&gt; &gt;<br>
&gt; &gt; if not, i will try to add it as patch, plz point me to appropriat=
e<br>
&gt; &gt; files to<br>
&gt; &gt; change<br>
&gt; Is the ${PN}-staticdev package getting generated for you?<br>
<br>
</span>Its possible you have conf/distro/include/no-static-<wbr>libs.inc in=
cluded<br>
in your build (bitbake -e would tell you).<br>
<br>
If so, you could remove that include or set:<br>
<br>
DISABLE_STATIC =3D &quot;&quot;<br>
<br>
as it would currently be set to this if that include file is included:<br>
<br>
DISABLE_STATIC =3D &quot; --disable-static&quot;<br>
<br>
We tend not to build static libraries as they&#39;re a waste of space/time<=
br>
on the most part.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a114416bc6e5cc1054c6f4c80--
