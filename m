Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 220A877BB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 08:46:41 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id i34so59851580qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 01:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r7K6nStJCSUhZGZ4v8EhsNdLHOZWisldgZcaZBKL3o4=;
	b=b5qNvZuuHyFVl3dJWGq9ElQVNLbCW2P3HfffbYvINrRyL/CZzJIwjGgkJbfGz+RgLX
	7s0+ia+5cAZjxQ/yvGJZY3zFl6l+swdlSFjJjeg0N1JKZQcnehtoEfhAywYxTLHgqA10
	btO6GRQNSu5Gfo5g+blqgU2eyNmt3X/SX6R8sGNXzuM21i3Rbo1OK0kM0PbgtIoos6GY
	OiS8KUwTiFCmiaqMYMd6tuHDYLlfvp0q3Xu7ODcKzKnqf9bX8Fi80VzB3Sq0Hsmf3zEq
	6UvRGJ484BimLbKC1KV34jpF/++ElfWCKetcwdZ1vXCXjxQKWNzwsalSSzbOpzj1Qfc7
	a30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r7K6nStJCSUhZGZ4v8EhsNdLHOZWisldgZcaZBKL3o4=;
	b=PHiRFk08eqS2xxEjrN4Rc4CCVoKL8s/+pQ+A9+sg+TBMiOnbz/dcb2Sp3YtU9VsCpu
	nAKfXVvGQEivSFCMNNXS8K5MwO37t2MC6MotXV1/8T5MWRjNbIRVRbUyC0BaZl5jEI1G
	KX5seUVOjFvdUg2qVngV+sY7BNzkh826Gu3c+m0gj4jwY5x2y0hjfacoFpBKybusvPrH
	ezULvD5++7pphTvhLyDJJqwL8EwNNU0IMkpUEfTMb9Je6vFOnZPyRqL6jRKM5Rj49/CF
	9gvxo3NhDpKJacwdXvtJXV+yxMBI2fE1k/x+nVu5n1WupoyxrLn1lwG7kLjB+mgO0Fdx
	zsxw==
X-Gm-Message-State: AFeK/H3vnuQLKtwo0jNZx+e6dcdeYSkvIby6IzKuk9Y884QBoUPir7rw5jQARvdDLLptMcP9wNlVOc8N+TWRYeAz
X-Received: by 10.237.43.69 with SMTP id p63mr1573444qtd.68.1490950002946;
	Fri, 31 Mar 2017 01:46:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 31 Mar 2017 01:46:22 -0700 (PDT)
In-Reply-To: <1490946226.18519.36.camel@codethink.co.uk>
References: <1490789493.18519.18.camel@codethink.co.uk>
	<CAJ86T=VYpCkzddgtVkT++N+gxj5oi8iuzb29Cm9N_0=7RrG_1A@mail.gmail.com>
	<20170330080955.GA403@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0Lar4023Z0kWdcgBPgc4aD+E6oEvh6jkfhCKdr0gtpYJkQ@mail.gmail.com>
	<1490946226.18519.36.camel@codethink.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Mar 2017 09:46:22 +0100
Message-ID: <CAJTo0Lb_Wz-8=i4fvdQdk+CTd=ihXrj4wp0xGBCnvUyggFTRJg@mail.gmail.com>
To: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libjpeg-turbo: fix build on aarch64 or non-intel build hosts
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
X-List-Received-Date: Fri, 31 Mar 2017 08:46:42 -0000
Content-Type: multipart/alternative; boundary=94eb2c124cc44e1687054c02d9a4

--94eb2c124cc44e1687054c02d9a4
Content-Type: text/plain; charset=UTF-8

On 31 March 2017 at 08:43, Tristan Van Berkom <
tristan.vanberkom@codethink.co.uk> wrote:

> So just to get things straight, does this mean we no longer need the
> patch to remove nasm-native from the jpeg turbo dependencies on non-
> intel targets ?
>
> I think "-native" here only means "build an nasm that I can run on the
> host architecture" then I think this is fine, as jpeg-turbo will just
> ignore the needlessly built nasm when targetting non-intel platforms.
>

Both have been merged, as nasm-native is only required on x86 targets so
there's no point building it needlessly.

Ross

--94eb2c124cc44e1687054c02d9a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 March 2017 at 08:43, Tristan Van Berkom <span dir=3D"ltr">&lt;<a href=
=3D"mailto:tristan.vanberkom@codethink.co.uk" target=3D"_blank">tristan.van=
berkom@codethink.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":32r" class=3D"a3s aXjCH m15b235250e719ece">So just to get t=
hings straight, does this mean we no longer need the<br>
patch to remove nasm-native from the jpeg turbo dependencies on non-<br>
intel targets ?<br>
<br>
I think &quot;-native&quot; here only means &quot;build an nasm that I can =
run on the<br>
host architecture&quot; then I think this is fine, as jpeg-turbo will just<=
br>
ignore the needlessly built nasm when targetting non-intel platforms.</div>=
</blockquote></div><br>Both have been merged, as nasm-native is only requir=
ed on x86 targets so there&#39;s no point building it needlessly.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--94eb2c124cc44e1687054c02d9a4--
