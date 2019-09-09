Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
	[209.85.217.53])
	by mail.openembedded.org (Postfix) with ESMTP id BBA757F32C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 21:25:32 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id z14so9785475vsz.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 14:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CzW30LF3Qmlb+cCmskzBMhkEZH3+0CfMjC+1bLrQvbU=;
	b=ajnvmkti3xVwsw2l10qaHbQMC+kwhv9wG7ztrTfU3wBZpYuaC61zKiAh8XvNO0Dnuh
	XPf5f9xoyq4Sx1F8eKBRHXPqtOZ6QcjAgMQYIlkpEVGxc88CY55nir8u4n+5RmUehRrU
	MUH2HwK2uL3/bBAAI3OVFXiFqnIYzfs7J7tCdJTaF6oXcoRH3KURv5HuEt6KetP55J+N
	fttiE2h50Q7mcQJTCb8W8xzlSy/VKpcg0ot2lVMm9g5mcf9QQxMthryNCvQt+WJBHLPn
	pHwWsicJ0hAwpGZ5O1ahGFTqDpnBuTi+kj+aQoNb7gAVhzBCNUXCQwWq6SHi2RM4u67K
	5pvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CzW30LF3Qmlb+cCmskzBMhkEZH3+0CfMjC+1bLrQvbU=;
	b=Yqu9KK4skUKfnYrdhT0opv+LrZDFZ8XLIf+j3Ysjf7WVn6om5ZgOK82LRdpGh+UNve
	9VSiXMDnyhOkAIoe2oAkqgjlyYHjXLWVqdMjdIceDxF0VUsRb78mpsLzUzDVMkMkurRT
	8ajLRl9ueNBqxRmNWBouBUU2aMUMXwYfb48qVBUQM3Z9FORtavHcw7JYmbE/wrXUQb/N
	cVBlqH5RxuEwzGgbu1zX1D0fJJVNGsvPKpz3fOQ6t2wbmNxHABE1VrK0p/3N7oOgDUFx
	orOiji4teqS4Tuzy3wtJm6/EPZYDnSw2V4z48gSirLtpZ6M4mMGg3AIaHwqRNEqx4Lyb
	RmSQ==
X-Gm-Message-State: APjAAAVLZ9GniWsWWzsjxEXLpfL/zFrEl69Ph3xtVCTGhkdo1618hEuc
	8J5DOkD283M0kbuXJTiRNEPD7bgjUAaZ2HOSzNY=
X-Google-Smtp-Source: APXvYqyf8keLrUqBpE74G/pvpVK9/A59LkURo6uLzK99dtNhdfAlXrE+xvl8xrHacseNHKMxf4oD+D27NXm6FkBbq6o=
X-Received: by 2002:a67:f507:: with SMTP id u7mr288381vsn.137.1568064333561;
	Mon, 09 Sep 2019 14:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjxBhq4=rvMN5DWAamV5sE-nCenqFxLdPRYNA3st2Y0Z4Q@mail.gmail.com>
	<CADkTA4NXHjo=2daFtRbZAheunsNO-OCeVqZGQ=9ZW+1Fjqe1+Q@mail.gmail.com>
	<CAP71WjwuAbAd=h3WdW=Ku8EaFPx1=z8P2jvbWA6yvAHsGuFPkw@mail.gmail.com>
	<CAJ86T=V5kkimWLjU59kJuCECaNutn6__5zY3qvawbHvxhjbTww@mail.gmail.com>
	<CAP71WjymYyhhV8xSekAp5tkywmZ2SUzLPqqidBM+CWa0S8z90A@mail.gmail.com>
In-Reply-To: <CAP71WjymYyhhV8xSekAp5tkywmZ2SUzLPqqidBM+CWa0S8z90A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 9 Sep 2019 14:25:22 -0700
Message-ID: <CAJ86T=X=OLUxCsgHZ+S1GQE+N2_PUVHFyWfz-Jhij2vTz5CnYg@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: make-mod-scripts question
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
X-List-Received-Date: Mon, 09 Sep 2019 21:25:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 9, 2019 at 2:01 PM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Mon, Sep 9, 2019 at 10:58 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Mon, Sep 9, 2019 at 1:25 PM Nicolas Dechesne
> > <nicolas.dechesne@linaro.org> wrote:
> > >
> > > If this reasoning is correct that means that kernel signing + external
> > > module is broken. Note that I am working out of Thud for now, i am
> > > sending this email for now to get some feedback, and will try to
> > > reproduce without all our custom layers and with master.
> > >
> > > Should we deploy the keys/certificates in the kernel recipe instead of
> > > adding them in STAGING_KERNEL_DIR? Would that be enough?
> >
> > Maybe even better would be to have the module signing key provided by
> > a separate recipe and not rely on the kernel to auto generate it?
>
> that would create some serious patching in the kernel makefiles (and
> maintenance burden), no? since the keys are embedded in the kernel
> image.

I don't think any patching is required. See
Documentation/admin-guide/module-signing.rst in the kernel source tree
for various ways in which the module signing key can be provided.

