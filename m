Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7D2E65D2E
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 07:35:34 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.19357.1732260924482026553
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 23:35:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LN4mU8Va;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A320240009;
	Fri, 22 Nov 2024 07:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732260922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EOOc51EQdPUp9wPJ2uwOn3B83CY7QnWfwf1fMSOLqcQ=;
	b=LN4mU8VaMHV+P6io4GQhpKYqKkvn6GgEqiunYMNTQ+6E7ZVSXFE623/qlc7pYGAUJYMBZf
	UGYoyvx/gEPPMFr1KgMv6CbHXyGUVi4vrcWMSsJvfRq5WeEPUTfc9VuW36Ktc+THxIbnJI
	RR6zQC8Pdko5AhC5e5uV2m8umn9ShRVbnVFJIXc54WyTBhuUb8zrVcAKCK/Ra4PNYkq/R+
	dZaaprtF7MdbLjiF4F80Fdy9QYIwxbIhtf/gu0mKlt+YmMUXgvjhiY7jUz6MwjV1P13W79
	URa8oh22GhAnOiac23z5NgHryfRR/2j7WjujDQbP/w4jLhNw7TMCqNxvoxfjhw==
Date: Fri, 22 Nov 2024 08:35:19 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] libsecret: add pam support depending on
 DISTRO_FEATURES
Message-ID: <Z0A0N7JzXivpU5qL@bootlin-mathieu>
Mail-Followup-To: Markus Volk <f_l_k@t-online.de>,
	openembedded-core@lists.openembedded.org
References: <20241120183528.2560-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120183528.2560-1-f_l_k@t-online.de>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 07:35:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207591

On Wed, Nov 20, 2024 at 07:35:28PM +0100, Markus Volk wrote:
> pam module has been ported from gnome-keyring to libsecret
> [https://gitlab.gnome.org/GNOME/libsecret/-/commit/9a37dc839a9be1670afeb647d9f82b6ef1cd0893]
> 
> Add a PACKAGECONFIG for pam and enable it if pam is in
> DISTRO_FEATURES
> 
> Add a patch that disables the pam test, because it would require
> pam_wrapper recipe
> 
> [https://gitlab.com/cwrap/pam_wrapper]
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>

Hi Markus,

> +Upstream-Status Inappropriate [oe-specific]

Still speaking of this Upstream-Status, I do get some error on the
autobuilder:

ERROR: libsecret-0.21.4-r0 do_patch: QA Issue: Malformed Upstream-Status in patch
/srv/pokybuild/yocto-worker/no-x11/build/meta/recipes-gnome/libsecret/libsecret/0001-pam-disable-tests.patch
Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
Upstream-Status Inappropriate [oe-specific] [patch-status]
ERROR: libsecret-0.21.4-r0 do_patch: Fatal QA errors were found, failing task.

https://valkyrie.yoctoproject.org/#/builders/25/builds/497/steps/11/logs/stdio

Can you check this, please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

