Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5068C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 15:45:31 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.102911.1701791122429966739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 07:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S8Cowoqr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A475E1C0013;
	Tue,  5 Dec 2023 15:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701791119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpogSgkEsVmghHdN+wWpU1n5SkJv/I8df9SDBz9jqPE=;
	b=S8Cowoqr8nSDmUO6NF/+G3PXd1iMkwBAU+a2ItA875qk/JaKglZTcVhWGCIbMrk2XhJqnL
	iOrDsqfGFn3O2ev/lVQASdPAV/oSL7E1ltVTZncQ60IXP3TXp6IQAROc0UY29H4MzW3KTA
	w8QFsePaGekhCorqXW3G2hSyUEne9/5mShJ4pjoFqAIJXxC0lPS7bmhgekWz+wXp9+TKad
	slgghOLDh+K5LNlWJCNm60Ee0dc12kw41MabjR6QT8oMIO9PypVqHHXqCjbwQSW+4mR/Ty
	Fcagy35nS+e04hWV9rXZiOStV02rRKnTm3o8VCePWgaO5J4ZqbJfwuOAA+Sefw==
Date: Tue, 5 Dec 2023 16:45:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RESEND][PATCH 1/7] bitbake: utils: remove spaces on
 empty lines
Message-ID: <20231205154519437ea7da@mail.local>
References: <20231204155934.836992-1-jstephan@baylibre.com>
 <20231204155934.836992-2-jstephan@baylibre.com>
 <202312050750270cac2691@mail.local>
 <CAEHHSvb2aKwWmS50G4QZ57oaBJmdkHME01ju4Wa-Nuo+Unnz0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvb2aKwWmS50G4QZ57oaBJmdkHME01ju4Wa-Nuo+Unnz0A@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 15:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191842

On 05/12/2023 15:57:58+0100, Julien Stephan wrote:
> Le mar. 5 d�c. 2023 � 08:50, Alexandre Belloni
> <alexandre.belloni@bootlin.com> a �crit :
> >
> > Please do not send bitbake patches in the same series as oe-core patches
> > if there is no dependency. Those patches are applied on different
> > repositories.
> 
> Hi Alexandre,
> 
> Noted! Do you want me to resend the series without the bitbake patch?

No but  didn't take the bitbake patch because it doesn't do what the
commit message says. (i.e. it touches non empty lines)

> 
> Cheers
> Julien
> >
> > On 04/12/2023 16:59:28+0100, Julien Stephan wrote:
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > ---
> > >  bitbake/lib/bb/utils.py | 16 ++++++++--------
> > >  1 file changed, 8 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
> > > index b401fa5ec7a..61ffad92ce3 100644
> > > --- a/bitbake/lib/bb/utils.py
> > > +++ b/bitbake/lib/bb/utils.py
> > > @@ -50,7 +50,7 @@ def clean_context():
> > >
> > >  def get_context():
> > >      return _context
> > > -
> > > +
> > >
> > >  def set_context(ctx):
> > >      _context = ctx
> > > @@ -212,8 +212,8 @@ def explode_dep_versions2(s, *, sort=True):
> > >              inversion = True
> > >              # This list is based on behavior and supported comparisons from deb, opkg and rpm.
> > >              #
> > > -            # Even though =<, <<, ==, !=, =>, and >> may not be supported,
> > > -            # we list each possibly valid item.
> > > +            # Even though =<, <<, ==, !=, =>, and >> may not be supported,
> > > +            # we list each possibly valid item.
> > >              # The build system is responsible for validation of what it supports.
> > >              if i.startswith(('<=', '=<', '<<', '==', '!=', '>=', '=>', '>>')):
> > >                  lastcmp = i[0:2]
> > > @@ -347,7 +347,7 @@ def _print_exception(t, value, tb, realfile, text, context):
> > >          exception = traceback.format_exception_only(t, value)
> > >          error.append('Error executing a python function in %s:\n' % realfile)
> > >
> > > -        # Strip 'us' from the stack (better_exec call) unless that was where the
> > > +        # Strip 'us' from the stack (better_exec call) unless that was where the
> > >          # error came from
> > >          if tb.tb_next is not None:
> > >              tb = tb.tb_next
> > > @@ -746,9 +746,9 @@ def prunedir(topdir, ionice=False):
> > >  # but thats possibly insane and suffixes is probably going to be small
> > >  #
> > >  def prune_suffix(var, suffixes, d):
> > > -    """
> > > +    """
> > >      See if var ends with any of the suffixes listed and
> > > -    remove it if found
> > > +    remove it if found
> > >      """
> > >      for suffix in suffixes:
> > >          if suffix and var.endswith(suffix):
> > > @@ -1001,9 +1001,9 @@ def umask(new_mask):
> > >          os.umask(current_mask)
> > >
> > >  def to_boolean(string, default=None):
> > > -    """
> > > +    """
> > >      Check input string and return boolean value True/False/None
> > > -    depending upon the checks
> > > +    depending upon the checks
> > >      """
> > >      if not string:
> > >          return default
> > > --
> > > 2.42.0
> > >
> >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#191754): https://lists.openembedded.org/g/openembedded-core/message/191754
> > > Mute This Topic: https://lists.openembedded.org/mt/102972946/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

