Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id CC23560111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 08:01:13 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id s63so89386627ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gVbfuJU2EULUfdSlMOr/NEky/UEntL3R6Jhg7BDWP6w=;
	b=bMsPnzywhiepzYvCEHX/+fM3cRiuV7CWJbatVtpEj6rnuKaXL9eVB2bAUSxY0UmxHG
	7UlJ3U91l14kcHAt8qqNukaRXwVUISMc8Fk01u01AxqHPLOiyLnVK8QSm2m+esYy6ng6
	ksxIXCRqXdwhvV6ycZgUjyUXSf6q6bF1QZoztPmHinaffUbPrEwfNYue5GMGFPMUExj8
	N7xLrqzVSVj1xG86L8rgGCxfXoFxkJ7WzueGmm+7OkWAgatRneksG9+ydwgmne/7K09n
	wqqSWvXrOr6Lv4osDBHWYXI6E2yNRe5VSNp0L+69IZ9rljDDiA2R7j+jJjYXtN8Wa8Dq
	6MlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gVbfuJU2EULUfdSlMOr/NEky/UEntL3R6Jhg7BDWP6w=;
	b=m2ORVvWJsHSdwVG9i8X+UFFQTmXFikw24R5y1ow6FatEYOU6bKD1/Xu4pN0yByivNu
	io4e9vraA890PwkvVkeO+fM696gh2rXRShKrBizi3KkXhCEjgVksy/EQfpWdU0xuyCJq
	gmxd19vP0qpsnziQr4G1kjiRBSrCYF49Btn57a/hyeiirFzEaUk7kesgi/JKkRsDXUoq
	5uUSPZ4XIrUTVozr2JJXjGtnbGtD7mLw9mfRw2OpcED0d73qUZwxKomoiZ39wpQ/b9cs
	yBxAGReBhBVy2qg7Rp8nzqMCkHEBdxe6NcXCn50AvSaeJtHdVXHOEXhOXra6r1QzBiaq
	SZlQ==
X-Gm-Message-State: ALyK8tJfMk9wSXyi6fWS4pyb7fe3eZsGE3JZ2lzzWKps4Ss9q3j8RC1b3MQPZ6tvCOPEjLmNNbSF4ybDB3FPtR7x
X-Received: by 10.107.154.210 with SMTP id c201mr4275905ioe.99.1466755273981; 
	Fri, 24 Jun 2016 01:01:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 24 Jun 2016 01:00:54 -0700 (PDT)
In-Reply-To: <CAOLEWZV7BhnN=1h8g6mBeMMLrv49yxnp6xE3Z-KUtBvUwzhmng@mail.gmail.com>
References: <CAOLEWZUQRF1LBjviUmbHqLO6kTM=ExC=4soBBTmdhvpuRekbmw@mail.gmail.com>
	<576B95C8.7070002@windriver.com>
	<DB3PR04MB0422B332B7EE939EE1BB31D992E0@DB3PR04MB042.eurprd04.prod.outlook.com>
	<CAOLEWZV7BhnN=1h8g6mBeMMLrv49yxnp6xE3Z-KUtBvUwzhmng@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Jun 2016 09:00:54 +0100
Message-ID: <CAJTo0LaovxReNSygyM0MWoZRCwNSnSJC7CkVHhdBB-3OA2xQ7Q@mail.gmail.com>
To: Stephen Arnold <stephen.arnold42@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] qemu-native: set ld.bfd, fix cflags, and set some environment vars
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
X-List-Received-Date: Fri, 24 Jun 2016 08:01:13 -0000
Content-Type: multipart/alternative; boundary=001a1140fab61419ca05360193df

--001a1140fab61419ca05360193df
Content-Type: text/plain; charset=UTF-8

On 24 June 2016 at 04:44, Stephen Arnold <stephen.arnold42@gmail.com> wrote:

> The fuse-ld=bfd flag is not in the v4 patch, can you go back and try
> the most recent one on the list?
>

Ubuntu 12.04 was dropped from the supported list in March 2015, so 1.8
onwards haven't supported it.

Ross

--001a1140fab61419ca05360193df
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 June 2016 at 04:44, Stephen Arnold <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:stephen.arnold42@gmail.com" target=3D"_blank">stephen.arnold42@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":759=
" class=3D"a3s aXjCH m15580834f30660f7">The fuse-ld=3Dbfd flag is not in th=
e v4 patch, can you go back and try<br>
the most recent one on the list?<br></div></blockquote></div><br>Ubuntu 12.=
04 was dropped from the supported list in March 2015, so 1.8 onwards haven&=
#39;t supported it.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a1140fab61419ca05360193df--
