Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 57A2A7810E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 12:16:08 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id t26so178287647qtg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aSJt/TLs4JNO5DiKkWvwicTcfzz/YxA3EP8tu45tOrY=;
	b=p6Ih6WrJ3aLTv8GkiV/7RTyJf8JoAo4YV7ULjkn/0anKkKFbdDHtMtVYj3n4tdJ6TU
	7QqhXpURwuVF7bnJ2x9fyYI+1bcXn/xoRzSbrvXYLVeskVB8vY+0QAhKhj7+8EJf2f2w
	jfe4B7cEVf8q+cXD+Ds4wjcQiuQzyhZfYBzbttDpoqVNV3CT+aOHRFyiZ6Zm+Jrhkdvo
	/T/eYOSC/nEKWB4k2Yt/1H9ipsWl6ZwZ+uaOejzRRxEJ89G7p3nNod2hCxrRf92zEXbR
	X+GeVM8+2OmHacpNDgCvwHxgbvK77fynFNcBL8nnJm7Gzyx6+B/xJM04Pvx7BJuteGAt
	0L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aSJt/TLs4JNO5DiKkWvwicTcfzz/YxA3EP8tu45tOrY=;
	b=bGft5QagYVdqTt/tl2MYhXdt2E8Ng/zPyM4p/43aYooWKcdHIgElK79pzRfbhTIBni
	Xx0bfXvKmprYyCrXwCcLve9bpx1n/pde3kA/0hfxn6d6zfP0S2cANcR6lMkyPpJsBklA
	zRsLvb5GYw4L+HiE8oThkFX10Np5IV1vzXEdCm9riwnx00qdbLdCii/jKuh9SjE86zPy
	M6RMq+etyzEQWLq+pPCe98/LtNcKINDiUPWp0bF8LySyEU6arDhCj8bfOiUmtxXkiCWg
	/Y45oBOvelZGJm4CS3IR5+YqBjN8kbkjI1NHjZRDrqECAhOUwMcIlPbpYtGLsN5qfiYl
	tspQ==
X-Gm-Message-State: AODbwcAclcsG9kZDbs9ZwlkFbl2Xeo4tSqGFk5pQeZrVeLvrGgmfvz89
	TtmaJM7fu1yTrxHUyjMtXFuO9KRFCT+C
X-Received: by 10.237.36.101 with SMTP id s34mr41331341qtc.137.1495714570332; 
	Thu, 25 May 2017 05:16:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 25 May 2017 05:15:49 -0700 (PDT)
In-Reply-To: <CAJTo0LYipxZN4VK25oKEcPH4=PUw3BJUQG-W14h8+T7N2P+_1w@mail.gmail.com>
References: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
	<1494933979-5139-8-git-send-email-dv@pseudoterminal.org>
	<CAJTo0LYipxZN4VK25oKEcPH4=PUw3BJUQG-W14h8+T7N2P+_1w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 May 2017 13:15:49 +0100
Message-ID: <CAJTo0LaMqnc=yG995vd7vqiHaA9jA4xYtUiSEr065vWVsG0p5Q@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] gstreamer1.0-omx: upgrade to version 1.12.0
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
X-List-Received-Date: Thu, 25 May 2017 12:16:09 -0000
Content-Type: multipart/alternative; boundary="001a1145bee8a677710550582ff5"

--001a1145bee8a677710550582ff5
Content-Type: text/plain; charset="UTF-8"

On 25 May 2017 at 13:15, Burton, Ross <ross.burton@intel.com> wrote:

> I presume you build without api-documentation as with Poky I get this
> error:
>

Oh, this happened *before* your patches were merged.  Clearly this is a
combination the autobuilder doesn't exercise. :(

Ross

--001a1145bee8a677710550582ff5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 May 2017 at 13:15, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I presume y=
ou build without api-documentation as with Poky I get this error:<div></div=
></div></blockquote></div><br>Oh, this happened *before* your patches were =
merged.=C2=A0 Clearly this is a combination the autobuilder doesn&#39;t exe=
rcise. :(</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a1145bee8a677710550582ff5--
