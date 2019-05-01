Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id D572B7D70C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 May 2019 19:18:04 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id y6so15642001ior.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 12:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KHAmQ9aVleWilQRSs/2Wd5HWkplC2XChKid6VAJTM74=;
	b=NYWg8odpHY6geQciGe37VyRvTgQiHSHFzeAMiu/gtix8Rpbuusl3QIwDfK4Dz70iqo
	lgCGeD34zz28CjiAV455Sz9HMrIZfVAirqVC5s0LrSMNE2nWBeUKha0HvnQ7pv4pls90
	uuBwqM/n6k3kXpIMCKBHrX+0m7lSLtd1y8ISQLeGGZUjfOK+XhU1BCsaaEr7tF4uv4fX
	7UA1BTOEfHNqc1XByjqQcVNo4gBcvwMJY7ZAuYrHzwyzed3qPpcEq7F9ZpNTtQx5Qpuz
	eQlhxNtV1QVtC/u3od8GyjccOyeAC8oYCAo4sZGtTWDr8VnpaHAnLluJwUdxwZl1hmGN
	0Ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KHAmQ9aVleWilQRSs/2Wd5HWkplC2XChKid6VAJTM74=;
	b=AFPaNHlD5hsofiD1TuMGVz0cRmnONmGgx3noP06c00cKISsAB2k1caU7XV9F30cVkX
	KdQiOqodgH7b2MHzt9bCcL3amycp78lM0YJoF9JEDXImVYN6Vfd5WUN5JT/UmP3E8ZJl
	ZjeUCQT1nFUcXM1Uw+ijTgWHlDscr/lwkHY5FkM7vO6y3pJWrk9c7+gO32KRZZr4wxps
	2OT6eJAS2xAl/vvhD7VTEDODadvhB+plOeMtYPe8V1TVZi6Q8EKw3abpwAH/bqiiPs80
	2kCUpRZbGPdhRcRxz4SAahnDTIgMwCGZwJZVU/2DjY4k5OvspwT/C3WNw7XKbYKGP8o4
	9IAA==
X-Gm-Message-State: APjAAAVhl2A3HgvpjK9gDCNuHcauPfa0vNd5fANabfi63lZxU0ugUlnA
	YTmGp0KTGDNPMkN1AKmZw28ca2gixre6eTnNaYJbfg==
X-Google-Smtp-Source: APXvYqy3rmXIaXJIWwucpObJmK8ptFBxatjWg36fJrIXLS79rjveCBFVdJ8Kv95iHvIGYZguQ2Ilyhb4HqLM3wLbzqg=
X-Received: by 2002:a6b:8e05:: with SMTP id q5mr38360031iod.270.1556738285894; 
	Wed, 01 May 2019 12:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190430192414.43383-1-raj.khem@gmail.com>
	<593bdf6b788838c82d73a7bd7b8cce01a185ba13.camel@linuxfoundation.org>
	<CAJTo0LaUQQg2FW9ezwWCwswmJR=HRCpoxS2r3NkcGTqhDaFhYQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaUQQg2FW9ezwWCwswmJR=HRCpoxS2r3NkcGTqhDaFhYQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 May 2019 20:17:54 +0100
Message-ID: <CAJTo0LaZR9bQbQpxfr9jb7BjZGXjWqpjP-Ge-3=xfz4VYmK2RQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH] gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
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
X-List-Received-Date: Wed, 01 May 2019 19:18:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 May 2019 at 12:52, Burton, Ross <ross.burton@intel.com> wrote:
> On Wed, 1 May 2019 at 12:34, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > e) systemd fails to compile
>
> Glanced upstream and couldn't see any obvious fixes so I filed
> https://github.com/systemd/systemd/issues/12454.

Apparently this is possibly fixed in a newer snapshot of gcc:
https://github.com/systemd/systemd/issues/12454#issuecomment-488362810

Ross

