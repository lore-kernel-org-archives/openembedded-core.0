Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 555526E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 17:55:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8EHtKNV019119
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Sep 2015 10:55:20 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 14 Sep 2015 10:55:20 -0700
To: "Reshetova, Elena" <elena.reshetova@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <2236FBA76BA1254E88B949DDB74E612B41976CB1@IRSMSX102.ger.corp.intel.com>
	<55EF9D64.8000601@windriver.com>
	<2236FBA76BA1254E88B949DDB74E612B41979490@IRSMSX102.ger.corp.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <55F70A07.20409@windriver.com>
Date: Mon, 14 Sep 2015 13:55:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <2236FBA76BA1254E88B949DDB74E612B41979490@IRSMSX102.ger.corp.intel.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: How to put a correct dependency with regards to gcc?
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
X-List-Received-Date: Mon, 14 Sep 2015 17:55:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-09 12:09 PM, Reshetova, Elena wrote:
>> Maybe we have to fix gcc-source after all rather than use the EXCLUDE_WORLD
> change I made in:
>>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=7878
>
> Should I file a bug about this for easy tracking? My problem really seems
> that do_fetch on some related to gcc packages doesn't result in fetch of
> sources.

I'll send a fix early this week.

../Randy

>
>> Does your scheme work for the kernel source? See:
>
>> Search for "kernel-devsrc" here:
>>   http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/68352
>
> There doesn't seem to be an issue with kernel source packages for my task. I
> think this is because the sources are correctly fetched by dependent
> packages.
>
> Best Regards,
> Elena.
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

