Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SDIX4-0004Qp-QI
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 18:49:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2TGe2DS006887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 09:40:02 -0700 (PDT)
Received: from msp-dhcp10.wrs.com (172.25.34.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 29 Mar 2012 09:40:02 -0700
Message-ID: <4F749060.8020101@windriver.com>
Date: Thu, 29 Mar 2012 11:40:00 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
	<4F72219A.2020301@windriver.com>
	<CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
	<4F723618.6060104@windriver.com>
	<F4FE715B8B374104BDAF129362EBDD00@gmail.com>
	<4F723B78.2060308@windriver.com>
	<CABcZAN=-uE0_UkROO_abncN3m17Qxy=_kqo-Qg=L_pLNKJ99Hg@mail.gmail.com>
	<CAEsOVNc9s=t77p4iN5DU6FP5=NVe4Lr+ZV=SG2BrZZ6-AtcKng@mail.gmail.com>
	<CABcZANnyVxQsJ6ntV=DTeOtPb3R=d8=JSbny8+iOAT8XV99+UQ@mail.gmail.com>
	<4F7481FE.3020505@windriver.com>
	<CAEsOVNcbLXA-16E+sFhTExa0oZ62bGEXeNmzzjBOvmLaUPAoYg@mail.gmail.com>
In-Reply-To: <CAEsOVNcbLXA-16E+sFhTExa0oZ62bGEXeNmzzjBOvmLaUPAoYg@mail.gmail.com>
Subject: Re: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
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
X-List-Received-Date: Thu, 29 Mar 2012 16:49:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

(This is going to be a bit rambling I'm afraid.. I'm working my way through 
investigation and a possible solution..  so be sure to look all the way to the 
end..)

On 3/29/12 10:58 AM, McClintock Matthew-B29882 wrote:
> On Thu, Mar 29, 2012 at 10:38 AM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> On 3/28/12 11:54 PM, Chris Larson wrote:
>>>
>>> On Wed, Mar 28, 2012 at 9:47 PM, McClintock Matthew-B29882
>>> <B29882@freescale.com>    wrote:
>>>>
>>>> On Tue, Mar 27, 2012 at 5:16 PM, Chris Larson<clarson@kergoth.com>
>>>>   wrote:
>>>>>>
>>>>>> If you can explain why the override isn't overriding the default
>>>>>> TUNE_PKGARCH (and it's intentional and not a bug), and we can
>>>>>> consistently
>>>>>> modify all of the elements... I'm happy to accept the changes to all of
>>>>>> the
>>>>>> tunings.
>>>>>
>>>>>
>>>>> See above. It's not an override. And plenty of files already specify
>>>>> TUNE_PKGARCH_tune-<tune>, so I don't see how it'd be inconsistent to
>>>>> do so for the defaults, personally.
>>>>
>>>>
>>>> If no one else has complained so far it makes me believe they are not
>>>> missing any TUNE_PKGARCH_tune-<tune>    then.
>>>
>>>
>>> I don't understand the point you're attempting to make here.
>>
>>
>> Just an FYI -- I've not forgotten about this.. I'm going to look into what
>> is currently implemented and figure out how to get it to be consistent..
>> things have definitely changed since the initial implementation, and things
>> are no longer consistent.
>>
>> Hopefully I'll have an update later today.
>
> Just for some background:
>
> I added the TUNEPKG_ARCH = TUNE_PKGARCH_tune-$DEFAULTTUNE bit because
> it seemed to make sense and it was missing from this list:
>
> meta/conf/bitbake.conf:TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
> meta/conf/bitbake.conf:PACKAGE_EXTRA_ARCHS ??=
> "${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}"
>
> Also it seemed silly (at the time admittedly) to set TUNE_PKGARCH
> based off a value in TUNE_FEATURES and using bb functions to do this
> when the way I went with was simply setting a value. I did miss that
> the default case no longer works properly unless you have a
> TUNE_PKGARCH_tune-{powerpc,powerpc-nf,powerpc64} =
> {powerpc,powerpc-nf,powerpc64} set in the default arch files.
>
> Anyways, I'm not stuck on one particular method at the time I was
> trying to get ppce5500 multilib working properly.

Ok, that makes a bit more sense.. What I see right now is:

TUNE_PKGARCH ??= "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"

(This was originally designed that TUNE_PKGARCH was defined based on the 
overrides... note, not only has the above affected that, but it's not consistent 
in the other architectures either.. so it was wrong, and is still likely wrong...)

Arm defines it as:

TUNE_PKGARCH = "${@d.getVar('ARMPKGARCH', 
True)}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"

