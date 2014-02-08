Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6556E951
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2014 21:56:28 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id fa1so4613718pad.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2014 13:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:content-type;
	bh=cYzvXnqOIVUtMjwMW3l6h1z6FSJ0tb8kP0JLxKgCBMo=;
	b=ffQJ1GlhvAKFCaqpoKyGXgvXpPVlztTedzqKe/Is48IPNolgRKqMSIanizQWXbc7w0
	k0lwTnDKug6LtBCMvS11y7+/WBsP/Jpke53NKiZRqPRbYX4UkZR6BayseesA2Nr3dHNb
	KfXZ675aQACKuspq3BNCcVkd/TNh/2u/qpx0KpQB9jTvDTBSz+LEHDvRzYzECm8oH4t4
	SkNIazphgAiq+926+0QdvN8Qvp6UP+kDeuU7lEQ7J91H2j0kcO9nFsVV6OH0K5RdlSQp
	o7LFIOxMwvuOWSLZv5K7rfx4NOSsJAIVV2DreY4AHTGtt+0ecbB9a0Bg/u4DBwiHVpqi
	fIPQ==
X-Gm-Message-State: ALoCoQm2plCInTypuToK9Uwp8XGJF5ccg2tF3tixVg8rKlI6RNMOXzFv+/Lqs5X3IGt7y7RfGCBq
MIME-Version: 1.0
X-Received: by 10.66.179.143 with SMTP id dg15mr16449929pac.52.1391896588742; 
	Sat, 08 Feb 2014 13:56:28 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Sat, 8 Feb 2014 13:56:28 -0800 (PST)
Date: Sat, 8 Feb 2014 21:56:28 +0000
X-Google-Sender-Auth: 8y3xVBUg6ufKNhly9rfIFrB_FTA
Message-ID: <CAOMwXhPDaK9NMx7z5Mgady7d4t1AA7dJVikC9w72r_EC3xbqgQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Patch workflow [was: meta/recipes-core/base-passwd/base-passwd/noshadow.patch: Split it into two parts]
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
X-List-Received-Date: Sat, 08 Feb 2014 21:56:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 8, 2014 at 12:20 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2014-02-08 at 12:07 +0000, Laszlo Papp wrote:
>> Why is it a nightmare? For instance, maintainers in other projects
>> leave a "Pushed, thanks" note.
>>
>> See how much discussion this generates already, instead of two words.
>> While you are at the change to merge it, you are already in place to
>> leave the comment. However, contributors need to go and find the
>> corresponding url, etc. Please note that contributors may want to know
>> whether their voluntary work got merged without even a checkout, for
>> instance double checking from mobile, etc.
>>
>> ... or is the real problem the lack of maintainer man power?
>
> Its both a man power problem and the process isn't as simple as
> described.
>
> The changes get batched together into large units, those get tested on
> the autobuilder. If they work out ok, the changes go in, if they fail,
> we pull out patches until we get a successful batch, then merge.
>
> Upon failures, we do aim to mention those on list. Having to go back
> through emails to find the ones which merge and "ack" them is a pain
> though since we are "not already in place" as you put it.

Hmm, that is unfortunate, and practically speaking: having contributed
to several projects, it is also a bit outstanding. It feels like the
tools do not do the ideal job.

> There are only two people in general who do this on OE-Core, myself and
> Saul. We do have a ton of other pressures on our time, we do the best we
> can. If someone wants to ack patches that merge I'm happy for them to do
> so, it would be just as much work for them as it would for me/Saul.
>
> I am aware there are patch management tools out there which can show
> status of patches. We've looked hard at them and in general they impose
> more overhead and process onto people who don't want it.

OK, can you please elaborate about the drawback of e.g. Gerrit?

I was told before that it would not have the feature of off-line
reading while flying on an airplane. Is this really such a common
scenario for Yocto maintainers, or there are other reasons? I would
imagine managers travel a lot more than maintainers. :-)

Have you (Intel, Linux Foundation, etc) considered improving the existing tools?

