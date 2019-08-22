Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0922C7E773
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 03:35:11 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id w7so1518257uao.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 20:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9Vk85v04XyhqWcDdvRu09FKrLlagT1c4exB19zsJ5WE=;
	b=oe/Oxq0nGr/ICGQ6er3ECzSZ6g022h4MfSoLKSCPo+PQtJIXS6H/o5ErXu0El6RbQ4
	Wj/MLJV67I0RcoyGD5e+MNCz49Bze7RyHLeOjfZ/6pAWoS2GcmWKcJ/BE4BxzzywUG73
	kZ+jwQgWPnYLnfE4l+XnJeVxwX93vhaHcvQ4KxJGAQBp4Vac7eenQGJBhODkmYIwkrww
	4nU7W9U2pFydLXnDZay6OcbQjupbI23a2oq5RtABjmPrnU/V5VD05Uuz29CKDJuEj339
	KmAa3xyzGgyEx2HY1TlfO35kVkT2RARjoBrex0t/nIHg3NWJNIVqqG61oDnsT7Rciyko
	17Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9Vk85v04XyhqWcDdvRu09FKrLlagT1c4exB19zsJ5WE=;
	b=nbXu8T90Oxq5ky7kCsKAvSsvN6D/6/LuIrYBK4kDwOkz3d89L8/yUrmY+S4/PCmp4l
	1sFVQI2/eYByQbPyHu8IAPsz6iygH7kWl4Zutnl+ZxwEaut+h4zxwgT8qarizcuKWOq0
	mhU8cdc6mPGzrnTQuTZS7ewPUqfLWa7sXD0jO0T0Z0CGRM2alc7q5/EDYp6PIP13RwTW
	hxtvw1cJ2U3+fjPV4UNisitwFOrrntPWHUwl8mk+i9U98df0IDW8g/JK5esOI/yO0nAt
	PoKHT36McJzL7lc4y5GkLNgeSkk8mTPdQcRf+kqGEdRSDwHpYN1Q84g+i6EqB7Lfnfji
	a6pA==
X-Gm-Message-State: APjAAAVy9Vx7CJ77a38WF5xcKwx9LiB3PNk8COgnZIN+V3ume7bXL1Tv
	cF3vtCzHQn2Qk5z2EdB0nzAKSj1/iD33JmTI1D0=
X-Google-Smtp-Source: APXvYqzVM9s72xDOV96bCIJMxlsAysa7S1sJmLD07o/wsCGjC1b2YUK6RmUNFjiYJCW/0JVNiojepCLRUXuzE40c1Yg=
X-Received: by 2002:ab0:3384:: with SMTP id y4mr4483529uap.106.1566444912635; 
	Wed, 21 Aug 2019 20:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <1566417666-22515-1-git-send-email-Trevor.Gamblin@windriver.com>
	<1566417666-22515-2-git-send-email-Trevor.Gamblin@windriver.com>
	<aed232e0-f899-bf56-d040-a7a671d3bee3@windriver.com>
In-Reply-To: <aed232e0-f899-bf56-d040-a7a671d3bee3@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 21 Aug 2019 20:35:01 -0700
Message-ID: <CAJ86T=VEZx1Hc-Xr-yz2FAhbbYws1=y0jjhv9iQ4joJqu7ptOw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] quilt: added less to RDEPENDS list
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
X-List-Received-Date: Thu, 22 Aug 2019 03:35:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 21, 2019 at 7:43 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> Re: [OE-core] [PATCH 2/2] quilt: added less to RDEPENDS list
>
> s/added/add/
>
> When in Rome:
> $ cd .../oe-core
> $ git log --oneline -10000 | grep -i add | wc -l
> 1376
>
> $ git log --oneline -10000 | grep -i added | wc -l
> 19
>
> On 8/21/19 4:01 PM, Trevor Gamblin wrote:
> > From: Trevor Gamblin <trevor.gamblin@windriver.com>
> >
> > The quilt "series" option relies on "less -R", but > BusyBox's implementation of less does not provide -R. It
> > could be determined how to enable it in busybox's recipe,
> > but given the use case it likely isn't needed.
>
> That statement could be misleading, try:
>
> The quilt "series" option relies on "less -R" but since
> that option is not enabled by busybox in oe-core by default
> so hard-code the dependency on 'less'.

Still sounds awkward. Try:

  The quilt "series" option relies on "less -R" but, since that option
is not enabled by busybox in oe-core by default, hard-code the
dependency on 'less'.

Or:

  The quilt "series" option relies on "less -R". That option is not
enabled by busybox in oe-core by default so hard-code the dependency
on 'less'.

>  From 'man less':
>     -r or --raw-control-chars
>        Causes "raw" control characters to be displayed. ...
>     -R or --RAW-CONTROL-CHARS
>        Like -r, but only ANSI "color" escape sequences are
>        output in "raw" form.  ...
>
> In 2018, BusyBox's less added:
>     8528d3d4f less: optional support of -R
> but it is not enable by default for oe-core. While we could
> enable the option, all known use-cases involve larger, more
> developer-oriented recipes such as quilt or man pages.
>
> ---
>
> I maintain that we need to resist adding one more wafer-thin
> 200 byte config to our default busybox config to avoid bloat
> over the years. We wouldn't want the busybox package to burst!
>
> ../Randy
>
>  > could be determined how to enable it in busybox's recipe,
>  > but given the use case it likely isn't needed.
> >
> > Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> > ---
> >   meta/recipes-devtools/quilt/quilt.inc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
> > index dcba62c..433e9b4 100644
> > --- a/meta/recipes-devtools/quilt/quilt.inc
> > +++ b/meta/recipes-devtools/quilt/quilt.inc
> > @@ -78,7 +78,7 @@ FILES_guards = "${bindir}/guards"
> >   FILES_${PN}-doc = "${mandir}/man1/quilt.1 ${docdir}/${BPN}"
> >   FILES_guards-doc = "${mandir}/man1/guards.1"
> >
> > -RDEPENDS_${PN} = "bash patch diffstat bzip2 util-linux"
> > +RDEPENDS_${PN} = "bash patch diffstat bzip2 util-linux less"
> >   RDEPENDS_${PN}_class-native = "diffstat-native patch-native bzip2-native"
> >
> >   RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

