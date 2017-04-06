Return-Path: <gizero@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 409316FF73
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 22:31:50 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id o21so54848067wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 15:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3LVsK+5/jYAcCWxcWKaMKXjWrSTf6tgqxI3GMrah4tc=;
	b=CyoSaxOkZIerC54BAM4B0d+/Sr/xbipz6TKsHQ0K1xBMYVOrrpT+Q4FKuD3u3WhOPS
	BdvFqzuOYJIHrt4e4bXN0bt3rEg06/GighH9pIfdJrdLaW0IeWcnh3s2wJpvxA+EIZY3
	UAkYgDdepyO/9K6qINOHnLf6KdwOWW3JdD/cUsue4Tj1R6IJZD946thRPj2C9jeRMteM
	V988NpRvWMgH5FABuyQazlCb6YFaeEwWw9aD5oaIVvOsg3hRTt4nwHnTa3yHqBUI5NWk
	y4RckLSaNoi1eScAgBqN0txaJK6BNEMzyltZEaju571fGaQk1PQ+kIKB3TudtGyiszLJ
	YZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3LVsK+5/jYAcCWxcWKaMKXjWrSTf6tgqxI3GMrah4tc=;
	b=qhqYiV+xaEpclhfvPvpHuTBnHmZ00ok1+h5oh/YH/z//5rX8wMKKpo5+GgahuS5QLR
	KqN7tZAf00R645gUNEOo95qQzJI2deRPc9Zcl2DxkD2fhRWpm75+VA4UJB6r7d1ov5Gd
	BNGglULEFUzBUJps4JWcksp0Vokpo+4H834ukj9cc1F0zWiRPon/owPhUYS0ObLZ4pDX
	RsKAo71dQ1LWcTYIj6tl6Cle9IwvuJrojB+JVrXlXyOpPZOeFwufXoQ8gsW9Fp3btdvX
	Dz4WbPG1ZVNpxA4QgILfoRc85+zuNs/kxnDr4UJ7QBNtJUfj7Rtm815OcsjI8zX3hk1J
	Gzgg==
X-Gm-Message-State: AFeK/H3RtcIzRAVh32WrY7Ww4/GXFlUHsdwMOJ44z5R8UYe/FHU7tVKUReTdRM2MKYdfWZKAFyBz/ul2jW9M4g==
X-Received: by 10.223.134.219 with SMTP id 27mr32300094wry.104.1491517911857; 
	Thu, 06 Apr 2017 15:31:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.20.20 with HTTP; Thu, 6 Apr 2017 15:31:51 -0700 (PDT)
In-Reply-To: <CAGQ4JX1L0jqm6KeKCwDNnhNHDrGZFARJACk9pwreyUKzRgrFTg@mail.gmail.com>
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
From: Andrea Galbusera <gizero@gmail.com>
Date: Fri, 7 Apr 2017 00:31:51 +0200
Message-ID: <CAC+thW3riZUU02kb=v1amSFHojBJWq+utKJ6R5CdSrkdZmKgbg@mail.gmail.com>
To: Ravi chandra reddy <vlsireddy@gmail.com>
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
X-List-Received-Date: Thu, 06 Apr 2017 22:31:51 -0000
Content-Type: multipart/alternative; boundary=001a11491f765001fe054c8713de

--001a11491f765001fe054c8713de
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu, Apr 6, 2017 at 10:11 PM, Ravi chandra reddy <vlsireddy@gmail.com>
wrote:

> Hi,
>     I am trying to generate LibIIO [open source by Analog Devices],
> however there is dependancy on Libxml2.
>

For libiio there is a recipe in meta-openembedded [1]. Are you using that
one?

[1] http://layers.openembedded.org/layerindex/recipe/57509/


