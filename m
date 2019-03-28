Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f172.google.com (mail-it1-f172.google.com
	[209.85.166.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9683A7CD89
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 13:51:01 +0000 (UTC)
Received: by mail-it1-f172.google.com with SMTP id e24so6105516itl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qaWtLL3e3xh4/+/P/hDqMZq7PKhEXrjsj0fh0QseocU=;
	b=0DImcBf90tEy08b7SKxnaoYR4Ahv6HCoGOItS2axO2v/wrvpD3cFH3WvRzHLHwyg3z
	PceR81X3P3XznPhwIb1pkRNtbc+xMp/FpJzbL9yDiS4Qm9WC6FPhC5MUAVbfmcSURStK
	EXGKCa6IHRa+OAbDA+9nRcBnUNt9sRiovVcvlm4NZSC9/Vbhbg/E901FainMFQndBJ50
	+/zPTfD/nFm2RWWP1Sd69XiNANGIF5IUCkkeIvQXdcO68ktSIKSfXfieIITgUAI4+obo
	p5k9dlgHdLOLrMGEfUPibemn6AIBogjRfjParuyHftxtZLvchrz+MTNJqrfR6A7I85oY
	SxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qaWtLL3e3xh4/+/P/hDqMZq7PKhEXrjsj0fh0QseocU=;
	b=FXyWlzgObhOOiI9sA/ie1yUhB/Yizxy+OikxYFexcYDPMNtCxfSh1NJ5Jeh6v0m158
	L6+77iaxJrfPrjuAhvCz4P88KICuRsSenhJl/h2V0tDg1KNkbGyDSkUgXSxJpMTRxbNu
	rYAYOvKXdh0iDnq1NyG3F+93GKo48TYbijj4+rU45YXWdyAk3RyZb5eFiOw2LOKCpPSz
	QyfcNIKl/m61iFTz7L5nqdIgj98ggunVfaoLMLhkpeurUXMAIJcSNF2q9KHmRHN+kyXY
	yyc2WfuYli6ptyh0WfhBnJnGNC9gb3Yu3Kz45mdApLsofY0Wob+gZuPxMaNisQImp7WL
	yCeA==
X-Gm-Message-State: APjAAAWQ5yn1uHnGIxEZfo22alSt+VB+L/JV3RR2DfWHVR2Bj3dysSAL
	+gnMNN8asLHqttdY3fVn+E8A2ulfUYJXYjDH4/g+LQ==
X-Google-Smtp-Source: APXvYqyxCctCj5kJ50PqicWIV5w5IgjKzGMe0GvzKg8ByZkzXu+WS4ImzOl7i7i82NN5SkiI+t0fQ1rcYHFg7uHIUQI=
X-Received: by 2002:a24:52c5:: with SMTP id d188mr97130itb.130.1553781062497; 
	Thu, 28 Mar 2019 06:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553775186.git.Qi.Chen@windriver.com>
	<a1544536fd186e7326faec46f7e35c6a1d33e45e.1553775186.git.Qi.Chen@windriver.com>
	<CANNYZj_xbMheU=FEenRYkccJwxG10mJPHSqmwekt+EqAV=FumA@mail.gmail.com>
	<CAJTo0La3fza0yn=dcWYWjSh00oJD1NQg8UMDOYSN0w_y4qODXw@mail.gmail.com>
	<CAJTo0LYwZ0WNNsA0Wm+uzAsuAHHiRzKOE=aGZZOkRfa56Furpg@mail.gmail.com>
	<20190328134644.GK18421@bill-the-cat>
In-Reply-To: <20190328134644.GK18421@bill-the-cat>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Mar 2019 13:50:51 +0000
Message-ID: <CAJTo0LYw1UPfhZy0oJZ5+D=nL0THTaFF4M-1gR8YdqGykB-JmQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>, ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] binutils: fix PV to respect upstream tag and also cve database
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
X-List-Received-Date: Thu, 28 Mar 2019 13:51:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2019 at 13:47, Tom Rini <trini@konsulko.com> wrote:
> > > I just had a look at the code in bitbake and yes, it actually even
> > > tests that 1 < 1.0.  I'd say that there's an argument for handling .0
> > > releases specially and considering 2.32 == 2.32.0.
> >
> > Of course that test exists for people using feeds, and at least dpkg
> > thinks 2.32 < 2.32.0, so even if we changed the test the feed would
> > still be broken.
>
> Breaking feeds on purpose is bad, so this is a case to pump PE?

Bumping PE is even worse as a PE never goes away.  I say we leave it
as it is, and ask upstream nicely if they'll match the tag/version in
the future.

The CVE problem can be resolved by setting CVE_VERSION.

Ross