That way the ARMPKGARCH is the base of the configuration, while the DSP, ABI, 
Endian and FPU are added dynamically based on the feature flags (and associated 
settings)..

IA defines is as:
TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86", "x86_64", d)}"
TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "_x32", "", d)}"

And then some (c3, core2, i586) override that, but not all of them.. again this 
is likely wrong as well..

MIPS defines it as:

TUNE_PKGARCH ?= "${TUNE_ARCH}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"

TUNE_ARCH as:
TUNE_ARCH = "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}

and finally powerpc:

There is NO TUNE_PKGARCH defined.. but there is an append:

TUNE_PKGARCH_append = "${PPCPKGSFX_FPU}"

And each of the tunings:

tune-ppc603e.inc:TUNE_PKGARCH_tune-ppc603e = "ppc603e"
tune-ppce300c2.inc:TUNE_PKGARCH_tune-ppce300c2 = "ppce300c2"
tune-ppce500.inc:TUNE_PKGARCH_tune-ppce500 = "ppce500"
tune-ppce500mc.inc:TUNE_PKGARCH_tune-ppce500mc = "ppce500mc"
tune-ppce500v2.inc:TUNE_PKGARCH_tune-ppce500v2 = "ppce500v2"
tune-ppce5500.inc:TUNE_PKGARCH_tune-ppce5500 = "ppce5500"
tune-ppce5500.inc:TUNE_PKGARCH_tune-ppc64e5500 = "ppc64e5500"


....  so somehow we need to figure out a more consistent approach.  Personally I 
prefer the ARM/MIPS style approach.  Build up the format using a consistent set 
of features/arguments.

The one thing I'm still struggling with though is what is the final purpose of 
these variables.  I may be able to make a better determination as to the right 
values if I truly understood the difference.  Below is my attempt at 
understanding this... (let me know if this is correct or if you have corrections)

DEFAULTTUNE - The default tuning for a given machine or build
[multilib build uses overrides to change the DEFAULTTUNE setting], tune values 
are defined by the conf/machine/include/* items

TUNE_FEATURES_tune-<tune> - Should not be manually modified (i.e. not in 
local.conf, only specified by a tune file), but inherited via the DEFAULTTUNE 
value -- this defines the set of tuning variables that a given tuning uses to 
setup cflags, pkgarch, abi, etc..

TUNE_CCARGS - Setup the cflags based on the TUNE_FEATURES settings.  These 
should be additive when defined using "+=".  All items in this list should be 
dynamic! i.e. ${@bb.utils.contains("TUNE_FEATURES", "feature", "cflag", 
"!cflag", d)}

AVAILTUNES - This is a list of all available tunes within the machine 
configuration.  This does not mean that all available tunes are compatible with 
that machine configuration, or with each other.  The DEFAULTTUNE must be in this 
list.  Each tuning file can add to this list using "+=".

PACKAGE_EXTRA_ARCHS_tune-<tune> - List of all compatible package arches to a 
given tune.

TUNE_ARCH - GNU canonical arch for the architecture.  I.e. arm, armeb, mips, 
mips64, etc.

TUNE_PKGARCH - The package architecture listed for the purpose of package feeds. 
  These are the names used by the PACKAGE_EXTRA_ARCHS for compatibility reasons.

TARGET_FPU - The FPU setting for a given architecture, hard (generate floating 
point instructions), soft (generate internal gcc calls), "other" architecture 
specific floating point.  This is synchronized with the compiler and other 
toolchain items.  This should be dynamically configured in the same way the 
TUNE_CCARGS is.

BASE_LIB_tune-<tune> - The "/lib" location for a specific ABI.

----

So how about this for a possible solution:

bitbake.conf:
Keep - TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"

Remove - TUNE_PKGARCH

In the tuning files, specifically the architectural tuning files:

Require a default setting of TUNE_PKGARCH.  The default setting MIGHT be 
specific to an arch (as in the ARM case above), or could be
TUNE_PKGARCH = ${TUNE_PKGARCH_tune-${DEFAULTTUNE}} for something like PowerPC 
where it may be easier to specific the exact package arch.

Each architecture file needs a small README to indicate how someone is to add a 
new tuning to that architecture.

----

Does the above seem reasonable?  If so I'll try to get started on that...

--Mark

> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



