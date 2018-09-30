Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0387B6025F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Sep 2018 01:05:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8U1514O006369
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 29 Sep 2018 18:05:12 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 29 Sep 2018 18:04:50 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1538199671.git.kai.kang@windriver.com>
	<e264c183d7ab6ce4087ac6fca6bd6cadff6026c4.1538199671.git.kai.kang@windriver.com>
	<ca4435b5ac4b9deecf9a3fd2eb9c89b86f435056.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <0e8a15d9-961b-df67-0515-08e51b4c7aba@windriver.com>
Date: Sun, 30 Sep 2018 09:02:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ca4435b5ac4b9deecf9a3fd2eb9c89b86f435056.camel@linuxfoundation.org>
Subject: Re: [PATCH 03/10] man-db: fix multilib install file conflict
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
X-List-Received-Date: Sun, 30 Sep 2018 01:05:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月29日 20:44, Richard Purdie wrote:
> On Sat, 2018-09-29 at 13:43 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> The first line of config file man_db.conf is the package name. It
>> causes
>> multilib install file conflict. So remove the first line.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-extended/man-db/man-db_2.8.3.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-extended/man-db/man-db_2.8.3.bb
>> b/meta/recipes-extended/man-db/man-db_2.8.3.bb
>> index 97e5a3d6fb..da6d291011 100644
>> --- a/meta/recipes-extended/man-db/man-db_2.8.3.bb
>> +++ b/meta/recipes-extended/man-db/man-db_2.8.3.bb
>> @@ -26,6 +26,9 @@ do_install() {
>>   	        install -d ${D}/etc/default/volatiles
>>   		install -m 0644 ${WORKDIR}/99_mandb
>> ${D}/etc/default/volatiles
>>   	fi
>> +
>> +    # the 1st line of man_db.conf is package name which causes
>> multilib install file conflict
>> +    sed -i '1d' ${D}${sysconfdir}/man_db.conf
>>   }
> Please do this with a patch, not a sed expression.
>
> The sed expressions are a maintenance nightmare since we don't know
> if/when the config file may change, or if/when this expression stops
> working.

Got it.

--Kai

>
> Cheers,
>
> Richard
>
>

-- 
Regards,
Neil | Kai Kang


