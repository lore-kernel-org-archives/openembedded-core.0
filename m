Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sofj1-0006zK-1h
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 21:03:55 +0200
Received: by eekc50 with SMTP id c50so117358eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 11:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Q9OWQVO38LWMMmT9n2KPHB4Ugukahr0HyckOevk21X4=;
	b=WGsAyFmqv0+o02V/U9SSPQY2AP3oH0jLOq58C8SFqun0HLTrGoe2RcBFJwtXt2SAfA
	1HCh8GD6QA7dCou5frLFUfEEAh9aZ/IdwHAvL714xxGfdBqFvCKf8ANdepf/KZM9Sxig
	rWYv0QzjbLEkSZyZJsQTSA/92SGVuBBvUA8qnB+e4MYRj6UyTjPkJbyRx1aD1Atl0XWS
	V1zOXs1nD40P18UaG6e6D0mukn3m5UiDqou73MZVMN6/XcTemoyBfP4Quxypz6npUeHy
	kJ9/B4ipK3NY1HqGqNJQo2abpt1/IL/TQ3nMSpXW7/gVBurGOyZQUhaH7roiv42GGA+g
	JlQg==
Received: by 10.14.119.202 with SMTP id n50mr10704224eeh.33.1341946364166;
	Tue, 10 Jul 2012 11:52:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Tue, 10 Jul 2012 11:52:13 -0700 (PDT)
In-Reply-To: <4FFC73C5.4080207@linux.intel.com>
References: <1341871474-8719-1-git-send-email-sgw@linux.intel.com>
	<CAMKF1sowgGneDRp61GaL10-rbsCT7ucUq_ri_GNhm4+--idKww@mail.gmail.com>
	<4FFB6D1A.4070400@linux.intel.com>
	<CAMKF1sr7U+mDi=5c2_C9ejW05DBQzHCY6RYoWr_L4xB3KKuYUQ@mail.gmail.com>
	<4FFC73C5.4080207@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Jul 2012 11:52:13 -0700
Message-ID: <CAMKF1spJ2tbEwh_HWvKmVf7fTv+4B8bP0G7NpMOSwJUJmkXvBQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnupg: ensure deterministic build by disabling libcurl
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
X-List-Received-Date: Tue, 10 Jul 2012 19:03:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 10, 2012 at 11:26 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/09/2012 06:21 PM, Khem Raj wrote:
>>
>> On Mon, Jul 9, 2012 at 4:45 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>> On 07/09/2012 03:43 PM, Khem Raj wrote:
>>>>
>>>>
>>>> On Mon, Jul 9, 2012 at 3:04 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>>>
>>>>>
>>>>> gnupg has it's own fake curl, since we use gnupg with zypper, there
>>>>> does
>>>>> not
>>>>> seem to be a strong reason to add curl to the depends list.
>>>>
>>>>
>>>>
>>>> what does disabling curl has to do with gnupg being used with zypper ?
>>>>
>>> I was looking for where gnupg was used within oe-core and it's usage
>>> model
>>> to see if it made sense to go with the extra dependency for gnupg, let me
>>> know your reasoning.  Generally especially for natives we look for ways
>>> to
>>> reduce the initial build time.
>>
>>
>> I am all for it. I wanted to understand the context thanks for that.
>> On another note
>
> Do you want me to amend the commit message?
>
>
>
>> it would be interesting to know what are we losing if we disable curl
>> or external curl
>>
> gnupg seems to use a very small subset of curl and the curl_shim that it
> provides covers what's need in a very basic manner (including handling proxy
> setups).  I would guess (after a cursory look) that we would lose better
> error handling and performance for the gpgkeys_curl command line interface.
>
> I think that acceptable.
>


yes add good summary of this to commit log would help in future references


