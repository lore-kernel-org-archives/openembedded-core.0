Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 492467D72F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 09:19:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45Tx8h227Fz2M;
	Thu, 20 Jun 2019 11:19:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561022356;
	bh=edB/Bf0kJuRO5hLFOu6rJrXTT3ytSTMRp3BkWS77UNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZg7zU/NoVA+8vA1R5R+cWD0Qzqe+rBuXcL/7XZxRN7+sb6Xy6gMKiZSOiRxAQmXk
	+agF3WQYIEQqIjQ5sw+i7Up/lV8/Au8zfQqx1Qwm+Edw/VEdKyF6HW3fmxvq2GXp13
	Pie19A2Mr6FWspnoXY4YrJqLZ1wf9NkzZ22K+TbPZJTHtBw6wM2nkYyHK0UgUEi1mh
	cPpv0jhFk6atr0gyCLOvY22aqYBh85fjzipjl6ZS/anaIhUjcCDwpgxy+mMc4pND9k
	lpS3FPzZpmw3Eiv5ydUEY4oKDQdxvwgMMe/D6yzpwoyLic//UdiUj7RtPYtviasYe5
	FHCi8HAa03relfp2RHIYvMrdUdPgp5LzVu4KMk+fq+BLzVVOqrdDghsu3JTzJB+s4Q
	kw+JkDBxl2blRITs1RpbxLW2gTwcMh4Rf3MdgU/jMNXvJoBMbCpKNv7HEk6m2nK5s6
	zxzEWkbP95dWLC1dptvcuvSoIZv4HhTN/Hq83DhSikCnNQw58yCTvJwNIdSzwJzwzT
	YwA6QGCJhPWC0iNDpSbEBwouy9DH2P0A/bBnNhxiOBHhTjnCxg3LRxWvgKPYt5CvLv
	2SnwjSpflHnExYZq0AAaZhiox/O2/FB8znHJK8bLtO96E+f1JdL4e2oLFU5i7E+rwo
	waxB6aOjLcpVrHAPhZi7i7Vs=
Date: Thu, 20 Jun 2019 12:19:13 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20190620091913.GD27107@localhost>
References: <cover.1561018476.git.liezhi.yang@windriver.com>
	<b7589dd06670ead7a2ca7e8c7301b289e2543249.1561018476.git.liezhi.yang@windriver.com>
	<20190620082858.GC27107@localhost>
	<07882a06-4c45-07aa-9696-8de4f86b8c0b@windriver.com>
MIME-Version: 1.0
In-Reply-To: <07882a06-4c45-07aa-9696-8de4f86b8c0b@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gtk-icon-cache.bbclass: Depends on gtk+3
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
X-List-Received-Date: Thu, 20 Jun 2019 09:19:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jun 20, 2019 at 04:46:16PM +0800, Robert Yang wrote:
>...
> Maybe gtk+2 is out of date? Since gtk+4 is on the way, so I think that we
> need something like virtual/gtk to fix these problems totally?

GTK+2 is mostly obsolete.

I just checked the GTK4 sources, and there it is renamed to 
gtk4-update-icon-cache. Based on that I would say that your
patch is actually fine at least for now.

> // Robert

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


