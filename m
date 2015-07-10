Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 778C9607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 02:22:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A2MDcE005826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jul 2015 19:22:13 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Jul 2015 19:22:13 -0700
Message-ID: <559F2C54.8020500@windriver.com>
Date: Fri, 10 Jul 2015 10:22:12 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1432625185-12163-1-git-send-email-li.zhou@windriver.com>
	<558D0760.2090304@windriver.com>
In-Reply-To: <558D0760.2090304@windriver.com>
Subject: Re: [PATCH v3] opkg-utils: Change alternatives lib path from /usr/lib/opkg to /var/lib/opkg
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
X-List-Received-Date: Fri, 10 Jul 2015 02:22:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

-Roy

On 2015年06月26日 16:03, Rongqing Li wrote:
> ping
>
> -R
>
> On 2015年05月26日 15:26, Li Zhou wrote:
>> When update-alternatives is moved from opkg to opkg-utils, a line in
>> the file is changed
>> from <ad="$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives">
>> to <ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives">.
>> But opkglibdir doesn't equal to "/usr/lib" here, but equal to "/var/lib"
>>   in oe-core build by configuring --with-opkglibdir.
>> opkg-utils can't get the var value in opkg, so here define OPKGLIBDIR to
>> set the path.
>>
>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> ---
>>   meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>> b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>> index 2800a5d..9c1c995 100644
>> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>> @@ -22,8 +22,11 @@ PYTHONRDEPS_class-native = ""
>>   PACKAGECONFIG = "python"
>>   PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
>>
>> +OPKGLIBDIR ?= "/var/lib"
>> +
>>   do_install() {
>>       oe_runmake PREFIX=${prefix} DESTDIR=${D} install
>> +    sed -i s:/usr/lib/opkg:${OPKGLIBDIR}/opkg:
>> ${D}${bindir}/update-alternatives
>>   }
>>
>>   PACKAGES =+ "update-alternatives-opkg"
>>
>

-- 
Best Reagrds,
Roy | RongQing Li

