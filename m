Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SKYZ1-0007Ee-Nd
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 19:21:07 +0200
Received: by wibhj13 with SMTP id hj13so767617wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 10:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=zNpGNTl8ulCvbfbKIGY5Htu4EGprzuUMjRBqTm14KFk=;
	b=SVKf69gO+H++uCec0q93CMxjoZXpjV4VwBkxLThDOlImIgMrNr6/HPCIMCZUrQOzoM
	cuGILVrLlvDcHDoJBBiQYlbfYMp8anhcf0R4htwP/rRmySCgY+LGH2R9JySGTgSWhhzv
	jwNn8LeH156aEwUlYRdlZ52ez4/FKAKmV9rHyKykPhjpGQB4VND9B6vD8HjrdL2bmVhX
	7xXJuSKnXPAh+bXUKOnK1+w50BBRSUYdeROJoEhlInXYlz23dn2Bt4Z+6EMu+pKQd3Q7
	+Nwq6/vJ5j/OnEO5TpNJb36DSwsr42NrWYBURmYw+bemt4swUJtYjM2p8BC6Rfng+eh+
	EuTA==
Received: by 10.180.86.132 with SMTP id p4mr8018925wiz.15.1334769100373; Wed,
	18 Apr 2012 10:11:40 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.209.9 with HTTP; Wed, 18 Apr 2012 10:11:19 -0700 (PDT)
In-Reply-To: <CABcZANk+nFT1F7=WBNdE_z3pj=zAzrSQBuD6-DcKT8+OCLKr9g@mail.gmail.com>
References: <1334760467.24091.100.camel@ted>
	<20120418145330.GM3635@jama.jama.net>
	<1334762445.24091.110.camel@ted>
	<CABcZANkaABCKZ+WmhhGTZEvFnHYwrP7uNSSvNTxxKxfun4JaPA@mail.gmail.com>
	<1334768537.24091.156.camel@ted>
	<CABcZANk+nFT1F7=WBNdE_z3pj=zAzrSQBuD6-DcKT8+OCLKr9g@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 18 Apr 2012 10:11:19 -0700
X-Google-Sender-Auth: ieU_I0WvE5nqL5AyX5bAG4QMtYc
Message-ID: <CABcZANmrzmSPJNZH2VqtO0o=L_Wk0-VK_PEP4m0+TRWQ8cYMjg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: yocto <yocto@yoctoproject.org>
Subject: Re: Yocto Project 1.2 Release Status
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
X-List-Received-Date: Wed, 18 Apr 2012 17:21:07 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 18, 2012 at 10:06 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, Apr 18, 2012 at 10:02 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Wed, 2012-04-18 at 09:22 -0700, Chris Larson wrote:
>>> On Wed, Apr 18, 2012 at 8:20 AM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>> > On Wed, 2012-04-18 at 16:53 +0200, Martin Jansa wrote:
>>> >> On Wed, Apr 18, 2012 at 03:47:47PM +0100, Richard Purdie wrote:
>>> >> > I thought I'd update everyone with the current 1.2 status.
>>> >> >
>>> >> > I'm going to branch master for release at this point. We've fixed a lot
>>> >> > of issues, I'm hoping the -rc4 build will be a good one. There are signs
>>> >> > there are some more minor issues around and bugs do keep getting opened.
>>> >> > These are still being investigated so we'll continue to let that happen.
>>> >> > Once we have a QA report for -rc4, we'll be in a better position to make
>>> >> > a call on how things are looking.
>>> >>
>>> >> Does it mean that after creating branch, master will be open for
>>> >> postponed patches from ML and master-next or do you want to keep master
>>> >> as close to release branch as possible for some time (e.g. for those
>>> >> 1.2.1 fixes)?
>>> >
>>> > I have hoped people would work more on the stabilisation and testing but
>>> > I don't think I'll be able to hold off the pressure to start master
>>> > rolling again at some point relatively soon.
>>>
>>> Just because people have things to push or are pushing things which
>>> aren't bugfixes doesn't mean their time is being taken up by anything
>>> but stabilization right now. Your statement implies that everything
>>> being pushed is being currently worked on, which is incorrect. I'm
>>> sure Mentor isn't the only company with a backlog of already complete
>>> local changes to get upstream..
>>
>> So you're saying Mentor has been working on stabilization and has a
>> queue of bugfixes which they've not shared?
>
> No, I never said they were just bugfixes. If they were low impact
> bugfixes, they'd have a shot at making it into the release, especially
> if they're critical, no?

Further, again you're ignoring previous work. Whether we've been
working on stabilization right now is irrelevent given we have
previous work to push. Mentor has been using OE for its products for
years, to expect that a very small team which has to focus on customer
issues is going to catch up on all of that effort in a short period of
time is unreasonable. We've been working against our backlog for
months, and will continue to do so until we're caught up. The frozen
tree just slows that down even more.

If you want folks like us working more closely with upstream, then you
have to realize that folks are going to have changes to push which
aren't bugfixes (or aren't critical), and contrary to your
implication, does not imply that folks are ignoring the stabilization
efffort. Previous work needs to go up, and isn't occupying current
development effort.
-- 
Christopher Larson


