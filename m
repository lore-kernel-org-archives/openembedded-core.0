Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T9w66-0002Ve-I1 for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 12:47:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q87AZ99S028066;
	Fri, 7 Sep 2012 11:35:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27778-01; Fri,  7 Sep 2012 11:35:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q87AYwo6028044
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 7 Sep 2012 11:35:00 +0100
Message-ID: <1347014099.7493.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Fri, 07 Sep 2012 11:34:59 +0100
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A65EAB7@039-SN1MPN1-001.039d.mgd.msft.net>
References: <cover.1346956528.git.bruce.ashfield@windriver.com>
	<fb717d4aa26b125680f620254cde9eb97ef0708a.1346956528.git.bruce.ashfield@windriver.com>
	<1346969961.7493.24.camel@ted> <504921BD.4040004@windriver.com>
	<5049253B.4090402@windriver.com> <1346972362.7493.32.camel@ted>
	<50492CAF.3010203@windriver.com>
	<70CC66F5C30A414DADDA6973E4CA391A65EAB7@039-SN1MPN1-001.039d.mgd.msft.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] conf/tune: add tune-ppce300c3
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
X-List-Received-Date: Fri, 07 Sep 2012 10:47:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-07 at 06:55 +0000, McClintock Matthew-B29882 wrote:
> On Thu, Sep 6, 2012 at 6:07 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> > On 9/6/12 5:59 PM, Richard Purdie wrote:
> >>
> >> On Thu, 2012-09-06 at 17:35 -0500, Mark Hatle wrote:
> >>>
> >>> On 9/6/12 5:20 PM, Bruce Ashfield wrote:
> >>>>
> >>>> On 12-09-06 6:19 PM, Richard Purdie wrote:
> >>>>>
> >>>>> On Thu, 2012-09-06 at 14:43 -0400, Bruce Ashfield wrote:
> >>>>>>
> >>>>>> It has been pointed out several times that the yocto mpc8315e-rdb
> >>>>>> reference was using the wrong tuning (603e), since it is actually
> >>>>>> a e300c3 board.
> >>>>>>
> >>>>>> This commit creates a e300c3 tune file based on the e300c2 variant
> >>>>>> already in oe-core.
> >>>>>>
> >>>>>> This commit also inhibits altivec in flac when this new tuning is
> >>>>>> enabled. It was also noticed that the existing tune based overrides
> >>>>>> in the flac package would not be triggered since DEFAULTTUNE is not
> >>>>>> in the overrides list. To avoid doing per-board disabling of altivec
> >>>>>> DEFAULTTUNE is added to the local package OVERRIDES and then used
> >>>>>> to disable altivec.
> >>>>>>
> >>>>>> [YOCTO #1192]
> >>>>>>
> >>>>>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
> >>>>>>
> >>>>>> asdfkljds
> >>>>>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
> >>>>>> ---
> >>>>>>     meta/conf/machine/include/tune-ppce300c3.inc |   11 +++++++++++
> >>>>>>     meta/recipes-multimedia/flac/flac_1.2.1.bb   |    5 +++++
> >>>>>>     2 files changed, 16 insertions(+), 0 deletions(-)
> >>>>>>     create mode 100644 meta/conf/machine/include/tune-ppce300c3.inc
> >>>>>>
> >>>>>> diff --git a/meta/conf/machine/include/tune-ppce300c3.inc
> >>>>>> b/meta/conf/machine/include/tune-ppce300c3.inc
> >>>>>> new file mode 100644
> >>>>>> index 0000000..3f5ac26
> >>>>>> --- /dev/null
> >>>>>> +++ b/meta/conf/machine/include/tune-ppce300c3.inc
> >>>>>> @@ -0,0 +1,11 @@
> >>>>>> +DEFAULTTUNE ?= "ppce300c3"
> >>>>>> +
> >>>>>> +require conf/machine/include/powerpc/arch-powerpc.inc
> >>>>>> +
> >>>>>> +TUNEVALID[ppce300c3] = "Enable ppce300c3 specific processor
> >>>>>> optimizations"
> >>>>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3",
> >>>>>> "-mcpu=e300c3", "", d)}"
> >>>>>> +
> >>>>>> +AVAILTUNES += "ppce300c3"
> >>>>>> +TUNE_FEATURES_tune-ppce300c3 = "m32 fpu-soft ppce300c3"
> >>>>>> +TUNE_PKGARCH_tune-ppce300c3 = "ppce300c3"
> >>>>>> +PACKAGE_EXTRA_ARCHS_tune-ppce300c3 =
> >>>>>> "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c3"
> >>>>>> diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb
> >>>>>> b/meta/recipes-multimedia/flac/flac_1.2.1.bb
> >>>>>> index 3c5b73c..25db1c4 100644
> >>>>>> --- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
> >>>>>> +++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
> >>>>>> @@ -36,9 +36,14 @@ EXTRA_OECONF = "--disable-oggtest
> >>>>>> --disable-id3libtest \
> >>>>>>                     --without-xmms-exec-prefix \
> >>>>>>                     --without-libiconv-prefix \
> >>>>>>                     --without-id3lib"
> >>>>>> +
> >>>>>> +FLACOVERRIDE = ":${DEFAULTTUNE}"
> >>>>>> +OVERRIDES .= "${FLACOVERRIDE}"
> >>>>>> +
> >>>>>>     EXTRA_OECONF_prepend_e500mc = "--disable-altivec "
> >>>>>>     EXTRA_OECONF_prepend_e5500 = "--disable-altivec "
> >>>>>>     EXTRA_OECONF_prepend_e5500-64b = "--disable-altivec "
> >>>>>> +EXTRA_OECONF_prepend_ppce300c3 = "--disable-altivec "
> >>>>>>
> >>>>>
> >>>>> This is getting ugly and is kind of unsafe. Perhaps the architecture
> >>>>> should be doing something like:
> >>>>>
> >>>>> MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3",
> >>>>> ":noaltivec", "" ,d)}
> >>>>>
> >>>>> or even in this recipe just do:
> >>>>>
> >>>>> EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", "
> >>>>> --disable-altivec", "" ,d)}
> 
> These don't work because you still have the other 3 lines that look
> just like this. Or am I missing something?
> 
> >>>>
> >>>>
> >>>> I definitely considered this route. I can do that for the new arch, and
> >>>> the
> >>>> old ones, but can't test the old ones at the moment.
> >>>
> >>>
> >>> The problem is actually in the flac.  This recipe sees powerpc as the
> >>> machine
> >>> type, and immediately enabled altivec.  By default altivec support is
> >>> disabled
> >>> in OE-Core.
> >>>
> >>> Perhaps one way we could address this is add a tune flag that says if the
> >>> tune
> >>> has altivec support or not.. then in the flac binary, disable it unless
> >>> it's
> >>> enabled?
> >>
> >>
> >> I think having altivec in the tune_features would be ideal. I'd love to
> >> get this cleaned up too but I lack much knowledge about powerpc...
> >
> >
> > My proposal then would be to accept Bruce's patch, with the understanding
> > that we need to add a tune flag of 'altivec' to the PowerPC tunings (where
> > appropriate) and then make the flac recipe respect that flag.
> 
> This sounds good to me. If a bug is filed against me I can take a look
> at it since I did the initial damage.

I'll merge Bruce's updated patch, you are now the owner of:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3072

Cheers,

Richard



