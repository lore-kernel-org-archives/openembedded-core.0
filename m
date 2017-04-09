Return-Path: <vlsireddy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9598E71A74
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Apr 2017 01:55:12 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q125so4048935wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Apr 2017 18:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A3of9RjEedp3TdWu9cM9MGSgysxzf/JQ6X/VFNRoV3I=;
	b=iWwR4BPLCX/5Y8GNUBC+t0e7QbYHk0A6oA1tsKYyKOepBFpPOLb8qJRVHXZpGYPI27
	UuV3HNVwS8il24WTy2N9td3fYM94IoprW7fxEr4TluizIpmj9AnpX4leiwXZUL07Wz+m
	xcySMe5yKcxbkURYaf59tRa9fNBzxMURqrZ7eWVZE+DBj0vuZD4DI/0j1XrID2n2i7M2
	vllJswUsTqGaqrsEOlKn6QpFopl1PsHHdoiH3dbDRyYAWCZJezPKhY/JVjIN/eX8zY88
	9B8ro05xl3hDSDDv9zcR+ewJkJqqRnBBMp516eJgqBiaNMn10eRtEHKNN5OxDRxsuszu
	WgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A3of9RjEedp3TdWu9cM9MGSgysxzf/JQ6X/VFNRoV3I=;
	b=E1nrcQphl0hOieBfc5vJrwBds+L9/zyjXId753JNE7pHfe34V7F2c9TKh+HDh2jYVh
	GvFv/SV4Ujobww0IxXhqvgE6dL0CzBj/Y8e+eOUyqyvg8RBqMNGoueVOhiQ8SJoVM/qA
	FR4strFXGkdev1wPYQVWiyICACwj+NQlVDeLQfdB5RfoWgaw9P5qmlxIkJoJvBmiv/o+
	Mdm3/ES4jyL3a9KEOXmeWjwy+cJ0Cpl+625X6RXOnmhgajUoxxwlQ7CC3EZ/eyfk2vOZ
	1uRMVE4KvnirY6Ivxcb/T+VLm6MVS602YsZeMAuO8v0cdxjWK624TU/2nQRuZkLlqQRw
	KPwA==
X-Gm-Message-State: AN3rC/71pVjEpPi3R6evcwQegIcaxt8RPJEX9KZqiykgNx3YQAR/+FJnB5a8L18f/zy2eDMhbh5sRgkuNIgbpw==
X-Received: by 10.28.88.129 with SMTP id m123mr4880178wmb.28.1491702913135;
	Sat, 08 Apr 2017 18:55:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.105.216 with HTTP; Sat, 8 Apr 2017 18:55:12 -0700 (PDT)
In-Reply-To: <CAC+thW3riZUU02kb=v1amSFHojBJWq+utKJ6R5CdSrkdZmKgbg@mail.gmail.com>
References: <CAGQ4JX3rYtONiVv_eOhj-MK=2FA7=h3xCA_iytd=fpTF00rT6A@mail.gmail.com>
	<CAGQ4JX06AcUkSzRyg2255mZxxT=etOaE786_fVQqGp32EO8S2Q@mail.gmail.com>
	<CAEsOVNencj+9iW4xnqAUTzJAZ1_W=o8-N2-S6x0fr2pB-YJd9g@mail.gmail.com>
	<1491407333.17200.22.camel@linuxfoundation.org>
	<CAGQ4JX1DGeQuO3WhhpHZbJFsUpOg1uHmOou1fcQvgBy+hJpjOQ@mail.gmail.com>
	<CAGQ4JX12JDMaffLGYO16626BhXCSAQ3wzVEzN21wzcrZ7mwJ5A@mail.gmail.com>
	<CAEsOVNcN6=XAt8b7_PN288yHs8syzV08LreRkwSf2Mxpeb8Cgw@mail.gmail.com>
	<CAGQ4JX1ibcWeYV7NfYSB8cCOYH=83XEON1=sf4U9S378A16p8w@mail.gmail.com>
	<CAGQ4JX27J_dh=2wPJ=1Gp_=1T6KL2rcL3EhxNTx4BF=ukLwxJA@mail.gmail.com>
	<CAEsOVNf_wSreuAQk7mGMAbWN44PGo35WfcshbggzJ14OjvYVog@mail.gmail.com>
	<CAGQ4JX1L0jqm6KeKCwDNnhNHDrGZFARJACk9pwreyUKzRgrFTg@mail.gmail.com>
	<CAC+thW3riZUU02kb=v1amSFHojBJWq+utKJ6R5CdSrkdZmKgbg@mail.gmail.com>
