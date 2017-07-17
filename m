Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1488F77BDB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 10:31:52 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id m84so49706781ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 03:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o0s5BcCM9xeY/5foBaFV+ZYsTHHo2dvWb58EZRMcoOg=;
	b=dANl89WY1kHq0xEddwIKjBEn3U7KSuI55WdBZ529LVcWaLYNZ7TshSjlNFTGm94p6f
	EkiFdGG8+hAW22k7TkBMI2k3jn+19yy1DaI1Un3fXQxNyYiiWocb38SlDTtvOy52rs4a
	UWbAszOagmaaVc9nMLxFQNp7qXLRPK7YYlZyIbqNi3wEjAjeJSxhDXbEtgd0UC4hjB1c
	UWVwld49DTtQmy/f1dKoYhxuK7U1B9ve3ONUUjPapwT2fhvKE0WGWtAOg5am45whgzUQ
	tm4hrCOfqNpVBRi8Ehk5jIxf9+n4LYeSZaTAVUQmb+TsFpIS64VwY+f7iaQ8Xuz5oD5N
	r9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o0s5BcCM9xeY/5foBaFV+ZYsTHHo2dvWb58EZRMcoOg=;
	b=hjhdRVkP4n9jexAHxcpa2vNZzne9uvM2A6dSlJmOW/Xmi9bYFLF5jRkbicrkW+NJ+H
	o0wojiYZf7rRQtln2M+4RApMnkeGoBagqu+cLs/vXTrBCG+f3wCe/nXUjExnrfhnXJay
	ZeAHzq7oCD3FGRfiZqaTQz23eyGT7uMTegQtv2LzsTr98npImnkahp9RaQRl8rqUedG5
	5dzKYtxzVwgxv4qTzE5i/FfdhEsKN8Ov0WHPSodjp2oeOeNBx6B7PBy9vZi7Jm6MYtum
	2cFz+a1bJB0s3h8SP/B8rz3vdHm6e58W1R2PGR3zovambQI1h647Frypc4+VdfJc2B5N
	eYLw==
X-Gm-Message-State: AIVw112lmKriUtMIJF8XAa0bThqC1ZkkXIbvgmhqcltDQkLYP4m35M1B
	G+gpxMLAhoNmK9CSfFhvMDdOVHSz3MPV
X-Received: by 10.36.73.151 with SMTP id e23mr4613965itd.43.1500287514132;
	Mon, 17 Jul 2017 03:31:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Mon, 17 Jul 2017 03:31:33 -0700 (PDT)
In-Reply-To: <3670690.plkd45hik7@peggleto-mobl.ger.corp.intel.com>
References: <1498615159-6719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<50B33AC5ED75F74F991980326F1C438D1F11FF60@PGSMSX103.gar.corp.intel.com>
	<3670690.plkd45hik7@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Jul 2017 11:31:33 +0100
Message-ID: <CAJTo0LZ634tvuEn_zxA=sNd0tceohMaY15ZkTWtFw6BOREQ==A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Enhancement on devtool edit-recipe
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
X-List-Received-Date: Mon, 17 Jul 2017 10:31:53 -0000
Content-Type: multipart/alternative; boundary="001a11447fe0577c05055480e81f"

--001a11447fe0577c05055480e81f
Content-Type: text/plain; charset="UTF-8"

On 17 July 2017 at 10:43, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> I've looked at these already, in case that's a concern.
>
> Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>

Just merged these (and the other devtool) series to staging.

Ross

--001a11447fe0577c05055480e81f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 July 2017 at 10:43, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1ra" class=3D"a3s aXjCH m15d4feefa03b93a9">I&#39;ve looked at these al=
ready, in case that&#39;s a concern.<br>
<br>
Acked-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com=
">paul.eggleton@linux.intel.com</a><wbr>&gt;<br></div></blockquote></div><b=
r>Just merged these (and the other devtool) series to staging.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11447fe0577c05055480e81f--
