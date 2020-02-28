Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id B4936608DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 09:30:24 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id k24so716029uaq.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 01:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wWxoLPlOYhI8Aq3jkSX1GKtQlsMH4Y3UCIQam1eFLvA=;
	b=q8hmf4GEuiuZlWq3lx1vzC0GkVKG2Eke1NZHowlh9s73799FORVi1/G+byjpwz1be8
	3QKnSCw+PtLhCsPsgiHD11JutAQpC1+ndqgeJwIGyvle+ZI2SzEyZb250p8MjIKIgIDL
	A9YHWvzdYN4rKNXacvdGfDEL+3hA0pDO+7apy1PgoiUYcp4AH5nxsTpphMsQjXvl4uoP
	csJEsZDNyzATLY50ty09iKxbZQb/MBGyhABp8MNT+iCh5ZMbOnRKYvtiGQqY7pgZTYFb
	alFbAP1Og17y1xQV0I5tmjkr45BOf2KarT0z2mh4PwddchL9j6xHOxurq37QLWdNf7v7
	deUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wWxoLPlOYhI8Aq3jkSX1GKtQlsMH4Y3UCIQam1eFLvA=;
	b=RxYB5p33shxgV4J+hmMZnMjizrejaVo//jE3cpgGzMx1rakgNby+U6X0VkJJFmwolD
	THaUqTZ83rHSvdGcSh6DqOchlCgyNRSWkBGDA0GgK1JCVn4O6J6t2eRzINqR8OoPDcDM
	x1LeU9PZctER0UrEzGM8s8IqEClZAUjJ81pdefCCP7+1Dy6f7Wjf8jMehcAmsKjPlW9Z
	nZNOhBejm1Rxi1HoVFSu3iaP5xRI5HTP8CujCfy6b/EHmg51TThXKB2XSElTJKUBT+Bw
	0arORsZzX4nHY4GxwjJRDRrwnFvLHBebyCEocZDqFovz0yFBBrkDpltsrw/jkshvyXNX
	gDtA==
X-Gm-Message-State: ANhLgQ18HaGjfURMc4/L9rLoC0k6T3Wus5GSg/bmEx9TgHGMHXlEasUp
	TFn/GWlH8xGN0TOEmHQBGBZJTSkhTOIMRrZAJEA=
X-Google-Smtp-Source: ADFU+vuGI3sRn159e4yBYrOUDQQeXNufDF1Wmn7YF7saLqCRwuR2d5Tk0vXeRZtwTO0fC1QoGXkAGPchtfbn/0pvhn8=
X-Received: by 2002:ab0:658d:: with SMTP id v13mr1389605uam.71.1582882225492; 
	Fri, 28 Feb 2020 01:30:25 -0800 (PST)
MIME-Version: 1.0
References: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
	<20200227000603.14252-4-timothy.t.orling@linux.intel.com>
	<2c3ea5cc-29e6-0ce6-f9b3-c720e835e363@intel.com>
	<7956231e-1523-6213-b757-633b75eb2eb2@gmail.com>
	<CANx9H-CiC8xMqVKDYXzAupOrShPvGvpeu0j8r0CFjZ0OTSdsJA@mail.gmail.com>
	<CANx9H-BuKY5DONf26jnVJLseUmv9C6FqRZU_Aw2aGpBr5nswZw@mail.gmail.com>
In-Reply-To: <CANx9H-BuKY5DONf26jnVJLseUmv9C6FqRZU_Aw2aGpBr5nswZw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Feb 2020 10:30:13 +0100
Message-ID: <CANNYZj-LiYrmK6-ihTxgtMBSCqb2Yg_HmooG7QJOQ=_MtdP9+Q@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] at-spi2-atk: upgrade 2.32.0 -> 2.34.1
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
X-List-Received-Date: Fri, 28 Feb 2020 09:30:25 -0000
Content-Type: multipart/alternative; boundary="000000000000c5a265059f9f7c47"

--000000000000c5a265059f9f7c47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I actually have a number of patches I have to hold because they don't build
or don't work on centos 7.
Latest atk and friends included:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dakanavin/pa=
ckage-version-updates-later

Something ought to be done about centos 7, I'm all for dropping it asap, if
the newer compiler installation turns out unfeasible.

Alex

On Fri, 28 Feb 2020 at 05:35, Tim Orling <ticotimo@gmail.com> wrote:

