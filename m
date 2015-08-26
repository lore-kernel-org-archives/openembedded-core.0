Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id EA72476DEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 17:57:13 +0000 (UTC)
Received: by ykfw73 with SMTP id w73so195023239ykf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 10:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fJKGtca1ASjUjhNs7M+mpXjnAOFIMHyQUUQBCwbO31s=;
	b=aov7J745s8/nKt0zXFUk2/058GZGvYuX0T+bN0LSrZbxhrmhDm4mBunuTtZTYf170v
	WQeXN668CYfm5zv4sI4mwkdVxtkVttpo1skbtwwPpal9B3Y4410ci431BD4skFGDUzfe
	rjFd+94J0q+q4hS3T4LrrA5xEWHeYGgh37eAdCAuVMRtKoM+obSFKtpRl+jWE9c1/Muq
	5nAusTruUajl6UtlfqErkqNUGyHWXOL9nTbGr2e2it0jBlqu4PS14yZTCyG580HYcrC1
	3wwwNJRw7+ls5mGxhFKzU0bGXtSH2c0dItyD+FXqr7N2m/J8hi+3ytnTvLEVh3QoY3Ql
	7rbA==
MIME-Version: 1.0
X-Received: by 10.129.130.134 with SMTP id s128mr22400101ywf.62.1440611833603; 
	Wed, 26 Aug 2015 10:57:13 -0700 (PDT)
Received: by 10.13.216.216 with HTTP; Wed, 26 Aug 2015 10:57:13 -0700 (PDT)
In-Reply-To: <20150826175547.GL8016@jcartwri.amer.corp.natinst.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<1438634128-4347-2-git-send-email-juro.bystricky@intel.com>
	<CADkTA4N6M5nnq9Y_eSKKdotUCNkPfpJBLuu5dZnwWSdszVgxuQ@mail.gmail.com>
	<20150826175547.GL8016@jcartwri.amer.corp.natinst.com>
Date: Wed, 26 Aug 2015 13:57:13 -0400
Message-ID: <CADkTA4P7-4VDttHEPPsmyhbzZNQj-r1AtkgZoe6b8X9u844LSg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josh Cartwright <joshc@ni.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel-headers: linux kernel headers
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
X-List-Received-Date: Wed, 26 Aug 2015 17:57:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 1:55 PM, Josh Cartwright <joshc@ni.com> wrote:
> Hey Bruce-
>
> (Just dug this up because it was relevant to a conversation in the
> office.)
>
> On Tue, Aug 04, 2015 at 11:20:11PM -0300, Bruce Ashfield wrote:
>> On Mon, Aug 3, 2015 at 5:35 PM, Juro Bystricky <juro.bystricky@intel.com> wrote:
>> > Header files and scripts for building modules for Linux kernel.
>> >
>> > A set of files is needed to allow building new Linux kernel modules
>> > against an already installed Linux kernel. The files include various
>> > header files, script files, Makefiles, source code files for several
>> > utility programs and Linux kerenl .config file.
>>
>> We already have our kernel devsrc packages. This is simply creating more
>> copies of the same functionality.
>
> The kernel-devsrc package contains much more than is explicitly required
> just to build external kernel modules (a full kernel source tree isn't
> required), and the kernel-dev package doesn't install enough.  Right
> now, there is no "just enough".
>
>> If you have issues with devsrc .. why aren't you fixing it ? It certainly
>> shouldn't be left as is, while introducing something new.
>
> I would expect this -headers package to contain a subset of what -devsrc
> is currently installing; might an option be to make the -devsrc package
> depend on this -headers package?

That's the rough plan. I'm looking into changing things this week, since I
was catching up on backlog all last week.

Bruce

>
>   Josh



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

