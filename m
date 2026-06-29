Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2514C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 16:48:55 +0000 (UTC)
Received: from deneb.mcrowe.com (deneb.mcrowe.com [88.97.37.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1715.1782751725230753998
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 09:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20260328 header.b=nOcEbluY;
 spf=pass (domain: mcrowe.com, ip: 88.97.37.36, mailfrom: mac@mcrowe.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20260328; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sobcaaepxwb0GoRXbQP0Jk8Un4Lm/x1ocUKuaVrBy/U=; b=nOcEbluY4qBcE3JvYpbjcDSR/e
	vaOXjlG3u7p1Nw7EyLQcxEoXfj3uxrNflHbllAl2LM9V1IyqhRydZi5jJnCiuZL7KH0LrTMWf815c
	r0fwPUzruvhrbVqWwmlgfymI/C0WeyF+cv0MS6t92FECiJgoyXaWEhM9y8ifWuNAUvq/8O6nXs10y
	64I2Vj2vfI9bOx2IJukVDCRqo5leQeEz4TqN2c2ueaZyS3YIN2VLKXLJrPQ/MJP9EC5BBBwCm40N8
	hXH9WF5yBGsPmQMrTFP2w7rNYwfPq7cJl3tCjfxPuayPBTPF2n+by0wpFv1CM/YhUf+ROmcI+pzW9
	We6zJPDQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.98.2)
	(envelope-from <mac@mcrowe.com>)
	id 1weFA2-00000004BJx-3nfi
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Jun 2026 17:48:42 +0100
Date: Mon, 29 Jun 2026 17:48:42 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dropbear: Disable DSS correctly OS-21706
Message-ID: <akKh6lfPnTeK0dBw@mcrowe.com>
References: <20260629164452.2488757-1-mac@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629164452.2488757-1-mac@mcrowe.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 16:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239815

On Monday 29 June 2026 at 17:44:52 +0100, mac@mcrowe.com wrote:
> From: Mike Crowe <mac@mcrowe.com>
> 
> Take upstream patch that stops sysoptions.h unconditionally turning
> DROPBEAR_DSS back on even when it has been disabled (which is the
> default).

My apologies for forgetting to add the [scarthgap] to the subject line
the first time. :(

I'll re-send with the correct subject line.

Mike.

