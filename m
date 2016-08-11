Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4D66077196
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 10:21:53 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id q83so1891389iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zIWCKtl+wmeAj6GHb9i3QeJOZEUxtYD80mcUOB9+Gdg=;
	b=uetRfXGP63D/ZrzjfukErpGcrRBZ/uaNHVSyrc7LMUMFzXKXpgx4BammGFyOtfGar4
	/P4cuIXFgARrkknfx76vv/imLZbUGCkeSrOnyQH5tN69kpn+x1H0h7MHik1PAInuf5NV
	5j64tSba4jj/7ZDIG4Amj2YNPan0Nhw5NDoXAWtvis4ao5hAS/AJqdhqBt7wonWSVQVS
	kyu8a+hknVKIvulqj0ZJu+EUf9IrC4oU6G93dV556zTkNsMALhUXGU9VDnfco77fFPEv
	o54mXjg/C+KGYiCfI88PtoRAPVZ9E/ya/aqlkPxHOuozqARQjcoQvrNS7nwPqPHWjD/Q
	MLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zIWCKtl+wmeAj6GHb9i3QeJOZEUxtYD80mcUOB9+Gdg=;
	b=CjBKSiIgA2TJOeN7jRNZqpYAqpFy6RUkRpbLH+D2Yj/UyU1KbAyP3U0RVWtJENhhTB
	7dLy/haC7+hThKSPG0kbCi487vzUXbK/HYYBv1VuGxD6W366lX/rrPMahdYWzpIGlljk
	E9PuHIRnmzJaD9gMvRcwvUsly8bfp1OaH8V/lUaBNOA1qqGD+p0+hHRmy9c+PBDNZUuj
	iE1TEOPwXTVI9HbPB+IzohbzT7w0gKRId84jykjE/HkPZ9fz4BoMCO/vAHSKmq1Qv7G0
	yye2GJnSe+fLR59NcuI1urCLNzn7DeDY3zvtWmc/uqiM7QvRwaUCIYy336ErjHzulCou
	Eodw==
X-Gm-Message-State: AEkoouuOoq8IyfQwvydK94Hl9gFjdr/TQFw7UquftVsqP/Zr8xie4kqhnAPtkQxRs8evFuLjKLLfiji10CWGhq3G
X-Received: by 10.107.154.196 with SMTP id c187mr10152941ioe.99.1470910914524; 
	Thu, 11 Aug 2016 03:21:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 11 Aug 2016 03:21:34 -0700 (PDT)
In-Reply-To: <1470786256-25154-1-git-send-email-akuster808@gmail.com>
References: <1470786256-25154-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Aug 2016 11:21:34 +0100
Message-ID: <CAJTo0Lap6sa53wkDi_dJr-yRZiGkwHc_fuDmt8OG5ob7tgyAeA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master] curl: Update to 7.50.1
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
X-List-Received-Date: Thu, 11 Aug 2016 10:21:54 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e8ea8100539c92230

--001a1140e81e8ea8100539c92230
Content-Type: text/plain; charset=UTF-8

On 10 August 2016 at 00:44, Armin Kuster <akuster808@gmail.com> wrote:

> This fixes 3 CVES:
>
> CVE-2016-5419
> CVE-2016-5420
> CVE-2016-5421
>
> Affects curl <= 7.50.0
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>

Master has 7.50.0.

Ross

--001a1140e81e8ea8100539c92230
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 August 2016 at 00:44, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":12g" class=3D"a=
3s aXjCH m15671b210bcad86f">This fixes 3 CVES:<br>
<br>
CVE-2016-5419<br>
CVE-2016-5420<br>
CVE-2016-5421<br>
<br>
Affects curl &lt;=3D 7.50.0<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">aku=
ster808@gmail.com</a>&gt;</div></blockquote></div><br>Master has 7.50.0.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a1140e81e8ea8100539c92230--
