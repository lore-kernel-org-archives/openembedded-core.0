Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9BCC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 22:34:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.25158.1699828482691168470
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Nov 2023 14:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H38jYPLw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D35B7FF805;
	Sun, 12 Nov 2023 22:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699828480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nOkTqbvbQRlewPZKGhsGsQ9C+1OZ7h2JlREg6zEzy6o=;
	b=H38jYPLw5mwSUjdxxMrCiYwqOEXX/H5qzdYpZkvttMxc24rLV5EIRrEpDwD8ffwVw1l1iJ
	7QjueVqJjezamJgks37eu9qulpaz27cO+la/gyB21nB6HcMfPSaS2903MtxCdObfWzwhpL
	JQrieBFkKfBDbLfjYZTArnn0PhJbobhqSiUMdL8yIfrH0vE6P4amyAuRsRgi3AMaORk7Ly
	JNMtAJUPsOm/PIWY8QM0xGP2GT5I8kd+vBcGF0yBWU4tA7FdHUds610eqO0hhAduKaaiS1
	GQJGg3ZiZ7EcAITC5mOzMoKEcc/sxtaK4aYgnmM+ZcaLwP7wLOjmbWTYoUkizQ==
Date: Sun, 12 Nov 2023 23:34:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] python3-ruamel-yaml: upgrade 0.17.35 -> 0.18.4
Message-ID: <20231112223439257c0f30@mail.local>
References: <1698997393-31213-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1698997393-31213-1-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 22:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190457

Hello,

I've tried this multiple times but this is failing because it is
impossible to fetch:

https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.4.tar.gz

I guess we need 0.18.5.

On 03/11/2023 15:43:13+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ============
> - YAML() instance has a 'doc_infos' attribute which is a cumulative list of DocInfo
>   instances (one for 'load()', one per document for 'load_all()'). DocInfo instances
>   contain version information (requested, directive) and tag directive information
> - fix issue that the YAML instance tags attribute was not reset between documents,
>   resulting in mixing of tag directives of multiple documents. Now only provides tag
>   directive information on latest document after loading. This means tags for dumping
>   must be set **again** after a document is loaded with the same instance. (because
>   of this tags will be removed in a favour of a different mechanism in the future)
> - fix issue with multiple document intermixing YAML 1.2 and YAML 1.1, the VersionedResolver
>   now resets
> - fix issue with disappearing comment when next token was Tag (still can't have both
>   a comment before a tag and after a tag, before node)
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...on3-ruamel-yaml_0.17.35.bb => python3-ruamel-yaml_0.18.4.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.35.bb => python3-ruamel-yaml_0.18.4.bb} (85%)
> 
> diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.4.bb
> similarity index 85%
> rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
> rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.4.bb
> index 1760fec7ee..7be966184e 100644
> --- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
> +++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.4.bb
> @@ -8,7 +8,7 @@ PYPI_PACKAGE = "ruamel.yaml"
>  
>  inherit pypi setuptools3
>  
> -SRC_URI[sha256sum] = "801046a9caacb1b43acc118969b49b96b65e8847f29029563b29ac61d02db61b"
> +SRC_URI[sha256sum] = "a2778930d2573358f7c43f26e4bd5715015dccebf53c9943ed611200c1e2adcd"
>  
>  RDEPENDS:${PN} += "\
>      ${PYTHON_PN}-shell \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190133): https://lists.openembedded.org/g/openembedded-core/message/190133
> Mute This Topic: https://lists.openembedded.org/mt/102359575/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

