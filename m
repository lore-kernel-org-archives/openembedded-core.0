Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8C69F77A56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 14:03:45 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id g21so10672276lfk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 07:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o1quvw1dLywNjnwxsB2K48+FfTGBMTnnHsX2uZZNJa0=;
	b=REsr8+tAvv1nfo7QSr7E8iQANTtxoiWQWD/81fo8x+h1OxjPP0SOcbK6XqVI0yi5H3
	j2gA2lhmFoOsOtp3KLelJXW0UoKxDfALZJ+x/fzNReyI3fnT8dU7uc5A1vLM4TXs8oj0
	HSYIFvNAfDsRi+jtw22b0UDJYCEwlZoMWoSQKNVzNtVx4Re527757NCi1taii0c/tTuQ
	+zTWUbK/EpeHTtLve3XN/KRfqFwoPRnhTHG2ffHUH7aC48anDqoMZMdSQ6iRC2gRUpcK
	zSOPzqyq2+P2nnGMv7MEgKBtu47uLYjV7vLqy6IkySHRGE0jSF8c/e+DdujAL1PRenD4
	XGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o1quvw1dLywNjnwxsB2K48+FfTGBMTnnHsX2uZZNJa0=;
	b=mM792aZIw4qeNOKJvx9OmLihpLz0F9UCsh9kL9FvnyYmZ3fXGjhdJLKiFduZfzeKow
	dUGoW6xgao4z0r1H7toViM0he2ezctJ+tZYa5t3OK6kQgJO+xN8/q0CLvGxmaBUHv/Ws
	3/NeZDKR7Osg2dcHfA9+Xa98+SryW5otOySK2vLzDi67SL9MQXczeBJbACTCAtbqHK2A
	wlxx9Qyp3cbQd3YkLFnVv6AZrbIHnMhXmffWU+LWVphLRbTgrbV0c3mNNj1QCvGZBLYJ
	mbl9tsGMsdcTFRz5UfEVoR3cTrXPghvf8IRGsmwPyt1XPjxebybDqz4orcZaXVXXn6JS
	5ZPw==
X-Gm-Message-State: AIVw112orLK5qTu13bJZk5fpwDqmZrTaM716T9JHTJHZaSSm9O/MOg0m
	WgIDbt/1+YO/dD6E/Y+0npI8hpjOMA==
X-Received: by 10.80.140.204 with SMTP id r12mr11791351edr.123.1499695425774; 
	Mon, 10 Jul 2017 07:03:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Mon, 10 Jul 2017 07:03:15 -0700 (PDT)
In-Reply-To: <CAJTo0LbOPpCmOLoVnS5iWT-4=SjCyCSBQntfFFR1ZWwCxeZt7w@mail.gmail.com>
References: <cover.1499520469.git.raj.khem@gmail.com>
	<c5c0b5ea6f1706acd5966c32ef03d8d88a54171a.1499520469.git.raj.khem@gmail.com>
	<CAJTo0LbOPpCmOLoVnS5iWT-4=SjCyCSBQntfFFR1ZWwCxeZt7w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Jul 2017 07:03:15 -0700
Message-ID: <CAMKF1sp=XFSfntg_3TMUNdU47-tUT1v3n0q8BSVK9VDpJseQfQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/10] glibc: Upgrade to 2.25.90
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
X-List-Received-Date: Mon, 10 Jul 2017 14:03:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 10, 2017 at 5:12 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 July 2017 at 14:34, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> +SRCREV_localedef ?= "51e945a8f950a6695754b11c1e6fba8bb750e100"
>
>
> ERROR: cross-localedef-native-2.25.90-r0 do_fetch: Fetcher failure: Unable
> to find revision 51e945a8f950a6695754b11c1e6fba8bb750e100 in branch master
> even from upstream
>
> Did you push?

A botched up squash and merge instead of a simple rebase caused this.
updates the pull with right SRCREVs now. Can you retry ?

>
> Ross

