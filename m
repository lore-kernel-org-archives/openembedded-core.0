Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0788965C85
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 01:40:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1D1drVg018703
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Feb 2015 17:39:53 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Feb 2015 17:39:52 -0800
Message-ID: <54DD55E2.6090709@windriver.com>
Date: Fri, 13 Feb 2015 09:39:46 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1414748681.git.hongxu.jia@windriver.com>
	<65b3eb26c24648674ec3deb4da87f4933c2c0f21.1414748681.git.hongxu.jia@windriver.com>
	<3627050.lDnyP7JDsZ@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <3627050.lDnyP7JDsZ@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] package_manager.py: fix rpm based do_rootfs failed while IMAGE_INSTALL_append = " python3"
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
X-List-Received-Date: Fri, 13 Feb 2015 01:40:12 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2015 12:46 AM, Paul Eggleton wrote:
>> default_archs) +                new_pkg =
>> >self._search_pkg_name_in_feeds(pkg, default_archs) or \ +
>> >  self._search_pkg_provider_in_smart(pkg, default_archs) if not new_pkg:
>> >                      err_msg = '%s not found in the base feeds (%s).\n' % \
>> >                                (pkg, ' '.join(default_archs))
> It took a long time to reply to this, my apologies. This patch looks OK but
> Richard pointed out that it may have an impact on the speed of do_rootfs
> because of the extra calls out to smart. Do you have any performance impact
> figures?

Hi Paul,

The extra 'smart' calling takes 3-5 seconds for one search,
but it will not do that for most packages, it goes into
self._search_pkg_name_in_feeds first, if not found and then in to
self._search_pkg_provider_in_smart, only if we have such as python3
in the build session, it will take extra 3-5 seconds.

//Hongxu



> Thanks,
> Paul
> -- 


