Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id CBEE9773BA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 16:26:54 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id w124so80312905vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 09:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=cZNXxrB6pKDDzQq9BhxZxyNmOe9XSg5AFWIGTDLHECc=;
	b=zORj7ivaBCGIL7DuhuT2iZ8XX4U7gJSyK4yLlZx8euH6Ezw4aoQxrHahBwOBY0mcya
	E0mye8DxCT0zHXIpJNB+FAdPysU9e/A9GYDzDqBtqn5nvqmAB3wZDdfjeP3AyLCDnhRf
	j0RZC8PaiOdoP12Hl3dy1OuocTcSxbF8FIS7V+3hJTUa2wYYXgd5zszdKGQLXepyDFYH
	HjqdodO9web8jutTzugeJQ7w9vB0a3n2853pDGN2nLrLHgN5MurVrb5H2SPyL7YzTbNM
	RzYgLOqyxrn+jsvk35TyEH0Ez/84NOalYYsaPDg5Km0osTsLANe1hUxhnjaz5VxowjBL
	U6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=cZNXxrB6pKDDzQq9BhxZxyNmOe9XSg5AFWIGTDLHECc=;
	b=QzDeDTXjX28gSTzdAyTb7MAPvy0bNgNksbvzIniSProvuMLXISVj5+6+i+V2oiFkmm
	QjoLlHlmOAflDdKqUQljBForw3WjqS4+DI0lWQ4O9yByPs5ttowlwwHCWF7T5hss0t6Q
	ZzYY3DI67vdZXq6UwVPtaMoKsZDVfdw3sQvJ2NiT9aHjHP8rDD8YHgLxsmkBHykdpPPK
	/+yqPzArTEX55SY3Y01hQcO+TBtR88azIUBkcCvbX1ldWA0uMHv0DyBwp1N9kohuam8D
	y5yRf7ndC/WPopzxVySO3q4BG4q/nxMq78DjqTg6GkL8QkX1d6s7k7+OGzJxHXO0Csm3
	umPg==
X-Gm-Message-State: AE9vXwNtZ5htwZRMR60ThQr/eTnguV5jPmEUVHLu7MIINd2XMyOYPNoTmVMbacoM+2Gk0w==
X-Received: by 10.31.51.75 with SMTP id z72mr22739406vkz.75.1473092814713;
	Mon, 05 Sep 2016 09:26:54 -0700 (PDT)
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com.
	[209.85.217.171]) by smtp.gmail.com with ESMTPSA id
	m62sm4328329uam.28.2016.09.05.09.26.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 09:26:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f171.google.com with SMTP id 49so45949613uat.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 09:26:53 -0700 (PDT)
X-Received: by 10.159.33.232 with SMTP id 95mr23274089uac.39.1473092813196;
	Mon, 05 Sep 2016 09:26:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Mon, 5 Sep 2016 09:26:52 -0700 (PDT)
In-Reply-To: <d3411db9-1d02-d493-72e6-e85625f849a9@denx.de>
References: <20160904162130.13313-1-marex@denx.de>
	<1473024487.20226.3.camel@linuxfoundation.org>
	<9f3a5dfd-8303-b6d0-cd5e-07f2aac7c588@denx.de>
	<1473027091.20226.4.camel@linuxfoundation.org>
	<252ea4f7-871c-60a5-0a2f-f59a5d35683e@denx.de>
	<00e9ef55-2e08-5c92-0a5a-32e9ce1f61fa@denx.de>
	<1473073354.20226.9.camel@linuxfoundation.org>
	<1fbc36ad-f031-9f85-7861-1ba302273ace@denx.de>
	<CAP9ODKqO1ffXbra1QU0F6CwyXWW2sU5A9UoSuXeNtyMu=DbHAg@mail.gmail.com>
	<15ec9cec-d76f-233e-486a-89afb93083de@denx.de>
	<CAP9ODKp_ypN2JVrbcLnaHW_Unsr5N8eMD8-+4s_FQWjdg0AnqQ@mail.gmail.com>
	<d3411db9-1d02-d493-72e6-e85625f849a9@denx.de>
Date: Mon, 5 Sep 2016 13:26:52 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpB9ofyxgNJtt3DpxNiVzKvF_ta708xZvj9vuNUZFyoAg@mail.gmail.com>
Message-ID: <CAP9ODKpB9ofyxgNJtt3DpxNiVzKvF_ta708xZvj9vuNUZFyoAg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] u-boot: Factor out common bits
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
X-List-Received-Date: Mon, 05 Sep 2016 16:26:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 5, 2016 at 1:24 PM, Marek Vasut <marex@denx.de> wrote:
> On 09/05/2016 06:22 PM, Otavio Salvador wrote:
>> On Mon, Sep 5, 2016 at 1:16 PM, Marek Vasut <marex@denx.de> wrote:
>>> On 09/05/2016 03:51 PM, Otavio Salvador wrote:
>>>> On Mon, Sep 5, 2016 at 8:04 AM, Marek Vasut <marex@denx.de> wrote:
>>>>> Wouldn't that break some BSPs ? I factored out code from the u-boot.inc
>>>>> afterall.
>>>>
>>>> It will but I consider this fine for master as this clean up the
>>>> recipes and ensures people goes on the review process while upgrading
>>>> it.
>>>>
>>> The u-boot recipe mess would need _far_ more cleanup . If you don't mind
>>> me breaking all sorts of BSPs , I would gladly do far more intrusive
>>> changes. What do you say ?
>>
>> I would love to see the proposed patches.
>>
> That'd depend on whether they'd be NAK'd right away for breaking BSPs or
> not.

It will depends on the type of breakage and the benefits it puts on the table.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

