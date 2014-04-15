Return-Path: <darren.hart@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5637665D23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Apr 2014 18:06:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2014 10:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,865,1389772800"; d="scan'208";a="521498372"
Received: from fmsmsx106.amr.corp.intel.com ([10.19.9.37])
	by orsmga002.jf.intel.com with ESMTP; 15 Apr 2014 11:03:46 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
	FMSMSX106.amr.corp.intel.com (10.19.9.37) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 15 Apr 2014 11:03:46 -0700
Received: from fmsmsx111.amr.corp.intel.com ([169.254.2.42]) by
	fmsmsx117.amr.corp.intel.com ([169.254.13.248]) with mapi id
	14.03.0123.003; Tue, 15 Apr 2014 11:03:45 -0700
From: "Hart, Darren" <darren.hart@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] meta-skeleton: linux-yocto-custom.bb:
	use machine overrides
Thread-Index: AQHPVad1D4gulqqWU0KLBbvIitT08JsNJmwAgAABc4CABjjmgP//nrmA
Date: Tue, 15 Apr 2014 18:03:45 +0000
Message-ID: <CF72C2F0.8411E%darren.hart@intel.com>
References: <cover.1397235602.git.nitin.a.kamble@intel.com>
	<53482AD6.3090205@windriver.com> <53482C0D.5000802@intel.com>
	<2000508.o5Wd2u71cb@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2000508.o5Wd2u71cb@peggleto-mobl5.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.225.133]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] meta-skeleton: linux-yocto-custom.bb: use machine overrides
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
X-List-Received-Date: Tue, 15 Apr 2014 18:06:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4DB793FCEF93BB4485E9DE199A7BEFCE@intel.com>
Content-Transfer-Encoding: quoted-printable

On 4/15/14, 9:54, "Paul Eggleton" <paul.eggleton@linux.intel.com> wrote:

>On Friday 11 April 2014 10:53:17 Kamble, Nitin A wrote:
>> On 4/11/2014 10:48 AM, Bruce Ashfield wrote:
>> > On 14-04-11 01:05 PM, nitin.a.kamble@intel.com wrote:
>> >> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>> >>=20
>> >> Use machine overrides for variables for this skeleton recipe so that
>> >> people following skeleton do it right at the beginning.
>> >>=20
>> >> The machine overrides for the variables reduces pollution of name
>>space
>> >> and avoid unintentional influences on other layers.
>> >>=20
>> >> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>> >> ---
>> >>=20
>> >>   meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 8
>>++++----
>> >>   1 file changed, 4 insertions(+), 4 deletions(-)
>> >>=20
>> >> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> >> b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> >> index c329106..76457ca 100644
>> >> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> >> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> >> @@ -46,10 +46,10 @@ require recipes-kernel/linux/linux-yocto.inc
>> >>=20
>> >>   # Override SRC_URI in a bbappend file to point at a different
>>source
>> >>   # tree if you do not want to build from Linus' tree.
>> >>=20
>> >> -SRC_URI =3D
>> >>=20
>>"git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protoco
>> >> l=3Dgit;nocheckout=3D1;name=3Dmachine" +SRC_URI_machine =3D
>> >>=20
>>"git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protoco
>> >> l=3Dgit;nocheckout=3D1;name=3Dmachine"
>> >>=20
>> >> -LINUX_VERSION ?=3D "3.4"
>> >> -LINUX_VERSION_EXTENSION ?=3D "-custom"
>> >> +LINUX_VERSION_machine ?=3D "3.4"
>> >> +LINUX_VERSION_EXTENSION_machine ?=3D "-custom"
>> >=20
>> > For some reason, I thought you meant ${MACHINE} instead of _machine ..
>> > which is what I use for machine specific overrides.
>>=20
>> I think macros can not used as overrides.
>
>Variable references can be used in overrides, provided the expansion
>happens=20
>at the right time. However, it would not be appropriate to use ${MACHINE}
>here=20
>because if it were used verbatim in the recipe, it would not have the
>desired=20
>effect - the value of ${MACHINE} would change with whatever MACHINE was
>set to,=20
>and since ${MACHINE} is always in OVERRIDES it would always be applied.
>
>Cheers,
>Paul
>
>--=20
>
>Paul Eggleton
>Intel Open Source Technology Centre
>

I think we should just drop the overrides. The overrides are needed with
linux-yocto bbappends so we don't pollute the namespace, but here there is
nothing to polute. This is the only recipe, you don't use bbappends with
it. It needs some documentation, but we should just drop all the overrides
in this recipe.

--=20
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation



