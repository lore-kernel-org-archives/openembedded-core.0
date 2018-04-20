Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id DFFD874638
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 22:09:16 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id h3-v6so26502938wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 15:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZDvSLvQXw4UyCtg/e7A/YBU9bYImxW3Yg6LQ0af94sI=;
	b=lIdF2awiQx2lqhIkBCukPYM2AbazIhREH8QmEILXTWB0jpGPdCu8DCn8CPDHictuxt
	6G2Ygz1K4TzOMd3KAaPduqhOJqAG9crL2GnXVXd7RSCY/IBrup81OoMRx92hkiZipV6U
	qE6JvYuJnzpMS85YZX6Gc93eZOtA4PaL10cOpo5CLbUrNxm04MS8W10dxSyj8NcDmRQ5
	lZgcGuX2dehbHgd4K9JamjrcngJwrcZJTYvKAr8ERZ85Omws3JOBqBKah+IIsFfxytrB
	hayWbV0vTF2S5c92jNJwc/QffSdi2Ssh00kEfXe2reQ62t7xS+l45KSvXJW3HPV+Yu4b
	Dqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZDvSLvQXw4UyCtg/e7A/YBU9bYImxW3Yg6LQ0af94sI=;
	b=LHAbwC8xBM9MzK4IwGg8BrIB+W1FZMjFgfh9M0YrcbQjsCXr1dwRcQxQJTvPgcYlh+
	nYSRwqlAF5W4MgdkWKYYPk8lfIzCI7P5xyAgAlRdJuiBomKfQ2l8ndJw8HAn1Ud8WO44
	5owX7XFMnsrN5ff1i3RlTkEbRrbml0HAPCyk55IOLDcuaSN3EWcct9eZg8a8wTozgTsM
	4Vj9hIwKBVeGobg0zIdVveg7NIL2Xah6a4QGAbBjctL2hhAr40nPD1tpJ4VObvYj/2SU
	tV0pLxcn1ScNJY6YRqgp8Rfdi19LIgftyVTIsoMn6qngFzb+H7txSMwd9u/Ve5hldxfO
	ZKNA==
X-Gm-Message-State: ALQs6tCWoRUNa6Oke7xk3kbkx7vxivKgLETM5EmT/66K/4X8H8Cy5D3t
	hZoIYkMhG0aybwm6+Rt5XB5sKRIBXGZv41A6GHM=
X-Google-Smtp-Source: AIpwx4+Yama6FpkBbPtMAi5bZgQGoXEtnbEP5h90nbzkhu4OAkMGEpO4vNmIVuqqL3/yRuVHIR9gNn3H7VPvSGO653s=
X-Received: by 2002:adf:afe4:: with SMTP id
	y36-v6mr9532305wrd.107.1524262157495; 
	Fri, 20 Apr 2018 15:09:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.229.210 with HTTP; Fri, 20 Apr 2018 15:09:16 -0700 (PDT)
In-Reply-To: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
References: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 20 Apr 2018 15:09:16 -0700
Message-ID: <CAJ86T=VfGDpng=GRuZVDBLm_2Pgh6pEKm3+1KpeN+kXAweLyvg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of Sumo
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
X-List-Received-Date: Fri, 20 Apr 2018 22:09:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 20, 2018 at 2:57 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi,
>
> We'll hopefully be firing the 2.5 RC build on Monday, so I did a build
> today to see where we stand. As is typical we got two new failures on
> the autobuilder...  My test build included the pseudo bump which
> caused an almost complete rebuild, which is a great way to shake out
> intermittent failures.
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12704
> Go appears to be using the target CFLAGS when using the host compiler,
> with predictable failures when the host is old and doesn't support new
> flags.

Maybe worth resurrecting something like:

  http://lists.openembedded.org/pipermail/openembedded-core/2016-February/118212.html

to flush out similar issues?

> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12705
> u-boot build failure
>
> CC'ing the usual maintainers of those two recipes, if you get a moment
> to look at these then that would be much appreciated.
>
> I'll also say that if you have any outstanding patches that *need* to
> be in 2.5 and can't wait for 2.5.1 then say so now, or forever hold
> your peace (and submit them for master/backport to 2.5.1).
>
> Regards,
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

