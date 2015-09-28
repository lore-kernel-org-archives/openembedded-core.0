Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 07DDF755F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 07:03:17 +0000 (UTC)
Received: by ioii196 with SMTP id i196so166112903ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 00:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gZ79+KR9DQHBYAiIBcgFH4VhlRy/aNkkcTd98Qq90WA=;
	b=HPgRyt368NyEjB5m1uCmifj2qZEe/lkmatNFKgaw6mBwTXidmEjxdBbc0ZS4qvem+u
	5Lg4KqfO1K7RP4IIimhLerps7HpymJWLMNhAQ7ebD9IG1cSDg9u0vDXJzT0GShYh02LK
	M/omrwV5daSK4HYbKXk18BMtd8rtlujkbAqP9vFg6kzHQbwFbybRq060xV1QX3DuOeQ8
	hYt3M2LANAwhMlZhvUT84kPRbQH5VHiixVQxSyU5fVWQVPeNaInde5WvOPgJCI/IZpe6
	AGCC9qTtp1XaTxBsB1lOIc8A3MDbyJtpI6E1HY4lQ0lMGPgoPR1mmE/eRoIeYgJiN3/4
	Y6ww==
X-Received: by 10.107.137.106 with SMTP id l103mr16632967iod.112.1443423797350;
	Mon, 28 Sep 2015 00:03:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Mon, 28 Sep 2015 00:02:47 -0700 (PDT)
In-Reply-To: <5608E404.9040107@pseudoterminal.org>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
	<1443390491-23728-2-git-send-email-dv@pseudoterminal.org>
	<CAMKF1srHAox4XZntPRCC-jzzZDwHtt46UC+ekahKE8s_YzXBpw@mail.gmail.com>
	<5608E1BA.2060301@pseudoterminal.org>
	<CAMKF1soj1rrFxCG1bQz=F7creT2KBd_SQUOQDXiRUSjq6NA7xA@mail.gmail.com>
	<5608E404.9040107@pseudoterminal.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Sep 2015 00:02:47 -0700
Message-ID: <CAMKF1spSN6h2Tyagqs3uuY2s1LMvrrZh5cWOqTqWYnV6xvMtmQ@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] gstreamer1.0-plugins-base: upgrade to version 1.6.0
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
X-List-Received-Date: Mon, 28 Sep 2015 07:03:18 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 27, 2015 at 11:53 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> Am 2015-09-28 um 08:47 schrieb Khem Raj:
>>
>> On Sun, Sep 27, 2015 at 11:44 PM, Carlos Rafael Giani
>> <dv@pseudoterminal.org> wrote:
>>>
>>> The other patches in the list above, however, need to be reworked to
>>> apply
>>> against 1.6.
>>> 0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch has been
>>> rejected by upstream,
>>> handle-audio-video-decoder-error.patch is under discussion.
>>> taglist-not-send-to-down-stream-if-all-the-frame-cor.patch hasn't been
>>> looked at yet by upstream.
>>>
>>> Since these no longer apply cleanly against 1.6.0, we anyway have no
>>> option
>>> but to delete them and wait until the authors reworked them.
>>
>> hmmm, I would have preferred a conclusive situation where we know
>> exactly what they fixed and what we dont have when we drop them
>> somewhere in commit message, ideally they should be forward ported
>> along with recipe upgrades but its ok if you dont feel comfortable and
>> want to defer it to original submitters but then please CC the
>> submitters so they know whats needed of them
>
>
> Yep, I already sent them a mail about the necessary rework a month ago, when
> I was first trying out release candidates for 1.6, but I'll give them a
> status update.
>
> As for the patch that got rejected by upstream (but that I didn't delete,
> because it can still be applied), do I delete this one as well? Is there a
> general preference in such situations? I personally would prefer to stick
> with what upstream does.

yes, however sometimes it might be OE issue that upstream might not
share in such cases you have to carry rejected patches. Ideally the
problem should be explained better to upstream and amicable patch
found to fix it but that may not happen always

