Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SiCP4-00005N-FU
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 00:32:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jun 2012 15:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="183874149"
Received: from unknown (HELO [10.255.12.175]) ([10.255.12.175])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2012 15:21:29 -0700
Message-ID: <4FE4EFE9.7090602@linux.intel.com>
Date: Fri, 22 Jun 2012 15:21:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340205163.git.raj.khem@gmail.com>
	<a1ca534609d8ae49a16b9d28cc9e92db0894c4e4.1340205163.git.raj.khem@gmail.com>
	<20120622063756.GK9352@jama.jama.net>
	<CAMKF1spK9RwuhfGoTSPCEGvnKRcYfYPHGo0EdktwXdthP6uncA@mail.gmail.com>
In-Reply-To: <CAMKF1spK9RwuhfGoTSPCEGvnKRcYfYPHGo0EdktwXdthP6uncA@mail.gmail.com>
Subject: Re: [PATCH 2/5] gcc-4.7: Update to tip of gcc-4_7-branch since 4.7.1 has been out
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
X-List-Received-Date: Fri, 22 Jun 2012 22:32:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2012 12:20 AM, Khem Raj wrote:
> On Thu, Jun 21, 2012 at 11:37 PM, Martin Jansa<martin.jansa@gmail.com>  wrote:
>> On Wed, Jun 20, 2012 at 08:18:37AM -0700, Khem Raj wrote:
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> ---
>>>   meta/recipes-devtools/gcc/gcc-4.7.inc |   12 ++++++------
>>>   1 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
>>> index 34a73b1..25a1088 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
>>> @@ -3,12 +3,12 @@ require gcc-common.inc
>>>   PR = "r2"
>>>
>>>   # Third digit in PV should be incremented after a minor release
>>> -# happens from this branch on gcc e.g. currently its 4.7.0
>>> -# when 4.7.1 is releases and we bump SRCREV beyond the release
>>> -# on branch then PV should be incremented to 4.7.1+svnr${SRCPV}
>>> +# happens from this branch on gcc e.g. currently its 4.7.1
>>> +# when 4.7.2 is releases and we bump SRCREV beyond the release
>>> +# on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
>>>   # to reflect that change
>>>
>>> -PV = "4.7.0+svnr${SRCPV}"
>>> +PV = "4.7.1+svnr${SRCPV}"
>>>
>>>   # BINV should be incremented after updating to a revision
>>>   # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
>>> @@ -16,9 +16,9 @@ PV = "4.7.0+svnr${SRCPV}"
>>>   # 4.7.1 then the value below will have 2 which will mean 4.7.2
>>>   # which will be next minor release and so on.
>>>
>>> -BINV = "4.7.1"
>>> +BINV = "4.7.2"
>>>
>>> -SRCREV = "186651"
>>> +SRCREV = "188658"
>>>   BRANCH = "gcc-4_7-branch"
>>>   FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
>>
>> I'm not sure if this one is new, but libgcc now reports unpackaged
>> file:
>>
>> NOTE: package libgcc-4.7.1+svnr188658-r2: task do_package: Started
>> WARNING: For recipe libgcc, the following files/directories were
>> installed but not shipped in any package:
>> WARNING:   /usr/lib/arm-oe-linux-gnueabi/4.7.2/include
>> WARNING:   /usr/lib/arm-oe-linux-gnueabi/4.7.2/include/unwind.h
>
> can you see couple of things 1. if this file is being generated and
> installed during libgcc build or if its coming from the bits that are
> stashed away from gcc-cross build
>
Khem, this file seems to be set up during do_configure time

config.status: linking 
/srv/ssd/sgw_ab/builds/repack/tmp/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/libgcc/unwind-generic.h 
to unwind.h

> this file should not be packaged with libgcc so right solution will be
> to delete this file

Will you provide the patch please.

Thanks
	Sau!

>>
>> And the problem with (sometimes) missing or corrupt header file is still there:
>> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/dwarf2out.c:8383:6: warning: format not a string literal and no format arguments [-Wformat-security]
>> | gcc -c   -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/. -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/../include -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/../libcpp/include  -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/../libdecnumber -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/../libdecnumber/dpd -I../libdecnumber    /OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2
/gcc-4_7-branch/gcc/emit-rtl.c -o emit-rtl.o
>> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/emit-rtl.c:42:17: fatal error: rtl.h: No such file or directory
>> | compilation terminated.
>> Restarting build helps again..
>>
>
> this is intriguing we should look into it can you explain (once again
> how can I reproduce it)
>
>> Cheers,
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