> problem with Libxml2, it is dependant on *python*-lib, libdl, libz,
> libzma, libm
>
> for some reason with Yocto built Libxml2.so, i am encountering "undefined
> references error", which i am unable to solve [inspite of linking possible
> dependant libraries],
>
> if i get could the Libxml2.a, it packages all "REQUIRED ELEMENTS", so i
> assume, there WONT be any error in linking Libxml2 in Libiio.
>
> ======in short=========
> Libiio ---linking---> Libxml2*.so* [yocto based] ---errors-> undefined
> referneces to .....
>
> ======in short=========
> Libiio ---linking---> Libxml2.a [yocto based] --> SHOULD solve and install
> libiio
>
> for me to generate Libxml2.a, i need to make/ask yocto build LIbxml2.a for
> me. i tried putting libxml2-staticdev  in the local.conf file and it gives
> me build error.
>
> all i want is Libxml2.a which is to be used by Libiio.so/Libiio.a to be
> used by an application [called in user space of AARCH linux]
>
>
> Thanks
> RC
>
> On Thu, Apr 6, 2017 at 3:17 PM, Matthew McClintock <msm-oss@mcclintock.net
> > wrote:
>
>> On Thu, Apr 6, 2017 at 9:20 AM, Ravi chandra reddy <vlsireddy@gmail.com>
>> wrote:
>> > Hi,
>> >      Is there any hidden pointer within these static dev packages. i
>> > expected the library to be .a format. what can i understand from these
>> > static dev packages, plz let me know.
>>
>> Can you expand on what you're trying to accomplish? Are you trying to
>> build a static binary? I don't think you actually are trying to
>> install libxml2.a on the running image are you? Maybe you really want
>> an SDK with a sysroot populated with static libraries so you can link
>> against them?
>>
>> -M
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11491f765001fe054c8713de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Thu, Apr 6, 2017 at 10:11 PM, Ravi chandra reddy <span dir=3D"ltr=
">&lt;<a href=3D"mailto:vlsireddy@gmail.com" target=3D"_blank">vlsireddy@gm=
ail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">Hi,<div>=C2=A0 =C2=A0 I am trying to generate LibI=
IO [open source by Analog Devices], however there is dependancy on Libxml2.=
</div></div></blockquote><div><br></div><div>For libiio there is a recipe i=
n meta-openembedded [1]. Are you using that one?</div><div><br></div><div>[=
1]=C2=A0<a href=3D"http://layers.openembedded.org/layerindex/recipe/57509/"=
>http://layers.openembedded.org/layerindex/recipe/57509/</a></div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv><br></div><div>problem with Libxml2, it is dependant on *python*-lib, li=
bdl, libz, libzma, libm</div><div><br></div><div>for some reason with Yocto=
 built Libxml2.so, i am encountering &quot;undefined references error&quot;=
, which i am unable to solve [inspite of linking possible dependant librari=
es],=C2=A0</div><div><br></div><div>if i get could the Libxml2.a, it packag=
es all &quot;REQUIRED ELEMENTS&quot;, so i assume, there WONT be any error =
in linking Libxml2 in Libiio.</div><div><br></div><div>=3D=3D=3D=3D=3D=3Din=
 short=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div>Libiio ---linking---&gt; Libxml=
2<b>.so</b> [yocto based] ---errors-&gt; undefined referneces to .....</div=
><div><br></div><div><div>=3D=3D=3D=3D=3D=3Din short=3D=3D=3D=3D=3D=3D=3D=
=3D=3D</div><div>Libiio ---linking---&gt; Libxml2.a [yocto based] --&gt; SH=
OULD solve and install libiio</div></div><div><br></div><div>for me to gene=
rate Libxml2.a, i need to make/ask yocto build LIbxml2.a for me. i tried pu=
tting libxml2-staticdev =C2=A0in the local.conf file and it gives me build =
error.=C2=A0<br></div><div><br></div><div>all i want is Libxml2.a which is =
to be used by Libiio.so/Libiio.a to be used by an application [called in us=
er space of AARCH linux]</div><div><br></div><div><br></div><div>Thanks</di=
v><span class=3D"gmail-HOEnZb"><font color=3D"#888888"><div>RC</div></font>=
</span></div><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Apr 6, 2017 at 3:17=
 PM, Matthew McClintock <span dir=3D"ltr">&lt;<a href=3D"mailto:msm-oss@mcc=
lintock.net" target=3D"_blank">msm-oss@mcclintock.net</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><span>On Thu, Apr 6, =
2017 at 9:20 AM, Ravi chandra reddy &lt;<a href=3D"mailto:vlsireddy@gmail.c=
om" target=3D"_blank">vlsireddy@gmail.com</a>&gt; wrote:<br>
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
<span class=3D"gmail-m_3154373555962040153HOEnZb"><font color=3D"#888888"><=
br>
-M<br>
</font></span></blockquote></div><br></div>
</div></div><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div></div>

--001a11491f765001fe054c8713de--
