Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 058117F946
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 20:18:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472jZm3Gjcz65;
	Tue, 29 Oct 2019 21:18:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572380305;
	bh=H54+j9+DT/QB533NWMIaZ0CIA8odA3UCW7ghzOozQqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TGZ90irbkK71vlLmoJcroB9wu/nen2EduQ0Hg3QhaJvLb1uV0G6lTF/u9owMQZeKu
	nXQG+iJTD7TSYB/IuArgNOECh6+ugYoaxeVUgBNsz1zFpFbP/JHnfYQzjMG6Fa/wGa
	xJcmUsjtix+XJPVbgjD3ypeomVcZtkI95KKHF0UPaEWADi80kLa4zk5U3TveQALvFK
	YL7Rs5pk9PLmo8kobSRcLycn5CYpRrUodrbiX+sR98cFVUx6Rr6iczEBGd2E6TRsYy
	kvlrEJUQDFjXeggHUOyjI24xZW0p2HtnqmpHr2t40B4aYm0b7YQx9V7B+bJN7zHw8A
	rFnX1QggrdrmXMexpzym9VZxl37pGls6LuQjMGZUoO7r2I1OBLDvLMUOSImHXzy78I
	25Cy6L0wyGlcxGVpYv+Uce9DYcqvQiSCHnoQMXMwtQ55HmUe6j+FJuu/FJy8yYz1eF
	tXZxwfcqqGHhde75PTtK0Z3jU69VsIUiDsdAtI4vwsweT5gSnwPKlY70dj6bzoioU/
	N2zuJkxh7wNfbH+an4CGLfQ4KbdGJ5+mKj2YAN3R6HAe0ioTU5pGRqy/XK4MnibVWW
	xlol1fs0nrSPvmYdQM8zpnyr07NoxijyfWyQCTKo8JO+ORBnBYG4gfQOKjX5WvJXxq
	OeftviH8xGu5Tzg86XHJpTeg=
Date: Tue, 29 Oct 2019 22:18:21 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Dan Callaghan <dan.callaghan@opengear.com>
Message-ID: <20191029201821.GA26658@localhost>
References: <20191015061510.21803-1-dan.callaghan@opengear.com>
	<20191015224456.22136-1-dan.callaghan@opengear.com>
MIME-Version: 1.0
In-Reply-To: <20191015224456.22136-1-dan.callaghan@opengear.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Tue, 29 Oct 2019 20:18:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 16, 2019 at 08:44:56AM +1000, Dan Callaghan wrote:
> Elfutils has optional support for bzip2 and xz (lzma). It uses
> this for decompressing embedded ELF sections like the .gnu_debugdata
> section for "mini debuginfo":
> 
> https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html
>...
> +PACKAGECONFIG ??= "bzip2"
> +PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
> +PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
>...

Is any tooling actually doing this compression by default?

It is a bit surprising that this has the mostly-obsolete bzip2 enabled 
by default but not the more common (and better compressing) xz.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


