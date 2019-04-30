Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 05F557D9E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 10:58:20 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id m9so5407816iok.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 03:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tYwrzjtsgk6ofSKS/CIE0LXG8vgdus7eNde8jBvMxXY=;
	b=guJyFM1REA/JVIN4lXXmBBI5c079lBjAaykfZOw5G8N4L8WyCQrfaBbrz2P8NCsopB
	+w+jcmuMxooR8MbzYwTEqm1tim1u/tl8KQG5wZMf204ca0K6VTtigcunPkMeVUv1L8t1
	Mg6DrJg0bBlAXl9lp35sJ3Pv1WWYJ+qLpcXajeGVCeVD68u9V/R+y/9Nn7rzTIohua5g
	jHL6eZc3CcWIytUFAJe9rgSTavkRr1UMt+vnh+UfuoaXjXo7Zl5rvrENJOeUD2YJfE7u
	6xrPL5TVRr3LBdWTQda+LfBujOO6Mv8JOUnfSeqVaHFAx1+UoABszo/LJCVnK6px69Ea
	7NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tYwrzjtsgk6ofSKS/CIE0LXG8vgdus7eNde8jBvMxXY=;
	b=rEDgA++2yVjIWg8tvD5fq03hTl81eRIrhixT/j/L7qvSiVfYMhjWm3o4olUdJ69DL4
	hikJ+BF28e8cQCxAJ3zlQ4WzmnpzLSId2+IfiMXMSeJypBtSQRLiPCSEECM94CT9+Be8
	rbWKQr3xfMpUXpJypcM9TUsofwk5jEiIrPTK3Ut568yec+YRiET0PYODjGdkl+Hd0neY
	VQXd/XZaSwHTh7TuqolcmZVououyWDPF9awiMnPwGn8Rr8rAPPK7YcZR8dRU6Fftyd3+
	GCV0OUqaW5HuFCSOQOaHXxnKyFB7EPrjCfiCrpJv6nF715rgT5btyyIGTWAI16syNZxf
	GtqA==
X-Gm-Message-State: APjAAAVFD78ldiCw2XX/H7ICUKqKyG59LWNJUgnkNd79+F2KPrjcc05w
	lpv2qsOWfjbptgmPozbTv60OiECvB70HVPGDfUE=
X-Google-Smtp-Source: APXvYqyBQzq0WVvgo1pNQeputgzvlIgRZciAyIbbKZJStD9jvXM9R/lAsiv3ycF49Yoa+AenNVhSPhOOtHqske90s/4=
X-Received: by 2002:a5e:d505:: with SMTP id e5mr17362645iom.99.1556621901911; 
	Tue, 30 Apr 2019 03:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190429140730.2899-1-schnitzeltony@gmail.com>
	<20190429140730.2899-2-schnitzeltony@gmail.com>
	<323098102d47a837b953a3c399f8db65b1c43349.camel@linuxfoundation.org>
	<CALbNGRRuLKUfornkTS6e2PBskpyxuWo-XnLrd=boHYPJMkDhhQ@mail.gmail.com>
	<19fa74d55f965241b227fd1e63241be600f93b5a.camel@linuxfoundation.org>
	<CANNYZj9VG3Ty8OLyft2Hn67AvYYUeqknaU1kdBgb1zeRW+o3Dw@mail.gmail.com>
	<a9333c6e475b7bd4fc4b687715ef7b2b6354814b.camel@linuxfoundation.org>
In-Reply-To: <a9333c6e475b7bd4fc4b687715ef7b2b6354814b.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 30 Apr 2019 12:58:06 +0200
Message-ID: <CALbNGRS3oVjU_nYEUjmMM0FMk05pnUfz8eapdqv=E98foV1gAA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] vte-native: reduce c++ requirements from c++17 -> c++14
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
X-List-Received-Date: Tue, 30 Apr 2019 10:58:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 30, 2019 at 12:53 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-04-30 at 12:48 +0200, Alexander Kanavin wrote:
> > On Mon, 29 Apr 2019 at 23:22, <richard.purdie@linuxfoundation.org>
> > wrote:
> > > vte-native of an older version is looking like the best option
> > > unless
> > > Alex says I'm mis-remembering...
> >
> > I checked what --enable-vte actually does in combination with the gtk
> > UI in qemu, and it makes the serial console tab in the gtk ui behave
> > like a real gnome-terminal tab (selection, scrolling etc). In the
> > absence of vte support, the serial console tab is still there and you
> > can still log in and issue commands, but it is more "dumb" regarding
> > terminal capabilities. This serial console is an addition to the main
> > tab where the output from the virtual graphical card goes.
> >
> > So to conclude: we can split the vte option into its own
> > PACKAGECONFIG, and leave it disabled for native. I would rather do
> > this, than make vte and vte-native versions diverge.
>
> Sounds like a plan, can someone send me a patch please! :)
>
> Cheers,
>
> Richard
>
As the origin of all this I'll try to be the someone

Andreas

