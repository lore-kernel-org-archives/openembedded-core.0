Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7F071989;
	Mon,  5 Dec 2016 18:42:29 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id 20so357621441uak.0;
	Mon, 05 Dec 2016 10:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=h37zbw8DOHLFb/hq9/N4c2hHrRUQfAU2gJysMfIN4TY=;
	b=WT83uCd8FrjYfC0WsfggT96TwlObJ6uLqSJj2ayEvlan8UR685iXCGlJNYuRSBnZwa
	r3j5WZ7un/57L3tb/M0eevD8sNSwGoFPV12xTUgnKtIj1T1/Z21IagkQS/sDkTC0/jzv
	WSnvPQEiTv6hLgKFI1Q7XkQlb5zZ7//5q2ZtaGEUSqhhToJ06butsKbBzRkr6mTQyxhv
	38UTKDeoQKQmc90BJ5AS2RUeKp4igFpaXSlEyWdNqc6woiOV+vQYwkxfqXL1of2EIX16
	2pj1t0ytw/j3whP81lY7onQXPnyR9qabr6WIdKZEvrrTgtDys8lm/n1Jzcl8qmcyNQdp
	rp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=h37zbw8DOHLFb/hq9/N4c2hHrRUQfAU2gJysMfIN4TY=;
	b=djyIhnAIIkRIDPz+OB9HXZUXcbg8oz4Uw3di+tgTz97GuLJlQA82cVFYBxoTWno35z
	Gs5prC8WEAfq8Hnyb0Qg87E9bnZ/rXoIQ0bQcRoKnk6jQ5yJZt1itpzEe8SULA2BQNpL
	RscNIUjB75vr8zAIMjeAwOSiqmVgyXp9OmPxddjkGarXN1vfrG2zo4TmT2+X3NzYP4Ds
	+qMolANz+r/LCdZLx7H5AkMcye2xLzNTvKa8Ci1u9WbcPuG2uQVCduHQVAmUkLiumP9K
	QhcoxPa/kbOBk5TvYWVHJ/CFwkCZWJz7fHjQn8KMkItJFy4z2VA6MB7V567fEfJMfK2O
	Z7GQ==
X-Gm-Message-State: AKaTC01It2WJYABtHXQc2dro5IU6c5sSKV/yP11IADEot2aZcJ0sfWXWKD+BymTnm165g+p4r873k31bgFCa3Q==
X-Received: by 10.176.84.8 with SMTP id n8mr9939370uaa.29.1480963351119; Mon,
	05 Dec 2016 10:42:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 5 Dec 2016 10:42:00 -0800 (PST)
In-Reply-To: <CAKV_0ei2fHx-byfoVD85KFEpKkA23jgoVC9PUyK=6gJZQGTugA@mail.gmail.com>
References: <CAKV_0ei2fHx-byfoVD85KFEpKkA23jgoVC9PUyK=6gJZQGTugA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Dec 2016 10:42:00 -0800
Message-ID: <CAMKF1spKHmuzxvW=JtWp7LPRFfDkb24A4sdUp7-hL1dqU16Mgg@mail.gmail.com>
To: Brian Avery <avery.brian@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] RFC BuildAppliance future
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
X-List-Received-Date: Mon, 05 Dec 2016 18:42:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 5, 2016 at 10:04 AM, Brian Avery <avery.brian@gmail.com> wrote:
>   Please note, this is going out to 3 lists in an attempt to insure that =
no
> one who would be impacted by this change misses it. Implied spam apology
> included.
>
>   The Yocto Project currently provides a virtual machine image called the
> Build Appliance
> (https://downloads.yoctoproject.org/releases/yocto/yocto-2.2/build-applia=
nce/).
> This image can be run using either VirtualBox or VMware. It enables you t=
o
> build and boot a custom embedded Linux image with the Yocto Project on a
> non-Linux development system.  It is not intended for day to day developm=
ent
> use, but instead, is intended to allow users to =E2=80=9Ctry out=E2=80=9D=
 the tools even if
> they do not have access to a Linux system.
>
>   We are considering replacing the VM based Build Appliance with a set of
> containers (https://hub.docker.com/r/crops/poky/, or if you want a user
> interface (https://hub.docker.com/r/crops/toaster-master/ ).  These
> containers currently provide most of the functionality of the Build
> Appliance and should shortly be at feature parity with the Build Applianc=
e.
> We are actively adding to and supporting the containers as some of our
> developers are using them in their day to day development in order to
> benefit from the host isolation and ease with which other distributions c=
an
> be tested.
>
>   This is an RFC to see what features in the Build Appliance are importan=
t
> to you but would not be provided by the container solutions.  If the
> community would be just as content using the container approach as using =
the
> VM based Build Appliance image, then we=E2=80=99d be better off deprecati=
ng the
> Build Appliance and applying those resources elsewhere.  If there are
> important features the Build Appliance provides which the container solut=
ion
> does not, or cannot provide, we=E2=80=99d love to hear what they are!

Personally, I dont use build appliance but I think using containers is a go=
od
step forward, provided, we can address all build host OSes that
virtual appliance
could.

Build appliance is also a sort of "eat your own dog-food" for ensuring that=
 we
are doing ok on preparing cloud images for deployment. Hopefully we wont
lose that testing, may be we can add another image to cover that.

>
>=E2=80=A8Thanks in advance for any feedback,
>
> -Brian
>
> an Intel Employee
>
>
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
>

