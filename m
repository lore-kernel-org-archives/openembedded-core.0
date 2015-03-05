Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9080B65C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 10:57:59 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id x12so1061708qac.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 02:58:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HIMdEdD+yoOIR7NZYdxWR+y5UyQcODfHZ4JZpRmjtUo=;
	b=MptI2x47OfS6jwHq7gWEAyWXMrj7JPJ73tC0+2xZ5pn4+tYGVxmsNp992h8TVTJcxs
	XVf3mplvi61iSQ2qUW1avAQmnuiE87VYVmSQfUhy7KSoz4dOSlI0D3eyfv/dDzTNMYxy
	CkuaDnchI+J7YMFV5ES8goXPQt7/xrKDaXnrxWTJws88qYmrX8Xuem0TNO/tvCWZJyky
	L2I8m6rgnokLNySz0hQyXaIkJT1Uya6jd52weVa7dIIcll21iEfa7mYYMwrAu6RZR+oS
	vo1OupGlEH63lXad8g6y0d7dOHkehRK3zRH67LtSbdNidbwuFlljJX+PH/hduc907YO6
	JF0g==
X-Gm-Message-State: ALoCoQkf7/8CJxgOGi7YaJEVrqzRcbBPfvqYCLHUcfibNLrGmOTdCGIzeW2R1L+NkhYR1DaFH0dP
X-Received: by 10.140.43.199 with SMTP id e65mr11401811qga.34.1425553080499;
	Thu, 05 Mar 2015 02:58:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 5 Mar 2015 02:57:40 -0800 (PST)
In-Reply-To: <1425518629-19739-1-git-send-email-raj.khem@gmail.com>
References: <1425518629-19739-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Mar 2015 10:57:40 +0000
Message-ID: <CAJTo0LZSLk5tewPiw5WiTMsdFybSQ0Yp43PkKewKz8WPs0pX4w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] tcmode-default: Define one gdb version
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
X-List-Received-Date: Thu, 05 Mar 2015 10:58:02 -0000
Content-Type: multipart/alternative; boundary=001a113a9baaf8eaca0510887037

--001a113a9baaf8eaca0510887037
Content-Type: text/plain; charset=UTF-8

On 5 March 2015 at 01:23, Khem Raj <raj.khem@gmail.com> wrote:

> +PREFERRED_VERSION_gdb-cross-${ARGET_ARCH} ?= "${GDBVERSION}"
>

ARGET_ARCH? :)

Ross

--001a113a9baaf8eaca0510887037
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 March 2015 at 01:23, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":36q" class=3D"a3s" style=
=3D"overflow:hidden">+PREFERRED_VERSION_gdb-cross-${ARGET_ARCH} ?=3D &quot;=
${GDBVERSION}&quot;<br></div></blockquote></div><br>ARGET_ARCH? :)</div><di=
v class=3D"gmail_extra"><br>Ross</div></div>

--001a113a9baaf8eaca0510887037--
