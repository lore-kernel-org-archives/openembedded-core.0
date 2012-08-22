Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe@deserted.net>) id 1T4GLA-0007Zu-Uv
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 21:11:45 +0200
Received: by ghbz2 with SMTP id z2so971903ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 11:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=bEEv/raM9RNfXcUrRQJiYtxa9L7Y+yZZRC5HlataG/s=;
	b=GbH423R6lfYzWi7sHxgWw9gmaVO/OPqnUdKPVjq22Fes6xBBxNS3BYtQ6RTjSNcMBh
	FJKqWYXyQWjX9HycNz9aO2ggm9LVX+iiN2JrmWAUi4FSAWtaGKW+t9q19xUgr6f82AEN
	ra7zDIzGne9JQ7a5deuppwPnoiusG5Gd7eyuSJ6KEcQG8X57phBw/jchzVRjJHkx1XJ4
	ifIp12XODsbo5qECsw40cgPZJE+NheV9SqbWB+1nBZOeCv1EqRah8vOx1Q/27EH7oIc6
	Mloqy0znTvR+33eYjDeLCRDo+fpq3khhPKFhv0ORE7rPxDLPTLyKUH2i3LlIbW9Svyva
	aVNA==
MIME-Version: 1.0
Received: by 10.50.87.165 with SMTP id az5mr3292087igb.60.1345661978493; Wed,
	22 Aug 2012 11:59:38 -0700 (PDT)
Received: by 10.50.60.34 with HTTP; Wed, 22 Aug 2012 11:59:38 -0700 (PDT)
In-Reply-To: <2E13D0D74D03406FAF576083ED655376@gmail.com>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<2E13D0D74D03406FAF576083ED655376@gmail.com>
Date: Wed, 22 Aug 2012 14:59:38 -0400
Message-ID: <CANBf+V29JZm0SqE_YgvAB9PxR7SOvQOUGzGAVKkm6en7ZsGysw@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: Christopher Larson <kergoth@gmail.com>
X-Gm-Message-State: ALoCoQlS3cUlIilLvqWxvExDkhM1vsGo7Wqs01kD1l1BWZTlAWrwpM14as91fLWE8Szh9C4XSChV
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
X-List-Received-Date: Wed, 22 Aug 2012 19:11:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 22, 2012 at 2:20 PM, Christopher Larson <kergoth@gmail.com> wrote:
> On Friday, June 15, 2012 at 8:15 AM, Joe MacDonald wrote:
>
> We've been talking about this on-and-off at Wind River for a while now,
> but it now seems like a reasonable time to bring a proposal to the OE
> community at large. We're thinking about creating a new layer to house
> recipes, etc. for networking packages. I'll try to address what seem to
> be the most immediate questions (certainly the ones we've been thinking
> most about any time I've discussed this with anyone):
>
> Has their been any progress on the creation of this layer?

Absolutely.  I think at least some of my mail on the subject have been
bouncing from the lists but the short version is at the end of July
the existing "meta-openembedded" pieces were done in my tree and there
was a list of stuff that needed fixing in migrating the oe-classic
bits into the new meta-networking layer (the list I laid out in my
initial email).  I was on vacation between then and Monday, so
nothing's happened since then but this week I'm back looking at the
best way to handle these older recipes that are in need of love in
order to work with the current meta-oe and we should be good to go.  I
think what's likely to happen is there will be some of them updated
right away and others will be integrated and updated soon after.

-J.

> --
> Christopher Larson
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Joe MacDonald
:wq


