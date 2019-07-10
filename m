Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 636277EF45
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 14:38:21 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id x25so2362837ljh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 07:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=aiF/EoCsRD9Xh8BnjMReNyAl32/aQdwqWXh6FPzcAwQ=;
	b=uEAeGiqiQ6MpIBUZga+o6McJOyi+c68I5xfVuo3XG4kaETav0BKzLAgOJC508UxzDx
	GMRVOYshMWHYnfOQNeb5QMRG6HwdayHPgEt5UVpg6JCNANl0AGdAsIc7/KKXu2UHSxJK
	bCuRYvDFTmONKfqPXNIGNDD9b8mehIsFW1nBKYLDt9CTGEvSywsqz2wJnHJEgKFg+M1B
	Q/OnsGrt/elI0dXR/ktK8UJj7ta5pZ6mW+98XZwGEAfBwDm6YSY6zW3N93gLjBUxfdhf
	cR7BFV1py7tnMZz36rfDV8bw89pvflsiKGwFhmLIiMHAoDK0rt9VXwThFCY7Qz4vtsq1
	Yiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aiF/EoCsRD9Xh8BnjMReNyAl32/aQdwqWXh6FPzcAwQ=;
	b=Uv7cu5R9pg4E+AYLPfvLSaBGl0ODf4lrwkv6e8H9ifhj91VENB4FcEhXi25clTkMMK
	2moppiGiZ5AZHjOMTQ6O8FtQEl5A4RusrfY1kv0h0+/lOr/6mI75mYR628uqWcqRS2bq
	3O2r+jCAvDKosS1YKfye+gjme7+rXyEg9+14MHbJ/wX/iRi4dV6RKDBXccnbvRb2C7y9
	LDfra+pqF/eMgeStkffPO5NdGkYY3R7an8oCcqmdQiAevpEG/iQ3LB+QfnnshUxxr4tA
	u9/wwMTfupT8lUcGHlRFgs4EBDImxAq7R+KD3BzyZDGEEsiH6Sp9hWOxweh39sqwL7tb
	dCrA==
X-Gm-Message-State: APjAAAXr9O8xJPle7QuCMOzg7PZf1zXfa+fDxOpgCgadZKuKHCeLPOJX
	Bs063ltwYDASO/1ue31IhIU0erXnIDMYiai0vxs=
X-Google-Smtp-Source: APXvYqxzYUJy8PAHpSSV4QcRpPrSPpBb5ExHZL2T47WEHmnkgxIMjL2RSk0ViqQIOmmIKJSy0YkDQ4fLqa0EqJmW61Q=
X-Received: by 2002:a2e:b048:: with SMTP id d8mr15497896ljl.118.1562769501873; 
	Wed, 10 Jul 2019 07:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
	<895d9d6d6e611652f3e144561811868b1df15cf6.1559220004.git.bruce.ashfield@gmail.com>
	<df9ca430-ee2a-5428-2528-28604e1b5bce@geanix.com>
	<CADkTA4OpSXaKOvWO7uQr-ydpN5-jEwwQsvFUw9f26w_xLWyj5A@mail.gmail.com>
	<6bfc6569a78a2a12f6172a7323f9fb1a6149a6b0.camel@linuxfoundation.org>
	<ff3ad9df5905fed05c2a328e1fc541b29fd7e101.camel@linuxfoundation.org>
In-Reply-To: <ff3ad9df5905fed05c2a328e1fc541b29fd7e101.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 Jul 2019 10:38:10 -0400
Message-ID: <CADkTA4O0SX8eWAsh-5j8SPiae03k90j8H9azSx9gVU8EnMiy+g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/9] linux-yocto-dev: bump to v5.2-rc
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
X-List-Received-Date: Wed, 10 Jul 2019 14:38:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2019 at 10:28 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-07-10 at 15:27 +0100, richard.purdie@linuxfoundation.org
> wrote:
> > On Wed, 2019-07-10 at 10:21 -0400, Bruce Ashfield wrote:
> > > On Wed, Jul 10, 2019 at 10:15 AM Martin Hundeb=C3=B8ll <
> > > martin@geanix.com>
> > >
> > >
> > > Nope, I haven't seen that. But then again, all my machines have
> > > realpath available.
> > >
> > > As you hinted, building all of coreutils as a dependency for the
> > > kernel is a bit heavy. We could make
> > > realpath a host requirement,  or otherwise, split out realpath (but
> > > you'd still need to build coreutils, so
> > > that really doesn't help).
> > >
> > > I'd lean towards just making it a host requirement .. but I'm sure
> > > Richard can advise better than me
> > > on the pro's and con's of the options.
> >
> > realpath is in the standard HOSTTOOLS in bitbake.conf so its already
> > required?
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/conf/bitbake.conf?i=
d=3D12e1a0de18fc05e68be8e6f1688c1499e37b076b
>
> and yes, I'll have words with ross about commit messages :)

As the guy who can't spell scsi in commit messages, I shall throw no stones=
 :D

It looks like we are covered, and I just confirmed that I can build
and boot the full 5.2 release.

Bruce

>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

