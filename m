Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4039271B99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 00:35:21 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x4-v6so491808vkx.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 17:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=iCO91otCXQYCJe6HAqNyJzG70Yankyk2ucwkRB4e/W4=;
	b=ebtN3QCMiTfw1PEX3lk6Y3hWyIR5J/Dxc0emi/cWmAi5x4fFxYwDUGP7rqp//h46r4
	kQD0rISjAx8Zsfy/eJrMmyL8DIa7P8nMFHbVyg95PpDX01OCs+uWIIXQCC1htIaTKps3
	8u82YhWL4nMJR/ctzpWNtA9CavK1SEBwKTyujkA1Af9ddzelZN/WxlmiCZwgd52jrB3o
	s2gdEEYZrHUhUuapXCzuvexBGCjgsiJ52ygsqVGUPh08GgXKjjHWnici3LPgd36Y3Cj0
	wjELpXSAPdZxlHUJ2tLj/PUXGIRgAWSWdfmkxRkTMGrAQsmn/Atp75cATOrCosj2/813
	8Rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=iCO91otCXQYCJe6HAqNyJzG70Yankyk2ucwkRB4e/W4=;
	b=aepk/C6expC7DayNlPSjKSO9PZJfdJc+RNryR2HzFmxAhVyHNOjRe9sJnNcSVMrXTO
	4+QeZX6v+ZmbQOy+BUeEptrnpPhxOogAuZ/WcSzpLL6JlslMWmDx3GdxJ/4Yhb8ydsaA
	RGtIifT96ezEPYvg1i08AKAVo2nSVcd12OS6OUwA+Yu2/wL56SQYFXp0MjVPPbr36263
	5jMDGbAhSYJJdNrYa68Jtp5L91sNjBA4G2ktrGqtMdOGKOXItVpNLfs5aT39v/wW5xlh
	L2Ql7rGR1AlrL3PkwXdow1lluAhmVSy5l6vWhLJVZGGmLtyG/DmIzM+RYv5zUy+J+b/q
	2I5A==
X-Gm-Message-State: APt69E1UKD699VYgwDdJ31hq1ckj26PbuBuIXjZ914X8oSFlkjQ1kF5j
	T1qjDd4RxHAh2rhRuZzR0KiG9ZApZGE5/bgvr6g=
X-Google-Smtp-Source: ADUXVKIlIZ+M1hTFlXkc1eoNpY6lCCCvcOjy4i43CWdmFV61ytAJnYNx3kGEqZ6ZpaLtxGt/yO6KKuVz46EQFW9h7VA=
X-Received: by 2002:a1f:9757:: with SMTP id
	z84-v6mr1615834vkd.174.1528850121982; 
	Tue, 12 Jun 2018 17:35:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 12 Jun 2018 17:35:21 -0700 (PDT)
In-Reply-To: <CAJ86T=U9J9b1RbT1bW65kv=r9DnVn6OpvKrBHMQr2JjNSh-S1w@mail.gmail.com>
References: <1528346078-20408-1-git-send-email-armccurdy@gmail.com>
	<09084de7-92b5-ae25-06b9-63d97cdd35df@gmail.com>
	<CAJ86T=U9J9b1RbT1bW65kv=r9DnVn6OpvKrBHMQr2JjNSh-S1w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 12 Jun 2018 17:35:21 -0700
Message-ID: <CAJ86T=VPE_OGXJ331JdxRynApxtpUOg66p01qvsgVNFw-1y5Ng@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-target.inc: configure gcc for armv7ve targets to default to armv7ve
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
X-List-Received-Date: Wed, 13 Jun 2018 00:35:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 6, 2018 at 11:56 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Jun 6, 2018 at 11:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On 6/6/18 9:34 PM, Andre McCurdy wrote:
>>>
>>> Originally these ARM specific EXTRA_OECONF options were applied to
>>> both gcc for the target and gcc-cross. That lead to a compromise
>>> being made: gcc on the target was configured to default to an ARM
>>> architecture which was at least compatible with the target (but not
>>> necessarily an exact match) and gcc-cross was configured default to
>>> armv7a for both armv7a and armv7ve (to avoid gcc-cross rebuilds when
>>> switching between the two).
>>>
>>> However, when these ARM specific EXTRA_OECONF options were moved from
>>> gcc-configure-common.inc into gcc-target.inc (ie they were made to
>>> apply only to gcc on the target) the compromise no longer needed to
>>> be made.
>>>
>>> http://git.openembedded.org/openembedded-core/commit/?id=851937dde81de2a9ef54c5f19a78fb12fb82afd4

Ping.

