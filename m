Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0057ED44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:03:44 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so15139947wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=dc75lErr2J/nUCNiZgRB7PAUZ6UabZarXwhx901ojIA=;
	b=TaslyFHlwNlQh7EU53IIUs0epmwKzeq9aGetUXLMPg6f+i5tMYVqTL0fFDw1tqGzJ3
	ARuyjK+4gtD6ltRnniJVtMnE453XYzDrHT+fKTzQho+tyS5qlu04VKt+Z2J/gmLN67c1
	MTor3pu+Wigu6ENqaCQJJXuZgJL4a/rxv1nzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=dc75lErr2J/nUCNiZgRB7PAUZ6UabZarXwhx901ojIA=;
	b=uN0qObAzjmt8sX3fzoTvif9v4XWJrKvYhR/h/4feFk8yHn3l4oWFdiIhaYXx+JkLX9
	MRVNeLVAlwYP+oDULxDBDkgMv0RD0Wp4sowKIul6eXziVI2nXKJgezyAPWnzMhkPjSY1
	kB7KcytesUSAPSRvUAI3DFbwVsI8geq1T1BW+jeemfYITHQEIlGPSDYrA7xnfDDn7p+d
	hI+Njum8LB0isoxWkdNYc+0EUjXnu7Of2gVgWCjy7qya0TT65ybbzdVQNj1WarSMjcJV
	VhPOD0r9BgU1rAWDJ9geF6fogLP24rGkPxRfZkrhhA4vj6Gj05islmgI2yBsg9hLQpSd
	CHGg==
X-Gm-Message-State: APjAAAXp75pKFj5ntsy87wExYuegS2D7fsBSMpVukQ9Ga578DgGFQpYq
	5iJ/cAJuZipnq9BRL3BpozZssIWbuRo=
X-Google-Smtp-Source: APXvYqwEA86GiKvH4WY6+2MSMTmay2y6z5KVVgv1F2VPYbAICyvj28ATOtgzXaAyfggFlA5P+789SQ==
X-Received: by 2002:a05:600c:254b:: with SMTP id
	e11mr23002810wma.171.1563195825726; 
	Mon, 15 Jul 2019 06:03:45 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g12sm23259132wrv.9.2019.07.15.06.03.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 15 Jul 2019 06:03:44 -0700 (PDT)
Message-ID: <cf30422888b7622672180b2cbfaebab58889dcfb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2019 14:03:43 +0100
In-Reply-To: <75459a751fccd43086ea4917ae2b542092cac03e.camel@ew.tq-group.com>
References: <20190710121353.32717-1-matthias.schiffer@ew.tq-group.com>
	<20190710123132.2332.61175@do>
	<714432f19e29fc660170d05ff3907ff2e40b1e95.camel@ew.tq-group.com>
	<75459a751fccd43086ea4917ae2b542092cac03e.camel@ew.tq-group.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHN5c3RlbWQ6IGJhY2twb3J0IHBhdGNoIHRvIGZpeCBzeXNjdGwgd2FybmluZyBvbiBib290?=
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
X-List-Received-Date: Mon, 15 Jul 2019 13:03:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-07-15 at 11:53 +0200, Matthias Schiffer wrote:
> On Wed, 2019-07-10 at 14:40 +0200, Matthias Schiffer wrote:
> > On Wed, 2019-07-10 at 12:31 +0000, Patchwork wrote:
> > > * Issue             Series cannot be parsed correctly due to
> > > malformed diff lines [test_mbox_format] 
> > >   Suggested fix    Create the series again using git-format-patch
> > > and
> > > ensure it can be applied using git am
> > >   Diff line        Hunk is shorter than expected
> > > 
> > > * Issue             Series does not apply on top of target branch
> > > [test_series_merge_on_head] 
> > >   Suggested fix    Rebase your series on top of targeted branch
> > >   Targeted branch  master (currently at 4cbb7392c7)
> > 
> > I'm not sure what is going on here, the patch applies fine for me.
> > 
> > Is it possible that the patchtest stumbles over unicode characters
> > in
> > the added patch file? I don't see how that could be avoided, as the
> > patch touches a line where an emoji was used in a comment...
> > 
> > Kind regards,
> > Matthias
> 
> Ah, the issue is patchwork, not patchtest - the mbox download is cut
> off at the non-ASCII character. Should I try resending the patch with
> something like --transfer-encoding=quoted-printable ?

I've queued the patch for testing, the patch itself applies fine so we
can handle it, it just doesn't get the automated testing.

Cheers,

Richard


