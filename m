Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9702E6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 01:26:26 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id rp18so102067iec.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 18:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5qTqPjR5s71AeChUPmDb8lCKwU332RE6pxKT2oww/1Y=;
	b=RrVDb8jgepjSg5am/yo+97jsURRvyhv19y7MdcquuPdOVyq7V+8mvzVnVKvJUyKIAp
	BcEpKKlzWgBY4Ws70L/otMfwYwoDtG6Crl1f6S/mhMxtQKcJTwqZX0g3xxqG4jpFG0wD
	XBX2IiLvlROZGQte2gwWy9SqEiitVgkcZuSO4aos78zlniw6ho3tBXkNe0jHwGf3X1Do
	poXAC/9+fK5UgHQHC68x6SI5gx/rxwS+ADIo0Ztje1Td4I75m5VdV4O1M6nRjYDx2y0c
	10QpIkesnwmszHv7PMAYbpLjMp+eAqWSURA4v5wBEtKZRYYcXyuS4qwUKOHNxI6kyHln
	FE6w==
X-Received: by 10.42.180.5 with SMTP id bs5mr17616125icb.70.1412126787477;
	Tue, 30 Sep 2014 18:26:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.179.5 with HTTP; Tue, 30 Sep 2014 18:25:57 -0700 (PDT)
In-Reply-To: <20141001005520.GO2480@denix.org>
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
	<20141001005520.GO2480@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Sep 2014 18:25:57 -0700
Message-ID: <CAMKF1sqJ=QsZWNWe436Q6hNaegEm6HMj76JtXU-gZBhrkRutAQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 1/3] layer.conf: Add in useradd dependencies as ABISAFE dependencies
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
X-List-Received-Date: Wed, 01 Oct 2014 01:26:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 30, 2014 at 5:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> This line above ^^^^ has a very long trail of whitespaces and it got commited
> that way, unfortunately :(

Better was if you commented before it went in.

