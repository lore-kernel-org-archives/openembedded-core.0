Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE797D44D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:42:58 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id m204so5926495oib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1NzzmhNuso2pbliLKVq2LFxGmIYUBfqRy2awsKfIgGA=;
	b=hcQj5IV52A7j+e/aMDhF04ahIZs46wOGS4X8+3GIbfX8+GvCH52S+FTArKYnBHydjd
	bQn0Cbr4V8hvtgFhc+RPEcJSBjjahE5Zs7U16AE0bZ6zgrYHVvkHrlzGUjnNgtn82Xvj
	fGC2y/qclUepARSzCPUxqAgo7Wbuy3st3kAfYxWQMO96J3lqKFXTT2AVgr+5jtquQfBQ
	crK427bEATDcObiFjpIjrnnm+OpFHGzaqV/SLXhWZ40948MIYKHCX0recK/ha12onAe8
	FD/JBSF7NEyfbLh8/Q/8qTPWCWsvNc93TUur/dLvN2MtXGvUVPDrzDN7kLCNJrF5RiW3
	2/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1NzzmhNuso2pbliLKVq2LFxGmIYUBfqRy2awsKfIgGA=;
	b=JF4+ANYZibC4h5TMAug687pAyzy7kBEDyMJVKpdgEPM8drUtRwA+6eRmsY974NBdVW
	hLQgeULKvzp+Ft9QZD4+eDOxzNqTQYDuydiS833e/Mq+AXhZt7yyailAATYFc2RooLSv
	cLfT2ar8Eobd9xt70O6xc5cUOtWXK7xFMhTo8KpUa3WzlmbUGUO+DFZQtfnzlj1KQGSO
	BFDgtIOgtKbRWsVQbLdtXV1o8xp4nYGQVWC/SO/szyN9iQim715ZapiTcA/y/CVS0lX6
	u1u/88bSFWljklQO2D5uSlcZ7jmjEzOssvqtNQH4Fpk3D75Ll2wSX+ZHJtBdgbZGzn2O
	9jSQ==
X-Gm-Message-State: APjAAAUxidh2YfEdiPjqWnGgwuvqUpgBmn9iiisRNMnMA0cLAZz8nqIu
	XlE0+eFZyoJa5JbvtC1JoVKNYX192b6qrfuf+yE=
X-Google-Smtp-Source: APXvYqwnTSHREsD9toNUKncrPXw62bfi5Gmk9b4l1X5DXqMjgET9z6tFNRkpOpFAkOhQa0iV9vOxtAIHvpdH83Qo+uA=
X-Received: by 2002:aca:50d3:: with SMTP id e202mr15040488oib.88.1558118580037;
	Fri, 17 May 2019 11:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
	<20190517181151.44001-11-alex.kanavin@gmail.com>
	<4723f59c-19d4-fafe-fa56-ee0e564d220b@gmail.com>
In-Reply-To: <4723f59c-19d4-fafe-fa56-ee0e564d220b@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 May 2019 20:42:49 +0200
Message-ID: <CANNYZj9WHrGT8gaBXRA4vcM7kEe6kLsDmdnZVfgd-BnTMymmXw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/37] go: update 1.12.1->1.12.5
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
X-List-Received-Date: Fri, 17 May 2019 18:42:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 May 2019 at 20:25, akuster808 <akuster808@gmail.com> wrote:
> On 5/17/19 11:11 AM, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/go/go-1.12.inc | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
> > index 0cf0a63ff65..7c4cac1fc25 100644
> > --- a/meta/recipes-devtools/go/go-1.12.inc
> > +++ b/meta/recipes-devtools/go/go-1.12.inc
> any indication on testing?

go-helloworld builds, and so do various variants of go recipe itself.

> any reason why 1.11 can't be dropped?

This is up to Khem to decide. I just wanted to not throw away AUH
patches that were verified to build without errors, because due to the
vim snag they weren't mailed to maintainers.

Alex

