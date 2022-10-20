Return-Path: <alberto@pianon.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEAA2C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 17:36:51 +0000 (UTC)
Received: from server3.justice4all.it (server3.justice4all.it [95.217.19.36])
 by mx.groups.io with SMTP id smtpd.web08.356.1666287407500966663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 10:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@pianon.eu header.s=mail20151219 header.b=C0AtABKx;
 spf=pass (domain: pianon.eu, ip: 95.217.19.36, mailfrom: alberto@pianon.eu)
Received: from localhost (localhost [127.0.0.1])
	by server3.justice4all.it (Postfix) with ESMTP id CE3805C0096;
	Thu, 20 Oct 2022 19:36:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pianon.eu; h=
	message-id:user-agent:references:in-reply-to:subject:subject
	:from:from:date:date:content-transfer-encoding:content-type
	:content-type:mime-version; s=mail20151219; t=1666287404; x=
	1668101805; bh=LUm4/GqN5t5VK85/TTBTTeM8m4u9D/8dcWn7dg6ijzU=; b=C
	0AtABKxoNSVkWeFwL8kntPSD3mdTmnUnyVtHRJKlspn5v+UNdMB4Mx2sIrAN8xAW
	p2I+ufV+q+yGdf4YmqO7GZviXH++W7NDLmrQtcE1bSvbXm9zXx3cpSL6uPZhpa8f
	1dW8zU52APVADUpXHEh6IXhMa0zD6AL0+HjA5d00rY=
X-Virus-Scanned: Debian amavisd-new at server3.justice4all.it
Received: from server3.justice4all.it ([127.0.0.1])
	by localhost (server3.justice4all.it [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XtyTTgrNzYBD; Thu, 20 Oct 2022 19:36:44 +0200 (CEST)
Received: from pianon.eu (localhost [127.0.0.1])
	(Authenticated sender: alberto@pianon.eu)
	by server3.justice4all.it (Postfix) with ESMTPA id 3A7175C0095;
	Thu, 20 Oct 2022 19:36:44 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 20 Oct 2022 19:36:44 +0200
From: Alberto Pianon <alberto@pianon.eu>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Keiya Nobuta <nobuta.keiya@fujitsu.com>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] create-spdx: Fix "licenseDeclared" shows
 weird value
In-Reply-To: <CAJdd5GYUxEHhZGNfj_7FL9_=7KF158kLoKmuSmEZR6q+5WdeKw@mail.gmail.com>
References: <20221019105739.2279010-1-nobuta.keiya@fujitsu.com>
 <20221019105739.2279010-2-nobuta.keiya@fujitsu.com>
 <CAJdd5GYUxEHhZGNfj_7FL9_=7KF158kLoKmuSmEZR6q+5WdeKw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <7131d36c1eaf7bdf227326fabce86f79@pianon.eu>
X-Sender: alberto@pianon.eu
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 17:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172004



Il 2022-10-19 23:17 Joshua Watt ha scritto:
> On Wed, Oct 19, 2022 at 6:08 AM Keiya Nobuta <nobuta.keiya@fujitsu.com> 
> wrote:
>> 
>> Fixed an issue that "licenseDeclared" shows weird value, for example
>> `busybox.spdx.json` shows like:
>> 
>> "GPL-2.0-only AND DocumentRef-recipe-busybox:LicenseRef-bzip2-1.0.4"
>>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>                    unwanted value
> 
> I don't believe this is unwanted: the license text lives in another
> document (ecipe-busybox.spdx.json) so we need to indicate that here
> 

That is correct, according to the specs:

https://spdx.github.io/spdx-spec/SPDX-license-expressions/#d3-simple-license-expressions

Cheers,

Alberto

