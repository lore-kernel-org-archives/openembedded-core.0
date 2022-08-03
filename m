Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43246C19F2B
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 22:46:30 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.6.1659566782575339766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 15:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I5YkdbwH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id bv3so9257021wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 15:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=jcA4qE8XtKorPW6P1NUIALLqgOP6ui9R8wq3c4Avw2g=;
        b=I5YkdbwHdOQZYZ7/qs26Qz00jY59BPBCwRWPzjiK4VloMmQQn/r98sZX+BcMJ5p2ml
         oBZ1d3Zp60tb0KYSPmFBaxmURhmBsjbJOEwADCtGfihKLDYG7YA3xRe/w0ZOqrxTXgRL
         DyyudXXZS9HYGKmcuzZEkTCqSpbfM0wblAH1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=jcA4qE8XtKorPW6P1NUIALLqgOP6ui9R8wq3c4Avw2g=;
        b=wZ+bWgQbYpO9Lax0w3zyTx+l3Anj3rN8ifR90e4DLcPHhZXItUW/RoRImDP5XBGjdm
         jAzsY/8vn/fdH/sxNhNFM7nJ4xXhum2Q5tJetday5re4h4FTQGBDPpCyk1rDZlcO+D3m
         3euecEhEiDk0uH2FTC3Ma9qjkH8N9VClt8EWH912Suhi198aFCQKSCYGxDr229Du8oce
         1kTolCMlNFLTcbU2BY55vrwX4zxHCHrOARwGCYw9SubfyOxMBpw3QmdMVTRtu5Anum3q
         jcJ0D7XcGfZdH/QiCeg2k09yjOFWYNliiXzd/0X2JNxV6F2YxRfG7AMs29m9bRGOwr1/
         hKfA==
X-Gm-Message-State: ACgBeo1/pzjJ9tmu5F2U+vrEDJYT58wJWkVrz7NoTLc7VoGrDxoQ0RO3
	L/uSmU44OluOYsOScFqqIzeuMQ==
X-Google-Smtp-Source: 
 AA6agR6+0+0j4j3ynEVwDK8Y9Tb+G+cTtYrjHY8ITF4GlKd4trqXX6i5+q5wnkTvR4aQCAi9SW9t5g==
X-Received: by 2002:a5d:5a1a:0:b0:21f:a9b:62c6 with SMTP id
 bq26-20020a5d5a1a000000b0021f0a9b62c6mr17033062wrb.20.1659566780675;
        Wed, 03 Aug 2022 15:46:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b1e:c52b:bd77:b2e3?
 ([2001:8b0:aba:5f3c:2b1e:c52b:bd77:b2e3])
        by smtp.gmail.com with ESMTPSA id
 m15-20020adffa0f000000b0021e5f32ade7sm19132398wrr.68.2022.08.03.15.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 15:46:19 -0700 (PDT)
Message-ID: 
 <830db8ea9f131bf577340c92a36cb5b7870f315f.camel@linuxfoundation.org>
Subject: Re: [OE-core] linux-yocto 5.15.48 reproducibility failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Bruce Ashfield
 <bruce.ashfield@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Patches and
 discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Date: Wed, 03 Aug 2022 23:46:18 +0100
In-Reply-To: 
 <CAOSpxdZPefjY=513h0vLb-W3dPqkUzBQXh00V6t68M+-9CDogQ@mail.gmail.com>
References: <YsWOLwlNxhAq7sKz@mail.local>
	 <570c56bce472ec4ba6a68f537dcb1f85f99a05ea.camel@linuxfoundation.org>
	 <CADkTA4N2gGHwG7OWGY32gqLzztsTcOsGXx=-wgpJrJhkfj=OKA@mail.gmail.com>
	 <CAOSpxdZPefjY=513h0vLb-W3dPqkUzBQXh00V6t68M+-9CDogQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 22:46:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168831

On Wed, 2022-08-03 at 11:50 -1000, Steve Sakoman wrote:
> On Wed, Jul 6, 2022 at 4:05 AM Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
> >=20
> > On Wed, Jul 6, 2022 at 9:31 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >=20
> > > On Wed, 2022-07-06 at 15:29 +0200, Alexandre Belloni wrote:
> > > > Hello Bruce,
> > > >=20
> > > > I got the following reproducible build failures:
> > > >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/=
1116/steps/12/logs/stdio
> > > >=20
> > > > To me, it looks like the in-kernel config changed, did the compress=
ion
> > > > alg change?
> > > >=20
> > > > Are you able to look at that soon or should I file a bug?
> > >=20
> > > FWIW,
> > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220705-g=
8ltxczy/packages/diff-html/
> > >=20
> > > and CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=3Dy changed value...
> >=20
> > A quick look at the -stable queue to init/Kconfig does indeed show
> > that option arriving .. from my scan of the change, it looks like
> > there are different compilers on the hosts, and hence that check is
> > detecting a buggy gcc (or not) and changing the value.
> >=20
> > So one of the build hosts is failing the test, and another isn't.
> >=20
> > I'm not sure how to fix that, unless we revert the change. I'll ponder =
it more.
>=20
> Was this issue ever resolved?  I'm seeing it on kirkstone now too :-(

No, it wasn't. I took a quick look and my best guess is that we now
have the kernel wanting to do $CC tests in kConfig and we don't set CC
properly for all our make config calls. I chucked this in master-next
as a quick guess at a possible fix:

https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D944cc04d1ed3=
16a5652f3d058b966d4cfb9a6b73

but others might know better where we might be missing the CC settings.
I suspect we need to clean up our parameters a bit looking at the
different call site differences.

Cheers,

Richard



