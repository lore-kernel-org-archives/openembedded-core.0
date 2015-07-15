Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA857391D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 04:51:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6F4pW0R021320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Jul 2015 21:51:32 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 14 Jul 2015 21:51:31 -0700
Message-ID: <55A5E6D2.6050108@windriver.com>
Date: Wed, 15 Jul 2015 12:51:30 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Luo Zhenhua <zhenhua.luo@freescale.com>, OE-core
	<openembedded-core@lists.openembedded.org>
References: <BN3PR03MB1367ABE95BBD2A48796FF31FE49A0@BN3PR03MB1367.namprd03.prod.outlook.com>
In-Reply-To: <BN3PR03MB1367ABE95BBD2A48796FF31FE49A0@BN3PR03MB1367.namprd03.prod.outlook.com>
Subject: Re: Query about the toolchian version of Yocto 1.9
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
X-List-Received-Date: Wed, 15 Jul 2015 04:51:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/15/2015 11:41 AM, Luo Zhenhua wrote:
> Hi,
>
> I can see that there are recipes of 3 gcc version(4.8, 4.9, 5.1) in master
> branch of Yocto, may I know which one will be officially supported by Yocto 1.9
> release? Will the other versions be tested and supported?

What I know is, gcc 4.8 is a backup, 4.9 is the default one atm, 5.1 is
on going, and when switch to gcc 5.1, the 4.8 would be removed. Both
4.9 and 5.1 will be kept and supported if there isn't more upgrades.

// Robert

>
> Best Regards,
>
> Zhenhua
>
>
>

