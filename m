Received: from na3sys009aob106.obsmtp.com ([74.125.149.76]
	helo=na3sys009aog106.obsmtp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1QmTVB-0007p5-AR
	for openembedded-core@openembedded.org; Thu, 28 Jul 2011 18:32:03 +0200
Received: from mail-vx0-f177.google.com ([209.85.220.177]) (using TLSv1) by
	na3sys009aob106.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTjGOAohvQuz71g/io/9unA+1+FWxc/YZ@postini.com;
	Thu, 28 Jul 2011 09:27:47 PDT
Received: by mail-vx0-f177.google.com with SMTP id 29so2639832vxh.8
	for <openembedded-core@openembedded.org>;
	Thu, 28 Jul 2011 09:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FDii2X9XAYalRzIRcMzpEvnSc+nodS/btmhBUEhDMEo=;
	b=Eb1pgIypGRYQd3mm/DGttovHuuFAObmJa48pcywHJTYV3WfvHNXK02V3MRZK7ykvnx
	6WmTNh8lPYKOuDcvOHBpJ2rYGUPi3uKY1y1ZZ0BXRVECK/zzvzk9oaT+Z+qz64+YJjQQ
	/F1Sr5CAuR4eBa+m6yT7iKSYSKwxEheJs2k5E=
MIME-Version: 1.0
Received: by 10.52.174.195 with SMTP id bu3mr103370vdc.371.1311864696541; Thu,
	28 Jul 2011 07:51:36 -0700 (PDT)
Received: by 10.52.165.200 with HTTP; Thu, 28 Jul 2011 07:51:36 -0700 (PDT)
In-Reply-To: <DB1D5A60-CC02-493E-B6E0-9246AC19F47D@dominion.thruhere.net>
References: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
	<CACW_hTZEgveniP0x3R6Q1mNb9+T0kYP=TsOF4A2SwHKJeAqUjA@mail.gmail.com>
	<CAPcSpE+ZKH=o7RsotsiCmo3ss5zHo=wH9-z6htc7zVWDo7YSOQ@mail.gmail.com>
	<CACW_hTaR-BfLXDpUyrCcL+Ns2KOOSiT+kH9fJ07HGJwOZ51a4w@mail.gmail.com>
	<CAPcSpEJphsRYSr_CmXtDc=G5MnGNyoEd8MQcbaALKu4GPQ__Uw@mail.gmail.com>
	<CACW_hTYaTBDZjfwHo=fYaZZ72KqEHVKS1DYaxDgeEVOkArmjEw@mail.gmail.com>
	<CAPcSpELL=VJEdcO+0m1goAQdgV8PkjGqmZ9+3U_SZRTed=Yu-A@mail.gmail.com>
	<F5078022-9A0A-4728-8D9A-814BD5EF1564@dominion.thruhere.net>
	<CAPcSpEJLMsg+HkPbtu=6L=QEr=S7+bb34xzSKgYAwa2Qq_mnPA@mail.gmail.com>
	<DB1D5A60-CC02-493E-B6E0-9246AC19F47D@dominion.thruhere.net>
Date: Thu, 28 Jul 2011 10:51:36 -0400
Message-ID: <CAPcSpE+N3PRLB27fEfqgu5c9iuybCHr+G-hgJwu2JrLiCUY8Ew@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] [PATCH] raptor: add recipe
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
X-List-Received-Date: Thu, 28 Jul 2011 16:32:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 28, 2011 at 10:46 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 28 jul. 2011, om 16:43 heeft Ben Gardiner het volgende geschreven:
>
>> Hi Koen,
>>
>> On Thu, Jul 28, 2011 at 10:36 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>
>>> Op 28 jul. 2011, om 16:29 heeft Ben Gardiner het volgende geschreven:
>>>
>>>> On Thu, Jul 28, 2011 at 10:24 AM, Frans Meulenbroeks
>>>> <fransmeulenbroeks@gmail.com> wrote:
>>>>>
>>>>>
>>>>> 2011/7/28 Ben Gardiner <bengardiner@nanometrics.ca>
>>>>>>
>>>>>>
>>>>>> Well, I would not submit _this_ patch for pull-request. I was hoping
>>>>>> to get this version of raptor included and then submit a pull-request
>>>>>> for a cherry-pick of the patch to add libxml2 to DEPENDS.
>>>>>
>>>>> Ah, missed that you also added libxml2.
>>>>> Not sure about the policies of the maintenance branch, but I suspect the
>>>>> proper way would be to fix and test in openembedded then submit a pull
>>>>> request.
>>>>> Then again maybe the policies for the maintenance branch are different.
>>>>
>>>> :) They are. AFAICT I need to get this recipe (including libxml2 dep
>>>> update) into oe-core or its layers :)
>>>
>>> I ask again, what makes you think that? Pretty much all of the recent maintenance commits are from .dev.
>>
>> I'm sorry I guess my previous reply got lost in the noise. I think
>> that because I read it from Tom. If it is at all possible to
>> circumvent this requirement
>
> What did you exactly read and why do you think it's a requirement? From http://wiki.openembedded.org/index.php/2011.03-maintenance:
>
> "Changes may reside in either the openembedded 'master' repository OR a relevant public layer in the oe-core / meta-oe / etc universe"

I read:

In Message-ID: <4DFA7108.5020103@mentor.com> On Thu, Jun 16, 2011 at
5:09 PM, Tom Rini <tom_rini@mentor.com> wrote:
> [...]
> the policy about where changes need to be before they can be included in
> 2011.03-maintenance to include being in oe-core / meta-oe or other
> relevant public layer instead of being only in the oe.dev master branch.

and took "instead of being only" to mean that the development effort
must shift to pushing into oe-core (or it's layers).

My mistake and thank you for clarifying this is not a requirement.
Please drop this patch from consideration.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


