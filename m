Return-Path: <sdliyong@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC2D65C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 12:03:55 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q107so5678596qgd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 04:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=uHjDWyhnqpVoEwbOyz0j2hKT5Xc++1Vt6enP2IrvPp0=;
	b=LHIhs6ZH4547gv1WtXkJ23RtrvgDhrUmR03Wv23zUOaFrqrarxdftFSBCMg6yUQifF
	rshVgmVra6WmxyFY2oeQSSOGNlWN6FDW4QgeuWsjHoKG1RrwIdGoGi862AJ48WrD6MC+
	TllrSJkR7R4fCpkaWoawLJV/LN0v7bIqou9ZD+eQOSCbrmrAsPp+8NbNfVmuI/7MC5NV
	bGZgPp597XBtZ6ghPupS40mJoNrTpv6+3kR2Cw0vdNU1+aGNdXWP0M62Fcz8PIVNKAgS
	/ZICfxxq0EydbIZOFl93fATLiUOYxxk3J/4WFr0dg4tdRTLLdCUZhmPw7x4dedx567/z
	X7EQ==
X-Received: by 10.224.152.2 with SMTP id e2mr1779209qaw.23.1422014636073; Fri,
	23 Jan 2015 04:03:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.70.194 with HTTP; Fri, 23 Jan 2015 04:03:35 -0800 (PST)
In-Reply-To: <CAJTo0La=KJweGLdAFcLZ1_5ZJ7BiDW6oZqBRKnH-aLtDtcE4QA@mail.gmail.com>
References: <CADO9-pf1mA5ykXAnGnArDxTcK3a39zy=VcDMo68k77fNVWs2mw@mail.gmail.com>
	<CAJTo0La=KJweGLdAFcLZ1_5ZJ7BiDW6oZqBRKnH-aLtDtcE4QA@mail.gmail.com>
From: Yong Li <sdliyong@gmail.com>
Date: Fri, 23 Jan 2015 20:03:35 +0800
Message-ID: <CADO9-peQOz62762ck3_T+cDXtykn4nzCxcufNX3PBnY2a+HdBg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Add XFCE image build bb file
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
X-List-Received-Date: Fri, 23 Jan 2015 12:04:01 -0000
Content-Type: multipart/alternative; boundary=089e0158b15c3fabba050d509518

--089e0158b15c3fabba050d509518
Content-Type: text/plain; charset=UTF-8

Thanks Ross, I will send this patch to meta-xfce later

2015-01-23 18:48 GMT+08:00 Burton, Ross <ross.burton@intel.com>:

>
> On 23 January 2015 at 07:55, Yong Li <sdliyong@gmail.com> wrote:
>
>>  meta/recipes-graphics/images/core-image-xfce.bb | 16 ++++++++++++++++
>>
>
> This doesn't belong in oe-core, add it to meta-xfce instead.
>
> Ross
>

--089e0158b15c3fabba050d509518
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Ross, I will send this patch to meta-xfce later</di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2015-01-23 18:4=
8 GMT+08:00 Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burto=
n@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span>:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On 23 January 2015 at 07:55, Yong Li <span dir=
=3D"ltr">&lt;<a href=3D"mailto:sdliyong@gmail.com" target=3D"_blank">sdliyo=
ng@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>=
=C2=A0meta/recipes-graphics/images/<a href=3D"http://core-image-xfce.bb" ta=
rget=3D"_blank">core-image-xfce.bb</a> | 16 ++++++++++++++++</div><div></di=
v></blockquote></div><br>This doesn&#39;t belong in oe-core, add it to meta=
-xfce instead.</div><span class=3D"HOEnZb"><font color=3D"#888888"><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></font></=
span></div>
</blockquote></div><br></div>

--089e0158b15c3fabba050d509518--
