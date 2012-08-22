Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T4GhK-0001Kq-Kg
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 21:34:38 +0200
Received: by lagv3 with SMTP id v3so712551lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dFuguGZQQ8fjusGz2zWLr0rIGEuD37OsWtsazWWiKx8=;
	b=ZL2a+EZlEN0/Z1ZyvjGu8xeg31VrQG5Bi9kKziFfQ/S479ttH67OYU7l+E1O1a4Q4c
	WmOZmTVdTSuR6bnGMo6Yuygonay1szpwj4xTbOpd0f0qcWRmGgpwqLXRhYEayjrm+UaA
	8wyGhMC+YQK08ywFK81VncKWL7anayezpJ3ng7AITj8BuA0XTJ6d6gUrCc06K4qQPdlc
	hkZX/KzYdQMp1XK2t5ARBCHF7HkqBaJwJSJ3mptXIPbpbBwf6IMlPAeneU7GdCoypulQ
	nOaipLRtNBqWY3KLLDE5c/TcNMMJmG7KsO5sKbpSjkbsmS9yP1yoRexpa0AZrWimyLQL
	/v1A==
Received: by 10.112.86.169 with SMTP id q9mr9684878lbz.65.1345663353142; Wed,
	22 Aug 2012 12:22:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.19.2 with HTTP; Wed, 22 Aug 2012 12:22:13 -0700 (PDT)
In-Reply-To: <CANBf+V29JZm0SqE_YgvAB9PxR7SOvQOUGzGAVKkm6en7ZsGysw@mail.gmail.com>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<2E13D0D74D03406FAF576083ED655376@gmail.com>
	<CANBf+V29JZm0SqE_YgvAB9PxR7SOvQOUGzGAVKkm6en7ZsGysw@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Wed, 22 Aug 2012 12:22:13 -0700
Message-ID: <CABcZANkyW52k-h1zfpA482b4+q4GyV_nZU2e=giKJExeqWws0A@mail.gmail.com>
To: Joe MacDonald <joe@deserted.net>
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
X-List-Received-Date: Wed, 22 Aug 2012 19:34:38 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 22, 2012 at 11:59 AM, Joe MacDonald <joe@deserted.net> wrote:
> On Wed, Aug 22, 2012 at 2:20 PM, Christopher Larson <kergoth@gmail.com> wrote:
>> On Friday, June 15, 2012 at 8:15 AM, Joe MacDonald wrote:
>>
>> We've been talking about this on-and-off at Wind River for a while now,
>> but it now seems like a reasonable time to bring a proposal to the OE
>> community at large. We're thinking about creating a new layer to house
>> recipes, etc. for networking packages. I'll try to address what seem to
>> be the most immediate questions (certainly the ones we've been thinking
>> most about any time I've discussed this with anyone):
>>
>> Has their been any progress on the creation of this layer?
>
> Absolutely.  I think at least some of my mail on the subject have been
> bouncing from the lists but the short version is at the end of July
> the existing "meta-openembedded" pieces were done in my tree and there
> was a list of stuff that needed fixing in migrating the oe-classic
> bits into the new meta-networking layer (the list I laid out in my
> initial email).  I was on vacation between then and Monday, so
> nothing's happened since then but this week I'm back looking at the
> best way to handle these older recipes that are in need of love in
> order to work with the current meta-oe and we should be good to go.  I
> think what's likely to happen is there will be some of them updated
> right away and others will be integrated and updated soon after.

Sounds good, thanks for the update. Is this repository-in-progress
available somewhere public yet?
-- 
Christopher Larson


