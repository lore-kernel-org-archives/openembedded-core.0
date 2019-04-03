Return-Path: <jdmason@kudzu.us>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0A2547D2E0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 03:51:15 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id 139so9013009ita.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 20:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wW/MoSS1flQjW8WCA7tfOy9rLOON5NNHQAszV4SFVh4=;
	b=vh3LYBm9xqV+/Uq6hslzANV2nirm9RJYB5aL/GH3UqohlDLKsKF4+sUilRikTyXENh
	+tuaE0B39SGESvQTPZoqo+CzTq+F9EY+J1wpcZJI+U8Gpr18nQkIYNILpk5qS5E4r4rG
	L9hroW/m8D7F4NNrNTvfbp98OkUvGNJRlEz90OPheinNzPP1lqt2fsDXJfgyvk3gBl7b
	+YlhvAwF2sh2Alk76+26pr0tFq99YwK66i9Cej+ZGS87xZ/RVxvpWMGy1xqzUE1RzDRu
	1V96XdRQYt30HJ0dspNsrWv4d7NU1wgtwoMv5yIe4SYOQCYQCwNBrOo+SypIqBOLXzgb
	n0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wW/MoSS1flQjW8WCA7tfOy9rLOON5NNHQAszV4SFVh4=;
	b=PGy5cy3CGVheFEJk58mwVWnakRljEKBv5zCx1HBek0/Up4Q+BmEIbHAXdd7r6zYJ5X
	v5Am8AJ2Vm/J9464g4cuXBStX42VVqBZ8Sq6UF+mS5nRO+mp9p436STyiV6cYUtziduR
	S5CKYkDmKdrU3WcyoDMoomhCasYit3dd7kGrVxd49/IsSWfAkkce3MALD7eQHPQOhyoc
	IPLJCIgLAEZp1CLWUUk+SthY85uGLT+mVTJRwvJdvyTBvTbyGUkHRxvAwk/7qxpzCmz+
	sQkJUWbjpf9qq8DW2UEpqiI/osKZB+7cUniZ/dAymE68vVQmKXmJjK5KvqRVSvMGOkby
	q1EA==
X-Gm-Message-State: APjAAAX7qynLPXkeSAOLszqjndX+4WJVztKBlZOZKmTZFyJY+3B0JkW+
	p+nEUNfw193UzfaV2FoKmicEf2xGIaUdNhAN58uz5w==
X-Google-Smtp-Source: APXvYqwo0Lffrb2lFnEi2191xmGykfcdJi50Xv1qepDH7egCMc74NDfzpQ0dHroAPc4XB1AKGc6U0QlNBSpNEzXKaWQ=
X-Received: by 2002:a24:55d8:: with SMTP id e207mr258269itb.119.1554263476745; 
	Tue, 02 Apr 2019 20:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
	<6068e963-94c1-7225-2c60-9ae027c74639@windriver.com>
	<CAPoiz9yat-4XRgSFikh5PxrsgVpRAWNi2dx1O0+_iHyVR529Ag@mail.gmail.com>
	<20190402194738.GZ4664@bill-the-cat>
	<56e2b936-177c-7066-99c0-bb46854daa4b@gmail.com>
	<20190403004550.GB4664@bill-the-cat>
