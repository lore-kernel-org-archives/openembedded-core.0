Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB5B7FC87
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2020 19:10:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47pczs5d4rz1qql7;
	Thu,  2 Jan 2020 20:10:00 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47pczr3r6jz1s77N;
	Thu,  2 Jan 2020 20:10:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id NsbqNSTNdmw4; Thu,  2 Jan 2020 20:09:59 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Thu,  2 Jan 2020 20:09:59 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id B5E6E45404DC;
	Thu,  2 Jan 2020 20:09:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id 4bKAptmpuxcq; Thu,  2 Jan 2020 20:09:57 +0100 (CET)
Received: from [192.168.178.89] (stefano-MacBookPro.fritz.box [192.168.178.89])
	by babic.homelinux.org (Postfix) with ESMTPS id 149324540379;
	Thu,  2 Jan 2020 20:09:57 +0100 (CET)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20200102175206.657-1-sbabic@denx.de>
	<116f3696-c57c-9e21-ef5f-5fb2e004a873@intel.com>
From: Stefano Babic <sbabic@denx.de>
Message-ID: <c08f8c1e-b511-a67d-9fb3-d58a404d4595@denx.de>
Date: Thu, 2 Jan 2020 20:09:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <116f3696-c57c-9e21-ef5f-5fb2e004a873@intel.com>
Subject: Re: [PATCH V2] u-boot-fw-utils: Add support for libubootenv
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
X-List-Received-Date: Thu, 02 Jan 2020 19:10:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Ross,

On 02/01/20 19:22, Ross Burton wrote:
> On 02/01/2020 17:52, Stefano Babic wrote:
>> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>> @@ -0,0 +1,2 @@
>> +require libubootenv.inc
>> +SRCREV = "bf6ff631c0e38cede67268ceb8bf1383b5f8848e"
> 
> I *really* dislike bb/inc splits where there's nothing gained apart from
> more work when editing recipes.  Can you just merge these?

Of course, I'll do in V3.

Regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

