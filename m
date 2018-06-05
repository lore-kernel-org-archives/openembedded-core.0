Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 207577556D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 02:29:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w552T87N009869
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Jun 2018 19:29:08 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 4 Jun 2018 19:29:08 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180604105828.24004-1-kai.kang@windriver.com>
	<3518da0e-6a89-1288-d6ab-89a8537467f1@linux.intel.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <27a69d94-e215-9c26-3886-5322f1f4e8f4@windriver.com>
Date: Tue, 5 Jun 2018 10:27:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <3518da0e-6a89-1288-d6ab-89a8537467f1@linux.intel.com>
Subject: Re: [PATCH] man-db: create man db index file
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
X-List-Received-Date: Tue, 05 Jun 2018 02:29:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年06月04日 19:42, Alexander Kanavin wrote:
> On 06/04/2018 01:58 PM, Kai Kang wrote:
>
>> +pkg_postinst_ontarget_${PN} () {
>> +        ${bindir}/mandb -q
>> +}
>> +
>
> man-db is only the tools for manpages, but not the actual pages. So 
> this will not work as expected when installing or removing packages 
> that contain manpages. It should be added to classes/manpages.bbclass 
> instead, with a RDEPENDS += "man-db". You can also fix 
> man-pages_4.14.bb to inherit the class at the same time.
>
> Oh, and you can also take qemu into use, so that this works also for 
> read only rootfs, and doesn't add to first boot time, like this:
> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=b42a7a733c7a6b51118ccb3fe6e33c35ac12b4ae 
>
>
> Alex
>
Hi Alex,

Thanks a lot. I'll try it.

-- 
Regards,
Neil | Kai Kang


