Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733FAD69101
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 11:56:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.93124.1732795000591607129
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 03:56:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VRymePIs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D874B60006;
	Thu, 28 Nov 2024 11:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732794998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sQJzHLED/T+YIchB6n5KGll+Kw6eJBQxwo3R57/wIOw=;
	b=VRymePIsgse5YXPLbadABPhD0b72Bu4rGbuvVh8yv2bAJ3PLBS7qgngBGvfd2gU5gzoVS+
	Z1pPaVhuK64MbFqsybLiofGYx6m+NRYJ4nUOtASX9PTo5b2OAQvTBVLItUEgFXmRin29pc
	y9izy2D57Qna0r5MFyydyfFWzZtZVVrsrUvManiCyeLgk9bojR1+dnAMSO9JV9D+bZmm+f
	ngxLzI9qptiOQAA36JBJ7MW6kKS+ReXuYu1LHr/iU61w0ZHPle29tNT1m/RbN7Cqf7CN9V
	x64W4gNpwpXXl/IhUiHDtJm8wxkH8s1V52r8zTkhAJ9cwXUSDMf1Tlwp/3EEfw==
Date: Thu, 28 Nov 2024 12:56:36 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: colinmca242@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: Update vector logic
Message-ID: <Z0hadK8D8_0rGH2E@bootlin-mathieu>
Mail-Followup-To: colinmca242@gmail.com,
	openembedded-core@lists.openembedded.org
References: <20241127125945.3211089-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127125945.3211089-1-colinmca242@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 11:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207985

On Wed, Nov 27, 2024 at 12:59:45PM +0000, Colin McAllister via lists.openembedded.org wrote:
> The database used by cve-check currently stores the access vector and
> vector string for the oldest CVSS version for each CVE. This should be
> reversed, where the newest possible CVSS version is included instead.
> 
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>

Hi,

I believe this patch breaks some selftests:

2024-11-28 13:29:06,536 - oe-selftest - INFO - cve_check.CVECheck.test_image_json (subunit.RemotedTestCase)
2024-11-28 13:29:06,539 - oe-selftest - INFO -  ... FAIL

https://valkyrie.yoctoproject.org/#/builders/48/builds/463/steps/14/logs/stdio

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

