Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id B3369605BA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 16:23:00 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id i32so233971379uai.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 09:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=DLkd1kjPkM6YTmynYVOZiI/c7wL0eSKZB8Z6Xaeq1ZI=;
	b=FzzAF8DB+9d/IMLLqoeEK2qGwVoZ/QQzZS5NKcYxH77XQIxA86Rr9le0jsTgCo4XVd
	3sm29V4+lGUJHFlkMA/Kmh07+VCA7qQDVI43RNZ/kY7lyG40MsHSMzrShBYbWM6lgktu
	0wT8rRRzrYoVb3VHFQkZiVp3NzaabcbVUTU9e/U7mbdiOs4286wAXwjAEO25vkmlMK78
	ETlXPHGHaXbtqOIBNAnUxgR6cV13/HiNRmXz+ePwmaSPT7huwI7BU+odzR3yqUM6lz6H
	31gkDv4/SdPelW1FN0KzszU1Prhw65b8Z+4RQ0GEVhUSQj37aFNLqQ0PweXUyNxWUPwF
	/XpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=DLkd1kjPkM6YTmynYVOZiI/c7wL0eSKZB8Z6Xaeq1ZI=;
	b=dMlirmUgp5Ye2PvkU5tGo63xHe+G79elT+Gc9ERDAZywL2IBakW62cF2BpEJOXJiG5
	NoW9dh7IPFO3Wf+Oj3ntbVnKYxi6oSRPjy3KWTdb6nWdOuZffoP1Eba6vVkpULxljHyy
	s2TRAbhq+ZXS2CHFhjHyQPvrE1POPTyYC1AClDZKDksPjjWFH6+PI3sup8vdVGdojr1J
	0G9ddtkICvACmlzWnHH1CPI+2hc3r3GReDDqt4jzRqhNxXO6+OJMRsBmDr5e1ebfa+nn
	QqwwoBFvnrR6Q4drFdtPBNd0Izd7fzaq5sB4H2fPCB3v4B3bQ64YNsYexdCDnmJwS37m
	CKCw==
X-Gm-Message-State: AE9vXwMs9QhgWWGuTowSNmS9gq5qKbdeQIHjfs5WRVP7OgaTZlSDQvUUABEzAYxLdWCvrA==
X-Received: by 10.176.69.199 with SMTP id u65mr705901uau.132.1473092579769;
	Mon, 05 Sep 2016 09:22:59 -0700 (PDT)
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com.
	[209.85.213.41])
	by smtp.gmail.com with ESMTPSA id 61sm4342508uax.13.2016.09.05.09.22.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 09:22:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f41.google.com with SMTP id w124so80235697vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 09:22:58 -0700 (PDT)
X-Received: by 10.31.163.198 with SMTP id m189mr4410753vke.72.1473092577985;
	Mon, 05 Sep 2016 09:22:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Mon, 5 Sep 2016 09:22:57 -0700 (PDT)
In-Reply-To: <15ec9cec-d76f-233e-486a-89afb93083de@denx.de>
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
Date: Mon, 5 Sep 2016 13:22:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp_ypN2JVrbcLnaHW_Unsr5N8eMD8-+4s_FQWjdg0AnqQ@mail.gmail.com>
Message-ID: <CAP9ODKp_ypN2JVrbcLnaHW_Unsr5N8eMD8-+4s_FQWjdg0AnqQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 05 Sep 2016 16:23:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 5, 2016 at 1:16 PM, Marek Vasut <marex@denx.de> wrote:
> On 09/05/2016 03:51 PM, Otavio Salvador wrote:
>> On Mon, Sep 5, 2016 at 8:04 AM, Marek Vasut <marex@denx.de> wrote:
>>> Wouldn't that break some BSPs ? I factored out code from the u-boot.inc
>>> afterall.
>>
>> It will but I consider this fine for master as this clean up the
>> recipes and ensures people goes on the review process while upgrading
>> it.
>>
> The u-boot recipe mess would need _far_ more cleanup . If you don't mind
> me breaking all sorts of BSPs , I would gladly do far more intrusive
> changes. What do you say ?

I would love to see the proposed patches.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

