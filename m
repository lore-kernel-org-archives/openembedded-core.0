Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id 588D46D5A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:25:35 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id x11so2933440vbb.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 08:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=SW3BHeWrl9obW91UIKbyUCjhR1Z1wHRogh6KtDl7T3k=;
	b=uXChYcqRxQnWJy0+nPOxKF0ujAZ6L6jbqJfNSbY5UJT7aI1ePUS1vHyNpvApLSraK4
	u5EKcA/A5Drl6e3fsLs8SU07nbVkqbO6cvQekvCCFmF2J5SZC50XWH9BCVwJV3GMvKVo
	i5LSeleC0w6LzF1Rg35ksr6vTMmQgdhFtgxvZAkQPm6ghnfGFoIMY4QhmlPhAq4P63aY
	vXZAC4n5I9Xi6GyZOvCschv//W2W8qMxBE05UzFNom6I5O8aUXWlYCWzLMVj5IhrVUhi
	NPJ28KgoU3AShbPYXwRMFyR3jHEfiajjeclf6Wra5To9rCHHWNtOsZt1pgP5a89eSCXn
	7obA==
X-Received: by 10.52.230.102 with SMTP id sx6mr886231vdc.15.1384964736891;
	Wed, 20 Nov 2013 08:25:36 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.49.71 with HTTP; Wed, 20 Nov 2013 08:24:56 -0800 (PST)
In-Reply-To: <20131118162014.GH3727@jama>
References: <CANyK_8c67C4NL7mNf3LTDwurtfpeU+S5ts4+O2t+HiDv84YgaQ@mail.gmail.com>
	<52898177.5000303@windriver.com> <20131118114000.GB3727@jama>
	<1384775852.6460.214.camel@ted>
	<CANyK_8eR05HauKBOd3AoTMjibYBgZEhBSv5pN5Yt_+s2CavsNA@mail.gmail.com>
	<20131118162014.GH3727@jama>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 20 Nov 2013 16:24:56 +0000
X-Google-Sender-Auth: YClonGeD_FkAPRCePt0MkI7Lmrg
Message-ID: <CANyK_8eftL8mQWsB5BZx3U5A0KF1wrWhUrBqTimys5ogA=pdhw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg dependencies and update-alternatives
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
X-List-Received-Date: Wed, 20 Nov 2013 16:25:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 November 2013 16:20, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Nov 18, 2013 at 03:31:09PM +0000, Paul Barker wrote:
>> On 18 November 2013 11:57, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > Paul: Have you any opinion of moving update-alternatives to its own
>> > repository separate from opkg? or just check it into OE-Core as its just
>> > a single script? Its not as if it really needs much from opkg at this
>> > point?
>>
>> I'd be quite happy to break it out into a separate repo. I think
>> that's better than direct inclusion into oe-core so that it remains
>> easily usable by non-oe systems.
>
> What about including it in opkg-utils repo? And maybe even providing u-a
> by opkg-utils.bb?
>
> opkg-utils.bb doesn't have any DEPENDS (Only python RDEPENDS) so it
> would be good compromise between opkg and completely new recipe.
>

I think this is the most sensible option. If u-a is put into a
separate package it shouldn't need any RDEPENDS either.

I'll send in the patches I have for oe-core, they'll need a little
more testing before they're ready to be pushed to the mainline though.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

