Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2B47646E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 23:49:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7BNnjXB006968
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Aug 2015 16:49:45 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 11 Aug 2015 16:49:44 -0700
Message-ID: <55CA8A17.4020105@windriver.com>
Date: Tue, 11 Aug 2015 19:49:43 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
	<646c2c404c3064d5b7ce1d1351690caf1d482aa2.1438265949.git.alexander.kanavin@linux.intel.com>
	<55C433F9.5040403@windriver.com> <55C4A81C.2010905@linux.intel.com>
In-Reply-To: <55C4A81C.2010905@linux.intel.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH 19/21] epiphany: add a recipe from meta-gnome
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
X-List-Received-Date: Tue, 11 Aug 2015 23:49:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-08-07 08:44 AM, Alexander Kanavin wrote:
> On 08/07/2015 07:28 AM, Randy MacLeod wrote:
>
>>> Epiphany is replacing midori as the browser in oe-core recipe set
>>> and poky distribution.
>>
>> I just got caught up on oe-core and:
>>     https://www.mail-archive.com/yocto@yoctoproject.org/msg24522.html
>>
>> Please move the midori recipe and dependencies to
>> meta-oe when this change is merged to oe-core. That would help
>> anyone that needs to provide a transition warning. Of course it
>> adds more cruft to meta-oe but that's a separate problem.
>
> Midori depends on an ancient, no longer maintained Webkit1
> implementation with known security issues [1]. Adding it to meta-oe
> requires that:
>
> a) webkit-gtk is at least updated to the latest version of the no longer
> maintained Webkit1 implementation (1.8.3 -> 2.4.9)
> 2) that version is patched with every fix that other distributions have
> done, including [1]
>
> I can do this, but at the expense of updating other packages in oe-core
> that need updating before we hit a stabilization milestone. Do you
> specifically know someone who needs such an extra-cushioned transition?

Thanks for the summary.

After considering the situation, I agree that it's not worth the effort
to add midori to meta-oe.

../Randy

>
> Alex
>
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=1182623


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

