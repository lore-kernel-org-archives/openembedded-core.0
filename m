Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 09D5B772D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 12:20:38 +0000 (UTC)
Received: by igvi2 with SMTP id i2so34774679igv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 04:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EgeYniHqIFYvrvQ64hoNMir1XKRr6TICe18G2wTFB/U=;
	b=veUPM5PphQ1fv2JpjtVgLCefJTtaLwo/niEod2kXfwnebYNrmtIN4wjYcwn9o1XPjj
	IHzHnm+ceTpzrkiRQPwDd6vlinR0noabtZkeTlX7+WINzBOV2nHCpiiEwj8tE25+akOg
	VeDiPvS30k9U14+OZsS3qaU0mdJz313dNWRSpAYMrx2P84f5Lwd0i7+m7IlO3JNwKiaW
	kqfO0viwkWqzRHWUETbMxxr2jAwyKYNfpGDYewZwQjVmtuOFGpWBjj7lyIDJ0sVu58sA
	PQCmuWi1UQ+sSndyPbZ6bjhQZdExgKP/So/2cRXReTXjdIrRlQOa/mXRi/EzJPxMpRQ+
	yYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EgeYniHqIFYvrvQ64hoNMir1XKRr6TICe18G2wTFB/U=;
	b=J7pP9gnQ+68mK4Sl0RD7cQm4ejAdKC/wOmBS1NWiLnAUjq/d/z1w92pLfKsAHW7PcK
	+lnVtc+4eNpprHSiOlQwcHFvOPVHfAtFXm13OaBXDGu8Rm7dCvQVmnhkwM0eGG5boN7o
	c8HfNiiYKsH7dRJjfGGOOw6RzLutf2Le+2ovwDRd7CAUSPxpoQcm+UKRxDIwwH2xzZGS
	/Y88GXEJr+lZNSnS1QLZkVdZBxUzKkEeys/h5RmWHToP6ZEJ2vQxhAZnfN5GquwrCZdS
	OWiB6M2RoKktiP9L9A5SF1X6TUIeXzuHk7v3sCAjoccR4vnWtz/9MtDFI0RjgZ8+b4JD
	8ySg==
X-Gm-Message-State: ALoCoQnnJ4vqMERTseS3kcTD9+t2PnKELDDJUgfFdTpqefypFgSRWobTpFAaO4eEsnafs+TmsmxR
X-Received: by 10.50.59.211 with SMTP id b19mr292001igr.64.1447417238673; Fri,
	13 Nov 2015 04:20:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 13 Nov 2015 04:20:19 -0800 (PST)
In-Reply-To: <E6C2BE5A-51EC-4D69-A685-6C00173B022C@gmail.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
	<CAJTo0Lb7w0XAJ-H-T2Uz-mdmjUZGFX9wQyzCUJ_4bU8re9rswQ@mail.gmail.com>
	<A2AEDEA2-FB1D-4D6F-8B2F-F420AC123C9B@gmail.com>
	<CAJTo0LYOMeiaie9=3i908aAj3H4U0_qSdf7RmXSofosBMzcW9w@mail.gmail.com>
	<E909DBB3-5F90-4E81-949D-93E7D3960988@gmail.com>
	<CAJTo0LYqWk_2oqjFxZ44b+yAfAq8c_a1QiCH5erFKTmFvxg-Kw@mail.gmail.com>
	<CAJTo0LYa6-gOECqfbfDZeDXcJKwMNesiUR9Z-N7j0bxKK-pjhw@mail.gmail.com>
	<E6C2BE5A-51EC-4D69-A685-6C00173B022C@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Nov 2015 12:20:19 +0000
Message-ID: <CAJTo0LZsH7A7vjZNDQ4BBNYheanAG=k0YTTjkSqO3oMMD=xKHQ@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Fri, 13 Nov 2015 12:20:43 -0000
Content-Type: multipart/alternative; boundary=047d7bd757585a789205246b164a

--047d7bd757585a789205246b164a
Content-Type: text/plain; charset=UTF-8

On 13 November 2015 at 12:18, Jens Rehsack <rehsack@gmail.com> wrote:

> Since we both didn't see something, I send a v2 with PARALLEL_MAKE = ""
>

I'm not letting a makefile defeat me! :)

Ross

--047d7bd757585a789205246b164a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 November 2015 at 12:18, Jens Rehsack <span dir=3D"ltr">&lt;<a href=3D=
"mailto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":3o" class=3D"a3s" s=
tyle=3D"overflow:hidden">Since we both didn&#39;t see something, I send a v=
2 with PARALLEL_MAKE =3D &quot;&quot;</div></blockquote><div><br></div><div=
>I&#39;m not letting a makefile defeat me! :)</div><div><br></div><div>Ross=
=C2=A0</div></div></div></div>

--047d7bd757585a789205246b164a--
