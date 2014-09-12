Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id B967771368
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 10:26:31 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id i13so455990qae.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 03:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1FSWw392ge7x/h8BGNsmMT2WMH9U3mkg/Yg01DxZgFg=;
	b=BvX6S/kA3gbsaySA1XgQl3yiZAW5NwB3M1bh7aGJb+1hdkzcC/eZtq7Y3DtdcAKkXQ
	9TBCIt4hr0VPVi68VhLBW9RYJO6nfaawg5Puj0JxT7oVl1NDV4SjXwujwO3dWKvkhSH8
	p9+L45cJcrOH0jRkwd05Vom+z+hPvZTN9ITvHWKsz+8Kv9D6fTRuvg+igSiS6Zyi6xyN
	I9NEGkvP8jTT1SPFgGAFlqAw2P1QlmY70vz1KLfVvVgQi0YL5YLT0U+OrdWm+unFVFAO
	wlFXT8902owxBxUtnxxpyxqXBT6wHceAclLe5+jrJGB3FHqFdRBT7cT9nt8olo0AYG5b
	5+7g==
X-Gm-Message-State: ALoCoQn7p19cDd13iZdZyTC3uHyPQHCRgKcnd3uokpT6fxb9+vROXUCD1BZzE1HjBFuP8bNo0PD+
X-Received: by 10.140.97.247 with SMTP id m110mr10583155qge.80.1410517593149; 
	Fri, 12 Sep 2014 03:26:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 12 Sep 2014 03:26:13 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1408060743510.5032@localhost>
References: <alpine.LFD.2.11.1408060743510.5032@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Sep 2014 11:26:13 +0100
Message-ID: <CAJTo0La8kpA4--VQH+3YiiTKr9b9JBH_bmi+fM9XYsBuekK1mA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bbclass files: Fix typos/grammar in numerous .bbclass comments.
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
X-List-Received-Date: Fri, 12 Sep 2014 10:26:35 -0000
Content-Type: text/plain; charset=UTF-8

On 6 August 2014 12:51, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> Various non-functional changes to a number of .bbclass files:
>
>  * Spelling
>  * Grammar
>  * Ridiculously long lines

I was going to merge this but it doesn't apply at all against master
now, and I can't seem to find a commit from around July where it does
apply.  Do you still have this in a local branch that you could
rebase?

Cheers,
Ross

