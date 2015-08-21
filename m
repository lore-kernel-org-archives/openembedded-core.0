Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8E8BD60657
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 21:43:06 +0000 (UTC)
Received: by igfj19 with SMTP id j19so27243111igf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=zpkm24V3ZUOrQxyG1hDd8vjepUoJ3RDyu6l060cE14U=;
	b=aIVoPCFX8YjT6K6XxdDCqmHC0wz4M8UzET5bh7yk5WX0MwTviygU5toAiJhaz86j/A
	brnCtx1EB/jdiSGKrgzFmY5hlQRkF/uz05l3RboIRWaBmdoX49A56gS6TZ2Uw3gdU4Xy
	IARxCnhlIYzItjJbI3ZqgBnlaJjPfEFhWuw0hKbMoSMa+q/53yBsiB72bLBgeaQ17d6y
	roAxjF1CGouJia3/izyP2SVyHkQicbtZHW5yPS9W52GyiUzYjH6X4VP4xKAAiQONpnVc
	/eg5KD4k0ohbgjOlFkBjN1Ab18N+b+sFlF5fimxkE5hYcbG0FalJXhqORI+Ko12uHVlh
	05sg==
X-Gm-Message-State: ALoCoQn5NYPfPOspoAxUuhP4BAhxHrHiF4FpXAbtMR3jUeBYqe2V0/3sGcaWypZMW8hYMntj7eGA
X-Received: by 10.50.253.36 with SMTP id zx4mr4935424igc.43.1440193386295;
	Fri, 21 Aug 2015 14:43:06 -0700 (PDT)
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com.
	[209.85.223.177]) by smtp.gmail.com with ESMTPSA id
	ci7sm2733400igc.16.2015.08.21.14.43.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Aug 2015 14:43:04 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodt126 with SMTP id t126so96193014iod.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:43:04 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.14.145 with SMTP id 139mr8553369ioo.37.1440193384216;
	Fri, 21 Aug 2015 14:43:04 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 21 Aug 2015 14:43:04 -0700 (PDT)
In-Reply-To: <CAMKF1srDn=2kMGpkn0Pp1fF89PBk+Ex6AonVgur5vSFnkAOfdQ@mail.gmail.com>
References: <cover.1439991144.git.paul.eggleton@linux.intel.com>
	<d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>
	<1440153906.12105.233.camel@linuxfoundation.org>
	<CAMKF1srDn=2kMGpkn0Pp1fF89PBk+Ex6AonVgur5vSFnkAOfdQ@mail.gmail.com>
Date: Fri, 21 Aug 2015 18:43:04 -0300
Message-ID: <CAP9ODKraiRiKPOq1mYDNWjMXex4Cn1jrSjVhxyUU-_jpFbW_nw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 21 Aug 2015 21:43:06 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 21, 2015 at 2:45 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 21, 2015 at 3:45 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Wed, 2015-08-19 at 14:34 +0100, Paul Eggleton wrote:
>>> Allow restricting recipes brought from a layer to a specified list. This
>>> is similar in operation to blacklist.bbclass, but instead specifies a
>>> per-layer whitelist of recipes (matched by BPN) that are able to be
>>> built from the layer - anything else is skipped. This is potentially
>>> useful where you want to bring in a select set of recipes from a larger
>>> layer e.g. meta-oe.
>>>
>>> Implements [YOCTO #8150].
>>>
>>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>> ---
>>>  meta/classes/whitelist.bbclass | 28 ++++++++++++++++++++++++++++
>>>  1 file changed, 28 insertions(+)
>>>  create mode 100644 meta/classes/whitelist.bbclass
>>
>> I should go on record as having some pretty strong reservations about
>> this from a philosophical standpoint.
>>
>> Why? I think its going to encourage behaviours which will result in a
>> decrease in layer quality, particularly for meta-oe.
>>
>> Taking a simple example, today if someone breaks parsing in meta-oe, its
>> quickly known about and multiple people can see and resolve the issue.
>> Once people start using this class, many users will simply never
>> see/care about parsing breakage in less maintained parts of the layer.
>>
>> I appreciate Martin will likely notice, however this shouldn't Martin's
>> sole responsibility.
>>
>> Since people's focus will be on to narrow parts of the layer, we'll
>> start to see islands which are well maintained/used and islands which
>> are not. Worse, just looking at the layer, we won't be able to tell
>> which is which.
>>
>> I'm nervous about anything which pushes responsibility onto already
>> overloaded maintainers and encourages behaviour which is a net loss on
>> "quality".
>>
>> I've talked to several significant users and they all "love" the idea of
>> this class and plan to adopt it ASAP over existing tools like
>> combo-layer. I therefore can't see much advantage of not merging the
>> class as people are going to use it regardless.
>>
>> Speaking of it, combo-layer was designed to be an alternative way of
>> dealing with these issues (more pain to use but causing less of a
>> quality impact). Sadly, whilst it has seen some improvements, it still
>> doesn't handle every operation it would need to make it work for some
>> users and isn't widely adopted. I simply don't have the time to go and
>> push it forward.
>>
>> So my objection is on record but that is likely about all I can do,
>> other than hope I'm overly paranoid...
>
> All points here are valid. We already see this with distro's which use
> layers verbatim e.g. angstrom
> I wish everyone derived their distros that way since that respects the
> layer boundaries, a good chunk of work
> there is still we send patches to layers to keep them up to date with
> changes in other layers and there still are patches
> pending since every layer maintainer doesnt respond in sam time frame,
> but this sort of facilities if added is just going to worsen that
> workload.
> I think amalgmation of layers start with use of combo-tool itself.
> This patch just takes it a step further. If we want to preserve
> the layer model's health we have to work towards respecting layer
> boundaries and I would even go a step further and suggest to
> discourage use of combo-tool or any sort of layer squashing.

I fully agree; in fact Poky itself is a bad example that I often have
to explain for vendors. People justify putting several layers together
in same repository saying that Poky does that and this is a
contradiction which we need to justify as Yocto Project promotes the
use of layers as one of most preeminent features but Poky does the
opposite ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

