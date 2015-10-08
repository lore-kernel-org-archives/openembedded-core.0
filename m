Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 76C8B65CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 21:07:04 +0000 (UTC)
Received: by qkdo1 with SMTP id o1so15861732qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 14:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IGRy6C6sxvByaDP4DT3UKEx8B9303j58Du83s+V7ysw=;
	b=BIu/HMSEaOBmhnUJlnq58QVQKcEkATxD4mbTTvZOy4IKlwiqDwGRS9p2Ja0IcO5uwd
	yCUIC7pndJ3U1Vt5PnIuUGclmiXJArO9ob6Xn94Cl78uP2Bsi/4WHgdpYGnTUDSy56VP
	H0f+G7/QZnioBmALXySZp9X38EEfWi/lf4ZLo/2H6/x68vSF0fkfTrQeiIJKbbU+tPfc
	P4OPpm2JOiGjz3TE0gkyuWaXsDWDHI6/t+f0uU2oAbFJixeAI+F8BYczl1aZJigs5yfF
	jQp7qivU6YMu/Edlph5fh7WH0dacGU18B1uTQO6gblFuULTZocxGjcfWlgP60ZuWcOTp
	1uPw==
X-Gm-Message-State: ALoCoQmmiVIDJh8IQbWHz/G86Z57MZB34r5R+xuAsXQVY/FvaTcWSIHhg+6+2eM3ljjF8PF9kSwn
X-Received: by 10.55.200.71 with SMTP id c68mr6761752qkj.72.1444338424892;
	Thu, 08 Oct 2015 14:07:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 8 Oct 2015 14:06:45 -0700 (PDT)
In-Reply-To: <CABcZANm6GfP7sqVdcDo2x2v-Uq85Hns7WOG+s3K9j9N1NqG1EQ@mail.gmail.com>
References: <cover.1444310101.git.liezhi.yang@windriver.com>
	<5c927d04a3d915e5949f36f5ec9da9f81d8459bd.1444310101.git.liezhi.yang@windriver.com>
	<CABcZAN=wK-941ihO18dr68bxCa6vnN2LJgSz=LMynfoOZopVzA@mail.gmail.com>
	<CABcZANm6GfP7sqVdcDo2x2v-Uq85Hns7WOG+s3K9j9N1NqG1EQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Oct 2015 22:06:45 +0100
Message-ID: <CAJTo0Lbe64X4-vG4uBfypz9zDREU6vYiU0LWNk1aFe+CHYzZYg@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] autotools.bbclass: use relative path to run configure script
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
X-List-Received-Date: Thu, 08 Oct 2015 21:07:06 -0000
Content-Type: multipart/alternative; boundary=001a1139b448c070f305219e3ecf

--001a1139b448c070f305219e3ecf
Content-Type: text/plain; charset=UTF-8

On 8 October 2015 at 22:00, Christopher Larson <clarson@kergoth.com> wrote:

> +       # Use relative path for S to avoid buildpaths in files
>>> +       relative_s=`python -c "import os; print os.path.relpath('${S}',
>>> '.')"`
>>> +       cfgscript="$relative_s/configure"
>>>
>>
>> Why not just use inline python here, rather than calling out to an
>> external python process at task execution time?
>
>
> Oh, nevermind, of course oe_runconf can be run from any number of paths :)


Why not use realpath?

ross@flashheart ~/Yocto/poky/meta/recipes-devtools/qemu (mut)
$ realpath --relative-to=. ~/Yocto/poky/meta/recipes-support/mpfr/
../../recipes-support/mpfr

Ross

--001a1139b448c070f305219e3ecf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 October 2015 at 22:00, Christopher Larson <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><span class=3D""><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:=
solid;padding-left:1ex"><span><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
<div style=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Use relative p=
ath for S to avoid buildpaths in files<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0relative_s=3D`python -c &quot;import os; print =
os.path.relpath(&#39;${S}&#39;, &#39;.&#39;)&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cfgscript=3D&quot;$relative_s/configure&quot;</=
div></blockquote></div><br></span>Why not just use inline python here, rath=
er than calling out to an external python process at task execution time?</=
blockquote></div><br></span>Oh, nevermind, of course oe_runconf can be run =
from any number of paths :)</blockquote></div><br>Why not use realpath?</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">ross@flas=
hheart ~/Yocto/poky/meta/recipes-devtools/qemu (mut)</div><div class=3D"gma=
il_extra">$ realpath --relative-to=3D. ~/Yocto/poky/meta/recipes-support/mp=
fr/</div><div class=3D"gmail_extra">../../recipes-support/mpfr</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1139b448c070f305219e3ecf--
