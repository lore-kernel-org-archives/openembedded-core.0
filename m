Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2A7E965FEC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 15:02:04 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id fp1so1416916pdb.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 08:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=yWwxtwvgCGR9kpmL/AZeuotKR9OBoB5HgVmhElaFm4s=;
	b=BBc3NL85id8yV8r2EBtu7/NaXz59b7JjI0qZXPaJsNRl+EvxhmM+9a/vxuDQjGNiCm
	ij0zW/slBPyb2TxmymZroZwDOzhouqcFMAZpUKq93mE3ZIkh0t0EzbD7ClZJUSOKhaf+
	m7XC2z848QKAJBxAIo4cizE8O18Ft3r8jlwzsRIoArQSJddX6//4gLr8cvjI80YJj+0n
	o66vWeVjD0sGDWFIK6dGf5JihRAZNqHBR1XqcWMj71NGaXICkeMcQFEanhNNAtq1EWgo
	7eE8z69NSzV2tqGRsacMJ6SH9IG0s8xN8xAPa/KTmC/N5GiFmwxvYcQ7/rKINy4c75PU
	dz/Q==
X-Gm-Message-State: ALoCoQnimP+cjx1FHiOjnVErykrBvWnfPgNQAQNISn7NFkF3QeYYRP3nOBr/Y/Gwys14e6jBvmaw
MIME-Version: 1.0
X-Received: by 10.66.222.74 with SMTP id qk10mr58100808pac.70.1410274925765;
	Tue, 09 Sep 2014 08:02:05 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.65.69 with HTTP; Tue, 9 Sep 2014 08:02:05 -0700 (PDT)
In-Reply-To: <CAGNsrLCzz-9h9kD5f7jUWuC+qFVyOhrp5gTDMAZ6TWyLc9Cj-Q@mail.gmail.com>
References: <1408720803-11737-1-git-send-email-lpapp@kde.org>
	<5400C6A5.6040001@linux.intel.com>
	<CAOMwXhPptiMrE7_VNi1rLtv0qzVf=0CHSJ5nn=dTi8GxBtFtHQ@mail.gmail.com>
	<CAOMwXhP+A40Kcb-KcgCh8rh-oNXh-9DjyBJ4hAunJ7Q7_i8VUA@mail.gmail.com>
	<CAP9ODKqCq4FZj920GW1ztu_r73MgKuiTfZtThbfZKi2710_BGg@mail.gmail.com>
	<CAGNsrLCzz-9h9kD5f7jUWuC+qFVyOhrp5gTDMAZ6TWyLc9Cj-Q@mail.gmail.com>
Date: Tue, 9 Sep 2014 16:02:05 +0100
X-Google-Sender-Auth: D9QvIMcspH6lLttWzyFNJKclOz0
Message-ID: <CAOMwXhPbq8NBdMkDC1QkibxJLUrhSnq=Umgp30CY5ZJGjm_GfQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add support for ccache builds with the SDK
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
X-List-Received-Date: Tue, 09 Sep 2014 15:02:05 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 2, 2014 at 7:22 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> On 1 September 2014 21:04, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Laszlo,
>>
>> On Mon, Sep 1, 2014 at 2:47 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>> Just in case the severity is not clear. Without this change, the Yocto
>>> SDK breaks the build for our software since we do prefer to use ccache
>>> for speeding the build process up. We are probably not alone with that
>>> ...
>>
>> Saul request is very valid. He is asking you to conform to the commit
>> guidelines we use and it is no-sense you to expect that he or someone
>> else does this for you.
>>
>> So I think if you expect this to be merged you need to fix and send a v2.
>
> fwiw, we've been hit by this maintainers behavior. Several patches are
> stuck in the queue after 10 days of non-activity, followed up by a
> nitpick comment.
> It's a source of frustration for the submitter and is killing his
> motivation. Such comment could come earlier, while he's in the heat of
> the action and he's usually more receptive to the review.
>
> As a result, we lose a contribution. The
> project/maintainer/submitter/end-user doesn't benefit from the
> contribution.
>
> my 2cts.

Thanks for trying to get things done, Fathi. I appreciate it. I also
understand what Richard was writing that they are busy. Sure, I am
very busy, too, but not helping others to get involved easily will
leave more burden on them in the long run, sadly.

This is not the first time that I have to follow changes for
relatively long time, and the patch in the end does not get in, even
when it fails build failures for end users, like this one.

The last long bikeshed was around the busybox-ntp. Since I keep
patching our Yocto fork, I thought after a while, let us give it a try
again with a simple thing, and it went as far as this, only after
follow-ups 1-2 weeks later.

It is probably needless to say, but I feel personally very difficult
to get involved in the Yocto project and I am not saying it because
there are cosmetic changes with my patches. That is a good level if it
is just cosmetic in a newcomer's patch anyway?

I am just trying to write that as someone who is working for a very
small company, I do not have time for all superfluous perfectionism
this project tries to follow. I appreciate, but I cannot cope with it.
My highest responsibility is to get things done and ship products.
That does not include cosmetic nitpicking in a small company. It might
be OK for Google, Intel, Linux Foundation, etc, but this is simply not
any priority when you need to work on getting proper income for your
family.

Why I am personally a little bit frustrated unfortunately it is not
because things like this happen, but that it happens in a row. The
Yocto users are still screwed for using ntp properly with busybox.
That change also went to /dev/null due to some irrelevant thing. What
is worse, someone even wrote me in person that it is a shame it did
not get in since that person would have also needed the feature.

As far as I am concerned, the Yocto project contribution is currently
unsuitable for small companies and individuals whose highest
responsibility is to get income, i.e. caring about sustainable
features rather than nitpicks. I have been on both sides, and I can
understand when someone is maximalist. It is very difficult to
understand others in the state of mind; been there, done that.

Anyway, I have a relatively long list of unintegrated features into
Yocto by now, but this is not quite good that they are going on their
own way in a fork rather than going in. As it was written in this
thread, it is quite demotivating to see such nitpicks after 1-2 weeks,
and then long discussions about who is doing what. I can assure you
that if I had not had several changes rejected due to such nitpicks, I
would have already fixed this one, but in this case, I am not doing
them anymore since I do not see any willingness from the Yocto
community to try to help me with getting things easily in.

