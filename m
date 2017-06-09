Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1145578299
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 14:11:58 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id x129so1686388ite.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 07:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=odymhwd91nBfuy1fgGaAKih8pHwSZo+cO1kvH/KyZRc=;
	b=k0ewjE9cqgkIV/jYElBdpiqWHRIDioqu3sFtPyeA/4ZdTBY/OUOzmgk+RKXf/B+uz9
	zq8L87auPIBUPpqobIQTbvVDKJ9KehK96pfUpIb19Lna3KolOrJUouB/bQRVBWPQ69HJ
	kJ6yMhVrrTwAqAVSEEoKawmxY7vK8RkHyNOWWE2iRCcitWJkinngTKNaPEwqjV1VyOp+
	pBOxSm5bK4pdUFmP2/MLoMz+STbMmu8cTOAOGBwH/yt6ZdcZaXGK2cmKFLrRUy2FXsci
	Zfo0I9yYSWyO+icFiTthh2O18cIiVo7qVGBieM8VE8pUXQFLDwZ5Lj8d7/jxlPgcM7hr
	1txQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=odymhwd91nBfuy1fgGaAKih8pHwSZo+cO1kvH/KyZRc=;
	b=YYdu8Y/mggdqKdy8S3vb8A+zQ5xFZUTqDYW3zMZKb6srH3Sc2yWYNoGNsW2KEBSRIx
	jIVbAjP11gQ8jESMZHs+A5us891iLnszFbMHggSsT1vDnRfFd2WihwM4PKFu6iutivFS
	ooEgcd2/ng/bMwxxq1Y1BvuBAQ5F5bCgwk0Bw40Is4L2jpQTGr3yaiqVPRWJWUxopKwX
	WATIIGksmYkHKxz0QK++R2/IxIdhOXJK3lsVVjhIj5/lrVXqU7GlBKIb0qQ2oPakTiBi
	IV6FBC+sYAJ2VA9PpF55CbKrWicvCOGDXEEefCy2FTlYnlJtXsJjRGS1jOd5Fel26f4m
	SVXQ==
X-Gm-Message-State: AODbwcBRnDT/r+jQ2D5yfnqlhUeLDi2+x9eezsH8ZodB2qQLrKULT8DW
	flL3+eR1wCrKPXoN
X-Received: by 10.36.39.3 with SMTP id g3mr10745539ita.8.1497017519929;
	Fri, 09 Jun 2017 07:11:59 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C0DE.dip0.t-ipconnect.de. [93.232.192.222])
	by smtp.gmail.com with ESMTPSA id l19sm497301ioe.3.2017.06.09.07.11.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 07:11:58 -0700 (PDT)
Message-ID: <1497017515.30163.193.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 09 Jun 2017 16:11:55 +0200
In-Reply-To: <1497016077.3131.5.camel@gmail.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<1496850184.21235.1.camel@gmail.com>
	<1496912216.6630.225.camel@linuxfoundation.org>
	<1496930142.8427.2.camel@gmail.com>
	<1496932400.6630.250.camel@linuxfoundation.org>
	<1496935714.8427.7.camel@gmail.com>
	<1496950316.30163.152.camel@intel.com>
	<1496995960.30163.175.camel@intel.com>
	<1497016077.3131.5.camel@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Yocto Compatible 2.0 support code
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
X-List-Received-Date: Fri, 09 Jun 2017 14:11:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-09 at 08:47 -0500, Joshua Watt wrote:
> On Fri, 2017-06-09 at 10:12 +0200, Patrick Ohly wrote:
> > On Thu, 2017-06-08 at 21:31 +0200, Patrick Ohly wrote:
> > > On Thu, 2017-06-08 at 10:28 -0500, Joshua Watt wrote:
> > > > Sure. I wouldn't suggest using an if statement for "just
> > > > anything", you
> > > > can surely do terrible things that way. It would (by convention)
> > > > be
> > > > restricted to the same sorts of things that the conditional
> > > > includes
> > > > allow now. On a similar token, you can do the same sorts of
> > > > terrible
> > > > things with conditional includes as currently proposed because it
> > > > has
> > > > the same enforcement policy (i.e. "by convention").
> > > 
> > > I'm starting to wonder whether this "convention" can be
> > > strengthened
> > > with additional warnings. The code which currently evaluates the
> > > include
> > > parameter could record in the datastore the original expression and
> > > what
> > > it evaluated to, then later when the recipe gets finalized, an
> > > event
> > > handler can check whether evaluating the expression still gives the
> > > same
> > > result.
> > 
> > Below is a quick-and-dirty proof of concept. Example bmap-tools_
> > %.bbappend:
> > 
> >         FOO = "bmap-tools-deploy.inc"
> >         require ${FOO}
> >         FOO = ""
> > 
> > Example warning:
> > 
> > WARNING: .../bmap-tools/bmap-tools_3.2.bb: .../bmap-
> > tools_%.bbappend:2: include/require/inherit "${FOO}" resulted in
> > including "bmap-tools-deploy.inc" while parsing. Variables effecting
> > the parameter changed later such that nothing would have been
> > included at the end of the recipe.
> 
> I like it. The error message could maybe use a little bit of work...
> Maybe it needs some sort of short and unique key words in it, like
> "conditional invariance violation" to help direct people who copy the
> error into google when looking for an answer (or slightly better, grep
> the Mega Manual).

When doing it as sanity.bbclass check it would have a short ID string.

> > Should this warning be entirely in bitbake or should it become part
> > of
> > OE's sanity.bbclass? The latter would have the advantage that it
> > could
> > be configured as fatal error. The downside is that bitbake needs to
> > export data, which implies adding a semi-stable API.
> 
> A fatal error would be nice.... anything that was 2.0 compatible should
> be fatal, but I don't know if you would want it to make it fatal for
> non-2.0 compatible (i.e. existing) layers, as it might break some
> existing uses (or maybe we don't care about that?).

It's independent of Yocto Compatible 2.0. The image type inheritance
issue I mentioned is a basic usability problem, and this TARGET_SYS
dependency looks like a genuine bug to me.

> > Do we want some suppression mechanism? Something like:
> > 
> > require ${PARSE_TIME_EVALUATION}${FOO}
> > 
> > where PARSE_TIME_EVALUATION is unset, but can be checked for in the
> > code
> > that normally would print the warning?
> 
> Is there a currently known valid use for such a thing?

Using LAYERDIR is one, although that particular example is probably
better caught by looking for that particular variable instead of
annotating all places where it gets used.

I'm unsure whether there are valid uses. I'm just worried that by the
time someone shows up with one, it will be too late to add a suppression
mechanism (as in "I've just updated from 2.3 to 2.4, how do I disable
this warning?").

>  I'd just as soon
> add it once we know it is needed (otherwise, the top search result for
> "conditional invariance violation" will end up being some blog that
> says "Just prefix it with ${PARSE_TIME_EVALUATION} and everything will
> be fine" :)

I would add such an explanation to the error message itself and warn
about using it, then hopefully no-one writes such stupid blog posts ;-}

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