> All those build failures are on CentOS-7.
> Grumble grumble.
>
> On Thu, Feb 27, 2020 at 8:32 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>> Strange. I built it in new environment, tip of master, on Debian-10 and
>> no problems. I=E2=80=99ll look into it tomorrow.
>>
>> Thank you for the information.
>>
>> On Thu, Feb 27, 2020 at 8:28 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>>
>>>
>>> On 2/27/20 7:54 PM, Anuj Mittal wrote:
>>> > Hi Tim,
>>> >
>>> > On 27-Feb-20 08:06 AM, Tim Orling wrote:
>>> >> Release notes:
>>> >>
>>> https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b793de2161a05488354=
24f4d087ac90d1172d/NEWS
>>> >>
>>> >>
>>> >> License-Update: Changed to LGPL-2.1+
>>> >>
>>> >> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
>>> >> ---
>>> >>   .../atk/{at-spi2-atk_2.32.0.bb =3D> at-spi2-atk_2.34.1.bb}  | 8
>>> ++++----
>>> >>   1 file changed, 4 insertions(+), 4 deletions(-)
>>> >>   rename meta/recipes-support/atk/{at-spi2-atk_2.32.0.bb =3D>
>>> >> at-spi2-atk_2.34.1.bb} (66%)
>>> >
>>> > This is failing on musl-qemu86:
>>> >
>>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/162=
3
>>> >
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown
>>> field
>>> > =E2=80=98tv_sec=E2=80=99 specified in initializer
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess
>>> > elements in struct initializer [enabled by default]
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near
>>> > initialization for =E2=80=98timeout=E2=80=99) [enabled by default]
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown
>>> field
>>> > =E2=80=98tv_nsec=E2=80=99 specified in initializer
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess
>>> > elements in struct initializer [enabled by default]
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near
>>> > initialization for =E2=80=98timeout=E2=80=99) [enabled by default]
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:19: error: storage siz=
e
>>> > of =E2=80=98timeout=E2=80=99 isn=E2=80=99t known
>>> >     struct timespec timeout =3D { .tv_sec =3D 0, .tv_nsec =3D 10 * 10=
00000 };
>>> >                     ^
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:90:5: warning: implicit
>>> > declaration of function =E2=80=98nanosleep=E2=80=99 [-Wimplicit-funct=
ion-declaration]
>>> >       nanosleep(&timeout, NULL);
>>> >       ^
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c: In function
>>> =E2=80=98terminate_app=E2=80=99:
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: variable
>>> > =E2=80=98timeout=E2=80=99 has initializer but incomplete type
>>> >     struct timespec timeout =3D { .tv_sec =3D 0, .tv_nsec =3D 10 * 10=
00000 };
>>> >            ^
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown
>>> field
>>> > =E2=80=98tv_sec=E2=80=99 specified in initializer
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess
>>> > elements in struct initializer [enabled by default]
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near
>>> > initialization for =E2=80=98timeout=E2=80=99) [enabled by default]
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown
>>> field
>>> > =E2=80=98tv_nsec=E2=80=99 specified in initializer
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess
>>> > elements in struct initializer [enabled by default]
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near
>>> > initialization for =E2=80=98timeout=E2=80=99) [enabled by default]
>>> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:19: error: storage
>>> size
>>> > of =E2=80=98timeout=E2=80=99 isn=E2=80=99t known
>>> >     struct timespec timeout =3D { .tv_sec =3D 0, .tv_nsec =3D 10 * 10=
00000 };
>>> >
>>>
>>> yeah this is exposing a bug in use if time_t struct in this component.
>>> there are several patches done to address that, we will perhaps need on=
e
>>> of these patches here.
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c5a265059f9f7c47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I actually have a number of patches I have to hold be=
cause they don&#39;t build or don&#39;t work on centos 7. <br></div><div>La=
test atk and friends included:</div><div><a href=3D"http://git.yoctoproject=
.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dakanavin/package-version-updates-l=
ater">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dakana=
vin/package-version-updates-later</a></div><div><br></div><div>Something ou=
ght to be done about centos 7, I&#39;m all for dropping it asap, if the new=
er compiler installation turns out unfeasible.<br></div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, 28 Feb 2020 at 05:35, Tim Orling &lt;<a href=3D"mai=
lto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div><div dir=3D"auto">All those =
build failures are on CentOS-7.</div></div><div dir=3D"auto">Grumble grumbl=
e.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Feb 27, 2020 at 8:32 PM Tim Orling &lt;<a href=3D"mailto:tic=
otimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div dir=3D"auto"=
>Strange. I built it in new environment, tip of master, on Debian-10 and no=
 problems. I=E2=80=99ll look into it tomorrow.=C2=A0</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Thank you for the information.</div></div><div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Feb 27, 2020 at 8:28 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 2/27/20 7:54 PM, Anuj Mittal wrote:<br>
