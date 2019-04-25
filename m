Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C36B97D00E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 19:28:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44qnKs3v8bz5p;
	Thu, 25 Apr 2019 21:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556220529;
	bh=utlUhKy6U4PBwwE/ptxh+bMO2RcqMWjw3nTRXTGkkLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sELkYi6CB3/NF1RK7qxuNU7fRJh3CFtsAItFvCatASuhTf7VTT1xHLDCr8gR0dxbi
	J5G2BKukjqk8XXRraSibQreoIVg9tiTiSXaFmYpZFD8bC+iRTTspQ3hyT5BKtGPiZ2
	/x/I0Ps9HqIeLg8DPAjDCx971EzXJYRPgwYTqF8cSHY23XDzHKalLznZhdbxCXzJuI
	pWf/n4e7udT3oPr5RZ+Tw9FTzdDgvPGYRvTCtFwwRrhnlGtJwpygx1OdrAoA1FDezq
	uebsCKUCEngpkz5SO4FHFmGuLbkPy6CwBH9QSjC16t1l8vdMZw792uMFksKx6MgsmS
	QSC+aK+ky5NoiSZNiZ9Fz9MfNUhlV3SYejS1cFcf2MP4MA6H+oRSVaBtKsEAFiljWt
	hCURqqvv/WDC4bwR9vW44ERhLpz4R4XSC+bqSPbnxgwiBh5OHMS8ycjLTdAWUUIqDT
	y01UdBwK1Z7IDHAfNRvkpRjpItTI8aJptqvUmm5v+rO68JinTZao9Gzr5H4ha73CLF
	Ymdk9UJicuCCd7LIkB4LvfIHcfdpH1TOxDvdi37XdHQwCoETrLu/MWyQGjJWVhfxXI
	Rs9iZd5Fcc7wTxfw61cGRGGd0oOVFVPECHDxPNqMutb54Gu5j5bmyukK3fNry7axIL
	03oOQSOjsoKIt6ayohpW0/qU=
Date: Thu, 25 Apr 2019 22:28:46 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190425192846.GA8813@localhost>
References: <20190308184939.22937-1-bunk@stusta.de>
	<CANNYZj-c+H9zqsj640ef+evBNQbi+6M1XAqJHaqu-_i5dHaxnA@mail.gmail.com>
	<20190308193841.GA13393@localhost>
	<E3B36DFB-0727-41ED-9494-3997E768A865@gmail.com>
	<20190308203904.GA19247@localhost>
MIME-Version: 1.0
In-Reply-To: <20190308203904.GA19247@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][RFC][PATCH] Remove openssl10
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
X-List-Received-Date: Thu, 25 Apr 2019 19:28:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Would you consider this patch appropriate now that warrior has branched?

Adrian

On Fri, Mar 08, 2019 at 10:39:04PM +0200, Adrian Bunk wrote:
> On Fri, Mar 08, 2019 at 11:21:26PM +0300, Alexander Kanavin wrote:
> > Perhaps you could grep meta-openembedded for openssl10? I do not have access to a Linux machine for the next two weeks to check that, but I think there’s a few items there. Once meta-oe layers are free of openssl10 deps, there is a better case for removing it.
> >...
> 
> My patches to remove the last uses of openssl10 in meta-openembedded 
> are already in meta-openembedded master.
> 
> > Alex
> 
> cu
> Adrian

