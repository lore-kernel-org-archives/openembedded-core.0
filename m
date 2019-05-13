Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id C9B897DF5E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 20:29:46 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id u186so1248522ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 13:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8nMsnyF5IqVhqaWXcICgimbwVGYvDpNLWEEogjf0tsQ=;
	b=VhWfIdyJEaa/2unYRwI/+LP69UVBONEkffShK0Gs3MfVehoQstgQpek06tXJ3lAuCJ
	h4Ltx+e+YkjRqNDwhxZVXCkS3Ycb0zVjL6BTd6OVQIEd5kb/LvcEfV+Bh0ull3EjoDOw
	WxYTK7wV8GbeCmSxeFM8H9Ru8JnjQPLVd65LXOYkhlxFPv0OVL2Fq50pybFgh7/mNCF5
	hlbFO4f5Jx9LWBvdEgwbpwRSWse+8SmicivHcdzbyzN4NQaEGIh5Z/GCleRh6h0PW+fd
	+Jcx2cFMX7XQWXn7n6qQ9ONFFZmsReHZkh1ta4SxuRlMp8op++PjLxZJMjk+HC+dSUOH
	/t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8nMsnyF5IqVhqaWXcICgimbwVGYvDpNLWEEogjf0tsQ=;
	b=d2XG3Zc6sLarkvg8Lx1Uh99NAip/J9GdA5SemegptSivvkGtZY44qp+sBT0vH41yHb
	arguDW+APWs8qb06x5A5d49BPckZ+Y0eKJ9yyUqylDR0q6do9k0wwcGL+3TeVIUr6X5M
	OVGskt4gYXRusHbsfoiimBqnBqOqvwfyDSU1HRhH9Yq+KtBUzjF3ySQIVkJ1eQAoNoi1
	Obw9EYopA2e02bHT8ys++F5Lgfo2PrFTRwcToPd8ccLCgtXaG+byj2Jjp6KbPzzKnkzZ
	dCOUpbZ5ES5PoBDtbA55TOC15a+m7sI+eu551nq0DLw5n1bbOx6TJCdL6Cf2Py/vj8bh
	fN/Q==
X-Gm-Message-State: APjAAAVkBBk9qTzvofjLCwIvmyRPI3IButtivYVUd/ha//lMf74W4KFC
	xOYSWtoxUKkLoIiWRtEIgB/0HBI45fzZTtT4iqhRkQ==
X-Google-Smtp-Source: APXvYqy4ImVm1gSgp7EkFZtTywLcR3vhx62Z0IxNgZ5QbYY8Ezu5fEe8Gi+qjIkIdKC3ZW8t4EuPX1r/gCqHPpaejNA=
X-Received: by 2002:a02:bb02:: with SMTP id y2mr21184409jan.105.1557779387737; 
	Mon, 13 May 2019 13:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190513112942.14103-1-richard.purdie@linuxfoundation.org>
	<d53f683f-84c5-e6a5-3030-09762663b785@gmail.com>
	<5c41f8b6a4b25135149b99f4e80c6a356738f158.camel@linuxfoundation.org>
In-Reply-To: <5c41f8b6a4b25135149b99f4e80c6a356738f158.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2019 13:29:37 -0700
Message-ID: <CAJTo0LajcXwn8o9KEVJ10xG9q-m=ACn8Vu9fQbPqdqgomWpRmQ@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/target/ssh: Replace suggogatepass with latin-1 codec
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
X-List-Received-Date: Mon, 13 May 2019 20:29:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 May 2019 at 13:24, <richard.purdie@linuxfoundation.org> wrote:

> I replaced the patch with a version to ignore errors since I don't
> think the other solution was right and whilst ignoring the errors is
> ugly, its probably the lesser of several problems...

I don't think it's entirely ugly: decode as utf-8 but if we're being
sent random garbage or binary data, don't crash.

Ross

