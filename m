Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 526626B79C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 21:03:41 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id ox1so8247598veb.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 14:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ual4KEhp75ET9AsQijRHbaUlE/U4ulWBEgvQkJb9Rjs=;
	b=Py27h7WaheAN/uLaYneadSznKAX7E/brAKJc7I6xpyFSHMNG5oFKU9PTF4yDRttx7j
	4NQVbgL5qTdFJ94rVTsBthzt4QG+/01FJ73aecQ/OaIIHvIEcpFcBUbOhksSx27qaTQk
	FIAk85YNmR20/MJMXlov2pqaNuYlv4FGsOPWRdWCrrshM/4KJ/RN7T/AASR3E3wiZW6t
	SGZC+D7mnMxuEEWkBxM/WeqlsxWa8CmgzZBBub48QId53+f1DSNrcz29NZU8zU249qCs
	11ZpxKtWqK9FC765TLiSsI8xrLdSvFVcMb7cwwwBOKqAi+0uhhYpN+KAbi/1GAPYd0mV
	fuRw==
X-Gm-Message-State: ALoCoQke6aBVT7G8QPPUx4KIYmdwb7gQ9ZJ/tdTf1UOw5AqB7n47+AnLofJVcL3f50hBnBKU8ntv
X-Received: by 10.58.216.97 with SMTP id op1mr1037701vec.60.1376514221355;
	Wed, 14 Aug 2013 14:03:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 14 Aug 2013 14:03:21 -0700 (PDT)
In-Reply-To: <520BEB7B.8060909@windriver.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
	<CAJTo0La-PsajOhDmPHyMONi9_u2ytgWLpnGoQNvf1tewV5dYCQ@mail.gmail.com>
	<520BEB7B.8060909@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Aug 2013 22:03:21 +0100
Message-ID: <CAJTo0LbUGhVaAgb6tOeu9yJuGnT62qaPPodTobYGesSSaSM+jg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/11] Update the way we control the construction of filesystems
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
X-List-Received-Date: Wed, 14 Aug 2013 21:03:41 -0000
Content-Type: text/plain; charset=UTF-8

On 14 August 2013 21:41, Mark Hatle <mark.hatle@windriver.com> wrote:
>> able to do this with dpkg by setting the package state to
>> "not-installed hold".
>
>
> I tried that and it did not work.  The hold semantic in dpkg/apt-get appears
> to say once it's installed keep it at a specific version.  But it doesn't
> allow you to hold in the not-installed mode.
>
> (I'd be more then happy for someone to prove me wrong btw..)  I tried
> everything from setting special Pin-Priorities to playing with the state
> file, etc.. eventually I gave up and made it a warning instead.  (This is
> not a regression BTW, it has never worked in the past... it's just
> functionality someone may want.)

Shame, I'm sure I'd seen this behaviour in aptitude.  Maybe that's an
aptitude extension.

Ross