From: Ravi chandra reddy <vlsireddy@gmail.com>
Date: Sat, 8 Apr 2017 21:55:12 -0400
Message-ID: <CAGQ4JX3OnPmFFz17WD48nLULdnDoKVmr7q=00PoJG6XnPg79Lw@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
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
X-List-Received-Date: Sun, 09 Apr 2017 01:55:13 -0000
Content-Type: multipart/alternative; boundary=001a114416bc3f7f98054cb2265c

--001a114416bc3f7f98054cb2265c
Content-Type: text/plain; charset=UTF-8

Hi Andrea,
               gr8, Thanks for this information. i wasnt' aware someone did
create a libiio in yocto.

anyways, i reached my goal using other means of cross compiling individual
libraries and building libiio finally. it was a pain, but i learnt a lot in
between.

Thanks
RC

On Thu, Apr 6, 2017 at 6:31 PM, Andrea Galbusera <gizero@gmail.com> wrote:

> Hi,
>
> On Thu, Apr 6, 2017 at 10:11 PM, Ravi chandra reddy <vlsireddy@gmail.com>
> wrote:
>
>> Hi,
>>     I am trying to generate LibIIO [open source by Analog Devices],
>> however there is dependancy on Libxml2.
>>
>
> For libiio there is a recipe in meta-openembedded [1]. Are you using that
> one?
>
> [1] http://layers.openembedded.org/layerindex/recipe/57509/
>
>
>> problem with Libxml2, it is dependant on *python*-lib, libdl, libz,
>> libzma, libm
>>
>> for some reason with Yocto built Libxml2.so, i am encountering "undefined
>> references error", which i am unable to solve [inspite of linking possible
>> dependant libraries],
>>
>> if i get could the Libxml2.a, it packages all "REQUIRED ELEMENTS", so i
>> assume, there WONT be any error in linking Libxml2 in Libiio.
>>
>> ======in short=========
>> Libiio ---linking---> Libxml2*.so* [yocto based] ---errors-> undefined
>> referneces to .....
>>
>> ======in short=========
>> Libiio ---linking---> Libxml2.a [yocto based] --> SHOULD solve and
>> install libiio
>>
>> for me to generate Libxml2.a, i need to make/ask yocto build LIbxml2.a
>> for me. i tried putting libxml2-staticdev  in the local.conf file and it
>> gives me build error.
>>
>> all i want is Libxml2.a which is to be used by Libiio.so/Libiio.a to be
>> used by an application [called in user space of AARCH linux]
>>
>>
>> Thanks
>> RC
>>
>> On Thu, Apr 6, 2017 at 3:17 PM, Matthew McClintock <
>> msm-oss@mcclintock.net> wrote:
>>
>>> On Thu, Apr 6, 2017 at 9:20 AM, Ravi chandra reddy <vlsireddy@gmail.com>
>>> wrote:
>>> > Hi,
>>> >      Is there any hidden pointer within these static dev packages. i
>>> > expected the library to be .a format. what can i understand from these
>>> > static dev packages, plz let me know.
>>>
>>> Can you expand on what you're trying to accomplish? Are you trying to
>>> build a static binary? I don't think you actually are trying to
>>> install libxml2.a on the running image are you? Maybe you really want
>>> an SDK with a sysroot populated with static libraries so you can link
>>> against them?
>>>
>>> -M
>>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

