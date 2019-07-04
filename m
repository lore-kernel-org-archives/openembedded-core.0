Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 61E7C6010D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 15:18:55 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n9so7054560wru.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=firpDxpmpi/wmnw139GMj/DxMJYEqlyYUPa7VutGz2s=;
	b=C8R09wffqcrouEma0/GwEvDGDak5G7VtGHL3Vr2rs1Q6j8sQquSXS9g5ZRvOA+MfmN
	Wx8TEEajsks4jNmt2KNNGFFVBVcTqlK+pjOk0uz29nlO+6K3LffGxBp9Rbeq3XrYsfxX
	xt4j8+b8WyAfki85YnoGk9o3xAD1ofBZpgZC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=firpDxpmpi/wmnw139GMj/DxMJYEqlyYUPa7VutGz2s=;
	b=cW9wcLhPtNxOLtIuB4Wc2VF9O9J6N17GFetJF5AXCOTCWINKkyZ90b1QQhhVsmUyDj
	S6PApjTUS8cdvDe2DQHnr/JCjAT7fYxQp+bswNifHtQfwgYXpSCbtdD96GFzzb7F9pWj
	rVNd6Z/vH6ONndYU/A/Xa3Pwg4QM/NnGY4kNtpeiLEqK4mpkRfV3huo1amNlilyMyB6X
	Nl0IMTXSjKo0gNZQtfWr/X31uu9Wxa1hOGGwTbKX9JUDAAJOHskTu3FL7tA+WaBqIoox
	Bi3iNz04tPcv+JF4EpkB3uzYvAj8fYH/hgRGwfHpZklEnsykk3mUdg777JRQk5uAKC+S
	CcMA==
X-Gm-Message-State: APjAAAXq8vtOMPJyAGGlZB0hQDjt4SE2nl/fBjNXikzbAvfIVHhq3rMq
	TELClXapJA0W4xe3d8K3cEiKrg==
X-Google-Smtp-Source: APXvYqw1QMSQoVQGKIpGO6YLOs2qtcv7Y/VB4c8/F3VGagWKIf7QhrWHIrbz4V+5v33UH7v71gNkOQ==
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr32798713wrt.233.1562253536027;
	Thu, 04 Jul 2019 08:18:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id b8sm6320218wmh.46.2019.07.04.08.18.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 04 Jul 2019 08:18:55 -0700 (PDT)
Message-ID: <7c29c0bde1bae4de4cac852d98571dd28070f4c5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Zhaolong Zhang
	<zhangzl2013@126.com>
Date: Thu, 04 Jul 2019 16:18:54 +0100
In-Reply-To: <CADkTA4P-jyrFNf+vKQwDuyxD8sW=20MO+2Tus3AvaoKPjbJFvQ@mail.gmail.com>
References: <1562236183-6069-1-git-send-email-zhangzl2013@126.com>
	<CADkTA4P-jyrFNf+vKQwDuyxD8sW=20MO+2Tus3AvaoKPjbJFvQ@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: checksum indirect cfg and scc files
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
X-List-Received-Date: Thu, 04 Jul 2019 15:18:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-07-04 at 08:48 -0400, Bruce Ashfield wrote:
> On Thu, Jul 4, 2019 at 7:02 AM Zhaolong Zhang <zhangzl2013@126.com>
> wrote:
> > Currently, Yocto can not realize the modification of the cfg/scc
> > files indirectly
> > introduced by scc files in custom layers.
> > 
> > Instead of introducing complicated scc parser code, this patch
> > walks though
> > FILESEXTRAPATHS and takes all the cfg/scc files into account when
> > calculating
> > checksums.
> 
> There used to be a bugzilla around for this .. but I can't find it
> now.
> 
> While the approach isn't wrong, I think it is too heavy, since it is
> looking at *all* the .scc and .cfg files that can be located in the
> search paths, not just the ones that are actually used.

That isn't quite right. With the checksums its important to know if a
new file appears at location X, we should reparse as it could change
the outcome.

We therefore have to account for files which doesn't exist as much as
the ones that do.

> I do have some old code from the existing bugzilla that I can try and
> locate. The right approach is to have the kern-tools emit the list of
> files, since that's where we know the includes, etc, and what is
> actually going to be used. What you have will also conflict a bit
> with
> some changes that I'm making to tweak the config handling.
> 
> Since I can't find the old bugzilla, can you open a new one, put the
> patch there and I can find the code to dump the list of files from
> the tools.

This doesn't work since we need to be able to predict the task hash
checksum at parse time. We don't have the kern-tools available then to
be able to know which ones it would actually use...

Cheers,

Richard


