Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id E89CC6E3AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 13:39:01 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id z10so2600221pdj.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 05:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=fKZU4lRTzkJjYErxm41opwDWJweAnRM60xK95o6p1Qw=;
	b=kZmIPMY6+jXd9KdIIP6fClEuBseeXeGr6u+DBT/VgO4eEoRe4GunElnGVtWFTHXdvn
	i9EC7fy2LFDDBajWWKko+1l6dGrSF5hrmau6LssNDDA8uRkFLv6XJoejz5wxyemyer+R
	ypLxJGgcykiqcVM+SQamM1hl23eZV6TtWew1XrvAXhHrhoriIoAWTyTKTAvD/Iq1khRg
	5Ry5i4e6Fs15gsOqtByyOU6MdeNhecHGG8c2uWz1qRgMXitYMJcCPx2FAkX58rfMX9bE
	F9CsuGq6BdHFiaK5hdxx5iT7yaLisvbbyGurbl0Gt56Qs3GfTEPQ319rnfdKq5dvW4v3
	DBow==
X-Gm-Message-State: ALoCoQmSODr5MnXcW4umTMaykItousJsg6ISnzrZpLaE0Hk3uXvN29fiaXg5GsyDbs91liU0meXe
MIME-Version: 1.0
X-Received: by 10.66.4.130 with SMTP id k2mr9953015pak.95.1389879542891; Thu,
	16 Jan 2014 05:39:02 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.22.3 with HTTP; Thu, 16 Jan 2014 05:39:02 -0800 (PST)
In-Reply-To: <CAOMwXhNqTUpR6EutkNF0Co8Lbz90NpWd7RK=ekbZ4xu9BcEW0g@mail.gmail.com>
References: <1387889050-25592-1-git-send-email-lpapp@kde.org>
	<CAOMwXhOfJEkntBTQLDGWjRYA6jorCWNEUF1+t8n5RJJoozcVJA@mail.gmail.com>
	<52CB29BA.5050404@linux.intel.com>
	<EB17154F-A59B-4283-8F03-FC8DEFDC8285@dominion.thruhere.net>
	<CAOMwXhNqTUpR6EutkNF0Co8Lbz90NpWd7RK=ekbZ4xu9BcEW0g@mail.gmail.com>
Date: Thu, 16 Jan 2014 13:39:02 +0000
X-Google-Sender-Auth: 3WfoGu9WbBzzUreQ3XlJSEOaUGI
Message-ID: <CAOMwXhO0Gpg-fuZ9kzha=Gw8FO9HQm-aNROh1wMWb5woo1iF9Q@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/patch.py: Prefer "git am" over "git apply" when applying git patches
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
X-List-Received-Date: Thu, 16 Jan 2014 13:39:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi everyone,

the patch was sent about three weeks ago, and I have not seen any
objections so far.

What is the issue for progressing? Please let me know.

Cheers, L.

On Thu, Jan 9, 2014 at 4:53 PM, Laszlo Papp <lpapp@kde.org> wrote:
> On Tue, Jan 7, 2014 at 12:16 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>
>> Op 6 jan. 2014, om 23:10 heeft Saul Wold <sgw@linux.intel.com> het volgende geschreven:
>>
>>> On 12/31/2013 06:18 AM, Laszlo Papp wrote:
>>>> Ping?
>>>>
>>>> Alternatively, the system could also have an option for further
>>>> fine-tuning what to do with git patches
>>>>
>>>> On Tue, Dec 24, 2013 at 12:44 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>>>> It is better to use "git am" when possible to preserve the commit messages and
>>>>> the mail format in general for patches when those are present. A typical use
>>>>> case is when developers would like to keep the changes on top of the latest
>>>>> upstream, and they may occasionally need to rebase. This is not possible with
>>>>> "git diff" and "diff" generated patches.
>>>>>
>>>>> Since this is not always the case, the fallback would be the "git apply"
>>>>> operation which is currently available.
>>>>>
>>> Looking at this, is it possible to detect a git patch and only then use git am?  Since most of the patches carried in oe-core and other layers the 'git am' will typically fail
>>
>> All the patches I add are git am'able since I use a patch similar to this :)
>
> Cool.
>
>> A big timesaver is to check for  a .git/ in $WORKDIR otherwise git am will try to use a top level git tree (e.g. combo repo) and that's not what we want.
>
> Hmm, yeah, I agree.
>
> However, I do not have time currently for this, nor is this
> high-priority for me since it just works for me, and I am happy with
> that. Would it be possible to optimize it later?
>
> Failing that, what is the best practice to keep my changes separate
> from Yocto? I am referring to changes that are not upstreamed for
> whatever reason, like the maintainer saying that here it could be a
> performance regression (although non-measured at this point).
>
> Cheers ...

