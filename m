Received: from na3sys009aog102.obsmtp.com ([74.125.149.69])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1QmTPJ-0007gR-4k
	for openembedded-core@openembedded.org; Thu, 28 Jul 2011 18:25:57 +0200
Received: from mail-vw0-f53.google.com ([209.85.212.53]) (using TLSv1) by
	na3sys009aob102.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTjGMliUwRiiXhNYn/9duJw6yW+89Mnza@postini.com;
	Thu, 28 Jul 2011 09:21:43 PDT
Received: by mail-vw0-f53.google.com with SMTP id 13so2478238vws.26
	for <openembedded-core@openembedded.org>;
	Thu, 28 Jul 2011 09:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=BTl5DQ8k7awdI+4nr8ZpPdfKu4qUsgkaiWAxYOTQT9A=;
	b=rkx0mOSZMtEf3suggylh9fawmU7orM5jWCez4+C68BU1hVQUACgwcWtiOOTqZfeYLb
	RvT5NuronRbIMeUjTcM8ma7+T0xajkt0oi9xLTFIXKu9Ay60NmrTuJJAtAiwBumK5mFu
	cBYWjHOUPNQuaWcWCLVZjYdMoW7NowqGJk164=
MIME-Version: 1.0
Received: by 10.52.74.231 with SMTP id x7mr107799vdv.237.1311864231390; Thu,
	28 Jul 2011 07:43:51 -0700 (PDT)
Received: by 10.52.165.200 with HTTP; Thu, 28 Jul 2011 07:43:51 -0700 (PDT)
In-Reply-To: <F5078022-9A0A-4728-8D9A-814BD5EF1564@dominion.thruhere.net>
References: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
	<CACW_hTZEgveniP0x3R6Q1mNb9+T0kYP=TsOF4A2SwHKJeAqUjA@mail.gmail.com>
	<CAPcSpE+ZKH=o7RsotsiCmo3ss5zHo=wH9-z6htc7zVWDo7YSOQ@mail.gmail.com>
	<CACW_hTaR-BfLXDpUyrCcL+Ns2KOOSiT+kH9fJ07HGJwOZ51a4w@mail.gmail.com>
	<CAPcSpEJphsRYSr_CmXtDc=G5MnGNyoEd8MQcbaALKu4GPQ__Uw@mail.gmail.com>
	<CACW_hTYaTBDZjfwHo=fYaZZ72KqEHVKS1DYaxDgeEVOkArmjEw@mail.gmail.com>
	<CAPcSpELL=VJEdcO+0m1goAQdgV8PkjGqmZ9+3U_SZRTed=Yu-A@mail.gmail.com>
	<F5078022-9A0A-4728-8D9A-814BD5EF1564@dominion.thruhere.net>
Date: Thu, 28 Jul 2011 10:43:51 -0400
Message-ID: <CAPcSpEJLMsg+HkPbtu=6L=QEr=S7+bb34xzSKgYAwa2Qq_mnPA@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Jul 2011 16:25:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Koen,

On Thu, Jul 28, 2011 at 10:36 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 28 jul. 2011, om 16:29 heeft Ben Gardiner het volgende geschreven:
>
>> On Thu, Jul 28, 2011 at 10:24 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>>
>>>
>>> 2011/7/28 Ben Gardiner <bengardiner@nanometrics.ca>
>>>>
>>>>
>>>> Well, I would not submit _this_ patch for pull-request. I was hoping
>>>> to get this version of raptor included and then submit a pull-request
>>>> for a cherry-pick of the patch to add libxml2 to DEPENDS.
>>>
>>> Ah, missed that you also added libxml2.
>>> Not sure about the policies of the maintenance branch, but I suspect th=
e
>>> proper way would be to fix and test in openembedded then submit a pull
>>> request.
>>> Then again maybe the policies for the maintenance branch are different.
>>
>> :) They are. AFAICT I need to get this recipe (including libxml2 dep
>> update) into oe-core or its layers :)
>
> I ask again, what makes you think that? Pretty much all of the recent mai=
ntenance commits are from .dev.

I'm sorry I guess my previous reply got lost in the noise. I think
that because I read it from Tom. If it is at all possible to
circumvent this requirement and avoid bothering you on the oe-core
list that I would be happy to be obliged.

On Thu, Jul 28, 2011 at 8:52 AM, Ben Gardiner
<bengardiner@nanometrics.ca> wrote:
> Hi Koen, Frans,
>
> On Thu, Jul 28, 2011 at 6:48 AM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>> [...]
>> And where does it say it needs to be in OE-core first?
>
> My understanding of Tom's post to the oe.dev mailing list is that
> commits in pull-requests for 2011.03 need to first be oe-core or one
> of its layers.
>
> In Message-ID: <4DFA7108.5020103@mentor.com> On Thu, Jun 16, 2011 at
> 5:09 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi all,
>>
>> As part of this weeks TSC meeting, an agenda item was brought up about
>> the 2011.03-maintenance branch and oe-core / etc. =A0I have now updated
>> the policy about where changes need to be before they can be included in
>> 2011.03-maintenance to include being in oe-core / meta-oe or other
>> relevant public layer instead of being only in the oe.dev master branch.
>> =A0This is not a policy change, but a clarification of what was there
>> previously. =A0Thanks all!


> As for getting it in meta-oe, you need to test it first in that layer bef=
ore sending a patch.

Understood; I will test in meta-oe before sending a patch.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


