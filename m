Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1767F33B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 16:31:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47RVx06mSxz4R;
	Mon,  2 Dec 2019 17:31:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575304277;
	bh=7/GnnfaegyInRVHDRcwc/fFoHolfCdk7RLMzCv3GiKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPKS5itBbnQz1ulpzcSZsxrJ4akzom7YjLNFIzGnV729CA61u59G08iLq7GGRNxYA
	0YKMrktrukBKyZmUsgKIkTcBo0DVPieQttwU3Iv6LDaE/HOGAHjM4IQvillouXWfcn
	/l80+GPNlptEBMBvYmzAZLufiD1WumK2bXUbX4ouhBpQhDIg5Y3Nb3CL0W7THM8RIZ
	P9xcON7nmkr6Crsr7tnmr5RC2+zjC+lsewhKyGV0u0XOfHylLB+/o03H94Yu217C+s
	/p3u1hQ6LbctYZ0lw3AMoOCZFwlZoR6PzYk5z6rKzfVa/beKdXlVyI+Mf2tRkFhyyP
	ffWol3on+sBzTYz3Au0E5JqV/+iyfm5MTQHlUEjeLDLnUydTH5jwWL5xpw+hYoPC+x
	DEOnkl8neczErgM6wNagVaueiA8rUee/OVNzLINL/f1sB+hyHAkvc9VuDxF8ZCEQNE
	milIq8lWm2wsTMDJl6dKgLr3lpLusrHIhcz5RcSv9yE3kTons1OFrXVaHvToLSNwTP
	/1lmxQp+bplGq7/WuB+FUCECJ0EkAYDt+Ti8Un1J4KlUCEIXEChJ7OqMfSIE78viQk
	/Rt+NzaBXLz5evOUgw88dACgw0Ccfh5nv/Nn5O1w8/HYuzgb1b0T4VQWbZDF2QXEN1
	M3RxC0m3RE/3YUw3KUQAmwUQ=
Date: Mon, 2 Dec 2019 18:31:14 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191202163114.GD1581@localhost>
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-13-alex.kanavin@gmail.com>
	<be94e0da-16b3-d525-98db-81078737be37@intel.com>
	<e11afd07-d8f1-456d-27fb-8f614f9f3d89@intel.com>
MIME-Version: 1.0
In-Reply-To: <e11afd07-d8f1-456d-27fb-8f614f9f3d89@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 13/15] libffi: update to 3.3 final
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
X-List-Received-Date: Mon, 02 Dec 2019 16:31:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Dec 02, 2019 at 04:21:56PM +0000, Ross Burton wrote:
> On 02/12/2019 16:19, Ross Burton wrote:
> > Fails for ppc:
> > 
> > In file included from ../libffi-3.3/src/powerpc/ffi_sysv.c:35:
> > ../libffi-3.3/src/powerpc/ffi_powerpc.h:65:9: error: '__int128' is not
> > supported on this target
> >     65 | typedef __int128 float128;
> >        |         ^~~~~~~~
> 
> https://github.com/libffi/libffi/commit/01a75ed76ea7e57f1b7a5c183e2b1e890e6aa0fd

Debian also uses this one for powerpc.

On powerpc64 additionally
https://github.com/libffi/libffi/commit/6663047f56c2932a6b10a790f4ac6666dd181326

> Ross

cu
Adrian

