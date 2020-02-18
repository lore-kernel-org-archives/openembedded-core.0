Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC2E600A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 15:35:21 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id a6so3406222wme.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 07:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=qaJHkQXdwQBrzHwdZnz02IvE/NspqjZWQvGMRoSuxkI=;
	b=cITxs2LPfJ8N4UKNM9e6tgG94KJAW9zlEQ1qiSJVOr26dE9Uxb9KRbNk1rHd8zIFed
	+QwZHG8cwhlWkffIwBcg8C+ab5R1MM1Hllu/wOH8PvBkYY1kR9tF9aDkaRoQVYIro1BY
	0ZyX/HAEpBRdZqWJm/LM+wSrKbGYcqP1rf4x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qaJHkQXdwQBrzHwdZnz02IvE/NspqjZWQvGMRoSuxkI=;
	b=qK9KQFniVj52XLSVB5LrKnw27gmvJFSA+k89SWb8q8/MxbVqPN8xafIlQ/yPO2Lj13
	qwB7oXX99xdaN68ChLgutmqxPal8h2bQv72sXAzp6VauV2m6+nP5fhaG7xSGg4/c4T8p
	+9GowFvp07PurbXgUtlJ6mdkaEzWHHGqv/0fkSVUQhy2wABeCGUmNpTOfOiCyq7Z6bPO
	CtcBxYwnsLHp6/hgxwZCacBN502ExyDOvnW+y2l1/IhjqncaEa26Lt3C5UntQP29hFg9
	E262Az6wgd9rB7ZMUN3q7MQxLvkAahX3KCtdoVHuePMCClzRgUIKseG1zqbGx53A9ZWF
	Bc4A==
X-Gm-Message-State: APjAAAW9N6Q0QQmbIS+a9jH24tAHIFSTspLz/ye6wLqjEMJhkL9+bVrQ
	vIn4SEHTf9epE7IwnRfuYxZWjQ==
X-Google-Smtp-Source: APXvYqyce3Z0fdjpsm8UZdhxn77Nk+9wEXgsuiydLpKwka+ks6eM4+0dBUE4MQ8ejRGU840+DVu9OQ==
X-Received: by 2002:a05:600c:230d:: with SMTP id
	13mr3984572wmo.12.1582040122171; 
	Tue, 18 Feb 2020 07:35:22 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id i4sm3877702wmd.23.2020.02.18.07.35.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 07:35:20 -0800 (PST)
Message-ID: <9b99752af2094590137fdaacf6668f170b34158c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: chet.ramey@case.edu, "Huo, De" <De.Huo@windriver.com>, Phil Reid
	<preid@electromag.com.au>, "akuster808@gmail.com" <akuster808@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2020 15:35:18 +0000
In-Reply-To: <99d34efd-3a68-0b05-0e15-fbfd360a2f2a@case.edu>
References: <aa0bf5f6-aaf2-bfbf-6488-8d65cbe849f7@electromag.com.au>
	<4f09ab13-9571-3464-2fc3-334bc91b9c09@case.edu>
	<444185BB2F013F4E92378F99BCF8A58BC9AF9CBD@ALA-MBD.corp.ad.wrs.com>
	<99d34efd-3a68-0b05-0e15-fbfd360a2f2a@case.edu>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: bash: Fix CVE-2019-18276
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Feb 2020 15:35:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-18 at 10:28 -0500, Chet Ramey wrote:
> On 2/17/20 9:46 PM, Huo, De wrote:
> >  I applied the patch to fix CVE defect CVE-2019-18276.
> 
> That's not exactly an answer to the question of who produced the patch.
> If that patch is the one causing failures when it's applied, doesn't it
> make sense to go back to the person who produced it and ask them to
> update it if necessary?

Its likely a general CVE patch where both configure and configure.ac
are patched. For OE, we can drop the configure part since we reautoconf
the code. Its therefore the OE port of the patch which is likely at
fault.

Someone just needs to remove that section of the patch.

Cheers,

Richard


