Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 05D08606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 20:44:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 467Ppk5hW9z5c;
	Tue, 13 Aug 2019 22:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565729088;
	bh=oU7+rNpaKrTQQm/HWUqci8RmOgiZ3ZPqcG+/7wyeWEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XrT7RE41HUkH1ULq1fYJ0nvnz0wbz36Hgw+ZwuD8ynqgB+F9CqoSDCnwPXTGVpdiP
	pynlmrnXJQ5zia1BcsObp+w5LKay70aNJK5nZHg8ff7waTTudsMV3lw/RVWu7pRWsL
	AWXGjceZHhGjFZ9s/2Xo7x2lOJ/2tWLItCpT4MTZjWfHDKX/sxJSlfAzKW9HMz1enr
	TyvetKYlUdoeK1kXe1FR6xDDdxPTgo4NiisBipnH6As9s0PTR7jiN1pMGrwD+iyA2B
	R8dlJV+weUKm6xLamCRICTgrA+i6WZZu9nKT9/I1rjMGeA2L1YzbL0pu5f7Au7uChB
	+ACgCjL/O59NT7Sg3l6bnbsuR7RgMtOAlFhML6z0bb1TUl2eB+gpifuBjloGamVLbZ
	iL4df5ikeM0Wb9ZuV5iJNVC1i5sdhtTOc6U6+sI2Ycw1AfTxM5pOpiPS16oImn+/3r
	YhCR/O8nnWXQjFz4G+s99rcFuv9Q8IwnAAYrupijVfcG2lgWl5m3UqRLD491bhjAxi
	jlFsPz4nyVU1heiUwa1kaflrbqVM8oaTqJW8BDvucwCIP/tBvWZOGZIKbLrg/K8zXL
	/wI4rLxoyhHpFWxg7+oIgpFeSpBvqqozLz7fmALTmnXpopyj9FR1GqFLoyOId2X4Aw
	wkB0D/tKHoTnGx985QEsKig0=
Date: Tue, 13 Aug 2019 23:44:42 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190813204442.GA15311@localhost>
References: <20190813195239.30048-1-open.source@oleksandr-kravchuk.com>
	<CANNYZj8iGTPsJ9jJL70o9xfs2JKAikWrxtbmoBB_xQ-ZLMkzqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8iGTPsJ9jJL70o9xfs2JKAikWrxtbmoBB_xQ-ZLMkzqw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] xrandr: update to 1.5.1
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
X-List-Received-Date: Tue, 13 Aug 2019 20:44:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Aug 13, 2019 at 10:01:25PM +0200, Alexander Kanavin wrote:
> On Tue, 13 Aug 2019 at 21:53, Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com> wrote:
> 
> > SRC_URI was moved from xorg-app-common.inc, since it has hardcoded file
> > extension (tar.bz2), but upstream stopped publishing tar.bz2 archives
> > for newer versions of the packages.
> >
> 
> Should this be rather fixed in the common include though? I took a brief
> look here:
> https://www.x.org/releases/individual/app/
> and it seems like we can switch to xz for everything or almost everything
> without much pain.

If there end up several compression types here this could be made 
configurable, similar to GNOME_COMPRESS_TYPE.

> Alex

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


