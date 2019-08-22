Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AC5B67F26C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:01:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46DrQf5Mmgz3P;
	Thu, 22 Aug 2019 19:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566493276;
	bh=7HwxKBiGxaZAuho4jWsDoHaUrFSXftu94TV/vCkuLsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aHrmLdmMmj6+pedyx/cQXYcAUJ+MHMDxj73qpFOEUgkjeQP1PbqLuTrrr08XwAZDw
	sN7Oz01ANH69nYesRbLKUswXeD0NwNwvxLRj0iT7A607TZFleM88e/6YVZTqnbXvYR
	G+/BacTYOh/ydbEutifirXG1Dok32z1+2OMdtAn35NLNgS7rORvMgbymiwjeEaYY9z
	RnhsR9jggqYakRUvnjpI/KRXaDWaUOBkn2olcSUoVMZ6Y0+scLJa4X37tu3FAhTH0+
	PogAMTUORV3nbjdg0zlMy21Qjqbk0/yE2W+MePOmODhWiPVgDk4ViMbUpIPYnxfpFd
	cTiy95n1SEmfbUdwxzcLenb0F3xHd1DU6z7zr5m3KSa9l2STmqurCt/sAfpKmpQ4P9
	lBKk1agq7zG6tLlvNDEfZiZS/mKbnYnA0J3DYfVAJ2ondiGASzc1nHZgb0AkcA/eZe
	fpf1M1r3SsTosR7Mc5mrrz4mu0Tr8gAZJMKvubnAZbTuPLS2VmZNs+YlDyYj7fgZwp
	/h7UZuQFoeqqoI9p6/sPl4jwNCFLWJovawviSaJKopFF/JLEw8Grby3U3XPX1wjvwd
	/ljh1+4Gf+9MUTjl+mURkTaj/D0xtQPfR4fwmzmvlKuJneivAEzOvVnL3J+wXo2GFj
	jhfN/LjJbM7OOJOSUki4xxWk=
Date: Thu, 22 Aug 2019 20:01:11 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20190822170111.GA2069@localhost>
References: <1566438018-16251-1-git-send-email-hongxu.jia@windriver.com>
	<1566438018-16251-3-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1566438018-16251-3-git-send-email-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] elfutils: 0.176 -> 0.177
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
X-List-Received-Date: Thu, 22 Aug 2019 17:01:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 22, 2019 at 09:40:18AM +0800, Hongxu Jia wrote:
> - Update Debian patches
>   http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
> 
> - Rebase Debian patches to 0.177
>   debian/hppa_backend.diff
>   debian/mips_backend.diff
>   debian/arm_backend.diff
>   debian/mips_readelf_w.patch
>   debian/testsuite-ignore-elflint.diff
>   debian/mips_cfi.patch
>...
>  ...1-fix-compile-failure-with-debian-patches.patch |  48 ++++++++
>...
>  .../elfutils/files/debian/hppa_backend.diff        |  57 +++++----
>  .../elfutils/files/debian/hurd_path.patch          |  17 +--
>...
>  .../elfutils/files/debian/kfreebsd_path.patch      |  13 +-
>...
>  .../elfutils/files/debian/mips_cfi.patch           | 131 +++++++++++++++++++++
>...

Why are we following Debian patches in a package with active upstream?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


