Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0FCC86C131
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 15:06:47 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42wl7p650vz1qvP2;
	Thu, 15 Nov 2018 16:06:46 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42wl7p5NJRz1qsKH;
	Thu, 15 Nov 2018 16:06:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id QWOfq1IJyEn1; Thu, 15 Nov 2018 16:06:45 +0100 (CET)
X-Auth-Info: xk82TgQDeSlmF2pl1IrEDEHH3GNYPylc3HnJoqqVPG4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 15 Nov 2018 16:06:45 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181115124339.19543-1-abrodkin@synopsys.com>
	<23029415-903d-40f8-9f72-7d97d67aee7b@denx.de>
	<CAJTo0Lb=60EqJOVYYi2LQ_jiu+bKhKF=4T0bQAnVivjSP4bVvQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <b93175dc-79af-0cda-b975-c4bb429459bf@denx.de>
Date: Thu, 15 Nov 2018 16:06:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb=60EqJOVYYi2LQ_jiu+bKhKF=4T0bQAnVivjSP4bVvQ@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>, alexey.brodkin@synopsys.com,
	OE-core <openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v2] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 15 Nov 2018 15:06:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/15/2018 04:00 PM, Burton, Ross wrote:
> On Thu, 15 Nov 2018 at 14:50, Marek Vasut <marex@denx.de> wrote:
>> I have to admit, the recipe name becomes a misnomer then. But renaming
>> this recipe would be hard, since it's used all over the place. Any ideas?
> 
> Call it u-boot-tools, potentially merge the other recipe tool, and add
> RPROVIDES for compatibility?

Ah :-)

I wonder if it'd make sense to have this new recipe generate multiple
packages, one per tool ?

-- 
Best regards,
Marek Vasut

