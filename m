Return-Path: <Anders.Montonen@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F052DE77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:11:26 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.24])
 by mx.groups.io with SMTP id smtpd.web11.4933.1735809077373584941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:11:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kapsi.fi header.s=20161220 header.b=ksdVsV39;
 spf=pass (domain: kapsi.fi, ip: 91.232.154.24, mailfrom: antime@kapsi.fi)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:To:Cc:In-Reply-To:Date:Subject:Mime-Version:
	Content-Type:Message-Id:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3EOpGQ3WoeiSxs1x1JIIHXEc+DZYci1ZuCzV7iddg1M=; b=ksdVsV39uYqxcbVsAI3wm6LQ9q
	bKAmCf7gWF5VSvts7aFEePca430ul55MnbNhi3hcT1chxckzPNSnk38CEjUUpD/BPKjkz5n/3PpsD
	8DoAUYAU9rcWooXmB0Op02Jc9VpbjcqRtYCKREDkse3vCNYwixZjPflLQj3ems77lZByJAAjfXAw/
	BZJc8o0c6Me74WmxQ27UTeCum5QKQUGMRbz/ratNrs2V4uvi2g3OUHhWOnkF5nSPP3j/h7S5KH1Ni
	cPntej/VjuvXVOXq3mTA31wXqBW0J/fgMnaXKOOrAAV+7F1dN5y8bXmED4V15w1AU8IoOEFOruny1
	+dkTsSLQ==;
Received: from 87-92-53-190.bb.dnainternet.fi ([87.92.53.190] helo=[192.168.1.137])
	by mail.kapsi.fi with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Anders.Montonen@iki.fi>)
	id 1tTHEX-0007xF-2s;
	Thu, 02 Jan 2025 11:11:13 +0200
From: Anders Montonen <Anders.Montonen@iki.fi>
Message-Id: <FD4FB645-3717-413D-80D5-B170709DFEF2@iki.fi>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_F91D56DE-6B99-47F2-AF71-3E8492FC86A0"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [OE-core] [PATCH] boost: fix do_fetch error
Date: Thu, 2 Jan 2025 11:11:13 +0200
In-Reply-To: <1816D4600EDA9FF8.21892@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org,
 changqing.li@windriver.com
To: Jiaying.Song.CN@windriver.com
References: <20250102084152.2042864-1-jiaying.song.cn@windriver.com>
 <1816D4600EDA9FF8.21892@lists.openembedded.org>
X-Mailer: Apple Mail (2.3445.104.21)
X-SA-Exim-Connect-IP: 87.92.53.190
X-SA-Exim-Mail-From: Anders.Montonen@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209259


--Apple-Mail=_F91D56DE-6B99-47F2-AF71-3E8492FC86A0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,

> On 2 Jan 2025, at 10:56, Anders Montonen <Anders.Montonen@iki.fi> =
wrote:
>=20
> Hi,
>=20
>> On 2 Jan 2025, at 10:41, Song, Jiaying (CN) via =
lists.openembedded.org =
<Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>>=20
>> From: Jiaying Song <jiaying.song.cn@windriver.com>
>>=20
>> Change the sha256sum to the correct value due to the following error:
>> WARNING: boost-native-1.86.0-r0 do_fetch: Checksum failure =
encountered with download of =
https://boostorg.jfrog.io/artifactory/main/release/1.86.0/source/boost_1_8=
6_0.tar.bz2 - will attempt other sources if available
>>=20
>> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
>> ---
>> meta/recipes-support/boost/boost-1.86.0.inc | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-support/boost/boost-1.86.0.inc =
b/meta/recipes-support/boost/boost-1.86.0.inc
>> index 2378b27575..6d6064fc7b 100644
>> --- a/meta/recipes-support/boost/boost-1.86.0.inc
>> +++ b/meta/recipes-support/boost/boost-1.86.0.inc
>> @@ -12,7 +12,7 @@ BOOST_MAJ =3D =
"${@"_".join(d.getVar("PV").split(".")[0:2])}"
>> BOOST_P =3D "boost_${BOOST_VER}"
>>=20
>> SRC_URI =3D =
"https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P=
}.tar.bz2"
>> -SRC_URI[sha256sum] =3D =
"1bed88e40401b2cb7a1f76d4bab499e352fa4d0c5f31c0dbae64e24d34d7513b"
>> +SRC_URI[sha256sum] =3D =
"79e6d3f986444e5a80afbeccdaf2d1c1cf964baa8d766d20859d653a16c39848"
>>=20
>> UPSTREAM_CHECK_URI =3D "http://www.boost.org/users/download/"
>> UPSTREAM_CHECK_REGEX =3D "release/(?P<pver>.*)/source/"
>> --=20
>> 2.34.1
>=20
> The url =
https://boostorg.jfrog.io/artifactory/main/release/1.86.0/source/boost_1_8=
6_0.tar.bz2 =
<https://boostorg.jfrog.io/artifactory/main/release/1.86.0/source/boost_1_=
86_0.tar.bz2> points to an error page. Also, in both this update and the =
Scarthgap 1.84.0 update you posted, you=E2=80=99re updating the recipes =
to the same sha256sum. I=E2=80=99m guessing these patches were not =
tested at all? I would also have expected the reason for the changed =
checksum in the commit message.
>=20
> Is there a reason the Boost recipes are not using archives.boost.io =
<http://archives.boost.io/>?

