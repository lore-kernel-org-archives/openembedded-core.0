Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEqc6-0005Sy-M9
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 00:20:10 +0200
Received: by eye27 with SMTP id 27so358654eye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2011 15:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=NucxWSLSkJ0rLBzumA/jU4hNGROZU9aWo95eKQhqENk=;
	b=mln4EJaxh78ncBCVNTR8Prpss4QomVDgQyL7zdV630C3EeWtKtDkMObBYsrA8Wr1+i
	b4GfzmNTV5vJnUB7rVi+ndz1POiNQBn0sJw7CtTVaMkMEkdCABw6GLSFwotpX+PiI4oy
	6lsknn4nZHN+c8dbf/26KcIGGotw4d8Ms/8VU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=XWnhG91UOLRg36k84S2x2eCW7a2MBz8lr4MavTDJwH+3V90lbTQ56rZ69+JvGgswMd
	iQGr5qZuK7MgoaqAfLPckv412FGxIVPR468XehdYqj9bY0cf81rD5I54KmgPDtJQQfcp
	UplA9e+5JpWTxX27dOKpv5gk2JYhs0E10km7I=
Received: by 10.14.5.4 with SMTP id 4mr564566eek.205.1303856260176; Tue, 26
	Apr 2011 15:17:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Tue, 26 Apr 2011 15:17:10 -0700 (PDT)
In-Reply-To: <BANLkTinACj_iaWW6bgz3_tCd73_9NnPJrg@mail.gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
	<4e4ad27e7940760928c4ed79ca0b1948912ac881.1303757256.git.raj.khem@gmail.com>
	<4DB72173.4000902@linux.intel.com>
	<BANLkTinACj_iaWW6bgz3_tCd73_9NnPJrg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Apr 2011 15:17:10 -0700
Message-ID: <BANLkTi=7023boON7yZ4GGssxWw4h_xFwUg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] gettext.bbclass: Use _append instead of =+
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
X-List-Received-Date: Tue, 26 Apr 2011 22:20:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2011 at 1:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Apr 26, 2011 at 12:48 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 04/25/2011 11:54 AM, Khem Raj wrote:
>>>
>>> Ensure gettext and gettext-native are removed from DEPENDS when
>>> not using NLS
>>>
>>> Use append instead of +=3D to get gettext dependecies processed
>>> correctly in all cases
>>>
>>> Dont remove gettext-native for native recipes as ENABLE_NLS is
>>> only for target and not for native recipes
>>>
>>> Replace using 1 for a boolean type with True
>>>
>>> Honor INHIBIT_DEFAULT_DEPS
>>>
>>> Remove the added dependencies for gettext if INHIBIT_DEFAULT_DEPS is no=
n
>>> null
>>>
>> Khem,
>>
>> This patch seems to be causing a circular dependency when you try to bui=
ld
>> meta-toolchain-sdk, not sure if you tested that target.
>>
>
> No I did not. Let me try it out.
>
>> % bitbake meta-toolchain-sdk -n
>> NOTE: Out of date cache found, rebuilding...
>> WARNING: No bb files matched BBFILE_PATTERN_yocto
>> '^/intel/poky/distro/meta-yocto/'
>> Parsing recipes: 100% |#########################################| Time:
>> 00:00:15
>> Parsing of 796 .bb files complete (0 cached, 796 parsed). 1008 targets, =
6
>> skipped, 0 masked, 0 errors.
>>
>> OE Build Configuration:
>> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.11.0"
>> METADATA_BRANCH =C2=A0 =3D "stage"
>> METADATA_REVISION =3D "86f12953dbf57264cfcc06feac446f3edf0c6d8f"
>> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "i586"
>> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux"
>> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "qemux86"
>> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "poky-lsb"
>> DISTRO_VERSION =C2=A0 =C2=A0=3D "1.0+snapshot-20110426"
>> TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ""
>>
>> NOTE: Resolving any missing task queue dependencies
>> NOTE: Preparing runqueue
>> ERROR: Task
>> virtual:nativesdk:/intel/poky/distro/meta/recipes-core/gettext/gettext_0=
.17.bb
>> (do_package) has circular dependency on
>> virtual:nativesdk:/intel/poky/distro/meta/recipes-devtools/gcc/gcc-runti=
me_4.5.1.bb
>> (do_package)
>>
>> Is there dependencies on this patch with the other patches? (ie can I ta=
ke
>> part of your other patches or just hold off)?
>>
>
> This patch is kind of needed for few of them for parsing sake.
> some of them dont depend on this e.g.
>
> [PATCH 05/17] sstate.bbclass: Reduce SSTATE_MANIFESTS assignment to be we=
ak
> [PATCH 09/17] libiconv: update from 1.9.2 -> 1.11.1
> [PATCH 12/17] elfutils_0.148.bb: Fix compilation issues on uclibc
> [PATCH 13/17] perl_5.12.2.bb: Undefine features not found in uclibc
> [PATCH 14/17] xorg-lib: inherit gettext class instead of adding
> gettext to DEPENDS directly
> [PATCH 15/17] attr: Fix compilation on uclibc
> [PATCH 16/17] linux-tools.inc: Dummify do_compile_perf and
> do_install_perf for uclibc


