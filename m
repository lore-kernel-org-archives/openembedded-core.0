Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68C6475108
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 02:54:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7Q2sb7K018148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 25 Aug 2018 19:54:37 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 25 Aug 2018 19:54:36 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <cover.1535216766.git.kai.kang@windriver.com>
	<55b7afd2fc5b383ab482f4b004e38cb0797ca29c.1535216766.git.kai.kang@windriver.com>
	<CANNYZj87uFtRDxVrX_-jmWq4A_9scGpMgH=9xgKYGE2jRkWHzw@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <f95b7feb-1501-202f-bc10-bbfc123dd184@windriver.com>
Date: Sun, 26 Aug 2018 10:54:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj87uFtRDxVrX_-jmWq4A_9scGpMgH=9xgKYGE2jRkWHzw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] update_font_cache: update script for multilib
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
X-List-Received-Date: Sun, 26 Aug 2018 02:54:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年08月26日 01:38, Alexander Kanavin wrote:
> 2018-08-25 19:13 GMT+02:00 Kai Kang <kai.kang@windriver.com>:
>> Packages which inherit fontcache.bbclass call postinstall script
>> update_font_cache. And in update_font_cache, it calls ${bindir}/fc-cache
>> by qemuwrapper. When multilib is enabled, both packages foo and lib32-foo
>> will call ${bindir}/fc-cache and one of them will fail to run obviously.
> Do other postinst-intercept scripts need similar fixing?

The fix is from update_gio_module_cache, but I missed 
update_gtk_immodules_cache and others are ok.
I'll update update_gtk_immodules_cache.

Thanks,
Kai

>
> Alex
>

-- 
Regards,
Neil | Kai Kang


