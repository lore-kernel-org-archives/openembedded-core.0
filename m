Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CBC387F0C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 06:30:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45lNN34VbWz6b;
	Fri, 12 Jul 2019 08:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562913044;
	bh=mcc5Y5TmTYYe4tSxJhhg0jxrqe/WXQPUsrAzobmnQ5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YpzogQuUGOI4vsYr/khp5ys4GmpK8prl0WMNlDPS9frig7n/uB7vmw/ZNDbR0Lsi7
	zslsjoNZwdytUOSD9qoArRrN4gsVeUDX5j+LQEtQ8NzL+9gEHyCXUz2wQHp0u6LPuH
	kQpFLb7JPVt65g4M7xyF7hZkxS+UtxuV4AnYtf8Z0gg6LjuzggxW36QpfA0A/c/qqI
	ZBi03hNo7v6ve9TPjWwRn9THBJL3BUQsHXa8ofddLsCmZrmQNXxa7gsGfA37nrt0UE
	w+5d8iSbc7oRPxSEl40LgWDAjJEiixoI7EbJs+xQmjiGkR0g59/k+kko8nOmlaauUe
	HpyWIZj5EBT5wtNOrAnpb+8Zcl4M7Jqkir0t3wT8slT6F1J04EQsodgE62lUS5hXHi
	yE0TlQaEs1YOnpy1SpKj7e+R2TMcJWg180LYzMa7ErF72S8s7YguE0VpnzLp//WK8t
	tEHV4YQBxh+p9XtMO1/PV7yDeZzET0iq3mg+noMeFFkKWyLvoOm1EvHGc3XzfInLAK
	pGPMiM+lUWMUTSj0EmATpD/2psZPpWgPY4eMd9AhN1JpeelkDYC5UPHT1xkQNBd9pU
	CPzKkSqNx2avMXZT0Pc718kyfyNcB0vbtDrWxMOzKeVqb1584MJzGpNbpu650/Zu4j
	Jl6tCgmZ/V8RnEtPsRIZFOU8=
Date: Fri, 12 Jul 2019 09:30:40 +0300
From: Adrian Bunk <bunk@stusta.de>
To: "Slater, Joseph" <joe.slater@windriver.com>
Message-ID: <20190712063040.GB2092@localhost>
References: <20190711202739.131168-1-joe.slater@windriver.com>
	<20190711204424.GA2092@localhost>
	<CAJTo0LYnXYrkfa_HrU=QPxxngpP0qHsAUMkFENYGU=MCFGDZyA@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84FA81B717@ALA-MBD.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84FA81B717@ALA-MBD.corp.ad.wrs.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libtool: allow for use of reproducible_build bbclass
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
X-List-Received-Date: Fri, 12 Jul 2019 06:30:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jul 12, 2019 at 01:51:26AM +0000, Slater, Joseph wrote:
> That's a question I have about things like this, where some information seems of minimal use, but is there and is now malignant.  Chuck it or modify it to be benign.

All such patches should be submitted upstream, and the final decision 
for that would be whatever upstream prefers.

If in doubt, I would start with whatever is the simplest correct change.
It is unlikely that someone will insist on keeping marginally relevant
information like in this case.

Debian has already done a lot of work regarding reproducible,
so checking there for existing patches first is always a good idea.

> Joe

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


