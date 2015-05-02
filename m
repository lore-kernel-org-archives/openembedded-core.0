Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 23945736BA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 May 2015 08:13:29 +0000 (UTC)
Received: by wief7 with SMTP id f7so44335531wie.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 May 2015 01:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=OXMQ8bXocuIKaFhpI0ZVxw3RaNPB1Jv6uWPMGOREStU=;
	b=WnCGN9i+EqUV2WgoFohB+YCQU4Kqo0zOwLDHZnCO7Cu7kyB1fNrlqcS4416EdNfNwP
	s2b7jKhFNOvvNcieujjOjWRqz1ds3FU9c9Otd0gLCyFhLwp5pxTaoCu6nE7k3MVED/CL
	EJkqTeKaavo9omi60dqwTbNykzfGQrb1xj44uqMU14l+/tqYtOSR42DQH7U4cnp7DV/Z
	d+M0y9F6ESi25wBHcH2hcqx3PVsdFIzd7YJiUP7kIP5CQlJ5RWcmAaFb6iuY6+3sAEhs
	DaPWuxEw4ea0HtNONSzgJ9JIkxxV2rCyKxhY2CiavYsv5PqCIcVg4oJq3wojSW9fUaMF
	TeJQ==
X-Received: by 10.180.90.82 with SMTP id bu18mr3283343wib.88.1430554410703;
	Sat, 02 May 2015 01:13:30 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id i13sm1364031wic.13.2015.05.02.01.13.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 May 2015 01:13:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 2 May 2015 10:13:46 +0200
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20150502081346.GD2366@jama>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
	<1430521154.18360.28.camel@linuxfoundation.org>
	<55440C90.5060605@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55440C90.5060605@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Sat, 02 May 2015 08:13:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2015 at 07:30:24PM -0400, Bruce Ashfield wrote:
> On 2015-05-01 6:59 PM, Richard Purdie wrote:
> > On Thu, 2015-04-30 at 21:34 -0400, Bruce Ashfield wrote:
> >> Here is the latest consolidated pull request for the supported linux-y=
octo
> >> kernels.
> >>
> >>   - We have a refresh of the 3.14-rt support
> >>   - bluetooh configuration changes for common-pc/qemux86
> >>   - braswell BSP features and fixes
> >>   - Introduction of the 4.1-rc1 -dev kernel (and associated perf fix).
> >> I've built and booted these on my local machines and qemu, and
> >> everything was sane.

Does it fix the issue I've reported few days ago?
http://lists.openembedded.org/pipermail/openembedded-core/2015-April/104344=
=2Ehtml

> >> The -dev kernel obviously isn't something for deployment yet, but
> >> it builds, and forms the base for follow up config changes, features
> >> and development work. I built and booted core-image-kernel dev with
> >> the 4.1 changes in place.
> >
> > The autobuilder showed up this for an x32 build :/.
>=20
> Can one of the intel folks have a look at this ? I won't be able to get
> to it until Tuesday at the earliest.
>=20
> Bruce
>=20
> >
> > https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/2=
82/steps/BuildImages/logs/stdio
> >
> > Cheers,
> >
> > Richard
> >
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

