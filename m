Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id EDB6A7827B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 09:19:36 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i3so13933257wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 01:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TJOnom+6d2J7djmtYpQ4UKeZTccytNSlubQGI0FvmH8=;
	b=iqf8snD2m4BTvCZBWYYOk+BHkozKYtC09aa3cMU+AoYdA95/6T9xqZEzyTH0BuSWzH
	aU2DTOUt9gjLB0V71QzX/1FGnyOotmR0WolmmhNqjT2NQ35HI/+DdD+r4u4T/tSDWcNs
	wwm/uX5gqaVijr8cCByFs32Q426QF1a8XTFfkeWwZVqm83JgKrAGPWy7/0WY/OVGV50l
	DQDVC7Y/1vHxp96IrvR4a1G/431mh0HOn2i6CyF54AegieUDUiCHJG5vbu/hJ940DMPH
	TUqXUNrUsa4XtjzyLHnK1l1oTSmUpabEe4+oZkZBdCuJmIZ712owriMRds8og51Bpdam
	H+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TJOnom+6d2J7djmtYpQ4UKeZTccytNSlubQGI0FvmH8=;
	b=Jkl0X6cg7gWoLpynBrPY64ZAzoYNMN/TMzbjHMlkeL2qH4SeFMitjFsBcdIdg8bSoO
	5G1JnMdAS4udxQEf4yRVZrDlKv3Ar7uj9Kj/bbstTpiH6VwgPGEbgZxZZxqD2ze2vZYV
	2Vh2XqsDVRg95DNrkBWMJWf4GA8NHmw3shITISE+0rqzRALGg4XezFnBvahi581eQIWU
	1f7dbsyrwRm9UaiCIN/qED41O3FBCBEaWEPrhEvGzT1cEaI2DQ4jV0ISA1jTa74mn711
	0nZSl2RsEbBdv0e7ewHD3recmqGnBSI/9CGNgoDpnp3x3f9zQTOmowDdfcurh1RkEbhW
	x8Jg==
X-Gm-Message-State: AElRT7FD2fGzwKsESdyOlZvS+Qra/nc9aTgoIjRBUDCh2H+el+JihT7F
	/GvH+MAXyw/AK1wStLUHbnqHP0Z0Xm+zmIwpkPo=
X-Google-Smtp-Source: AG47ELuTWpTI1vUmWANqzjn6SVDpOt4RZM5Vr9buRTX8rpC0bkLDNFSPNs8IGwM/ZsWNYLdfE7Mys44J7SLBnbOxwWw=
X-Received: by 10.28.87.211 with SMTP id l202mr7026904wmb.32.1520241577801;
	Mon, 05 Mar 2018 01:19:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Mon, 5 Mar 2018 01:19:37 -0800 (PST)
In-Reply-To: <CAJ86T=VPkRT06Jg7i7CK=mZBWZM_Ssn4a0-8+zf9RQyu-NXQLA@mail.gmail.com>
References: <1520162492-29839-1-git-send-email-richard.purdie@linuxfoundation.org>
	<20180304141538.GB1370@jama> <20180304162216.GC1370@jama>
	<CAJ86T=VPkRT06Jg7i7CK=mZBWZM_Ssn4a0-8+zf9RQyu-NXQLA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 5 Mar 2018 10:19:37 +0100
Message-ID: <CA+chaQf3SPQZ3UequDT7BOzUGUx0ZcSyow_pgzw-MQwFXnFHLg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][morty] gcc6: Upgrade to 6.4.0 (latest stable series release)
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
X-List-Received-Date: Mon, 05 Mar 2018 09:19:37 -0000
Content-Type: multipart/alternative; boundary="001a11442e3837bbea0566a6d3de"

--001a11442e3837bbea0566a6d3de
Content-Type: text/plain; charset="UTF-8"

Thanks Andre!

I've seen another failure probably caused by this gcc upgrade in morty-next:

python-matplotlib triggers ICE:

src/_png.cpp: In function 'void init_png()':
src/_png.cpp:497:25: warning: variable '_png' set but not used
[-Wunused-but-set-variable]
     static _png_module* _png = NULL;
                         ^~~~
src/_png.cpp: In member function 'Py::Object _png_module::read_png(const
Py::Tuple&)':
src/_png.cpp:272:1: internal compiler error: Segmentation fault
 _png_module::read_png(const Py::Tuple& args)
 ^~~~~~~~~~~
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
error: command 'i586-oe-linux-gcc' failed with exit status 1
ERROR: Function failed: do_compile (log file is located at
python-matplotlib/1.1.0-r1/temp/log.do_compile.15213)

I'll try to build it with Khem's and Andre's patches only to eliminate
hjl/indirect/gcc-6-branch/master changes.

