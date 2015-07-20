Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id C815176138
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 15:08:16 +0000 (UTC)
Received: by qgeu79 with SMTP id u79so18070060qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 08:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=L9X43fSSqbFu1ed/0SALm4vOBghISnkjVvLLF7ge6Ac=;
	b=DdNgibGHLnjdmu/TBWK7HhK8cocc076sxG+9skY+u99g5DpD0xwly9UEzqkXnzkasI
	DWqSaf7PYTYM0vHV+3Shh/c4vCxqFZkZYIPGZS7YSsQy2s6h0Bm0Dj3ru5ExO6wRLKRk
	7Owm/GYAradTvVorXhM1WB60g8ZB5uQf+81cX2qhGs16B5tYdf8jxXlkkbFSCCYMr0gW
	gx5s7ii7O1gz17dEzwr4xC1MB0ei+4FFGwaGH6DZCnaQtsxrv/Qw4jEbqtKEM9L+x6I5
	2ua7Rdtve2j6vh0BXtcEHFs2PgPOxjl3YKzGVc+wJvue3S0yXF21KumfvQwHYCIBCTNf
	yj9g==
X-Received: by 10.140.23.5 with SMTP id 5mr46469788qgo.106.1437404896286; Mon,
	20 Jul 2015 08:08:16 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.55 with HTTP; Mon, 20 Jul 2015 08:07:56 -0700 (PDT)
In-Reply-To: <CAJTo0LYHhv5WPDY_kJ86jRaBhJDXtcdO3t+OT85V-J++_R5v4A@mail.gmail.com>
References: <1436965490-8865-1-git-send-email-costin.c.constantin@intel.com>
	<CAJTo0Lajwx-z1DX9W6ovxYU99F6g0tBXyxZBhf73LWjcGe8tCw@mail.gmail.com>
	<CAJTo0LYHhv5WPDY_kJ86jRaBhJDXtcdO3t+OT85V-J++_R5v4A@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 20 Jul 2015 08:07:56 -0700
X-Google-Sender-Auth: 40lXxipExcCEaw-5gmTlKDibAvQ
Message-ID: <CABcZANk1STUYKvgni6LG+UTCLWZa+jdhL5ywNS0f3MSN0iakyg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/devtool: add useful failure messages for some test cases
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
X-List-Received-Date: Mon, 20 Jul 2015 15:08:17 -0000
Content-Type: multipart/alternative; boundary=001a11c12a963df59a051b4fe885

--001a11c12a963df59a051b4fe885
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2015 at 7:49 AM, Burton, Ross <ross.burton@intel.com> wrote=
:

> On 20 July 2015 at 14:40, Burton, Ross <ross.burton@intel.com> wrote:
>
>> I think this patch is responsible for the devtool failures in
>> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/b=
uilds/78/steps/Running%20oe-selftest/logs/stdio
>> .
>>
>
> I take it back - I think the problems are due to Chris's patch.


Yep, that=E2=80=99s right, sorry about that. It was 'devtool: also load plu=
gins
from BBPATH=E2=80=99, accidentally missed a couple functions when changing =
the
function call signature for the plugins. Will send a v2.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c12a963df59a051b4fe885
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jul 20, 2015 at 7:49 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><span class=3D""><div class=3D"gma=
il_quote">On 20 July 2015 at 14:40, Burton, Ross <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div class=3D"gmail_extra">I th=
ink this patch is responsible for the <span>devtool</span> failures in=C2=
=A0<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-oe=
-selftest/builds/78/steps/Running%20oe-selftest/logs/stdio" target=3D"_blan=
k">https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/b=
uilds/78/steps/Running%20oe-selftest/logs/stdio</a>.</div></blockquote></di=
v><br></span>I take it back - I think the problems are due to Chris&#39;s p=
atch.</blockquote></div><br>Yep, that=E2=80=99s right, sorry about that. It=
 was &#39;devtool: also load plugins from BBPATH=E2=80=99, accidentally mis=
sed a couple functions when changing the function call signature for the pl=
ugins. Will send a v2.<br>-- <br><div class=3D"gmail_signature">Christopher=
 Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphic=
s</div>
</div></div>

--001a11c12a963df59a051b4fe885--
