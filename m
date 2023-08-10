Return-Path: <cbrake@bec-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02EDC04A6A
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:18:46 +0000 (UTC)
Received: from mail6.bec-systems.com (mail6.bec-systems.com [66.228.59.63])
 by mx.groups.io with SMTP id smtpd.web11.18268.1691677119055697303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 07:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bec-systems.com header.s=mail header.b=nT0icUFq;
 spf=pass (domain: bec-systems.com, ip: 66.228.59.63, mailfrom: cbrake@bec-systems.com)
Message-ID: <d03b0041-978c-40c0-8905-f4f3d62729be@bec-systems.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bec-systems.com;
	s=mail; t=1691677118;
	bh=6Z4tP6qwSvcC5jDb4MBP+ZX0w6RXvbi/k+5Z6Y5FQhg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nT0icUFqQSN+SJvNPtH+m+Y0T/eHSPPk/K6Ou/or/ZgtHTS8WBx7b/cJYnAk0FCxR
	 5AyTXcWBrjXisXhkcNRISTTvayrGmdbuet/+K+NR3xdvCqhaCgq7YPEJz/08xFx+EH
	 rQlPbHnEwbv7vNDebTYOScldjhwqTo9DsMSnuX60=
Date: Thu, 10 Aug 2023 10:18:37 -0400
MIME-Version: 1.0
Subject: Re: [OE-core] Keep scripts/create-pull-request and send-pull-request
 ?
To: michael.opdenacker@bootlin.com,
 OE-core <openembedded-core@lists.openembedded.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <3faef71d-caaf-3d10-a894-5dec092d0d3c@bootlin.com>
Content-Language: en-US
From: Cliff Brake <cbrake@bec-systems.com>
In-Reply-To: <3faef71d-caaf-3d10-a894-5dec092d0d3c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 14:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185753

On 8/10/23 10:04, Michael Opdenacker via lists.openembedded.org wrote:
> I'm wondering whether it's better to document how to create and send 
> pull requests from standard git tools.

+1

Cliff



