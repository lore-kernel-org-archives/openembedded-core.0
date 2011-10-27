Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RJHPM-0001Fu-HA
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 06:17:36 +0200
Received: by qyg14 with SMTP id 14so2992770qyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 21:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=LL6Ni52RroiWles0aPbXTXSInj+IMVppaqyBcalSz4U=;
	b=FpW1rXwijCgCFioGXouyf2dYm+wDtV8ZAy6TeswcJGRKNKkkHmkxyWZuxEo04X/anJ
	hwqXbgcMWMQtzB4VTN/44wM+axhgYew+uKHCr+NYJvSiMLS6SofBMIgrWKxj2wbHQmJ+
	rYw9E2WKVIdGqSQil2bRpVmAVcvDJTgUmAh+4=
MIME-Version: 1.0
Received: by 10.229.64.144 with SMTP id e16mr7382859qci.112.1319688696388;
	Wed, 26 Oct 2011 21:11:36 -0700 (PDT)
Received: by 10.229.94.72 with HTTP; Wed, 26 Oct 2011 21:11:36 -0700 (PDT)
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF1AA886@MBX20.4emm.local>
References: <1319173361-11527-1-git-send-email-raj.khem@gmail.com>
	<1319173361-11527-3-git-send-email-raj.khem@gmail.com>
	<840A81C1B782724A8EB52725BD519EFF1A8929@MBX20.4emm.local>
	<CAMKF1soXuZ84hVv9sN+rgR+Fh-o0jaDKKn7BMWs80xikiF7_bQ@mail.gmail.com>
	<840A81C1B782724A8EB52725BD519EFF1A8959@MBX20.4emm.local>
	<1319662464.12054.1.camel@ted>
	<840A81C1B782724A8EB52725BD519EFF1AA886@MBX20.4emm.local>
Date: Wed, 26 Oct 2011 21:11:36 -0700
Message-ID: <CA+M6bX=U_beXYeo98fZnZ-B_M4MrwVCzm2VKbqqaNkQCLTJbUw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] gcc-configure-sdk: Point sysroot to correct location
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
X-List-Received-Date: Thu, 27 Oct 2011 04:17:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2011 at 8:52 PM, James Limbouris
<james@digitalmatter.com.au> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Richard Purdie
>> Sent: Thursday, 27 October 2011 4:54 AM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 3/3] gcc-configure-sdk: Point sysroot to c=
orrect
>> location
>>
>> On Fri, 2011-10-21 at 05:23 +0000, James Limbouris wrote:
>> > > -----Original Message-----
>> > > From: openembedded-core-bounces@lists.openembedded.org
>> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of
>> > > Khem Raj
>> > > Sent: Friday, 21 October 2011 1:16 PM
>> > > To: Patches and discussions about the oe-core layer
>> > > Subject: Re: [OE-core] [PATCH 3/3] gcc-configure-sdk: Point sysroot =
to
>> correct
>> > > location
>> > >
>> > > On Thu, Oct 20, 2011 at 10:12 PM, James Limbouris
>> > > <james@digitalmatter.com.au> wrote:
>> > > >> -----Original Message-----
>> > > >> From: openembedded-core-bounces@lists.openembedded.org
>> > > >> [mailto:openembedded-core-bounces@lists.openembedded.org] On
>> Behalf
>> > > Of
>> > > >> Khem Raj
>> > > >> Sent: Friday, 21 October 2011 1:03 PM
>> > > >> To: openembedded-core@lists.openembedded.org
>> > > >> Subject: [OE-core] [PATCH 3/3] gcc-configure-sdk: Point sysroot t=
o
>> correct
>> > > >> location
>> > > >>
>> > > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > > >> ---
>> > > >> =A0meta/recipes-devtools/gcc/gcc-configure-sdk.inc | =A0 =A02 +-
>> > > >> =A01 files changed, 1 insertions(+), 1 deletions(-)
>> > > >>
>> > > >> diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
>> b/meta/recipes-
>> > > >> devtools/gcc/gcc-configure-sdk.inc
>> > > >> index de80870..98fd4c1 100644
>> > > >> --- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
>> > > >> +++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
>> > > >> @@ -7,7 +7,7 @@ USE_NLS =3D '${@base_conditional( "TARGET_OS",
>> "linux-
>> > > >> uclibceabi", "no", "", d )}'
>> > > >> =A0EXTRA_OECONF_PATHS =3D "--with-local-
>> > > >> prefix=3D${SDKPATH}/sysroots/${TARGET_SYS}${target_exec_prefix} \
>> > > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-gxx-include=
-dir=3D${target_includedir}/c++ \
>> > > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-build-time-
>> > > >> tools=3D${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
>> > > >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-sysroot=3D${S=
DKPATH}/sysroots/${TARGET_SYS} \
>> > > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-
>> > > >> sysroot=3D${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-
>> > > >> ${TARGET_OS} \
>> > > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-build-sysro=
ot=3D${STAGING_DIR_TARGET}"
>> > > >>
>> > > >> =A0#
>> > > >> --
>> > > >> 1.7.5.4
>> > > >>
>> > > >
>> > > > Shouldn't --with-local-prefix be changed too? I am testing with bo=
th
>> > > ${TARGET_SYS}'s replaced. Will post results shortly.
>> > >
>> > > yes I think both places it should change
>> > >
>> >
>> > Ok, I've tested with both changed, and the corresponding binutils patc=
h, and
>> both Qt and kernel compiles are working.
>>
>> I took these patches but I would like to stress that we shouldn't need
>> to rely on the hardcoded path in the compiler, it should be picking up
>> any alternative sysroot paths from the environment. If this isn't
>> happening, we should be figuring out why not. This change therefore
>> hides issues and does not fix the problem entirely :(.
>>
>> Cheers,
>>
>> Richard
>
> I'm not sure there was a problem apart from the hardcoded paths being wro=
ng - in the use cases this fixed, the environment setup script was not bein=
g sourced.

... except for u-boot / kernel which ignore such advice from the
environment, often with reason.

--=20
Tom


