Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C158DC433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 09:01:51 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.5449.1665651701663474833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 02:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GP54CUar;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B7BD324000D;
	Thu, 13 Oct 2022 09:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665651699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YNWL7+qtCc+Cqxeaqdn0gW8OHkspcHaplHMCi9sDVg=;
	b=GP54CUarX/rAXIeq5H4kNx+0f8q+yFyEOn0P0tmv4YwADdgqXJKeDkCqTWqfsW/btJS9Cc
	qbCrAmrtjwLjQyOZ2aZxjSvtsfBCtpK6K5n8xXjHO+ZZTJRQFiMQEkbPnQgHRRoYutvEQb
	RcWSif98Ck7LQlnCcKa+Mql+JV7seJid7dKS7Yi3c63cRTjgUkf9a6xfKn5NPjvsiq29s2
	76QKG+iXVoxT/hhMPYRo+2WDpTuKgmx97FR49JdnPoJKgnhWHTjecxfNDtY/uheYrAJldu
	vQ4vnOstwxPl9qNOqlZvCNdg2xzI48DYaKhloPW02wpeJ1FHaH6DjlI30zCVKQ==
Message-ID: <836399e0-75e3-804a-36f4-3382fd1df173@bootlin.com>
Date: Thu, 13 Oct 2022 11:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: randy.macleod@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [kirkstone][PATCH] binutils : Fix CVE-2022-38128
Content-Language: en-US
To: Pgowda <pgowda.cve@gmail.com>
References: <20221013074726.1500607-1-pgowda.cve@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221013074726.1500607-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 09:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171694

Hi Pgowda,

Many thanks for your patches!

On 10/13/22 09:47, Pgowda wrote:
> From: pgowda <pgowda.cve@gmail.com>
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f07c08e115e27cddf5a0030dc6332bbee1bd9c6a]
> Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=175b91507b83ad42607d2f6dadaf55b7b511bdbe]
> Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=695c6dfe7e85006b98c8b746f3fd5f913c94ebff]
>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>   .../binutils/binutils-2.38.inc                |   3 +
>   .../binutils/0018-CVE-2022-38128-1.patch      | 350 ++++++++++++++
>   .../binutils/0018-CVE-2022-38128-2.patch      | 436 ++++++++++++++++++
>   .../binutils/0018-CVE-2022-38128-3.patch      |  95 ++++
>   4 files changed, 884 insertions(+)
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2022-38128-1.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2022-38128-2.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2022-38128-3.patch


Would it be possible to have your "Signed-off-by" and "From" fields with 
your real name?
That's what is required on 
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines 
("sorry, no pseudonyms or anonymous contributions").

Another issue is that this stands out in the release notes in the 
section listing the contributors.

Thanks again
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


