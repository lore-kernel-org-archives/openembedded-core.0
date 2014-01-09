Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id C018260172
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 16:53:07 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id v10so3416510pde.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 08:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=b2pTLcVA7Z7/HPBPVrOzvuKv/a59N7z2z34kso33Fp0=;
	b=SyZ2Mv+bZXlX/K9VQuSXrnm9D66eBAA2Y7+6MlKAGiSwL9aJARfy35tvnSFxM588e0
	IzhUTWheGyuJ+lk1vH74gVQZlVO1Fk5JGo+CQr0p4hORoI/mPOJbhO8/LZ2DauQhJy6B
	DFkPAfznygSFYX5+tN/EUhxDSzsEAJkI1QWNxWI74gMb20THMGJcKcvLMOjnta5YAEXJ
	IimVbG7Nf7Zr97zWPV0jPk1f2BrMha1OhQ+BxeKD69DvaSfaPNE7AL9UR9GCzYdENV6w
	FA8sS9u+PaVVMGVBLZsQ25TeeNXMJov3s314+bF1hyyYAfpPcrGBVe//5wamOB8OYcBG
	Ug8w==
X-Gm-Message-State: ALoCoQnuvKV03ufXBbB/PHvljkqUxWEW/b9FQzfhvA+J6FIPvhytjNotLMq7N0KRNCaz3wyRfz6e
MIME-Version: 1.0
X-Received: by 10.68.233.166 with SMTP id tx6mr4761347pbc.165.1389286389033;
	Thu, 09 Jan 2014 08:53:09 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.84.67 with HTTP; Thu, 9 Jan 2014 08:53:08 -0800 (PST)
In-Reply-To: <EB17154F-A59B-4283-8F03-FC8DEFDC8285@dominion.thruhere.net>
References: <1387889050-25592-1-git-send-email-lpapp@kde.org>
	<CAOMwXhOfJEkntBTQLDGWjRYA6jorCWNEUF1+t8n5RJJoozcVJA@mail.gmail.com>
	<52CB29BA.5050404@linux.intel.com>
	<EB17154F-A59B-4283-8F03-FC8DEFDC8285@dominion.thruhere.net>
Date: Thu, 9 Jan 2014 16:53:08 +0000
X-Google-Sender-Auth: zSzMLTBMai03MoLd_wCKAd4COaQ
Message-ID: <CAOMwXhNqTUpR6EutkNF0Co8Lbz90NpWd7RK=ekbZ4xu9BcEW0g@mail.gmail.com>
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
X-List-Received-Date: Thu, 09 Jan 2014 16:53:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 7, 2014 at 12:16 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 6 jan. 2014, om 23:10 heeft Saul Wold <sgw@linux.intel.com> het volgende geschreven:
>
>> On 12/31/2013 06:18 AM, Laszlo Papp wrote:
>>> Ping?
>>>
>>> Alternatively, the system could also have an option for further
>>> fine-tuning what to do with git patches
>>>
>>> On Tue, Dec 24, 2013 at 12:44 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>>> It is better to use "git am" when possible to preserve the commit messages and
>>>> the mail format in general for patches when those are present. A typical use
>>>> case is when developers would like to keep the changes on top of the latest
>>>> upstream, and they may occasionally need to rebase. This is not possible with
>>>> "git diff" and "diff" generated patches.
>>>>
>>>> Since this is not always the case, the fallback would be the "git apply"
>>>> operation which is currently available.
>>>>
>> Looking at this, is it possible to detect a git patch and only then use git am?  Since most of the patches carried in oe-core and other layers the 'git am' will typically fail
>
> All the patches I add are git am'able since I use a patch similar to this :)

Cool.

> A big timesaver is to check for  a .git/ in $WORKDIR otherwise git am will try to use a top level git tree (e.g. combo repo) and that's not what we want.

Hmm, yeah, I agree.

However, I do not have time currently for this, nor is this
high-priority for me since it just works for me, and I am happy with
that. Would it be possible to optimize it later?

Failing that, what is the best practice to keep my changes separate
from Yocto? I am referring to changes that are not upstreamed for
whatever reason, like the maintainer saying that here it could be a
performance regression (although non-measured at this point).

Cheers ...

