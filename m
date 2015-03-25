Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6D0876AC36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 13:26:27 +0000 (UTC)
Received: by lbbsy1 with SMTP id sy1so17418504lbb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 06:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OpCl5KpO4MZQjysa6fLj2z1gF5fsaDj5RCBiRbhSA9Y=;
	b=OzEIEWvKX/f12xQTAK9EEOwQS4UlJ34v/50IQwgY3ZJqPAO7q+MRYHqQg75V/eosSC
	SHWrt/9YIAOHi68KDmZ0s5Ew6tlkuOzk/3bs2QwpQ1hCTbwFsKjVNV8KiB6Ioaldo/n3
	EU0Du9klIZRg58zqApxTwmTQHczW2tsfpjaTTUScBLqh/++BPqMEYM30vl2G4GvvaeN4
	Dapqi/43pS7ec0+702iyUuFAyfQhQ66VkQpsjDWeGcfNeJF9/VrKlrh5xIHVc1McEwKW
	aIhpY6k7I/hgZt/Ac/h5gJSo8yuCqHWtU27H7e9SGwebXhVdTCSkHLcBbR8b2/Y7pD0M
	pI1w==
MIME-Version: 1.0
X-Received: by 10.112.50.38 with SMTP id z6mr8695951lbn.122.1427289987853;
	Wed, 25 Mar 2015 06:26:27 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Wed, 25 Mar 2015 06:26:27 -0700 (PDT)
In-Reply-To: <CADkTA4NKxxge6-vqyHka3PnEA9shUW3WHyWX-v4T9L2FDeyD0Q@mail.gmail.com>
References: <cover.1427222980.git.bruce.ashfield@windriver.com>
	<1427275585.14020.39.camel@linuxfoundation.org>
	<CADkTA4NKxxge6-vqyHka3PnEA9shUW3WHyWX-v4T9L2FDeyD0Q@mail.gmail.com>
Date: Wed, 25 Mar 2015 09:26:27 -0400
Message-ID: <CADkTA4M1TcH-FRStE8M9TREpnW0ZuxjBQW=s4H+GrjFKJoJtRg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 25 Mar 2015 13:26:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 25, 2015 at 8:13 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Mar 25, 2015 at 5:26 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2015-03-24 at 14:57 -0400, Bruce Ashfield wrote:
>>> Hi all,
>>>
>>> Here is the latest linux-yocto consolidated pull request. It is a mix of
>>> kernel version -stable imports (CVEs and fixes), kernel configuration
>>> changes, a documentation update and kernel configuration enhancement.
>>>
>>> The -stable updates are routine, and I build/boot tested them here
>>> (with my fixup commits being evidence). These are ready for a round of
>>> autobuilder/soak testing.
>>
>> Something in here broke lttng-modules causing cascades of failures on
>> the autobuilder so I've updated it to the latest code on the 2.6 stable
>> branch and am retesting.
>
> Gah. I built and booted here, but can't think of any reason why that didn't
> trigger and fail here.
>
> I've started my own build as well, with a completely clean starting point.

and sure enough, it blows up on my clean build.

If your update doesn't resolve this, ping me and I'll take care of the fix.

Bruce

>
> Bruce
>
>>
>> Cheers,
>>
>> Richard
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

