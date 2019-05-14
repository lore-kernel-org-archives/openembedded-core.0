Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD017DEC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 12:26:07 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id g18so14780006otj.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 05:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Yhsmzpl1Wz2JnMwO/wT2pqGGzucYZAmZ1qHhQSY194I=;
	b=YLaeGTthqSRZvCx0fyLVqwOHCnIaVCWvC+av8s2tdBVop7ZtnnZqJEomvSq/RN/rgb
	2SzwvcSsO/ANkm0ESsf5QCEib9pIP6WQcY96eCoNqgfJ97KmhKA4NXUVvhEkcKj4TnBH
	s64UEdOp59ymPP3iJyM6CDdeQmpjsXDz6ltYfZMx60FtMfNcnh+EQrGm6/EkIHnkEXix
	WsR0Z+FOuhFmjLYpHklJizganEjAvV09mbigkfOxS5RsNsrmz5ovj9e0hHrUa9xvh254
	AR+qzIcJClmRW4r24y2c36+VZkmv7quBamTZIT0e5odZbWTXCEk4BbMVTL0zoULZhM2m
	FCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Yhsmzpl1Wz2JnMwO/wT2pqGGzucYZAmZ1qHhQSY194I=;
	b=d3ioAK13R5+xP4ypQTahVMpAcGd1pHeFGK9XDR1QwY71CRoOVN2xsQ/ryX5kfLCq13
	pS8zqp2qjRrdxz3XSQOGORVB1j9qGI4p6eNH4p57PRmqBKTRy/lLdcCBe92sV8h/iXNK
	r2etNCmjN8gIxKnqw2CSDaKke9y7dTgXEwiFMntW1J3dP7RGH6ozzTQc5eBplbsczNEZ
	+pbwF699Nkv47XgZH75BMdo+4/yGIasuSZH56MkH+oHXzCzXlpkF+fft/DbGjaMRSR4P
	pLfPzA63h05S7y1pzq/0F1CpssqIFJHfL4BdH7EXjZ+i9l8b1qjVX4/YedFmiTEl0q2u
	kFmA==
X-Gm-Message-State: APjAAAXxzRl4p0oTiWyvwHWefmq7mI7J5UVwhq4HImUofvaqVBsF+PmW
	Uck0jadQZAn7yV0d45r2Bjq2/+COBNyybT/7k60=
X-Google-Smtp-Source: APXvYqxF1mj4LO4eXFHs19RoIf9kNUQLEpYDN2OZaSaGaVkoSqVv5u6jnAGl8CVlWCzwowPU5cIIzSgJYmz2dYtSkRQ=
X-Received: by 2002:a9d:7c84:: with SMTP id q4mr14243947otn.98.1557836767609; 
	Tue, 14 May 2019 05:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190513153303.50095-1-alex.kanavin@gmail.com>
	<11653b239bb09ddb35bccb03f22ea47ec60cbf60.camel@linuxfoundation.org>
In-Reply-To: <11653b239bb09ddb35bccb03f22ea47ec60cbf60.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 May 2019 14:25:56 +0200
Message-ID: <CANNYZj9y+AXFX-HDcJP=hSsxfgFQ6=a+YWtq-MZ3y9toPP=xRQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium
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
X-List-Received-Date: Tue, 14 May 2019 12:26:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 May 2019 at 12:08, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-05-13 at 17:33 +0200, Alexander Kanavin wrote:
> > This matches what the qemux86_64 is currently using, and
> > will allow testing the instructions added in the meantime;
> > particularly various SSE extensions are now enabled.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/conf/machine/include/qemuboot-x86.inc | 4 ++--
> >  meta/conf/machine/qemux86.conf             | 3 +--
> >  2 files changed, 3 insertions(+), 4 deletions(-)
>
> There is some kind of bad assumption somewhere in the sdk/mingw code:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/152
>
> and another glitch somewhere in the SDK code:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/588

Seems like packagegroup-cross-canadian is erroneously taken from
sstate, instead of being repackaged when TUNE_ARCH changes but MACHINE
does not. I will send a fix in a moment, even though I am not totally
sure if it's the correct one.

Alex

