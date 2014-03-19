Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id D57F860DFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 22:38:43 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id c41so5802yho.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 15:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=iDE5BCnSX0sNm4/qY8FEiM49vjG1mSlqrSMVAN9pEfA=;
	b=OIx+h7EHYeJkYwa3JRdXfp4YP23iZ5uAt3hbTf+nAVLhUbvbiOG6lKtxZ0dr10jrEq
	KVBNlnOeEyKcM0kQkYTZu4m57sIXo5X8Al2YhcyoavJh92ALKF9spb44Jgw1UpD4UOlH
	kTkEdc/yDfOsc6c9jktf0F4hfbsvKnZcdqRjKksfZSXvyqkI0mHRURq6o/kIPOMD0Qwi
	ORSrAGbTpTXIyyRhyugMFEWxkQiftcutAnrLJQNBKfqsLfJwIBWaZZlcCnoz5qW9S8wY
	U2K78g9sSg0Iowx9U2oYrw34DMdSRKtiFiYTBX17DkkPfMJ3KY/9lR0PhBFQ65Uutewo
	ldTQ==
MIME-Version: 1.0
X-Received: by 10.236.131.19 with SMTP id l19mr30217392yhi.0.1395268724117;
	Wed, 19 Mar 2014 15:38:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 19 Mar 2014 15:38:44 -0700 (PDT)
In-Reply-To: <1395147366.3808.70.camel@ted>
References: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>
	<23BFBADE-120F-4DBC-AABF-A9F802B8222C@dominion.thruhere.net>
	<1395147366.3808.70.camel@ted>
Date: Wed, 19 Mar 2014 19:38:44 -0300
X-Google-Sender-Auth: SuWMv0b16EZmzECcctSt3U8E0xI
Message-ID: <CAP9ODKqhnScZ+__098Q7OS53WrkkASfrfSxdkGt3OeozZ=2yJA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] linaro-pm-qa-utils: Add power management test utils
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
X-List-Received-Date: Wed, 19 Mar 2014 22:38:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 18, 2014 at 9:56 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-03-18 at 13:29 +0100, Koen Kooi wrote:
>> Op 18 mrt. 2014, om 12:56 heeft Chase Maupin <Chase.Maupin@ti.com> het volgende geschreven:
>>
>> > * The power management test utilities from Linaro can be used
>> >  to test multiple PM features such as cpufreq, cpuidle, thermal
>> >  control and suspend operations.
>> > * These utilities are not platform specific and can be used by
>> >  a broader base of users.
>>
>> PN should me 'pm-qa' or 'pm-qa-utils'.
>
> Agreed.
>
>>  And it would fit better in meta-oe since it's not 'core' enough for oe-core.
>
> I'm open to discussion on that. Certainly if there is just one user,
> meta-oe would be appropriate. If these are generically useful and the
> plan is we integrate these into the larger automated test picture,
> oe-core may make sense.
>
> So if there a bigger picture plan here? Would these make sense in the
> broader picture?

I prefer if this is done in meta-oe first and we move to oe-core when
needed. For now it is at very beginning so we still does not know what
will be the real final picture of t.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

