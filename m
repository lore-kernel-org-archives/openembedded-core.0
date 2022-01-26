Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FBFC2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 12:07:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.11849.1643198831272858147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 04:07:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=D9uHtZpW;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-002-205-233-038.002.205.pools.vodafone-ip.de [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 323C882F8E;
	Wed, 26 Jan 2022 13:07:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643198828;
	bh=EYHzRMqJGJxNNMuOt+jCDxsnAx4SdH9gbtIoQ8nN8H0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D9uHtZpWHBIMLEqF9l8QfcWIN/vDFgPaJrZ+Oloh6iKexG7MSmv1yzjLcQ4GrNwUX
	 G9AQ+bgK/t24EJQLiF1mafPEJTISJj8LWvA2Ng2IOaHQyFbJUfnbHxW2dt+m9EvpXK
	 kdeUspdDKnYncQ2TsxYPKaqSJpintnlo8uierkNDPvCUDd8KPscTMKpRf5xUP2avye
	 CSorYE3XzBRemfBepni4yEZLzAbutmpCLTP/maJY3rnzzYQQXopgG8L9JSIcEXictw
	 mbUjGHur86/0r1CRoB1dSgARCryiYW6vCYwTGxbtW6Fds0xpWFbc8gqdjdD1EAgnX1
	 cVjp0DZK8Tn7w==
Message-ID: <d9982093-1923-e9ec-1b7c-5edecdafe1d3@denx.de>
Date: Wed, 26 Jan 2022 13:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [OE-core][RFC PATCH 00/12] Update to gstreamer 1.20 for kirkstone
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220126102814.4173943-1-ch@denx.de>
 <CANPvuR=bCzgv+R3kHQgDOh4CSst7CP0y+uy+9L_my4oVQrdm1A@mail.gmail.com>
 <CANNYZj93yXZHz8Yyobey6srn27h1sLSV+zbXkdsHiZqreE5E+w@mail.gmail.com>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: 
 <CANNYZj93yXZHz8Yyobey6srn27h1sLSV+zbXkdsHiZqreE5E+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 12:07:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160983

Hi Alex,

On 2022-01-26 12:36, Alexander Kanavin wrote:
> Thanks, I guess RP or I should spin this on the autobuilder so you can=20
> see where the issues are?

Sure that sounds good.

Thanks!

>=20
> Alex
>=20
> On Wed, 26 Jan 2022 at 11:52, Jose Quaresma <quaresma.jose@gmail.com=20
> <mailto:quaresma.jose@gmail.com>> wrote:
>=20
>=20
>     Hi Claudius,
>=20
>     I think we can do that switch for the monorepo in a follow up patch
>     after the 1.20 integration.
>     I have an internal update with most ready for 19.3 that misses some
>     of the existing downstream patches that we=C2=A0have.
>=20
>     The gstreamer project will provide the archives for
>     different=C2=A0components as they had done so far,
>     so we don't=C2=A0need to change the monorepo to integrate the gstre=
amer
>     1.20 for now.
>=20
>     Cheers,
>     Jose
>=20
>     Claudius Heine <ch@denx.de <mailto:ch@denx.de>> escreveu no dia
>     quarta, 26/01/2022 =C3=A0(s) 10:28:
>=20
>         Hi,
>=20
>         since the release of gstreamer 1.20 is getting close, and it
>         might make sense to
>         include it into the kirkstone release. I prepared preliminary
>         update patchset
>         for it.
>=20
>         Gstreamer changed to use monorepos with 1.20 so I went ahead I
>         changed all
>         recipes to use one SRC_URI from `gstreamer1.0-source.inc`.
>         Currently I just use
>         a tarball from a unrelease commit id, but that will be changed
>         to the correct
>         one, after gstreamer is released.
>=20
>         I have some ideas which could be implemented with this change,
>         but I wanted
>         feedback for this first:
>          =C2=A0- remove the version from the filename, and define the P=
V in the
>          =C2=A0 =C2=A0`gstreamer1.0-source.inc`, this might make future=
 updates
>         easier.
>          =C2=A0- put all recipes together into one recipe, which provid=
es
>         packages for all
>          =C2=A0 =C2=A0subprojects, this improves build time and makes m=
aintenance
>         easier, but also
>          =C2=A0 =C2=A0breaks downstream bbappends.
>=20
>         Any feedback on this is welcome.
>=20
>         kind regards,
>         Claudius
>=20
>         Claudius Heine (12):
>          =C2=A0 gstreamer1.0: 1.18.5 -> 1.20.0
>          =C2=A0 gstreamer1.0-plugins-base: 1.18.5 -> 1.20.0
>          =C2=A0 gstreamer1.0-plugins-good: 1.18.5 -> 1.20.0
>          =C2=A0 gstreamer1.0-plugins-bad: 1.18.5 -> 1.20.0
>          =C2=A0 gstreamer1.0-plugins-ugly: 1.18.5 -> 1.20.0
>          =C2=A0 gstreamer1.0-libav: 1.18.5 -> 1.20.0
>          =C2=A0 gstreamer1.0-python: 1.18.5 -> 1.20.0
>          =C2=A0 gstreamer1.0-omx: 1.18.5 -> 1.20.0
>          =C2=A0 gstreamer1.0-vaapi: 1.18.5 -> 1.20.0
>          =C2=A0 gstreamer1.0-rtsp-server: 1.18.5 -> 1.20.0
>          =C2=A0 gst-examples: 1.18.5 -> 1.20.0
>          =C2=A0 gst-devtools: 1.18.5 -> 1.20.0
>=20
>          =C2=A0...ct-has-a-different-signature-on-musl.patch |=C2=A0 =C2=
=A08 +-
>          =C2=A0...tools_1.18.5.bb <http://tools_1.18.5.bb> =3D>
>         gst-devtools_1.20.0.bb <http://gst-devtools_1.20.0.bb>} |=C2=A0=
 =C2=A09 +-
>          =C2=A0...001-Make-player-examples-installable.patch |=C2=A0 22=
 +-
>          =C2=A0...mples_1.18.5.bb <http://mples_1.18.5.bb> =3D>
>         gst-examples_1.20.0.bb <http://gst-examples_1.20.0.bb>} |=C2=A0=
 11 +-
>          =C2=A0...st-libav-fix-build-with-ffmpeg-5.0.0.patch | 346
>         ------------------
>          =C2=A0...1.18.5.bb <http://1.18.5.bb> =3D>
>         gstreamer1.0-libav_1.20.0.bb
>         <http://gstreamer1.0-libav_1.20.0.bb>} |=C2=A0 =C2=A09 +-
>          =C2=A0...x_1.18.5.bb <http://x_1.18.5.bb> =3D>
>         gstreamer1.0-omx_1.20.0.bb <http://gstreamer1.0-omx_1.20.0.bb>}
>         |=C2=A0 =C2=A06 +-
>          =C2=A0...ialized-warnings-when-compiling-with.patch |=C2=A0 =C2=
=A08 +-
>          =C2=A0...-avoid-including-sys-poll.h-directly.patch |=C2=A0 =C2=
=A08 +-
>          =C2=A0...-sentinals-for-gst_structure_get-etc.patch |=C2=A0 24=
 +-
>          =C2=A0...issing-opencv-data-dir-in-yocto-buil.patch |=C2=A0 25=
 +-
>          =C2=A0.../0005-msdk-fix-includedir-path.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 26 +-
>          =C2=A0....bb =3D> gstreamer1.0-plugins-bad_1.20.0.bb
>         <http://gstreamer1.0-plugins-bad_1.20.0.bb>} |=C2=A0 20 +-
>          =C2=A0...et-caps-from-src-pad-when-query-caps.patch |=C2=A0 10=
 +-
>          =C2=A0...parse-enhance-SSA-text-lines-parsing.patch |=C2=A0 10=
 +-
>          =C2=A0...iv-fb-Make-sure-config.h-is-included.patch |=C2=A0 =C2=
=A08 +-
>          =C2=A0...004-glimagesink-Downrank-to-marginal.patch |=C2=A0 32=
 --
>          =C2=A0...bb =3D> gstreamer1.0-plugins-base_1.20.0.bb
>         <http://gstreamer1.0-plugins-base_1.20.0.bb>} |=C2=A0 17 +-
>          =C2=A0...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |=C2=A0 12=
 +-
>          =C2=A0...bb =3D> gstreamer1.0-plugins-good_1.20.0.bb
>         <http://gstreamer1.0-plugins-good_1.20.0.bb>} |=C2=A0 =C2=A09 +=
-
>          =C2=A0...bb =3D> gstreamer1.0-plugins-ugly_1.20.0.bb
>         <http://gstreamer1.0-plugins-ugly_1.20.0.bb>} |=C2=A0 10 +-
>          =C2=A0....18.5.bb <http://18.5.bb> =3D> gstreamer1.0-python_1.=
20.0.bb
>         <http://gstreamer1.0-python_1.20.0.bb>} |=C2=A0 =C2=A07 +-
>          =C2=A0....bb =3D> gstreamer1.0-rtsp-server_1.20.0.bb
>         <http://gstreamer1.0-rtsp-server_1.20.0.bb>} |=C2=A0 =C2=A08 +-
>          =C2=A0.../gstreamer/gstreamer1.0-source.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +
>          =C2=A0...1.18.5.bb <http://1.18.5.bb> =3D>
>         gstreamer1.0-vaapi_1.20.0.bb
>         <http://gstreamer1.0-vaapi_1.20.0.bb>} |=C2=A0 =C2=A05 +-
>          =C2=A0...der.c-when-env-var-is-set-do-not-fal.patch |=C2=A0 69=
 ----
>          =C2=A0...pect-the-idententaion-used-in-meson.patch} |=C2=A0 14=
 +-
