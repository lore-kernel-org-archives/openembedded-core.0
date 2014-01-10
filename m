Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0CE6028A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 04:54:03 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id e16so68185lan.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 20:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=G55DxftS+FULqxhao9HaJBOkNMj3nZ0522QmiPKKJ0c=;
	b=bNijqmjwnTBhYXDL3Dw1fwE+IjIyRrdZ1OeZd5TvWpfgSvrAWXZjsbFYorGYng6FFT
	PNyjuAI+oPw+pVVVg2kr6k+gxS4YH0qwTFPoxxdMZbKXuEyxjuCTqZjVUWHsW2q7lbwI
	SYuZgQOUTmJce1xxv8CrJx3ZgDk/QLjVD3gcan6SU9MSLf9Mbss+YUZNhHapR1+Hbe40
	X7pG4lfslNA1aJubIZNiH7BIwIcsif4NqTok0Vov0+Uxmg4X6JaWs9YOEY+cy8RURL4P
	U8PqLX6N+/3hme/91pR+UEjEWAMnpAjaaSz+Rs3c8JhXYVEDtSCKxsRIv32wr436kmEe
	pXMg==
MIME-Version: 1.0
X-Received: by 10.112.159.132 with SMTP id xc4mr2669952lbb.62.1389329643671;
	Thu, 09 Jan 2014 20:54:03 -0800 (PST)
Received: by 10.112.77.170 with HTTP; Thu, 9 Jan 2014 20:54:03 -0800 (PST)
In-Reply-To: <52CF2ED0.8090605@linaro.org>
References: <52CEEE43.1090209@linaro.org>
	<CADkTA4M+KG9uXtb91ANThgzMgOAb0WjiVmBvf48UszmSnX62dA@mail.gmail.com>
	<52CF2625.5030407@windriver.com> <52CF2ED0.8090605@linaro.org>
Date: Thu, 9 Jan 2014 23:54:03 -0500
Message-ID: <CADkTA4PPOLuEj8N+1w6N864g2HPyYBjK8Go+8P+iXKCcL=-oPA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: unmaintained layers
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
X-List-Received-Date: Fri, 10 Jan 2014 04:54:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 9, 2014 at 6:20 PM, Trevor Woerner
<trevor.woerner@linaro.org> wrote:
> On 01/09/14 17:43, Mark Hatle wrote:
>> On 1/9/14, 3:45 PM, Bruce Ashfield wrote:
>>> On Thu, Jan 9, 2014 at 1:45 PM, Trevor Woerner
>>> <trevor.woerner@linaro.org> wrote:
>>>> Hi everyone,
>>>>
>>>> At the last TSC meeting the topic of unmaintained layers came up. Here
>>>> is the sorted list of master layers from the layer index [1], would it
>>>> be possible for those in the know to indicate which layers are, or are
>>>> suspected of being, unmaintained?
>>>
>>> Wouldn't it be easier to do an initial sort based on commit activity
>>> ? Versus an
>>> opt-in query ?
>>
>> I agree..  see below for mine..
>
> To be honest, I had asked people to indicate which layers they thought
> were *un*maintained (since I assumed that list would be small), but this
> way works too.

It's always easier to get answers to a  question when presented with a clear
statement (like sending a patch, or a small list in the case), since
it is something
that people can quickly scan and react to ("Hey, they think my layer
is unmaintained!").

But agreed, either way works (say if they are maintained or not) and you'll get
the information, I just suspect you'll get it more quickly with a list
that makes
a clear statement and throws things into initial buckets on their behalf.

Cheers,

Bruce

>
> Interestingly enough, had I sorted the list on commit activity,
> according to http://git.yoctoproject.org/cgit/cgit.cgi/?s=idle
> meta-realtime hasn't been touched in 10 months which would make me
> suspect it was abandoned.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

