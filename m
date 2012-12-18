Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Tkxg9-0000sj-CA
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 14:57:54 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 9F3ACD22E9; Tue, 18 Dec 2012 14:43:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4F7C3D22B4;
	Tue, 18 Dec 2012 14:41:52 +0100 (CET)
Message-ID: <50D0729C.2090703@linaro.org>
Date: Tue, 18 Dec 2012 14:41:48 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1355220771-32095-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<CADkTA4NLkvWThY4fzqzqDc5FO+U+CMJGEjOD9oJsLXDidfoapg@mail.gmail.com>
	<1355828839.18874.8.camel@ted>
	<CADkTA4Nwm2VxcAfrX7p0qy6CVYHMpH+WKbwv4Mr6BkGaJ3+WFw@mail.gmail.com>
In-Reply-To: <CADkTA4Nwm2VxcAfrX7p0qy6CVYHMpH+WKbwv4Mr6BkGaJ3+WFw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Add 3.7 version of linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 13:57:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 18.12.2012 14:32, Bruce Ashfield pisze:
> On Tue, Dec 18, 2012 at 6:07 AM, Richard Purdie On Tue, 2012-12-11 at
>> 05:52 -0500, Bruce Ashfield wrote:
>>> On Tue, Dec 11, 2012 at 5:12 AM, Marcin Juszkiewicz

>>> I would like to know are there plans to use 3.7 kernel for libc
>>> headers. This will allow me to drop own copy which I need to keep
>>> due to AArch64 stuff which got added in 3.7 cycle.

>> As I understand things we agreed that we'd not bump for point
>> releases on the headers unless there was some pressing reason too.
>> The rest of the policy for kernel headers is a bit more fuzzy.
>> 
>> For actual major version increments like this, I'm tempted to accept 
>> that in this case we have a good argument for updating to 3.7 and
>> even though the linux-yocto kernels will lag behind this for a
>> (short) while, it shouldn't make any real world difference to
>> anything, certainly not cause breakage.

> Right, they'll lag, but then jump and increment it to 3.8+. The dev
> kernel is already on 3.7 and currently building and working fine
> against the 3.4.x libc-headers.

I need 3.7 for AArch64 as this is first version which has support for it.

>> There isn't any technical reason we have to keep in lockstep, or any 
>> known issues with doing that with these versions, right? I know you
>> have been burnt in the past but that was quite a while ago and the 
>> kernel/toolchain communities have moved to address that?

> I've definitely been burt in the past, I admit to being a little
> nervous about 3.7 sideffects due to the uapi split in the kernel ..
> and right around the Holidays, I'm a bit more paranoid about bringing
> this in. I'd rather be full time at my keyboard, just in case
> something subtle breaks.

Remember that even when l-l-h 3.7 will be present in repo 3.4 can be
still used as default one.

> If we bring this in, I'd prefer to completely drop the 3.4 kernel 
> headers, since having just one recipe in the tree make sense, and it
> won't tempt us to start having a trail of one libc-header per kernel
> version (since there's always a layer somewhere that's using a given
> version).

> What about a middle ground ? I can pull this into my tree, since I'm
> doing some 3.8 and 3.4-stable work at the moment, I'll remove the 3.4
> kernel headers and then submit it again as part of my queue with some
> extra tests run ?

I am fine with it.


