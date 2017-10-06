Return-Path: <n.merinov@inango-systems.com>
Received: from main-1.inango.com (main-1.inango-systems.com [5.189.174.2])
	by mail.openembedded.org (Postfix) with ESMTP id 1C1DB78263
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 18:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by main-1.inango.com (Postfix) with ESMTP id 55F794C36C9;
	Fri,  6 Oct 2017 20:53:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.inango-systems.com
Received: from main-1.inango.com ([127.0.0.1])
	by localhost (main-1.inango.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2fy5t7s72Hl; Fri,  6 Oct 2017 20:53:08 +0200 (CEST)
Received: from android-11d52582e3eff2d9.lan (97.9-157-90.telenet.ru
	[90.157.9.97])
	by main-1.inango.com (Postfix) with ESMTPSA id 8968B4C159D;
	Fri,  6 Oct 2017 20:53:08 +0200 (CEST)
Date: Fri, 06 Oct 2017 23:53:04 +0500
User-Agent: K-9 Mail for Android
In-Reply-To: <CAJTo0LZsvj+er5x+GjOQ_sXBGWE2wOhyEJKi=ndjZy2qwMRCSw@mail.gmail.com>
References: <20171005074607.20260-1-n.merinov@inango-systems.com>
	<CAJTo0LZsvj+er5x+GjOQ_sXBGWE2wOhyEJKi=ndjZy2qwMRCSw@mail.gmail.com>
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
From: Nikolai Merinov <n.merinov@inango-systems.com>
Message-ID: <A4B56E12-CC29-4781-AA54-6065306496B1@inango-systems.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utils.bbclass: Support applications with keys in check_app_exist function
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
X-List-Received-Date: Fri, 06 Oct 2017 18:53:11 -0000
Content-Type: multipart/alternative;
	boundary="----87R3U7MERMLN0XSSMM3ZN1XNABPOPC"
Content-Transfer-Encoding: 7bit

------87R3U7MERMLN0XSSMM3ZN1XNABPOPC
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Currently BUILD_CC =3D "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"

BUILD_CC_ARCH looks like correct place for "-march" flag, but if we provid=
e non-empty value for this variable sanity check can fail=2E

6 =D0=BE=D0=BA=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2017 =D0=B3=2E 15:45:16 GMT+0=
5:00, "Burton, Ross" <ross=2Eburton@intel=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
>On 5 October 2017 at 08:46, Nikolay Merinov
><n=2Emerinov@inango-systems=2Ecom>
>wrote:
>
>> check_app_exist function must support cases when "app" variable
>defined
>> as "progname --keys"=2E For example BUILD_CC=3D"gcc -march=3Dx86-64" mu=
st
>> pass sanity check=2E
>>
>
>Whilst this is useful, -march should be in BUILD_CFLAGS=2E
>
>Ross

--=20
Nikolay Merinov
Team Leader, 3-rd Party Group
n=2Emerinov@inango-systems=2Ecom
T +7 343 298 0147 C +7 912 229 2564
inango=2Ecom

------87R3U7MERMLN0XSSMM3ZN1XNABPOPC
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Currently BUILD_CC =3D &quot;${CCACHE}${BUILD_PREF=
IX}gcc ${BUILD_CC_ARCH}&quot;<br>
<br>
BUILD_CC_ARCH looks like correct place for &quot;-march&quot; flag, but if=
 we provide non-empty value for this variable sanity check can fail=2E<br><=
br><div class=3D"gmail_quote">6 =D0=BE=D0=BA=D1=82=D1=8F=D0=B1=D1=80=D1=8F =
2017 =D0=B3=2E 15:45:16 GMT+05:00, &quot;Burton, Ross&quot; &lt;ross=2Eburt=
on@intel=2Ecom&gt; =D0=BF=D0=B8=D1=88=D0=B5=D1=82:<blockquote class=3D"gmai=
l_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(2=
04, 204, 204); padding-left: 1ex;">
<div dir=3D"ltr">On 5 October 2017 at 08:46, Nikolay Merinov <span dir=3D"=
ltr">&lt;<a href=3D"mailto:n=2Emerinov@inango-systems=2Ecom" target=3D"_bla=
nk">n=2Emerinov@inango-systems=2Ecom</a>&gt;</span> wrote:<br /><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 =2E8ex;border-left:1px #ccc solid;padding-left:1ex=
">check_app_exist function must support cases when &quot;app&quot; variable=
 defined<br />
as &quot;progname --keys&quot;=2E For example BUILD_CC=3D&quot;gcc -march=
=3Dx86-64&quot; must<br />
pass sanity check=2E<br /></blockquote><div><br /></div><div>Whilst this i=
s useful, -march should be in BUILD_CFLAGS=2E</div><div><br /></div><div>Ro=
ss&nbsp;</div></div></div></div>
</blockquote></div><br>
-- <br>
Nikolay Merinov<br>
Team Leader, 3-rd Party Group<br>
n=2Emerinov@inango-systems=2Ecom<br>
T +7 343 298 0147 C +7 912 229 2564<br>
<a href=3D"http://inango=2Ecom">inango=2Ecom</a></body></html>

------87R3U7MERMLN0XSSMM3ZN1XNABPOPC--
