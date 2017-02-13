Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7C3731C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:37:03 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id x75so9435136itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 07:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=YdRfsL3Xixs7u5IWwX8xMy48U901r7yqbjbAtqVmYFo=;
	b=DHW4iN3BTY8G7D3yG61zjPFtH3x32M4biduXKcDVHmVibiEORrwk9szTTisBj7foBd
	5NMmwWJpJ760RBjwi1AjiqAY+N8oLwLtp1kGQ/xFKFoUNqvk/tXEwLqcaY9yA9+su+QK
	b+8I8D6cxIdkQ6Va6CiXu6s42xqI07ROrRMuvu9S+2YtiHdtMPL0xIO+KOuSwwQYAe3w
	GEykBTVJwyR/F6nhaz5sFMd2iFVrJjxYWV2FwtENFm3x2Yk3D6zSoIeOiOB23bKjK7c9
	xstjCjOqmxqEu9XVIrPNyfLOvbL0rBCztA7Ppexi+n4JKuzcWeFgOIAY/9dfSJFPimzD
	uRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=YdRfsL3Xixs7u5IWwX8xMy48U901r7yqbjbAtqVmYFo=;
	b=VdB8MdzLuWNroAb+2QbPxo+Iup+3dFuPhjNWj6iNUHEDXAicBvGg7glNtixwd1sqmP
	8Xom/zRqHFUFp9zSjg1kAsSIPzjJIUVdyugOxr73b4DJwAexfg/iS6vhGAZL0UTrI4Pe
	7sWqZmCZWs9uYv8e6/UQ1tU89qeThG3ld7cHx4VNoOo2QQ0cAelVCG5Cyn7eMDsJvQmB
	CzufX5ZcR0gP6SysgSa25aHv5Fo5uaTAYpBUxSarfCDbzc18vABMCCn4EMllnSJ/70mY
	GJbii/r+iCzaeSpeaznSHU3dig/4gQLe7ozSGE0iQr+gaVw03N7BsVBDcofZQeoW5+7b
	mFwA==
X-Gm-Message-State: AMke39nZgYMATDU3kpjOWApdq4af8PWaKy1KTyYgv6/qZG+BSGQ5dNkOgzDTGlOFcAeIdK7k
X-Received: by 10.107.47.195 with SMTP id v64mr21055036iov.85.1487000223961;
	Mon, 13 Feb 2017 07:37:03 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DB6A.dip0.t-ipconnect.de. [93.232.219.106])
	by smtp.gmail.com with ESMTPSA id
	188sm1870567itm.12.2017.02.13.07.37.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Feb 2017 07:37:02 -0800 (PST)
Message-ID: <1487000220.13854.243.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 16:37:00 +0100
In-Reply-To: <20170213153245.GC3280@jama>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
	<CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
	<1486999455.13854.241.camel@intel.com> <20170213153245.GC3280@jama>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Mon, 13 Feb 2017 15:37:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-02-13 at 16:32 +0100, Martin Jansa wrote:
> On Mon, Feb 13, 2017 at 04:24:15PM +0100, Patrick Ohly wrote:
> > On Mon, 2017-02-13 at 15:36 +0100, Martin Jansa wrote:
> > > Hi Andreas,
> > > 
> > > 
> > > I think it's feature which was already there, but almost never
> > > triggered (even in test-dependencies.sh tests), but with RSS it fails
> > > reliably.
> > > 
> > > 
> > > See:
> > > http://lists.openembedded.org/pipermail/openembedded-core/2016-July/124435.html
> > 
> > That's not quite the same, if I understand it correctly. In that email,
> > Richard was talking about "dependencies of that target are not needed
> > and not installed" and used "quilt-native" and "compiler/toolchain" as
> > example. In other words, if recipe foo DEPENDS on bar for getting foo
> > compiled, that dependency on bar gets ignored when installing "foo" into
> > the recipe specific sysroot because it shouldn't be needed anymore.
> 
> I'm not sure if it's the same or not, but back then I got very rarely
> missing dependency on wayland-native or qtwayland-native, now with RSS I
> got 20-30 recipes failing because of missing dependency on
> wayland-native, qtwayland-native or qtbase-native to stage the scanner,
> moc and other native tools in recipe-sysroot-native.
> 
> And Andreas issues look similar to that.

I'm sure Andreas can clarify, but "kdoctools which depends on
gettext-native" sounds like a runtime-dependency to me (but I'm just
guessing that kdoctools wraps gettext, I don't really know).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




