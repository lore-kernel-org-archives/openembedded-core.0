Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 24F50601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 09:57:53 +0000 (UTC)
Received: by igvg19 with SMTP id g19so114368524igv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 01:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=i3KaHptbSbpUeCF+LIsne/lLJfYO6XcncKsjLDvwYGw=;
	b=BvAb9ipX+lvo0culqHY/2fCNIPZz3FRQrcOghwQbA3tDv1O8OQhMxPXFwBxCK8rPrk
	n6WcbCIWqj8Mjqo6jS7qLokb9llGsXbcD9LN9lgmu225V0YnUY1VTfrLJ6GqCD9g+fee
	8yJy1PbNS2PIDvwpJkNYHidFAWBZFkwml2yiTm1WMLzC/rgFjwtksT6/yJy2TT7E810E
	+y8Te3Eg9VUJvUjxKfDKlGSPqt85UPPyAl0vYBmAEIJZx9utsIt4I3q3cP9veiTI6L5b
	joL4R0wukpMc4utuo10eOmsUpCqBAeDHDMezUhxoTcrmytdlJVUITEmVir6vpvGtpZmu
	2cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=i3KaHptbSbpUeCF+LIsne/lLJfYO6XcncKsjLDvwYGw=;
	b=gDOCAIFn9T7xQq2cmLg2Niwbm/gONa8Rzc1jwogMuApDL3cchwqdtap2nyF5qSUfT/
	NECyrA4SC0HqXjup/wgLpJdlKqXie8ylfwsBwqzJoYdzVmpRqqYlL5hq9l1TBk+oZnHB
	ZKA+Ugigaqjy78hQGaNIIAmOU8ZfJEgD68G3fS394OFRM0CepuHs1bsU0AEg5bD5EZ/t
	Sp37XhSDz89G5d5QvDjPcHufgH9E3d6AtHv9E0hW8bbbnwGgMaHnt2jV50VfwQz80TYa
	5iLZTsSYZQpuDrC6gnLfO89+JpoNqRf9mJF1QwRMh1t0DCLiOzx1jAtEo8/J53Xno5bJ
	aZdg==
X-Gm-Message-State: ALoCoQlTvD/7XjVU6tDo70fcaK/JD7mRdBpv6ioHEdbkVYeHbenqzA1sN7VjUvXRLHhzEi6/Upsm
X-Received: by 10.50.28.102 with SMTP id a6mr1237164igh.52.1449050274515; Wed,
	02 Dec 2015 01:57:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 2 Dec 2015 01:57:35 -0800 (PST)
In-Reply-To: <565EBF04.6050509@windriver.com>
References: <cover.1449032673.git.hongxu.jia@windriver.com>
	<8e3c76d86f19c59b63908de6d7d9c2cc24858858.1449032673.git.hongxu.jia@windriver.com>
	<CAJTo0LaqebZA8akpdnAtFU2rJHsFX=1AxxtHWbq3JuEe5vBVyg@mail.gmail.com>
	<565EBF04.6050509@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Dec 2015 09:57:35 +0000
Message-ID: <CAJTo0Lag5J+cytX8C+Z7b8dmX65MZWJBV6JXQt=Ocwy==szenA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python: gcc optimization level 2
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
X-List-Received-Date: Wed, 02 Dec 2015 09:57:54 -0000
Content-Type: multipart/alternative; boundary=089e01538710dfe2940525e74e92

--089e01538710dfe2940525e74e92
Content-Type: text/plain; charset=UTF-8

On 2 December 2015 at 09:51, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> The root cause is the qemu didn't support gcc optimization level 3 very
> well.
>

Oh, so the problem only appears in qemu if you enable tuning that is known
to be broken in qemu?  I don't think we should apply the Python workaround
to oe-core as everyone will suffer for a configuration that is known to be
broken (and isn't enabled in oe-core).

Ross

--089e01538710dfe2940525e74e92
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2015 at 09:51, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFF=
FFF" text=3D"#000000">The root cause is the
   =20
    qemu didn&#39;t support gcc optimization level 3 very well.<br></div></=
blockquote></div><br>Oh, so the problem only appears in qemu if you enable =
tuning that is known to be broken in qemu?=C2=A0 I don&#39;t think we shoul=
d apply the Python workaround to oe-core as everyone will suffer for a conf=
iguration that is known to be broken (and isn&#39;t enabled in oe-core).</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--089e01538710dfe2940525e74e92--
