Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA3AC5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 10:02:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4540.1786528931985781137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 03:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: missing public key data" header.i=@rootcommit.com header.s=dkim header.b=f/KAq7UH;
 spf=pass (domain: rootcommit.com, ip: 185.246.84.56, mailfrom: michael.opdenacker@rootcommit.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C0B7E1A15AC
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 10:02:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 877546045E
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 10:02:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B035911C4CBB9;
	Wed, 12 Aug 2026 12:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1786528925;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=ekoOisqsRoR0ti2kpvVF6uxJf+3teJC4sHMBfc4nXFs=;
	b=f/KAq7UHdYHQbH1puEP82TbdRzsyuWd2f84hB1mp5R7slIO/iDFbkmUcjHqn5rc5B/vipB
	yMIdGzL0BJFsF+9DQXibtP9F1lt42JTXSQ+Y9nppQ7GqRHRI0NeP7b6VwV7p6B5ij7VATZ
	fRx80nIbtGzZgVUJftnsKzf1ERv3UKfM3EuU7HLIzwoN42Qh1zoufDfm3gidWuDa/pTTRa
	MeiSohFwiaw3ZvC1yKnZ4O9letaayeJxGJR7L1CqNkxNlYjGKvOFq5thvWndUvqtYWlVYO
	Th5I6gcsmrMxn7j1xlwi4AE4hoJxJNgVBvbj3Dtp1SlR0rok+BM6Mxz6yt8nTA==
Message-ID: <0dd7fa14-5907-482c-984e-85668310496d@rootcommit.com>
Date: Wed, 12 Aug 2026 12:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [OE-core] [AUH] lame: upgrading to 4.0 FAILED
To: openembedded-core@lists.openembedded.org
References: <0101019ff48e96f5-dc53eef9-0f32-469c-b1c0-5ee97f8cbd7c-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Autocrypt: addr=michael.opdenacker@rootcommit.com; keydata=
 xjMEagLVOhYJKwYBBAHaRw8BAQdApKjypQYDpk7gc2tKU7srAaN/v2wqp3zsRtrICl5tMarN
 Nk1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQuY29t
 PsKQBBMWCgA4FiEEHltE0IOQ91GyZqTazXRqZ2jNCaAFAmoC1ToCGwMFCwkIBwIGFQoJCAsC
 BBYCAwECHgECF4AACgkQzXRqZ2jNCaAK/QD/fCa/2kPEcJYpt3XjoXUFC40rV5p92/Mn/CcV
 cDDLTNcA/19zgdNIKAqVOaJAcLwhBjCCIZJfAQ80CuPOdGRR5NMGzjgEagLVOhIKKwYBBAGX
 VQEFAQEHQCujvLLf/3B2yAjCRJWU9BUta58RTcZ9ZYYxzsOBj5FmAwEIB8J4BBgWCgAgFiEE
 HltE0IOQ91GyZqTazXRqZ2jNCaAFAmoC1ToCGwwACgkQzXRqZ2jNCaAWEgD/SY55n6h+sq1u
 /Kdbsd4z+uOz2+0Z9V0HtrYLdfgdBTIA/0nuXShti770G4hZDQD52XLANSdPbO7hbwmpNKHm y3UE
In-Reply-To: <0101019ff48e96f5-dc53eef9-0f32-469c-b1c0-5ee97f8cbd7c-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 10:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243268

Greetings

To anyone interested in supporting newer versions of lame...

On 8/12/26 8:00 AM, Auto Upgrade Helper via lists.openembedded.org wrote:
> Adding changed files: 100% |####################################| Time: 0:00:00
> INFO: Extracting current version source...
> INFO: Extracting upgraded version source...
> INFO: Fetching https://downloads.sourceforge.net/lame/lame-4.0.tar.gz...
> INFO: Rebasing devtool onto edd6b1bec7fec9d6c710d2a627cf0f2388135db1
> WARNING: Command 'git rebase edd6b1bec7fec9d6c710d2a627cf0f2388135db1' failed:
> Auto-merging configure.ac
> CONFLICT (content): Merge conflict in configure.ac

I tried to build lame 4.0 and overcame some obstacles, but it turns out 
that 4.0 has build issues that apparently were addressed later in the 
development tree.

The maintainer shared some patches that were supposed to help, but they 
didn't. What happens is that the sources are still managed with SVN (!), 
and I not really interested in exploring an SVN "tree" to identify and 
generate patches.

The maintainer eventually advised to build a development version, or 
wait for the 4.1 release which should happen in the near future (a few 
weeks or months). I guess this second option is the best plan, unless 
someone has interest in getting 4.0 fixed.

See the conversation on 
https://sourceforge.net/p/lame/mailman/message/59366194/
Cheers
Michael

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


