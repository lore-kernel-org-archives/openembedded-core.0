Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 081366013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 16:27:29 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id w59so10966383qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 09:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=3yK/9F8Bea+j4rIljA4bJLeFUvsaQi/d1ftsnUq3wkY=;
	b=y44nkRp0ZMFgW7lnfodiYML6xxa2BJ+GSOud7Aw47a0puFOAU4EWJva9I0b6JDLPET
	OIP+miUKdmzcvuplcgQTEiXrmLh/2LHkRb9oRwnHUu+Hz0+peyNNEvNy81uxUSjvtZvP
	VtB7tUNylvOUt9xDfJFIiklSADIaaIZSawjnCfakfbiPhuZzJxYc56gSg6GdygW1XVeN
	36S9FsD0C1Ur6YA4tYdp0CNu8sw5MFN+rqWrXi9+PBOWxsIIH5BNGTsWy3rIyuBONQ8a
	PI2dFob6lPjn+8UkjC/EsSUuMATlVg+kT7dUjVkAbfpgcvsedwcn33ZqMZ2Ll3UP+tJ1
	VbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=3yK/9F8Bea+j4rIljA4bJLeFUvsaQi/d1ftsnUq3wkY=;
	b=enSqLMHYSQeD3m5R4wx53zlrVdeJh/p/0KLlTB6FS0HFiRi/BL4qNseIOLmOqF5Nlw
	uuap5BGH5SlaItsZCvkU4xgsC863xU3ffsgas0BCEv4ZBneCd9Mmrz14uKux+JJRX6Bv
	VcZ6bcJVI9rn1v94zQFWAuxuSBkLhYCml+Demqgb2dFWoEzHcB/J8KwwqW7zifXGB555
	hWl3J6LtNHxCZ1C+9e3f/G0cjQNPePXnTbCKBYfw1fTRPG+WmOMVUoe9r+OrDXVTTPCL
	2IoOwHGW7xS7tvij5E6DrCnQ2/fM4CB57jgJhSZZTXgLTl5WqnihFb8m5aTjZ+Rt4HJj
	WLGA==
X-Gm-Message-State: ALyK8tLTxoW22KivcU3i9ZiU3G8L//n3hdANuiDjZ/EfxU+uCtj7JpIm0YZMVjRFgC4LyJI07XUCq8L79nY5XA==
MIME-Version: 1.0
X-Received: by 10.200.49.50 with SMTP id g47mr1587074qtb.76.1467908850222;
	Thu, 07 Jul 2016 09:27:30 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Thu, 7 Jul 2016 09:27:30 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Thu, 7 Jul 2016 09:27:30 -0700 (PDT)
In-Reply-To: <20160707053905.GA28068@openSUSE-i7.site>
References: <20160702081927.7365-1-raj.khem@gmail.com>
	<20160707053905.GA28068@openSUSE-i7.site>
Date: Thu, 7 Jul 2016 09:27:30 -0700
Message-ID: <CAMKF1spS0OSZ=aWRP+ZJPkcBPn=SfMrgP=uA9SvR8CmNiXm4PQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] glibc: Upgrade to latest tip of master
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
X-List-Received-Date: Thu, 07 Jul 2016 16:27:30 -0000
Content-Type: multipart/alternative; boundary=001a1143a4de948c5405370e29e6

--001a1143a4de948c5405370e29e6
Content-Type: text/plain; charset=UTF-8

Is it specific to x86-64

On Jul 6, 2016 10:38 PM, "Trevor Woerner" <twoerner@gmail.com> wrote:

> Even after applying this patch, I'm still seeing crashes in Chromium (which
> aren't there before the glibc update to 2.24)
>
> I wish I could understand why Chromium is crashing, but everything else
> seems
> to run okay. I wouldn't be surprised to find Chromium is doing something
> funky; but what, exactly, would be nice to know.
>

--001a1143a4de948c5405370e29e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Is it specific to x86-64</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Jul 6, 2016 10=
:38 PM, &quot;Trevor Woerner&quot; &lt;<a href=3D"mailto:twoerner@gmail.com=
">twoerner@gmail.com</a>&gt; wrote:<br type=3D"attribution"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Even after applying this patch, I&#39;m still seeing crashe=
s in Chromium (which<br>
aren&#39;t there before the glibc update to 2.24)<br>
<br>
I wish I could understand why Chromium is crashing, but everything else see=
ms<br>
to run okay. I wouldn&#39;t be surprised to find Chromium is doing somethin=
g<br>
funky; but what, exactly, would be nice to know.<br>
</blockquote></div></div>

--001a1143a4de948c5405370e29e6--
