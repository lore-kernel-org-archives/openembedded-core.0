Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC7F6C13B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 15:00:43 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id w7-v6so29666204itd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 07:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YScyaYboldQiZTEOq03jCMwZn3hrbv0JeIm3++vqLps=;
	b=GSOixGG9RGpNNToR1V0tOnEVSgLhbMAi98RY3fP0jvtSG2RnlIV3S7AL5+2MBiGcRt
	b9/ZSX3rJ0CjZN++QHI75cgw9QnRL3bFmO5+RPEFo2qZZSeyqOVrtKJbR9VhJPyXmk2p
	WU1JKfFWw8pKeqyEhvarBvOVnc/JeUfjZk4SBF9mpWCY34ci2/YVloOhEkZtSvI3NHNt
	EodTx3Is4JopcZqCLyP5uyzbjxQwg8zKqTgBgjjP0cX2ruFNKuGGikaXAyBarsHdRCET
	PW8GLJ1haQ+eRIIcVlsU+Sq/un3CN6B4MOdppF6ylSu7yfR7osxVg4MnsOF8ia1vU3ZM
	PVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YScyaYboldQiZTEOq03jCMwZn3hrbv0JeIm3++vqLps=;
	b=FIOqP7A2c/XaMe7lEAcIcF4cc9xLjmpHcvLsnEiihWFQq9x3+eXH7XtIQ8/nHsXMTo
	3cD9N2x/HP0cNF8PzyULigILQmVKZPTi9KWew2KXoydZOzu1OIcPWfoDkr+UYL6adl0v
	iTZM/Rs3eF4y8Wl40OpPmXeoyJJLZ1PthVngw/dJilXKbcrJl+pa/6HddtLaZmy+2bcb
	wCcXhLZpTu8tnu70ICkOTJ04sMHRBTcNDfyiG62i+MK9VCkoZXyiFy0cVKfqUlVS+He0
	baCrSuqd9eCV1QxGYvpydA/bU1/GlwOYv5KlxqnvwpzYdF3s+SPcz/nrotX26Hk9iKv4
	+OaA==
X-Gm-Message-State: AGRZ1gL/5b3LWAi2CtNtFXrM/VmiOYK/PCdHJyKQqTSf5Zh5GHVNI4Cx
	K5niY43VTYD8A2AzFJK3coDXwDiXt56rzHCNtms2dA==
X-Google-Smtp-Source: AFSGD/XSGByP6uOAIl4NYiu57uIGoGSfurcmoaVN/fdsyyg1bsli5Vs33c8ypNJBQK+WJL8ceKzOwv9tA5X9HiEpjUI=
X-Received: by 2002:a24:1d8e:: with SMTP id
	136-v6mr5725618itj.62.1542294045120; 
	Thu, 15 Nov 2018 07:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20181115124339.19543-1-abrodkin@synopsys.com>
	<23029415-903d-40f8-9f72-7d97d67aee7b@denx.de>
In-Reply-To: <23029415-903d-40f8-9f72-7d97d67aee7b@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Nov 2018 15:00:33 +0000
Message-ID: <CAJTo0Lb=60EqJOVYYi2LQ_jiu+bKhKF=4T0bQAnVivjSP4bVvQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>, alexey.brodkin@synopsys.com,
	OE-core <openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v2] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 15 Nov 2018 15:00:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Nov 2018 at 14:50, Marek Vasut <marex@denx.de> wrote:
> I have to admit, the recipe name becomes a misnomer then. But renaming
> this recipe would be hard, since it's used all over the place. Any ideas?

Call it u-boot-tools, potentially merge the other recipe tool, and add
RPROVIDES for compatibility?

Ross

