Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0977F79C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 22:08:49 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id c16so20370879oic.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 14:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L25f+tO+4oW1t/9QDuLonwRqc8DTLs70VBLaCok48SU=;
	b=rcif5yTHgQnEkHY7aJPcmuOWyXP0fCwHZgGP8uLThXUGCu/5XH1edkL2iwxEherWfw
	9cjMeMGVt71RIxDFXBHJa2hnKRjvh4dSvaDAFaCoPOEp54X4EZcaioECiB4YDKPDhL0Q
	zBYKhtB8adQlaKYh3kX1umXCku3FQaV9FcqlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L25f+tO+4oW1t/9QDuLonwRqc8DTLs70VBLaCok48SU=;
	b=h5j4/gyJggjuQL8upLadRN8xLa38Z/EyGf7GK9Fybplky+i3RR4ctAYKOBxiwJ89xf
	d6RzjZH8MzvsTqhF8Myzd1VaLVZknawXPcrv0cXUgdEJnFi6tgQXepd57YpqDB6g9IAf
	FaWtlKT1chpSmD0W8BSd4raEBbzoPT+89qYlY/Xp/HdCSwUfe86xDudwdnUoWAlSrqlC
	oEPlrH4ZZu9pFCvER0XAWQAis8ScgmdN/dUJqb5koVolb1zhOnk9585qMgYZGj5aUwxa
	gxbTZ7rbv1T4DvQPgc61YSM6Yp4yPcACdP+cTjb2fAuniF5pkjARV/bXokZCiaVwPzBw
	w0tA==
X-Gm-Message-State: APjAAAUG+cQSWmB8QXuj260U7Wb7sSASEulMmNuFdBorTit7VwWoz6oj
	ZegvlMbEbQ9BhmsnbauCToX55sqIn7v276iGQpDUUBDPdA4mrw==
X-Google-Smtp-Source: APXvYqz8eaPcUzO8aD3Q80N3XhJzFhITKgAqRme2Gdyigtmra12OEkPFxOjaCrW+I6NPHri1jaM1Rd7gPyLvqAJBeEk=
X-Received: by 2002:a05:6808:52:: with SMTP id
	v18mr1048748oic.152.1579212530470; 
	Thu, 16 Jan 2020 14:08:50 -0800 (PST)
MIME-Version: 1.0
References: <CAM9ZRVv1O-vdWAtN=2GXjSz=sJ+LDGZYMKv0qiFzEa5Q3J9+Wg@mail.gmail.com>
	<722e1fd016354b3ad453bc04ee8e5d2cd7a24ec6.camel@linuxfoundation.org>
In-Reply-To: <722e1fd016354b3ad453bc04ee8e5d2cd7a24ec6.camel@linuxfoundation.org>
From: Paul Barker <pbarker@konsulko.com>
Date: Thu, 16 Jan 2020 22:08:39 +0000
Message-ID: <CAM9ZRVsMXQrr_5qAAT6nMAoNqhv6mOT6m6CiER4XDNg-z4K0OA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: patchtest licensing
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
X-List-Received-Date: Thu, 16 Jan 2020 22:08:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jan 2020 at 22:00, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-01-16 at 20:07 +0000, Paul Barker wrote:
> > Hey folks,
> >
> > I've started looking through patchtest & patchtest-oe in detail and
> > spotted that all the scripts, support code and test cases are
> > licensed
> > under GPLv2. Is that ok given that we plan to copy this into
> > openembedded-core (probably under meta/lib/oeqa)? Is there any
> > practical effect of this not being MIT licensed?
>
> We have a mix of MIT and GPL licensing already. As long as the scripts
> have a clear SPDX license identifier, I think we're fine. If not, we
> should add that in the existing repo before the move.

Ok cool. Converting the license headers to SPDX is already on my list.

Thanks,
Paul

