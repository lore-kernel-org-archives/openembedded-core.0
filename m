Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD68798BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 12:33:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8LCWw6J014731
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Sep 2018 05:33:19 -0700
Received: from server.local (128.224.20.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 21 Sep 2018 05:32:52 -0700
To: "Burton, Ross" <ross.burton@intel.com>, OE-core
	<openembedded-core@lists.openembedded.org>
References: <CAJTo0La8KFRbVQvhcYyN-JMjRiBzjeUE9-dwadBvmCCbX95A=g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <45324447-7512-2987-1e2b-44c59c7aaddb@windriver.com>
Date: Fri, 21 Sep 2018 08:32:51 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0La8KFRbVQvhcYyN-JMjRiBzjeUE9-dwadBvmCCbX95A=g@mail.gmail.com>
Subject: Re: Kernel warnings with master/poky-lsb
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
X-List-Received-Date: Fri, 21 Sep 2018 12:33:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-09-21 7:21 AM, Burton, Ross wrote:
> FYI, the poky-lsb builds for meta-yocto-bsp BSPs are all emitting this warning:
> 
> WARNING: linux-yocto-4.14.48+gitAUTOINC+9beb3a2873_04043b48eb-r0
> do_kernel_configcheck: [kernel config]: This BSP sets config options
> that are not offered anywhere within this kernel:
> CONFIG_USB_OCTEON2_COMMON
> 
> Is this something that is fixed in 4.14.67? Did I miss an upgrade or
> are there upgrade patches outstanding?  Note that we were hoping to
> roll M3 this week.

There are oustanding patches for the remaining warnings. I was
traveling and didn't get a chance to complete the last few
platforms with remaining warns.

I may have something out by end of day, but since today is my
first back in my timezone .. I may fall asleep before that
happens :D

Bruce

> 
> Ross
> 


