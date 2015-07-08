Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6A0C673E36
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 12:00:14 +0000 (UTC)
Received: by igrv9 with SMTP id v9so164745473igr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 05:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=M3mYZTks6BRa4K7novXO58imoUCnnKSVmCcGVgh3vBM=;
	b=aBrBC8hGN0pEr46sHfpfRIc1Q82o7NqdRbtix0vf6Pl7G0UWx/Zq1pXG6RoVfrV8ns
	GJfkyaa/2Kpllgu/axQKwo7TrFdPc+jnYQj8JrWW3f7YGLms4oD96mtlbYfghg8IEuA3
	TeO4d6xTEZedbDpfMEJZIuwECH3CFuykq7NUPcDlNxDR3l+QYq6GwNffiBTqyFCG92PV
	W6QzpAikc28fQ1nW04c9WtDL+Sg/TB8VB9mLK8Pj3rGIIyYYHRpcsmbtM1QsoYDSpu+Z
	gJL8ymnp6fASwK9+T6QZlf2Jp6ErZPrggEZcrMD8dlra/1MvH1pOMxAN5x6R/TcUBTJ7
	eUgw==
MIME-Version: 1.0
X-Received: by 10.107.41.146 with SMTP id p140mr15427940iop.58.1436356814738; 
	Wed, 08 Jul 2015 05:00:14 -0700 (PDT)
Received: by 10.64.130.201 with HTTP; Wed, 8 Jul 2015 05:00:14 -0700 (PDT)
In-Reply-To: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
Date: Wed, 8 Jul 2015 15:00:14 +0300
Message-ID: <CALT56yP2_bkOfesazULteWL73DuBKo-BMu0MPxHw-FUz79997g@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Fix builds for MIPS64 N32
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
X-List-Received-Date: Wed, 08 Jul 2015 12:00:15 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

2015-07-01 17:02 GMT+03:00 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>:
> Quite simple configuration (MIPS64 N32 image) fails to build (see below).
> I have verified these patches in both single lib and in multilib cases.
> Tri-lib images and SDK for MIPS build fine with these patches.

Any comments on this patchset? It would be nice to have N32 ubroken in
the current
master tree.

>
> Current situation:
>
> lumag@nexs:~/OE$ MACHINE=qemumips64n32 bitbake core-image-base
> NOTE: Started PRServer with DBfile:
> /home/lumag/OE/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46391, PID:
> 15895
> Loading cache: 100%
> |########################################################################################################################|
> ETA:  00:00:00
> Loaded 1302 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'binutils-cross-canadian-mips64' (but
> /home/lumag/OE/sources/openembedded-core/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'binutils-cross-canadian-mips64' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was: ['binutils-cross-canadian-mips64']
> NOTE: Runtime target 'packagegroup-cross-canadian-qemumips64n32' is
> unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-cross-canadian-qemumips64n32',
> 'binutils-cross-canadian-mips64']
> ERROR: Required build target 'core-image-base' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-base',
> 'packagegroup-cross-canadian-qemumips64n32',
> 'binutils-cross-canadian-mips64']
>



-- 
With best wishes
Dmitry

