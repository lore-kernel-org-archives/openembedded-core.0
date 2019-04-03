Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8D14F7D38D;
	Wed,  3 Apr 2019 16:46:30 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id z17so20082731qts.13;
	Wed, 03 Apr 2019 09:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yr3ThCJ1sGgMVPNxWLMJQXwq8svlx623UHV/3+7GVRc=;
	b=CFBA1S2fGcsCIYeVQHTv3bgFee5ppvUCJXecBS0bfbdgpiDduJ87jUBLk+iCOetCkZ
	uctZ1cmgTPKOJqoJhnF1AtHcRBmpWl43UusUVrszzzfCqxemuNiH6Gsf0SVjdsVF9b6f
	E+TNeNmQvjmw4T9c3+5OwqsQZzFrVxsKgLBblALkNesQ2ipmCqHYpVNi+wCkrxmGVis4
	mPdvDtcfJQA9grxRkyJPAYcpYHh6k7uzmnoopzp/FKCWUwV75tbOawlD/TdrdGYnv7Ni
	ZCZ1tGEfc8ucdH7/PaZ0eXaEz5AqCRiyaL3WdpUDw9kbEFpQcGERcBBW6rma5oBFNzNf
	PS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yr3ThCJ1sGgMVPNxWLMJQXwq8svlx623UHV/3+7GVRc=;
	b=uWH0XUf8B6YbekwLPnYkPVHjnbGL90G/hxINeQxD021HZxd9y8RZhwOgRMbI8k0Y/q
	40CJHvVb/XZ2aV1medvNdTJZ8n+aiKXIDX2w/wTU+zkK4GnDZqSJwBdlLmWcEnpONF9e
	3/qrRcDpfGcIZwtwgpKoYK9Qe28YFpmgDLRyDQzfHbKNkHqwya2u4nvgwCMnNv8dkdve
	9zpP6FXBOgDfB4U/rCvJS5dVDHdeNijldKkkOPBiWYUlbcvtZkO9JcadzOjBNelw6dOj
	POg+5Qj/woRxzuRUtz//tTpLhquAN7cFgGdm6IM+sRoQJ6yWy4kIQbaWUPMp8eOwe1FL
	9unA==
X-Gm-Message-State: APjAAAUmYpd/jF9BcvsdQKAS4tZAA0aehTuO/dVhJW0VQJV0u0UurPHF
	sy8x0uET5YPR+YXJwrTj4lgpmfUUFumGNfxpTkM=
X-Google-Smtp-Source: APXvYqwPfOtiu+AGsQocJ3gcj/E63VAn1LbWh0c5IoqeLKROr2mb4kiXMYy18gLvBZaZK90GDEm3Xlx2ZK5z8ezGzXE=
X-Received: by 2002:ac8:1846:: with SMTP id n6mr871214qtk.262.1554309991284;
	Wed, 03 Apr 2019 09:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
	<20190402065121.GA31468@localhost>
	<20190402194614.GY4664@bill-the-cat>
	<CAJTo0LZ5qeDA+rQ5Eh3_LCbGtQyo732LrDkiZ=O4sh52cjXU=w@mail.gmail.com>
	<20190403144110.GG4664@bill-the-cat>
In-Reply-To: <20190403144110.GG4664@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Apr 2019 09:46:04 -0700
Message-ID: <CAMKF1srb2EgL7tYZDFoq2EqABp-+_eib2u2OZMwT6B3TVgNk=Q@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Git commit process question.
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
X-List-Received-Date: Wed, 03 Apr 2019 16:46:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 3, 2019 at 7:41 AM Tom Rini <trini@konsulko.com> wrote:
>
> On Wed, Apr 03, 2019 at 11:30:39AM +0100, Burton, Ross wrote:
> > On Tue, 2 Apr 2019 at 20:46, Tom Rini <trini@konsulko.com> wrote:
> > > > The kernel does not have "upgrade foo to the latest upstream version" commits.
> > > >
> > > > With the Automatic Upgrade Helper this is a semi-automatic task, and
> > > > most of the time there is no specific motivation other than upgrading
> > > > to the latest upstream version.
> > >
> > > But since that's just filling in a template the body can also be a
> > > template perhaps with useful AUH data (run at ... by ... ?) ?
> >
> > Apart from making the commit message longer what does this achieve?
> > The commit already has a timestamp and author.
>
> It's an etiquette thing.  Subject+Sign-off+Empty body is bad form.  AUH
> updates are a form of "trivial update" that every project has.  "Update
> $X from version $Y to $Z" is what a human would normally put.  It's
> weird looking at git log of nothing but subject+signed-off-by.  I'm not
> going to object further on this point, but I don't get it.

if the content of subject is being repeated in body then I would
prefer an empty body
redundant information in commits should be avoided since it can create
impression that body does not have
useful information and skip reading it. We should strive to make commits
concise and useful.

