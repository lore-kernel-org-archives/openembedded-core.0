Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 34EAE60043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 14:24:14 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id bi2so116646593igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 07:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jgcYW6yLMMA/5YYmz5lgFAT9brIR+vNREWBwh2DmpOw=;
	b=sxpImuhp1l0Wc95fST+OAf6wJ27AYhVUsQJn1UL/3sPKfP9cWOYimqAn4W9go9t4wX
	vJMQZWXY9lrdaWWPRIKNOpFkMGGZDN2XcRWLbdSqi73eT4IGqyApNS98tQeB3lBMN4/L
	kIgxOcEn1JWNISvlxlZ+5MQlXG0s1/tVUh94Qczv9WPvDoPD2NjvT/D7EH9QZ6GPlDX+
	sVpsEmD+Dzo9BT9cdx0sVSRDkk1DPf7CASEXL3uimudIg8yDmQhLSnLBpoF3N025pHiq
	7UC/Oyx4QOoITvrd105lwyKUv5vSUcgo/NqV2OIOBuG5C6mP5OtmkVcKdkAjJyBYK6nM
	NGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jgcYW6yLMMA/5YYmz5lgFAT9brIR+vNREWBwh2DmpOw=;
	b=CYlU26BsH522IcFcDdd7Ppf4OoIc+NZBO8sct7qQpKYTfr1LlqpjiJ02Ba1PUZLJd7
	c38XSv4ohOWKNiM77AsXdxjc374EDxDhvGNi5TXOjD/j3bRTNbfgFgwvamLuTDLgNU0d
	4FJYuH1KALiT+HTXdf85GiemfS4raHgfFL3lCEdWLANXRoS4h/ohWvUFQ324x5HEjgYU
	sM9oTtKmABj3VO6faX2S9/Fo7rR/5uDdFEWVibT5tCK9mdXwRAaSg2rjnSL3cSzs300M
	sBaVbLhqLCOZBopHm61U8+0tQboUKkV8A5AmvXpRBvJHj7nIHvuAIxRg9otB3mFnr34a
	nv6A==
X-Gm-Message-State: AOPr4FUpwm4zftTN2Bm3KUmrwgxSIHKGZSm8YnczAx3AqYGeoIsWcWm0vsE1kwb+MlH4mQgxzP3NmXR8Myqq0poE
X-Received: by 10.50.62.20 with SMTP id u20mr3157333igr.52.1463667854041; Thu,
	19 May 2016 07:24:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 19 May 2016 07:23:54 -0700 (PDT)
In-Reply-To: <CAP9ODKpwMT+EOwF6qx_wUoaGrKCwYgt6P0WjrnWJk1cHPSQP1Q@mail.gmail.com>
References: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
	<1463589648-28641-14-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpwMT+EOwF6qx_wUoaGrKCwYgt6P0WjrnWJk1cHPSQP1Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 May 2016 15:23:54 +0100
Message-ID: <CAJTo0LZf+hOsGv=zLWK6-z1M7HmmdAvLoF4=XuEO1ckdMeHW5w@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: Re: [oe-core PATCH v8 13/13] core-image-weston: If X11 is enabled, add XWayland support
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
X-List-Received-Date: Thu, 19 May 2016 14:24:15 -0000
Content-Type: multipart/alternative; boundary=047d7bdca606828377053332bac4

--047d7bdca606828377053332bac4
Content-Type: text/plain; charset=UTF-8

On 18 May 2016 at 22:35, Otavio Salvador <otavio.salvador@ossystems.com.br>
wrote:

> As discussed on IRC, instead of XTerm - which is not included on
> OE-Core - we could use Xeyes as an utility to show it is working. What
> do you think? Do you want me to send a v9 changing it or do you change
> it when applying it?
>

Thanks to Wayland's so-called security xeyes is far less amusing under
Xwayland. I've changed it to matchbox-terminal for now.

Ross

--047d7bdca606828377053332bac4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2016 at 22:35, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@o=
ssystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":csv" class=3D"a3s aXjCH">As discussed on IRC, instead of XTerm - w=
hich is not included on<br>
OE-Core - we could use Xeyes as an utility to show it is working. What<br>
do you think? Do you want me to send a v9 changing it or do you change<br>
it when applying it?<br></div></blockquote><div><br></div><div>Thanks to Wa=
yland&#39;s so-called security xeyes is far less amusing under Xwayland. I&=
#39;ve changed it to matchbox-terminal for now.</div><div><br></div><div>Ro=
ss=C2=A0</div></div><br></div></div>

--047d7bdca606828377053332bac4--