Saul

I have fixed this patch and pushed it to the pull tree. Can you pull fresh
from the pull request tree and give it a shot ? Let me know how it goes

>> Sau!
>>
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> ---
>>> =C2=A0meta/classes/gettext.bbclass | =C2=A0 31 +++++++++++++++++++-----=
-------
>>> =C2=A01 files changed, 19 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclas=
s
>>> index a40e74f..a6f80f2 100644
>>> --- a/meta/classes/gettext.bbclass
>>> +++ b/meta/classes/gettext.bbclass
>>> @@ -1,17 +1,24 @@
>>> =C2=A0def gettext_after_parse(d):
>>> - =C2=A0 =C2=A0# Remove the NLS bits if USE_NLS is no.
>>> - =C2=A0 =C2=A0if bb.data.getVar('USE_NLS', d, 1) =3D=3D 'no':
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg =3D oe_filter_out('^--(dis|en)able-nls=
$',
>>> bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg +=3D " --disable-nls"
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0depends =3D bb.data.getVar('DEPENDS', d, 1=
) or ""
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('DEPENDS',
>>> oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('EXTRA_OECONF', cfg, d)
>>> -
>>> + =C2=A0 # Remove the NLS bits if USE_NLS is no.
>>> + =C2=A0 if bb.data.getVar('USE_NLS', d, True) =3D=3D 'no':
>>> + =C2=A0 =C2=A0 =C2=A0 cfg =3D oe_filter_out('^--(dis|en)able-nls$',
>>> bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
>>> + =C2=A0 =C2=A0 =C2=A0 cfg +=3D " --disable-nls"
>>> + =C2=A0 =C2=A0 =C2=A0 depends =3D bb.data.getVar('DEPENDS', d, True) o=
r ""
>>> + =C2=A0 =C2=A0 =C2=A0 depends =3D
>>> oe_filter_out('^(virtual/libiconv|virtual/libintl|virtual/gettext|gette=
xt)$',
>>> depends, d)
>>> + =C2=A0 =C2=A0 =C2=A0 if not oe.utils.inherits(d, 'native', 'nativesdk=
', 'cross',
>>> 'crosssdk'):
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D oe_filter_out('^(gette=
xt-native)$', depends, d)
>>> + =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('DEPENDS', depends, d)
>>> + =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('EXTRA_OECONF', cfg, d)
>>> + =C2=A0 # check if INHIBIT_DEFAULT_DEPS is 1 then we forcibly remove
>>> dependencies
>>> + =C2=A0 # added by this class through DEPENDS_GETTEXT
>>> + =C2=A0 if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True):
>>> + =C2=A0 =C2=A0 =C2=A0 depends =3D bb.data.getVar('DEPENDS', d, True) o=
r ""
>>> + =C2=A0 =C2=A0 =C2=A0 gettext_deps =3D '^(' + bb.data.getVar('DEPENDS_=
GETTEXT', d, True) +
>>> ')$'
>>> + =C2=A0 =C2=A0 =C2=A0 depends =3D oe_filter_out(gettext_deps, depends,=
 d)
>>> + =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('DEPENDS', depends, d)
>>> =C2=A0python () {
>>> =C2=A0 =C2=A0 =C2=A0gettext_after_parse(d)
>>> =C2=A0}
>>> -
>>> -DEPENDS_GETTEXT =3D "gettext gettext-native"
>>> -
>>> -DEPENDS =3D+ "${DEPENDS_GETTEXT}"
>>> =C2=A0EXTRA_OECONF +=3D "--enable-nls"
>>> +DEPENDS_GETTEXT ?=3D "virtual/gettext"
>>> +DEPENDS_append =3D " ${DEPENDS_GETTEXT} "
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>


