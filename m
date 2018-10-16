Return-Path: <kamensky@cisco.com>
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8539874758
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 03:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=7064; q=dns/txt; s=iport;
	t=1539662084; x=1540871684;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=4Hs/TTpwCaUCU9iNuoc2Xn0WdMRS0pRjGH9g1zEf57g=;
	b=M8FKuC6uGiFlYyYagSq4vr42Y6T177FsrWuEwv2IUVpeAXJuGR3mp4eg
	Qi7pGDw+e6jmiUDOkKtZ/Yci0ig04rouiVM/ScdCxRGWGpOfTc6WRRYZe
	5NkRSm9M7BflK9AjDKR0EjjGHVRaYWn8AEW2D9JDAyVeVPgsfB7ByFWeh I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AHAAB3YMVb/4ENJK1kGgEBAQEBAgE?=
	=?us-ascii?q?BAQEHAgEBAQGBUgQBAQEBCwGCA2Z/KIxrjHFDJYdPhkSIdBSBZgsBASOESQK?=
	=?us-ascii?q?EXSE1DA0BAwEBAgEBAm0cDIU5AQEBAgEBJxECNAsFCwsRAwECAS5PCAYTgyG?=
	=?us-ascii?q?BeQgPqBsziiGLTBeCAIESM4FhfoMQCwMBGIEQBAELBwEHhXICiEQZCy2GGoN?=
	=?us-ascii?q?qixEJhlWKHYFPTIQkgxSGS4xDiUMCBAsCFIFFAzNkcU0jFTuCbAmCHQEWg0e?=
	=?us-ascii?q?FFIVeHzABiRgPFwSCIwEB?=
X-IronPort-AV: E=Sophos;i="5.54,387,1534809600"; d="scan'208";a="186550974"
Received: from alln-core-9.cisco.com ([173.36.13.129])
	by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2018 03:54:42 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id w9G3sgYe005140
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 16 Oct 2018 03:54:42 GMT
Date: Mon, 15 Oct 2018 20:54:42 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <04a92673-1751-7868-5424-1cd00819dd28@windriver.com>
Message-ID: <alpine.LRH.2.00.1810152031510.4416@sjc-ads-6991.cisco.com>
References: <20181015182128.13115-1-kamensky@cisco.com>
	<04a92673-1751-7868-5424-1cd00819dd28@windriver.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.218.111, sjc-ads-6991.cisco.com
X-Outbound-Node: alln-core-9.cisco.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemtap: 3.3 -> 4.0
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
X-List-Received-Date: Tue, 16 Oct 2018 03:54:42 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

Hi Randy,

On Mon, 15 Oct 2018, Randy MacLeod wrote:

> On 10/15/2018 02:21 PM, Victor Kamensky wrote:
>> Upgrade systemtap from 3.3 to 4.0: Removed backported patch.
>> 
>> Very short summary of major changes from SystemTap 4.0
>> announcement by Frank Ch. Eigler <fche@redhat.com>:
>> 
>>> prometheus exporter network service; ebpf support extensions including
>>> strings and implementation of traditional log(), sprintf() functions;
>>> rebuilt rich tapset coverage for 4.17+ syscalls and for
>>> tracepoint-based syscalls; script language tweaks for supporting
>>> machine-generated scripts
>> 
>> Fixes [YOCTO #12950]
>> 
>> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
>> ---
>> Hi Guys,
>> 
>> I'll let you to decide whether you want to accept
>> it for 2.6 at this point or push it for the next release.
>> On one hand after move to 4.18 kernel SystemTap 3.3
>> fails to trace any system call on x86_64 - it is major
>> functionality breakage. Look at:
>> 
>> https://bugzilla.redhat.com/show_bug.cgi?id=1596456
>
> Ouch!
>
>> 
>> On other hand it is quite late to do major version
>> updates.
>
> It is but nothing depends on systemtap so I think we
> don't have much choice and we should do it unless there
> are autobuilder tests that regress.

Personally, I agree. I had similar thoughts, since it
is leaf project risk is quite contained.

>
> A quick read through the YP mega-manual suggests that
> we don't have to change any of the text.
> Victor,
> Could you take a look and confirm that please?
>
> I noticed that the link in section:
>   20.3.3. Documentation
> for:
>   http://sourceware.org/systemtap/langref/
> is dead. There is a pdf:
>   http://sourceware.org/systemtap/langref.pdf
> Perhaps this is temporary due to the recent release.

Yes, I agree. It is better to change link to langref.pdf
as you suggested. But I don't know how to do that. Is there
somewhere git that holds YP mega-manual sources?

>> 
>> I did go through limited set of tests on all
>> supported QEMU targets. As far as these tests
>> concerned proposed 4.0 matches 3.3 results.
>> 
>> Thanks,
>> Victor
>
> Thanks Victor.
>
> Talk about hot off the presses, 4.0 was released at:
>   13-Oct-2018 18:54

Yes :), I was looking how to fix [YOCTO #12950] and was
about to write email to SystemTap guys asking when the
next release is planned and got email from Frank on
SystemTap mailing list announcing 4.0 release. It was
very good timing.

My understanding is that FC28 and FC27 will get SystemTap
4.0 very soon since they moved to 4.18 kernel too.

Thanks,
Victor

> $ git log --oneline release-3.3..release-4.0 | wc -l
> 252
>
> $ git diff release-3.3..release-4.0 | diffstat | tail -1
> 1574 files changed, 50756 insertions(+), 23604 deletions(-)
>
> Lots of changes to docs, testsuite but also quite a bit to core code
> and tapsets:
>
> $ git diff release-3.3..release-4.0 | diffstat  | cut -d"/" -f-2 | uniq -c 
> |grep -v "   [1-5] "
>    770  b/doc
>     16  b/httpd
>      8  b/man
>      9  b/po
>     18  b/runtime
>     15  b/stap-exporter
>      6  b/staprun
>    440  b/tapset
>    223  b/testsuite
>
>
> ../Randy
>
>>
>>   ...entrypc-avoid-usage-of-uninitialized.patch | 46 -------------------
>>   .../systemtap/systemtap_git.inc               |  5 +-
>>   2 files changed, 2 insertions(+), 49 deletions(-)
>>   delete mode 100644 
>> meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch
>> 
>> diff --git 
>> a/meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch 
>> b/meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch
>> deleted file mode 100644
>> index d0082a1094..0000000000
>> --- 
>> a/meta/recipes-kernel/systemtap/systemtap/0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch
>> +++ /dev/null
>> @@ -1,46 +0,0 @@
>> -From 8466fca2a074323a235ef38d425f994a2ff7e64f Mon Sep 17 00:00:00 2001
>> -From: Victor Kamensky <kamensky@cisco.com>
>> -Date: Mon, 9 Jul 2018 09:31:19 -0700
>> -Subject: [PATCH] dwflpp::function_entrypc avoid usage of uninitialized 
>> memory
>> -
>> -Failure on 3.3 release was observed. Failure was elusive and
>> -disappeared after seemingly random configure option change, or when
>> -code was compiled with -O1 or -O0 (vs default -O2). Running failing
>> -test case under valgrind memcheck pointed to couple places where
>> -'Conditional jump or move depends on uninitialised value(s)' occured.
>> -
>> -After addressing these in two places in dwflpp::function_entrypc,
>> -valgrind memcheck run is clean and original issue got fixed.
>> -
>> -Upstream-Status: Backport
>> -Signed-off-by: Victor Kamensky <kamensky@cisco.com>
>> ----
>> - dwflpp.cxx | 6 +++++-
>> - 1 file changed, 5 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/dwflpp.cxx b/dwflpp.cxx
>> -index bfbb6b096..2172e705a 100644
>> ---- a/dwflpp.cxx
>> -+++ b/dwflpp.cxx
>> -@@ -2465,13 +2465,17 @@ bool
>> - dwflpp::function_entrypc (Dwarf_Addr * addr)
>> - {
>> -   assert (function);
>> -+
>> -+  // assign default value
>> -+  *addr = 0;
>> -+
>> -   // PR10574: reject 0, which tends to be eliminated COMDAT
>> -   if (dwarf_entrypc (function, addr) == 0 && *addr != 0)
>> -     return true;
>> -
>> -   /* Assume the entry pc is the base address, or (if zero)
>> -      the first address of the ranges covering this DIE.  */
>> --  Dwarf_Addr start, end;
>> -+  Dwarf_Addr start = 0, end;
>> -   if (dwarf_ranges (function, 0, addr, &start, &end) >= 0)
>> -     {
>> -       if (*addr == 0)
>> ---
>> -2.17.1
>> -
>> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc 
>> b/meta/recipes-kernel/systemtap/systemtap_git.inc
>> index 06924fc240..274fcde5c1 100644
>> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
>> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
>> @@ -1,7 +1,7 @@
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> -SRCREV = "48867d1cface9445d58e3c6e14497770b7eb77e1"
>> -PV = "3.3"
>> +SRCREV = "428f84e9e656bce71018e8902e4edb8aacafcc0e"
>> +PV = "4.0"
>>     SRC_URI = "git://sourceware.org/git/systemtap.git \
>>              file://configure-allow-to-disable-libvirt.patch \
>> @@ -11,7 +11,6 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
>>              file://0001-Do-not-let-configure-write-a-python-location-into-th.patch 
>> \
>>              file://0001-Install-python-modules-to-correct-library-dir.patch 
>> \
>>              file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch 
>> \
>> - 
>> file://0001-dwflpp-function_entrypc-avoid-usage-of-uninitialized.patch \
>>              "
>>     COMPATIBLE_HOST = 
>> '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
>> 
>
>
> -- 
> # Randy MacLeod
> # Wind River Linux
>