In-Reply-To: <20190403004550.GB4664@bill-the-cat>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 3 Apr 2019 03:51:05 +0000
Message-ID: <CAPoiz9zYfcUJKOdix+1depKWUp5HBnNuSon0DvKKQLA6aKpdTQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
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
X-List-Received-Date: Wed, 03 Apr 2019 03:51:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 3, 2019 at 7:45 AM Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Apr 02, 2019 at 02:24:51PM -0700, akuster808 wrote:
> >
> >
> > On 4/2/19 12:47 PM, Tom Rini wrote:
> > > On Tue, Apr 02, 2019 at 04:45:16AM +0000, Jon Mason wrote:
> > >> On Tue, Apr 2, 2019 at 6:41 AM Mark Hatle <mark.hatle@windriver.com> wrote:
> > >>> On 4/1/19 6:20 PM, akuster808 wrote:
> > >>>>
> > >>>> On 4/1/19 4:02 PM, Richard Purdie wrote:
> > >>>>> On Mon, 2019-04-01 at 15:33 -0700, akuster808 wrote:
> > >>>>>> Hello,
> > >>>>>>
> > >>>>>> I have noticed a large number of git commits with no header
> > >>>>>> information being accepted.
> > >>>>> Can you be more specific about what "no header information" means? You
> > >>>>> mean a shortlog and no full log message?
> > >>>> Commits with just a "subject" and signoff. No additional information
> > >>> If you can convey the reason for the change in just the subject, that is
> > >>> acceptable.. but there is -always- supposed to be a signed-off-by line according
> > >>> to our guidelines.
> > >>>
> > >>> So if you see this, I think we need to step back and figure out where and why
> > >>> it's happening and get it resolved in the future.
> > >>>
> > >>> (Places I've seen in the past were one-off mistakes and clearly that -- so it
> > >>> wasn't anything that we needed to work on a correction.)
> > >>>
> > >>> --Mark
> > >>>
> > >>>> We tend to reference back to how the kernel does things.
> > >>>>
> > >>>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> > >>>> These two sections in particular.
> > >>>>
> > >>>>
> > >>>>     2) Describe your changes
> > >>>>
> > >>>> Describe your problem. Whether your patch is a one-line bug fix or 5000 lines of
> > >>>> a new feature, there must be an underlying problem that motivated you to do this
> > >>>> work. Convince the reviewer that there is a problem worth fixing and that it
> > >>>> makes sense for them to read past the first paragraph.
> > >>>>
> > >>>>
> > >>>> along with this section.
> > >>>>
> > >>>>
> > >>>>     14) The canonical patch format
> > >>>>
> > >>>> This section describes how the patch itself should be formatted. Note that, if
> > >>>> you have your patches stored in a |git| repository, proper patch formatting can
> > >>>> be had with |git format-patch|. The tools cannot create the necessary text,
> > >>>> though, so read the instructions below anyway.
> > >>>>
> > >>>> The canonical patch subject line is:
> > >>>>
> > >>>> Subject: [PATCH 001/123] subsystem: summary phrase
> > >>>>
> > >>>> The canonical patch message body contains the following:
> > >>>>
> > >>>>       * A |from| line specifying the patch author, followed by an empty line
> > >>>>         (only needed if the person sending the patch is not the author).
> > >>>>       * The body of the explanation, line wrapped at 75 columns, which will be
> > >>>>         copied to the permanent changelog to describe this patch.
> > >>>>       * An empty line.
> > >>>>       * The |Signed-off-by:| lines, described above, which will also go in the
> > >>>>         changelog.
> > >>>>       * A marker line containing simply |---|.
> > >>>>       * Any additional comments not suitable for the changelog.
> > >>>>       * The actual patch (|diff| output).
> > >>>>
> > >>>>
> > >>>>     - Armin
> > >> There are existing git hooks that can be used to detect and fail to
> > >> merge patches like this.  For Linux, I have the following in
> > >> .git/hooks/pre-commit
> > >> #!/bin/sh
> > >> exec git diff --cached | scripts/checkpatch.pl -
> > > FWIW, over in U-Boot land I do:
> > > ./scripts/checkpatch.pl -q --git origin/master..
> > > as part of checking things prior to pushing to master.
> > Having hooks is fine but after the fact. It puts the burden back on the
> > Layer maintainer to resolve. If we think more info is better, it needs
> > to happen at time of change submittal.
>
> Note that I'm not talking about a hook, I'm talking about what's part of
> my CI process.  And when something pops up there is when I grab the
> patch in question and push back on the submitter.

Exactly!  I do the same things for the Linux stuff I own.  I'll do a
git-am, then redir the output and publicly shame them.  Public shaming
is a vastly underrated method of behavior modification.

Thanks,
Jon

>
> --
> Tom

