Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3752E7D953
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 19:10:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44gnXf4lHfz3J;
	Fri, 12 Apr 2019 21:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555096227;
	bh=pQ9GlW1xZNp+M5Xnk9Z93C6NQQ9Ucxxl50RWXv/NGUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LtOFDmw0/7AZjakKzaSzShogINgoHXIlM1194np5RdfoO1CN5ndx0eBEH015MFQpY
	hOXlykfEUaRFPXbwaKvihlqGEpXfhwOn6Ha1tIDJI3/aipJIuCm2nr3PNAl22Fdeev
	Hi85+m7KqDmx2TH9ysyOe7Ly1SBNDfd7nQcP+FOoX3gw0vjsnSqJmZ/A9ye5Bgo+mp
	hfl/HhDgXQJrGSh93SJpWJPMUeesv5oPpiGxfhtU7WTSRPN55D4NqoKQ/Ila6RbJIB
	8XdH6PIB4XE8Z+q2c7c+4ZPd2K7A2umuXwX4gNTFSIzm+v8MOTlNVAn0jxjeE64LXn
	Z4fied/FEDeoHS2xicbk1o6lXROgFt0nAhxezBSwPO7fr4VOFopWczEUpRz3/pBrrc
	AUEVGCXb2c99iZoEehspOO+AQe8rO/zN+Dx9eWwLOu3mEsUXNJ/LNxeDPVaZQPYc8G
	pbBkG5BW/pTz6WmfccSgJqQrzgt9uTWYGerbYUpq3hRMNMqgE3MappWA8SB+XaBrJJ
	zHoq2Ca0EEZbMYvRqON4mUqb8pDnDE+jQLbPxgZOxPvExmTovXjWlMkESjryyUhIU4
	kwl3dlZP8jFMDrT4X3axLqHEfBy5/gBfiIGGn+29rBtMItvKM5dFhYQIx2znGIu2sg
	KZ152uOMS1qtiWncgiWC+hB8=
Date: Fri, 12 Apr 2019 22:10:23 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20190412191023.GA19080@localhost>
References: <20190412123046.17510-1-daniel.thompson@linaro.org>
	<5b21542499899b2465a2b1f581faba726351e58d.camel@linuxfoundation.org>
	<20190412131616.2mwd5qefxrvlxaw3@holly.lan>
	<85282e93-ffdf-6db5-f143-2139a5d4f90d@windriver.com>
MIME-Version: 1.0
In-Reply-To: <85282e93-ffdf-6db5-f143-2139a5d4f90d@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] go: Allow bootstrapping using host go compiler
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
X-List-Received-Date: Fri, 12 Apr 2019 19:10:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 12, 2019 at 02:26:20PM -0400, Randy MacLeod wrote:
>...
> In the long run, don't we want to avoid any new binaries or host tools? Is
> anyone else in the go community (Debian maybe?) interested in
> bootstrapping go on arm64 hosts or do they all just use the binary?
>...

Binary distributions like Debian have to bootstrap compilers only
once per architecture.

After the initial bootstrap there is always the previous version package 
in the distribution that can be used to build the next version.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