&gt; Hi Tim,<br>
&gt; <br>
&gt; On 27-Feb-20 08:06 AM, Tim Orling wrote:<br>
&gt;&gt; Release notes:<br>
&gt;&gt; <a href=3D"https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b79=
3de2161a0548835424f4d087ac90d1172d/NEWS" rel=3D"noreferrer" target=3D"_blan=
k">https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b793de2161a054883542=
4f4d087ac90d1172d/NEWS</a> <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; License-Update: Changed to LGPL-2.1+<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@l=
inux.intel.com" target=3D"_blank">timothy.t.orling@linux.intel.com</a>&gt;<=
br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 .../atk/{<a href=3D"http://at-spi2-atk_2.32.0.bb" rel=3D"no=
referrer" target=3D"_blank">at-spi2-atk_2.32.0.bb</a> =3D&gt; <a href=3D"ht=
tp://at-spi2-atk_2.34.1.bb" rel=3D"noreferrer" target=3D"_blank">at-spi2-at=
k_2.34.1.bb</a>}=C2=A0 | 8 ++++----<br>
&gt;&gt; =C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;&gt; =C2=A0 rename meta/recipes-support/atk/{<a href=3D"http://at-spi2-=
atk_2.32.0.bb" rel=3D"noreferrer" target=3D"_blank">at-spi2-atk_2.32.0.bb</=
a> =3D&gt; <br>
&gt;&gt; <a href=3D"http://at-spi2-atk_2.34.1.bb" rel=3D"noreferrer" target=
=3D"_blank">at-spi2-atk_2.34.1.bb</a>} (66%)<br>
&gt; <br>
&gt; This is failing on musl-qemu86:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/=
builds/1623" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/typhoon/#/builders/64/builds/1623</a><br>
&gt; <br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown fiel=
d <br>
&gt; =E2=80=98tv_sec=E2=80=99 specified in initializer<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess <br=
>
&gt; elements in struct initializer [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near <br>
&gt; initialization for =E2=80=98timeout=E2=80=99) [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown fiel=
d <br>
&gt; =E2=80=98tv_nsec=E2=80=99 specified in initializer<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess <br=
>
&gt; elements in struct initializer [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near <br>
&gt; initialization for =E2=80=98timeout=E2=80=99) [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:19: error: storage size=
 <br>
&gt; of =E2=80=98timeout=E2=80=99 isn=E2=80=99t known<br>
&gt;=C2=A0 =C2=A0=C2=A0 struct timespec timeout =3D { .tv_sec =3D 0, .tv_ns=
ec =3D 10 * 1000000 };<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:90:5: warning: implicit <b=
r>
&gt; declaration of function =E2=80=98nanosleep=E2=80=99 [-Wimplicit-functi=
on-declaration]<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 nanosleep(&amp;timeout, NULL);<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c: In function =E2=80=98term=
inate_app=E2=80=99:<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: variable <b=
r>
&gt; =E2=80=98timeout=E2=80=99 has initializer but incomplete type<br>
&gt;=C2=A0 =C2=A0=C2=A0 struct timespec timeout =3D { .tv_sec =3D 0, .tv_ns=
ec =3D 10 * 1000000 };<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown fie=
ld <br>
&gt; =E2=80=98tv_sec=E2=80=99 specified in initializer<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess <b=
r>
&gt; elements in struct initializer [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near <br=
>
&gt; initialization for =E2=80=98timeout=E2=80=99) [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown fie=
ld <br>
&gt; =E2=80=98tv_nsec=E2=80=99 specified in initializer<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess <b=
r>
&gt; elements in struct initializer [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near <br=
>
&gt; initialization for =E2=80=98timeout=E2=80=99) [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:19: error: storage siz=
e <br>
&gt; of =E2=80=98timeout=E2=80=99 isn=E2=80=99t known<br>
&gt;=C2=A0 =C2=A0=C2=A0 struct timespec timeout =3D { .tv_sec =3D 0, .tv_ns=
ec =3D 10 * 1000000 };<br>
&gt; <br>
<br>
yeah this is exposing a bug in use if time_t struct in this component. <br>
there are several patches done to address that, we will perhaps need one <b=
r>
of these patches here.<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>
</blockquote></div></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000c5a265059f9f7c47--
