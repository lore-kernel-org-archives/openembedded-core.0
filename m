Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D06BD339AB
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 17:35:52 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.58311.1730136942139896670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 10:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout01.t-online.de (Postfix) with SMTP id B7A5930566;
	Mon, 28 Oct 2024 18:35:34 +0100 (CET)
Received: from [192.168.178.67] ([84.163.33.239]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t5TeM-3W5QsC0; Mon, 28 Oct 2024 18:35:30 +0100
Date: Mon, 28 Oct 2024 18:37:42 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] swig: update 4.2.1 -> 4.3.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <UAU2MS.QG2GZHH7V9YM2@t-online.de>
In-Reply-To: <Zx-bL-Eir-qb_gE9@bootlin-mathieu>
References: <20241026070941.309659-1-f_l_k@t-online.de>
	<Zx-bL-Eir-qb_gE9@bootlin-mathieu>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-KLfFt3ozNOUXZg36yOTM"
X-TOI-EXPURGATEID: 150726::1730136930-71FF140D-27AF38D8/0/0 CLEAN NORMAL
X-TOI-MSGID: b1687e18-f498-4812-825a-2fef7173656b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 17:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206454

--=-KLfFt3ozNOUXZg36yOTM
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

I've sent a patch to fix the issue in python3-dtc

On Mon, Oct 28 2024 at 03:09:51 PM +01:00:00, Mathieu Dubois-Briand=20
<mathieu.dubois-briand@bootlin.com> wrote:
> On Sat, Oct 26, 2024 at 09:09:41AM +0200, Markus Volk wrote:
>>  - refresh patch
>>=20
>>  SWIG-4.3.0 summary:
>>  - Add experimental support for C as a target language.
>>  - MzScheme/Racket is deprecated and planned for removal in SWIG-4.4.
>>  - The distributed Windows binary is now a 64-bit executable.
>>  - Add some missing use of move semantics for performance=20
>> improvements.
>>  - Enhanced handling of namespaces when using the nspace feature.
>>  - STL wrapper enhancements for std::unique_ptr, std::string_view,
>>    std::filesystem.
>>  - Various enum and enum class wrapping improvements.
>>  - Other C++ handling improvements around templates, friends, C++11
>>    trailing return types and C++17 fold expressions.
>>  - Many parser improvements for both C and C++, especially=20
>> expressions.
>>  - Improvements to handling of string and character literals.
>>  - Minor preprocessor fixes.
>>  - Python: Stricter stable ABI conformance, add support for=20
>> python-3.13.
>>  - C#: Add support for converting Doxygen comments into XML C#=20
>> comments.
>>  - Various other target language specific enhancements and updates=20
>> for
>>    Java, Javascript, Lua, MzScheme, Ocaml, Octave, Perl, Python, R,=20
>> Ruby.
>>=20
>=20
> Hi,
>=20
> I suspect this patch is responsible of some failures we observe on the
> autobuilder:
>=20
> /srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86_64-linux/p=
ython3-dtc-native/1.7.0/git/pylibfdt/libfdt_wrap.c:5598:17:
> error: too few arguments to function =E2=80=98SWIG_Python_AppendOutput=E2=
=80=99
>      resultobj =3D SWIG_Python_AppendOutput(resultobj, val);
>=20
> <https://valkyrie.yoctoproject.org/#/builders/89/builds/300/steps/16/logs=
/stdio>
> <https://valkyrie.yoctoproject.org/#/builders/6/builds/328/steps/11/logs/=
stdio>
>=20
> Can you please have a look at this failure ?
>=20
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> httpse//bootlin.com


--=-KLfFt3ozNOUXZg36yOTM
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Hi,</div><div><br></div><div>I've =
sent a patch to fix the issue in python3-dtc</div></div><div id=3D"geary-qu=
ote" dir=3D"auto"><br>On Mon, Oct 28 2024 at 03:09:51 PM +01:00:00, Mathieu=
 Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com&gt; wrote:<br><blockqu=
ote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spac=
es;">On Sat, Oct 26, 2024 at 09:09:41AM +0200, Markus Volk wrote:
<blockquote> - refresh patch
=20
 SWIG-4.3.0 summary:
 - Add experimental support for C as a target language.
 - MzScheme/Racket is deprecated and planned for removal in SWIG-4.4.
 - The distributed Windows binary is now a 64-bit executable.
 - Add some missing use of move semantics for performance improvements.
 - Enhanced handling of namespaces when using the nspace feature.
 - STL wrapper enhancements for std::unique_ptr, std::string_view,
   std::filesystem.
 - Various enum and enum class wrapping improvements.
 - Other C++ handling improvements around templates, friends, C++11
   trailing return types and C++17 fold expressions.
 - Many parser improvements for both C and C++, especially expressions.
 - Improvements to handling of string and character literals.
 - Minor preprocessor fixes.
 - Python: Stricter stable ABI conformance, add support for python-3.13.
 - C#: Add support for converting Doxygen comments into XML C# comments.
 - Various other target language specific enhancements and updates for
   Java, Javascript, Lua, MzScheme, Ocaml, Octave, Perl, Python, R, Ruby.
=20
</blockquote>
Hi,

I suspect this patch is responsible of some failures we observe on the
autobuilder:

/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86_64-linux/pyt=
hon3-dtc-native/1.7.0/git/pylibfdt/libfdt_wrap.c:5598:17:
error: too few arguments to function =E2=80=98SWIG_Python_AppendOutput=E2=
=80=99
     resultobj =3D SWIG_Python_AppendOutput(resultobj, val);

<a href=3D"https://valkyrie.yoctoproject.org/#/builders/89/builds/300/steps=
/16/logs/stdio">https://valkyrie.yoctoproject.org/#/builders/89/builds/300/=
steps/16/logs/stdio</a>
<a href=3D"https://valkyrie.yoctoproject.org/#/builders/6/builds/328/steps/=
11/logs/stdio">https://valkyrie.yoctoproject.org/#/builders/6/builds/328/st=
eps/11/logs/stdio</a>

Can you please have a look at this failure ?

<div>--=20
</div>Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
httpse//bootlin.com
</div></blockquote></div>
--=-KLfFt3ozNOUXZg36yOTM--


