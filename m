Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 588D47FE3C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 12:08:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d16so7093590wre.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 04:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Iuy45zo/cIpwVhXcbC/XHfRO1AnyCysVVoCK5UUlOms=;
	b=OwK5Fz2gW6GmqBzeraTUhTzm+wLKUnK8R7cL5eUmssrNy/Lxza7xXoFd+uy8oyEY1I
	XnTHg1RTum7f9BbPHjeMTyoDTPTJV6ZVJ+FuSDDDuEBjt6Y64Vt7n8mg27zlqWayGVSt
	8vLsJNMAFKOX9eREAIFX9fovx45tsdLggJNBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Iuy45zo/cIpwVhXcbC/XHfRO1AnyCysVVoCK5UUlOms=;
	b=KXv3/Oqup/3RyS7t4wfXudm67ykB91w4Kt+vPlrnfVA0wFMIB27SVlAxcYoWgOjYtR
	RjhNqjw4t5/5Ez3ZC1yFMjjwQqM6fBcXbqffqrjaV7xDufM3QBixLQHLEvVCf22V45g0
	J3wH63GbdBZ59BJ1RjvaBAqyYE9hLxtapbQweeFAvxKvRIvXmC4qQWV4AqsQzYgrTg41
	b3tm85SEyaoI1zbSfH9JU8HYrYnPuP2SudkvEgN62wAutj9+mfuEvrD7tCqD5ZNPYDQE
	J5Pci5Z4oyE8yWj972ERDPuuMv0E4vLEpLlPnmOgvfyK+Qkq2/7PfmbowybuJnQhrLs7
	q7Eg==
X-Gm-Message-State: APjAAAV8mcOZXMwHj0My1sxX47nDqlem2E0hyKNw9Mo+j8YKolHTQVzJ
	3PUHghPhEUu5WY1qFWMupLeXWw==
X-Google-Smtp-Source: APXvYqwwabkwJY9QtPIwIQ3VADaYJifTOnvJ3vLha02dCwRw4ld7GIWiEAdo0LcVg8HJ3ZyfcmM7Bw==
X-Received: by 2002:adf:b605:: with SMTP id f5mr10235098wre.383.1578571738830; 
	Thu, 09 Jan 2020 04:08:58 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id x7sm7451347wrq.41.2020.01.09.04.08.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 04:08:57 -0800 (PST)
Message-ID: <a9e23045b333589e58bb1e771a508bd39a347dc6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pascal Huerst <pascal.huerst@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Jan 2020 12:08:56 +0000
In-Reply-To: <d7dbdb87-d763-2ae0-923f-d293d6c24d27@gmail.com>
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
	<f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
	<d7dbdb87-d763-2ae0-923f-d293d6c24d27@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Rich Persaud <persaur@gmail.com>
Subject: Re: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Thu, 09 Jan 2020 12:08:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-09 at 12:59 +0100, Pascal Huerst wrote:
> On 09/01/2020 11:51, Richard Purdie wrote> I did look at and think a bit
> about your patch. The trouble for me (as
> > the bitbake maintainer) is that:
> > 
> > a) it isn't clear/obvious from the variable name what it does (or even 
> >    from the code)
> > b) it adds yet more options to the fetcher which increases the test 
> >    matrix and possible ways things can break
> > c) the test doesn't actually test it does what its supposed to (no 
> >    check is made on which output is downloaded for a given revision)
> 
> I certainly wouldn't insist on the name and considered it a proposal,
> but you're right, it's not obvious at all. As for test-ability, I can
> relate to your concerns and understand that you don't want to maintain a
> corner-case like this - Which leads me to the conclusion that we should
> probably rethink our internal concept for release builds...
> 
> > Some of these can be fixed, some are much harder and I can't decide if
> > supporting this kind of edge case is going to be an overall good thing
> > for the project or not. I don't want to give you false hope by fixing
> > c) only to say "no".
> 
> Understandable.
> 
> > Add in Khem's valid concerns about reproducibility and it makes it a
> > tough one even to give feedback on.
> > 
> > If we have a ton of users saying "yes we really need this", that would
> > help but I haven't seen that as yet...
> 
> Fair enough.
> 
> Thanks for your thoughts!

FWIW I do want to see the system used to do things like this. I've kind
of envisaged you'd do it "up front" though. For example it should be
trivial for a script to use tinfoil, iterate through and generate an
include file of the revisions you want, using the fetcher calls.

Yes, its slightly more annoying to generate the config, then build it
but if it stops the core becoming unmaintainable with corner cases,
that could be the right decision.

If you do something like that it would be great to share it so others
can see what you did and be able to build off it...

Cheers,

Richard


