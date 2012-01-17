Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RnI7t-0005JY-E9
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 00:07:37 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 17 Jan 2012 14:59:58 -0800
Received: by iaby26 with SMTP id y26so4142738iab.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 14:59:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.145.131 with SMTP id f3mr18925380icv.8.1326841197301; Tue,
	17 Jan 2012 14:59:57 -0800 (PST)
Received: by 10.50.237.98 with HTTP; Tue, 17 Jan 2012 14:59:57 -0800 (PST)
In-Reply-To: <1326840736.2529.1.camel@ted>
References: <cover.1326831402.git.nitin.a.kamble@intel.com>
	<b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
	<4F15EB93.9090301@linux.intel.com>
	<CAPhnLPDgJpgmAWoc_QGJfgV-gmZBQPpWtY8T3LKe-T_bp6532g@mail.gmail.com>
	<1326840736.2529.1.camel@ted>
Date: Tue, 17 Jan 2012 14:59:57 -0800
Message-ID: <CAPhnLPBi2EG=i97c8eVQGWzwrutqXgdB=NaG854RiUeP9K1=dw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] bdwgc: new recipe for autogen
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
X-List-Received-Date: Tue, 17 Jan 2012 23:07:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2012 at 2:52 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Tue, 2012-01-17 at 14:20 -0800, Flanagan, Elizabeth wrote:
>> On Tue, Jan 17, 2012 at 1:43 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> > On 01/17/2012 12:30 PM, nitin.a.kamble@intel.com wrote:
>> >>
>> >> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>> >>
>> >> This recipe is needed by guile.
>> >> And guile is needed for autogen.
>> >>
>> >> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
>> >> ---
>> >> =A0meta/recipes-support/bdwgc/bdwgc_20110107.bb | =A0 38
>> >> ++++++++++++++++++++++++++
>> >> =A01 files changed, 38 insertions(+), 0 deletions(-)
>> >> =A0create mode 100644 meta/recipes-support/bdwgc/bdwgc_20110107.bb
>> >>
>> >> diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb
>> >> b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
>> >> new file mode 100644
>> >> index 0000000..1aaa5b8
>> >> --- /dev/null
>> >> +++ b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
>> >> @@ -0,0 +1,38 @@
>> >> +SUMMARY =3D "A garbage collector for C and C++"
>> >> +
>> >> +DESCRIPTION =3D "The Boehm-Demers-Weiser conservative garbage collec=
tor can
>> >> be\
>> >> + used as a garbage collecting replacement for C malloc or C++ new. I=
t
>> >> allows\
>> >> + you to allocate memory basically as you normally would, without
>> >> explicitly\
>> >> + deallocating memory that is no longer useful. The collector
>> >> automatically\
>> >> + recycles memory when it determines that it can no longer be otherwi=
se\
>> >> + accessed.\
>> >> + =A0The collector is also used by a number of programming language\
>> >> + implementations that either use C as intermediate code, want to
>> >> facilitate\
>> >> + easier interoperation with C libraries, or just prefer the simple
>> >> collector\
>> >> + interface.\
>> >> + =A0Alternatively, the garbage collector may be used as a leak detec=
tor for
>> >> C\
>> >> + or C++ programs, though that is not its primary goal.\
>> >> + =A0Empirically, this collector works with most unmodified C program=
s,
>> >> simply\
>> >> + by replacing malloc with GC_malloc calls, replacing realloc with
>> >> GC_realloc\
>> >> + calls, and removing free calls."
>> >> +
>> >> +HOMEPAGE =3D "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
>> >> +SECTION =3D "devel"
>> >> +LICENSE =3D "custom"
>> >
>> > What's custom? =A0Is this the correct LICENSE name to use here?
>> > Beth comments?
>>
>> custom is certainly not correct. This one isn't a particularly easy one.
>>
>> openSuSE says BSD-3-Clause. This isn't actually true from what I'm
>> seeing. It looks to me more like:
>>
>> LICENSE =3D "MIT & FSF-Unlimited & GPL-2.0"
>>
>> linux_threads.c and Makefile.am appear to be MIT.
>>
>> "Several files supporting GNU-style builds are copyrighted by the Free
>> Software Foundation, and carry a different license from that given
>> below." I would assume that that is FSF-Unlimited.
>>
>> The main portion of the license is MIT.
>>
>> It does mention that there are some GPL code in here:
>>
>> "A few of the files needed to use the GNU-style build procedure come wit=
h
>> slightly different licenses, though they are all similar in spirit. =A0A=
 few
>> are GPL'ed, but with an exception that should cover all uses in the
>> collector. =A0(If you are concerned about such things, I recommend you l=
ook
>> at the notice in config.guess or ltmain.sh.)"
>>
>> ltmain.sh is GPL-2.0. Is it distributed in the package? If so, then I
>> would add it to LICENSE.
>
> ltmain.sh is from libtool and is a build time tool used by *many* of our
> recipes. I don't think that one needs to be mentioned in LICENSE, or if
> it does, we have much bigger problems than this recipe.
>
> Cheers,
>
> Richard

Good point. We do still have GPL-2.0 if we're packaging up code built
from libatomic_ops/src/atomic_ops_stack.c.

-b

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


