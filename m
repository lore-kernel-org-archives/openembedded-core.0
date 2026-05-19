Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2489CD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 10:22:09 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] perl: link to the system zlib instead of a vendored copy
To: openembedded-core@lists.openembedded.org
From: "Sudhir Dumbhare" <sudumbha@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 19 May 2026 03:22:01 -0700
References: <20260514103317.3959488-1-sudumbha@cisco.com> <c10eec7c9793593287d92fdde936f51cd690fb00.camel@pbarker.dev>
In-Reply-To: <c10eec7c9793593287d92fdde936f51cd690fb00.camel@pbarker.dev>
Message-ID: <1697636.1779186121055340643@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="soLEBd7xdogP6L5o4os6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237304

--soLEBd7xdogP6L5o4os6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,
Thank you for review and a fair question.

I verified this with perl v5.38.4 on scarthgap.

In perl v5.38.4, compress-raw-zlib defaults to bundled zlib (BUILD_ZLIB=3DT=
rue) unless
disabled in config.in [1], and the perl_5.38.4.bb recipe does not override =
this, so
the vendored zlib is used.

BUILD_ZLIB [2], ZLIB_INCLUDE [3], and ZLIB_LIB [4] are taken from the envir=
onment via
oe_runmake/EXTRA_OEMAKE (by perl 5.38.4 recipe) and passed to Makefile.PL.

Based on the referenced sources, commit message are valid for scarthgap=E2=
=80=99s Perl 5.38.4.

Thanks and Regards,
Sudhir

References:
[1] config.in ( https://github.com/Perl/perl5/blob/v5.38.4/cpan/Compress-Ra=
w-Zlib/config.in#L19 )
[2] Makefile.PL#BUILD_ZLIB ( https://github.com/Perl/perl5/blob/v5.38.4/cpa=
n/Compress-Raw-Zlib/Makefile.PL#L333 )
[3] Makefile.PL#ZLIB_INCLUDE ( https://github.com/Perl/perl5/blob/v5.38.4/c=
pan/Compress-Raw-Zlib/Makefile.PL#L315 )
[4] Makefile.PL#ZLIB_LIB ( https://github.com/Perl/perl5/blob/v5.38.4/cpan/=
Compress-Raw-Zlib/Makefile.PL#L319 )

--soLEBd7xdogP6L5o4os6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Paul,<br />Thank you for review and a fair question.<br /><br />I v=
erified this with perl v5.38.4 on scarthgap.<br /><br />In perl v5.38.4, co=
mpress-raw-zlib defaults to bundled zlib (BUILD_ZLIB=3DTrue) unless<br />di=
sabled in config.in [1], and the perl_5.38.4.bb recipe does not override th=
is, so<br />the vendored zlib is used.<br /><br />BUILD_ZLIB [2], ZLIB_INCL=
UDE [3], and ZLIB_LIB [4] are taken from the environment via<br />oe_runmak=
e/EXTRA_OEMAKE (by perl 5.38.4 recipe) and passed to Makefile.PL.<br /><br =
/>Based on the referenced sources, commit message are valid for scarthgap&r=
squo;s Perl 5.38.4.<br /><br />Thanks and Regards,<br />Sudhir<br /><br />R=
eferences:<br />[1] <a title=3D"config.in" href=3D"https://github.com/Perl/=
perl5/blob/v5.38.4/cpan/Compress-Raw-Zlib/config.in#L19" target=3D"_blank" =
rel=3D"noopener">config.in</a>&nbsp;<br />[2] <a title=3D"Makefile.PL#BUILD=
_ZLIB" href=3D"https://github.com/Perl/perl5/blob/v5.38.4/cpan/Compress-Raw=
-Zlib/Makefile.PL#L333" target=3D"_blank" rel=3D"noopener">Makefile.PL#BUIL=
D_ZLIB</a>&nbsp;<br />[3] <a title=3D"Makefile.PL#ZLIB_INCLUDE" href=3D"htt=
ps://github.com/Perl/perl5/blob/v5.38.4/cpan/Compress-Raw-Zlib/Makefile.PL#=
L315" target=3D"_blank" rel=3D"noopener">Makefile.PL#ZLIB_INCLUDE</a>&nbsp;=
<br />[4] <a title=3D"Makefile.PL#ZLIB_LIB" href=3D"https://github.com/Perl=
/perl5/blob/v5.38.4/cpan/Compress-Raw-Zlib/Makefile.PL#L319" target=3D"_bla=
nk" rel=3D"noopener">Makefile.PL#ZLIB_LIB</a>&nbsp;</div>

--soLEBd7xdogP6L5o4os6--

