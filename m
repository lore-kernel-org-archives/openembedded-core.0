Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RnHWB-0003jp-Cl
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 23:28:39 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Jan 2012 14:21:00 -0800
Received: by iaby26 with SMTP id y26so4101269iab.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 14:20:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.202.105 with SMTP id kh9mr16810251igc.3.1326838858450; Tue,
	17 Jan 2012 14:20:58 -0800 (PST)
Received: by 10.50.237.98 with HTTP; Tue, 17 Jan 2012 14:20:58 -0800 (PST)
In-Reply-To: <4F15EB93.9090301@linux.intel.com>
References: <cover.1326831402.git.nitin.a.kamble@intel.com>
	<b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
	<4F15EB93.9090301@linux.intel.com>
Date: Tue, 17 Jan 2012 14:20:58 -0800
Message-ID: <CAPhnLPDgJpgmAWoc_QGJfgV-gmZBQPpWtY8T3LKe-T_bp6532g@mail.gmail.com>
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
X-List-Received-Date: Tue, 17 Jan 2012 22:28:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2012 at 1:43 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/17/2012 12:30 PM, nitin.a.kamble@intel.com wrote:
>>
>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>>
>> This recipe is needed by guile.
>> And guile is needed for autogen.
>>
>> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
>> ---
>> =A0meta/recipes-support/bdwgc/bdwgc_20110107.bb | =A0 38
>> ++++++++++++++++++++++++++
>> =A01 files changed, 38 insertions(+), 0 deletions(-)
>> =A0create mode 100644 meta/recipes-support/bdwgc/bdwgc_20110107.bb
>>
>> diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb
>> b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
>> new file mode 100644
>> index 0000000..1aaa5b8
>> --- /dev/null
>> +++ b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
>> @@ -0,0 +1,38 @@
>> +SUMMARY =3D "A garbage collector for C and C++"
>> +
>> +DESCRIPTION =3D "The Boehm-Demers-Weiser conservative garbage collector=
 can
>> be\
>> + used as a garbage collecting replacement for C malloc or C++ new. It
>> allows\
>> + you to allocate memory basically as you normally would, without
>> explicitly\
>> + deallocating memory that is no longer useful. The collector
>> automatically\
>> + recycles memory when it determines that it can no longer be otherwise\
>> + accessed.\
>> + =A0The collector is also used by a number of programming language\
>> + implementations that either use C as intermediate code, want to
>> facilitate\
>> + easier interoperation with C libraries, or just prefer the simple
>> collector\
>> + interface.\
>> + =A0Alternatively, the garbage collector may be used as a leak detector=
 for
>> C\
>> + or C++ programs, though that is not its primary goal.\
>> + =A0Empirically, this collector works with most unmodified C programs,
>> simply\
>> + by replacing malloc with GC_malloc calls, replacing realloc with
>> GC_realloc\
>> + calls, and removing free calls."
>> +
>> +HOMEPAGE =3D "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
>> +SECTION =3D "devel"
>> +LICENSE =3D "custom"
>
> What's custom? =A0Is this the correct LICENSE name to use here?
> Beth comments?

custom is certainly not correct. This one isn't a particularly easy one.

openSuSE says BSD-3-Clause. This isn't actually true from what I'm
seeing. It looks to me more like:

LICENSE =3D "MIT & FSF-Unlimited & GPL-2.0"

linux_threads.c and Makefile.am appear to be MIT.

"Several files supporting GNU-style builds are copyrighted by the Free
Software Foundation, and carry a different license from that given
below." I would assume that that is FSF-Unlimited.

The main portion of the license is MIT.

It does mention that there are some GPL code in here:

"A few of the files needed to use the GNU-style build procedure come with
slightly different licenses, though they are all similar in spirit.  A few
are GPL'ed, but with an exception that should cover all uses in the
collector.  (If you are concerned about such things, I recommend you look
at the notice in config.guess or ltmain.sh.)"

ltmain.sh is GPL-2.0. Is it distributed in the package? If so, then I
would add it to LICENSE.

Doing above should cover all bases.

-b

>
> Sau!
>
>
>> +LIC_FILES_CHKSUM =3D
>> "file://README.QUICK;md5=3D9b9dd874f6940641b6ab19893ee8f1cc"
>> +
>> +SRC_URI =3D
>> "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/bdwgc-7_2alpha5-=
20110107.tar.bz2"
>> +
>> +SRC_URI[md5sum] =3D "4f3c130fc71ff23584edaa19a37739ee"
>> +SRC_URI[sha256sum] =3D
>> "1f57b959ae1144e1e5fa59d52d7cb4ed626fd74cf47da1c9c119b8b46ae2722d"
>> +
>> +PR =3D "r0"
>> +
>> +S =3D "${WORKDIR}/bdwgc"
>> +
>> +do_install_append (){
>> + =A0 =A0 =A0 rm -f ${D}${datadir}/${PN}
>> +}
>> +
>> +inherit autotools
>> +BBCLASSEXTEND =3D "native nativesdk"
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