On Mon, Mar 5, 2018 at 7:37 AM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Sun, Mar 4, 2018 at 8:22 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > On Sun, Mar 04, 2018 at 03:15:38PM +0100, Martin Jansa wrote:
> >> On Sun, Mar 04, 2018 at 11:21:32AM +0000, Richard Purdie wrote:
> >> > From: Juro Bystricky <juro.bystricky@intel.com>
> >> >
> >> > Changed BINV and PV from 6.2.0 to 6.4.0
> >> > Modified BASEURI to load xz tarball instead of bz2
> >> >
> >> > Backported series of patches from https://github.com/hjl-tools/
> gcc.git
> >> > branch /hjl/indirect/gcc-6-branch/master which contains
> >> > an IA patch series for security related issues
> >> >
> >> > ubsan-fix-check-empty-string.patch : removed, already applied
> >>
> >> Very limited testing with this change in morty shows that raspberrypi3
> >> (cortexa7hf-neon-vfpv4) build of glibc-initial fails with:
> >>
> >> configure:5344: checking for broken __attribute__((alias()))
> >> configure:5359: arm-oe-linux-gnueabi-gcc  -march=armv7ve -marm
> >> -mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
> >> --sysroot=sysroots/raspberrypi3-tcbootstrap
> >> -Werror -S conftest.c -o conftest.s 1>&5
> >> conftest.c:1:0: error: switch -mcpu=cortex-a7 conflicts with
> >> -march=armv7ve switch [-Werror]
> >>          extern int foo (int x) __asm ("xyzzy");
> >>
> >> cc1: all warnings being treated as errors
> >> configure:5362: $? = 1
> >> configure:5372: result: yes
> >> configure:5375: error: working alias attribute support required
> >>
> >> Which is a bit strange as armv7ve was added to resolve this error with
> >> -mcpu=cortexa7 and -march=armv7a in:
> >>
> >> commit 35392025f3236f5e5393f9cf0857732da9a2e503
> >> Author: Martin Jansa <Martin.Jansa@gmail.com>
> >> Date:   Tue Oct 6 17:08:59 2015 +0200
> >>
> >>     arch-armv7ve: add tune include for armv7ve and use it from cortexa7
> >> and cortexa15
> >>
> >>     * be aware that this -march value is available only in gcc-4.9 and
> >>       newer:
> >>       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57907
> >>     * -mcpu=cortex15 and -mcpu=cortexa7 conflict with -march=armv7a
> >>       We either have to stop putting -march in default CCARGS or at
> >>       least set it compatible one like this patch does.
> >>
> >> Regards,
> >
> > It seems to be known regression in 6.4, with fix available here:
> > https://patchwork.ozlabs.org/patch/835592/
>
> Yes. Not only was the patch submitted upstream to gcc, it was even
> submitted to oe-core:
>
>   http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-November/144159.html
>
> Unfortunately gcc 6.4.0 was dropped from oe-core master before the fix
> was merged...
>

--001a11442e3837bbea0566a6d3de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Andre!<div><br></div><div>I&#39;ve seen another fai=
lure probably caused by this gcc upgrade in morty-next:</div><div><br></div=
><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:small;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">python-matplotlib triggers ICE:</span><br><=
/div><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:small;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline"><br></span></div><div><div>src/_png.cpp=
: In function &#39;void init_png()&#39;:</div><div>src/_png.cpp:497:25: war=
ning: variable &#39;_png&#39; set but not used [-Wunused-but-set-variable]<=
/div><div>=C2=A0 =C2=A0 =C2=A0static _png_module* _png =3D NULL;</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~</div><div>src/_png.cpp: In member function &#39;Py::O=
bject _png_module::read_png(const Py::Tuple&amp;)&#39;:</div><div>src/_png.=
cpp:272:1: internal compiler error: Segmentation fault</div><div>=C2=A0_png=
_module::read_png(const Py::Tuple&amp; args)</div><div>=C2=A0^~~~~~~~~~~</d=
iv><div>Please submit a full bug report,</div><div>with preprocessed source=
 if appropriate.</div><div>See &lt;<a href=3D"http://gcc.gnu.org/bugs.html"=
