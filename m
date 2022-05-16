Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEBAC433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 07:32:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.26068.1652686354713616291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 00:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jYd+yrra;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D8914240006;
	Mon, 16 May 2022 07:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652686352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYjYK7P+cbskoIP5gXLtrDySqvTTGfVd6VCDp0GPGrM=;
	b=jYd+yrraR/aKw4goB5fTTOg7gWvPKOe43mWbhlfAVz2TiebqzFj+K8+D/SsSL/AwAUDKRL
	CdiB8kczq7CBMDL+77CXi2vlf3yeHz+GjVwW//z9nBpVyhNNCnbTr2K+HWiT3shLzp7K5G
	5u7Fsjr8B9eHbbTHBHKc5E6E1Ed8BsYpIVlCRdUlefOetClbjKzVvQ0huMAlrOXsHbxUpL
	i71O9PnqVYw+/sTyAtrnBznjt/F0KtIl67yOzDJqMiOOfGEtpw0XZ9KjFuyOPDDZeuHVXA
	Ael4YBmJmJ9RzGxjo2IWspRNF6ZKIjFF8xV8SMOi6qGLrRYBkLl4qinIemIoRA==
Date: Mon, 16 May 2022 09:32:29 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: grammar/typo fixes re: Python
 install
Message-ID: <20220516093229.68d82caf@melee>
In-Reply-To: <49c3457d-897a-cca5-ec91-c442be9ea18@crashcourse.ca>
References: <49c3457d-897a-cca5-ec91-c442be9ea18@crashcourse.ca>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 07:32:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165666

Hi Robert,

Il giorno Thu, 12 May 2022 04:45:57 -0400 (EDT)
"Robert P. J. Day" <rpjday@crashcourse.ca> ha scritto:

> Clean up various spelling/grammar oopsies in a small section of
> sanity.bbclass.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index b416918013..491a3bac6f 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -631,11 +631,14 @@ def check_sanity_sstate_dir_change(sstate_dir,
> data): def check_sanity_version_change(status, d):
>      # Sanity checks to be done when SANITY_VERSION or
> NATIVELSBSTRING changes # In other words, these tests run once in a
> given build directory and then
> -    # never again until the sanity version or host distrubution
> id/version changes.
> +    # never again until the sanity version or host distribution
> id/version changes. +
> +    # Verify that the python install is complete. Examples that are
> often removed in
> +    # minimal installations:
> +    #
> +    #   glib-2.0-native requires xml.parsers.expat
> +    #   icu requires distutils.sysconfig
> 
> -    # Check the python install is complete. Examples that are often
> removed in
> -    # minimal installations: glib-2.0-natives requries #
> xml.parsers.expat and icu
> -    # requires distutils.sysconfig.
>      try:
>          import xml.parsers.expat
>          import distutils.sysconfig
> 

Your patch looks visually good, but it does not apply:

  error: patch failed: meta/classes/sanity.bbclass:631
  error: meta/classes/sanity.bbclass: patch does not apply
  error: Did you hand edit your patch?
  It does not apply to blobs recorded in its index.
  Patch failed at 0002 sanity.bbclass: grammar/typo fixes re: Python
  install

Can you please rebase and resend?

Weird enough, the patch you had sent a few minutes earlier applied
without problems.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

