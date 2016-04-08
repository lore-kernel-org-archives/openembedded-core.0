Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 990F96FEF5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 12:46:54 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id g185so130203323ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Apr 2016 05:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B69OMtYDvp8p90pzJVj2yzG9JOokNoknbcn5bKUGA5k=;
	b=o4Le26hR14OTuaw7rl9zcMuO8PEONitEl3RmSv4EDMdMjKKGaKCvcpXGYtb1D3NTkx
	5VSOykHPrM8/lOPN1YNhB5WZJP96PPXntkVtimtPJcUJHygrESE5AwFHxzKcNFswx8lG
	Yxnuo1Ld/sxr/Rspf8AfZfTzxOSgYpCefCnVNym8tt6sZjMXbibE7ndwwZ+/s6P6TH3x
	9pj5pUHum5qQVTA4iZcFY/3qlHBWTRVNgnQUQI2AubIsJfa1gvzO3tandALSGyBxASwK
	ta0vhwAUuqapXcx6zcPtD7k+ApNTAuV706SkN/tYpqtVXqSR2T/9p5q+1Hb9XkMMPcTb
	KPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B69OMtYDvp8p90pzJVj2yzG9JOokNoknbcn5bKUGA5k=;
	b=k4USeEClBw7W+FYU1LjGz738YjVO7hIRvQfLSiw4gvSbkHvp/ilk9Qc036qEhTV2Pv
	iOL9Y+9cxE7yuah9RjLJwPsrS/Zn5PYCqt2X4PJVjok1q7zFDtPrtATf+fRoA1R1iI/C
	rhMsSWABDuGmmK+W9hTqhus8j2TDoPczYUZIcd3aQhyaO7ka9kg/XvTnEkNcIehKJwEx
	qGDj0PB2KbtQeUPrdJwOAYwezNk8TeKli/EVIiQcCvaLffEX6VLp0pOq3cULvAE4kAe0
	SVsC4KyjfR3tAbpsQuEYTIg4K/L/sEbNNy/mdzNQMH7BiGS60iRKZoi4Dg92VZ+zZVmG
	JPGw==
X-Gm-Message-State: AD7BkJLeXeaWrgi3XVNyCZ5iJ5b7LB+UvCuy3Wtd0Ii9nZAV88WU3TPvLuFX3tIjZ4B90nF2Q1a6huQaHDGh+3cN
X-Received: by 10.107.129.206 with SMTP id l75mr8689845ioi.141.1460119614575; 
	Fri, 08 Apr 2016 05:46:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.11.199 with HTTP; Fri, 8 Apr 2016 05:46:15 -0700 (PDT)
In-Reply-To: <1460098636.23253.5.camel@linuxfoundation.org>
References: <1460047375-20395-1-git-send-email-tracy.graydon@intel.com>
	<1460098636.23253.5.camel@linuxfoundation.org>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Fri, 8 Apr 2016 13:46:15 +0100
Message-ID: <CAPhnLPA1C--0WxOFi8uMYJQN5H-7Nvs6T-T9fK-1TbBM4xgfnw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/conf/distro/include/distro_alias.inc
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
X-List-Received-Date: Fri, 08 Apr 2016 12:46:54 -0000
Content-Type: text/plain; charset=UTF-8

On 8 April 2016 at 07:57, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2016-04-07 at 09:42 -0700, Graydon, Tracy wrote:
>> Update the distro_alias.inc file to include updated/new packages.
>>
>> This is required for the Yocto-2.1 release.
>>
>> Signed-off-by: Graydon, Tracy <tracy.graydon@intel.com>
>> ---
>>  meta/conf/distro/include/distro_alias.inc | 31
>> +++++++++++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/meta/conf/distro/include/distro_alias.inc
>> b/meta/conf/distro/include/distro_alias.inc
>> index c8f9395..51869d5 100644
>> --- a/meta/conf/distro/include/distro_alias.inc
>> +++ b/meta/conf/distro/include/distro_alias.inc
>> @@ -9,13 +9,17 @@
>>  #
>>  # Please keep this list in alphabetical order.
>>  #
>> +DISTRO_PN_ALIAS_pn-alsa-lib = "Debian=alsa-lib Ubuntu=alsa-lib
>> Fedora=alsa-lib"
>
> I though that we didn't add these for *every* entry, only where the
> names differ?

There are a lot of prior cases where it seems we have been. I suggest
two patches here then. One to clean up those instances, then this one
with the non-differing names removed.

-b

>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

