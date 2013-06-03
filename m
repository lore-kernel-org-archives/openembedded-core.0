Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3672860881
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 06:00:59 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id n15so3144592ead.18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Jun 2013 23:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=I1JYWJRyL9Mu+W+vIB731b7cfbqDmbW1mR+cXHiCbl8=;
	b=StLoWJ+iBsprisK7nI+KASWG0fHQCWzBza3iU+9JWBVC7CLg5GTv/r/TpfXXsLomH7
	qlFdpFc1Z2f0SmwvR+CbILdYjE5aJv6TwMqqyw6FwygANuC83XrdbwBkyi2oe1Ea61Gk
	2irU7aVwm20rsBEE5h57WGT07504KoRbxcQ7b4ws8YPf1oQVQfpAyqvjLxv2YAc54joO
	nYOlkeKKDE9qxsYKbNHU86qLxF1GZMBhA9S7o3cgFdRBIpJYuvums9TymxGCYTFghA9X
	Ebf+rF+eoEXl1m/ykJAheMWfMGgaNy3ie7v5Klry5+vKFGAwrtG4/w+uA7e4/yDfipEw
	Acfg==
X-Received: by 10.14.38.71 with SMTP id z47mr21970844eea.138.1370239258757;
	Sun, 02 Jun 2013 23:00:58 -0700 (PDT)
Received: from ?IPv6:2001:610:612::c93b:db13:ad8d:1d69?
	([2001:610:612:0:c93b:db13:ad8d:1d69])
	by mx.google.com with ESMTPSA id s8sm82263167eeo.4.2013.06.02.23.00.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Jun 2013 23:00:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <51A8E185.1010303@linux.intel.com>
Date: Mon, 3 Jun 2013 08:00:56 +0200
Message-Id: <938455D5-B24C-4B2E-880B-A235A10D22C5@dominion.thruhere.net>
References: <51781746.2000509@linux.intel.com> <2278334.0GkpBHEP1r@helios>
	<20130531173450.GC23802@jama> <51A8E185.1010303@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmfct9msTPqtPgwnlyFDoUtQuP3h15I8sr98/F8oGqBg2USk/WahrRAa6bx5Z8RSjGTIwAq
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, "Garman,
	Scott A" <scott.a.garman@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Stable Release Process
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
X-List-Received-Date: Mon, 03 Jun 2013 06:01:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 mei 2013, om 19:44 heeft Darren Hart <dvhart@linux.intel.com> het =
volgende geschreven:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
>=20
>=20
> On 05/31/2013 10:34 AM, Martin Jansa wrote:
>> On Fri, May 31, 2013 at 05:34:51PM +0100, Paul Eggleton wrote:
>>> Hi Darren,
>>>=20
>>> Sorry it's taken me so long to reply to this.
>>>=20
>>> On Wednesday 24 April 2013 10:32:54 Darren Hart wrote:
>>>> As the stable releases become first class citizens, we should
>>>> probably look at streamlining the process of getting patches to
>>>> them.
>>>>=20
>>>> The maintainer for the stable release currently changes by
>>>> release, which undoubtedly creates some confusion of where to
>>>> send patches and who to CC. These maintainers currently attempt
>>>> to track these patches via email filters searching for release
>>>> branch names and such, which is proving tedious and prone to
>>>> missing patches.
>>>>=20
>>>> Other projects have seen good results using a stable list for
>>>> this purpose. This would both make it obvious when a patch is
>>>> intended for a stable release as well as remove any confusion
>>>> about who to Cc as it would be the same list for all releases.
>>>> Perhaps something like=20
>>>> openembedded-core-stable@lists.openembedded.org?
>>>=20
>>> In the OE-Classic days we used to have an
>>> openembedded-stablebranch mailing list for the same purpose. I
>>> don't recall anyone complaining about that when we had it, so
>>> this sounds like it could help with the aforementioned issues.
>>>=20
>>> The downside I can see is that it's one more mailing list with
>>> the associated problems of not everyone monitoring it ("that
>>> patch of mine shouldn't have been backported!" or "you backported
>>> one of my patches but missed an associated one"), and new users
>>> erroneously emailing it with requests for help that should have
>>> gone to the normal mailing list. That could however be outweighed
>>> by the advantage of stable branch patches not being drowned out
>>> by the rest of the patches as they currently can be.
>>>=20
>>>> In addition to the list, some policy would need to be
>>>> documented on how to use the list. For example, it should
>>>> always be Cc'd, and never emailed with patches directly that
>>>> don't go first to the master branch. Backports being the
>>>> exception. A policy could also be put in place to aid in
>>>> automatic processing, such as that employed by the Linux
>>>> kernel stable project. The following would request that the
>>>> patch be applied to the denzil and danny stable releases:
>>>>=20
>>>> Cc: <openembedded-core-stable@lists.openembedded.org> # denzil=20
>>>> Cc: <openembedded-core-stable@lists.openembedded.org> # danny=20
>>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>>>=20
>>>> The advantage here over something like a subject tag, "[danny]"
>>>> is that it scales a bit better to sending a patch for multiple
>>>> releases.
>>>>=20
>>>> There are certainly other approaches, I mention this one as it
>>>> has a proven track record and I don't have a reason to deviate
>>>> from it.
>>>=20
>>> I'm not familiar with this, but I've never had any direct contact
>>> with the kernel patch submission process so that might explain
>>> it. I have to say I'm not unhappy with the existing convention we
>>> have of marking it in the title of the email though.
>>>=20
>>> I'd like to hear more opinions from others, particularly
>>> submitters of stable branch patches and other stable branch
>>> maintainers who have been doing it longer than I have. Ping...?
>>=20
>> I like subject tags, at least because they are nicely shown in
>> patchwork subject, so I can easily sort incoming patches to right
>> bundles.
>>=20
>> And this problem with scaling when sending a patch for multiple=20
>> releases we already have when tagging multiple affected layers
>> (which happens more often for meta-oe layers then multiple
>> releases).
>=20
> It has been expressed that this has been challenging to enforce
> (anything that is freeform is). Do you have any suggestions on how we
> could address that? Documentation? Firm maintainer policy of willfully
> ignoring non-tagged patches?

An email saying "wrong tag, please read README and resubmit" followed by =
willfully ignoring wrong tags has worked quite well in the past. But =
only if the README clearly states the tags needed and has a sample =
git-send-email cmdline.

regards,

Koen=

