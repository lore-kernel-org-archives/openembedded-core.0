Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 659A177060
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 12:25:56 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id 1so127913309ion.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 04:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kj3jaN93/nqUrrgdvb4eEYx9/N5T8a3AA5U2VngsH7M=;
	b=XUZ4pOFyu/RHbf+5GyXxyaUPGp7nk1VeJG2zFTDqzo5mQMUjKKRuRhAfVm95MlYbVL
	PsS7nCOhu0T9RCBTJqW17g3lDfvWOaZKy4Vt4b9IChmTYjkkS2DZUzIj/PNK6w68k08/
	hc9r2KswcAwsUtpQfL9H2mzaTWEymQSXBtuIkMtbP/c5CbshtGP8Agf7yP1OUO34beIp
	9QcqHD3KWQgZhDWaoqIYE4uRAu28F+isEojmH+B6/UgzkS07aPKUnczEPeoPFDVCKHwx
	dm8AdTP6OZZryuvC7G7omxkFGepL4/eQNIaEd3q1HTfSQQr/w0mhejBZPJ/sof7LyYfU
	6EUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kj3jaN93/nqUrrgdvb4eEYx9/N5T8a3AA5U2VngsH7M=;
	b=ivHLmzU5Pg4mISXmXG7Lhkaq20h8OxIARKezLzKkAILCAAncvXfDLoYHc2pfDkWdn9
	8qnG99Eylnp77SRPqdxDWQW3OjoRdIbfdEYEW9ogJ6M1fZ2YYCcMLEy4R0bCclfu3/pK
	Q1ISrLgQGFUklGNavPa5vrhMPB9wUq6fBoDL/WETpT8cXIzKN8LDQEi5UybdRP6UAsQn
	tSl1H30p+muR0SwFDkdF9NOw7HFzBzKssyeJr/+Iew1ADOfyDy240TEeyLTQwOOvq93D
	PeSw511EB7o4zUcGp2MIfhhiD/v6gfDjrvmt8OLECZzK14AIRvvy87Zgx8vT6ca15+dg
	IaHg==
X-Gm-Message-State: AG10YORKz3wTb8a7Gh+6qV0qImTJr1IS/qA2qbrMX+gyVN37dTDJdck5Q57tL+KOmONFm+LqEAVnpPz4U9YoJDle
X-Received: by 10.107.3.154 with SMTP id e26mr11349570ioi.99.1453638356890;
	Sun, 24 Jan 2016 04:25:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sun, 24 Jan 2016 04:25:37 -0800 (PST)
In-Reply-To: <20160123183615.GA32740@zardoz.amer.corp.natinst.com>
References: <1453486432-24073-1-git-send-email-brad.mouring@ni.com>
	<CAJTo0La_+cYqBCVy384W4cXTGk322TRj7c+zJGHw9kBH+msPoQ@mail.gmail.com>
	<20160122232539.GA28611@zardoz.amer.corp.natinst.com>
	<CAJTo0LYZ8qx_f8n2MfFprP6YKSSY8D=bAbdoAuShWkXtE4kVdQ@mail.gmail.com>
	<20160123183615.GA32740@zardoz.amer.corp.natinst.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 24 Jan 2016 12:25:37 +0000
Message-ID: <CAJTo0LZcE+n2hLr0xTtjQmtWoVLtKS9DTQTqOfHG0hDLgSe1cw@mail.gmail.com>
To: bmouring@ni.com
Cc: Brad Mouring <brad.mouring@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: Add patch to fix Win10 mDNS issues
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
X-List-Received-Date: Sun, 24 Jan 2016 12:25:56 -0000
Content-Type: multipart/alternative; boundary=001a113ec10ae50f07052a138da3

--001a113ec10ae50f07052a138da3
Content-Type: text/plain; charset=UTF-8

On 23 January 2016 at 18:36, <bmouring@ni.com> wrote:

> Good enough reasoning for me. As I noted, I was on the fence anyway.
> Comment
> to that effect in the recipe, simply leave it to the commit message, or
> some exotic ${bb shell} conditional include?
>

Just put it in the SRC_URI in avahi.inc, we already apply a number of
patches there.

Ross

--001a113ec10ae50f07052a138da3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 January 2016 at 18:36,  <span dir=3D"ltr">&lt;<a href=3D"mailto:bmour=
ing@ni.com" target=3D"_blank">bmouring@ni.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div id=3D":y8w" class=3D"a3s" style=3D"overflow=
:hidden">Good enough reasoning for me. As I noted, I was on the fence anywa=
y. Comment<br>
to that effect in the recipe, simply leave it to the commit message, or<br>
some exotic ${bb shell} conditional include?</div></blockquote></div><br>Ju=
st put it in the SRC_URI in avahi.inc, we already apply a number of patches=
 there.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a113ec10ae50f07052a138da3--