According to this comment, JFrog are no longer providing a mirror for =
Boost: =
https://github.com/boostorg/boost/issues/996#issuecomment-2567031602

-a=

--Apple-Mail=_F91D56DE-6B99-47F2-AF71-3E8492FC86A0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Hi,<br class=3D""><div><br class=3D""><blockquote type=3D"cite"=
 class=3D""><div class=3D"">On 2 Jan 2025, at 10:56, Anders Montonen =
&lt;<a href=3D"mailto:Anders.Montonen@iki.fi" =
class=3D"">Anders.Montonen@iki.fi</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Hi,</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">On 2 =
Jan 2025, at 10:41, Song, Jiaying (CN) via <a =
href=3D"http://lists.openembedded.org" =
class=3D"">lists.openembedded.org</a> &lt;<a =
href=3D"mailto:Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org" =
class=3D"">Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org</a>&gt; =
wrote:<br class=3D""><br class=3D"">From: Jiaying Song &lt;<a =
href=3D"mailto:jiaying.song.cn@windriver.com" =
class=3D"">jiaying.song.cn@windriver.com</a>&gt;<br class=3D""><br =
class=3D"">Change the sha256sum to the correct value due to the =
following error:<br class=3D"">WARNING: boost-native-1.86.0-r0 do_fetch: =
Checksum failure encountered with download of <a =
href=3D"https://boostorg.jfrog.io/artifactory/main/release/1.86.0/source/b=
oost_1_86_0.tar.bz2" =
class=3D"">https://boostorg.jfrog.io/artifactory/main/release/1.86.0/sourc=
e/boost_1_86_0.tar.bz2</a> - will attempt other sources if available<br =
class=3D""><br class=3D"">Signed-off-by: Jiaying Song &lt;<a =
href=3D"mailto:jiaying.song.cn@windriver.com" =
class=3D"">jiaying.song.cn@windriver.com</a>&gt;<br class=3D"">---<br =
class=3D"">meta/recipes-support/boost/boost-1.86.0.inc | 2 +-<br =
class=3D"">1 file changed, 1 insertion(+), 1 deletion(-)<br class=3D""><br=
 class=3D"">diff --git a/meta/recipes-support/boost/boost-1.86.0.inc =
b/meta/recipes-support/boost/boost-1.86.0.inc<br class=3D"">index =
2378b27575..6d6064fc7b 100644<br class=3D"">--- =
a/meta/recipes-support/boost/boost-1.86.0.inc<br class=3D"">+++ =
b/meta/recipes-support/boost/boost-1.86.0.inc<br class=3D"">@@ -12,7 =
+12,7 @@ BOOST_MAJ =3D "${@"_".join(d.getVar("PV").split(".")[0:2])}"<br =
class=3D"">BOOST_P =3D "boost_${BOOST_VER}"<br class=3D""><br =
class=3D"">SRC_URI =3D "<a =
href=3D"https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${=
BOOST_P}.tar.bz2" =
class=3D"">https://boostorg.jfrog.io/artifactory/main/release/${PV}/source=
/${BOOST_P}.tar.bz2</a>"<br class=3D"">-SRC_URI[sha256sum] =3D =
"1bed88e40401b2cb7a1f76d4bab499e352fa4d0c5f31c0dbae64e24d34d7513b"<br =
class=3D"">+SRC_URI[sha256sum] =3D =
"79e6d3f986444e5a80afbeccdaf2d1c1cf964baa8d766d20859d653a16c39848"<br =
class=3D""><br class=3D"">UPSTREAM_CHECK_URI =3D "<a =
href=3D"http://www.boost.org/users/download/" =
class=3D"">http://www.boost.org/users/download/</a>"<br =
class=3D"">UPSTREAM_CHECK_REGEX =3D =
"release/(?P&lt;pver&gt;.*)/source/"<br class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">2.34.1<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">The url<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"https://boostorg.jfrog.io/artifactory/main/release/1.86.0/source/b=
oost_1_86_0.tar.bz2" style=3D"font-family: Helvetica; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">https://boostorg.jfrog.io/artifactory/main/release/1.86.0/sourc=
e/boost_1_86_0.tar.bz2</a><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D""><span class=3D"Apple-converted-space">&nbsp;</span>points to =
an error page. Also, in both this update and the Scarthgap 1.84.0 update =
you posted, you=E2=80=99re updating the recipes to the same sha256sum. =
I=E2=80=99m guessing these patches were not tested at all? I would also =
have expected the reason for the changed checksum in the commit =
message.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 14px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Is there a =
reason the Boost recipes are not using<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"http://archives.boost.io/" style=3D"font-family: Helvetica; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">archives.boost.io</a><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">?</span></div></blockquote><br =
class=3D""></div><div>According to this comment, JFrog are no longer =
providing a mirror for Boost:&nbsp;<a =
href=3D"https://github.com/boostorg/boost/issues/996#issuecomment-25670316=
02" =
class=3D"">https://github.com/boostorg/boost/issues/996#issuecomment-25670=
31602</a></div><div><br class=3D""></div><div>-a</div></body></html>=

--Apple-Mail=_F91D56DE-6B99-47F2-AF71-3E8492FC86A0--

