Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QucfI-00056y-Id
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 05:56:08 +0200
Received: by gxk3 with SMTP id 3so2524803gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 20:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Hox6o/4t66wOlRrjZJ4GHgLdslf/H+JezVUsKLGJ2f0=;
	b=P7GpLHbAysnuYy5764vQqF2z/JhKtuMO9q1Ffjef06Wbz8klinIcCGUX9aGwKHhTcK
	+bfIrWvk3gKLRiym6LsPPlnUJOsFjq1TmDO3mYJcyQ0MT1X5VKQm4kVneGWa6oKJvGEB
	joZNGgUtP5ILiBfvxZejrlL7mY+B/nuaYLxXE=
MIME-Version: 1.0
Received: by 10.101.163.16 with SMTP id q16mr78861ano.76.1313812286613; Fri,
	19 Aug 2011 20:51:26 -0700 (PDT)
Received: by 10.100.95.3 with HTTP; Fri, 19 Aug 2011 20:51:26 -0700 (PDT)
In-Reply-To: <CADkTA4NoyPO+VqHANOMd8VYigYw9-64-Fuz39JFfmVJ7zKLeLA@mail.gmail.com>
References: <cover.1313730559.git.bruce.ashfield@windriver.com>
	<e7036174cf607031e13323564f402c7b805e4572.1313730559.git.bruce.ashfield@windriver.com>
	<1313746981.6733.268.camel@phil-desktop>
	<CADkTA4MaaydRfb0YCgXOF1NGZbVcGV3Z+iEAo_qqtxSz57rdyw@mail.gmail.com>
	<1313774678.13995.123.camel@rex>
	<CADkTA4NoyPO+VqHANOMd8VYigYw9-64-Fuz39JFfmVJ7zKLeLA@mail.gmail.com>
Date: Fri, 19 Aug 2011 23:51:26 -0400
Message-ID: <CADkTA4PemjUdj1e3LoxzPSJdYoSJEp2G_6w5TBj4mj4FX=HS8Q@mail.gmail.com>
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
X-List-Received-Date: Sat, 20 Aug 2011 03:56:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2011 at 4:51 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Fri, Aug 19, 2011 at 1:24 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2011-08-19 at 08:53 -0400, Bruce Ashfield wrote:
>>> On Fri, Aug 19, 2011 at 5:43 AM, Phil Blundell <philb@gnu.org> wrote:
>>> > On Fri, 2011-08-19 at 01:20 -0400, Bruce Ashfield wrote:
>>> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/rec=
ipes-kernel/linux/linux-yocto_3.0.bb
>>> >> index 44f1ebe..5d9871f 100644
>>> >> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>>> >> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>>> >> @@ -11,7 +11,7 @@ KMACHINE_qemuarm =A0=3D "yocto/standard/arm-versat=
ile-926ejs"
>>> >> =A0KBRANCH =3D ${KMACHINE}
>>> >> =A0KMETA =3D meta
>>> >>
>>> >> -LINUX_VERSION ?=3D "3.0.1"
>>> >> +LINUX_VERSION ?=3D "3.0"
>>> >> =A0LINUX_VERSION_EXTENSION ?=3D "-yocto-${LINUX_KERNEL_TYPE}"
>>> >>
>>> >> =A0SRCREV_machine_qemuarm =3D "36b4cdddcafc711f0ec9ad97882f23a6443c6=
1b2"
>>> >
>>> > That's going to cause PV to go backwards, right? =A0If you're going t=
o do
>>> > that then you probably ought to consider bumping PE to retain
>>> > monotonicity.
>>>
>>> Indeed. I always just think of LINUX_VERSION as yet another package int=
ernal
>>> variable (from non-bitbake experience), so tweaking it has no impact
>>> on this sort
>>> of thing.
>>>
>>> I can look into changing the epoch .. but not until Monday or later in
>>> the weekend.
>>
>> I'm not 100% convinced that this is a good idea. I'd really prefer the
>> kernel accurately reflected the version it was. Can we not do:
>>
>> PREFERRRED_VERSION_xxx =3D "3.0%"
>>
>> to get around the preferred version issues?

I reset my environment and re-did my tests .. and this does match what
we want. I'm gong to re-spin my series with a version bump to 3.0.3 and
I'll update the preferred versions that I know about to this format.

Cheers,

Bruce

>
> Both Darren and I tried variants of this but couldn't get it to match, bu=
t I can
> certainly try again. This was also my first attempt when bumping the stri=
ng.
>
> But as I mentioned multiple times before, even changing the version with
> sub releases is a change from how I handled it before, so from that point
> of view, I never should have entered into tweaking this. :)
>
> Bruce
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


