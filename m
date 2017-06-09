Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3DFA678299
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:47:57 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id m47so137353209iti.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 06:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jdGeNkiMgWnV9DrheYdPTkHxeIT2dYOFWQU0Sen7z/A=;
	b=W5ZShe8TEMz8TqZeAtuxAW1qAWO+X1nxAkLcY4jP7Lcgr8J2tZ8u8YJXTucNYh1Ur3
	Nk8MM9EsBNud+WMOAgaHS5DzToD6MjDWzDr1EURUQ6w033hYHp7fvGJ6VxSoE40Trocz
	mts1fxYls3I379YQoA81497l2kToDbFEMJUBIsbX8YR3aBIutdZjQ01fUZDETW+xs2d9
	FQ+szan0AP+ppgE/28P8Hsl1jA28IPV2FSP2CDsBxBjaNZlAyereZcETUEbQ4TUv+1uZ
	9lhPRZWZ4HqoSnOxHdGfmMST5wh+Pw1FycVuFgzCIuKrnDZF0cGq3HH/eLsKFjBMqY1y
	dWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jdGeNkiMgWnV9DrheYdPTkHxeIT2dYOFWQU0Sen7z/A=;
	b=SpbQTDBe3kQRMde522a/K6AFgST6Juy7QJU7UWMmQ5j7P+qhch3FVsWu1RQbTsolyX
	XbodhZY8kR0zuQKTPcQHW3dal4HkUb9/cWxzzF/5RmE0jVTS0lUXwXiTJZwEKxft3mM6
	OcfTOazAOVsNKcIy7i7+nM2dbyc3aDCXBPYZwYgb3+7Lf+NbccARYbRezE+4Wmrggigo
	uag4eezShrQeWELxcocx/jQ64c/1nxTOtYJuOllB9utjwP3JexF9Mq+GiuYxWp5nEwio
	yd2f+y0b0Q6akzDbNVXIiqv0bsNhLdPC6lpSskIMjfxnd8DMwCE8pgwEIWC5m/ItE4ai
	/Abg==
X-Gm-Message-State: AODbwcC7cWABegRuR7mWSfg8UUUFvsqMSAUsmg6iJxgkVZFK5TyWlKZr
	8Vwz15D6n+Z+KD0Lpfs=
X-Received: by 10.36.80.18 with SMTP id m18mr10926216itb.49.1497016078961;
	Fri, 09 Jun 2017 06:47:58 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	v13sm665592ita.28.2017.06.09.06.47.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Jun 2017 06:47:58 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1497016077.3131.5.camel@gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Fri, 09 Jun 2017 08:47:57 -0500
In-Reply-To: <1496995960.30163.175.camel@intel.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<1496850184.21235.1.camel@gmail.com>
	<1496912216.6630.225.camel@linuxfoundation.org>
	<1496930142.8427.2.camel@gmail.com>
	<1496932400.6630.250.camel@linuxfoundation.org>
	<1496935714.8427.7.camel@gmail.com>
	<1496950316.30163.152.camel@intel.com>
	<1496995960.30163.175.camel@intel.com>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
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
X-List-Received-Date: Fri, 09 Jun 2017 13:47:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-06-09 at 10:12 +0200, Patrick Ohly wrote:
> On Thu, 2017-06-08 at 21:31 +0200, Patrick Ohly wrote:
> > On Thu, 2017-06-08 at 10:28 -0500, Joshua Watt wrote:
> > > Sure. I wouldn't suggest using an if statement for "just
> > > anything", you
> > > can surely do terrible things that way. It would (by convention)
> > > be
> > > restricted to the same sorts of things that the conditional
> > > includes
> > > allow now. On a similar token, you can do the same sorts of
> > > terrible
> > > things with conditional includes as currently proposed because it
> > > has
> > > the same enforcement policy (i.e. "by convention").
> > 
> > I'm starting to wonder whether this "convention" can be
> > strengthened
> > with additional warnings. The code which currently evaluates the
> > include
> > parameter could record in the datastore the original expression and
> > what
> > it evaluated to, then later when the recipe gets finalized, an
> > event
> > handler can check whether evaluating the expression still gives the
> > same
> > result.
> 
> Below is a quick-and-dirty proof of concept. Example bmap-tools_
> %.bbappend:
> 
>         FOO = "bmap-tools-deploy.inc"
>         require ${FOO}
>         FOO = ""
> 
> Example warning:
> 
> WARNING: .../bmap-tools/bmap-tools_3.2.bb: .../bmap-
> tools_%.bbappend:2: include/require/inherit "${FOO}" resulted in
> including "bmap-tools-deploy.inc" while parsing. Variables effecting
> the parameter changed later such that nothing would have been
> included at the end of the recipe.

I like it. The error message could maybe use a little bit of work...
Maybe it needs some sort of short and unique key words in it, like
"conditional invariance violation" to help direct people who copy the
error into google when looking for an answer (or slightly better, grep
the Mega Manual).

> 
> I found one false positive (LAYERDIR is set during parsing and unset
> afterwards) which the code below filters out. 
> 
> I also get for all recipes (i.e. the error is in the base
> configuration):
> 
> meta/conf/bitbake.conf:752: include/require/inherit
> "conf/target/${TARGET_SYS}.conf" resulted in including
> "conf/target/x86_64-oe-linux.conf" while parsing. Variables effecting
> the parameter changed later such that "conf/target/x86_64-refkit-
> linux.conf" would have been included at the end of the recipe.
> 
> None of these two files exist, so it doesn't make a difference. But
> is
> it really intended that a conf/target/${TARGET_SYS}.conf gets
> included
> that isn't the one for the final TARGET_SYS? That looks like a
> genuine
> bug to me.
> 
> TARGET_SYS changes because TARGET_VENDOR gets set by the
> ${DISTRO}.conf,
> which gets included later.
> 
> If we agree that such a message is useful, should it get added after
> merging the proposed bitbake enhancements or together with them?
> Doing
> it properly implies adding tests, and I do not have the time for that
> now. I'd prefer to add the proposed patches first so that they can be
> used, then add the warning before 2.4 gets released.
> 
> Should this warning be entirely in bitbake or should it become part
> of
> OE's sanity.bbclass? The latter would have the advantage that it
> could
> be configured as fatal error. The downside is that bitbake needs to
> export data, which implies adding a semi-stable API.

