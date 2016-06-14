Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id C1763607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 09:55:12 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id e5so62818648ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 02:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CVr2Ousu9pp5hoCU9IH+VrLC94E2bKejgO936gfnVIs=;
	b=U2Swy8QFZK8jjnIu7gppj8JoI2wY3EdIqCDR5YQrReUu5iGBGfcjCE+rGYmea7dBwF
	QQ7B+n0okiQ1gH+wn5pYGp76neAWbW5g8IejNECNJD8Vz1SDaVPRCqESvWho4othmU/7
	lGmN6OugTJ91ODh3ECXwuvEvxp/AW7rVsWhiMxleNMeRLxsg2k9iAS/8XOwQtP04ZfpL
	tcPVe23Bq79Rh4N+5CTla9JeGYnJ6DNCZHGBLdqb88M9acjqqLlaU/oua/5vswGTr6yw
	xpvkYBgBEif4WwY5pey/uolxW2qO11gWypC76z8U/CA9sKy3aDMAC1SaD7rOFx/oHSnp
	CQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CVr2Ousu9pp5hoCU9IH+VrLC94E2bKejgO936gfnVIs=;
	b=AW9Kiv/KERngE8HxhUfrO3LffUbiPRhcW94jfNVmWuY0yORqZYKFLpuTdHUq0KIFpc
	8GqmbvWtPRpgoirSDCuT+1TNawMIRP0EaoqPoy/CwJoVgegncjnSaH5PIeqRtDmiAfad
	8VUg3hNlf2VbjdmrnHx+viqdCjitOFrO/2BEnZ5T9uvadGYPFobeDnnbruGbfWfT50B/
	np+D6bdQkAyEWDWUHlpzUddSie+9852/eS38CWkHQCm4z2WeMDLyrJfi7/ESrwFnsst6
	7I7rxWRr4XWKQAQSjN1ZyyZYFqFK8H1JUF6fBSTBISL8LjjuM2cHjqupEbwaLCQ0PNLV
	ftBw==
X-Gm-Message-State: ALyK8tKwx3zqry6xL41uRkuCPLPqMBvu2AtJCgJbwPZOmbHb+gtfv6SGWFcJzBEsI+YoakU7zPWADEqF3qk7nXQt
X-Received: by 10.36.57.211 with SMTP id l202mr25429128ita.22.1465898112944;
	Tue, 14 Jun 2016 02:55:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 14 Jun 2016 02:54:53 -0700 (PDT)
In-Reply-To: <20160614045058.GB22248@mbabyjoh-desk.ger.corp.intel.com>
References: <cover.1465719878.git.liezhi.yang@windriver.com>
	<4f1364dec6b9be5b84991ed3811d4ce0172087ae.1465719878.git.liezhi.yang@windriver.com>
	<20160614045058.GB22248@mbabyjoh-desk.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Jun 2016 10:54:53 +0100
Message-ID: <CAJTo0LajbXtK=Ag9+7fOtOWZab-nz_m=M8o8-sA10gE-LsJsOg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/11] gnu-efi: 3.0.3 -> 3.0.4
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
X-List-Received-Date: Tue, 14 Jun 2016 09:55:18 -0000
Content-Type: multipart/alternative; boundary=001a114ab3ca4c9f6505353a0085

--001a114ab3ca4c9f6505353a0085
Content-Type: text/plain; charset=UTF-8

On 14 June 2016 at 05:50, Maxin B. John <maxin.john@intel.com> wrote:

> gnu-efi-3.0.4 build failed on qemux86-64 (Build host Debian-8.5)
> http://errors.yoctoproject.org/Errors/Details/69406/
>

I also see the same error on intel-corei7-64.

Also note that the makefiles produce the message "/bin/sh: 1: /usrgcc: not
found", which is because $prefix is exported.  Adding prefix[noexport] =
"1" in the recipe solves this.

Ross

--001a114ab3ca4c9f6505353a0085
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 June 2016 at 05:50, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><span class=3D"">gnu</span>-<span class=3D=
"">efi</span>-3.0.4 build failed on qemux86-64 (Build host Debian-8.5)<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/69406/" rel=3D"nor=
eferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details/69=
406/</a><br></blockquote></div><br>I also see the same error on intel-corei=
7-64.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Also note that the makefiles produce the message &quot;/bin/sh: 1: /usrgcc:=
 not found&quot;, which is because $prefix is exported.=C2=A0 Adding prefix=
[noexport] =3D &quot;1&quot; in the recipe solves this.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114ab3ca4c9f6505353a0085--
