Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 882FD7ED76
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 03:36:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Lt3t0S3jz4f;
	Mon, 25 Nov 2019 04:36:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574652970;
	bh=az/zRgwoqx9TE09ZnwQ/rWaXUju8dhgCeLoYHITsyKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bzPkJ+y4288KazSjgc76qZ9iDovP+u+fbT2BsP2sRC6vbEiYTb0Td0c4GgLAijY4S
	VIwwDdWNdVUa1FtmPVZk67uxpBdxpY06idj5YdkGvP4hRwFaH4jNX7xxqel5OeA3XA
	lwwnxO3Bguo71ajxla29+yR+rCNEGlGNEK2ELGZ1eJHRfVfCoeNUzGxspvbo8ZdLn7
	ekD3KXfNP5LJ3H+ASM4g+QtEkS8g+/kK5YMxYDElF300Cu0iPFVyQllYiQ5MIXPH0K
	S1xZjd9OEjYbV0ytI9WjqdlEBWCbK2t8jqOBl+g6RgTn8GTRFTTwAJL+YlA/hkgdzf
	4GipzsLUnbVjGyDY/IeocJNpHqH+RgcZ/gwjcwudgsQsa5FkNzSx70D47fW+vzZf4A
	uDlhjdHvUN3XKCOlzATMDlaS+kn1FqRmCjbESx+l67VOK9XSODINdZ0dGjPO1OjJM2
	kL2oK9B1iYPLNYPsQSyfanATciywJyCLtYgZeh3p+dl3WZWauvKAHV8kLJ0mewgTvR
	0IgQexsFGwxm8C/p1RXRKszdPy2HvKzL9MzF3W118mReZDudVBCXKiZ/epiW/MncUT
	SEUhsVEakWy19dNtEkzKTlwMEpsp342tGYafITVmfQ2ZPEayvG7sh2e96bRgaT31+p
	7wCh6aNXSn8arebsDnlGdQNw=
Date: Mon, 25 Nov 2019 05:36:07 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191125033607.GB16252@localhost>
References: <CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
	<20191118220613.GA7568@localhost>
	<CAMKF1sq3hnUuM7rcCbEhfbTmUtGbpMVVZkq8mFo24FKGG=kFYA@mail.gmail.com>
	<20191118225500.GB7568@localhost>
	<CAMKF1squJq7mLJJBhf_+EQbBTHb1c8R1g449e6Uo2v=MtNk2XQ@mail.gmail.com>
	<CANx9H-D0Bve0QUDd3pERWV7xOvTfjro5+=FuaAJUxYz+tp3X5w@mail.gmail.com>
	<CANNYZj_2+0+6Suq0Gu74t+QDhx3mdb6FZsr2mwy8WhtNk493ug@mail.gmail.com>
	<CAMKF1spXYo2-Qor9YpPs13+EgCpxLq+f7Bc69YUXPmHwEJRdAw@mail.gmail.com>
	<20191119163036.GA4044@localhost>
	<f63e4c7f-c961-453a-ba91-5175675829b2@intel.com>
MIME-Version: 1.0
In-Reply-To: <f63e4c7f-c961-453a-ba91-5175675829b2@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Mon, 25 Nov 2019 03:36:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 20, 2019 at 11:57:47AM +0000, Ross Burton wrote:
> On 19/11/2019 16:30, Adrian Bunk wrote:
> > You want meta-oe to have a LAYERDEPENDS on a new python2 layer that is
> > not in meta-openembedded?
> 
> Would that be a bad thing?  Layers shouldn't care about where they are
> hosted.

Hosting is less of a problem than maintainership and quality.

And when something isn't good enough for inclusion in meta-oe then 
meta-oe shouldn't depend on it.

> My ideal would be that meta-python2 exists with both the python2 recipes and
> all of the py2 parts of meta-python.  Until meta-oe is Py3-only, it can
> either depend on this layer or recipes are blacklisted unless the layer is
> present.

Layer dependencies are not transparent, a dependency means all users 
have to add meta-python2 to bblayers.conf.

> Ross

cu
Adrian

