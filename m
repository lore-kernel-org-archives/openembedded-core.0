Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 25AE37DCE8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 17:56:25 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id h126so3114479lfh.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 10:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XI+Rrl6v6bGmanB3vKNItonyvt09QGl518W3TTWtg9k=;
	b=bXw0lA/E1A/sQJK3l2xsad8vEeBU9h0v2CJBZTJT/Wz01XRVkoY196JHUnvcQcnFNl
	Bh75I0z2qHkHjG5wHEMrKZrSNepYfx9wIRarzQJ04ZkG+st478aS7uPEiWDbiRiwNgS0
	YFMqDwQqsG4AQPQ8hyv95oHTAa0dDzdeakbX4Lz0F3SdsURH09XN2T4AvoqfASv3AIU5
	aKD3mEcbDbqf95rUCiFUSqljFrFAvDUEIy2upkqPV8LByR48k8V70b5Z49oXyQVlj1XB
	YoOeiGm1c2AllhIbEKhTFxLxlNeklToPARtceCPp3CCXtPel0WkulFQDPRZezoHcp9xc
	Inmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XI+Rrl6v6bGmanB3vKNItonyvt09QGl518W3TTWtg9k=;
	b=hrG1JNI4kD0iBbCie5PCjI7Y7XHJllKiBvIn4qx1VRxoXxcc6JmT2PenbWwgEPHy8X
	F77GaOLRZtYz3BQTCBJ0baes8Xe22gHa7yFkone39Edpfqht8h4f89X7IfPW2N0QslHs
	o6h9HRduT9R1wGlSqHWdsnl7eI1/qX6w4UimtbLYqnjj6Mjr9Rh3dQq/umpuiDBE9g+H
	16vBu4tK4+5TQl8dftHihFaWYxa1x9WgD0G//C+79ebtBgJEhDjaB51WoZKNnBC3CPzo
	znwjWKP8GDo6cPl/jwRoB18vp9bB+mNzvNEAT9ywOEaJSObONhkfNOnzNV2fbbQRXm7G
	S3AA==
X-Gm-Message-State: APjAAAWjtKJU+s3FoPcwtC5hpq/EwoYDm7Q296MKNUEia8UCFo/tAuSD
	lPibv6S59jrAPb1PoUZROAhMUjdBCSPoqZQMOi8=
X-Google-Smtp-Source: APXvYqwdSh3AkQE0AXdBd/SiN6Run+7JjJv4vT87WHo4nRnOr5vtaecENKg4mi6gBtjISVynXNiRevDpNgeJl5FKOQU=
X-Received: by 2002:a19:750e:: with SMTP id y14mr24710590lfe.74.1556301386759; 
	Fri, 26 Apr 2019 10:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190424001333.14948-1-alistair.francis@wdc.com>
	<a824b9bf98abc6545575514aa58e97e5f6347ada.camel@linuxfoundation.org>
	<bccaa968-1653-f9b1-4b75-8e72337dcd7c@gmail.com>
	<CAKmqyKOyQ82yYZzuqDBgM_+-6=czN4Xg8npAWxkXvNkch0JXpQ@mail.gmail.com>
	<f25bf5236a45b8494cf1cc4e8bb7e7b7e05ac3bf.camel@linuxfoundation.org>
In-Reply-To: <f25bf5236a45b8494cf1cc4e8bb7e7b7e05ac3bf.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Apr 2019 10:54:36 -0700
Message-ID: <CAKmqyKN195L_QuSiE5CsSfRMkczBJ9kRZwBUzr6DoT=5cMDA4w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Upgrade from 3.1.0 to 4.0.0
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
X-List-Received-Date: Fri, 26 Apr 2019 17:56:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 26, 2019 at 6:40 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-04-25 at 11:24 -0700, Alistair Francis wrote:
> > On Thu, Apr 25, 2019 at 7:27 AM akuster808 <akuster808@gmail.com> wrote:
> > >
> > >
> > > On 4/25/19 6:49 AM, Richard Purdie wrote:
> > > > On Wed, 2019-04-24 at 00:15 +0000, Alistair Francis wrote:
> > > > > This commit upgrade QEMU to the latest 4.0.0 release.
> > > > >
> > > > >  - The COPYING.LIB file has changed SHA to:
> > > > >     "Synchronize the LGPL 2.1 with the version from gnu.org"
> > > > >  - SDL 1.2 has been removed, along with the --with-sdlabi command
> > > > > line
> > > > >     arg
> > > > >  - The backported patches have been removed
> > > > >  - Al the other patches have been refreshed and the numbering has
> > > > > been
> > > > >     updated
> > > > I put this in for testing but it failed as nativesdk-qemu doesn't build
> > > > due to unpackaged files:
> > >
> > > Bug opened: 13308
> > >
> > > Thanks,
> > >
> > > Your neighborhood swat team.
> > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/535/steps/7/logs/step1b
> >
> > I have updated the patch here:
> > https://github.com/alistair23/openembedded-core/tree/alistair/qemu-4.0.0
>
>
> Thanks, this worked better in testing but showed issues with qemuarm
> booting:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/535
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/549

I can't reproduce this failure to start (build 549) with my QEMU 4.0
patch applied on master.

I also can't reproduce the ping test failure in build 535.

I do see SSH failures, but I think that's more related to my TAP
set-up (which has never seemed to work correctly) more then anything
else.

Is it possible to get more details from the failures?

Alistair

>
> I took it out of -next again and those passed (but some of the other
> build failures also in that build remained)
>
> Cheers,
>
> Richard
>

