Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6190C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 13:49:03 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.86667.1718718543352004933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 06:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l1irRYXn;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7041e39a5beso3995836b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718718543; x=1719323343; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4sDzCUCgo76rxAPSwDECDYEwkQ2Rlqyy3cJk5MVGQx4=;
        b=l1irRYXn8jLtGrrmEtoKCTN3uBYq8jr/1bQf6hhPA5YmHF8DEjOB3yxRqB21emuym+
         SmssdSNK/buI6F4O7hNSCeB0b3yhmwGNrJJY8kMbceSwopbxC2YWrri95Mw/Mvyfsmpt
         0lVRBRCm477bFpJDE1Cdqhtxxt9TjgWYnURc36UadYkXmVK5vaD4l+xwdRv2aZBntRwT
         DnVVHlOIgrvV9osMzyVR9APrMddQ/Y4uXEU8csvueXnWPzIRbzL7VwPdm7HIi2AhNTiD
         NeWCyxGYgPgEtSXSlERiJa6HNmaR3HD1mznKcJSm+9e+4FvwUM8LycvkinBx7qM2OB/9
         e6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718718543; x=1719323343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4sDzCUCgo76rxAPSwDECDYEwkQ2Rlqyy3cJk5MVGQx4=;
        b=FHBOLL2IAbEM5jsDDG+7TwccS9yV+tciLaOZv4YX5oaP+XounY7ryfYkSxz1Q/zQ71
         8dLssROmvre//lvdMLl1CYanuQnzXnePa+YwZQZ+R9v+Fs7itQF63DJj+tC3B0xeDPmZ
         t3tHkQR7L3Wq161rJhQ6+51dKaQSJ7kST10ruYM9ygPXBuXPf4RjsKBubRiyeEsPvE/L
         N6iX+2d0PQxhEXWwvXRL8FnljUyq8SLKu2XcIyC4l8VM7yWnDb3o59pTuN6yftjQRjsc
         LYwpLAJnbZRQXOWXwituASVLiln0dP562hD0QCl+AG80o6U2vw/gBxUZuWD6r4ZAQHTk
         VOSw==
X-Gm-Message-State: AOJu0Yx6X9if8jtvrEBQTrPo86G/GNKMiSzQhQks1MEnvBaRRPY26Y+B
	FRG6xkG+a4b1R0ih3UBc7rEUoPovqpSSPdQHecVTNoHlo5W7JuLMX8n6q23YYgexcbZzOq4a2h0
	QlQo05izb1CIXV6UuND+eNZZdaJc=
X-Google-Smtp-Source: AGHT+IHW29t5Z8e1B9ZyqrTyWfCqADU4x0whCV7Eqe3JmTlQUVTKKEHvDwzmumBHF+2eXRxzMa0LBdsgCSUhtAWLank=
X-Received: by 2002:a05:6a20:2446:b0:1a7:bb6d:6589 with SMTP id
 adf61e73a8af0-1bae821ff3bmr13972328637.29.1718718542492; Tue, 18 Jun 2024
 06:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR22MB176117D8743C536E8A1C85DAB7C12@BY5PR22MB1761.namprd22.prod.outlook.com>
In-Reply-To: <BY5PR22MB176117D8743C536E8A1C85DAB7C12@BY5PR22MB1761.namprd22.prod.outlook.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 18 Jun 2024 15:48:51 +0200
Message-ID: <CAApg2=Ta-oxj0+POOHacDkvEzqd1ZvgQeGrhZfJLRwoU2+mWeA@mail.gmail.com>
Subject: Re: [OE-core] gnupg CVE-2022-3515 #kirkstone
To: ccasciato@21sw.us
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"hongxu.jia@windriver.com" <hongxu.jia@windriver.com>, 
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000031bc97061b2a581d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 13:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200870

--00000000000031bc97061b2a581d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 12:51=E2=80=AFAM Clayton Casciato via lists.openemb=
edded.org
<ccasciato=3D21sw.us@lists.openembedded.org> wrote:

> Hello!
>
> "OE-core CVE metrics for kirkstone on Sun 09 Jun 2024 02:00:01 AM HST"
> reports CVE-2022-3515 <https://nvd.nist.gov/vuln/detail/CVE-2022-3515> as
> "unpatched", as do local builds with "cve-check".
>
> NIST lists GnuPG as vulnerable from 2.3.0 to 2.4.0, which is why this is
> reported as a CVE.
>
> This vulnerability was fixed in Libksba 1.6.2 (upstream issue
> <https://dev.gnupg.org/T6230>, upstream patch
> <https://dev.gnupg.org/rK4b7d9cd4a018898d7714ce06f3faf2626c14582b>).
>
> meta/recipes-support/gnupg/gnupg_2.3.7.bb
> <https://git.openembedded.org/openembedded-core/tree/meta/recipes-support=
/gnupg/gnupg_2.3.7.bb?h=3Dkirkstone> DEPENDS
> libksba
>
> meta/recipes-support/libksba/libksba_1.6.4.bb
> <https://git.openembedded.org/openembedded-core/tree/meta/recipes-support=
/libksba/libksba_1.6.4.bb?h=3Dkirkstone>
>
> I manually verified the upstream patch exists in the fetched
> libksba-1.6.4.tar.bz2.
> $ sed -n '185,190p' libksba-1.6.4/src/ber-help.c
>
> Should this CVE be added to
> meta/conf/distro/include/cve-extra-exclusions.inc?
>
>
Hello,
From what I see, this is the NVD entry that is wrong, as it mentions this
CVE for gnupg, while the original advisory
mentions libksba only. And so does the direct CVE entry.

For now, use CVE_STATUS, but only in your gnupg recipe. We do not need this
one to be visible globally,
and the NVD entry for the libksba is correct.

You can notify NVD that the entry is wrong by writing at the address that
is linked at https://nvd.nist.gov/vuln/detail/CVE-2022-3515
in the Are we missing a CPE here? Please let us know
<cpe_dictionary@nist.gov>. part.

I've fixed in the overrides repo.

Kind regards,
Marta

--00000000000031bc97061b2a581d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 14, 2024 at 12:51=E2=80=
=AFAM Clayton Casciato via <a href=3D"http://lists.openembedded.org">lists.=
openembedded.org</a> &lt;ccasciato=3D<a href=3D"mailto:21sw.us@lists.openem=
bedded.org">21sw.us@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg8082186604548595=
020">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hello!</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
&quot;OE-core CVE metrics for kirkstone on Sun 09 Jun 2024 02:00:01 AM HST&=
quot; reports <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-3515" id=
=3D"m_8082186604548595020LPlnk184553" title=3D"https://nvd.nist.gov/vuln/de=
tail/CVE-2022-3515" target=3D"_blank">
CVE-2022-3515</a>=C2=A0as &quot;unpatched&quot;, as do local builds with &q=
uot;cve-check&quot;.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
NIST lists GnuPG as vulnerable from 2.3.0 to 2.4.0, which is why this is re=
ported as a CVE.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
This vulnerability was fixed in Libksba 1.6.2 (<a href=3D"https://dev.gnupg=
.org/T6230" id=3D"m_8082186604548595020LPlnk274212" title=3D"https://dev.gn=
upg.org/T6230" target=3D"_blank">upstream issue</a>,
<a href=3D"https://dev.gnupg.org/rK4b7d9cd4a018898d7714ce06f3faf2626c14582b=
" id=3D"m_8082186604548595020LPlnk767851" title=3D"https://dev.gnupg.org/rK=
4b7d9cd4a018898d7714ce06f3faf2626c14582b" target=3D"_blank">
upstream patch</a>).</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/recipes=
-support/gnupg/gnupg_2.3.7.bb?h=3Dkirkstone" id=3D"m_8082186604548595020LPl=
nk337654" title=3D"https://git.openembedded.org/openembedded-core/tree/meta=
/recipes-support/gnupg/gnupg_2.3.7.bb?h=3Dkirkstone" target=3D"_blank">meta=
/recipes-support/gnupg/gnupg_2.3.7.bb</a>=C2=A0DEPENDS
 libksba</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/recipes=
-support/libksba/libksba_1.6.4.bb?h=3Dkirkstone" id=3D"m_808218660454859502=
0LPlnk948742" title=3D"https://git.openembedded.org/openembedded-core/tree/=
meta/recipes-support/libksba/libksba_1.6.4.bb?h=3Dkirkstone" target=3D"_bla=
nk">meta/recipes-support/libksba/libksba_1.6.4.bb</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I manually verified the upstream patch exists in the fetched libksba-1.6.4.=
tar.bz2.</div>
<div style=3D"font-family:Aptos Mono,Aptos_EmbeddedFont,Aptos_MSFontService=
,monospace;font-size:12pt;color:rgb(0,0,0)">
$ sed -n &#39;185,190p&#39; libksba-1.6.4/src/ber-help.c</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Should this CVE be added to meta/conf/distro/include/cve-extra-exclusions.i=
nc?</div><br></div></div></blockquote><div><br></div><div>Hello,</div><div>=
From what I see, this is the NVD entry that is wrong, as it mentions this C=
VE for gnupg, while the original advisory</div><div>mentions libksba only. =
And so does the direct CVE entry.</div><div><br></div><div>For now, use CVE=
_STATUS, but only in your gnupg recipe. We do not need this one to be visib=
le globally,</div><div>and the NVD entry for the libksba is correct.</div><=
div><br></div><div>You can notify NVD that the entry is wrong by writing at=
 the address that is linked at <a href=3D"https://nvd.nist.gov/vuln/detail/=
CVE-2022-3515">https://nvd.nist.gov/vuln/detail/CVE-2022-3515</a></div><div=
>in the <small><a href=3D"mailto:cpe_dictionary@nist.gov">Are we missing a =
CPE here?  Please let us know</a>. part.</small></div><div><small><br></sma=
ll></div><div><small>I&#39;ve fixed in the overrides repo.</small></div><di=
v><small><br></small></div><div><small>Kind regards,</small></div><div><sma=
ll>Marta<br></small></div><div>=C2=A0</div></div></div>

--00000000000031bc97061b2a581d--

