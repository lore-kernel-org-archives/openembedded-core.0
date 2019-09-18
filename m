Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA0790142
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 07:20:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46YBFb04ffz1n;
	Wed, 18 Sep 2019 09:20:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568791203;
	bh=Gv8rGO4723EALIN6Fzmmfq4rjCwwVwd6SWxrbviYLCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oj9jND/JY9GKaTg2zYevlWg15EhKzkJ6/h0/VYnjpO9IQOvADh1K8jHJpfe0GIHgQ
	5RgGTq0wvRu7dr3NUfoFYrq2G/j5nHGNE7K3cLfss/tlQcLZgNNKPy9tAwLGWMgzv8
	ZYjFl/PgmdXKuVTWzdL3E/MD4fAzcK5ZLL3ZrSJO/Xz7ZrFhhEg+6C6F+fm/v3MMid
	5Je7o51JjfmIDfVSX7kDRZc31q4aeK41RL2DpZh8oryhcDYEAmEUOnisEsgBE0cApl
	p5bUhzVbMdDtTUAmZlyqqTHYjm4VmD6eOLEiyJbVOPMVrhsyIfq1sDnQOZNCrofk2u
	jxS4ObLocPB03EuaXwIqZkOt3KrYjNevwotrQo0QhYbt7gtrLqnVmaUwoQwteSsXht
	jYPnOHsf01Q+MCN8aWtnap6E1frHXYan3d1j4dDAVRes6rB+8LN5VvWfhUy50DHEZW
	qPDbO7Jq9P+Ov2Yo0mrUOG2i8/9HPlXhKTs8yC6jp33HzQ9BSWT4q/KTbjf9hh/Qit
	M/Uvc5Pj7APg3pEg0HzZD8cAbwQlf7c/nGpSSb4U45D7lrqECuiVmEnzYi7HTFstsZ
	Qjx1HQrL/2gdjL+XyVTnkNpuYOY40FaGFggjA8phsSpNP6UyimTi90ZdnLvnqOvyPk
	+zzdy4jpdQMuRMj4DoWRTdvI=
Date: Wed, 18 Sep 2019 10:20:00 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190918072000.GA11465@localhost>
References: <20190917184947.2244823-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190917184947.2244823-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Enable os option for with-rand-seed as well
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
X-List-Received-Date: Wed, 18 Sep 2019 07:20:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Sep 17, 2019 at 11:49:47AM -0700, Khem Raj wrote:
> with openSSL 1.1.1d we start seeing errors like
> 
> Error Generating Key
> 139979727451584:error:2406C06E:random number generator:RAND_DRBG_instantiate:error retrieving entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342:
> 
> when using openssl from openssl-native on build hosts, this is due to
> limiting the random seed to devrandom, to support older hosts, since the
> option allows to have a comma separated list of methods to try, we can
> try the default first and if that fails then fallback to devrandom, this
> will ensure that it keeps working with build systems which dont support
> getrandom()
>...

Thanks for fixing this problem!

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


