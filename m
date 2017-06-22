Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 787B771B86
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 12:28:42 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id p21so10445314qke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rEg+uaDe1M61uDQTrsRkBy+SWau0CZ3Oz+dLYmS3qo8=;
	b=G118aP8jYAdKXBOr9D9UR1nd8STuam4KENLwMRi8PuWzkD8FMfG4IojfKWgcDPB/CA
	gAwytKgpNH7aYSrb8PAOwla0TxgM+t3vGJb4s07QNVmsVAqQSEeNbfL5NSotwZUKKKb7
	pwcLtI28xj0ND/BFRIQPHXCzAD/6UANOIBoovqYEir6NM5US6yv9GPR/KyDVoWnPkjz8
	ZqsHwqsP3OwoTDSBSie1HAsY5qhFPF2VuruEVWmHcgEH1/hsfi25J5kTjzoICCZ0Z4MX
	9C536+L54/6ug7PLhm/+MRafS8PaRGb+Hgq//SiHzSjkPfHGdPtqGb2jbE2vvzTXxT4V
	Uoeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rEg+uaDe1M61uDQTrsRkBy+SWau0CZ3Oz+dLYmS3qo8=;
	b=psOZbtMG5zgG0snyg+sPcPk9MRaugPYSb0KJUlZR2uGa47zoPXnJSLri1DFQa8L/Cm
	a6CUgNcuAtjG6DDl0ltqlSGfxYanUg64oYT6mKCuswAQDorlesZW2jQ+5JjIEw2ky0YN
	aZkFtzVshAbFO7WdHUsYH+ZQLoDwH7/skcnMtyOWTAz7nyLl1l70nPiWqJsdQ3D9EqMn
	CV81dKcYBxfbu5ZuAihYuMk5j5AMcCN2q8zA37+kE/1iSZZC+fdgzfWCuCa/7dspnebb
	YufN3yDgRn9vDlto2ktdhSLsN+e+fLyzowTw42BaObIFGaHwET0FTQnVXJM9BkxP8+Bu
	DKHw==
X-Gm-Message-State: AKS2vOwfWS7uZzAyisAcMmeGMURJdt4bhqFqjHDp5p/PYF2aaaCkAU3z
	Ra0foBFmGJfCsd4Quj+EOjWGlSablskK
X-Received: by 10.55.102.84 with SMTP id a81mr2458517qkc.154.1498134523433;
	Thu, 22 Jun 2017 05:28:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 22 Jun 2017 05:28:23 -0700 (PDT)
In-Reply-To: <1497645034-3917-1-git-send-email-lgonzalez@us.ibm.com>
References: <1497645034-3917-1-git-send-email-lgonzalez@us.ibm.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jun 2017 13:28:23 +0100
Message-ID: <CAJTo0LYQofRmeO+-BAb+VZGQ7AUJvwdvBt4YYJJNy1cJVskquQ@mail.gmail.com>
To: Leonel Gonzalez <lgonzalez@us.ibm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] rng-tools: Add service file and systemd package config to rngd
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
X-List-Received-Date: Thu, 22 Jun 2017 12:28:44 -0000
Content-Type: multipart/alternative; boundary="94eb2c05760e18690305528ba0ad"

--94eb2c05760e18690305528ba0ad
Content-Type: text/plain; charset="UTF-8"

On 16 June 2017 at 21:30, Leonel Gonzalez <lgonzalez@us.ibm.com> wrote:

> +PACKAGECONFIG[systemd] = "--with-systemd=${systemd_
> unitdir}/system,--without-systemd,systemd"
>

Wouldn't you want this to respect the DISTRO_FEATURE so its enabled in
systemd environments?

Ross

--94eb2c05760e18690305528ba0ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 June 2017 at 21:30, Leonel Gonzalez <span dir=3D"ltr">&lt;<a href=3D"=
mailto:lgonzalez@us.ibm.com" target=3D"_blank">lgonzalez@us.ibm.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2fa" class=3D"=
a3s aXjCH m15cb29a46a3204cd">+PACKAGECONFIG[systemd] =3D &quot;--with-syste=
md=3D${systemd_<wbr>unitdir}/system,--without-<wbr>systemd,systemd&quot;<br=
></div></blockquote></div><br>Wouldn&#39;t you want this to respect the DIS=
TRO_FEATURE so its enabled in systemd environments?</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c05760e18690305528ba0ad--
