Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <seba.dos1@gmail.com>) id 1QyhML-0003E8-Hh
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 11:45:25 +0200
Received: by qwh5 with SMTP id 5so262291qwh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=HZ1MIcL7RZks3lx3AAr3GDADF7/4yKv//92EmbCFeec=;
	b=ClXtP2e0jsWBfafUhT91Ae5lhCJhitpNc/gphenq6lmmjVxs6JCR458YLlYfriAaS8
	8FhzEzBVEd+rk8xEKdEVqhr4YteKdwXe8Q6fCzt0iuygqdbdvEp2AeYLLA08aaoGqdII
	nMHN5isZnLrX9k0mHXIA2MN9pCY7GxAtF/+A0=
MIME-Version: 1.0
Received: by 10.229.37.149 with SMTP id x21mr125961qcd.126.1314783630515; Wed,
	31 Aug 2011 02:40:30 -0700 (PDT)
Sender: seba.dos1@gmail.com
Received: by 10.229.232.207 with HTTP; Wed, 31 Aug 2011 02:40:30 -0700 (PDT)
In-Reply-To: <1314747825.5939.449.camel@rex>
References: <1314738793.5939.427.camel@rex> <4E5D605E.3030303@hs-augsburg.de>
	<CAMkzfpaQEHWQaDt_JGZ9J6dYK40gu6W4RM9hMOcQc+5didPuSw@mail.gmail.com>
	<1314747825.5939.449.camel@rex>
Date: Wed, 31 Aug 2011 11:40:30 +0200
X-Google-Sender-Auth: carABA0aoL6ZZgiVGtrVXm2Z4Xo
Message-ID: <CAMkzfpYUh0dEy9BtEoNqAkAHF+tWaC9ZPnCLnAkCMdZ-dOk0Hw@mail.gmail.com>
From: Sebastian Krzyszkowiak <dos@dosowisko.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: upgrade from 7.3 to 7.3a
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
X-List-Received-Date: Wed, 31 Aug 2011 09:45:25 -0000
Content-Type: text/plain; charset=UTF-8

On 8/31/11, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-08-31 at 00:18 +0200, Sebastian Krzyszkowiak wrote:
>> On 8/31/11, Michael Morscher <michael.morscher@hs-augsburg.de> wrote:
>> > Hey,
>> >
>> > Thanks for the recent patch, but the patches need another handwork:
>>
>> Whoops... I wasn't able to test it
>
> You're posting patches with no testing?!
>
> I'd warn people that if this happens I'll be regarding any future
> patches with suitable caution. If you're going to post something with no
> testing, at least please say so...

I've tested fetching (as that's what that patch was fixing - old
version was unfetchable at all). Well, when I think about it now, I
could test do_patch without dependencies as well, but unfortunately
that didn't came to my mind before :(

-- 
Sebastian Krzyszkowiak
dos


