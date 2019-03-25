Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 97A3779CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 19:47:00 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id g17so15870708ita.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 12:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=S9CRFVAnz99eYnGdIi0G+ofKkxHU4tZob7jBLv5p0H4=;
	b=DjTXZWvm3JJUlRKdEMjKfKgQrW/8P4Oc4YtToTLseEI9Wqf+aWrlehGGaAmhYEecWR
	xv6OgSlG0vCe9Amlzy9LTzIbNu1IeR9c7Ouax/njOgBmqSbZV4itj4kRYJwhnQ99Ua97
	f4eP2AVxPyN7cZTS3GZPSZBvKFJfwpa6tXqb7C+BjU6f94B3mViPNywg/HtuxJDfaV8H
	d8hQ3RD5PNLC1Qyph0Gd9Eakgl2d+8bjUNAmce7YCY4/taSnkBgfdBnS3USrgPBzG277
	IbPxJquXVP2IRwjZcAfTtQB4fl8NdM5gBSL7jn0tPHQ+DH3u+IyIQciSzg9iN3K5Nwvt
	YyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=S9CRFVAnz99eYnGdIi0G+ofKkxHU4tZob7jBLv5p0H4=;
	b=sFizs8OvVC4OEMN9wQrofL2glBvNYOnWeZn7yqsptzFw9ycTzCj1DRV8V3v3OIpvib
	iwWQoWakimJJVEjmdycssDS3TktNUpK3YRlcWCXuqZ3sy/7Zt2saTvOX3E2u3Ms6RtqO
	IX5n6Jj1HpuimB5t32VFVmcDC6MGLw1SKp2bLJUKo2j2xQ51459cpQQigPfq2v/pmBzW
	UuzHbjJTyqRy0O+4gNWMPC8KNZ2adU7T7Rk6mj87mGqQwce2/ROAq01hWC/sEZPcTSP7
	D9zER/96eGCETZUDYgb+2+ccT55x3rhQyGg9heO4q5dU0ryT7qnTA8v03MqjyoPkM17i
	UcKA==
X-Gm-Message-State: APjAAAWFmBHv88/6j9nNsaAPLnah0RVHBbd91knoROa3cQLH46t5M8S4
	fHzyiZ8zW4WZxtPaoG/AEcygpWY8EHZo/QIAHl8=
X-Google-Smtp-Source: APXvYqxRVwqpZ/7i48h4kgIJ+MLo4MMX5Gh8f52saZp3++6qcGCUkroOmhCClJVbjw+8e6sQEr/U0BmF7qa+BF2ge64=
X-Received: by 2002:a24:7d84:: with SMTP id b126mr579242itc.58.1553543221681; 
	Mon, 25 Mar 2019 12:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
	<CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
	<20190323215336.GA22469@localhost>
	<CALbNGRScKq9gCQWbU2wchSvQ3cf2aRNnn5601fOATuKMdVOFCA@mail.gmail.com>
	<CAAQYJAsLQFn3VrB7gSTkytA8Rm-1GkKLBLHHpVzonpqykrHnRg@mail.gmail.com>
	<20190325161004.GB484@localhost>
	<CALbNGRSgkQrjKrhEywJb3DhvKv3gkobZvv7YG_DxE039SAqJaw@mail.gmail.com>
	<CALbNGRThou+6CNKotr-hduJoKNPgg+F2i8PQdgjBGcGRZeOKdw@mail.gmail.com>
	<CALbNGRSSXNWW4-Xn=aa2zVe4u=cT5AE50AKy+URSZXcTJfHRsw@mail.gmail.com>
	<20190325180307.GB5805@localhost>
In-Reply-To: <20190325180307.GB5805@localhost>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 25 Mar 2019 20:46:49 +0100
Message-ID: <CALbNGRTkmOVPDWCyFRBdTG5voqQqvPv6KxXRnMYimO_Vf5ay-A@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Mon, 25 Mar 2019 19:47:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2019 at 7:03 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Mar 25, 2019 at 06:36:19PM +0100, Andreas M=C3=BCller wrote:
> >...
> > Something to add - haven't yet looked into networkmanger:
> >
> > Do we have the chance to change the sequence of paths headers are searc=
hed for
> >
> > 1. musl
> > 2. linux
> >
> > That might fix some issues
>
> It would not.
>
> The headers are in different namespaces, order is defined solely
> by the order of #include statements in source and header files.

Yes I should have skipped that:

* I missed my bus for writing it
* it does not make sense

Andreas
>
> > Andreas
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

