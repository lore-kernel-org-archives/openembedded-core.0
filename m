Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8B0CC73159
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:25:59 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id x71so7400511qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zrIBJtqOuZ+x0gnRNpIUAM7XFX+1pDrsM40KJnejs50=;
	b=eRGKX4NMAp2D4/hM6VhQfnCEjveQ0Lg1oFIXOnk929UWcdJs0fy3L47xXz+HLmIoWk
	IdzkL7cuGhwV5jnhOo1/noQ7+G5JJm1A1KPIJc5qEzZbRXuAfjYmp94s/DREKgmmMZTz
	lzU0nvxlf6g1oShUcCeZqQQHoMe+Z3SYaJlhGnsPXMVDdYQnl09boaMJSw+flcqJRe0v
	u1K6KsEJpWa2zFxtw/IXHTu8x16Nl1ezUQTxhn5F9sRD3ZOT0c8oN+lGtUI2+rshv8YK
	pHugaAuoGG8QRAi0uat/tlJh1HkQ29wir32f3+Mbrv7icJtdaYNenX6MlCF4pViJScXl
	4y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zrIBJtqOuZ+x0gnRNpIUAM7XFX+1pDrsM40KJnejs50=;
	b=sO6iFzT18c9X1Iu69Zb0Q/gQgQytBESTAK5466KiPoeXE93piGVj3v1PSErLgt1RhS
	OkCHEXTt5l2z6Txsu5Ur7I+GpBsgWZ87AOUhOTCJOOXtr+TbzmRJmMCIwApEN4kUemn6
	bzV7DlTYvMrPcsKUd2HpaAg1D5C2nXxvJlc/KQZlYVilPaI8zv+6HMlg8KpKnFuhfyJl
	Po8Tbk6o/8hDdzfHogbAeN3tCzDCrpVe4G8cRQHI1LE2wXg/mUtlEP0+hcvZvqfmqeCO
	CHtkLtNr9tClGlljueM1RPVyPePkdlHtJJBqSW2sKv55RxaDlpVJbYCFhsWEB4jjLIOf
	kpKw==
X-Gm-Message-State: AMke39mJ7h0jBUdwplotiCy6FAwKImRPVicQzIaZWPMaCqnQSYRXBjb8PRQ4dK61RwkPENAu5+WIwMMZp5i4aIn5
X-Received: by 10.55.183.133 with SMTP id h127mr34285502qkf.121.1487780760321; 
	Wed, 22 Feb 2017 08:26:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 22 Feb 2017 08:25:39 -0800 (PST)
In-Reply-To: <1487780656.2292.3.camel@iki.fi>
References: <20170203070635.30804-1-tanuk@iki.fi>
	<CAJTo0LYdKoaFzbD2St_S3w7CAaGFXCyHDu8AXfphkeM0LvgOcw@mail.gmail.com>
	<1487780656.2292.3.camel@iki.fi>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Feb 2017 16:25:39 +0000
Message-ID: <CAJTo0LbzYExoBP59L73M-EuEaTNW7KpfKpVe-t83z-b4WRKPtA@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: 9.0 -> 10.0
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
X-List-Received-Date: Wed, 22 Feb 2017 16:26:00 -0000
Content-Type: multipart/alternative; boundary=94eb2c060056b93dcf054920f345

--94eb2c060056b93dcf054920f345
Content-Type: text/plain; charset=UTF-8

On 22 February 2017 at 16:24, Tanu Kaskinen <tanuk@iki.fi> wrote:

> I'll investigate it. I'm not familiar with the topic, though, so I'll
> first have to figure out some basic stuff: What does it mean to have
> "relocations in .text"? Why is it a bad thing to have those? How can I
> check if a binary has relocations in .text? If you have quick answers
> to any of the questions, that would be helpful.
>

https://wiki.gentoo.org/wiki/Hardened/Textrels_Guide is useful.

Ross

--94eb2c060056b93dcf054920f345
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 February 2017 at 16:24, Tanu Kaskinen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:s=
olid;padding-left:1ex"><div id=3D"gmail-:8fz" class=3D"gmail-a3s gmail-aXjC=
H gmail-m15a66a35ab48314e">I&#39;ll investigate it. I&#39;m not familiar wi=
th the topic, though, so I&#39;ll<br>
first have to figure out some basic stuff: What does it mean to have<br>
&quot;relocations in .text&quot;? Why is it a bad thing to have those? How =
can I<br>
check if a binary has relocations in .text? If you have quick answers<br>
to any of the questions, that would be helpful.</div></blockquote></div><br=
><a href=3D"https://wiki.gentoo.org/wiki/Hardened/Textrels_Guide">https://w=
iki.gentoo.org/wiki/Hardened/Textrels_Guide</a> is useful.<br></div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c060056b93dcf054920f345--
