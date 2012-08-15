Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T1jD6-0006h0-0D
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 21:24:56 +0200
Received: by lagv3 with SMTP id v3so957453lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 12:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=7s6H+6H13FC2e1ZSOU2BIrc8Pb6TkLvJTSJFrbwUdPY=;
	b=FiIxZpxJkBnt7wi7J2CsZHjnW++1OZYCJJCptpTolfohpvUoGtnJ+IjR0eOV73hOba
	Su4ed/sfv5OOGvMreqWv09O4dE71BrXSgrcyIFseGsENQEbk57GCAq7CZIA1kG5vEb+Q
	uQHQB2SBD22eQLQV8HRf8qVVtAXmZTDYAn7giet3rszDiKj8B1pbWJ3PKPMs0sYbn/7+
	OBWM+ApGDi0siht64g2EdcjGygLwTUqiEL9xEVOJXZLFdnM2XxlivbqRbfrAjdnti85Q
	aDTAHUXJ7/QIJuaR8yHNt+W7D8SO1QpBkr/79bwFC+jrk7eMyuF15NjmJPAX9mYQdK2c
	hOng==
Received: by 10.112.43.67 with SMTP id u3mr9961536lbl.16.1345057979693; Wed,
	15 Aug 2012 12:12:59 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.5.104 with HTTP; Wed, 15 Aug 2012 12:12:39 -0700 (PDT)
In-Reply-To: <502BE4F2.9080305@windriver.com>
References: <2404459.dJBf5OQotX@helios>
	<1345029924.23275.444.camel@phil-desktop>
	<4456392.mCXMPqtakO@helios> <502BE4F2.9080305@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 15 Aug 2012 12:12:39 -0700
X-Google-Sender-Auth: VtMEq5p9vTsiVhUGEHxzEbWfKP4
Message-ID: <CABcZANnh2HzOrmeRr49BT7GXh47oUqTRHYfi1W-pk=OoO5mD+A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: OE-Core task rework
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
X-List-Received-Date: Wed, 15 Aug 2012 19:24:56 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 15, 2012 at 11:05 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>   * The tasks can be used and referred to on the target if desired, not
>> just
>> when you compose the image (i.e. task packages are produced and thus the
>> package manager knows about them).
>
>
> I think this is a key advantage.  Again, if we think of these tasks as
> logical groups of functionality, it gives an image developer (or installer)
> the ability to say "I need booting, discrete commands, python, perl, and LSB
> compliance." and get a system in the end that -should- work.
>
> The image/installer should always be able to specify individual recipes as
> well, but often inexperienced users won't know that they need two or three
> recipes (that don't have actual dependencies on each other) to get a
> functionally complete answer.

It seems like you're arguing in favor of the ability to add groups of
packages to an image, which no one disagrees with, and isn't really
relevant to the bit you're quoting. The bit that tasks add that
package groups / image features don't is the ability to add them after
the fact at runtime, not image creation time.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


