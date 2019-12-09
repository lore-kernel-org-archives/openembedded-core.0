Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7E2877FCAE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 15:17:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47WmyG6L58z3H;
	Mon,  9 Dec 2019 16:17:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575904631;
	bh=ZWA+pJe9vjTVimFf5wiXJ1eG6XZDSwd0/ijupV6XIjI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=QILxX2jTFIyQF/xtATAp6Uq1AHRGgRpFsP+rc0eDVjb/Za8XoiHLkCNMAw2xvDqLM
	gtNn7ZQoSH/J+BKTUBtZJJM/cxb8ehIdj6zqUtSOt+XRSdXLyODz/yCyGYBAaeeJBq
	Qe1/fTpu+GxHv0T3wtjHBZLiN64QvAIF7W6PspPD9INaydlpr7ncQOQd4Pl4+lIu2/
	DzPVQuhLaqf4o1LKw7Cr0eeQQBlJAd7mHkWJlsmsXspE1qYXMNZIcMCzgFZChNykJ8
	OlsdaQupsKbMrLbgnTEb6Qu6QK1N54DpbPj2TfggTYUCCosCV3Ro6bmoI6djYqZ2WA
	LeQe0COL5EOY32Kcg+XOgfIIeYP2axE/gkM2hvasUQKfYapH32jz6CdGRZwzhwyIxs
	p5V+LUZCwzDH/73ka1LHD+DBMtLxiv0MJkZW0usXTe9Y6xc8JwjP30oojSRoVGKWLN
	aHKWSx0r7hPjlSq97VjkGjY4pDzLEro6Cex4TEJTDsexCntOIJrkLlPGXZNJswC6YJ
	rEeLp2iRECE29nFUKZoHhp0ptl4G0r9JWBzecq+yb2273Dnsa/SgBPrXZYeatogD5P
	O1+AW1O94u28gSyWXO0do/xuLDOrQHNz3svJIyoRb11w+XHtHDuyYh1TI37TnptKww
	y7xwjC4kKr1XG82vjAVYEwpk=
Date: Mon, 9 Dec 2019 17:17:09 +0200
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191209151709.GD5701@localhost>
References: <20191207231134.27610-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20191207231134.27610-1-bunk@stusta.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [PATCH v3] python/python3: Whitelist CVE-2019-18348
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
X-List-Received-Date: Mon, 09 Dec 2019 15:17:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Please apply, v2 was already on master-next at some point but this 
change has some trivial context overlap with the Python 3.7->3.8
upgrade so v2 was dropped when 3.8 was dropped.

Thanks
Adrian

