Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6E8672A6E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 15:13:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBKFDMK4027023
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 20 Dec 2014 07:13:22 -0800 (PST)
Received: from server.local (128.224.21.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 20 Dec 2014 07:13:22 -0800
Message-ID: <54959211.9020504@windriver.com>
Date: Sat, 20 Dec 2014 10:13:21 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1418984914.13316.6.camel@linuxfoundation.org>	
	<1418992908.13316.14.camel@linuxfoundation.org>	
	<54942326.8080806@windriver.com>	
	<1418994949.13316.16.camel@linuxfoundation.org>
	<1419074109.13316.31.camel@linuxfoundation.org>
In-Reply-To: <1419074109.13316.31.camel@linuxfoundation.org>
Subject: Re: Merging problems
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
X-List-Received-Date: Sat, 20 Dec 2014 15:13:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-12-20 6:15 AM, Richard Purdie wrote:
> So where are we at?
>
> Thanks to some great help from Ross, we have a number of patches merged
> and many of the issues in my last email have been addressed. I'm
> continuing to struggle with the kernel series. The last build on the
> autobuilder highlighted that:
>
> * there are problems in boot-directdisk.bbclass (have a fix)
> * there is a do_rootfs/do_package_qa race (have a fix)
> * the report-error.bbclass tasks could crash (have a fix)
> * the kernelmodule sanity tests were failing (have a fix)
> * qemumips gdb is failing to compile, probably due to new kernel
>    headers (no fix as yet)
> * systemd sanity QA tests continue to fail on xorg and systemd-login
>    (no fix as yet)
> * there are continuing problems with linux-imx from meta-fsl-arm, I
>    thought these were addressed but clearly not :(
>
> Ideally I'd like to take some time off over the holidays but I can't see
> that happening until the patch queues are under some kind of control :(.

Let me know if there are one of these that you want me to take. I'm all
for pitching in and getting everyone some down time.

Bruce

>
> Cheers,
>
> Richard
>
>


