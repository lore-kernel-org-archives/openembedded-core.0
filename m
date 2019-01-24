Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 77B0160079
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 22:33:35 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r10so8231414wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 14:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=6B5w4hkZwSe1fnEbhFwt1lLXx5SzBTZo89kayvdTeYU=;
	b=LiNKJP7w/KkxdK4kLMk3GgKJ2AyIzKjn+F785NlNxLnLN81xy2etvPqvjTKPabkRSI
	iwpRHeuraRP+s15xFZFFAaCjAGphmHE2Wf8+R2a88hfsnjCw4TRQ0SlD3xnVafGgIZvr
	6vxZzy3/KV14Ij1zit/U9QOqXX1OBEhonCtso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=6B5w4hkZwSe1fnEbhFwt1lLXx5SzBTZo89kayvdTeYU=;
	b=m4H7+DAgeaYgoCVdQx6bzhyKJKx211tRpgWQ3FBIofNYDRAS4kvIkBUXG6kMNrhybc
	IiiRJatONOQaDmEfKhFijmGyzqABcWIFywTrJw4vr1hX0y+ukM6JUeFcFsW57Owfaon/
	pcKW+z6cSE9O/KxTW3S7IhzFjJgaFiFPUxPoinLrmsDW5GSt5zaqMlAt7FdVkglyf7Nw
	Sz/tS3hasLDH/D5HulApVwHBEkhKGtjoUPqSfq7a8Z4vj6LpHs0MKWut0ow3e7znipJo
	Wps0dK9mURVK14R98GvdwkpzKlVQT7aa93k5DzIfDHLdUd0dnFYJ28lMjGTd/ekMsl4C
	SQug==
X-Gm-Message-State: AJcUukdSFjqPR6P4Cic8PTaOsErUAaLFUSAEQHMKOmdjbboEKrVpudNH
	lqUPoDOmCFHG2a+UpTgzkINirg==
X-Google-Smtp-Source: ALg8bN4KqKfBSruCv8Dv8raML/1BY2DypBpnWRmRDQon7fZrA+N2zmqGo08eSbzMmcX/zjyvBuyOQw==
X-Received: by 2002:a5d:6808:: with SMTP id w8mr8613862wru.270.1548369216070; 
	Thu, 24 Jan 2019 14:33:36 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	199sm70281816wmh.21.2019.01.24.14.33.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 14:33:35 -0800 (PST)
Message-ID: <35c624dede657dd7395134ca2405291079d53e41.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Marcus Cooper
	<marcus.cooper@axis.com>
Date: Thu, 24 Jan 2019 22:33:33 +0000
In-Reply-To: <CAJTo0LbDy-KnLje4Ng4VqD4ojc4tXyKAMWaoq5Q0FroodxU+FQ@mail.gmail.com>
References: <20190124124341.26815-1-marcusc@axis.com>
	<CAJTo0LbDy-KnLje4Ng4VqD4ojc4tXyKAMWaoq5Q0FroodxU+FQ@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: Security fix CVE-2018-16864
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
X-List-Received-Date: Thu, 24 Jan 2019 22:33:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-24 at 15:55 +0000, Burton, Ross wrote:
> On Thu, 24 Jan 2019 at 12:44, Marcus Cooper <marcus.cooper@axis.com>
> wrote:
> > +++ b/meta/recipes-core/systemd/systemd/0024-journald-do-not-store-
> > the-iovec-entry-for-process-co.patch
> > @@ -0,0 +1,204 @@
> > +From fe19f5a9d0d8b9977e9507a9b66c3cc66744cd38 Mon Sep 17 00:00:00
> > 2001
> > +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <
> > zbyszek@in.waw.pl>
> > +Date: Wed, 5 Dec 2018 18:38:39 +0100
> > +Subject: [PATCH] journald: do not store the iovec entry for
> > process
> > + commandline on stack
> > +
> > +This fixes a crash where we would read the commandline, whose
> > length is under
> > +control of the sending program, and then crash when trying to
> > create a stack
> > +allocation for it.
> > +
> > +CVE-2018-16864
> > +https://bugzilla.redhat.com/show_bug.cgi?id=1653855
> > +
> > +The message actually doesn't get written to disk, because
> > +journal_file_append_entry() returns -E2BIG.
> > +
> > +Patch backported from systemd master at
> > +084eeb865ca63887098e0945fb4e93c852b91b0f.
> 
> These patches need a CVE tag (CVE: CVE-2018-16864), and
> Upstream-Status tag (Backport), and your Signed-off-by.

This managed to sneak past me, can you send a follow up patch to fix
this please?

Cheers,

Richard


