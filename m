Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id DEC9661C31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 17:16:10 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id k26so4211831vso.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eS4Curc5SFCEFMqiJJqUXqjXDQtnMG/Zk94R3J9Y/I8=;
	b=Sb89Zf3LlQq5bkrkEh8dt5Q4SgPL79HXP53BdBO6wt1ctCn0B9NenkSCPIJOI67dW7
	cAozgnFtLUK94NVIVjeyKqRzmBYLdlg8oDxdnhpay96lOqDP+roCkfN1N/7Y04pSjAaG
	UT36F/IrG4zGiZuNyhsqTlg2oYm0lLpdqQm7HF1PX5VNMXUC1kyUhXoJz3JfjvbDB5jX
	QiwR+lblDog06/eWshhKzg5q+CVkRX6o1LA5dtYBlQOzm+YfiY+jot/E86BL2GIe3C4N
	xjhyLwp3VJm+9hGyckhGodBlWaeHsiiNgdg+d4TZ9yqqJWzYdf487y1hw2sH06fIEuHU
	0udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eS4Curc5SFCEFMqiJJqUXqjXDQtnMG/Zk94R3J9Y/I8=;
	b=DAEbyf2X+MvCoohXJFMsNrGGf4cdKbA2AakRPUggpAjNMobnmSR474GYPYEBYMQ7q0
	Y88HFOEVMRVvydPa1qKw4P668vhWmz3L2i4NSR42h++e6641AYGH++XIzEqHtJKz6p5J
	b+KLyTgLEuFJXkxUF61PqZ9IZchwMfc8bk/H7WPSv0bouX+HXZ8Z9VL07b52JZnu1fgr
	Y2kLasr9fz4DhROLgQDrJrsh9wptoXjGO8MfiYnvyFCaN2AolFKMX3ibgfa6zMGpqeDX
	wtnRt2qS36FIvI32FC7N0tvrGXGJIkcMrxslwY3/9fMZlTJ07kNy8sirF67zjcQLkLqq
	K2ow==
X-Gm-Message-State: ANhLgQ16dRBE9UpCxEFtC8AURC3ZuyzNZ+heOD9AV1F68azR2VQK5PCe
	FymzdcqqP5SX7eoWArpLwCAcI36fEAHFefK3Gh4=
X-Google-Smtp-Source: ADFU+vtvfrKf4K9JjykiQk0n7qEsD4OX9FQ815IfQ05xDbMdRfdGN4xfgdjJwDbS9f+KwN7E6OxLK5WWyVEUwltcCv4=
X-Received: by 2002:a67:80d6:: with SMTP id b205mr6070091vsd.137.1584033371461;
	Thu, 12 Mar 2020 10:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200312085608.Horde.kbPh9KWkZJR4Zi-lry-_TrN@crashcourse.ca>
	<CANNYZj-KNVxXWjTWqc-a6Xe4YqBx4aZkuFAkNjQb3ZhBL-hUcw@mail.gmail.com>
	<20200312103003.Horde.-mn1W9NE8YAc6sk0SRLY8bj@crashcourse.ca>
In-Reply-To: <20200312103003.Horde.-mn1W9NE8YAc6sk0SRLY8bj@crashcourse.ca>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 12 Mar 2020 10:15:59 -0700
Message-ID: <CAJ86T=UdeyMwt6-Xs--BOsYC5S3hRr+JzFmsS3k6qgkdnY+eoA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: simplest command to display which layers are applying the same patch?
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
X-List-Received-Date: Thu, 12 Mar 2020 17:16:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 12, 2020 at 7:30 AM <rpjday@crashcourse.ca> wrote:
> Quoting Alexander Kanavin <alex.kanavin@gmail.com>:
>
> > I think 'bitbake -e recipe', and then searching for SRC_URI in it should
> > show which layer applies which patch.
>
>    ... snip ...
>
> I *think* I know what might be happening here, and I'd like to verify
> some suspicions about how recipes are selected and patches are applied.
> (Writing this in real time so I hope I don't screw up.)
>
> Imagine I've checked out oe-core, which supplies recipe file fubar_1.0.bb,
> but it becomes obvious that there is a bug, for which there is an obvious
> patch I can apply internally. So I fire up a fubar bbappend file, which
> does nothing but extend SRC_URI to apply the patch, call it fubar.patch.
> (Remember, this patching is all internal, in my vendor layer.)
>
> *However*, being a bit lazy, rather than create fubar_1.0.bbappend, I
> slack off and create simply fubar_1.%.bbappend. (I suspect you see
> where I'm going with this.)
>
> Now the good folks at OE get around to updating oe-core, and part of
> that update is to add that patch to SRC_URI of fubar_1.1.bb (along
> with the patch file fubar.patch, of course). Now, because that is
> a more recent version of fubar, that is the recipe file that should
> be selected.
>
> *However*, if I interpret this correctly, first, I have fubar_1.1.bb
> applying fubar.patch, but because I am also defining a layer which
> contains the append file fubar_1.%.bbappend, that append file will
> also try to apply the same patch, which of course should not work
> properly. (Am I correct in my thinking so far?)
>
> If I'm explaining this correctly, then the fault naturally lies with
> me for being sloppily ambiguous with my append file and not locking
> it to fubar_1.0, but allowing it to be applied against all fubar_1.x
> recipes. In short, when I inevitably get the error of "Patch already
> applied," it is entirely my fault for being sloppy.

Not really. Upstream oe-core could equally well have added the patch
to fubar_1.0.bb, so using a version specific .bbappend doesn't give
any guarantees that you don't try to apply the same patch twice.

> I'm trying to verify this as I am now aware that a *lot* of append> files in the vendor layer in question are similarly ambiguous.
> Does this make sense?

There are two approaches to applying fixes to upstream layers such as
oe-core. One is to create a separate layer containing .bbappend files,
the other is to maintain your own fork of the upstream repo. Both
approaches work but maintaining your own fork has a number of
advantages:

 - Any changes you make are easier to submit upstream (since you are
always creating patches against the upstream repo)
 - You can directly cherry pick upstream fixes or version updates for
specific recipes you care about
 - If necessary, you can easily revert upstream changes
 - If you rebase to a new upstream release, there's a good chance that
cherrypicked upstream backports magically disappear with no effort on
your part
 - If you rebase to an new upstream release, you get a clear warning
(merge conflict) if a change you've made conflicts with a change
upstream
 - Some changes are much more difficult to make via .bbappends but
easy to make directly in the original meta layer (e.g. try adding a
patch to gcc)

Maintaining your own fork of an upstream meta layer may not be for
everyone, but for the situations you've been describing recently (ie
where you have a large number of .bbappends for oe-core which you want
to migrate to a new OE release) it may be the better approach.

