Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4191E605BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 12:51:38 +0000 (UTC)
Received: by iouu10 with SMTP id u10so174374659iou.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 04:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZBWbv0BLg6ty5qWp7eRLi1kvvA9/sWTJ4yAvMH/18sg=;
	b=iJ7JVxn60nBZEU9IUUbUJK1AkDs9GyqSHtFDu0IA0vi9Q+zJxrhTh0nGwg2t2z74Ot
	rJJJk5CGsadNdO/9IvgjZLt7nyYtWSFL2ZNBYQ0Qos8cEntCKGszv8RQzc2YoaXSQpI7
	wao9CiiXfHlHtG+vodvtmwJcKM+sdR9rqdmp9m3l1nWO4DtsIkIfxY5H+esb3twprS5P
	S9XlcoR2TasL32aH99yOrTnkgd3BIR+ilsnhzBxB1D8ABAWbmgiXOrI1RD2vEHQTWVBE
	66Vrya/H7c7JIVNI1//HEUsl3CQ3CbcL7YFxsGYmwCdduNmLZzQXggEhouT0fIN0BOwc
	HUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZBWbv0BLg6ty5qWp7eRLi1kvvA9/sWTJ4yAvMH/18sg=;
	b=f+zTEbcZLwLnCeB490Mjf7r0pHMJNBiCmTLhg7INTqUGN8U4iL3teWXUI1Ojzo79n2
	oqs+h1ylkd84/HcWeAk0hv4boyiCtBba6Z7awT+I4kWSCaIMqhXO/JZKzioewwqJ6r8D
	yILgCmPrWRfdvhoHzixZbMCI5fG6WtK3rNrvbupv1E9ZtvtvcPsTGvZ0hqpIvLfnTlG4
	dMJE8iVWQW15vpJHid//Rg27Ne1MKxvbh2V5ipm2VIfZCP2IxcONP4ikm5ScQGb+SbtV
	x9NmhBs/GR4x9sBSzJmKzt0iwKQViNx5+03A1XJmC3oXr/2ItTxK8Pu89vO2RpocFpmT
	JQ1w==
X-Gm-Message-State: ALoCoQnT5Z/Vna88B2jhAX3m2S79yMkDdxC2QBTAyxzjVyCHa0uO9E5/t2RIArFiAlaYPRzGlTaw
X-Received: by 10.107.3.144 with SMTP id e16mr53609774ioi.99.1448887898616;
	Mon, 30 Nov 2015 04:51:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 30 Nov 2015 04:51:19 -0800 (PST)
In-Reply-To: <20151130124035.GA2250@jama>
References: <1448885938-25946-1-git-send-email-ross.burton@intel.com>
	<20151130124035.GA2250@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Nov 2015 12:51:19 +0000
Message-ID: <CAJTo0LYHNDA-TXE4ibfAB8wYKBpDRs5cBLWKRaHxTDGC20+f8A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Mon, 30 Nov 2015 12:51:38 -0000
Content-Type: multipart/alternative; boundary=001a113ecf408462d90525c1801c

--001a113ecf408462d90525c1801c
Content-Type: text/plain; charset=UTF-8

On 30 November 2015 at 12:40, Martin Jansa <martin.jansa@gmail.com> wrote:

> > Finally enable native builds.
>
> Why is this needed now?
>
> When it was needed for xbmc it was rejected (and I was carrying this in
> my branches since then):
> http://patchwork.openembedded.org/patch/63477/
> more recently in:
> http://patchwork.openembedded.org/patch/105689/


Mainly because the hassle from using the host libsdl to build qemu-native
is rapidly becoming more hassle than the cost of having a native libsdl.
This needs to run through the autobuilders but the important difference in
a part 2 is that native builds of libsdl don't pull vast amounts of native
dependencies in.

Ross

--001a113ecf408462d90525c1801c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 30 November 2015 at 12:40, M=
artin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com"=
 target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; Fin=
ally enable native builds.<br>
<br>
</span>Why is this needed now?<br>
<br>
When it was needed for xbmc it was rejected (and I was carrying this in<br>
my branches since then):<br>
<a href=3D"http://patchwork.openembedded.org/patch/63477/" rel=3D"noreferre=
r" target=3D"_blank">http://patchwork.openembedded.org/patch/63477/</a><br>
more recently in:<br>
<a href=3D"http://patchwork.openembedded.org/patch/105689/" rel=3D"noreferr=
er" target=3D"_blank">http://patchwork.openembedded.org/patch/105689/</a></=
blockquote></div><br>Mainly because the hassle from using the host libsdl t=
o build qemu-native is rapidly becoming more hassle than the cost of having=
 a native libsdl.=C2=A0 This needs to run through the autobuilders but the =
important difference in a part 2 is that native builds of libsdl don&#39;t =
pull vast amounts of native dependencies in.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ecf408462d90525c1801c--
