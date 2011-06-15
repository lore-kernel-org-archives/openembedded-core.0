Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWfyk-000224-Al
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 04:37:14 +0200
Received: by pwj9 with SMTP id 9so111542pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 19:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=4TN1cN4nub4ZhthFI8WKR48sX7VRTvNeVWjG5EatFec=;
	b=tlcXhK8CJ4zUR48nnO4W7RtrHsvVyC+7IQj/J+lKZH72cbM6fwwaBzkp2a0DqQRiX1
	E8o3slKHkv5hoMbZNxQ3m0d9vRJr4uN0yYAntSRzyuiFmIAhc9FzLn0VieFmxAO7H4UX
	3oWfu0aB8hsPOsZNnxEKF/PRg2t++VPpjjDpE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=UeWHnQ0P93cZetYgLhra7Yz0qyO93q+bEw7qDjaFR+cNJ0WpbRM5l355TDG3UYW/PK
	iJx59mxOKtp+B5Sk6VaVpzIgCNW9sdeTKHej9h371r3+e+zlOGmaf9KRfFgwalepKPHm
	u1iW47U2JIenvNRaNP8PeybYOJmQXNLTWUrYs=
Received: by 10.142.222.9 with SMTP id u9mr1380375wfg.242.1308105227230;
	Tue, 14 Jun 2011 19:33:47 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id o16sm7721875wff.13.2011.06.14.19.33.44
	(version=SSLv3 cipher=OTHER); Tue, 14 Jun 2011 19:33:45 -0700 (PDT)
Message-ID: <4DF81A07.3090502@gmail.com>
Date: Tue, 14 Jun 2011 19:33:43 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1307937636.git.raj.khem@gmail.com>	<1307955075.6879.11.camel@lenovo.internal.reciva.com>	<BANLkTikbba0xTCB=eLZamP7LY6wJ8_Nkhw@mail.gmail.com>	<1308043725.25285.232.camel@phil-desktop>
	<1308055023.15712.333.camel@rex>
In-Reply-To: <1308055023.15712.333.camel@rex>
Subject: Re: [PATCH 0/1] Upgrade gcc 4.6.0 to latest on FSF 4.6 branch
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
X-List-Received-Date: Wed, 15 Jun 2011 02:37:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2011 05:37 AM, Richard Purdie wrote:
> On Tue, 2011-06-14 at 10:28 +0100, Phil Blundell wrote:
>> On Mon, 2011-06-13 at 10:12 -0700, Khem Raj wrote:
>>> On Mon, Jun 13, 2011 at 1:51 AM, Phil Blundell<pb@pbcl.net>  wrote:
>>>> On Sun, 2011-06-12 at 21:03 -0700, Khem Raj wrote:
>>>>> This patch brings in new patches from gcc 4.6 FSF branch
>>>>> And refreshes the headers of existing backported patches
>>>>> to not have git patch numbers in comments
>>>>>
>>>>> I am not sending the patch itself to mailing list due to its
>>>>> large size so please review it on the contrib tree itself
>>>>>
>>>>
>>>> Would we not be better off just pulling the tip of the 4.6 branch from
>>>> FSF SVN, rather than having to keep all these patches in git?
>>>>
>>>
>>> there is dislike for this approach in oe-core. As the release point is preferred
>>> I suggested to drop the minor release number and call the recipes 4.6
>>> and use SVN
>>> REVs to track the recipe updates but it did not fly :)
>>
>> Where does that dislike come from?  Koen did make a comment about having
>> liked svn checkouts for 4.5 "very, very much" but I couldn't quite
>> figure out whether he was being sarcastic or not and, if so, what
>> exactly his objection was.
>>
>> I could understand there being a preference for individual patchsets if
>> we were just going to cherry-pick carefully selected bugfixes from the
>> branch and patch them in.  But, if we're going to take the approach of
>> just importing everything from the branch en masse, it seems like
>> keeping them as patches is just making more work for ourselves.
>>
>> We're using svn checkouts for eglibc, which seems to be working well
>> enough and hasn't provoked any particular outrage that I noticed.
>
> I think it was my dislike that Khem is referring to. I was under the
> impression that we were going to be more selective that just taking
> everything (e.g. the translation updates probably aren't essential to
> us).
>
> I realise its easier to just take everything though and if we are going
> to do that it probably does make sense to use svn directly. I'll take a
> patch to do that.

What goes into release branches of gcc are strictly bug fixes only. So 
its safe to get them all

I will prepare a patch for it.

>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



