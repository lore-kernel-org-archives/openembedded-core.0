Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8ECC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 10:01:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.8431.1647511275237983934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 03:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dLec4q1K;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1EF301C000F;
	Thu, 17 Mar 2022 10:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647511273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mBVIpSmWDqMLZRRyPQ/KUaPJlIgi+8Ty2A+FzsRXqM8=;
	b=dLec4q1KMby6U104pqFe4X5UeXRpo/sp6PU6GLQGeJoSvAkBMRwcZ6yflqVi0nm/8K9ru8
	+DkZRRN7FSOQOV3+f5TS6DuYD5C9w99cc2q+5vukj1ArDSdYB2UZ9KRpB6HARFju34rV9Z
	lCOsmac0ISTk5rvLPqVb7Ytyqrym7z0JtBxAbG5KOTuE7dA6xiDL+w7lf/9+KAEpo2kDBR
	LLxgZVRg1xBdcHWhD6gm5PXsmqYWk2c1D1DuTB0elrah5wpN/D/NgN3cr0R/NMVLbYkU48
	/iatxPFWE7PqM1lpVtLs3sgnPstWG/DDpaB8II6zF9mDlZrFXXSDxx3qIFyoQA==
Message-ID: <eedc4f00-a940-1672-ac00-db2d09023a4c@bootlin.com>
Date: Thu, 17 Mar 2022 11:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] Patches sent to mailing lists: "From" attribute
 modified
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <16DCF6055FEB6DC7.29979@lists.openembedded.org>
 <d54721ab-03a8-9c80-0445-17c7d76d6570@bootlin.com>
 <047880ea-a2dc-7778-3101-a3c887715513@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <047880ea-a2dc-7778-3101-a3c887715513@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 10:01:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163381

Hi Quentin,

On 3/17/22 10:43, Quentin Schulz wrote:
>
> Maybe there's something you can do to configure git send-email to add
> your
>
> From: Michael Opdenacker <michael.opdenacker@bootlin.com"
>
> at the top of the mail. See my patches on the ML to see what I mean
> exactly but that should make it nicer to maintainers because this From
> will be used and not the one from the mailbox's from field.
>
> FWIW, I did nothing in the configuration of git to have this, it's
> just that it probably detects that the sendemail.from config is
> different from the commit author mail address and adds it.


Thanks for the tip. It could work, as my early tests show a difference
in the received e-mails.

I'll be able to test soon.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


