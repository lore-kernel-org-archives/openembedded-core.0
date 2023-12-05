Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3117C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 07:50:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.94536.1701762630915237677
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 23:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JkMtTSRb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 243AA40009;
	Tue,  5 Dec 2023 07:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701762628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nbEVotbzjR/VrK4BOzK+Y0PXZ2nQcMklMBjix6kEkzg=;
	b=JkMtTSRbBE8+wmmnmRjw9w4fxxcb8uW/Z9YhulKQEOhtw+jwDoOk/KJIayGny11NKPqgtr
	oCtF6cJjkE6JU6cCoUy9pUYEl5gbJbcgG6ZA2fwlBHIFwl3LXVGzUshcuAocvKQSS+r24G
	VpPbs2hCybAIXBmg7jj5b1YNFuF6itYMp/95Kd646j7bw7e+UGv/IjTHEJ7zNIlfjO3ke3
	dxMTJyyUfSJL6YpbhHBIonyxako+KzkV5OK8SV2W6jbqWx7PGEDu/vl9THtin3a1o1FGSe
	MQVHL08KtAipD2tVR8hU1arrtW9hdCe5ty/HX/oObnfCyhzTOQXN7sk3shVl3A==
Date: Tue, 5 Dec 2023 08:50:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RESEND][PATCH 1/7] bitbake: utils: remove spaces on
 empty lines
Message-ID: <202312050750270cac2691@mail.local>
References: <20231204155934.836992-1-jstephan@baylibre.com>
 <20231204155934.836992-2-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204155934.836992-2-jstephan@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 07:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191806

Please do not send bitbake patches in the same series as oe-core patches
if there is no dependency. Those patches are applied on different
repositories.

On 04/12/2023 16:59:28+0100, Julien Stephan wrote:
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  bitbake/lib/bb/utils.py | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
> index b401fa5ec7a..61ffad92ce3 100644
> --- a/bitbake/lib/bb/utils.py
> +++ b/bitbake/lib/bb/utils.py
> @@ -50,7 +50,7 @@ def clean_context():
>  
>  def get_context():
>      return _context
> -    
> +
>  
>  def set_context(ctx):
>      _context = ctx
> @@ -212,8 +212,8 @@ def explode_dep_versions2(s, *, sort=True):
>              inversion = True
>              # This list is based on behavior and supported comparisons from deb, opkg and rpm.
>              #
> -            # Even though =<, <<, ==, !=, =>, and >> may not be supported, 
> -            # we list each possibly valid item. 
> +            # Even though =<, <<, ==, !=, =>, and >> may not be supported,
> +            # we list each possibly valid item.
>              # The build system is responsible for validation of what it supports.
>              if i.startswith(('<=', '=<', '<<', '==', '!=', '>=', '=>', '>>')):
>                  lastcmp = i[0:2]
> @@ -347,7 +347,7 @@ def _print_exception(t, value, tb, realfile, text, context):
>          exception = traceback.format_exception_only(t, value)
>          error.append('Error executing a python function in %s:\n' % realfile)
>  
> -        # Strip 'us' from the stack (better_exec call) unless that was where the 
> +        # Strip 'us' from the stack (better_exec call) unless that was where the
>          # error came from
>          if tb.tb_next is not None:
>              tb = tb.tb_next
> @@ -746,9 +746,9 @@ def prunedir(topdir, ionice=False):
>  # but thats possibly insane and suffixes is probably going to be small
>  #
>  def prune_suffix(var, suffixes, d):
> -    """ 
> +    """
>      See if var ends with any of the suffixes listed and
> -    remove it if found 
> +    remove it if found
>      """
>      for suffix in suffixes:
>          if suffix and var.endswith(suffix):
> @@ -1001,9 +1001,9 @@ def umask(new_mask):
>          os.umask(current_mask)
>  
>  def to_boolean(string, default=None):
> -    """ 
> +    """
>      Check input string and return boolean value True/False/None
> -    depending upon the checks 
> +    depending upon the checks
>      """
>      if not string:
>          return default
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191754): https://lists.openembedded.org/g/openembedded-core/message/191754
> Mute This Topic: https://lists.openembedded.org/mt/102972946/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