A fatal error would be nice.... anything that was 2.0 compatible should
be fatal, but I don't know if you would want it to make it fatal for
non-2.0 compatible (i.e. existing) layers, as it might break some
existing uses (or maybe we don't care about that?).


> 
> Do we want some suppression mechanism? Something like:
> 
> require ${PARSE_TIME_EVALUATION}${FOO}
> 
> where PARSE_TIME_EVALUATION is unset, but can be checked for in the
> code
> that normally would print the warning?

Is there a currently known valid use for such a thing? I'd just as soon
add it once we know it is needed (otherwise, the top search result for
"conditional invariance violation" will end up being some blog that
says "Just prefix it with ${PARSE_TIME_EVALUATION} and everything will
be fine" :)


> 
> diff --git a/lib/bb/parse/ast.py b/lib/bb/parse/ast.py
> index dba4540f5eb..91db56197f0 100644
> --- a/lib/bb/parse/ast.py
> +++ b/lib/bb/parse/ast.py
> @@ -50,14 +50,13 @@ class IncludeNode(AstNode):
>          """
>          Include the file and evaluate the statements
>          """
> -        s = data.expand(self.what_file)
> -        logger.debug(2, "CONF %s:%s: including %s", self.filename,
> self.lineno, s)
> +        logger.debug(2, "CONF %s:%s: including %s = %s",
> self.filename, self.lineno, self.what_file,
> data.expand(self.what_file))
>  
>          # TODO: Cache those includes... maybe not here though
>          if self.force:
> -            bb.parse.ConfHandler.include(self.filename, s,
> self.lineno, data, "include required")
> +            bb.parse.ConfHandler.include(self.filename,
> self.what_file, self.lineno, data, "include required")
>          else:
> -            bb.parse.ConfHandler.include(self.filename, s,
> self.lineno, data, False)
> +            bb.parse.ConfHandler.include(self.filename,
> self.what_file, self.lineno, data, False)
>  
>  class ExportNode(AstNode):
>      def __init__(self, filename, lineno, var):
> @@ -362,6 +361,18 @@ def finalize(fn, d, variant = None):
>  
>      d.setVar('BBINCLUDED', bb.parse.get_file_depends(d))
>  
> +    parse_expansions = d.getVar('_PARSE_TIME_EXPANSIONS')
> +    if parse_expansions:
> +        def fns_name(fns):
> +            if fns:
> +                return '"%s"' % fns
> +            else:
> +                return 'nothing'
> +        for parentfn, lineno, fns_unexpanded, fns in
> parse_expansions:
> +            current_fns = d.expand(fns_unexpanded)
> +            if fns != current_fns and '${LAYERDIR}' not in
> current_fns:
> +                logger.warning('%s:%d: include/require/inherit "%s"
> resulted in including %s while parsing. Variables effecting the
> parameter changed later such that %s would have been included at the
> end of the recipe.' % (parentfn, lineno, fns_unexpanded,
> fns_name(fns), fns_name(current_fns)))
> +
>      bb.event.fire(bb.event.RecipeParsed(fn), d)
>      bb.event.set_handlers(saved_handlers)
>  
> diff --git a/lib/bb/parse/parse_py/BBHandler.py
> b/lib/bb/parse/parse_py/BBHandler.py
> index fe918a41f34..923d210a3e8 100644
> --- a/lib/bb/parse/parse_py/BBHandler.py
> +++ b/lib/bb/parse/parse_py/BBHandler.py
> @@ -61,6 +61,7 @@ def supports(fn, d):
>  def inherit(files, fn, lineno, d):
>      __inherit_cache = d.getVar('__inherit_cache', False) or []
>      files = d.expand(files).split()
> +    # TODO: remember expansion result
>      for file in files:
>          if not os.path.isabs(file) and not
> file.endswith(".bbclass"):
>              file = os.path.join('classes', '%s.bbclass' % file)
> diff --git a/lib/bb/parse/parse_py/ConfHandler.py
> b/lib/bb/parse/parse_py/ConfHandler.py
> index 97aa1304314..b4f0c61d256 100644
> --- a/lib/bb/parse/parse_py/ConfHandler.py
> +++ b/lib/bb/parse/parse_py/ConfHandler.py
> @@ -75,8 +75,16 @@ def include(parentfn, fns, lineno, data,
> error_out):
>      used in a ParseError that will be raised if the file to be
> included could
>      not be included. Specify False to avoid raising an error in this
> case.
>      """
> +    fns_unexpanded = fns
>      fns = data.expand(fns)
>      parentfn = data.expand(parentfn)
> +    parse_expansions = data.getVar('_PARSE_TIME_EXPANSIONS')
> +    if parse_expansions is None:
> +        parse_expansions = []
> +    parse_expansions.append((parentfn, lineno, fns_unexpanded, fns))
> +    data.setVar('_PARSE_TIME_EXPANSIONS', parse_expansions)
> +    if 'bmap-tools' in parentfn:
> +        bb.note('bmap-tools parse_expansions: %s/%s = %s' %
> (id(data), id(parse_expansions), parse_expansions))
>  
>      # "include" or "require" accept zero to n space-separated file
> names to include.
>      for fn in fns.split():
> 
> 


