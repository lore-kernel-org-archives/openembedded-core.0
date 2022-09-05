Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E79FECAAA1
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 07:12:41 +0000 (UTC)
Subject: Re: [PATCH] rust-cross-canadian: Fix for the linker issues caused by
 using the shell
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@gmail.com>
X-Originating-Location: Hyderabad, Telangana, IN (183.83.147.219)
X-Originating-Platform: Windows Chrome 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 05 Sep 2022 00:12:35 -0700
References: 
 <a4f110ea41a9653e8fe894fabc7bf5a180bca30f.camel@linuxfoundation.org>
In-Reply-To: 
 <a4f110ea41a9653e8fe894fabc7bf5a180bca30f.camel@linuxfoundation.org>
Message-ID: <8827.1662361955840912678@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="eSed8mOBSJWUJpH7y6HG"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 07:12:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170299

--eSed8mOBSJWUJpH7y6HG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

Using CC args causing linker error " unknown executable format " so I calle=
d linker directly.
Also, I wrote my initial code without any hardcoded symbols and that test c=
ode works in my local machine but when the same code executed in Yocto buil=
d environment SIGSEGV faults are reported. And to debug the issue in Yocto =
build environment the printf/echo outputs are not shown in console/log file=
. So, I modified my code to check whether this solution works in AB machine=
 or not.

Can you let me know what is the error in AB machine with unsetenv("LD_LIBRA=
RY_PATH"); ? Is it the same relocation error?

Thanks,
Sundeep K.

--eSed8mOBSJWUJpH7y6HG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,<br /><br />Using CC args causing linker error "<em>unknown e=
xecutable format</em>" so I called linker directly.<br />Also, I wrote my i=
nitial code without any hardcoded symbols and that test code works in my lo=
cal machine but when the same code executed in Yocto build environment SIGS=
EGV faults are reported. And to debug the issue in Yocto build environment =
the printf/echo outputs are not shown in console/log file. So, I modified m=
y code to check whether this solution works in AB machine or not.<br /><br =
/>Can you let me know what is the error in AB machine with&nbsp;<span style=
=3D"white-space: pre-wrap;"><em>unsetenv("LD_LIBRARY_PATH");</em> ? Is it t=
he same relocation error?<br /><br /><br /><br />Thanks,<br />Sundeep K.</s=
pan>

--eSed8mOBSJWUJpH7y6HG--

