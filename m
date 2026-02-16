Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B306E7BDB0
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 12:47:52 +0000 (UTC)
Subject: Re: [PATCH] rust: Enable dynamic linking with llvm
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.222.206)
X-Originating-Platform: Windows Chrome 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 16 Feb 2026 04:47:48 -0800
References: <20260212165035.1806068-1-sunilkumar.dora@windriver.com> <DGFOJOHDE058.3VTWCLZHYPGPD@bootlin.com>
In-Reply-To: <DGFOJOHDE058.3VTWCLZHYPGPD@bootlin.com>
Message-ID: <920657.1771246068933375972@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="D8usDZPmygaavNXyvOLQ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 12:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231196

--D8usDZPmygaavNXyvOLQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 10:05 PM, Mathieu Dubois-Briand wrote:

>=20
> | --- stderr
> | llvm-config: error: libLLVM-21.so is missing

Hi Mathieu,

Thanks for the report and logs.

I=E2=80=99ve looked into the issue and was able to reproduce and debug the =
failure.
It turns out to be related to the multilib configuration.

I=E2=80=99ve identified the appropriate fix and am preparing a v2 update, w=
hich I=E2=80=99ll send out shortly.

Best regards,
Sunil

--D8usDZPmygaavNXyvOLQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Sun, Feb 15, 2026 at 10:05 PM, Mathieu Dubois-Briand wrote:</div>
<div>
<blockquote>| --- stderr<br />| llvm-config: error: libLLVM-21.so is missin=
g</blockquote>
<p data-start=3D"0" data-end=3D"13">Hi Mathieu,</p>
<p data-start=3D"15" data-end=3D"61">Thanks for the report and logs.</p>
<p data-start=3D"63" data-end=3D"293">I&rsquo;ve looked into the issue and =
was able to reproduce and debug the failure. <br />It turns out to be relat=
ed to the multilib configuration. <br /><br />I&rsquo;ve identified the app=
ropriate fix and am preparing a v2 update, which I&rsquo;ll send out shortl=
y.<br /><br /></p>
<p data-start=3D"324" data-end=3D"345" data-is-last-node=3D"" data-is-only-=
node=3D"">Best regards,<br data-start=3D"337" data-end=3D"340" />Sunil</p>
</div>

--D8usDZPmygaavNXyvOLQ--

