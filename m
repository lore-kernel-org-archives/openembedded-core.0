Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AEB1A7E648
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 17:51:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46k3cB3chXz2C;
	Wed,  2 Oct 2019 19:51:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570038714;
	bh=P4wfDP5g3z2hmJAjEr3ebFybMQJAT3fmvkObD+dOe9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fV2uip/SEIr2P23iVPdzo9NWTt56LU3dqtO5dKRxGf6HGTY9BClMgow3On/0Z+aoK
	vNLK1Y0/6BYtaSRE//ZgRYefMBO6CtD255/wVisGAl+7Qt6ZDb/jLMmrTk5mhDJuq+
	gTAQXjxoG1iBbRkkXAF1Fr6VvUq4mg9LGB1bbD2w5ijjWUFDZ4NZhtdJsIoUFNrlxC
	SCCBxvO3w959HrMih8oWlafJYz8ecRbPbCQ/IB70IX0ZLXIeJPQ1GQvazKb/t1WoAB
	W6mT/DQYrewscqg2xB49AVXwvIUAbKp7VVtH7eD0bfCkAcRBD3/fc+UmrFFyKsVYda
	78GphvJ3O5UFAxDrZRoC5WxsBkWJNlrjJGu8FMTbn2zA+LQyMUP9PROGPeGFxBLb02
	WLpa92GDd1JFU0bKGKRd2Ae74Rd4msjpq+6+k5SejuAp9Kw8upFJOQqd25iN4mQdO/
	PIMxWE67EIEbsBZVSKH1au5nTK/5De2j17JM67Mckhl52PeUrn0W61UlzURdrPOtns
	igFdtpAOLfLf0p1VbHZiv6FDGv+LJXjMu7YSzUITttpRdO5I06fPCNtT0wcIGx9QWX
	b3PSFRj+peM0YGwvTi3J2Dlp21WGg0qEfMHBBX9dn+iH6DN0L0p7Lxr/y3MJT0oMje
	bTxIEimlmNuPZLQ0AWEesFnY=
Date: Wed, 2 Oct 2019 20:51:52 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191002175152.GA14877@localhost>
References: <20191002120027.109242-1-alex.kanavin@gmail.com>
	<20191002120027.109242-2-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191002120027.109242-2-alex.kanavin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] ethtool, libcap: fix upstream version check
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
X-List-Received-Date: Wed, 02 Oct 2019 17:51:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 02, 2019 at 02:00:27PM +0200, Alexander Kanavin wrote:
> The default URI returns a gzip-compressed index page
> which browsers can auto-detect, but we can't.
>...

Works for me without your patch:

$ devtool check-upgrade-status ethtool 
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache: 100% |###########################################################################################################################################################################################################| Time: 0:00:00
Loaded 3386 entries from dependency cache.
--2019-10-02 20:48:43--  https://cdn.kernel.org/pub/software/network/ethtool/
Resolving cdn.kernel.org (cdn.kernel.org)... 151.101.245.176, 2a04:4e42:3a::432
Connecting to cdn.kernel.org (cdn.kernel.org)|151.101.245.176|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 12157 (12K) [text/html]
Saving to: ‘/tmp/wget-index-68s3yqp8/wget-listing-0s5soh5t’


2019-10-02 20:48:43 (4.08 MB/s) - ‘/tmp/wget-index-68s3yqp8/wget-listing-0s5soh5t’ saved [12157/12157]

INFO: ethtool                   5.2             5.3             Changhyeok Bae <changhyeok.bae@gmail.com>  
$ 

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


