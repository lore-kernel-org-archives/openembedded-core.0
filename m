Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1669D6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 17:48:47 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id l11-v6so11258035uak.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RtnvCQ27xjis9gMRhoMhBfkEenTVCoyTn3CRvbVqnXc=;
	b=jpDnzyqFfcPo28Hbd6qMihVkiccTLAI0qiaN1xajt5DZQ+mRjUy61loeGw+S7WCUiI
	0bosE1k2iRY8gHSNIrYqIcrj7UD4kL9YnUiWpzvFDyO31HVigre4G5YaLjP1kXEQGyoL
	lL1OZXbPqo3JRjA5XhneY1Hk6fWfX9jL7y16yhu6gNeqE4V21diiFJx0WWE4I4IUWNnW
	m9WDG86IZZYfC9yYABwHpWuzJXfEnjZmIVn4M+939ho4vZERJIBhk8qXFTVhuriY/b/6
	MINvQ/ky91EhsIDKcFKLHA9XpY1f0Ph6QOOVI2lKSnpfPu8GcDfeaN2j4Ge8QCuZLpXx
	VrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RtnvCQ27xjis9gMRhoMhBfkEenTVCoyTn3CRvbVqnXc=;
	b=aK9va3ZkHlyITIkUxDdfyLWpiUhsBQ2JZj8qH9qQWFJV2pnBoiE/1VzWCSqzODTGgX
	Kl1RgpU+ASqC1jWqRAFAhD/nwZJM5XSP6HOOqlIJuyy+lC6jWyX25nL5DzvVGXn306PE
	lWPvQt5pBoHbS5N+y8xvSc5q3S2Ew0k+443olkJynbQhE87rcZTcL8XycH9C7b3e/UMj
	l3y5S5Kjilb+L+JpPFvBx3+c9FC0TVg8+/jMMjDHKLQ0bKdR2J+z6PZZiN4zlUAz06ZZ
	S3czG0a+qndw6PEQnKX0AkIMiyYWyx/JjFWIjOBWHjFrfJW8vSyHhISf2zSf0H7p3bSh
	zMug==
X-Gm-Message-State: APt69E2iJGOVGYEAJMRzKFkxNEL1nzU+r+gZ2Y7Xjn0QMjQIkU69HGqt
	OOkWuKLCJt27iB5A+wjpJWlsJd169OsdlrM4MRk=
X-Google-Smtp-Source: ADUXVKK8fWsN9gvHi6vCj7gemlWc0Bm2C23XR6sTZal7MxFQHytEV5QWep2ZRMVNfV29X9y+D98HBPssDKnFhCbDEvc=
X-Received: by 2002:a9f:3613:: with SMTP id
	r19-v6mr8779864uad.49.1529344128702; 
	Mon, 18 Jun 2018 10:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180618154833.10526-1-ross.burton@intel.com>
	<a00c6728-6ec4-8fc4-bbb5-d77e7c688ad8@windriver.com>
	<CAJTo0LZOugHOgkGx7=8AcLEZX6U8n_7GKWUQp7drLQgxAT6wrg@mail.gmail.com>
	<0cf77a7b-205b-1ee2-9978-84da4eb4cf9f@windriver.com>
In-Reply-To: <0cf77a7b-205b-1ee2-9978-84da4eb4cf9f@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2018 10:48:31 -0700
Message-ID: <CAMKF1spgJ+swjpYASBsFGG_gbU25pFbbH855sfg_UPaSYfAc8g@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mktemp: remove
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
X-List-Received-Date: Mon, 18 Jun 2018 17:48:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 18, 2018 at 9:47 AM Mark Hatle <mark.hatle@windriver.com> wrote:
>
> On 6/18/18 11:30 AM, Burton, Ross wrote:
> > On 18 June 2018 at 17:25, Mark Hatle <mark.hatle@windriver.com> wrote:
> >> On 6/18/18 10:48 AM, Ross Burton wrote:
> >>> Both busybox and coreutils provide mktemp, and the only difference between those
> >>> (and standalone mktemp) is that coreutils supports --suffix.
> >>
> >> I've got no objections to this.. but I do have a question/comment.
> >>
> >> Is mktemp packaged by itself in coreutils or do you need the larger coreutils to
> >> get it.  (I'm not actually sure it matters, but in the past there were some
> >> cases where you might not want all of coreutils, but wanted mktemp...)
> >
> > We don't have a small or large coreutils.  Maybe that's a WR-ism?
>
> No, I'm referring to system sizes..  there have been systems developed in the
> past that use a number of alternative command line tooling.
>
> I thought coreutils was broken into various packages already.  It may have been
> in the past and is no longer broken up as well -- or maybe the busybox version
> was lacking some argument mktemp (coreutils mktemp) supports.
>
> The point is there was a reason for it in smaller systems, and that reason may
> not exist any longer -- but just be aware it might come back up as a problem.

The affected case is where busybox one is not used and coreutils is
not used but mktemp is used. I think its in best interest for this
usecase to move on to accept a maintained version of utility, be it
from coreutils or busybox.

