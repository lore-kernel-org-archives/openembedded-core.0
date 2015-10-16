Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id CFE1E770A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:29:55 +0000 (UTC)
Received: by ioii196 with SMTP id i196so127084536ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=gO2WJ3mJ3StvcmbvOdU+BFl0kN0zpiCSDzK6+o2NkIA=;
	b=b2FkpaizFu/O2d5hB77GVGRsIsL8t44amdLgQ6espeBf4sLncInIYoS1FVIoBw57fP
	woLKYz0Ii1vtB/+ZDitNGdFSYJtaci5+tC3tOyq9LQvROa0LoIccwAHbgYoH5XlM/whE
	GS0egrxHT6e4smjvQQ8yi+YUL7nw3NEV0z8xAlkEUj7Tue9MWjd6nrJ/bmpbsz1zETfU
	Q2GMUwlcTCfWrqZVmYGj51sx4hOCWXV87/pcQf6ODNGM8amZ5pnFOlTcN0TkI7/Uz5DN
	+6hWeARo9HZs+Hbz9iUYbN8lRZKKpY/+QJG8DQMwvRBayRbApMHSdbaI28a7MO0bDKvv
	8uxQ==
X-Gm-Message-State: ALoCoQng0Hq+ZtekQFZ0NNxDNCCbMkEcSuo2jQeGPw93jtsI7f7B4Ga7yLfv9yfeCAH+IH58k4y7
X-Received: by 10.107.16.90 with SMTP id y87mr14619264ioi.183.1445009395811;
	Fri, 16 Oct 2015 08:29:55 -0700 (PDT)
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com.
	[209.85.213.173])
	by smtp.gmail.com with ESMTPSA id o9sm2067653igh.5.2015.10.16.08.29.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Oct 2015 08:29:54 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbdj2 with SMTP id dj2so16409142igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:29:54 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.29.6 with SMTP id f6mr4175513igh.46.1445009394513; Fri,
	16 Oct 2015 08:29:54 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 16 Oct 2015 08:29:54 -0700 (PDT)
In-Reply-To: <5621160F.2020004@mlbassoc.com>
References: <1445005527-2384-1-git-send-email-adrian.ratiu@ni.com>
	<56210C4A.2090400@mlbassoc.com> <20151016144408.GB2544@jama>
	<5621160F.2020004@mlbassoc.com>
Date: Fri, 16 Oct 2015 12:29:54 -0300
Message-ID: <CAP9ODKobJGbJ+ASvNqQ7Td1a28fyqXrn2idBKjZ-NCZoxj9Vsw@mail.gmail.com>
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
X-List-Received-Date: Fri, 16 Oct 2015 15:29:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 16, 2015 at 12:21 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2015-10-16 08:44, Martin Jansa wrote:
>>
>> On Fri, Oct 16, 2015 at 08:40:10AM -0600, Gary Thomas wrote:
>>>
>>> On 2015-10-16 08:25, Ioan-Adrian Ratiu wrote:
>>>>
>>>> x11vnc can be configured with --use-system-libvncserver to use an
>>>> external libvncserver which will be added to meta-oe. Since oe-core
>>>> should not depend on meta-oe, we move x11vnc there.
>>>>
>>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>>
>>>
>>> Just curious why not the other way - move libvncserver to OE-core?
>>> x11vnc seems like one of the very few [and useful] X based tools that
>>> are present in OE-core that it seems like a huge step backwards to
>>> move it out.
>>
>>
>> It was discussed in "[OE-core] [oe] [meta-oe][PATCH v2] meta-oe:
>> recipes-graphics: add libvncserver recipe" thread and I agree with
>> Otavio that x11vnc doesn't look so fundamental component used by most
>> embedded builds to deserver being in the core.
>
> Well, I tend to disagree and I don't think there has really been a
> discussion - only one "no" (Otavio) and one "I don't know" (Paul).

The recipe being in meta-oe, can be used anyway. It is just out of OE-Core.

Anyway, what x11vnc has to provide to a core system? it even requires
X11 which a lot of embedded systems are moving away from...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

