Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QuW7I-00006L-0B
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 22:56:37 +0200
Received: by gwb11 with SMTP id 11so1867313gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 13:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=aDhivt6XvI54QsGH0J4iNj0QLvyxRxf17YZN0p3lb8E=;
	b=XCMFury3eSIjq3Afa+CZR3RcuzH6o28E5fuIOT6O9T35iP8j+yASY4RKKIIHFM7rzp
	OHaCDjFEKNmnnp92QcmOph/6W2/2cLnKbKvyW5pGQEevmRsjN2mbZ9gI+XK8XNYsnl0p
	22IS/ZpOelJfL5JY9+DK2cfCgh8N735fwrZGg=
MIME-Version: 1.0
Received: by 10.101.177.17 with SMTP id e17mr184732anp.164.1313787111427; Fri,
	19 Aug 2011 13:51:51 -0700 (PDT)
Received: by 10.100.95.3 with HTTP; Fri, 19 Aug 2011 13:51:51 -0700 (PDT)
In-Reply-To: <1313774678.13995.123.camel@rex>
References: <cover.1313730559.git.bruce.ashfield@windriver.com>
	<e7036174cf607031e13323564f402c7b805e4572.1313730559.git.bruce.ashfield@windriver.com>
	<1313746981.6733.268.camel@phil-desktop>
	<CADkTA4MaaydRfb0YCgXOF1NGZbVcGV3Z+iEAo_qqtxSz57rdyw@mail.gmail.com>
	<1313774678.13995.123.camel@rex>
Date: Fri, 19 Aug 2011 16:51:51 -0400
Message-ID: <CADkTA4NoyPO+VqHANOMd8VYigYw9-64-Fuz39JFfmVJ7zKLeLA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/3] linux-yocto: restoring LINUX_VERSION ?= "3.0"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Aug 2011 20:56:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2011 at 1:24 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-08-19 at 08:53 -0400, Bruce Ashfield wrote:
>> On Fri, Aug 19, 2011 at 5:43 AM, Phil Blundell <philb@gnu.org> wrote:
>> > On Fri, 2011-08-19 at 01:20 -0400, Bruce Ashfield wrote:
>> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/reci=
pes-kernel/linux/linux-yocto_3.0.bb
>> >> index 44f1ebe..5d9871f 100644
>> >> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>> >> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>> >> @@ -11,7 +11,7 @@ KMACHINE_qemuarm =A0=3D "yocto/standard/arm-versati=
le-926ejs"
>> >> =A0KBRANCH =3D ${KMACHINE}
>> >> =A0KMETA =3D meta
>> >>
>> >> -LINUX_VERSION ?=3D "3.0.1"
>> >> +LINUX_VERSION ?=3D "3.0"
>> >> =A0LINUX_VERSION_EXTENSION ?=3D "-yocto-${LINUX_KERNEL_TYPE}"
>> >>
>> >> =A0SRCREV_machine_qemuarm =3D "36b4cdddcafc711f0ec9ad97882f23a6443c61=
b2"
>> >
>> > That's going to cause PV to go backwards, right? =A0If you're going to=
 do
>> > that then you probably ought to consider bumping PE to retain
>> > monotonicity.
>>
>> Indeed. I always just think of LINUX_VERSION as yet another package inte=
rnal
>> variable (from non-bitbake experience), so tweaking it has no impact
>> on this sort
>> of thing.
>>
>> I can look into changing the epoch .. but not until Monday or later in
>> the weekend.
>
> I'm not 100% convinced that this is a good idea. I'd really prefer the
> kernel accurately reflected the version it was. Can we not do:
>
> PREFERRRED_VERSION_xxx =3D "3.0%"
>
> to get around the preferred version issues?

Both Darren and I tried variants of this but couldn't get it to match, but =
I can
certainly try again. This was also my first attempt when bumping the string=
.

But as I mentioned multiple times before, even changing the version with
sub releases is a change from how I handled it before, so from that point
of view, I never should have entered into tweaking this. :)

Bruce

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


