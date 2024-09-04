Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0856ECD37AE
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 06:43:36 +0000 (UTC)
Subject: Re: [PATCH] gcc-sanitizers: Add ptest support for AddressSanitizer tests
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 128
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 03 Sep 2024 23:43:26 -0700
References: <bd31fb7301b3ebb5c8dcedbe29ef30aab1d99a21.camel@linuxfoundation.org>
In-Reply-To: <bd31fb7301b3ebb5c8dcedbe29ef30aab1d99a21.camel@linuxfoundation.org>
Message-ID: <17622.1725432167987381530@lists.openembedded.org>
X-Old-Date: Tue, 03 Sep 2024 23:42:47 -0700
Content-Type: multipart/alternative; boundary="hw5iktLN746IMek1gFFT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 06:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204191
Message-ID: <20240904064326.xtxiAUHbUK6nuvov5QbeFp4ZlCMPCpj5lncJEdMfFi4@z>

--hw5iktLN746IMek1gFFT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thanks for checking the patch and your comment
"Would it make more sense to run this as part of the other gcc testsuites?"

Definitely Yes. We can add the sanitizer tests as part of the existing gcc =
testsuites.

However, the sanitizer test was intentionally kept separate to avoid unnece=
ssary building and testing of sanitizers that are not required for most use=
rs.

The current activity was taken up when checking the sanitizers support for =
all targets. This testsuite will just test the sanitizers support quickly w=
ithin few minutes. Running the complete testsuite to check the sanitizers w=
ould require few hours. Hence, we had planned and implemented the ptest spe=
cifically for sanitizer support.

However, we will add it as part of the complete testsuite if that seems mos=
t profitable for everyone. Please let us know your views on the same so tha=
t we can work towards the same.

Thanks,
Deepthi

--hw5iktLN746IMek1gFFT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>Hi Richard,</div>
<div>&nbsp;</div>
<div><span><span><span class=3D"ui-provider a b c d e f g h i j k l m n o p=
 q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir=3D"ltr">Thanks for che=
cking the patch and your comment&nbsp;<br /><span style=3D"color: #333333; =
font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', =
'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji'=
, 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: norma=
l; font-weight: 400; text-align: start; background-color: #ffffff;"><em>"Wo=
uld it make more sense to run this as part of the other gcc testsuites?"</e=
m><br /></span></span></span></span>
<p><br />Definitely Yes. We can add the sanitizer tests as part of the exis=
ting gcc testsuites.</p>
<p>However, the sanitizer test was intentionally kept separate to avoid unn=
ecessary building and testing of sanitizers that are not required for most =
users.&nbsp;</p>
<p><span style=3D"background-color: var(--light-mode-body-color);">The curr=
ent activity was taken up when checking the sanitizers support for all targ=
ets. </span><span style=3D"background-color: var(--light-mode-body-color);"=
>This testsuite will just test the sanitizers support quickly within few mi=
nutes. </span><span style=3D"background-color: var(--light-mode-body-color)=
;">Running the complete testsuite to check the sanitizers would require few=
 hours. </span><span style=3D"background-color: var(--light-mode-body-color=
);">Hence, we had planned and implemented the ptest specifically for saniti=
zer support.</span></p>
<p><span style=3D"background-color: var(--light-mode-body-color);">However,=
 we will add it as part of the complete testsuite if that seems most profit=
able for everyone. </span><span style=3D"background-color: var(--light-mode=
-body-color);">Please let us know your views on the same so that we can wor=
k towards the same.</span></p>
<span><span class=3D"ui-provider a b c d e f g h i j k l m n o p q r s t u =
v w x y z ab ac ae af ag ah ai aj ak" dir=3D"ltr"><span style=3D"color: #33=
3333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto S=
ans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI =
Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style:=
 normal; font-weight: 400; text-align: start; background-color: #ffffff;"><=
/span><br />Thanks,</span></span></div>
<div><span><span class=3D"ui-provider a b c d e f g h i j k l m n o p q r s=
 t u v w x y z ab ac ae af ag ah ai aj ak" dir=3D"ltr">Deepthi</span></span=
></div>

--hw5iktLN746IMek1gFFT--

