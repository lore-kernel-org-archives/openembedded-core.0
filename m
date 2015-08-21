Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id D732373E11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:52:52 +0000 (UTC)
Received: by iods203 with SMTP id s203so77285656iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 03:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=aRQrTyIFMWGDLkSuLgH4AFPsRD2PbWK88X9LoBiCs7o=;
	b=HAGSDZCECianJKY7ulX3/vnTqS4gogYOMb0FpzcX9kTQOllwRyEDy5v0Zd8nIt2jOD
	5tm3aaCCI+wJjQYsXh0jTL4418Ct7pHLcuRTs64Vj1okjHvCnehdp+pkq4YPgzNTtTgA
	He0m019eXc4UVgcHZq/l7AfWf1XycCQlYv5v0L3+ksjfK5Z+9nttLGbAKto21kbkuGRd
	fUmwfkG9kN+m3Vq8aVTqwF9VeeAvesK8Kpfc/zbhQh4JbqkNKUp9H73FGhIex7y3tz9k
	zm5Ehar3E6rjP0lfQo/WXVWNloj9OCBWUFUI7GMHpzTdXv6sLvNwfPRHf5vL6gOLra77
	2zeQ==
X-Gm-Message-State: ALoCoQnY2xSP2m5ykpAuuj1r13zJLuWoduquX+I+HFe4sDyvUpHFAT+KIJTbqlE5E+98k7Ykiu9Q
X-Received: by 10.107.5.204 with SMTP id 195mr1151607iof.161.1440154372184;
	Fri, 21 Aug 2015 03:52:52 -0700 (PDT)
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com.
	[209.85.213.174]) by smtp.gmail.com with ESMTPSA id
	hh9sm1466683igb.18.2015.08.21.03.52.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Aug 2015 03:52:50 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igfj19 with SMTP id j19so11291334igf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 03:52:50 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.50.239 with SMTP id f15mr1839013igo.19.1440154370465;
	Fri, 21 Aug 2015 03:52:50 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 21 Aug 2015 03:52:50 -0700 (PDT)
In-Reply-To: <1440153906.12105.233.camel@linuxfoundation.org>
References: <cover.1439991144.git.paul.eggleton@linux.intel.com>
	<d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>
	<1440153906.12105.233.camel@linuxfoundation.org>
Date: Fri, 21 Aug 2015 07:52:50 -0300
Message-ID: <CAP9ODKqrtCyB=jzN+CJfQPpJhBYMxhgeUivWhreeyLXB7q6n5w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Fri, 21 Aug 2015 10:52:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 21, 2015 at 7:45 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2015-08-19 at 14:34 +0100, Paul Eggleton wrote:
>> Allow restricting recipes brought from a layer to a specified list. This
>> is similar in operation to blacklist.bbclass, but instead specifies a
>> per-layer whitelist of recipes (matched by BPN) that are able to be
>> built from the layer - anything else is skipped. This is potentially
>> useful where you want to bring in a select set of recipes from a larger
>> layer e.g. meta-oe.
>>
>> Implements [YOCTO #8150].
>>
>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> ---
>>  meta/classes/whitelist.bbclass | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>  create mode 100644 meta/classes/whitelist.bbclass
>
> I should go on record as having some pretty strong reservations about
> this from a philosophical standpoint.
>
> Why? I think its going to encourage behaviours which will result in a
> decrease in layer quality, particularly for meta-oe.
>
> Taking a simple example, today if someone breaks parsing in meta-oe, its
> quickly known about and multiple people can see and resolve the issue.
> Once people start using this class, many users will simply never
> see/care about parsing breakage in less maintained parts of the layer.
>
> I appreciate Martin will likely notice, however this shouldn't Martin's
> sole responsibility.
>
> Since people's focus will be on to narrow parts of the layer, we'll
> start to see islands which are well maintained/used and islands which
> are not. Worse, just looking at the layer, we won't be able to tell
> which is which.
>
> I'm nervous about anything which pushes responsibility onto already
> overloaded maintainers and encourages behaviour which is a net loss on
> "quality".
>
> I've talked to several significant users and they all "love" the idea of
> this class and plan to adopt it ASAP over existing tools like
> combo-layer. I therefore can't see much advantage of not merging the
> class as people are going to use it regardless.
>
> Speaking of it, combo-layer was designed to be an alternative way of
> dealing with these issues (more pain to use but causing less of a
> quality impact). Sadly, whilst it has seen some improvements, it still
> doesn't handle every operation it would need to make it work for some
> users and isn't widely adopted. I simply don't have the time to go and
> push it forward.
>
> So my objection is on record but that is likely about all I can do,
> other than hope I'm overly paranoid...

I fully support your objection and I also nervous about this one.
Often vendors want to narrow their responsibility and focus so this
class opens the door for this to be done officially. :-(

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