--001a114416bc3f7f98054cb2265c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andrea,<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0gr8, Thanks for this information. i wasnt&#39; aware someone d=
id create a libiio in yocto.=C2=A0</div><div><br></div><div>anyways, i reac=
hed my goal using other means of cross compiling individual libraries and b=
uilding libiio finally. it was a pain, but i learnt a lot in between.</div>=
<div><br></div><div>Thanks</div><div>RC</div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Thu, Apr 6, 2017 at 6:31 PM, Andrea Ga=
lbusera <span dir=3D"ltr">&lt;<a href=3D"mailto:gizero@gmail.com" target=3D=
"_blank">gizero@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr">Hi,<br><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote"><span class=3D"">On Thu, Apr 6, 2017 at 10:11 PM, Ravi chandr=
a reddy <span dir=3D"ltr">&lt;<a href=3D"mailto:vlsireddy@gmail.com" target=
=3D"_blank">vlsireddy@gmail.com</a>&gt;</span> wrote:<br></span><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi,<span class=3D""=
><div>=C2=A0 =C2=A0 I am trying to generate LibIIO [open source by Analog D=
evices], however there is dependancy on Libxml2.</div></span></div></blockq=
uote><div><br></div><div>For libiio there is a recipe in meta-openembedded =
[1]. Are you using that one?</div><div><br></div><div>[1]=C2=A0<a href=3D"h=
ttp://layers.openembedded.org/layerindex/recipe/57509/" target=3D"_blank">h=
ttp://layers.<wbr>openembedded.org/layerindex/<wbr>recipe/57509/</a></div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D""><div dir=3D"ltr"><div><br></div><div>problem with Libxml2, it is depe=
ndant on *python*-lib, libdl, libz, libzma, libm</div><div><br></div><div>f=
or some reason with Yocto built Libxml2.so, i am encountering &quot;undefin=
ed references error&quot;, which i am unable to solve [inspite of linking p=
ossible dependant libraries],=C2=A0</div><div><br></div><div>if i get could=
 the Libxml2.a, it packages all &quot;REQUIRED ELEMENTS&quot;, so i assume,=
 there WONT be any error in linking Libxml2 in Libiio.</div><div><br></div>=
<div>=3D=3D=3D=3D=3D=3Din short=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div>Libiio=
 ---linking---&gt; Libxml2<b>.so</b> [yocto based] ---errors-&gt; undefined=
 referneces to .....</div><div><br></div><div><div>=3D=3D=3D=3D=3D=3Din sho=
rt=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div>Libiio ---linking---&gt; Libxml2.a =
[yocto based] --&gt; SHOULD solve and install libiio</div></div><div><br></=
div><div>for me to generate Libxml2.a, i need to make/ask yocto build LIbxm=
l2.a for me. i tried putting libxml2-staticdev =C2=A0in the local.conf file=
 and it gives me build error.=C2=A0<br></div><div><br></div><div>all i want=
 is Libxml2.a which is to be used by Libiio.so/Libiio.a to be used by an ap=
plication [called in user space of AARCH linux]</div><div><br></div><div><b=
r></div><div>Thanks</div><span class=3D"m_-270054059736365407gmail-HOEnZb">=
<font color=3D"#888888"><div>RC</div></font></span></div><div class=3D"m_-2=
70054059736365407gmail-HOEnZb"><div class=3D"m_-270054059736365407gmail-h5"=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Apr 6, 2=
017 at 3:17 PM, Matthew McClintock <span dir=3D"ltr">&lt;<a href=3D"mailto:=
msm-oss@mcclintock.net" target=3D"_blank">msm-oss@mcclintock.net</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span>On T=
hu, Apr 6, 2017 at 9:20 AM, Ravi chandra reddy &lt;<a href=3D"mailto:vlsire=
ddy@gmail.com" target=3D"_blank">vlsireddy@gmail.com</a>&gt; wrote:<br>
&gt; Hi,<br>
</span><span>&gt;=C2=A0 =C2=A0 =C2=A0 Is there any hidden pointer within th=
ese static dev packages. i<br>
&gt; expected the library to be .a format. what can i understand from these=
<br>
&gt; static dev packages, plz let me know.<br>
<br>
</span>Can you expand on what you&#39;re trying to accomplish? Are you tryi=
ng to<br>
build a static binary? I don&#39;t think you actually are trying to<br>
install libxml2.a on the running image are you? Maybe you really want<br>
an SDK with a sysroot populated with static libraries so you can link<br>
against them?<br>
<span class=3D"m_-270054059736365407gmail-m_3154373555962040153HOEnZb"><fon=
t color=3D"#888888"><br>
-M<br>
</font></span></blockquote></div><br></div>
</div></div><br></span><span class=3D"HOEnZb"><font color=3D"#888888">--<br=
>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></font></span></blockquote></div><br></div></div>
</blockquote></div><br></div>

--001a114416bc3f7f98054cb2265c--
