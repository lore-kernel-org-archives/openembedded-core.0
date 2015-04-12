Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 124E06AC28
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 09:26:56 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so10242849igb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 02:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cG4TE4STEq5bTZtdr5Ncgjm6uJTvLbq7it6QcMzRhCo=;
	b=r0EjE512zHNA19G/bdYcuAk4vlopW0skv3vv3eRZ0JbvGegCQM/7USN7odZv4GND/J
	d8cY47RrZSzTJR5qYtuefPS71DrVeTJTalQhburJlZ/YSTPIRm5jneoHItM5ploqi3gO
	Cl4Brmqtl6Gm4MoXVSkfpIWJx/sB8bj1CL+wcFt74+fYDZGr597w4DMcrG1SVsN+oTWm
	s8ftSXGv1faxm4NNUEbjq+62iZOxcw4fKVEUh8BLGsSFXIWBeSM/pvpmNqhnSN+S5tKU
	f/fh3+zhcWo52ZroTXaB30erxLkDA7k8ap/oU/YGmnIaledCjnfky8pbNFh5R9l719k0
	PuhQ==
X-Received: by 10.107.160.212 with SMTP id j203mr13935931ioe.43.1428830817995; 
	Sun, 12 Apr 2015 02:26:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Sun, 12 Apr 2015 02:26:26 -0700 (PDT)
In-Reply-To: <A43175A7-E10C-4E5D-9E9B-E91744725F7E@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
	<cover.1428714999.git.raj.khem@gmail.com>
	<2f1431e35ccf21d9ea3f956bf14ced26980f8f3c.1428714999.git.raj.khem@gmail.com>
	<A43175A7-E10C-4E5D-9E9B-E91744725F7E@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Apr 2015 02:26:26 -0700
Message-ID: <CAMKF1sp=ecR62FWaR7swXXMats+EHUoV1XaZXe9nfi7df0wmig@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/17] sudo: Disable hardening for musl
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
X-List-Received-Date: Sun, 12 Apr 2015 09:26:59 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 12, 2015 at 1:30 AM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On April 11, 2015 3:20:44 AM GMT+02:00, Khem Raj <raj.khem@gmail.com> wrote:
>>musl does not yet enable ssp
>
> What happened to distro feature ssp, BTW?
>

It was never used outside uclibc recipes.

> Thanks,
>

