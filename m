Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9FAC478990
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 13:15:46 +0000 (UTC)
Received: from [10.1.14.230] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id BDA4620B95;
	Tue, 24 Jul 2018 15:15:46 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180724105222.25606-1-dv@pseudoterminal.org>
	<20180724105222.25606-6-dv@pseudoterminal.org>
	<CAJTo0LavvoSVEOFXEwcJB3snMk7HgR-CWJF_hhVDAT9UyJqRLQ@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <2c33e55a-51b1-b1b6-c940-d4d80b6805ae@pseudoterminal.org>
Date: Tue, 24 Jul 2018 15:15:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LavvoSVEOFXEwcJB3snMk7HgR-CWJF_hhVDAT9UyJqRLQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 6/6] gstreamer1.0-libav: Replace German umlaut to avoid parsing problems
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
X-List-Received-Date: Tue, 24 Jul 2018 13:15:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I wanted to add details to this as a response to your comment, but my 
old setup where this happens now refuses to work anymore, and I don't 
remember said details.

Okay, I propose we skip this patch and commit it later in case this 
problem reappears.

Is a v6 necessary now, or can patchwork skip the last patch?


On 2018-07-24 13:04, Burton, Ross wrote:
> It can? Where?  That's surely a bug...
>
> Ross
>
> On 24 July 2018 at 11:52, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
>> The umlaut can cause issues related to encoding; avoid by replacing it
>>
>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>> ---
>>   .../workaround-to-build-gst-libav-for-i586-with-gcc.patch       | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
>> index 36abf8607e..5355480aa4 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
>> @@ -1,5 +1,5 @@
>>   Description: Workaround to build libav for i586 with gcc 4.9.2 by avoiding memset
>> -Author: Bernhard Übelacker <bernhardu@vr-web.de>
>> +Author: Bernhard Uebelacker <bernhardu@vr-web.de>
>>
>>   ---
>>   Bug-Debian: https://bugs.debian.org/783082
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


