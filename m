Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 079C27FB2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 21:13:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472kpP6nfVz65;
	Tue, 29 Oct 2019 22:13:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572383614;
	bh=FKUQRrevZbh/1IoBJsGaQ9tmQhnxFBLqWJtJUzQarPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txHLGdZ8QP4y+WBcKJxOSGK54472R9U+KXrhkga4MzAS7Ljma7KGmCq6nf9fS9jJq
	6MzWp6tkEpxeAHPUwCDl4AXUoKxVZ84YIKYYgx78v5ISx50oNhIUXKVDNCZifICo2I
	IiVLJfvcEywUD/GDXSRkUoVW8jIZ0RFUcCHuQrEtaSlLb7Skretz66OKttaelKl2BZ
	girYc19zgjNZZeikT7p+kUxLuKG2fDjj27SrgwJdOj9WEVsGWUA9OTB38vkyB3/ALb
	TDw2SorWg+0DBIuRRPEr7wakO3tpTCXTXr9VXsilBCmX5+d5L0bnNyzen7EGqnMC5W
	nmZYLr69jM+7PvrziUe453fNtbAke5SxLKPZPVRZrAgCx3D0Q493QiZU7x7w1aLTfv
	SK2ACRmtegepTKCk5xDl1Obu6R34KYTnk29LtpjdG7LJAErwekOqqVbmusNmMzA7Mh
	VKUXTKRMAixTcHMXQ9n7RpEDY8FP+rhONY7KP9q6Sm2bRDc9lxdSiIwxswZxzib6QA
	/nsNl94V+V9gZdjBykzM0/4nIw6OktvPepotrG1ZZWd7ZSNiBWEDiRkpaxkS1dMoIR
	MVbqS9RReTs3yYqZzjmqbXELGKaIwsEiS8a0l4s4O+zgqFCzTiqbGeS9WaL+lmo7rq
	oESLh8F+NexarkTL0PjQAyHI=
Date: Tue, 29 Oct 2019 23:13:31 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <20191029211331.GB26658@localhost>
References: <20191029203921.17227-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20191029203921.17227-1-trevor.gamblin@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: inotify-tools: move recipe to oe-core from meta-oe
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
X-List-Received-Date: Tue, 29 Oct 2019 21:13:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Oct 29, 2019 at 03:39:21PM -0500, Trevor Gamblin wrote:
> An interface for inotify already exists through pyinotify,
> but migrating inotify-tools to oe-core provides an option
> that doesn't rely on python.
>... 

pyinotify is in meta-python.

The only option currently in oe-core is to use C,
which is the standard way to use inotify.

inotify-tools can be useful, but I don't see the rationale
why it should move from meta-oe to oe-core.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


