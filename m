Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
	[209.85.222.47])
	by mail.openembedded.org (Postfix) with ESMTP id 62EC27FBA1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 10:48:35 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id q16so1882406uao.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 03:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fZ6tYCPWzG9EdlTMRzcvyvWgH/hTt3wviKAH7aHQ3U8=;
	b=sz6LmdqFK0cu+CYuura2NDYNUGLGkLhzI7lYJ0oxAljkZMakntqEXYvT6ikdvPnrdl
	4FK4Oj7/MbB8LPDeiZGExxRUkNuZvyTpCx/af8gD1t2rs5sD9SgeF3Vf4A0mY6HeMgSw
	ua7eecVcfHf+98eQvAhSz/gt2t3BkvtRfvr/D2q84vZF04vlFj6dZwxhBvnA/6simALt
	OF9d3bPynd/xHP9i6enpKBUe8A7pfbYWTBwIq+pUhzdkhK9zxl3YKc/+M3m/IpcNBW/6
	V2BXGm6DjT7Fij8nEbjDKK/DysJ5E+beqfChNOVc6B6KQTAXXaYTmwnWaVRtLsWN2kjY
	ou/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fZ6tYCPWzG9EdlTMRzcvyvWgH/hTt3wviKAH7aHQ3U8=;
	b=Qo9qaGTnNqfBHKlmECSOFEuQdRn8QjAzxhIplK/HERBGwbsRNtYK93OKtIlFrgmdLu
	r2QAV/G/l2YIjGwa4wr8da7A6uKzJTyg7UhzJDbI6CTZUCox1rvMRiNifVcnS3zo5BNQ
	nRtgf03GonGE1OIXG44RfWlkGGWkQqsFD0JLFani3qHf+I9meoVR+FWLT5NRTkePFr4i
	Fy4y0eSKNgydXe5UFaeOPH4xF/G5bQ9EHjmzd1M6aMYWaTlUp+C75MrdY7M6Zn3/T/YD
	cm8Spial6pP6S4cFD8DxJrCT1C48aa4+HysrorDFFb8oJ2AHveyuWH7AaCnWMC6dzSKd
	w8GA==
X-Gm-Message-State: APjAAAXfFdqntTIW7frIJ9D9toa5Z34VsnqULKemqRcSNSWHWejrSBo4
	ItD2AdYHETJiCdyK8O0jzA4z0JikC8X8y3Rfg3g=
X-Google-Smtp-Source: APXvYqxCfLOLMEoleewU1fO2hIaZeohfEv2rMQGO7qgAcnfqEPIObmYfjg6hcrzzOpiu9yUe7R8gfGQFGI/M4vWKcjw=
X-Received: by 2002:ab0:2907:: with SMTP id v7mr2774601uap.89.1572173316050;
	Sun, 27 Oct 2019 03:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <a5bb0fd6ed961516f649139e41cbdddf42ce17e2.camel@linuxfoundation.org>
In-Reply-To: <a5bb0fd6ed961516f649139e41cbdddf42ce17e2.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 27 Oct 2019 11:48:23 +0100
Message-ID: <CANNYZj8z-mRj8zjT4RbXURipZVmDT94KeVROVov2hM9i4=cyqg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: qemu rebuild contamination
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
X-List-Received-Date: Sun, 27 Oct 2019 10:48:35 -0000
Content-Type: multipart/alternative; boundary="0000000000000755090595e22023"

--0000000000000755090595e22023
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Oct 2019 at 10:58, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> The reason is that when configuration changes, autotools.bbclass will
> wipe out ${B} however qemu doesn't use the autotools class and hence B
> is not cleaned for changes in configuration.
>
> We could abstract the pieces of autotools.bbclass which do this into a
> separate class, or, easier, have qemu's do_configure wipe ${B}.
>

Thanks for looking; I had noticed before that when qemu's PACKAGECONFIG
options change, it rebuilds very quickly - I assumed qemu's build scripts
know what they do and rebuild only the needed pieces. Somehow, I had never
hit the problem of resulting binaries mismatching the configuration in
local tests.

Alex

--0000000000000755090595e22023
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 27 Oct 2019 at 10:58, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
The reason is that when configuration changes, autotools.bbclass will<br>
wipe out ${B} however qemu doesn&#39;t use the autotools class and hence B<=
br>
is not cleaned for changes in configuration.<br>
<br>
We could abstract the pieces of autotools.bbclass which do this into a<br>
separate class, or, easier, have qemu&#39;s do_configure wipe ${B}.<br></bl=
ockquote><div><br></div><div>Thanks for looking; I had noticed before that =
when qemu&#39;s PACKAGECONFIG options change, it rebuilds very quickly - I =
assumed qemu&#39;s build scripts know what they do and rebuild only the nee=
ded pieces. Somehow, I had never hit the problem of resulting binaries mism=
atching the configuration in local tests. <br></div><div><br></div><div>Ale=
x<br></div></div></div>

--0000000000000755090595e22023--
