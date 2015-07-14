Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B16FE65C98;
	Tue, 14 Jul 2015 05:57:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6E5vIuE007861
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jul 2015 22:57:18 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jul 2015 22:57:17 -0700
Message-ID: <55A4A4BB.5070502@windriver.com>
Date: Tue, 14 Jul 2015 13:57:15 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>, Yocto discussion list
	<yocto@yoctoproject.org>
References: <261F5389-C495-4B05-B79E-309AE0E0F0CA@gmail.com>
In-Reply-To: <261F5389-C495-4B05-B79E-309AE0E0F0CA@gmail.com>
Subject: Re: glibc 2.22
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
X-List-Received-Date: Tue, 14 Jul 2015 05:57:23 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


I will try this, and something is wrong with mips when upgraded gcc
from 4.9.2 to 4.9.3:
please see my reply to "[OE-core] [PATCH 1/3] gcc-4.9: Upgrade to 4.9.3"

// Robert

On 07/14/2015 01:37 AM, Khem Raj wrote:
> Hi All
>
> glibc 2.22 will release end of this month. For some time I have put together the update here
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=02e73ea526d94f21c7ef82eb96b062eff8ebb825
>
> It works pretty well for machines I have tested it on ( arm/x86 ) but would be interested if more wider trial could be carried
> out and issues reported between now and release can be addressed.
>
> Please give it a try if you have spare cycles
>
> Thanks
> -Khem
>
>
>
>

