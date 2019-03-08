Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D87E97CDF0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 20:39:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44GK966GPzzK8;
	Fri,  8 Mar 2019 21:39:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1552077547;
	bh=PEf4ApyQeor5pUKinfcaLS85UFm68yEOJeHQnGRx3w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CXQ2S+BM+fpShTvw6kwG3k80axbYCV/ysH9zVjpoKhkPwYLrLDp4g3/7E3/jRn+eO
	teouX9n/vNDtAjSxJ3MBO/UJ/V2Bd+DI1dYwt5exfoSPTXIV+AeyfYxxLjfcetNX8b
	69RI7dAuOyD4VPdk+Q1IA3KhgAQxCORoNjO/Kf+i0G/g25LG9JQPZU4ZS+tEuMHmjE
	TpW292Qi6PNmsXn9ut+8dVZW7dyW0xwgOmzUmV/KmFxJlgH8LO9vHJPXr+0910JfN6
	xFHkj773E6UFewILa/9IoBny9+1xB+FZA8MuOARCyG+qtwdRzjdVw1Y3JfUK6kIK1H
	SHnTss9n/N4W7QOSPfTD5/5Moll8LFIJ1fO1/FIuCerwbYVuj/25LykbXe4RU2Rm3O
	/QG3zhdKxNy17fTD6g8DARmwWfobwk97N/Cfx3V1MQNYAA1UlRASEnnGWlLV9gJacz
	25pRFnBoGnQIXWI2y/+WrrbgTMJPGP+YhiQ24YuiKYCMNago4CdLR9ye3J9JrLq+Zh
	FaXjfttO1FcK/fH7CGg2zIj5Ng8SXq/lCJbLK5vy/bC8xvL33jhpuioD1u7oQNUkuZ
	iaylaamP80jn2LgBaqgTg6Hqa+8vTakaquuEQjQ+3Y9tBeb2O+BjRlhSiTDqAtOFJs
	Bs674Y6H+yBjm3v+NyoXJf30=
Date: Fri, 8 Mar 2019 22:39:04 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190308203904.GA19247@localhost>
References: <20190308184939.22937-1-bunk@stusta.de>
	<CANNYZj-c+H9zqsj640ef+evBNQbi+6M1XAqJHaqu-_i5dHaxnA@mail.gmail.com>
	<20190308193841.GA13393@localhost>
	<E3B36DFB-0727-41ED-9494-3997E768A865@gmail.com>
MIME-Version: 1.0
In-Reply-To: <E3B36DFB-0727-41ED-9494-3997E768A865@gmail.com>
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
X-List-Received-Date: Fri, 08 Mar 2019 20:39:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Mar 08, 2019 at 11:21:26PM +0300, Alexander Kanavin wrote:
> Perhaps you could grep meta-openembedded for openssl10? I do not have access to a Linux machine for the next two weeks to check that, but I think there’s a few items there. Once meta-oe layers are free of openssl10 deps, there is a better case for removing it.
>...

My patches to remove the last uses of openssl10 in meta-openembedded 
are already in meta-openembedded master.

> Alex

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


