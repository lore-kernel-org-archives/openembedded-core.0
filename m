Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BACEC606E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 14:54:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1HEs1CG002349
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Feb 2015 06:54:01 -0800 (PST)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 17 Feb 2015 06:54:01 -0800
Message-ID: <54E35600.8060803@windriver.com>
Date: Tue, 17 Feb 2015 09:53:52 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: scerveau <scerveau@voxtok.com>, Martin Jansa <martin.jansa@gmail.com>
References: <54E1CED1.6060900@voxtok.com> <20150216130844.GF2297@jama>
	<54E1ECF5.2010405@voxtok.com>
In-Reply-To: <54E1ECF5.2010405@voxtok.com>
X-Originating-IP: [172.25.44.6]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: cdra_1.1.3 is not available anymore.
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
X-List-Received-Date: Tue, 17 Feb 2015 14:54:07 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015-02-16 08:13 AM, scerveau wrote:
> Dear Martin,
>
> I'm using dora and daisy branch and the build will be failing on this
> branch 1.1.3.
> Is it planned to backport thee 3.13 patch to dora and daisy ?
> I just posted a patch to use the 1.1.3 as before but is there a license
> issue, so we cant use this version anymore ?

Dora is community supported now,
Daisy is updated until 1.8 is out in a couple of months.

https://wiki.yoctoproject.org/wiki/Releases
https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance

Long term support is available from several companies:
https://www.yoctoproject.org/ecosystem/showcase

../Randy

>
>
> Best regards.
>
> Stéphane
> On 02/16/2015 02:08 PM, Martin Jansa wrote:
>> On Mon, Feb 16, 2015 at 12:04:49PM +0100, scerveau wrote:
>>> Dear all,
>>>
>>> It seems that crda_1.1.3 recipe is broken according that the link
>>> http://wireless.kernel.org/download/crda/crda-1.1.3.tar.bz2 is not
>>> available anymore.
>>> It can be now downloaded here
>>> https://www.kernel.org/pub/software/network/crda/crda_1.1.3.tar.bz2
>>>
>>> But concerning the binary
>>> http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.01.11-regulatory.bin
>>>
>>> it is not available also but i dont find a server which will allow to
>>> fetch it.
>>>
>>> Does someone modify the recipe already or does someone know where we
>>> could fetch the binary?
>>> I'll continue my investigation.
>> http://patches.openembedded.org/patch/87751/
>>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200 Ottawa, Ontario, 
Canada K2K 2W5

