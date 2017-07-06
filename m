Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 043CD71BEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 17:01:52 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id c11so10994474wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 10:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=sNZYs9wIsFzIuXKfei5jLP0PAaaI2uZUveRbqxsWEhU=;
	b=U+fRahWm2C5ic3qHCuVfh3d2BQYhmgkSJ7Gbz8pfvAju06Ij1PfmHTrb9BwKy7Qthm
	bQlknwftyfMMrGYhxd2b4mjrXDD3uUu7ssEr2tWbSgeg+fP/2H7F5mUB51tLOtEgOJg1
	+9Cey7Nn6j80UOHwbSrHsdz6Bwd9patdHqZEW1yIhzK07jD8NeRcQB1DYqJ+qm8Q/HIW
	Dn+FO1UDqXbqH1pZYmIf/Tk2OGSQnbxeg8bgIJOv+0m2o5vN9M3cE1uAlw87YwkrpwIE
	kvAWQdp5mWZPbRDdNuyeHsuDN9Tu/EiVSOznuRT9UFC8tIgbKdnJD0Nr8AVg2bz8ZcZs
	N/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=sNZYs9wIsFzIuXKfei5jLP0PAaaI2uZUveRbqxsWEhU=;
	b=V3i4v1skRGYH6sCyfC+IacHzHBQu4L9yUYkZqmA7SS6tah36BSHDef/w8bYKHZcGFc
	RF3zAi7ZAypAi2IZKzOl6WMfCIERgCkiOYgB2MsujZkUDXWArL3j0qkTUFRbUPPKm/BE
	V3ondfzycKzwXQWtG3ux1qfBhJ1n+27tnMKgL4pluDIjpIKpsDYy/okzRazjxzTCD7/0
	jB42Sf/Y+l/eHR76majkW9DimmviUYkZ1HBxKahZKwWRlCRcSxhAQ4j2GPydkioP27I0
	BsEW3ygRCaQuh40nKKbKgCvFqWcRgc3uPbeY4twZCR6404lRgnzquDmDxR4pJbkHWb3V
	TElg==
X-Gm-Message-State: AIVw1105a5KTIdiMQHcsP+VwSecKK/KRJj0o6+zWP7qK4W8aQS6wgti1
	eSj9z7IFLK59xytQCg0=
X-Received: by 10.28.13.145 with SMTP id 139mr100228wmn.49.1499360512900;
	Thu, 06 Jul 2017 10:01:52 -0700 (PDT)
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com.
	[209.85.128.180])
	by smtp.gmail.com with ESMTPSA id u75sm1142615wmd.1.2017.07.06.10.01.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 10:01:50 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f180.google.com with SMTP id 77so11060229wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 10:01:50 -0700 (PDT)
X-Received: by 10.28.210.69 with SMTP id j66mr169601wmg.82.1499360510172; Thu,
	06 Jul 2017 10:01:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.209.14 with HTTP; Thu, 6 Jul 2017 10:01:49 -0700 (PDT)
In-Reply-To: <20170705220122.2382.70322@do.openembedded.org>
References: <20170705213627.23967-1-otavio@ossystems.com.br>
	<20170705220122.2382.70322@do.openembedded.org>
Date: Thu, 6 Jul 2017 14:01:49 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqjoFomAmUjRpvAQEZmsFDmc9REmBaSrJbBxQx5Oq1XJQ@mail.gmail.com>
Message-ID: <CAP9ODKqjoFomAmUjRpvAQEZmsFDmc9REmBaSrJbBxQx5Oq1XJQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"Burton, Ross" <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG1lc2E6IGV0bmF2aXY6IGZpeCBzaGFkZXIgbWlzY29tcGlsYXRpb24gd2l0aCBtb3JlIHRoYW4gMTYgbGFiZWxz?=
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
X-List-Received-Date: Thu, 06 Jul 2017 17:01:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 5, 2017 at 7:01 PM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
>
> Series: mesa: etnaviv: fix shader miscompilation with more than 16 labels
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/7589/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at de79149545)

Checking the commit it has tried to apply it was indeed going to fail.
As I mentioned on the commit itself it required the upgrade which has
been merged on master. Just triggering the test again should work just
fine.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

