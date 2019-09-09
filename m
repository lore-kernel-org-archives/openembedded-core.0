Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id BFA4A7F362
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 21:01:58 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id 7so14154956ljw.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 14:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N605P5HakFAz1itxAH0FokTAV8vT0c78/9B0MRm91NM=;
	b=DLaMHsZ4PPVCcYmPjch/9aO5bzqCulKTzp4iLoog4zFN96YaKQlYgd+1quroqo2Oqh
	lXqaWFs44/avTFr6TOE2wa1tDZi1s/k6zWAzMUFWha47r1WH7Ldynu9gAYuGrrMDUrdm
	ljlhkS4+SJG/PoVG8Q+lALoWnIJ3TpxE1dUYgiL2/gRMX3HdpO6uuKGK5Zxwin6kEFoH
	Ko+f1DDnav0gluZ3ExQl9AsEnROl5R71U214zBc9GrPu5/29uKQMB6AkyFM5+502kLl0
	b1yJ+WopIoNdKano5PfiDyQTHHtjwuKg8LLhqkB4ZzNFDfIGILm7e5n6AcKP29e3Ficd
	IAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N605P5HakFAz1itxAH0FokTAV8vT0c78/9B0MRm91NM=;
	b=hi83m1vhAHi6t0WYPNkggFx1xWq1tq6qR8EXT54Bn1k+5/sn/0SobZqlykzMmcne2o
	LkDEtInv8cy6pi6IOSbmu3sNlj5zlXZPX0CE1EG/CNojy3+1yAwDo+PkMDb4H0LuGQZJ
	2Ha9Vq++sDzH3LdARWq/0nwQlybnMqGVKSUeDR3Nism37/NxtGe/Efxu28UZb8SZq6ZI
	G5Fu4Ft1Ji3Ipz5hff7+jI/Ek8pl9phIQfMcPfw5zBCAc15rI3YGPzE1R97aAXH+CMKA
	Pj9gkwaNIi9+135TMIgDSJ8lXg8OtXPMnJo6wig5iN1DEsOJ3cLbEG9QiSU7/iPaFmd5
	vBMA==
X-Gm-Message-State: APjAAAXThPbkgpP3cycXSLb+hvXeReJ2suLXuPTu3bQJr88u/9m0sW4w
	27cmglkRGQ6W3ywCoJ9OrnlXRpwHXcVFxqU8Y0Fm2g==
X-Google-Smtp-Source: APXvYqy02jBPo4GB9t05jQwc2bVAk6klWbltakoT8TbhXWg9XxSille8UV85fOdNjn2YA4WYnJstXhb9EQQYHUZalcA=
X-Received: by 2002:a2e:990d:: with SMTP id v13mr10517424lji.146.1568062919205;
	Mon, 09 Sep 2019 14:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjxBhq4=rvMN5DWAamV5sE-nCenqFxLdPRYNA3st2Y0Z4Q@mail.gmail.com>
	<CADkTA4NXHjo=2daFtRbZAheunsNO-OCeVqZGQ=9ZW+1Fjqe1+Q@mail.gmail.com>
	<CAP71WjwuAbAd=h3WdW=Ku8EaFPx1=z8P2jvbWA6yvAHsGuFPkw@mail.gmail.com>
	<CAJ86T=V5kkimWLjU59kJuCECaNutn6__5zY3qvawbHvxhjbTww@mail.gmail.com>
In-Reply-To: <CAJ86T=V5kkimWLjU59kJuCECaNutn6__5zY3qvawbHvxhjbTww@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 9 Sep 2019 23:01:47 +0200
Message-ID: <CAP71WjymYyhhV8xSekAp5tkywmZ2SUzLPqqidBM+CWa0S8z90A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Mon, 09 Sep 2019 21:01:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 9, 2019 at 10:58 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Mon, Sep 9, 2019 at 1:25 PM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > If this reasoning is correct that means that kernel signing + external
> > module is broken. Note that I am working out of Thud for now, i am
> > sending this email for now to get some feedback, and will try to
> > reproduce without all our custom layers and with master.
> >
> > Should we deploy the keys/certificates in the kernel recipe instead of
> > adding them in STAGING_KERNEL_DIR? Would that be enough?
>
> Maybe even better would be to have the module signing key provided by
> a separate recipe and not rely on the kernel to auto generate it?

that would create some serious patching in the kernel makefiles (and
maintenance burden), no? since the keys are embedded in the kernel
image.

