Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TkvFV-0005XW-BR for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 12:22:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBIB7TFE026189;
	Tue, 18 Dec 2012 11:07:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21348-03; Tue, 18 Dec 2012 11:07:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBIB7JEP026183
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 18 Dec 2012 11:07:20 GMT
Message-ID: <1355828839.18874.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Dec 2012 11:07:19 +0000
In-Reply-To: <CADkTA4NLkvWThY4fzqzqDc5FO+U+CMJGEjOD9oJsLXDidfoapg@mail.gmail.com>
References: <1355220771-32095-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<CADkTA4NLkvWThY4fzqzqDc5FO+U+CMJGEjOD9oJsLXDidfoapg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches, discussions about the oe-core layer
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
X-List-Received-Date: Tue, 18 Dec 2012 11:22:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-12-11 at 05:52 -0500, Bruce Ashfield wrote:
> On Tue, Dec 11, 2012 at 5:12 AM, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>         I would like to know are there plans to use 3.7 kernel for
>         libc headers.
>         This will allow me to drop own copy which I need to keep due
>         to AArch64
>         stuff which got added in 3.7 cycle.
>
> There aren't any plans to use 3.7 for the headers, since we are
> tracking the headers
> with the same cadence as the yocto release kernels. Otherwise, we'd
> really need 
> to have all versions available, and keeping things clean and focussed
> was the
> goal.
>
> 3.8 is the next likely update.
>
> That being said,  since the libc-headers version is controlled by the
> LINUXLIBCVERSION in tcmode-default.inc, simply having 3.7 headers
> available shouldn't cause any problems or disconnects. 
>
> So we can open up the discussion if we want to carry extra libc
> headers or
> keep with the current strategy. I've added Richard explicitly to the
> cc' so he
> can jump in as appropriate.
> 
As I understand things we agreed that we'd not bump for point releases
on the headers unless there was some pressing reason too. The rest of
the policy for kernel headers is a bit more fuzzy.

For actual major version increments like this, I'm tempted to accept
that in this case we have a good argument for updating to 3.7 and even
though the linux-yocto kernels will lag behind this for a (short) while,
it shouldn't make any real world difference to anything, certainly not
cause breakage.

There isn't any technical reason we have to keep in lockstep, or any
known issues with doing that with these versions, right? I know you have
been burnt in the past but that was quite a while ago and the
kernel/toolchain communities have moved to address that?

Cheers,

Richard





