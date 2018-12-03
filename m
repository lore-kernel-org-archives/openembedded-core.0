Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id D4BE66BBEE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 22:22:57 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id o19so12036978itg.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 14:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=GXrayi059rDd4oZ1dP1GzVsqeZWs/9qjZlNU9jV8tT8=;
	b=M0ixpTGlbvE7EaXJjgxiwIelOUikF4Gv6bN6kO1311mlp5d239FytBkqzXG3BQqOx3
	bLjZOPuR8u6lxk+skVJz903dFFfcOWVfuOQ5HMgGJM3A1hd7DMmyoCQyGn9o4x6sbUkv
	nRumv1hPGXzibTbWUkgvUDtROEc3AOYNu2oDfYtRZZ/OCHMhelTOPsRNAKu3Z7+exu0v
	HN4liD1jd9hp7GUn2wFJ3KXFvBjdYrmlkDclus6l6LaXCOcdJlF48LKOXS2XdE141z9Y
	vH+VIrGXuYhOEdBvzFh9Fbt7DZvhxxWND4LM0CBpGjGrf6AQB+fdffE89dsgHR9jFIwN
	MpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=GXrayi059rDd4oZ1dP1GzVsqeZWs/9qjZlNU9jV8tT8=;
	b=KdrSyK9BpkJoCPZ9FhW396wwrt5G4REL+3qclFmVmRij/aDMFCPSfjPSKcM3Z1mUiR
	78jAFDRipOc2YkdTKrWFTxx5dR9fBYIxrekYgEJsz9bwq29P0Etj4U5cCNnpX0oyTMHG
	0a9YqpwhIGtY2aNSpghVOwst6dmVaflHEy8PK2yB3YRTpK6epazpSa4QyxfsALUnKJJZ
	SKBmRT4CcCumjnBJ5+UASz1Ra0ucCgf/mQuHKYuEkuB6hT4MkViy0CmObs1BZNr00F9B
	je5Uq2Mf8x9jHhGJtXdhkpu1eeYm2r2hU3jkxkzMIYV2GlIZyoKNR73Ckc+HyDywJCQZ
	JfEQ==
X-Gm-Message-State: AA+aEWZjDRbcpCca/IgOV335aLrUT7apzG6PNa0tw+lYeUEjrm9DvxJD
	MYeFKATLRq38zAa2FzWdAg0=
X-Google-Smtp-Source: AFSGD/U2//saWOOTzbWMUznpztlK+DGIpw6oYAdMBHxxxl61Nf+zQgdWvYnfVwYCjjtqwBWKY+01Vw==
X-Received: by 2002:a05:660c:283:: with SMTP id
	s3mr9863652itl.135.1543875778716; 
	Mon, 03 Dec 2018 14:22:58 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	r21sm6008449ioc.18.2018.12.03.14.22.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Dec 2018 14:22:57 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <6db30983a3c00e0f09854ad7b1b1d51ff458f66c.camel@gmail.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, Khem Raj
	<raj.khem@gmail.com>
Date: Mon, 03 Dec 2018 16:22:56 -0600
In-Reply-To: <CALbNGRT1=wNg2DrGYT8xq2gCVU4jgaF91Ex0ea56on7SfVvBFw@mail.gmail.com>
References: <20181130215537.29981-1-JPEWhacker@gmail.com>
	<20181201030142.9385-1-JPEWhacker@gmail.com>
	<c492b503-696b-9cad-0f69-9bd9129a6e14@gmail.com>
	<CAMKF1soDs+MZ3G5e2_MDvO2r+bPy+ofLn5UEEvUQ3jcteU=Y3A@mail.gmail.com>
	<CALbNGRT1=wNg2DrGYT8xq2gCVU4jgaF91Ex0ea56on7SfVvBFw@mail.gmail.com>
