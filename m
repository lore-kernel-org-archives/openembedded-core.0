Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1396D6212F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 10:11:15 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id u190so260401595pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=HRW2wbnOs63GBYPrOAN983s1VLBil32cS+jZxLrGcOw=;
	b=Yvo6xAK6DjvBAqewRG7U0Xzp6fF+MdFmNfMSDypgNlp951CON0eV+CQHUWdXvWtLGs
	6Bg9cjT6pt/zAhjqW+HA7+Zy+2kOR6HOSEINYQN+Bk8MxjknyAlcecRTMyE4yD77zmrr
	KiEZY6QJZ2X+BEvX2oOFW46ahJxTGAU3p8aS2Iu6uuxhGAVEShU9Yyt9sTrf9s5Ydq6M
	Wed5i3mt8ZiOZZKXcyBruR9JMa4iJGxJ68Eto+nEpUApVURgejmMUm5fsbYjFhf70KSL
	ss7jg7/2CQUfJazaSUYFDDJTTM5UPCnC5b8R6V2sK5pdsBtwq1eH0/yCYhJsRf7+oapU
	5xAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=HRW2wbnOs63GBYPrOAN983s1VLBil32cS+jZxLrGcOw=;
	b=RKN4cVQ+xYhKUvmbRbA75Y/nWb6bJSE1lvexJIVJ1OZFU3laZjIqOC3FM2KJ2Y4beF
	ylKzg5tsen2gDde3dXDmCgahlIGBJbN0yUQWZ9D9xMmiqXlxm+XnjF4YHSuYdQw/LXSm
	p3MAc8qB8WmMb6jkPhJWqa+oYsDBg5HEfBRd4pLqx2q24myG3RDgt0RYLXZqrfwCnwh3
	sylfLZSMJowF23X7qJbSNzQNKsXkXv2Vhiuuj7yBqGG7VcCbr2qsIy35quF0wKe4CUJo
	hb+/7ztV2iXNnJUJxD0rPUa8sA5JPsXUs+z1SpYa0GG2WENsU7bUTaHrZHyLHi0Fgpy0
	Dv9g==
X-Gm-Message-State: AD7BkJLQ2HFahd1OLFxJbSI7UoSedQVmMMrT3lfi3ovbUAGwBdxOm2CBI0G4S9iVAuCSHQ==
X-Received: by 10.66.145.194 with SMTP id sw2mr43397299pab.69.1458555076392;
	Mon, 21 Mar 2016 03:11:16 -0700 (PDT)
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com.
	[209.85.192.181]) by smtp.gmail.com with ESMTPSA id
	n74sm11619002pfa.45.2016.03.21.03.11.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Mar 2016 03:11:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f181.google.com with SMTP id 4so128577209pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 03:11:14 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.93.155 with SMTP id n27mr43889365pfj.88.1458555074268;
	Mon, 21 Mar 2016 03:11:14 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 21 Mar 2016 03:11:14 -0700 (PDT)
In-Reply-To: <1458460237.7615.64.camel@linuxfoundation.org>
References: <1458326374-8865-1-git-send-email-otavio@ossystems.com.br>
	<1458460237.7615.64.camel@linuxfoundation.org>
Date: Mon, 21 Mar 2016 07:11:14 -0300
X-Gmail-Original-Message-ID: <CAP9ODKps4nPy+UGvgyxt-vQUG+vpTXc8904mLi8xcZSJX3m9mw@mail.gmail.com>
Message-ID: <CAP9ODKps4nPy+UGvgyxt-vQUG+vpTXc8904mLi8xcZSJX3m9mw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2016.03 release
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
X-List-Received-Date: Mon, 21 Mar 2016 10:11:19 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 20, 2016 at 4:50 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2016-03-18 at 15:39 -0300, Otavio Salvador wrote:
>> The 2016.03 release has been announced in March 14th. This
>> incorporates a lot of bug fixes and improvements which are useful for
>> any new embedded development.
>>
>> Along with the upgrade of U-Boot and its related recipes, this patch
>> also drops the AM335x environment fix which has been merged into the
>> release.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>>  ...utils_2016.01.bb => u-boot-fw-utils_2036.03.bb} |  8 ++---
>>  ...kimage_2016.01.bb => u-boot-mkimage_2036.03.bb} |  8 ++---
>
> 2036?
>
> Where did the last 20 years go?! :)
>
> I'll fix this up in -next.

Sorry, :P

Thanks for fixup it.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