>http://gcc.gnu.org/bugs.html</a>&gt; for instructions.</div><div>error: co=
mmand &#39;i586-oe-linux-gcc&#39; failed with exit status 1</div><div>ERROR=
: Function failed: do_compile (log file is located at python-matplotlib/1.1=
.0-r1/temp/log.do_compile.15213)</div></div><div><br></div><div>I&#39;ll tr=
y to build it with Khem&#39;s and Andre&#39;s patches only to eliminate=C2=
=A0<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline">hjl/indirect/gcc-6-branch/</span><wbr style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">master changes.</span></div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Mon, Mar 5, 2018 at 7:37 AM, Andre McC=
urdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D=
"_blank">armccurdy@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Sun, Mar 4, 2018 at 8:=
22 AM, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.ja=
nsa@gmail.com</a>&gt; wrote:<br>
&gt; On Sun, Mar 04, 2018 at 03:15:38PM +0100, Martin Jansa wrote:<br>
&gt;&gt; On Sun, Mar 04, 2018 at 11:21:32AM +0000, Richard Purdie wrote:<br=
>
&gt;&gt; &gt; From: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@int=
el.com">juro.bystricky@intel.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Changed BINV and PV from 6.2.0 to 6.4.0<br>
&gt;&gt; &gt; Modified BASEURI to load xz tarball instead of bz2<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Backported series of patches from <a href=3D"https://github.c=
om/hjl-tools/gcc.git" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/hjl-tools/<wbr>gcc.git</a><br>
&gt;&gt; &gt; branch /hjl/indirect/gcc-6-branch/<wbr>master which contains<=
br>
&gt;&gt; &gt; an IA patch series for security related issues<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ubsan-fix-check-empty-string.<wbr>patch : removed, already ap=
plied<br>
&gt;&gt;<br>
&gt;&gt; Very limited testing with this change in morty shows that raspberr=
ypi3<br>
&gt;&gt; (cortexa7hf-neon-vfpv4) build of glibc-initial fails with:<br>
&gt;&gt;<br>
&gt;&gt; configure:5344: checking for broken __attribute__((alias()))<br>
&gt;&gt; configure:5359: arm-oe-linux-gnueabi-gcc=C2=A0 -march=3Darmv7ve -m=
arm<br>
&gt;&gt; -mfpu=3Dneon-vfpv4=C2=A0 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7<br>
&gt;&gt; --sysroot=3Dsysroots/<wbr>raspberrypi3-tcbootstrap<br>
&gt;&gt; -Werror -S conftest.c -o conftest.s 1&gt;&amp;5<br>
&gt;&gt; conftest.c:1:0: error: switch -mcpu=3Dcortex-a7 conflicts with<br>
&gt;&gt; -march=3Darmv7ve switch [-Werror]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extern int foo (int x) __asm (&q=
uot;xyzzy&quot;);<br>
&gt;&gt;<br>
&gt;&gt; cc1: all warnings being treated as errors<br>
&gt;&gt; configure:5362: $? =3D 1<br>
&gt;&gt; configure:5372: result: yes<br>
&gt;&gt; configure:5375: error: working alias attribute support required<br=
>
&gt;&gt;<br>
&gt;&gt; Which is a bit strange as armv7ve was added to resolve this error =
with<br>
&gt;&gt; -mcpu=3Dcortexa7 and -march=3Darmv7a in:<br>
&gt;&gt;<br>
&gt;&gt; commit 35392025f3236f5e5393f9cf085773<wbr>2da9a2e503<br>
&gt;&gt; Author: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com"=
>Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt; Date:=C2=A0 =C2=A0Tue Oct 6 17:08:59 2015 +0200<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0arch-armv7ve: add tune include for armv7ve and =
use it from cortexa7<br>
&gt;&gt; and cortexa15<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0* be aware that this -march value is available =
only in gcc-4.9 and<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0newer:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gcc.gnu.org/bugzilla/=
show_bug.cgi?id=3D57907" rel=3D"noreferrer" target=3D"_blank">https://gcc.g=
nu.org/bugzilla/<wbr>show_bug.cgi?id=3D57907</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0* -mcpu=3Dcortex15 and -mcpu=3Dcortexa7 conflic=
t with -march=3Darmv7a<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0We either have to stop putting -march in=
 default CCARGS or at<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0least set it compatible one like this pa=
tch does.<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;<br>
&gt; It seems to be known regression in 6.4, with fix available here:<br>
&gt; <a href=3D"https://patchwork.ozlabs.org/patch/835592/" rel=3D"noreferr=
er" target=3D"_blank">https://patchwork.ozlabs.org/<wbr>patch/835592/</a><b=
r>
<br>
</div></div>Yes. Not only was the patch submitted upstream to gcc, it was e=
ven<br>
submitted to oe-core:<br>
<br>
=C2=A0 <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core=
/2017-November/144159.html" rel=3D"noreferrer" target=3D"_blank">http://lis=
ts.openembedded.org/<wbr>pipermail/openembedded-core/<wbr>2017-November/144=
159.html</a><br>
<br>
Unfortunately gcc 6.4.0 was dropped from oe-core master before the fix<br>
was merged...<br>
</blockquote></div><br></div>

--001a11442e3837bbea0566a6d3de--
