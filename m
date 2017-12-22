Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 501F978355
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 18:23:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBMINqNj012528
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 22 Dec 2017 10:23:52 -0800
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 22 Dec 2017 10:23:51 -0800
To: <openembedded-core@lists.openembedded.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71FFA72@fmsmsx111.amr.corp.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <6d876c01-b89f-0c00-6c3b-a0245da3d5b6@windriver.com>
Date: Fri, 22 Dec 2017 13:23:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71FFA72@fmsmsx111.amr.corp.intel.com>
X-Originating-IP: [172.25.44.3]
Cc: "Purdie, Richard" <richard.purdie@intel.com>
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXNTHigJkxNw==?=
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
X-List-Received-Date: Fri, 22 Dec 2017 18:23:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2017-12-18 10:52 AM, Jolley, Stephen K wrote:
> Current Dev Position: YP 2.5 M2 development
> 
> Next Deadline: YP 2.5 M2 cut off of 1/15/18
> 
> SWAT team rotation: Stephano -> Maxin on Dec. 15, 2017.
> 
> SWAT team rotation: Maxin -> Cal on Dec. 22, 2017.
> 
> https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
> 
> Key Status/Updates:
> 
> ·The QA of YP 2.5 M1 rc1 is just starting.  See: 
> https://wiki.yoctoproject.org/wiki/2.5_QA_Status
> 
> ·The QA of YP 2.4.1 rc1 is about 80% complete.  See: 
> https://wiki.yoctoproject.org/wiki/2.4_QA_Status. We are having some 
> issues with the eclipse plugin testing.
> 
> ·The QA of YP 2.3.3 rc1 is about 3% complete. See: 
> https://wiki.yoctoproject.org/wiki/2.3_QA_Status
> 
> ·YP 2.2.3 rc1 has been built and is queued to begin QA when the QA team 
> has bandwidth.
> 
> ·We have finally tracked down the qemux86-64 kvm apic hang to an issue 
> in the host kernel. We have a mitigation plan in mind but that is 
> blocked on finding another separate bug causing selftest failures when 
> upgrading the guest kernel.
> 
> ·We have identified further intermittent bugs in various releases which 
> we’re continuing to look into (including gpg memory allocation issues on 
> pyro, sstate writing races in morty, further occurrences of the inode 
> count issues with our NAS on the autobuilder).

If any of the new problems prove to be difficult to debug, please
reply with the defect ID so that people can read the background
and perhaps help out in some way.

WR used to use a single large NAS for our build cluster 3+ years ago.
While it worked to first order, there was a background of mysterious
errors. We switch to local disks and pushing logs/status to
a centralized git repo and we've been happy with that choice.
-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

