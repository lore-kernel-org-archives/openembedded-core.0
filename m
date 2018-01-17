Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 500077197B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:40:03 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id l17so8985912ioc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 16:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2dTrAS3wHYi4xo7vlbLkFWxUXQCJ2DD40RlSvtzrfF4=;
	b=K/mKdQQwbZs+IOTorRXY/yY3ESaELFYFip7PDmb294al/Oo59wyLF1o9M/VOJA2Rg+
	YdbfwW7Xj1sUJ/GPTWnSICp/75tEYtz3EumB300GwKKUbVmNoZ2PXfFu0NL6rx/7HxGf
	eexe9dr0geeTytBVWiC5IGnu9dHbiZFlHMf+qQnYY23orX+VIjE2PDBNvroTdT4VOeul
	ZPx0lQUz1KGl5ussuv+hbr3iTc2mJmmNltehx0xjlQpo2ogEVK5RHb56MTfzRzZ8P7GO
	s38VSOK/KnwZuFBZaZR0GMfCx7b97uGZo/sx00daD3aVtGJvYoD+xEMbnqxQRoGeKqit
	4JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2dTrAS3wHYi4xo7vlbLkFWxUXQCJ2DD40RlSvtzrfF4=;
	b=WL9/feICNUMwnusMOzb05SQ0mn6U3nnLbAI9Dou/O+AGncgXix585NiGfgmpSiu7xP
	yx0osHfNISvfjdFmf+p4bF0bggt57u63kkLanRX0eA+y+u7ihiHABZd+orHhLAbB2cGJ
	jw6N+KkHnhF1MdyTk3nidz/dETodw+MA2mHSByMbZp9+vae9urBPsQZb4cFIooC8EdLc
	Scx4nk8nMJMS7UE+ucjUmpExr5f9oQVNn1mYbNOrT8tkKjq7jBKrvC2f4JJPRL/sS5Zf
	YYTeFbXjgUnXy+KtjM64RzWsaTUi+GpjJH8ebAa8a/i0Q2xZbXSu7D0QPm6b5o4T/Xa4
	zNUg==
X-Gm-Message-State: AKGB3mLTIfw6ZRUXwrF/alFVdV6S6r50JsPzk07x7qcMhLXyIqDWpqUs
	PPWWVqsFc9a+sZobtOZgG+g=
X-Google-Smtp-Source: ACJfBovFjS8mJ/SOO0I/IlyV3JH2cHmL9hiwd3sIInB4hYTO/alKYtjxHqUV4u7t/Q5Zby7WSAI6Jg==
X-Received: by 10.107.146.137 with SMTP id u131mr38222900iod.3.1516149605277; 
	Tue, 16 Jan 2018 16:40:05 -0800 (PST)
Received: from farscape ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.googlemail.com with ESMTPSA id
	o71sm1727891ite.10.2018.01.16.16.40.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Jan 2018 16:40:04 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1516149600.18676.8.camel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Stefan Stanacar
	<sstncr@gmail.com>,  "Eggleton, Paul" <paul.eggleton@intel.com>
Date: Tue, 16 Jan 2018 18:40:00 -0600
In-Reply-To: <1515926585.29722.206.camel@linuxfoundation.org>
References: <20180112162442.8524-1-JPEWhacker@gmail.com>
	<1515926585.29722.206.camel@linuxfoundation.org>
X-Mailer: Evolution 3.26.3 (3.26.3-1.fc27) 
Mime-Version: 1.0
Subject: Re: [PATCH] classes/externalsrc: Don't delete tasks
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
X-List-Received-Date: Wed, 17 Jan 2018 00:40:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-01-14 at 10:43 +0000, Richard Purdie wrote:
> On Fri, 2018-01-12 at 10:24 -0600, Joshua Watt wrote:
> > Set the noexec flag to prevent tasks from executing instead of
> > deleting
> > them. This allows inter-tasks dependencies on these tasks to still
> > function. For example, perf has the line:
> > 
> >  do_populate_lic[depends] += "virtual/kernel:do_patch"
> > 
> > which will break if the kernel uses EXTERNALSRC and the do_patch
> > task
> > is deleted.
> > 
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes/externalsrc.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/externalsrc.bbclass
> > b/meta/classes/externalsrc.bbclass
> > index 65dd13ddc1f..12046d74e17 100644
> > --- a/meta/classes/externalsrc.bbclass
> > +++ b/meta/classes/externalsrc.bbclass
> > @@ -102,7 +102,7 @@ python () {
> >          for task in d.getVar("SRCTREECOVEREDTASKS").split():
> >              if local_srcuri and task in fetch_tasks:
> >                  continue
> > -            bb.build.deltask(task, d)
> > +            d.setVarFlag(task, 'noexec', '1')
> >  
> >          d.prependVarFlag('do_compile', 'prefuncs',
> > "externalsrc_compile_prefunc ")
> >          d.prependVarFlag('do_configure', 'prefuncs',
> > "externalsrc_configure_prefunc ")
> 
> There are a few things I worry about with this:
> 
> a) Its confusing for users as it will now show a fetch/unpack/patch
> task as part of the dependency tree but they won't actually run.
> 
> b) Dependencies for those tasks will be followed
> 
> c) There has always been a bit of ambiguity about what should happen
> with task properties like cleandirs, dirs and others. Whilst these
> don't run for noexec, I have worries that somehow we'll end up wiping
> out the external source dir accidentally (e.g. with do_clean). I
> think
> the noexec move makes this more likely, sadly.
> 
> externalsrc started out as a 30 line class back in 2012 and its now
> 235
> lines and getting ridiculously complicated.
> 
> I'm starting to wonder if we should change the approach and have it
> modify SRC_URI and take a copy of the source. Yes, it'd be
> fractionally
> slower but its getting far too complex trying to handle all the
> corner
> cases. It was meant so developers could quickly hack/test things and
> its turning into a full development tool/workflow.

Ya, that seems reasonable. I think the tricky part is getting the data
copied over in such a way that incremental builds still work (which is
99% of the time the reason I use externalsrc), since some build systems
actually care about the timestamps. Hmmm.... maybe something with rsync
would work.... although, it would be a bit of a strange host tool
dependency. 

> 
> I think we do need to take a step back and try and come up with a way
> to simplify it...
> 
> We should also think about whether there are changes to the core
> which
> would make things like this easier. I do have a fairly strong belief
> that we should make the system more robust and able to handle tasks
> being missing, its now a lot better at handling that than it used to
> be. Chris as talked about a "srcready" type task and reworking the
> fetch/unpack/patch process  and I can see the reasoning for that, it
> would help here too.

Another idea I had (dunno if it is actually *good*): perhaps using
EXTERNALSRC should add some thing to OVERRIDES when it is enabled? That
way at least the corner cases can be codified close to the code they
modify instead of having to live generically in externalsrc.bbclass

> 
> Not sure whether Paul has any thoughts on this as externalsrc will
> significantly impact devtool too...

I don't use devtool much, but I do use externalsrc all the time. If I
get a bit of down time, I might try to take a look at it.

> 
> Cheers,
> 
> Richard
> 
> 
> 
> 

