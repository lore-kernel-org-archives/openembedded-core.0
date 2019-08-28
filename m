Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9FE7F289
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 20:05:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46JcDf1kRWz3J;
	Wed, 28 Aug 2019 22:05:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567022738;
	bh=xaoWrZQQ4bmNVm1Fd1Yz4mCCI+INrlFKQjUb8jsiLe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVLg3TKodKaYjIWWUM89FOGpgUWJc9VhNd3ActhRN0I0iFb1XbGSyBEhwDLPCIUta
	6eExzyZ5sP40ANAKAUqpIskKqsuesKo7W+CCkxO3+rMDagY9PU2rsgH8hbJbVPgWDg
	Vtuaa1omeUQVtCpGPasZNlxt/tDW8usi0IM+EG5EfdDl9bfgCC78DMQI7Pje96KOnI
	jQimTRG4C2+mulGnNwccBZ8HXO78gTSdEefgr1Snm4lO8Fid6UH5F//m17rnUXdj0t
	zxhWU329Ojl35jqhjWhpJG7aKfwo9DWg2ABskhvescRQ/yMFCj1IEARWmZIiHmoO0A
	euCMiOfDtw/bApQ48e8O2+TcxFl6IIExruqbtCXodzIsth+2ia+Nc0YXlDkB7NA5Kd
	W08uuYC4M0/BXhMi8UTgJSe2vKCNzCZfdgciRN7YUciJJXutJivMH/qMPwkk3VDq1N
	kbO6RJ6GW7y+Xm0P5OWG8CVB/n9sBQKWE+pw8/7JHIS4YAZ8khq5+gw+/CHqvIMvTb
	2kY110TeGQitrv649YrtbvlThBcQ/IsRmSBx58qLHJzxyIMHU6ZOvB3oeyygS9KiMr
	WkCwV3og7eshWZLeVKAbYODDj0mjH32qIgIVL6cmEShV7xSS3iG3gpQ5eL6aET4Cl8
	sk6f55UTOAKQeunFyJKw22l8=
Date: Wed, 28 Aug 2019 23:05:36 +0300
From: Adrian Bunk <bunk@stusta.de>
To: bruce.ashfield@gmail.com
Message-ID: <20190828200536.GD3044@localhost>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<4f7fa357480ec0139aa809bed4a12c9aa7622d60.1567019771.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4f7fa357480ec0139aa809bed4a12c9aa7622d60.1567019771.git.bruce.ashfield@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] kernel-devsrc: remove python2 dependency
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
X-List-Received-Date: Wed, 28 Aug 2019 20:05:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 28, 2019 at 03:28:38PM -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Witht the approaching EOL of python2, the kernel packages need to
> be updated to depend on python3.
>...

Yocto 3.0 ships and supports Python 2.7, so there is no urgent need for 
last-minute Python 2 -> 3 changes.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


