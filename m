Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7391060043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 07:35:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45Ttrz5Hr7z2M;
	Thu, 20 Jun 2019 09:35:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561016132;
	bh=l2Ira6NT+1lSNoJ/pCA9JI7p0EQuyGYkOjFYOyWImwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kgag15EcS8Q9yMWxW+cFg5sRuPxLobokvAtVwFyFGF5cqfSDzGiI+DMH8ZH1I2iNj
	dYFWdXu3l2J8okxpk8E0rv15CEGO6dsNxdyFv53GKgw9IgunLlDM6toz0+AHry48pt
	6k5IaJn8/RRAtUj6jcxQyY63HPbtg3lJI8If0z+hz4semx7RE1PsP9HrgK6eSee4aW
	AfEV2GQrZ7TrwhH7vQ/2yPJZGtewIUrxQ4ndaYl9rTf9AY2bvCEc6bySVg+zBQVXx+
	cWqpHGBODhTbr1SH/H+Q7bUOCmjJKnHJf4pNxbQL7LmsfdMS7Vl79Q2VSGx/PuLutB
	dIIYp9F5SxbTQfLui7T6Si18zNHUDzSJ42aOgaGg5BW4K1Bl7nMeWtJsJVamplbD3D
	YslhPx0hWZvoa1LODdUppW/p+aQXAOETP7EErKYnNdsFhglWjXPJz0M91v1oMXA7RW
	AMERJZX6A2li4kwh3rXPkZS4x0CL/SUUO4twkQpq7fiS/1tTwPxIrGekCAK7yiKkma
	SUnvTaZAQgu2Y6H2NITfrFRHbe7fuUtiYOYELpDnJmOr++bAvEWl9L0TJaG9U5XMwu
	4FN58Y3qKSzW/jZuON5QrGz7vgXSIgTpNcYgTa6LMz1ti4UFWhPQWT9E2oM/pWnByN
	jQUAqVa71VV9IIu32WYhV1KA=
Date: Thu, 20 Jun 2019 10:35:29 +0300
From: Adrian Bunk <bunk@stusta.de>
To: changqing.li@windriver.com
Message-ID: <20190620073529.GB27107@localhost>
References: <1561000443-320248-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1561000443-320248-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mdadm: fix systemd service start up failure
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
X-List-Received-Date: Thu, 20 Jun 2019 07:35:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jun 20, 2019 at 11:14:03AM +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> 1. mdadm: No mail address or alert command - not monitoring
> 
> with --monitor mode, mdadm needs a mail address and/or a program.
> This can be given with "mailaddr" and "program" lines to that
> monitoring can be started using.
> 
> fix by given a mail address, user can replace with a valid one
> when use.
>...
> +        sed -i -e 's/#MAILADDR root@mydomain.tld/MAILADDR root@mydomain.tld/g' ${D}${sysconfdir}/mdadm.conf
>...

Defaulting to try to send emails to an invalid address is worse than not 
having an email address configured.

Looking at the manpages I would have expected syslog-only monitoring to 
work if neither mailaddr nor program are configured.
If this isn't working, is this something upstream considers a bug?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


