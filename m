Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 45F7D7E406
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 15:47:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45FBmP0BB5z44;
	Thu, 30 May 2019 17:47:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559231254;
	bh=Ec0QQGdJx8Ia6eEGBS73QAWPtL5lVB9D2c7YoejCmRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWp0jijRZzr5NbRmAMthZE5jToYSjkh9mH4d7d8UKYbJAg/4JI4X+5JgdpnGv/yY6
	R25nzZ99wFxZZJXkH+xesL/Ir5jd/pyMXix9+ZMDZJHOPwTiS9Sc5Ct8wSEO5pCx+m
	nIDYbAqr2RBJD/einuxqXoDNYUtO4m+01pZgL/VzkuNPQlyQbD0y/8MxJ6tWEwU8SJ
	EA0Q8EpzzzbXrmdLj1/DlBkK/I7FCEdyRU614dNW2TpkSCUtk1MaVstwa2jmqldcWX
	kSRCRI1pxWLpBw7L8zThRGyppMF8SN6XGExOn2eEfrCsz1Cb3zUAbB5eY9cjimswBt
	Xz3o9VdCYH08sJkACoJqvB8brNJv/lRHS0yYiXDJ04X28s9TcjyMzUKrxFcvPBrm+P
	CnyRAN7UPLiFkOxnucJcMSA9lH3Tj/JhRLWcStgQoUEC903MjeACmXxtTe8TXUanQ+
	fdZXIV5asfzTQCZCh9kwxw17cGaxnMsguooZjD7iN8KHqkazFU5F91wtHQiggZisht
	KPzLJghyGYik9O1VNY/qXBROFZzWfCxAWs7HSPJl+4+IF1rtZAiNOOD+CaulY90Z7r
	GWGji1AQ8bqnkGHEBw0UbZ/BWhg7UZdwVGV+6FMruPgcsCSpqQQQkHOf/mLkC/tRbE
	vlPzWP2gionPISkz6WH/kyUE=
Date: Thu, 30 May 2019 18:47:31 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <20190530154731.GD318@localhost>
References: <20190526110642.5341-1-crg7475@mailbox.org>
	<20190526110642.5341-8-crg7475@mailbox.org>
	<bf1e68db18dc3517178df3810324c09c3954adf8.camel@intel.com>
	<a9e2fb9e-b4b9-93ea-a516-c8e5e5c3e854@mailbox.org>
MIME-Version: 1.0
In-Reply-To: <a9e2fb9e-b4b9-93ea-a516-c8e5e5c3e854@mailbox.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] gstreamer1.0-vaapi: upgrade to version 1.16.0
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
X-List-Received-Date: Thu, 30 May 2019 15:47:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, May 30, 2019 at 05:39:12PM +0200, Carlos Rafael Giani wrote:
> Yep, wayland-protocols was missing. I just added it.
> 
> The other problem is odd. wayland is added as a dependency:
> 
>     PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland
> wayland-protocols"
> 
> and yet wayland-scanner is not installed in the recipe-sysroot-native
> folder. The wayland-scanner binary is part of wayland-dev.
> 
> Am I forgetting something?

You can't run target binaries during the build,
wayland-native is required.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


