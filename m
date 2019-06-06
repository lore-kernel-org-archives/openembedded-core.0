Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2422A7DDAD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 15:36:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45KVBY5Mfnz3L;
	Thu,  6 Jun 2019 17:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559835398;
	bh=FcwaJzw6N+rMu10hidbd9KzzrhltTLZ3E0NwMzvZn0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oks7J+EbzAeFkL618utvOooKNT+9GWHsBzYRyBsK9NX/CzuL6y5b8f5OQxiCeb96T
	vBo29nk82JKU/ywN+yLo8gaPLRoPcp9UzXafbk6ote8AkO1ZR27K7Q/3aq1/uNOeDO
	fcch97OPwUfgqNLS4JroqRayOOZ/P93m8TBp3yUO9tt+O0nRwC/9RewTfF+NGYhB0k
	DWeVfGi5Pz0kGkxcxcDpyex+u3KUNNs+vLmvDnShxSr/zAbasxMWRGXeLEUI6h8s67
	PEm7tn0OrkcJ5j4MPA9c1qYaKGPgZpIWmXRD9/RP+RoMXOgg6fySJ9KSTi3IRXTeWC
	LhvLkco7l+1nNqbm7wLJY0oMYBjTeq0z9csJiRsujPJm01XuoeOqVNtrB+vYUFpj+X
	mD2BSvb/muO9Dxsscix9xa1wJCXrzxZBlG1iMGpnyRl0q32oHQK5RyFSjbMqXZ6aAM
	AQt3kHegcZLepRJJbKaq5tfgfZfdcS2z3fWl1hFBcOy9iDJTtcWFIsexvLN0cytd/x
	OfbntLfClKZvgQvxK18vKRx9vHIiuzELxDemxqgzfVSbm0GdZKji2OnY/LUXRDUf85
	K+64YCq13SirTjvzxGDO+KM1GUISKogjJUM+rYzcETsgi+15zM8M+CTa1wID3gkp7i
	cpT5gyiLPw9zhsKyXXZ/0XWs=
Date: Thu, 6 Jun 2019 18:36:36 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Message-ID: <20190606153636.GC26324@localhost>
References: <20190605152352.25846-1-quentin.schulz@streamunlimited.com>
	<20190606145236.GA26324@localhost>
	<20190606151137.glzdt624z6l3b6v2@qschulz>
MIME-Version: 1.0
In-Reply-To: <20190606151137.glzdt624z6l3b6v2@qschulz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: andriy.danylovskyy@streamunlimited.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta: license: fix non-SPDX license being removed from INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Thu, 06 Jun 2019 15:36:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jun 06, 2019 at 05:11:37PM +0200, Quentin Schulz wrote:
> Hi Adrian,

Hi Quentin,

>...
> I've sent a v2 (and you're Cc'ed to it).

thanks, I've confirmed this fixes my problem.

> Thanks,
> Quentin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


