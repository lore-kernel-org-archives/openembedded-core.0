Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0ADF07DFD8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 16:21:40 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id w25so2864545ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rmnQtl/2i1+8AVSL8+SPcC1G/EcOvHSF8OebhYs+OnI=;
	b=bzGa6pJQrFBrSVyjHuZ4nEBYMG2Qui2QHm/az4WGXWcw+BKguadDgSQiwOUZ58ZJDr
	EsC7XfIItr/l8Gw3iS2DioHXc+hfmVzgPQEKwnqLhEvqmBYoa+64Nl1xjBJ01Uxhlrhz
	pJGp4UgytxIH8llFQbCoVGjtkRREcyjskqKUcRxNNTGFPVxI886V9pFz7ON8tXBGfxRP
	9kFz+wiKJ8JczGUEu5d+X/5ujKWd23stBRJE68QJQUvKQakEGHqIa2RD70rm7iyBKQg2
	5dpYmvstFH+jwP8gs0Bv/Jj0EUFfijXurN+WpGxSwZR13qUi/TzH8mE9qo5vpuDQ4LdI
	QRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rmnQtl/2i1+8AVSL8+SPcC1G/EcOvHSF8OebhYs+OnI=;
	b=ZBWRSNPjokUQI1q4cD/o4fPvquDptZZzukoqa3QI9LcvLLG4VL4rdcdX8HbvCQIQFR
	zqFJPi7rbmizsQJGQNGYRkiszeXNy/A8i0hof8ZJohQj8gxaFYooUmquDF3+3O20Y8jl
	NGoVCn4KcWqvSjOdI5VvTC89gu3sgFV3wKB2IQrlrhomZ2XCz+z/DmB94F/bDrCuyT+5
	er0iHmhQon1FsI27RSkMUK0AD1EmrhjDXQYmkcuLIrb8gOPL6RNLZFZa/4eXR1M5Hcq3
	xDaKIRqKp7b8p7SC+nhQfWxXuKFw5O4EBdBURPPWRw+W1ca8AfSmFm6kEHQHWVOolSEG
	kylQ==
X-Gm-Message-State: APjAAAXyBneBX+P2P1UL8MZFMiih1TKKsccwyO42zMTxoGI9/OQE9/T0
	7A0e22TO4IG/FXJ8YwbtAAv8K0sFQRmXtJXSN2s9Cg==
X-Google-Smtp-Source: APXvYqw8Nl6T3iunM/zVxrIvLW4LQ0MgtCCrXN5no3NRgA47FLAkDdTB+6QmILCIhn2GZV0BiEJ+5F/w3Q4IKk06Kro=
X-Received: by 2002:a6b:8bce:: with SMTP id
	n197mr18342153iod.299.1561393302008; 
	Mon, 24 Jun 2019 09:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190624111324.8921-1-ross.burton@intel.com>
	<20190624111324.8921-2-ross.burton@intel.com>
	<f3e5e0a4cfa0892ce122342361f9ab881ba68287.camel@linuxfoundation.org>
In-Reply-To: <f3e5e0a4cfa0892ce122342361f9ab881ba68287.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Jun 2019 17:21:31 +0100
Message-ID: <CAJTo0LbjqwN689jCZS6uG96E_vDVNCtYU8dJwC5PKzX1Z2rwGg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oeqa/buildoptions: check that Fortran code actually cross-compiles
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
X-List-Received-Date: Mon, 24 Jun 2019 16:21:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jun 2019 at 17:09, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > -        features += 'RUNTIMETARGET_append_pn-gcc-runtime = " libquadmath"\n'
>
> Please don't remove that. We need to check libquadmath builds.

From gcc-runtime.inc:

RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic
${RUNTIMELIBITM} \
    ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'],
'libquadmath', '', d)} \
"

So this is redundant?

> >          self.write_config(features)
> > -
> > -        bitbake('gcc-runtime libgfortran')
> > +        bitbake('fortran-helloworld')
>
> Doesn't this stop testing libgfortran builds too?

Possibly.  I admit I don't know what libgfortran is for considering my
test builds apparently without it. :)

Ross

