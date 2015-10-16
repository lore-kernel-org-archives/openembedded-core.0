Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8757777165
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:48:22 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so15975690igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=/KzXUt74gJYO/jE68V0q2JYrzkNcbTHFFeDQQVQ+PNE=;
	b=A9WHTsoKMCiwRghdfpPqpNHWjKh/SfSfqhxxUP0l3qkeRDHTY3zpi6ceC4vtO4ZmVx
	hxUiaBj+KUe3QuAemj2Rwd6H2VZxcBGcXSI2Ux7K1qhpHR3D28yFyLFfJ6MtB0VwwrHp
	zKBas4GONEobLJ5II0lHs9wQehbvFYo7V0ETY1W6ff2NQ479yacvQJb/t8UOGg5PuJbU
	mV9Vs2y7JUbSHeLlUbKjLbLMEZcPGaUzdmpPsXRVhZfbyiIRdKv2ViLutl50tNiVHEpE
	dg68oqmwNTR260q1P5zQXA+b1mYdZNq2pi5n8v6+qjf06FW4IEqnf6M7T36/+Lx8yEUB
	YD1Q==
X-Gm-Message-State: ALoCoQlyp6SfE+oHgWDAmPsb+GcWmBNaPCXxYgR5ufN+Hmx6RcW5y7oJ20FdXrtGB55T0hyJFhEW
X-Received: by 10.50.73.138 with SMTP id l10mr6632047igv.53.1445010502768;
	Fri, 16 Oct 2015 08:48:22 -0700 (PDT)
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com.
	[209.85.213.172])
	by smtp.gmail.com with ESMTPSA id c17sm8229428ioc.0.2015.10.16.08.48.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Oct 2015 08:48:21 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igdg1 with SMTP id g1so3808076igd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:48:20 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.77.104 with SMTP id r8mr5074561igw.19.1445010500674; Fri,
	16 Oct 2015 08:48:20 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 16 Oct 2015 08:48:20 -0700 (PDT)
In-Reply-To: <56211AC3.5020307@mlbassoc.com>
References: <1445005527-2384-1-git-send-email-adrian.ratiu@ni.com>
	<56210C4A.2090400@mlbassoc.com> <20151016144408.GB2544@jama>
	<5621160F.2020004@mlbassoc.com>
	<CAP9ODKobJGbJ+ASvNqQ7Td1a28fyqXrn2idBKjZ-NCZoxj9Vsw@mail.gmail.com>
	<56211AC3.5020307@mlbassoc.com>
Date: Fri, 16 Oct 2015 12:48:20 -0300
Message-ID: <CAP9ODKoLa6UzT-eko8y2sfYcOCWiFCY22bjSyhJ4HE8Mo3MqnQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x11vnc: move recipe to meta-oe
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
X-List-Received-Date: Fri, 16 Oct 2015 15:48:25 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 16, 2015 at 12:41 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2015-10-16 09:29, Otavio Salvador wrote:
>>
>> On Fri, Oct 16, 2015 at 12:21 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>>>
>>> On 2015-10-16 08:44, Martin Jansa wrote:
>>>>
>>>>
>>>> On Fri, Oct 16, 2015 at 08:40:10AM -0600, Gary Thomas wrote:
>>>>>
>>>>>
>>>>> On 2015-10-16 08:25, Ioan-Adrian Ratiu wrote:
>>>>>>
>>>>>>
>>>>>> x11vnc can be configured with --use-system-libvncserver to use an
>>>>>> external libvncserver which will be added to meta-oe. Since oe-core
>>>>>> should not depend on meta-oe, we move x11vnc there.
>>>>>>
>>>>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>>>>
>>>>>
>>>>>
>>>>> Just curious why not the other way - move libvncserver to OE-core?
>>>>> x11vnc seems like one of the very few [and useful] X based tools that
>>>>> are present in OE-core that it seems like a huge step backwards to
>>>>> move it out.
>>>>
>>>>
>>>>
>>>> It was discussed in "[OE-core] [oe] [meta-oe][PATCH v2] meta-oe:
>>>> recipes-graphics: add libvncserver recipe" thread and I agree with
>>>> Otavio that x11vnc doesn't look so fundamental component used by most
>>>> embedded builds to deserver being in the core.
>>>
>>>
>>> Well, I tend to disagree and I don't think there has really been a
>>> discussion - only one "no" (Otavio) and one "I don't know" (Paul).
>>
>>
>> The recipe being in meta-oe, can be used anyway. It is just out of
>> OE-Core.
>>
>> Anyway, what x11vnc has to provide to a core system? it even requires
>> X11 which a lot of embedded systems are moving away from...
>>
>
> Maybe for you, but not my customers - most of them insist on it.
>
> Yes, x11nvc in meta-oe is an answer, but I don't want to have to
> drag in meta-oe (way too heavy for my tastes) just to be able to
> use it (I use it all the time to debug customer systems that I only
> have remote access to)...
>
> Maybe we should abandon Python or GDB (server) from OE-core as they
> aren't used by all systems either??

Gary, I understand you use it a lot. Great.

But OE-Core should be trimmed, not extended. The recipes in OE-Core
ought to be used by a a lot of people or to provide a validation for
something.

Sorry but x11vnc does not provide either. If you don't want to bring
meta-oe, you can copy the recipe. But the size of meta-oe is not a
justification to keep something on OE-Core. Instead, it would be
better if you could help to split meta-oe more and it ultimately would
be smaller ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

