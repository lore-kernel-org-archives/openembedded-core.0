Return-Path: <mike.looijmans@topic.nl>
Received: from smtp01.online.nl (smtp01.online.nl [194.134.41.31])
	by mail.openembedded.org (Postfix) with ESMTP id 29B0B60808
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 14:15:59 +0000 (UTC)
Received: from smtp01.online.nl (localhost [127.0.0.1])
	by smtp01.online.nl (Postfix) with ESMTP id 5B4728E8BB;
	Fri,  2 May 2014 16:15:59 +0200 (CEST)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp01.online.nl (Postfix) with ESMTP;
	Fri,  2 May 2014 16:15:59 +0200 (CEST)
Message-ID: <5363A89F.6060709@topic.nl>
Date: Fri, 02 May 2014 16:15:59 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>, 
	Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
References: <CAB3sqtZbtJGsh_jMUnvJAyFmXJVHZT2bvZ=DJ0N-fSB-VYu4Tg@mail.gmail.com>	<969F26A8BAB325438E7EB80D3C3134FB1CEA4705@IRSMSX105.ger.corp.intel.com>	<CAB3sqta0_u-Uv4EKXd6Y9upxyQfDEQ9_m_H=OL=tmMFKRb_14w@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CEA474F@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1CEA474F@IRSMSX105.ger.corp.intel.com>
X-Online-Scanned: by Cloudmark authority (on smtp01.online.nl)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 02 May 2014 14:16:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

When using DHCP, busybox's udhcpc script will write the DNS entries that 
the server returned into the resolv.conf file.

In this case, I think you'll have to "provide" resolv.conf in some other 
way, there's nothing in ifup/ifdown that will modify resolv.conf based 
on keywords in the interfaces file.

Mike.


On 05/02/2014 02:49 PM, Iorga, Cristian wrote:
> Not really, I just wanted to get a better overview of the issue that you
> are facing.
>
> What image did you started from, if any?
>
> *From:*Tarek El-Sherbiny [mailto:tarek.elsherbiny@gmail.com]
> *Sent:* Friday, May 2, 2014 3:31 PM
> *To:* Iorga, Cristian
> *Cc:* openembedded-core@lists.openembedded.org; yocto@yoctoproject.org
> *Subject:* RE: [OE-core] DNS when using Static IP
>
> No connman is not included.  Shall I include it and try?
>
> On 2 May 2014 13:01, "Iorga, Cristian" <cristian.iorga@intel.com
> <mailto:cristian.iorga@intel.com>> wrote:
>
>     Hello,
>
>     What image did you start from, if any?
>
>     i.e., core-image-minimal, core-image-sato, etc…
>
>     Is connman included?
>
>     Regards,
>
>     Cristian Iorga
>
>     YP
>
>     Intel Corporation
>
>     *From:*openembedded-core-bounces@lists.openembedded.org
>     <mailto:openembedded-core-bounces@lists.openembedded.org>
>     [mailto:openembedded-core-bounces@lists.openembedded.org
>     <mailto:openembedded-core-bounces@lists.openembedded.org>] *On
>     Behalf Of *Tarek El-Sherbiny
>     *Sent:* Friday, May 2, 2014 2:05 PM
>     *To:* yocto@yoctoproject.org <mailto:yocto@yoctoproject.org>;
>     openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>
>     *Subject:* [OE-core] DNS when using Static IP
>
>     Hi.
>
>     I'm trying to set my IP config to a static address.
>
>     iface eth0 inet static
>
>           address 192.168.55.45
>
>           network 192.168.55.0
>
>           netmask 255.255.255.0
>
>           broadcast 192.168.55.255
>
>           gateway 192.168.55.1
>
>           dns-nameservers 192.168.10.2
>
>     But I don't get the DNS server address to be included in
>     /etc/resolv.conf
>
>     If I run in dchp mode, then the resolv.conf is updated with my DNS
>     address.
>
>     Is there something I'm missing here in my setup?
>
>     --
>
>     /Tarek/
>
>
>


-- 
Mike Looijmans

