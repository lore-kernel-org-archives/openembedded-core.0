Return-Path: <dev@codyps.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id AA28878151
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 19:11:00 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id c10so17384249qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 12:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3Cba3vCPenlkC9ABCTOvdkn8qxi65xcXnYxi8VU9i5I=;
	b=TElenkrVqSg81eBnTRqAwNVNA5UUCIHHbwNNCE5cwIHZy687spwkX4FqmtviqaRbr3
	4Qhj8lbnKACg3DwGZEyKATvTqhCxVGAHCWovcHjcyLK6eSI8ZQkv0AJQXeP6LDVQI0ke
	FufKe28Yx//CNGP7bLFhbxai/G3B31NoCgPxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3Cba3vCPenlkC9ABCTOvdkn8qxi65xcXnYxi8VU9i5I=;
	b=ALHPcWbOYjmm4wWSpVPCtqzhHjCGK7UQnY4u+Dlas39maZRIuG9RP1+kVfWdeUTkwx
	RNnYLJFiI1K3SgMg/9k0MMXi/DlnHPHHlZ9MmiOVMZ8lHokiKJVOiX4zH3xQkHax5AWz
	KeIxC5F23raq24FPqRoLu3qcpbEbdrwx5ZlgKUWmQ2mYyGQggulOMAcN+K61j8gdmwOk
	48G5TVzMHSZgL0XnGQmTtcyfRkBQq3IDskrCYw1TxZY1/jtR0q3+psa4emVBIfgfdBFA
	YNuM1rHM33kWQp3w29yrjo/vcjHm6PvBj4Clbra0jPkzrOw779Xe78lm4d7CL+zEcrYi
	nB5A==
X-Gm-Message-State: AKS2vOzGmPgvKr7d2Ye+rHoH2fVTesaJjsrmHwoDiDf6GEAWnXUxWdmQ
	po5DmWuyS3XmPluZXLFW9aQpBjaoskMJ
X-Received: by 10.55.33.98 with SMTP id h95mr39843397qkh.246.1496862661265;
	Wed, 07 Jun 2017 12:11:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.188.135 with HTTP; Wed, 7 Jun 2017 12:11:00 -0700 (PDT)
X-Originating-IP: [72.74.84.52]
In-Reply-To: <20170607184621.5305-1-dev@codyps.com>
References: <20170607184621.5305-1-dev@codyps.com>
From: Cody P Schafer <dev@codyps.com>
Date: Wed, 7 Jun 2017 15:11:00 -0400
Message-ID: <CAPoQQ-3k7S7K+QdbZhU2m=4geFG5OPZkuAg=HFmuxbUmA1xo=g@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Joshua Lock <joshua.g.lock@intel.com>
Subject: Re: [morty][PATCH] gcc-6.2: backport fix of check for empty string in ubsan.c
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
X-List-Received-Date: Wed, 07 Jun 2017 19:11:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 7, 2017 at 2:46 PM, Cody P Schafer <dev@codyps.com> wrote:
> From: Joshua Lock <joshua.g.lock@intel.com>
>
> Building gcc-cross-initial with GCC7 on the host fails due to the
> comparison of a pointer to an integer in ubsan_use_new_style_p, which
> is forbidden by ISO C++:

The patch to oe-core master was for gcc 6.3, I've modified it to apply
to gcc 6.2 (which is in morty).

We probably also need to backport the CVE patch, and examine the
6.2..6.3 log to see if there are any other critical patches. Or just
put gcc 6.3 into morty.

This at just gets gcc building for me again.

