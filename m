Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3F77460234
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:51:14 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id k131so4480940ith.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 06:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4EmtWt0yaD44JUQ7BJYI0VurQ7vdH2akJtLoDKuyBeU=;
	b=t0TnzN/2mJuzHJNp1jxylerAe0m1IVDFzRh7RU2D52jWoA7mj+MwR2QXx0Zh4/8O5P
	BCG687tk8HBMhjf10u5uUgsHbcl4WtHMGPE13fwSl4nTGRTMrlOL/1eOpeJAplyRczRZ
	ZauXhhCFt+fopYKll4YnoXgqAW6copnGDsf+bvMNU97pojty6QClUIbgourW1vXu21uW
	CesMBpDswnw35ymEYUqILSs710pnEcEcEeMA8nDJT3zxS4zuEL6nPckvVO8bkDe4MuZd
	L+I4GduCj+y7jQe/8oVg39nFGtv8jIrscn3KH1uO0KgD2Mr/8cE+N2RlJWuTfEnEhc2A
	XaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4EmtWt0yaD44JUQ7BJYI0VurQ7vdH2akJtLoDKuyBeU=;
	b=chCiCtsC7k6XYYjI6tbUBqcESpIiqDhYqOvEpPhqLhnfTBqaTnCEGbE1wW4d+pzxIv
	Gn6n+EPVE4VdVzUWjy3oQ3r+KBuifEjrkSF8XrEsyT9EN+N0ySOet0O/M26AerUD6yW/
	3UVLXtf1j9ivOjnka2mUWl71thYSswyBrQJ4V22KDSOtWCixu0k9fwnK/k5v3w7fIo5A
	dwU3jPf+bVBtCed2uiMn02AlqQZ9j5MREi/SlR+R3XTYc5nvfzK5YUEW2sNAn0EypI1z
	i1J82BbE2BA81doof3gz226fPK/5Zw1F5qdIEBOc5lG8uR+beFpRphfW1xSeHs5OYF7X
	J/Zg==
X-Gm-Message-State: AKwxytc7C6yUeqmVemDWBZdth6B1pDrgQ2PQwMRGKIKwJJupQD8yKGl7
	+OSQvIvSPRSK6eJ4a8wfz6QRvnKTgOtZCWkgdqkfpA==
X-Google-Smtp-Source: AH8x227qXbvB3QV1WusNECuP0dX36JfnUtnpsUZlouMaJ8AKuJyF1v0++dH1kFMEduZX76e66nMC2V0pJ2/lmUfPh0A=
X-Received: by 10.36.185.84 with SMTP id k20mr6736545iti.124.1517496676193;
	Thu, 01 Feb 2018 06:51:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Thu, 1 Feb 2018 06:50:55 -0800 (PST)
In-Reply-To: <8c548149-e116-4b1f-8bfc-86099ac32e93@elfin.de>
References: <8c548149-e116-4b1f-8bfc-86099ac32e93@elfin.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Feb 2018 14:50:55 +0000
Message-ID: <CAJTo0Lbb8jH_uyoiD4OsBgf8xsMOdz8a1CjCkoBmKmTwF_3q+g@mail.gmail.com>
To: Piotr Lewicki <piotr.lewicki@elfin.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: recipe using environment variable does not refresh / rebuild
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
X-List-Received-Date: Thu, 01 Feb 2018 14:51:15 -0000
Content-Type: multipart/alternative; boundary="f403045d96c2552651056427baa6"

--f403045d96c2552651056427baa6
Content-Type: text/plain; charset="UTF-8"

On 1 February 2018 at 14:46, Piotr Lewicki <piotr.lewicki@elfin.de> wrote:

> Hi,
>
> I have a problem with forcing rebuild of the recipe depending on the
> environment variable.
>
> In my recipe I have an anonymous python function that obtains the env
> variable and depending on it sets some other internal variables (needed by
> swupdate recipe):
>
>
> python() {
>     origenv = d.getVar("BB_ORIGENV", False)
>     u_boot_enabled = origenv.getVar("ADD_UBOOT_TO_UPDATE", False)
>
>     if u_boot_enabled == None:
>         bb.warn("Not adding u-boot to the image")
>     else:
>         bb.warn("Adding u-boot to the image")
>         d.appendVar("SWUPDATE_IMAGES", " u-boot.imx")
>         d.setVarFlag("SWUPDATE_IMAGES_NOAPPEND_MACHINE", "u-boot.imx",
> "1")
> }
>
>
> My issue is that there is no difference when I either set or unset my
> environment variable "ADD_UBOOT_TO_UPDATE".
>
>
> Can you point me a solution how I could force checking this variable and
> rerunning/rebuilding the recipe?
>

Can't you use a variable set in local.conf instead?

Ross

--f403045d96c2552651056427baa6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 1 February 2018 at 14:46, Piotr Lewicki <span dir=3D"lt=
r">&lt;<a href=3D"mailto:piotr.lewicki@elfin.de" target=3D"_blank">piotr.le=
wicki@elfin.de</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
I have a problem with forcing rebuild of the recipe depending on the enviro=
nment variable.<br>
<br>
In my recipe I have an anonymous python function that obtains the env varia=
ble and depending on it sets some other internal variables (needed by swupd=
ate recipe):<br>
<br>
<br>
python() {<br>
=C2=A0=C2=A0=C2=A0 origenv =3D d.getVar(&quot;BB_ORIGENV&quot;, False)<br>
=C2=A0=C2=A0=C2=A0 u_boot_enabled =3D origenv.getVar(&quot;ADD_UBOOT_TO_U<w=
br>PDATE&quot;, False)<br>
<br>
=C2=A0=C2=A0=C2=A0 if u_boot_enabled =3D=3D None:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn(&quot;Not adding u-boot =
to the image&quot;)<br>
=C2=A0=C2=A0=C2=A0 else:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn(&quot;Adding u-boot to t=
he image&quot;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar(&quot;SWUPDATE_IMAGE=
S&quot;, &quot; u-boot.imx&quot;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVarFlag(&quot;SWUPDATE_IMAG=
ES_<wbr>NOAPPEND_MACHINE&quot;, &quot;u-boot.imx&quot;, &quot;1&quot;)<br>
}<br>
<br>
<br>
My issue is that there is no difference when I either set or unset my envir=
onment variable &quot;ADD_UBOOT_TO_UPDATE&quot;.<br>
<br>
<br>
Can you point me a solution how I could force checking this variable and re=
running/rebuilding the recipe?<br></blockquote><div><br></div><div>Can&#39;=
t you use a variable set in local.conf instead?</div><div><br></div><div>Ro=
ss=C2=A0</div></div></div></div>

--f403045d96c2552651056427baa6--
