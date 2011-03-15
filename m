Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PzbSR-0002XH-QM
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 22:07:12 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PzbQo-0006fZ-R0 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 14:05:30 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 15 Mar 2011 14:04:19 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Tue, 15 Mar 2011 14:04:18 -0700
Message-ID: <4D7FD442.7030607@mentor.com>
Date: Tue, 15 Mar 2011 14:04:02 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1300195841-21137-1-git-send-email-Chase.Maupin@ti.com>
	<077BC74A-B64F-44E1-8437-6D565D3D3737@dominion.thruhere.net>
In-Reply-To: <077BC74A-B64F-44E1-8437-6D565D3D3737@dominion.thruhere.net>
X-OriginalArrivalTime: 15 Mar 2011 21:04:19.0323 (UTC)
	FILETIME=[8D0A94B0:01CBE354]
Subject: Re: [PATCH][angstrom-layers] u-boot.inc: allow variable make targets
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
X-List-Received-Date: Tue, 15 Mar 2011 21:07:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2011 09:34 AM, Koen Kooi wrote:
>
> Op 15 mrt 2011, om 14:30 heeft Chase Maupin het volgende geschreven:
>
>> * Later versions of u-boot sometimes have top level make targets
>>   such as u-boot.imx, u-boot.kwb, and for upcoming TI devices
>>   u-boot.ti.
>> * These targets define different calls to the mkimage tool to
>>   change the images created, such as changing the load address.
>> * This change allows recipes to change the default make target
>>   of "all" to something like u-boot.ti or u-boot.imx by setting
>>   the UBOOT_MAKE_TARGET variable.
>>
>> Signed-off-by: Chase Maupin<Chase.Maupin@ti.com>
>> ---
>> BSP/TI/recipes-bsp/u-boot/u-boot.inc |    3 ++-
>> 1 files changed, 2 insertions(+), 1 deletions(-)
>
> Thanks, pushed to angstrom-layers master.

Anyone have an opinion about for oe-core itself?

-- 
Tom Rini
Mentor Graphics Corporation


