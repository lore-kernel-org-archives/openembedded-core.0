Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 482 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 May 2014 15:46:36 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 96034607FE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 15:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 3277B314BDB5;
	Fri,  2 May 2014 17:38:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id kNeSH7KFX-S7; Fri,  2 May 2014 17:38:25 +0200 (CEST)
Received: from [10.200.6.10] (unknown [82.149.226.166])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id BD6D2314BDB4;
	Fri,  2 May 2014 17:38:24 +0200 (CEST)
Message-ID: <5363BBEF.4090706@opendreambox.org>
Date: Fri, 02 May 2014 17:38:23 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>, yocto@yoctoproject.org, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <CAB3sqtZbtJGsh_jMUnvJAyFmXJVHZT2bvZ=DJ0N-fSB-VYu4Tg@mail.gmail.com>
In-Reply-To: <CAB3sqtZbtJGsh_jMUnvJAyFmXJVHZT2bvZ=DJ0N-fSB-VYu4Tg@mail.gmail.com>
Subject: Re: DNS when using Static IP
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
X-List-Received-Date: Fri, 02 May 2014 15:46:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Tarek,

On 02.05.2014 13:04, Tarek El-Sherbiny wrote:
> Hi.
> 
> I'm trying to set my IP config to a static address.
> 
> iface eth0 inet static
>      address 192.168.55.45
>      network 192.168.55.0
>      netmask 255.255.255.0
>      broadcast 192.168.55.255
>      gateway 192.168.55.1
>      dns-nameservers 192.168.10.2

FWIW, in Debian-based systems, which is where ifupdown comes from, you
need to install the resolvconf package in order to handle
dns-nameservers entries. I don't know whether that's compatible with
busybox' implementation of ifupdown, though.

Regards,
Andreas

> 
> But I don't get the DNS server address to be included in /etc/resolv.conf
> 
> If I run in dchp mode, then the resolv.conf is updated with my DNS address.
> Is there something I'm missing here in my setup?
> 
> 
> -- 
> /Tarek/
> 
> 


