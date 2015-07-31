Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D9A3476502
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 02:55:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6V2ttbj027904
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Jul 2015 19:55:55 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 30 Jul 2015 19:55:35 -0700
Message-ID: <55BAE3B9.2060807@windriver.com>
Date: Fri, 31 Jul 2015 10:55:53 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Li Zhou
	<li.zhou@windriver.com>
References: <1432085475-24806-1-git-send-email-li.zhou@windriver.com>
	<1436654372.3310.28.camel@linuxfoundation.org>
In-Reply-To: <1436654372.3310.28.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] opkg-utils: Change alternatives lib path from /usr/lib/opkg to /var/lib/opkg
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
X-List-Received-Date: Fri, 31 Jul 2015 02:55:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年07月12日 06:39, Richard Purdie wrote:
> On Wed, 2015-05-20 at 09:31 +0800, Li Zhou wrote:
>> When update-alternatives is moved from opkg to opkg-utils, a line in
>> the file is changed
>> from <ad="$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives">
>> to <ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives">.
>> But opkglibdir doesn't equal to "/usr/lib" here, but equal to "/var/lib"
>>   in oe-core build by configuring --with-opkglibdir.
>> opkg-utils can't get the var value in opkg, so here define opkglibdir to
>> set the path.
>>
>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> ---
>>   meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    3 +++
>>   1 file changed, 3 insertions(+)
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/387/steps/BuildImages_3/logs/stdio
>
> Seems related to this :/

I can not reproduce it,

do you see this error in yocto autobuilder recently? I see this patch 
still is in master-next2

-Roy





>
> Cheers,
>
> Richard
>

-- 
Best Reagrds,
Roy | RongQing Li

