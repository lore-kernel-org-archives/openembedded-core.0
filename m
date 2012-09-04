Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T90si-0003W1-NX
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 23:42:00 +0200
Received: by eekb57 with SMTP id b57so2294333eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 14:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GW8jFBNM2Ei2mkJR5ExJ/uoT3tYjtvsHdHDfIbgj/08=;
	b=cw1bZgOhJ2xkiz+3d87ZBkz6F2NFnHd5S+u9T4aTzt90Ne/Z1GKoO/XH5lWSp1cKWh
	z3eIqbJpww6zWHoq3/JRU651XY1TFu+HqVGdR8vtUNLD2+7899VYnt7dbmSaa3NmU3cS
	DpHI1M5IuIibSlmknedJjs/fLjziT3vuRBoOWm/QEwY9aPl4X4NDrwH18DiRW2/Q0tie
	iEXIQJvio330wmq+wPpjO/sD+ixelCiLLg52YwYjsbFVtFMJ+bP+sGYJ6bvTbEjpFNVr
	WgBvF5eQ2nEnfodh3ErPECJH6UCEh2JjLEWytJPD0evtI+CBchh/hE3nrCV9DniBwKmf
	thGQ==
Received: by 10.14.202.131 with SMTP id d3mr28280443eeo.32.1346794178540; Tue,
	04 Sep 2012 14:29:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 4 Sep 2012 14:29:08 -0700 (PDT)
In-Reply-To: <50462C35.6000400@windriver.com>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
	<CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
	<CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
	<CAJTo0LZGcZHwM5cZgjFrQ9tuhw6RLN_g732wBitVgHKo8UigNQ@mail.gmail.com>
	<1346278937.4396.57.camel@x121e.pbcl.net>
	<1346423384.2673.102.camel@phil-desktop>
	<1346428885.16485.29.camel@ted>
	<CAMKF1soyonS_-QFV3XKaz1=i_Krguy4i2Nnt1Ep8O9mkTR-3Jg@mail.gmail.com>
	<CAMKF1sqqWJEwsvng_BHbqACJWhUBDRfW4Nixd2t2O1eADmCE5w@mail.gmail.com>
	<43FF08E0-8A1F-4B64-9552-D5C68A207D0C@gmail.com>
	<50462C35.6000400@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Sep 2012 14:29:08 -0700
Message-ID: <CAMKF1soNQdFWREGh5_BNmBdqgRNk9+Tri+zFR3fvjT_94pYWsA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 21:42:00 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 4, 2012 at 9:28 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>
> I'm sorry, not all devices being generated have initramfs configuration (nor
> do people want that behavior.)   Also we've shown you can build a system w/
> a split filesystem and it works properly.

yes if every package followed this sadly thats a more and more
diverging case now a days.
so do we diverge and it there a compelling case to do so. I would do
it if 80% of our usecase was this one
but this seems like a one off thing so either we find a better
solution or we abandon it. In my opinion
such a thing should be a configure option disabled by default and
whoever has the usecase for it
can enable it but not default

there is a use case where now people are asking can I use this fedora
prebuilt rpm with yocto/OE
and so on and if we diverge too much on root file system layout by
default we can get sidelined.

  The systemd/udev developers seem
> 'lazy' to me... they were unwilling to work through early and late boot so
> they just gave up.

Linux was never supposed to have / and /usr different to begin with

>
> The comments in the FAQ about /etc and /var being local to a given machine,
> while /usr being shareable is a reasonable set.  This is the situations
> where I've seen this used the most especially in blade systems w/ a local
> rootfs on each, with a shared /usr among them all.
>
> I agree it can make some update processes more difficult, but the reality is
> there are already mechanisms in place -- for many products -- that address
> this.
>
> Perhaps one way around the whole argument is simply to redefine the problem.
> (As Fedora and others seem to have done.)  Work on an OE solution to
> construct a minimal boot/configuration system that can load the appropriate
> (combined) /usr partition, and then pivot-root, or similar and re-exec init
> to switch to that configuration?  This is similar in concept to the
> initramfs, but is not tied to a specific technique or technology.
>
> This would still allow for the quick boot configuration (RO mount even),
> udev setup, module loading and such -- and the larger /usr partition and
> upgrade path.


>
> This is not something we have in OE today, and would certainly require some
> custom work.....


