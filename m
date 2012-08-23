Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe@deserted.net>) id 1T4Yzx-0006yk-DX
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 17:07:05 +0200
Received: by obc16 with SMTP id 16so1741251obc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 07:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=8CghETQEJJrFYgjm6WWOWg9D26We4/DF440g8gBT60s=;
	b=jq+qzyJLbiajyjmlv50+m+821Hj/rWoAE1znX+AogsrLDL3Dso1me3il3y0AQfTtpP
	ZwhS0j0RMsKDkucGmYp/ntrS07IgnBQJbKReg2Of2/aYb9x77mAcU3CpeyEW8AV4xHhT
	aOgOaeSTplCWpbweqmEmSYHYsBMEiTxgW6A+hbx5tr7s3iukM3HLi6zcju6wtofuSfKw
	s21FlD68IzVQc33SryzOc/gMbPeOvQesyUWGi1NINY9xw/L/eOfREaTSDCkzThGKg1Tc
	IUA4Bl9ANEuaVpht0ZNyyXJ0mH+817JlcE9cr4MwUWc3I/q+pU1cths9Y2sG73jA9ANM
	0vog==
MIME-Version: 1.0
Received: by 10.50.171.106 with SMTP id at10mr1823169igc.61.1345733697467;
	Thu, 23 Aug 2012 07:54:57 -0700 (PDT)
Received: by 10.50.60.34 with HTTP; Thu, 23 Aug 2012 07:54:57 -0700 (PDT)
In-Reply-To: <0B0C7CC8-F9B5-4107-942F-1F24D21C629C@dominion.thruhere.net>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<2E13D0D74D03406FAF576083ED655376@gmail.com>
	<CANBf+V29JZm0SqE_YgvAB9PxR7SOvQOUGzGAVKkm6en7ZsGysw@mail.gmail.com>
	<CABcZANkyW52k-h1zfpA482b4+q4GyV_nZU2e=giKJExeqWws0A@mail.gmail.com>
	<0B0C7CC8-F9B5-4107-942F-1F24D21C629C@dominion.thruhere.net>
Date: Thu, 23 Aug 2012 10:54:57 -0400
Message-ID: <CANBf+V2CJVmGU3myyebxgbkp7t1NEBKS6f1kE93DRWCGUAwcHw@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnwLx1N9UK0pnoV8y7TRdH0dGCIgQpk/wbPHxEZ2nhI7V5cOo9e+SIAIVfiHw/xUWUWsYbW
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Proposal: Creating meta-networking
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2012 15:07:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 23, 2012 at 2:22 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 22 aug. 2012, om 21:22 heeft Chris Larson <kergoth@gmail.com> het volgende geschreven:
>
>> On Wed, Aug 22, 2012 at 11:59 AM, Joe MacDonald <joe@deserted.net> wrote:
>>> On Wed, Aug 22, 2012 at 2:20 PM, Christopher Larson <kergoth@gmail.com> wrote:
>>>> On Friday, June 15, 2012 at 8:15 AM, Joe MacDonald wrote:
>>>>
>>>> We've been talking about this on-and-off at Wind River for a while now,
>>>> but it now seems like a reasonable time to bring a proposal to the OE
>>>> community at large. We're thinking about creating a new layer to house
>>>> recipes, etc. for networking packages. I'll try to address what seem to
>>>> be the most immediate questions (certainly the ones we've been thinking
>>>> most about any time I've discussed this with anyone):
>>>>
>>>> Has their been any progress on the creation of this layer?
>>>
>>> Absolutely.  I think at least some of my mail on the subject have been
>>> bouncing from the lists but the short version is at the end of July
>>> the existing "meta-openembedded" pieces were done in my tree and there
>>> was a list of stuff that needed fixing in migrating the oe-classic
>>> bits into the new meta-networking layer (the list I laid out in my
>>> initial email).  I was on vacation between then and Monday, so
>>> nothing's happened since then but this week I'm back looking at the
>>> best way to handle these older recipes that are in need of love in
>>> order to work with the current meta-oe and we should be good to go.  I
>>> think what's likely to happen is there will be some of them updated
>>> right away and others will be integrated and updated soon after.
>>
>> Sounds good, thanks for the update. Is this repository-in-progress
>> available somewhere public yet?
>
> I'd very much welcome a patch creating an empty layer in meta-openembedded with just the README, layer.conf and COPYING.MIT

Easily done!  git-send-emailing it now.

-- 
Joe MacDonald
:wq


