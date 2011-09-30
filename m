Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R9gYK-00078n-49
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:07:15 +0200
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 30 Sep 2011 10:01:34 -0700
Received: by fxe23 with SMTP id 23so3020936fxe.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 10:01:33 -0700 (PDT)
Received: by 10.223.37.68 with SMTP id w4mr3884020fad.49.1317402090344;
	Fri, 30 Sep 2011 10:01:30 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id k26sm7444265fab.12.2011.09.30.10.01.28
	(version=SSLv3 cipher=OTHER); Fri, 30 Sep 2011 10:01:29 -0700 (PDT)
Message-ID: <4E85F5E6.8050106@intel.com>
Date: Fri, 30 Sep 2011 10:01:26 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317311276.12332.97.camel@ted>
	<CAEsOVNdbTgD8gJeowgoEybimkbKXCKPnox7ovGc3JaRGHVv18A@mail.gmail.com>
	<1317321528.12332.110.camel@ted>
In-Reply-To: <1317321528.12332.110.camel@ted>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH 01/16] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Fri, 30 Sep 2011 17:07:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/29/2011 11:38 AM, Richard Purdie wrote:
> On Thu, 2011-09-29 at 18:28 +0000, McClintock Matthew-B29882 wrote:
>> On Thu, Sep 29, 2011 at 10:47 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org>  wrote:
>>> On Wed, 2011-09-28 at 23:20 -0500, Matthew McClintock wrote:
>>>> From: Tom Rini<tom_rini@mentor.com>
>>>>
>>>> At issue is that route/pktloc.c (not generated) depends on
>>>> route/pktloc_syntax.h (generated).
>>>>
>>>> Signed-off-by: Tom Rini<tom_rini@mentor.com>
>>>> ---
>>>>   .../libnl/fix-pktloc_syntax_h-race.patch           |   23 ++++++++++++++++++++
>>>>   meta/recipes-support/libnl/libnl_2.0.bb            |    3 +-
>>>>   2 files changed, 25 insertions(+), 1 deletions(-)
>>>>   create mode 100644 meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
>>>>
>>>> diff --git a/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
>>>> new file mode 100644
>>>> index 0000000..d396f96
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
>>>> @@ -0,0 +1,23 @@
>>>> +---
>>>
>>> Missing patch header...
>>
>> How would I mark this when this is an old version of libnl and it
>> appears not to be a problem the latest version of libnl?
>
> I don't have the patch status field entries handy but you can certainly
> document that the issue isn't present in version X so its likely been
> fixed upstream already. I guess "Inappropriate" would cover that if
> nothing else does.
>
Just for reference:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

This contains the Upstream-Status: entries.

Thanks
	Sau!

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



