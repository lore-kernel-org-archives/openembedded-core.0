Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51])
	by mail.openembedded.org (Postfix) with ESMTP id 576956C397
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 23:44:56 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id u21so5584409lfu.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 16:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uINpP6Kv9zlTPxUDgYyssucduKslB2Gr0bWokOVmgqg=;
	b=pR1sPmQCYy+AOqE9HbQoZDvHJW6dUZlPmpFHk2CgcLjRC5vPT4aYjsktQqy/dbfhsv
	8Abwc+6MWifLB4tMMDT7ov7lGY45OGFLkTTN0acR7gl/LeqkupHBb9GbyXrL5CmEb//Q
	1dzrTqxwusPlEcb9Kvv8QhrTj4ZZEvyNqDAW7MmkB/8Za1d46c+iRSuXa6t0pb/Jr1tf
	ooiOP4KJbxGVIDK2nVlToQFwbJEF6TWq7SWWPmoQ4HXrAW0JnV9OLFAL093EtSZ7avkx
	XGmlYqTGjoNZdDHgWNu/BaCI43Ika4trZaPiiH6TbXKdqZm3lZ5db4RNMjSwxnluMHYD
	Mzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uINpP6Kv9zlTPxUDgYyssucduKslB2Gr0bWokOVmgqg=;
	b=F0bZBEJckNt9iEKACDiq6Imo9C5np5Y6gNSpu311Lxn+Wfkh3Ngpbrs3jckECzhMyB
	O6oqLmTF2mYjyrZIt/lwXIbQgUYbgjPESYsbaLn4LIePDHyyJycMI1qWvYBTb0S9yNQe
	jlT22k1fnqOXyNJSw+Yg858oMonu9JS610xWx26lNyIEADGduwQOR8kJpnnSpAFucoO4
	B92Wl4H9O/T1TV/rDPdQzpQyBoFyvYPsfrWU02AUlYw5daqDFXTETDsy0buwJUepHDI4
	iK3aT2NdIAdeMlQexOgbTWzG5ohfKVMPkyLgN1zbiSi1LG4vVSeoV9o8OWSVDq330Dl5
	Y/VQ==
X-Gm-Message-State: APjAAAVhZEnPOMcDM07RRQxCyb7QerjKPX3iy+vCUstWPhQ4loMpkmZU
	45J0+kuQRPV52fYPL+gDzuWQWDb2hzb9fH66nZU=
X-Google-Smtp-Source: APXvYqwFxhbRN+G1vkXnzptj2udkfVFQ0UHUONWIvwpiJVKruPbhCYuUq9sAhI10S4+LS0TICY8jEoIf8mVweZ0aEe8=
X-Received: by 2002:ac2:491e:: with SMTP id n30mr449997lfi.13.1554507896826;
	Fri, 05 Apr 2019 16:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <cfd56541-43c4-5128-3d41-cddc356a3cb8@gmail.com>
	<CADkTA4MT3JctYMTFjLZXtJYgaxj6HG=G_nAAe+w0A-JRGXRFxw@mail.gmail.com>
In-Reply-To: <CADkTA4MT3JctYMTFjLZXtJYgaxj6HG=G_nAAe+w0A-JRGXRFxw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Apr 2019 19:44:45 -0400
Message-ID: <CADkTA4OKO4NyNBCOZJ8QG5WoUXa_w8=GTvGFt54dQB04hq-ZXg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Worries kernels supported
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
X-List-Received-Date: Fri, 05 Apr 2019 23:44:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 5, 2019 at 7:42 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Apr 4, 2019 at 5:28 PM akuster808 <akuster808@gmail.com> wrote:
> >
> > Hello,
> >
> > I noticed there are 3 kernels in Warrior. 4.18, 4.19 an 5.0. Do we
> > really need 4.18?
> > I see its the default version for poky-tiny. 4.18 is EOL but maintained
> > by Windriver.
>
> 4.18 needed to be around through M3 to backstop some layers and references
> that were being updated.
>
> I may delete it as part of M4, but really, since I kept it through M3, I may not
> churn it in M4.  I handle all the support load on the linux-yocto
> reference kernels,
> so it shouldn't cause any one harm one way or the other.
>
> I keep a very close eye on the versions, so nothing is around by chance or
> by mistake .. and best to just copy me on the email, since I can
> easily miss them
> in the noise.

... aaaaand you did copy me.  gmail sucks at showing me the headers
and I just got off 27 hours of planes,
so sorry about the noise.

I also meant to say, if someone wants to update poky-tiny to use 4.19
(it wouldn't be a huge effort, but
there's probably some config wrangling needed), I would definitely be
willing to remove 4.18 from master.
It will definitely be gone after the upcoming release.

Bruce

>
> Bruce
>
> >
> > regards,
> > Armin
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

