Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA8D6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 15:28:22 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id r36so58457943ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DddPL6SVDAvoVah/e/dx2MuCns3BxCHK8jMjIu0x6QI=;
	b=EJcTfAV+ou1NOKhw6dwecdiM8Sh0+MvTUfKSAXkamQF18+0oZTIf0B/YMqdVihALNu
	M1MnU2OvfrbaW1zTOG8PvdD+trEtzJi0vR0IqLg6D/XyqNLlCJvdn6eEwWu0oHuTjNb7
	5n4WAZ/QQQvdZSomOeKZfnpJntdGdgX/fhATF71yJGfJMech3UbagXCxGXjPW83HkgqI
	ZTf6Okfa3GQLc6kYPxreB2fMYFcpaXYTUkDfgaTT8iLxNX+I0g3GWLKRwDPOtRz3Ww3Q
	KwNRfhxT6ttAeqlhlTKixwEPksBqml4PNkCA7WcPmchb7bkID3F/auKDIM3YnjSVsHjX
	dJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DddPL6SVDAvoVah/e/dx2MuCns3BxCHK8jMjIu0x6QI=;
	b=R/N7JFcboVaAWCIjBCdiSCzePi5REc18uigGr6Jph7RFlzd1MC9p5cFBBpTLgOgLJu
	O5DkFLQdPUBWptlP9VYPg5Q+l1iYzhzJaUbs3xqhJku6vZjA3Aa/YcQdbeMuSEIVgQ9o
	gF2dMcBNMDH1CeAJ0+dvYemQPPlqYn6TKEGGd6ZkQOwhIEXXW8KFgkx0mVMphao7uCqX
	0QH68iVwuiANRBQcP5FqRYwcMjQXGvwBSOKTBZ2ckv1ZXx1McZsxq5n67CQblks2nh3i
	KM35GdvLSdvKmAtBtekRKpVo0u2ACzRYWH/FypelHXUJzgERc2EjRKVuLhxwbOp+Dmzm
	twhQ==
X-Gm-Message-State: AKS2vOz+gCKTXpWw4VstaE0QV+aMVjomMSD5rI8zVw1rZu+4fllSPTCo
	G40F4aS3qgfJKsY1SOrBOZ8P45UvJw==
X-Received: by 10.107.202.195 with SMTP id a186mr33076102iog.37.1499095703547; 
	Mon, 03 Jul 2017 08:28:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.180.77 with HTTP; Mon, 3 Jul 2017 08:28:03 -0700 (PDT)
In-Reply-To: <CAJTo0LYyubn4hEUwJEQog_pVGYd954TuDPPjQUL+7MQnaD+Bug@mail.gmail.com>
References: <20170630092543.3151-1-ricardo.ribalda@gmail.com>
	<CAJTo0LYyubn4hEUwJEQog_pVGYd954TuDPPjQUL+7MQnaD+Bug@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 3 Jul 2017 17:28:03 +0200
Message-ID: <CAPybu_1MyLOF5OTM=N1UAG12Uy81z2M5ST8sS+JBRocjarXcrg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] gcc-6.3: Fix libgfortran build
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
X-List-Received-Date: Mon, 03 Jul 2017 15:28:22 -0000
Content-Type: multipart/alternative; boundary="94eb2c0bdd6ee4fd8105536b6a46"

--94eb2c0bdd6ee4fd8105536b6a46
Content-Type: text/plain; charset="UTF-8"

Hi Ross


On 3 Jul 2017 5:22 pm, "Burton, Ross" <ross.burton@intel.com> wrote:

>
> On 30 June 2017 at 10:25, Ricardo Ribalda Delgado <
> ricardo.ribalda@gmail.com> wrote:
>
>> --- a/meta/recipes-devtools/gcc/gcc-6.3.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
>>
>
> Is this fixed in gcc 7 (in which case the upstream-status is backport), or
> is gcc 7.1 still broken?
>

I do not know, at qtec we are following yocto, and currently it is at
version 6.3.

 I could try to build it with gcc7 during this week. and send another patch
if needed.

Regards!


>
> Ross
>

--94eb2c0bdd6ee4fd8105536b6a46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ross</div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 3 =
Jul 2017 5:22 pm, &quot;Burton, Ross&quot; &lt;<a href=3D"mailto:ross.burto=
n@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 30 Ju=
ne 2017 at 10:25, Ricardo Ribalda Delgado <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div id=3D"gmail-m_-6351636745689971924m_-933641636719609878:2jw" class=
=3D"gmail-m_-6351636745689971924m_-933641636719609878a3s gmail-m_-635163674=
5689971924m_-933641636719609878aXjCH gmail-m_-6351636745689971924m_-9336416=
36719609878m15cf85277fd443d1">--- a/meta/recipes-devtools/<span class=3D"gm=
ail-m_-6351636745689971924m_-933641636719609878il">gcc</span>/<span class=
=3D"gmail-m_-6351636745689971924m_-933641636719609878il">gc<wbr>c</span>-<s=
pan class=3D"gmail-m_-6351636745689971924m_-933641636719609878il">6.3</span=
>.inc<br>
+++ b/meta/recipes-devtools/<span class=3D"gmail-m_-6351636745689971924m_-9=
33641636719609878il">gcc</span>/<span class=3D"gmail-m_-6351636745689971924=
m_-933641636719609878il">gc<wbr>c</span>-<span class=3D"gmail-m_-6351636745=
689971924m_-933641636719609878il">6.3</span>.inc<br></div></blockquote></di=
v><br>Is this fixed in gcc 7 (in which case the upstream-status is backport=
), or is gcc 7.1 still broken?</div></div></blockquote><div><br></div><div =
dir=3D"auto">I do not know, at qtec we are following yocto, and currently i=
t is at version 6.3.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=
=A0I could try to build it with gcc7 during this week. and send another pat=
ch if needed.</div><div><br></div><div>Regards!</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>
</blockquote></div></div>
</div>

--94eb2c0bdd6ee4fd8105536b6a46--
