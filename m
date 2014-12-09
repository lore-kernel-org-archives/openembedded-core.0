Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 81EB9724B2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 08:28:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB98SUlj017405
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 9 Dec 2014 00:28:30 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 9 Dec 2014 00:28:29 -0800
Message-ID: <5486B2AA.50603@windriver.com>
Date: Tue, 9 Dec 2014 16:28:26 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1418017596.git.Chong.Lu@windriver.com>
	<CAJTo0LZHK+Wa3-EhpFK0Ajr8Cv9a6uQ3mDDmhqSjU8xSSg25CQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZHK+Wa3-EhpFK0Ajr8Cv9a6uQ3mDDmhqSjU8xSSg25CQ@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] use single variable to set baud rate
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
X-List-Received-Date: Tue, 09 Dec 2014 08:28:41 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 12/08/2014 09:44 PM, Burton, Ross wrote:
> On 8 December 2014 at 05:47, Chong Lu <Chong.Lu@windriver.com 
> <mailto:Chong.Lu@windriver.com>> wrote:
>
>     Chong Lu (2):
>       syslinux.bbclass: use single variable to set baud rate
>       grub-efi.bbclass: use single variable to set baud rate
>
>
> ERROR: ExpansionError during parsing 
> /home/ross/Yocto/poky/meta/recipes-core/images/core-image-minimal-mtdutils.bb 
> <http://core-image-minimal-mtdutils.bb>: Failure expanding variable 
> GRUB_OPTS: ExpansionError: Failure expanding variable GRUB_OPTS, 
> expression was serial --unit=${@filter(str.isdigit, 
> d.getVar('SERIAL_CONSOLE', True).split()[1])} 
> --speed=${@d.getVar('SERIAL_CONSOLE', True).split()[0]} --word=8 
> --parity=no --stop=1 which triggered exception IndexError: list index 
> out of range
>
> SERIAL_CONSOLE doesn't have to be set.

Hi Ross,

Thanks for your reply. V2 incoming.

Best Regards
Chong

>
> Ross


