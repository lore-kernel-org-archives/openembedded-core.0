Received: from dgate10.ts.fujitsu.com ([80.70.172.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RnWPv-00044z-5c
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 15:23:11 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:References:In-Reply-To:X-Enigmail-Version:
	Content-Type:Content-Transfer-Encoding;
	b=oRG+zZA+gylUdNGJWpy4w39ZCIMiWk6yps7XzXoAUx9l5Az7i3Lw6n0q
	MQo1opXQeZQnkG3M2oxAggfq40tkL1CuVgiwQNflnlybuyvhKA+8iVpEF
	OfeZO1xCoqdBF53wskPbhtoqtFSGmXTHzXrFSrTqQxRcE8LCUD1aN32My
	ncMNpLqfuPesJdSzH9/7FF+Y4eIRsKPrhly2pCFNSmfVZMzvtelm4D4Hf
	/tKQEYxm6GScMD0aLMiFMQepxxVqo;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1326896136; x=1358432136;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=CCBdvyYTW1k0GOOgOmfkJlr0GX5Y45WqzpMBZAohGSs=;
	b=tsE6VIAfv/UMnfm3VWhoUNetX5GxtpCgeYX/Vax5GExbrgSKtr4ycSmz
	lDwXxdeAmrn9J02MJmgdPGDGI5MOu8Jq2PCgAKGmYTJCEKYdnkscsPhDy
	rFFYdSPT5xK/rt4ICqBeMsev1vVVYldBz7zk484eB67UaOX8d4jKRYRkI
	ZHSNJ9bFUF4gZbkdJMVespbpxzOH4zExjvchFc3NAokE1rDE+H7h7dJL2
	DSMS9tjtMPDxjgCPWOpQwWyslNb5h;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.71,529,1320620400"; d="scan'208";a="99022073"
Received: from abgdgate30u.abg.fsc.net ([172.25.138.66])
	by dgate10u.abg.fsc.net with ESMTP; 18 Jan 2012 15:15:35 +0100
X-IronPort-AV: E=Sophos;i="4.71,528,1320620400"; d="scan'208";a="126985006"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate30u.abg.fsc.net with ESMTP; 18 Jan 2012 15:15:34 +0100
Message-ID: <4F16D407.70801@ts.fujitsu.com>
Date: Wed, 18 Jan 2012 15:15:35 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F16C61C.4020304@ts.fujitsu.com>
	<965E9502-1313-4711-9FF9-49A01141319C@dominion.thruhere.net>
In-Reply-To: <965E9502-1313-4711-9FF9-49A01141319C@dominion.thruhere.net>
X-Enigmail-Version: 1.0.1
Subject: Re: How do I get rid of systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2012 14:23:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Am 18.01.2012 14:28, schrieb Koen Kooi:

> What's wrong with cgroups?

Probably nothing. But now I've got an image that has both systemd and
systemv to boot up and that results in an endless loop with kernel
messages about omap_i2c.

My idea was that OE is a toolchain that enables me to build a customized
distribution, so I thought I have the choice to use
systemd or systemv with a configuration setting. But it came out,
that systemd is sort of mandatory nowadays and its not that easy to get
rid of it.

Regards
Rainer
-- 
Dipl.-Inf. (FH) Rainer Koenig
Project Manager Linux Clients
Dept. PDG WPS R&D SW OSE

Fujitsu Technology Solutions
Bürgermeister-Ullrich-Str. 100
86199 Augsburg
Germany

Telephone: +49-821-804-3321
Telefax:   +49-821-804-2131
Mail:      mailto:Rainer.Koenig@ts.fujitsu.com

Internet         ts.fujtsu.com
Company Details  ts.fujitsu.com/imprint.html


