Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CCE247F501
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 11:24:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46yp1V1dr3z5w;
	Wed, 23 Oct 2019 13:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1571829871;
	bh=66sbXlWhKHuUDxD38cnagvAkr89JszvoOm3ZOHCFhs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SspYFhc2sebHiZWitQV4vsS3l2SF6m9NeYSuXchZmxvn2Ru6nnkpJC9NKAccEOp8v
	b6dwdUYg4Ol5IM/R1JOLN1PMXKVYhMKbnwz1/vBxOam6C++ILYghWkdC7WF/wYGyP+
	zt3lRdID1ICGWoNfZZwHfDUwBrH9/b5lLXHROWLaTM0SDIaAqtzmS4n3uEDvXIB0Cf
	L6cqruCF93qAdeMrA3tzAuhsiNRwD3GO0El20QCfWPtRUcixrXYzeUX+X0rgqdDiRy
	ceulc9opO+Dknxy6ZJ75SmKKid+vWkW7N05kR3hQ/ipAqQLd1wunzrDwDlXrFm04cd
	uZwgj5KABE1f+tP84Acp2wSPOXESnqLBtj9jum0aaay1yS+kaTFTLQvsLophueiLJ6
	TCEbF4hrJaSQwEv4c1l7N+GSXnJqPeszbosNIchxCNThPZRQq5CpIrwyUAGmhyXN4T
	OzPkdGlzgUMTEgB8mArEdU7efmlF677IPSEyT2Pqj43RC4qFpDjUVXNR388+TAFuCh
	O1G+75LrsE57H8wGjPobU+LVrp1RscPm5H/LgzwSZfAji3pfUIaOTE2st/QZqkQmUa
	GzF/2bZ0izbIIsmo/RdGxTiNyGE7RsMuVL7B4f/fcgpaOCbicvCkSv0ss61fLeYC2C
	N16M71aC6ZgALkVW87puttk4=
Date: Wed, 23 Oct 2019 14:24:27 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191023112427.GA13753@localhost>
References: <20191023023728.37008-1-Qi.Chen@windriver.com>
	<bbd6bae9-2eb5-04b3-dd2d-652b7a74233d@intel.com>
MIME-Version: 1.0
In-Reply-To: <bbd6bae9-2eb5-04b3-dd2d-652b7a74233d@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [zeus][PATCH 1/2] python3: fix CVE-2019-16935
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
X-List-Received-Date: Wed, 23 Oct 2019 11:24:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 23, 2019 at 11:59:37AM +0100, Ross Burton wrote:
> Zeus and master I presume?

And warrior.

Or continue following the 3.7 stable releases in all 3 branches
(see my patch to upgrade to 3.7.5 that also fixes this CVE).

> Ross

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


