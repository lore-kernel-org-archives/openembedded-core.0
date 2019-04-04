Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 706DF7D414;
	Thu,  4 Apr 2019 00:39:19 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id g1so613231qki.5;
	Wed, 03 Apr 2019 17:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xgz0S6lGlc07esuIoQoVYBejaSO4dHgPy4bgh3kQG5Q=;
	b=ZNRMfrVd+jX9qj7ehgC1wnQNMsccGHvBIawiUIukqHS9Mp6M6O3DkJfoyKx+DvXX+d
	ChKC/DFwMayrVxwfElaLD3Pdo1l2wET4ZZEYsM7lOAk7HYChMUMcaDyepUeNIsiWL0OJ
	6NpmmjkXSITo/1T6lfHf//hH/VI3PIk++Z2ninCEy2dZE7lvuW0CAvIRc3NSKBINBkP5
	ubm+1X9X44VDvbcrxId/+ARTQC6M35tdYzzPYHTZQ/SasHYpdsnp09o2VEvq5/yb/4u+
	NFiOwW01fKBNMlyPb/UnJFzPpLNaGLSkHTA0GlB5bHHY912NCb9KWk4DnHJh3VEzcI+u
	2pNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xgz0S6lGlc07esuIoQoVYBejaSO4dHgPy4bgh3kQG5Q=;
	b=fbVWER7pR+UgI4XXjOCd6zfdGePzr4cmw16uaDVq2oV8wK8RwOf/PADNQGuq6Q4Lfh
	WwOdFQ2NeBYF1cBh5QyH2xmRxyAMbq2dRiFfXG/bOr/3tfMOzQmQh9DhI5GcOSW/RrQK
	FwLPidUZEQMnX43geO1HrDPair9oIDcTN9jclPrKt5xJEdbCmMHcPYM2Z1klENWtd/5R
	5hDUSJQB8zdK9vRUTcrPZz9hF2o88cCONXAwdgR08g4n/Ef3PRaZZkbBR/HThQ0lx1z7
	/JoYhR8tics+3ulsDtVTGSSW4xvzFDqMC4kDru5sWe4oQSOIZy0n4grGYevEszFr5o7s
	X+sg==
X-Gm-Message-State: APjAAAVkg5K5QB/g0W/DEW4yH8KLk3qnHAMm9TQwoClIfeOd9vvmdM2n
	L3LdblEdCRJoLApH25+3f9SxOeSC3jH6O3JodtA=
X-Google-Smtp-Source: APXvYqyVy3cpHue0WjdWqDQWdXoiggXCG8gASt/Rb13SKaeKPYaA0GhwKZbCYcwsf+L9XtJD2IC7ui3TVX/La4D+tmk=
X-Received: by 2002:a37:9d84:: with SMTP id g126mr2625221qke.22.1554338359839; 
	Wed, 03 Apr 2019 17:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<20190403144110.GG4664@bill-the-cat>
	<CAMKF1srb2EgL7tYZDFoq2EqABp-+_eib2u2OZMwT6B3TVgNk=Q@mail.gmail.com>
	<2189093.Hm6Vq2XZhg@localhost.localdomain>
In-Reply-To: <2189093.Hm6Vq2XZhg@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Apr 2019 17:38:53 -0700
Message-ID: <CAMKF1spJCg2HjGRzke_3yH_9hCZR=ZQZfJ1EQZCQi9gQF3x-4g@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Yocto Project <yocto@yoctoproject.org>, Adrian Bunk <bunk@stusta.de>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Tom Rini <trini@konsulko.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [oe] Git commit process question.
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
X-List-Received-Date: Thu, 04 Apr 2019 00:39:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 3, 2019 at 4:07 PM Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
> On Thursday, 4 April 2019 5:46:04 AM NZDT Khem Raj wrote:
> > On Wed, Apr 3, 2019 at 7:41 AM Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Wed, Apr 03, 2019 at 11:30:39AM +0100, Burton, Ross wrote:
> > > > On Tue, 2 Apr 2019 at 20:46, Tom Rini <trini@konsulko.com> wrote:
> > > > > > The kernel does not have "upgrade foo to the latest upstream
> > > > > > version" commits.
> > > > > >
> > > > > > With the Automatic Upgrade Helper this is a semi-automatic task, and
> > > > > > most of the time there is no specific motivation other than
> > > > > > upgrading
> > > > > > to the latest upstream version.
> > > > >
> > > > > But since that's just filling in a template the body can also be a
> > > > > template perhaps with useful AUH data (run at ... by ... ?) ?
> > > >
> > > > Apart from making the commit message longer what does this achieve?
> > > > The commit already has a timestamp and author.
> > >
> > > It's an etiquette thing.  Subject+Sign-off+Empty body is bad form.  AUH
> > > updates are a form of "trivial update" that every project has.  "Update
> > > $X from version $Y to $Z" is what a human would normally put.  It's
> > > weird looking at git log of nothing but subject+signed-off-by.  I'm not
> > > going to object further on this point, but I don't get it.
> >
> > if the content of subject is being repeated in body then I would
> > prefer an empty body
> > redundant information in commits should be avoided since it can create
> > impression that body does not have
> > useful information and skip reading it. We should strive to make commits
> > concise and useful.
>
> There is often (I won't say always, but often) something useful you can put in
> the commit message. If it's a recipe upgrade, you could put a pointer to the
> upstream changelog in it, for example. As the person doing the upgrade if your
> prior review of that changelog or other upstream release documentation
> indicated any backwards-compatibility issues or CVEs fixed then those really
> ought to be mentioned as well; if you're feeling especially generous you might
> mention highlights of any new functionality. (I have a proposal that might
> help us automate part of that which I've not yet fully fleshed out, hopefully
> one day soon I will get around to it.)
>
> The issue of empty commit messages is something I've complained about in the
> past, and not just about recipe upgrades. If I - as someone who is relatively
> familiar with OE - have to actually read beyond the shortlog / commit message
> to understand the basics of why a change has been made, then it's likely that
> the commit message wasn't good enough. Unlike other issues, once a commit goes
> in the message is set in stone within the git history, so if you are working
> on a change, *please* take a minute or two to document it adequately in the
> commit message so that others looking back can understand it.
>

Definitely, and I agree that we should put relevant information in
commits, usually
the information about side effects if any, links to changelog etc. are
useful too
however, we should not enforce a behavior which could result in
redundancy as explained

> Thanks,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
>

