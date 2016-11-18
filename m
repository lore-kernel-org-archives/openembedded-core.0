Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9B24B601A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 13:00:14 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id w33so155570246qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 05:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ST0rd6vFNHFXJWhMLkyZkvzzSk7YkyAJ6agz/e82//A=;
	b=evJplV4W5MUC9eyiBWIdVjV3NynS25emsF7WKZJvrgTkfxPJ+cecy58cVd2E0YQAnt
	z7oLAU5FqV/KfTUZ97s3yFToKev/w1Mcfd1X58/VWFxH0Ziqdp7FchY8Jqx+emXYGU/0
	TbfcaV3yD26eBrDx0Ze1H1Cd538+WCMrfL3sWloJiN1keBIyMRjAB6nwMXzdASf56gkj
	yvAaBqEwnp/jmlnqEGo+ARMq8d53XmRWNCf5o18vAzHxZIAd/t6YdozKWNRBGjkU98A+
	WVPb4Au3UXB+P0ixbMDk1okrrHWVlgME3oKOb3YSoFX4z6ilgQbKhb9mZxT/3BNff7rp
	P6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ST0rd6vFNHFXJWhMLkyZkvzzSk7YkyAJ6agz/e82//A=;
	b=QYXiAKvSevVhEvF9zBRmJZBnjsKtU5vsxrEBeWBsbzQ9/Vp7vi97Rv6pmxs/GUCunv
	RoidtOkEslXCs8pUZPLWZ4WsgnjczMcwwdzVvvgcg9G8Nu7UOn5BU620686ObQHqClkn
	4kVIMopbuKOdV3VXeYBwWUhTO5ebnWtsjvlh/Fs/LBeSPBoj2pRSpWLGwcRxAG8sswE2
	2lmBZAVuJbmYu1wpisbIuHr6MfEf1jrzOEohc4ZM1oC9W2C7nQbs07f8Rgj8/2FpmvoQ
	2zCO9FeQpzXBv8dMxWohnWi0F3f7Twz3tf3UDrp20E0WOPpuMsDdqINpwrxHtpLj6lFc
	qJIA==
X-Gm-Message-State: AKaTC01kFiqs3Wh3MyV27r/0I5aOnKW/0F++lIoMclo7CjzIi6jSoLXh2vX+T31qS5YcLL8M26w5BUM/7IBpeU/u
X-Received: by 10.237.49.230 with SMTP id 93mr5918004qth.109.1479474015417;
	Fri, 18 Nov 2016 05:00:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Fri, 18 Nov 2016 04:59:54 -0800 (PST)
In-Reply-To: <475C95148A21B945A7A18605A8298B991028E82D@fmsmsx107.amr.corp.intel.com>
References: <1479257423-4281-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
	<CAJTo0LbxF0sdYqmK3ttUyaiyTPmg+ME9qbSS1NnpcA4H7iQLaQ@mail.gmail.com>
	<358803d5-7678-9c6e-2017-9007263d02d5@linux.intel.com>
	<475C95148A21B945A7A18605A8298B991028E82D@fmsmsx107.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Nov 2016 12:59:54 +0000
Message-ID: <CAJTo0LZZ2bV3NpkPyWdwkSuoiYACpo2oze69a49GEN99Y9Yoxg@mail.gmail.com>
To: "Pedraza Gonzalez, Francisco J" <francisco.j.pedraza.gonzalez@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Test needed to verify postinst script order.
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
X-List-Received-Date: Fri, 18 Nov 2016 13:00:14 -0000
Content-Type: multipart/alternative; boundary=94eb2c1251e224e518054192e322

--94eb2c1251e224e518054192e322
Content-Type: text/plain; charset=UTF-8

On 17 November 2016 at 18:20, Pedraza Gonzalez, Francisco J <
francisco.j.pedraza.gonzalez@intel.com> wrote:

> Ross: Could you please give more details about PACKAGE_CLASSES?, I am not
> very familiar with.
>

See
http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html#var-PACKAGE_CLASSES

By setting it to "package_rpm package_ipk package_deb" you'll be build
packages for all formats, and then rotating the value so each format is
first when you build an image it will be built with each type of package.

For example:

for classes in ("package_rpm package_deb package_ipk",
                      "package_deb package_rpm package_ipk",
                       "package_ipk package_deb package_rpm"):
  PACKAGE_CLASSES=classes
  bitbake()
  qemu()

Ross

--94eb2c1251e224e518054192e322
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 November 2016 at 18:20, Pedraza Gonzalez, Francisco J <span dir=3D"lt=
r">&lt;<a href=3D"mailto:francisco.j.pedraza.gonzalez@intel.com" target=3D"=
_blank">francisco.j.pedraza.gonzalez@intel.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padd=
ing-left:1ex"><div id=3D"gmail-:2pw" class=3D"gmail-a3s gmail-aXjCH gmail-m=
15873850a2ae3072">Ross: Could you please give more details about PACKAGE_CL=
ASSES?, I am not very familiar with.<br></div></blockquote></div><br>See <a=
 href=3D"http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html#va=
r-PACKAGE_CLASSES">http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manu=
al.html#var-PACKAGE_CLASSES</a><br></div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">By setting it to &quot;package_rpm package_ip=
k package_deb&quot; you&#39;ll be build packages for all formats, and then =
rotating the value so each format is first when you build an image it will =
be built with each type of package.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">For example:</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">for classes in (&quot;package_rpm pack=
age_deb package_ipk&quot;,</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;packag=
e_deb package_rpm package_ipk&quot;,</div><div class=3D"gmail_extra">=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;package_ipk package_deb package_rpm&quot;):<br></div><div class=3D=
"gmail_extra"><div class=3D"gmail_extra">=C2=A0 PACKAGE_CLASSES=3Dclasses</=
div><div class=3D"gmail_extra">=C2=A0 bitbake()</div><div class=3D"gmail_ex=
tra">=C2=A0 qemu()</div><div><br></div><div>Ross</div></div></div>

--94eb2c1251e224e518054192e322--
