Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 91F777F7E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 20:17:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47JDWM6GDwzv;
	Wed, 20 Nov 2019 21:17:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574281040;
	bh=CNgWCFr8i98LA4mVsmO8jz8pJDUx7EZQZjUkI1ODKmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISiJPQ8PuXeNS+cVC9HcOViWsCbrdrZp6iRJ7ULzHAMrl+e3Mt8Wr3bKEDiWqCH6N
	NmcvBa5IJkSAkx+nJjPuVdK3xWTAzINbGDRIZ9MAEXYC8KlsIBpwRuYexXI3nE3J7c
	Wu8jtn9ngQIbpTAPIvuwIrAa3MVhOtMqntK0PoDVl8cCdZnCV0rBsDk/Cp1kTvqwc9
	0x7zfnG/OoM8Y2un48jcdljjJdZlGQm1XsimCyIKBwwGMbQwhFGaE6Y9f6pTKacgDv
	DEylUlDgs6Ep2//ZYppCKVHvEQkDl+s3fVN67du2EcikMiOmE8NcpTpLbnqTlgdh24
	G+TGa/5Lfaxq6zWkW0VgSGEGzVbCws8W14oPDCiVdEvc5mHktDE4GrPCLy9xfLqf9e
	vEYgNQXJZNoYee4P0XuDUm58HC8nKmpWjL0Eyo0vAgSAjnyBgwRCBiWXPSs8WXNOFQ
	PClvXbEoNwDX/fB5z1okAQp8oPfi0S5GDXmXVVBFJ1QYxYCuGY/i5ujZ5K5CJA7quG
	lEjeN43C618sgOQIbtHi0sCB26wmvSNOY1kQqEjA9L4IZNtj1lILDD6dXU9gfX6XYk
	vLgwbxGDldA8pF8o9U4I9ed6vRO/fJqNTkaL/K3hjlIW1SqQwvjrRn8R3nb131O0Eu
	hUFEenJOcvuBRO243FN2lD48=
Date: Wed, 20 Nov 2019 22:17:17 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191120201717.GA23850@localhost>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
	<CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Wed, 20 Nov 2019 20:17:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 20, 2019 at 09:00:28PM +0100, Alexander Kanavin wrote:
> On Wed, 20 Nov 2019 at 20:49, Adrian Bunk <bunk@stusta.de> wrote:
> 
> > > Using serial lines for console work may have its uses,
> > > but for transferring files please set up proper networking.
> > >...
> >
> > I've had several recent embedded experiences where this was impossible,
> > and lrzsz was extremely useful.
> >
> 
> Do you want to maintain it?
>...

Did you already contact the maintainer whose name your patch removes 
from maintainers.inc?

> Alex

cu
Adrian

