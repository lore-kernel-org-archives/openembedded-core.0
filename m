Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 955EE6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jan 2016 09:00:14 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id mw1so87190773igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 01:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8+E/pF1uOS3XdQ8zHNQ16gP+wSpgCwcFu7gAurco8kY=;
	b=OBtS/mLlkzKQ8pk1CsnebcQ0uEPF5IixsiPzl1V19wykrQX/s+oAJd4euFUbHatpgb
	mChzZhGVByRGBqZm0CobmfYe8vLIVsLnnvbxZGmtCjwVFGtHOiaE6SFqQKBGaPZTgPFN
	07l4tgVd6pwhc7ezPmzoPyTF6wHuAEwBrCJ0oifUm4GSTmmJigl9CKHxasAmbjpAnEzR
	Z9fO8uPlMnd0rwaaAIhJWkbHJSsaQPrEyZTnnxu2Upi2aKSdJoCS/LDujy8R3I0wPtkm
	Lcy08STozMZiblICYbTVrofPSNWoaa0oSrJooxZhXxfEQ20bgdpt5OUD1XyO257dFYET
	ffBw==
X-Received: by 10.50.171.200 with SMTP id aw8mr3061632igc.77.1452330015080;
	Sat, 09 Jan 2016 01:00:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Sat, 9 Jan 2016 00:59:45 -0800 (PST)
In-Reply-To: <CAMKF1spdFfEJ0ZK22yDf30tnZ_1WFxFBLqprwqaPUDE_jMbQ_A@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
	<CAMKF1so8xuy9Q8YjRynpgV68cjt-9KHae4TBTjKvn5EU0UzD+g@mail.gmail.com>
	<CAJTo0LZ=wzVPAi3OuScYX7kmJNXhsLif+FCUfjm9ZdyogZm-Ng@mail.gmail.com>
	<CAMKF1spdFfEJ0ZK22yDf30tnZ_1WFxFBLqprwqaPUDE_jMbQ_A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Jan 2016 00:59:45 -0800
Message-ID: <CAMKF1sp5KprYsDEvi6TQaVAVwB03dS4reUmq7e1pqbaRaV-AkA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Sat, 09 Jan 2016 09:00:14 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 10:34 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jan 8, 2016 at 10:29 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 8 January 2016 at 17:43, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> systemd does not work with musl. I have patches in my tree to fix the
>>> build but then it does not run :(. musl and systemd has different
>>
>>
>> I wonder if we can/should raise a SkipPackage for systemd if musl is
>> enabled?
>
> Seems good.

I have updated the pull branch with

1. Fix for recursive mutex for directfb
2. Fix to skip parsing systemd for musl

