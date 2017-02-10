Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id B84B56E630
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 10:55:00 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id s186so34757245qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 02:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xASw6wL35oVHrw5b02HLuyFUHtmKTWkhxO1dboZDhBQ=;
	b=dTFoUEDJl70TJkb/lDf/gRet7jqtvmPeg3z3m5caNPSCSx3FtW557rsbONrHE2Ec/A
	rXXlOHs7uFSHwMQHzSzupcrmnk4kOFpTXRuH8kyX1Moc9Dldf1URh4Gw1pUVeUsAuCnZ
	/mQh27XySZvHQzFbN4Pe85CKIEKE/M0PjLmSJvt0iXcjhKyhh7pSuVLEfb8aR1Poqo2+
	irX6Gi0umvADX8KXGQBmaw77Bd62eZwkcxj2PWQUx/hoJ4jiW8qMOZQtRsPzgbO7ndF7
	R3wr8fIJtfGHFbWH9gA/lJbqTv0roK03XByLiGbtOFmfFdAJISwE5xQasdLr68VOGqwt
	CfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xASw6wL35oVHrw5b02HLuyFUHtmKTWkhxO1dboZDhBQ=;
	b=qA3V4UhPWF8UQZB56i1dGoWcRjY+23siau58L2ddPjSyZRdsG4vJvSTRAeah0JWBEP
	ftLxIAah2Oz08CLiGI8nTTaMB0GEcUNwlTBAC01FQzL4u+5C6nIjHVcN7kmlXGDxk2e0
	YViER4eI0ogfLj2cdYBrZJ1XKpLOFIsb/66PsYl5x9JWZQpI6BkRtUrrgpwUSErK29gL
	WOv+/hPdwrgm5Dbt72lrcoMJfDynY61kjJsGGhvtp6lXl4jUZXChiysboq/Ka5lds10x
	kORyzPB2TyKCl+y1pmi0ZY+IhaLfXQpeiLOpNi7/TNMYpL/2zvK6b/llBiQZXBchB9oQ
	7Hhw==
X-Gm-Message-State: AMke39kj3ZpT2bo59f0GEQ5D8N5zeeEFPyEuS02q48e4hhN8aMthG91oEaY1HHl09h1V4XAszVtzzlbXJgceKIwM
X-Received: by 10.55.16.11 with SMTP id a11mr8429886qkh.3.1486724100545; Fri,
	10 Feb 2017 02:55:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 10 Feb 2017 02:54:40 -0800 (PST)
In-Reply-To: <f3c4e388c57e638701c92b4a152817d77b6bc469.1486622007.git.hongxu.jia@windriver.com>
References: <cover.1486622006.git.hongxu.jia@windriver.com>
	<f3c4e388c57e638701c92b4a152817d77b6bc469.1486622007.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Feb 2017 10:54:40 +0000
Message-ID: <CAJTo0LbJHaDUaF3AWzSYyOFCcCH0yYutEctaQ_p7xt+cKyktHw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 11/13] bash: update patches for 4.4
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
X-List-Received-Date: Fri, 10 Feb 2017 10:55:01 -0000
Content-Type: multipart/alternative; boundary=001a11475cbce4734305482aed54

--001a11475cbce4734305482aed54
Content-Type: text/plain; charset=UTF-8

On 9 February 2017 at 06:45, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> +do_install_append_class-target () {
> +       # Workaround do_package_write_rpm failure
> +       rm ${D}${libdir}/bash/uname
> +}
>

This isn't target specific as it also breaks nativesdk builds (
http://errors.yoctoproject.org/Errors/Details/131136/).  To be honest I'd
prefer to fix the problem in rpm (or the build of this binary) than work
around it.

Ross

--001a11475cbce4734305482aed54
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2017 at 06:45, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D"gmail-:115" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m15a219f6d24915e0">+do_install_append_class-<wbr>=
target () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Workaround do_package_write_rpm failure<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${libdir}/<span class=3D"gmail-il">bash<=
/span>/uname<br>
+}<br></div></blockquote></div><br>This isn&#39;t target specific as it als=
o breaks nativesdk builds (<a href=3D"http://errors.yoctoproject.org/Errors=
/Details/131136/">http://errors.yoctoproject.org/Errors/Details/131136/</a>=
).=C2=A0 To be honest I&#39;d prefer to fix the problem in rpm (or the buil=
d of this binary) than work around it.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a11475cbce4734305482aed54--
