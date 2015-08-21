Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 68A3660557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 12:15:42 +0000 (UTC)
Received: by oiey141 with SMTP id y141so40305942oie.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 05:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eGQG0XpD0qqidcAZj0EQD4m2SWHaCDUe4LKWR0EgTHY=;
	b=Vyn06nIRpcsYIpRjZTZLCHuctUSS9K6NGzPixu+A8q5VJSVf1UErWSugJtQqV9IIcz
	2Wiei7gJUYb4aUuv5dtRBAg61mIL1CwPsM2/J6NSpGnXl/XMPgDD6PfFFnrq2TzNB7QB
	6dD71OT+q+53LSlZgSvvF5G04OtRftWCA2FCAg+87t+5A+H0MjfTvg44NcBqLRFAoHeI
	sALAxaXRxF1tDfYxaDHndWdL5Quwg/tVI5VcTIg3tuE+GAo9Cf8tXb80vxXfkdqpqtbx
	lXVgHrzlpfoXpg5HEcavEBNola4KisD75o1DkidKJFvUxBicSAFWruZn3fK1nMPKkHfy
	sd0w==
X-Gm-Message-State: ALoCoQkJrzne57EDpsqikgxxIJ77TRrirpOzLbf8nGgjQ+hvcEat8+u8azJZGhu4U4jTUWaA1p7Q
X-Received: by 10.202.206.135 with SMTP id e129mr7315375oig.132.1440159342979; 
	Fri, 21 Aug 2015 05:15:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Fri, 21 Aug 2015 05:15:13 -0700 (PDT)
In-Reply-To: <20150818083534.GD2458@jama>
References: <CAHiDW_EGaGer0d0RVaqzT6ats9aqDEpzMieUxwbgYffVRYADbA@mail.gmail.com>
	<20150818083534.GD2458@jama>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 21 Aug 2015 15:15:13 +0300
Message-ID: <CAHiDW_G7Q70G+yWckwfb9Wr=f8kVL0cvnahPyDXsiKrZfu8aGg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gnutls/nettle/gmp licensing and versions
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
X-List-Received-Date: Fri, 21 Aug 2015 12:15:43 -0000
Content-Type: text/plain; charset=UTF-8

On 18 August 2015 at 11:35, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Aug 13, 2015 at 03:42:45PM +0300, Jussi Kukkonen wrote:
>> On 12 August 2015 at 17:14, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>> > Hi,
>> >
>> > I realise I'm a bit late (with the commit in master already) but I'm
>> > looking at upgrading this recipe and had some questions on this patch
>> > and the recipe in general.
>> >
>> > On 9 August 2015 at 08:28, Armin Kuster <akuster808@gmail.com> wrote:
>> >> adding the license definitions on the few packages that
>> >> deviate from the overall package license.
>> >>
>> >> based on http://www.lysator.liu.se/~nisse/nettle/nettle.html#Copyright
>> >> and spot checking files.
>> >>
>> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> >> ---
>> >>  meta/recipes-support/nettle/nettle_2.7.1.bb | 9 +++++++++
>> >>  1 file changed, 9 insertions(+)
>> >>
>> >> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
>> >> index f53afcc..f9d331f 100644
>> >> --- a/meta/recipes-support/nettle/nettle_2.7.1.bb
>> >> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
>> >> @@ -2,6 +2,15 @@ SUMMARY = "A low level cryptographic library"
>> >>  HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
>> >>  SECTION = "libs"
>> >>  LICENSE = "LGPLv2.1 & GPLv2"
>> >
>> > I think this is wrong, whichever version you look at -- our current
>> > version is just "LGPLv2.1+", the current upstream release is "LGPLv3+
>> > | GPLv2+"
>> >
>> > I'm going to send a patch upgrading the recipe to the current upstream
>> > release (and setting license to "LGPLv3+ | GPLv2+"): it might seem
>> > like this makes gnutls effectively LGPLv3 but that actually happened
>> > last year with the gmp upgrade. Comments on this welcome.
>>
>> Alexander just pointed out to me that there was a discussion on gnutls
>> and nettle already in July (which I missed in my
>> back-from-holiday-email-binge). It seems that the consensus was to
>> preserve LGPLv2 versions.
>>
>> This is what the current situation looks to me -- please correct if I'm wrong:
>> * gmp is "GPLv2+ | LGPLv3+"
>> * nettle is "LGPLv2.1+" but depends on gmp
>> * gnutls "LGPLv2.1+" but depends on nettle
>>
>> This effectively makes gnutls "GPLv2+ | LGPLv3+" as far as I can see.
>> If we want to preserve a LGPLv2 gnutls, we need to bring back an older
>> version of gmp (I think 4.2.1).
>
> I agree, recently we had to downgrade gmp to 4.2.1 in our layer to pass
> our license check. Similarly we had to check that all nettle libraries
> used in our image are LGPLv2.1 not GPLv2.0 - that's why I've suggested
> to package them separately, so that we'll see only LGPLv2.1 nettle
> package in our image.

Reading the commit log, it looks like gmp 4.2.1 was removed by
accident (the license problem was not understood at the time).
I've filed https://bugzilla.yoctoproject.org/show_bug.cgi?id=8197 for
this issue: we can continue there.

Bringing back 4.2.1 seems like the least worst option: if you have a
useful patch (other than just a revert of the removal), please let me
know.

Cheers,
 Jussi

>
> Regards,
>
>> >> +LICENSE_${PN}-cast = "CC0"
>> >> +LICENSE_${PN}-gosthash = "MIT"
>> >> +
>> >> +# both public and GPL license listed
>> >> +LICENSE_${PN}-md2 = "CC0 & LGPLv2.1+"
>> >> +LICENSE_${PN}-md4 = "CC0 & LGPLv2.1+"
>> >
>> > From the reference I had the impression this "LICENSE_something"
>> > construct would imply there is a package "something". But the nettle
>> > recipe does not produce "nettle-cast" or any of these. What is the
>> > purpose here?
>> >
>> > Thanks,
>> >  Jussi
>> >
>> >> +
>> >> +
>> >>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>> >>                      file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
>> >>                      file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
>> >> --
>> >> 2.3.5
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

