Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1QpJwk-00053u-Q4
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 14:56:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p75CpkM6020565
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Aug 2011 05:51:46 -0700 (PDT)
Received: from [128.224.147.214] (128.224.147.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 5 Aug 2011 05:51:46 -0700
Message-ID: <4E3BE761.6070407@windriver.com>
Date: Fri, 5 Aug 2011 08:51:45 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11 ThunderBrowse/3.8
MIME-Version: 1.0
To: Kumar Gala <kumar.gala@freescale.com>
References: <5EF017EC-CCFD-4040-9455-D022611ACD0E@freescale.com>
In-Reply-To: <5EF017EC-CCFD-4040-9455-D022611ACD0E@freescale.com>
Cc: "yocto@yoctoproject.org list" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Use of git.pokylinux.org vs git.yoctoproject.org in kernel recipe.
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
X-List-Received-Date: Fri, 05 Aug 2011 12:56:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11-08-05 08:50 AM, Kumar Gala wrote:
> In the linux-yocto_3.0.bb recipe we have:
>
> meta/recipes-kernel/linux/linux-yocto_3.0.bb:SRC_URI = "git://git.pokylinux.org/linux-yocto-3.0;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>
> Should this really be git.yoctoproject.org?

Yep, it should be! I'm sending a pull request for queue of kernel
changes, so I'll toss this on top of the pile.

Bruce

>
> [ I think the sites might be interchangeable, but seems like being consistent is good.  With the name of the recipe being yocto, and with the 2.6.34. and 2.6.37 kernel recipes ]
>
> ---
>
> There is a more general question if yoctoproject.org should be preferred over pokylinux.org
>
> - k



