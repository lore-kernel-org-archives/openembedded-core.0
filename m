Return-Path: <martinstolpe@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id E4F3672491
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 13:27:39 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so35303610igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CTxnywQAMTyfj2NOlNgf+zOkfBfGPepEcTuC898c9kc=;
	b=B1qZSTHehk4zwItj+jzxBgiCWXSqbPcvuV2DuLkcurBsrqzDoTYl2G9Wq4tlPdxKgR
	8O1xYkbFQmwJx/hcupmXGb4w4SwLCXcOI70Ivr1A4D41ZjoziE8Qgrbd2sPN/hQbhjUJ
	1gB/e7yevQCrWWQxmqF8mCiHs7F4o96R9bOEdzUFehZFHgoLLd+YrwJoQlcunOGQfsQh
	5GN7Jw3eDcQBQipyQHtXapxrF+iW+QGo8IPO4T5nLvU0tVvcXRkHr/ofWB1w8GdKpDIm
	jTteHjZFngyw6bUn4IyHETSK3n+Gg5F2PDdinsflO7IwKNv6eR1mzGszBl3HnYTfjSfj
	ra7A==
MIME-Version: 1.0
X-Received: by 10.50.141.164 with SMTP id rp4mr27990775igb.2.1433942860677;
	Wed, 10 Jun 2015 06:27:40 -0700 (PDT)
Received: by 10.36.79.146 with HTTP; Wed, 10 Jun 2015 06:27:40 -0700 (PDT)
In-Reply-To: <CAMKF1sqbdiykJXaR5DboOHqnVqgnhygRPfgpFmKziQFEu5BUEQ@mail.gmail.com>
References: <1433941677-9681-1-git-send-email-martin.stolpe@gmail.com>
	<CAMKF1sqbdiykJXaR5DboOHqnVqgnhygRPfgpFmKziQFEu5BUEQ@mail.gmail.com>
Date: Wed, 10 Jun 2015 15:27:40 +0200
Message-ID: <CAPHZmLZyCTG9MGuBrBRaMV_hdq_ASJ17TaxCD0D-3CNgVsMi3Q@mail.gmail.com>
From: Martin Stolpe <martinstolpe@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Stolpe <martin.stolpe@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses: fix native builds when host has gcc5
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
X-List-Received-Date: Wed, 10 Jun 2015 13:27:43 -0000
Content-Type: text/plain; charset=UTF-8

Ok, then I was too slow in sending the patch. Haven't seen that it was
fixed already.

2015-06-10 15:21 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> On Wed, Jun 10, 2015 at 9:07 AM, Martin Stolpe <martinstolpe@gmail.com> wrote:
>> -BUILD_CPPFLAGS += "-D_GNU_SOURCE"
>> +BUILD_CPPFLAGS += "-D_GNU_SOURCE -P"
>
> We have fixed this do we need this ? whats error.

