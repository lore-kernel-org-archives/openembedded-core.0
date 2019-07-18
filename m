Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC5B7EEB0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 06:04:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45q3Vh57pYz4q;
	Thu, 18 Jul 2019 08:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563429853;
	bh=Ej20hsbDZFD6xB/meUxeTUlub6PNpRq6pjIvQDaqV6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SXquLpKUOIwxvon5Ijyr6Usnxq0rDp0MMvd3cXOWZgGbrS+uiu/70yO1x4K/NBCyB
	Rr2+6FDa8RvMprXwwAe5H9DYz5QRXHdqrBI6Tcbdn+OskSSMCexalhG9KmNI2g3A2j
	zIjMT6yNMq7bnJ1TwWfLxht++eitr4PMNI5YD+6y7W8jHMujXkrK8INUpc7SdiPTR8
	Ex3CQ7B9dwe5SAWXuTzqdTErZbfe4tAT8s9frjATF3VBR6+9jXL1i2pyMe9x2a3jLb
	mvfGNneaE83quI//E4v2K6WKlXvvNqeYSTAskLxQLRVg6e9oYircmqWFpryJQfMKth
	5PoCpc79vSM6y6aMriX2L2JV6LAeCW0yynwZ4IxeHvmifEndbEwr+kzf4jJF4DKayf
	DdGOPf8K/wdJE5DlDTUXUpsQDup51cksYiD2A1ravrnXK8imIePI3gY49Y6S4oYtCw
	azr+0HLjxYpdsIxyk6j4sHcuJ0oy3RUZTdD1OBdzWqmCI+eJp71wE0nKWNTmjvHckF
	rZ3wD0H9xqXsp91znXiF19LAGg1K8muxU6DEFEnRmUFsQlpJP2gSJ9BBwwo8wZYuKD
	+Bd7y6lRPeiWe4xdNy9C62N0rcOb+SATyrift7cQMFfLEcPfKNalR+FnqUcINTrOis
	s97rIhMjuvGI1pDXrQGI3ys8=
Date: Thu, 18 Jul 2019 09:04:09 +0300
From: Adrian Bunk <bunk@stusta.de>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190718060409.GA27459@localhost>
References: <CAJTo0LaOHbSB75OGLsHJ3Vxd5eVgg9+7Cq3k0=P-BwPLpFiyjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaOHbSB75OGLsHJ3Vxd5eVgg9+7Cq3k0=P-BwPLpFiyjg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Yocto-mailing-list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: dropping official support for Debian 8 / Opensuse 42.3
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
X-List-Received-Date: Thu, 18 Jul 2019 06:04:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jul 17, 2019 at 09:37:31PM +0100, Burton, Ross wrote:
> Hi,
> 
> Now that both Debian 8 and OpenSuse 42.3 are end-of-life and no longer
> formally supported, we think it's time to drop them from the supported
> distribution list.

Debian 8 is still LTS-supported for a year, unless there is urgency to 
drop support for it the right time for dropping would be after 2.8
(2.9 release and Debian 8 LTS EOL will both be in Q2 2020).

Should OpenSuse be dropped, or just the version upgraded to 15.1?

Fedora 28 is also unsupported (but will be the basis of CentOS 8).

> Initially this involves removing them from the
> SANITY_TESTED_DISTROS list in Poky, at some point during this cycle we
> may remove those distributions from the Yocto Project autobuilder to
> add more workers for other supported distributions.
> 
> It is expected that the next release will probably work on those two
> distributions, there are no plans to do new and exciting things
> dropping these unsupported distributions enables -- like increasing
> the minimum Python version to 3.5 until after the 2.8 release in
> October.

CentOS 7 is based on Fedora 19 from 2013.

This is the oldest currently supported distribution, and when to remove 
support for it (replacing it with the not yet existing CentOS 8) should
IMHO be part of this discussion.

>...
> Ross

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


