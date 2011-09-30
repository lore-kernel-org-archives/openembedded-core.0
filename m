Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R9gaU-0007Bg-9v
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:09:26 +0200
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 30 Sep 2011 10:03:51 -0700
Received: by fxe23 with SMTP id 23so3023518fxe.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 10:03:50 -0700 (PDT)
Received: by 10.223.10.22 with SMTP id n22mr549250fan.144.1317401903233;
	Fri, 30 Sep 2011 09:58:23 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id n1sm7421731fad.20.2011.09.30.09.58.21
	(version=SSLv3 cipher=OTHER); Fri, 30 Sep 2011 09:58:22 -0700 (PDT)
Message-ID: <4E85F52B.2010000@intel.com>
Date: Fri, 30 Sep 2011 09:58:19 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317270070-14250-7-git-send-email-msm@freescale.com>
	<1317311457.12332.99.camel@ted>
	<CAEsOVNd7317kDeGBNB6HLy2bpQB102piFtAMxVriX1GocaCXew@mail.gmail.com>
	<1317321967.12332.113.camel@ted>
In-Reply-To: <1317321967.12332.113.camel@ted>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH 07/16] Fix lttng-ust for powerpc64
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
X-List-Received-Date: Fri, 30 Sep 2011 17:09:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/29/2011 11:46 AM, Richard Purdie wrote:
> On Thu, 2011-09-29 at 18:21 +0000, McClintock Matthew-B29882 wrote:
>> On Thu, Sep 29, 2011 at 10:50 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org>  wrote:
>>> On Wed, 2011-09-28 at 23:21 -0500, Matthew McClintock wrote:
>>>> Signed-off-by: Matthew McClintock<msm@freescale.com>
>>>> ---
>>>>   meta/recipes-kernel/lttng/fix-powerpc64.patch |   17 +++++++++++++++++
>>>>   meta/recipes-kernel/lttng/lttng-ust_0.15.bb   |    3 ++-
>>>>   2 files changed, 19 insertions(+), 1 deletions(-)
>>>>   create mode 100644 meta/recipes-kernel/lttng/fix-powerpc64.patch
>>>>
>>>> diff --git a/meta/recipes-kernel/lttng/fix-powerpc64.patch b/meta/recipes-kernel/lttng/fix-powerpc64.patch
>>>> new file mode 100644
>>>> index 0000000..d347979
>>>> --- /dev/null
>>>> +++ b/meta/recipes-kernel/lttng/fix-powerpc64.patch
>>>> @@ -0,0 +1,17 @@
>>>> +Upstream-Status: Inappropriate configuration
>>>
>>> Is this really inappropriate for upstream? It looks reasonable to me...
>>
>> Seems reasonable. What is the policy on this? Can I mark it "this
>> should be upstreamed" or must I mark it "this was sent upstream" and
>> then upstream the change?
>
> There is some marking for "should be upstreamed"/upstreamable.
>
The marking would be "Pending", this indicates that it should be 
attempted, if it gets up streamed then marked Accepted with a pointer to 
the potential upstream version or ref.

Thanks
	Sau!

>>>> +Add bit to detect if we are running on powerpc64 and treat it the
>>>> +same as ppc64
>>>> +
>>>> +Index: ust-0.15/configure.ac
>>>> +===================================================================
>>>> +--- ust-0.15.orig/configure.ac
>>>> ++++ ust-0.15/configure.ac
>>>> +@@ -111,6 +111,7 @@ changequote([,])dnl
>>>> +     x86_64) LIBFORMAT="elf64-x86-64" ;;
>>>> +     powerpc) LIBFORMAT="elf32-powerpc" ;;
>>>> +     ppc64) LIBFORMAT="elf64-powerpc" ;;
>>>> ++    powerpc64) LIBFORMAT="elf64-powerpc" ;;
>>>> +     s390) LIBFORMAT="elf32-s390" ;;
>>>> +     s390x) LIBFORMAT="elf64-s390" ;;
>>>> +         armv5) LIBFORMAT="elf32-littlearm"; NO_UNALIGNED_ACCESS=1 ;;
>>>> diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.15.bb b/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
>>>> index 915e619..9dd4658 100644
>>>> --- a/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
>>>> +++ b/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
>>>> @@ -10,9 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
>>>>
>>>>   DEPENDS = "liburcu"
>>>>
>>>> -PR = "r2"
>>>> +PR = "r3"
>>>>
>>>>   SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz"
>>>> +SRC_URI_append_powerpc64 = " file://fix-powerpc64.patch"
>>>
>>> Does this really need to be conditional on powerppc64? Looks like it can
>>> be applied unconditionally...
>>
>> True, was trying to minimally effect other stuff. But I take it by the
>> comment you prefer this be done away with.
>
> Sometimes minimally affecting other code is good. In this its obviously
> not going to break anything else so it can be universal. The risk of
> minimal application is fewer people testing it, e.g. when versions get
> upgraded.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



