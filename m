Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 181977E21C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 00:59:59 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id h18so40294864qtm.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 18:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AiX7LOa0IZPlPu/cicRFfvZ+jriNMILlqbq/dzrB49Q=;
	b=MRjjn3Ilh10yu50LorvONal+PoaJlgNU1upSc3N2KnYVH9lIdc47dP5lJTDgkpHuxD
	e7H8nuYvg3IqKt7ElTx21yaySP4+tgNcKKSC9AbXo6GRqAY6EVmTnnSN5Xgm3QTM3skz
	5iHsB/IqD+nQuc4iXjSC8eoNXlEDqDwlT4Mu/DMcBXw/Lxva6Q3YHMf/RpA3U8vih0Mg
	LWJpbvO2VgobVIbV10JKQ5jutR/x7AkMMewikimlIqJMjBWfdkLKxNDq/ncpX+ZDR1Qz
	rY3/zIYT69HVj8y/489i3q4wM4k1kvv3RMeoZLkWRgHAtB7L5jK5kA5RkSghijoBpfdY
	digg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AiX7LOa0IZPlPu/cicRFfvZ+jriNMILlqbq/dzrB49Q=;
	b=e/ttrm2LjUQtt/v3z0KYq74xuimUthTML4fX0XN6ysS2QXEbhGpJhPOa25qZ18px6R
	pjxmXg34YTuRyOYx3MkzWeWhjyHev32D3OW19q0/mXmhA58goXlAcV2cHMg6V/tfpI+Q
	yJBFOFM5NHOMNf5/z9r3aJAiI/IfVV283uzsQ89va/3O3Fxgetf3EW5fB599pOajZler
	cjc45lwEB78jqkjLNB0WAOE71Ut4w90kLo0KN84zoV2P7gRTquUrwYV9dKpX1Dg4CUZl
	cotihSrAk5SX4DcsiOrEucezmIHCr69tSRPgtVirvKJ93FMyAVXdP+OYW2lSarizTXyR
	ZQMw==
X-Gm-Message-State: APjAAAXhSgYwTqt2BH424SsgbllqHXD7yUSKKRjTZGz+BCrleo2zmeNG
	vvJpB1vKkL5grZ6Q4YgJn3pqdyXsxbZikPCD+pA=
X-Google-Smtp-Source: APXvYqyX7twN8BnC2XuhqbUXSiW9YitpavtDJ46YzBRA8PCfHYusj9kDqV++89F6jHwYJDIks7uCOB9Ydm7NWhYTPgU=
X-Received: by 2002:ac8:525a:: with SMTP id y26mr51231728qtn.378.1563843600605;
	Mon, 22 Jul 2019 18:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190722144809.14972-1-ross.burton@intel.com>
	<f4a6845ad7408e22bb84a85da103f53ffd5b1736.camel@intel.com>
In-Reply-To: <f4a6845ad7408e22bb84a85da103f53ffd5b1736.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jul 2019 17:59:44 -0700
Message-ID: <CAMKF1srhurgFYqP0sEgdHn7jpYY44ihY=3r2Y=hRz_R21Rzi1w@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libical: upgrade to 3.0.5
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
X-List-Received-Date: Tue, 23 Jul 2019 01:00:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 22, 2019 at 4:17 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Mon, 2019-07-22 at 15:48 +0100, Ross Burton wrote:
> > -LICENSE = "LGPLv2.1 | MPL-1.0"

this should be MPL-2.0 | LGPL-2.1

> > -LIC_FILES_CHKSUM =
> > "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
> > -
> > file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
> > +LICENSE = "LGPLv2.1 | MPL-2"
> > +LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
> > +
> > file://LICENSE.LGPL21.txt;md5=933adb561f159e7c3da079536f0ed871 \
> > +
> > file://LICENSE.MPL2.txt;md5=9741c346eef56131163e13b9db1241b3"
>
> Should this be MPL-2.0 instead? This is causing warnings:

the license is MPL-2.0 but the license file name is MPL2.txt so this seems fine.

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/862/steps/8/logs/warnings
>
> Thanks,
> Anuj
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

