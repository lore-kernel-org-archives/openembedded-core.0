Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 617EC757A7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 01:50:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t551oKFo018494
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Jun 2015 18:50:20 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 4 Jun 2015 18:50:20 -0700
Message-ID: <5571005A.8020401@windriver.com>
Date: Fri, 5 Jun 2015 09:50:18 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1433397478-3927-1-git-send-email-kai.kang@windriver.com>
	<55701920.2050101@communistcode.co.uk>
In-Reply-To: <55701920.2050101@communistcode.co.uk>
Subject: Re: [PATCH] alsa-tools: add dependency glib-2.0
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
X-List-Received-Date: Fri, 05 Jun 2015 01:50:20 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年06月04日 17:23, Jack Mitchell wrote:
> On 04/06/15 06:57, Kai Kang wrote:
>> Add dependency glib-2.0 for alsa-tools. It is required by new added
>> sub-component hdajacksensetest.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb 
>> b/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
>> index 9133012..b5b9cc4 100644
>> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
>> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.alsa-project.org"
>>   BUGTRACKER = 
>> "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
>>   SECTION = "console/utils"
>>   LICENSE = "GPLv2 & LGPLv2+"
>> -DEPENDS = "alsa-lib ncurses"
>> +DEPENDS = "alsa-lib ncurses glib-2.0"
>>     LIC_FILES_CHKSUM = 
>> "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>> file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
>
> It would be nice to put this behind a hdajacksensetest packageconfig 
> if possible.

The hdajacksensetest is just a sub-directory/component not a feature, 
and it can't be built without library glib.
If make it as a package config, we have to find a way to remove 
hdajacksensetes. I suppose it is not proper to
add it as a packageconfig.

BTW, the dependency on glib-2.0 for alsa-tools is passed by depending on 
gtk+3 if 'x11' in distro feauture. If without 'x11',
not such dependency, then build hdajacksensetest fails. So add 
'glib-2.0' to DEPENDS.

Thanks,

-- 
Regards,
Neil | Kai Kang