>          =C2=A0...002-Remove-unused-valgrind-detection.patch | 112 ----=
--
>          =C2=A0...s-add-support-for-install-the-tests.patch} |=C2=A0 67=
 ++--
>          =C2=A0...-use-too-strict-timeout-for-validati.patch |=C2=A0 32=
 --
>          =C2=A0...-use-a-dictionaries-for-environment.patch} |=C2=A0 28=
 +-
>          =C2=A0...er-script-to-run-the-installed_tests.patch |=C2=A0 72=
 ++++
>          =C2=A0...-the-environment-for-installed_tests.patch |=C2=A0 58=
 ---
>          =C2=A0...er1.0_1.18.5.bb <http://er1.0_1.18.5.bb> =3D>
>         gstreamer1.0_1.20.0.bb <http://gstreamer1.0_1.20.0.bb>} |=C2=A0=
 25 +-
>          =C2=A034 files changed, 267 insertions(+), 865 deletions(-)
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.5.bb
>         <http://gst-devtools_1.18.5.bb> =3D> gst-devtools_1.20.0.bb
>         <http://gst-devtools_1.20.0.bb>} (83%)
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/{gst-examples_1.18.5.bb
>         <http://gst-examples_1.18.5.bb> =3D> gst-examples_1.20.0.bb
>         <http://gst-examples_1.20.0.bb>} (82%)
>          =C2=A0delete mode 100644
>         meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-gst-l=
ibav-fix-build-with-ffmpeg-5.0.0.patch
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.5.bb
>         <http://gstreamer1.0-libav_1.18.5.bb> =3D>
>         gstreamer1.0-libav_1.20.0.bb
>         <http://gstreamer1.0-libav_1.20.0.bb>} (66%)
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.5.bb
>         <http://gstreamer1.0-omx_1.18.5.bb> =3D>
>         gstreamer1.0-omx_1.20.0.bb <http://gstreamer1.0-omx_1.20.0.bb>}
>         (89%)
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.1=
8.5.bb
>         <http://gstreamer1.0-plugins-bad_1.18.5.bb> =3D>
>         gstreamer1.0-plugins-bad_1.20.0.bb
>         <http://gstreamer1.0-plugins-bad_1.20.0.bb>} (91%)
>          =C2=A0delete mode 100644
>         meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/000=
4-glimagesink-Downrank-to-marginal.patch
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.=
18.5.bb
>         <http://gstreamer1.0-plugins-base_1.18.5.bb> =3D>
>         gstreamer1.0-plugins-base_1.20.0.bb
>         <http://gstreamer1.0-plugins-base_1.20.0.bb>} (85%)
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.=
18.5.bb
>         <http://gstreamer1.0-plugins-good_1.18.5.bb> =3D>
>         gstreamer1.0-plugins-good_1.20.0.bb
>         <http://gstreamer1.0-plugins-good_1.20.0.bb>} (91%)
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.=
18.5.bb
>         <http://gstreamer1.0-plugins-ugly_1.18.5.bb> =3D>
>         gstreamer1.0-plugins-ugly_1.20.0.bb
>         <http://gstreamer1.0-plugins-ugly_1.20.0.bb>} (82%)
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.5.b=
b
>         <http://gstreamer1.0-python_1.18.5.bb> =3D>
>         gstreamer1.0-python_1.20.0.bb
>         <http://gstreamer1.0-python_1.20.0.bb>} (79%)
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.1=
8.5.bb
>         <http://gstreamer1.0-rtsp-server_1.18.5.bb> =3D>
>         gstreamer1.0-rtsp-server_1.20.0.bb
>         <http://gstreamer1.0-rtsp-server_1.20.0.bb>} (70%)
>          =C2=A0create mode 100644
>         meta/recipes-multimedia/gstreamer/gstreamer1.0-source.inc
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.5.bb
>         <http://gstreamer1.0-vaapi_1.18.5.bb> =3D>
>         gstreamer1.0-vaapi_1.20.0.bb
>         <http://gstreamer1.0-vaapi_1.20.0.bb>} (90%)
>          =C2=A0delete mode 100644
>         meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstplug=
inloader.c-when-env-var-is-set-do-not-fal.patch
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-resp=
ect-the-idententaion-used-in-meson.patch
>         =3D> 0001-tests-respect-the-idententaion-used-in-meson.patch} (=
71%)
>          =C2=A0delete mode 100644
>         meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unus=
ed-valgrind-detection.patch
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add-=
support-for-install-the-tests.patch
>         =3D> 0002-tests-add-support-for-install-the-tests.patch} (65%)
>          =C2=A0delete mode 100644
>         meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-=
Don-t-use-too-strict-timeout-for-validati.patch
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use-=
a-dictionaries-for-environment.patch
>         =3D> 0003-tests-use-a-dictionaries-for-environment.patch} (61%)
>          =C2=A0create mode 100644
>         meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-h=
elper-script-to-run-the-installed_tests.patch
>          =C2=A0delete mode 100644
>         meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-insta=
ll-the-environment-for-installed_tests.patch
>          =C2=A0rename
>         meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.bb
>         <http://gstreamer1.0_1.18.5.bb> =3D> gstreamer1.0_1.20.0.bb
>         <http://gstreamer1.0_1.20.0.bb>} (72%)
>=20
>=20
>         base-commit: a179485351a0563d12a2fef3e49971122255ed80
>         --=20
>         2.34.1
>=20
>=20
>=20
>     --=20
>     Best regards,
>=20
>     Jos=C3=A9 Quaresma
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#160979):
>     https://lists.openembedded.org/g/openembedded-core/message/160979
>     <https://lists.openembedded.org/g/openembedded-core/message/160979>
>     Mute This Topic: https://lists.openembedded.org/mt/88693639/1686489
>     <https://lists.openembedded.org/mt/88693639/1686489>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: ch@denx.de