User-Agent: Evolution 3.30.1 (3.30.1-1.fc29) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] classes/waf: Fix builds when B != S
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
X-List-Received-Date: Mon, 03 Dec 2018 22:22:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-12-03 at 22:50 +0100, Andreas Müller wrote:
> On Mon, Dec 3, 2018 at 9:14 PM Khem Raj <raj.khem@gmail.com> wrote:
> > On Sat, Dec 1, 2018 at 4:09 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > Hi Joshua
> > > 
> > > There is a build failure for a2jmidid see
> > > 
> > > http://errors.yoctoproject.org/Errors/Details/202833/
> > > 
> > > Seem to be related can you validate
> > > 
> > > On 11/30/18 7:01 PM, Joshua Watt wrote:
> > > > Waf requires that the current working directory be ${S} (the
> > > > location of
> > > > the wscript) when building. Most of the time, this was true
> > > > only because
> > > > B defaults to S. However, anything that changed that behavior
> > > > (notably,
> > > > using externalsrc) would break the recipe. Remedy this by
> > > > explicitly
> > > > changing cwd to ${S} when running waf commands. As a happy side
> > > > effect,
> > > > B can be set up for "out of tree" builds to keep the source
> > > > directory
> > > > clean.
> > 
> > I have sent a workaround for a2jmidid to ml which means we can go
> > ahead with this change in OE-Core
> > 
> > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > ---
> > > >   meta/classes/waf.bbclass | 8 +++++---
> > > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/meta/classes/waf.bbclass
> > > > b/meta/classes/waf.bbclass
> > > > index 19e93761b39..8e6d754c299 100644
> > > > --- a/meta/classes/waf.bbclass
> > > > +++ b/meta/classes/waf.bbclass
> > > > @@ -1,6 +1,8 @@
> > > >   # avoids build breaks when using no-static-libs.inc
> > > >   DISABLE_STATIC = ""
> > > > 
> > > > +B = "${WORKDIR}/build"
> > > > +
> > > >   EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
> > > > 
> > > >   python waf_preconfigure() {
> > > > @@ -22,16 +24,16 @@ python waf_preconfigure() {
> > > >   do_configure[prefuncs] += "waf_preconfigure"
> > > > 
> > > >   waf_do_configure() {
> > > > -     ${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF}
> > > > ${EXTRA_OECONF}
> > > > +     (cd ${S} && ./waf configure -o ${B} --prefix=${prefix}
> > > > ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
> > > >   }
> > > > 
> > > >   do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
> > > >   waf_do_compile()  {
> > > > -     ${S}/waf build ${@oe.utils.parallel_make_argument(d, '-
> > > > j%d', limit=64)}
> > > > +     (cd ${S} && ./waf build ${@oe.utils.parallel_make_argumen
> > > > t(d, '-j%d', limit=64)})
> > > >   }
> > > > 
> > > >   waf_do_install() {
> > > > -     ${S}/waf install --destdir=${D}
> > > > +     (cd ${S} && ./waf install --destdir=${D})
> > > >   }
> > > > 
> > > >   EXPORT_FUNCTIONS do_configure do_compile do_install
> > > > 
> > --
> Hmm - the a2jmidid shows what's going to happen: All packets shipping
> older waf need workaround hacks. This should not be the way to go
> because then we can remove waf.bbclass entirely.

Yes, that might actually be the most "waf" answer to that problem...
for better or worse waf is designed to be fully self contained, so
having a "standard" class that builds it is somewhat problematic. Waf
itself could change at any time and render the canned configuration
useless. This doesn't really affect any of the projects using waf
because they usually just download (or build) the latest when they
start development and don't upgrade (or do so infrequently).

The other option that I've though about (not that I really like it) is
to have some sort of WAF_VERSION variable that waf.bbclass keys off of
to detect what support is available. However, even this isn't fool
proof because of add-in modules that you can choose to build into your
project's version of waf... these can basically do whatever you want
including adding new command line arguments, and adding or modifying
existing behaviors. I'm not in favor of going down the road of making
variables like WAF_HAS_GNU_DIRS_PLUGIN that each project has to
configure.

OTOH, as long as the projects we are building with waf currently use a
new enough version (I know 1.7 works and 1.4 is broken), our current
bbclass works and maybe that's "good enough" for now?

I'm open to suggestions.


> 
> Andreas
-- 
Joshua Watt <JPEWhacker@gmail.com>


