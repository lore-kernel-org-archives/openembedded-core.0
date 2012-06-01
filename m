Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SaFoK-0008OR-8m
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 02:33:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q510NNge015138
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 May 2012 17:23:23 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 31 May 2012 17:23:23 -0700
Message-ID: <4FC80B79.6070101@windriver.com>
Date: Fri, 1 Jun 2012 08:23:21 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1338434706.git.liezhi.yang@windriver.com>
	<87ca0cf2285b018489bde046b0aa7e17a767c70a.1338434706.git.liezhi.yang@windriver.com>
	<D16CA58F-8D7A-4910-ACCA-84E01CEE6510@dominion.thruhere.net>
In-Reply-To: <D16CA58F-8D7A-4910-ACCA-84E01CEE6510@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] opkg 0.1.8: respect to the arch when choose the alternatives
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
X-List-Received-Date: Fri, 01 Jun 2012 00:33:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/31/2012 11:01 PM, Koen Kooi wrote:
>
> Op 31 mei 2012, om 16:13 heeft Robert Yang het volgende geschreven:
>
>> There is a bug if we:
>> 1) bitbake core-image-sato-sdk MACHINE=qemux86
>> 2) bitbake core-image-sato with MACHINE=crownbay
>>
>> Then several pkgs in deploy/ipk/i586 would be installed to crownbay's
>> image even if there is one in deploy/ipk/core2 and we have set the
>> core2's priority higher than i586, when the version in deploy/ipk/i586 is
>> higher. This doesn't work for us, for example, what the crownbay need is
>> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
>
> And this is working exactly as intended. Don't break opkg because your hardware driver situation sucks.
>

Hi Koen,

Thanks for your great patient on this patch:-), I'm afraid that this is
not working exactly as intended, since the rpm or dpkg doesn't have this
issue. (I have fixed other issue for rpm, but not the same as this one,
the xserver-xorg-1.9.3.rpm had installed correctly before the fix for rpm).
and dpkg works well without any fix.

I'm also glad that if we won't fix it.

// Robert


> So: NAK on this patch.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


