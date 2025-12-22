Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBEFE6748D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 11:32:51 +0000 (UTC)
Subject: Re: [PATCH v6 1/8] distro/include: rework debug build
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@windriver.com>
X-Originating-Location: US (147.11.252.42)
X-Originating-Platform: Linux Chrome 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 03:32:51 -0800
References: <20251217152421.1181080-1-hongxu.jia@windriver.com> <67c01b7bbde3068d136b15d3855e3bef11a96990.camel@linuxfoundation.org>
In-Reply-To: <67c01b7bbde3068d136b15d3855e3bef11a96990.camel@linuxfoundation.org>
Message-ID: <281863.1766403171363602103@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="oT7tlDN4L5fAYtoI89dc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 11:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228296

--oT7tlDN4L5fAYtoI89dc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Understood

Due to option toolchain option `-Og' is the optimization for debugging[1]
how about rename debug-build to debug-optimize?

Drop DEBUG_BUILD, use DEBUG_OPTIMIZE to instead, add debug-optimize.bbclass
and debug-optimize.inc. Use variable DEBUG_OPTIMIZE to defer inherit
debug-optimize.bbclass conditionally.(Similar did in v5)

Make a config fragment core/yocto/debug-optimize to set DEBUG_OPTIMIZE ?=3D=
 1
to enable debug friendly optimize. For the recipe (such as qemu) which does=
n't
work with debug optimization, set DEBUG_OPTIMIZE =3D "0" to disable it for =
a
given recipe even though config fragment core/yocto/debug-optimize is enabl=
ed

Do not encourage user to enable debug friendly optimization by setting
DEBUG_OPTIMIZE =3D '1' directly, because the variable override is not certa=
inty,
which is affected by the order of configuration parsing

V7 incoming

[1] https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-Og

//Hongxu

--oT7tlDN4L5fAYtoI89dc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Understood</div>
<div>&nbsp;</div>
<div>Due to option toolchain option `-Og' is the optimization for debugging=
[1]</div>
<div>how about rename debug-build to debug-optimize?</div>
<div>&nbsp;</div>
<div>
<div>Drop DEBUG_BUILD, use DEBUG_OPTIMIZE to instead, add debug-optimize.bb=
class<br />and debug-optimize.inc. Use variable DEBUG_OPTIMIZE to defer inh=
erit<br />debug-optimize.bbclass conditionally.(Similar did in v5)</div>
<div>&nbsp;</div>
<div>Make a config fragment core/yocto/debug-optimize to set DEBUG_OPTIMIZE=
 ?=3D 1<br />to enable debug friendly optimize. For the recipe (such as qem=
u) which doesn't<br />work with debug optimization, set DEBUG_OPTIMIZE =3D =
"0" to disable it for a<br />given recipe even though config fragment core/=
yocto/debug-optimize is enabled</div>
<div>&nbsp;</div>
<div>Do not encourage user to enable debug friendly optimization by setting=
<br />DEBUG_OPTIMIZE =3D '1' directly, because the variable override is not=
 certainty,<br />which is affected by the order of configuration parsing</d=
iv>
</div>
<div>&nbsp;</div>
<div>V7 incoming</div>
<div>&nbsp;</div>
<div>[1] <a href=3D"https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.htm=
l#index-Og" target=3D"_blank" rel=3D"noopener">https://gcc.gnu.org/onlinedo=
cs/gcc/Optimize-Options.html#index-Og</a></div>
<div>&nbsp;</div>
<div>//Hongxu</div>

--oT7tlDN4L5fAYtoI89dc--

