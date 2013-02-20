Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U82we-0000YJ-JF
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 07:14:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1K5w7M3021182
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Feb 2013 21:58:07 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 19 Feb 2013 21:58:06 -0800
Message-ID: <512465EF.6090501@windriver.com>
Date: Wed, 20 Feb 2013 13:58:07 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <cover.1361260478.git.Qi.Chen@windriver.com>
	<6c5df3ee0d370bc7054d53832937ce70b6c9ee57.1361260478.git.Qi.Chen@windriver.com>
	<CAC1BbcSiDGonDHWfKnjM47qFWwREzZ8Qjno4AW1z8MWJwFyW1g@mail.gmail.com>
In-Reply-To: <CAC1BbcSiDGonDHWfKnjM47qFWwREzZ8Qjno4AW1z8MWJwFyW1g@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] hwclock.sh: check for the existence of /etc/default/rcS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2013 06:14:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/19/2013 07:10 PM, Bernhard Reutner-Fischer wrote:
> On 19 February 2013 08:59,  <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> /etc/default/rcS might be missing if the init manager is not sysvinit.
>> So we have to check for the existence of this file before sourcing it.
>>
>> [YOCTO #3697]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/busybox/files/hwclock.sh |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/busybox/files/hwclock.sh b/meta/recipes-core/busybox/files/hwclock.sh
>> index cc6d286..be5f94d 100644
>> --- a/meta/recipes-core/busybox/files/hwclock.sh
>> +++ b/meta/recipes-core/busybox/files/hwclock.sh
>> @@ -20,7 +20,7 @@
>>
>>   [ ! -x /sbin/hwclock ] && exit 0
>>
>> -. /etc/default/rcS
>> +[ -f /etc/default/rcS ] && . /etc/default/rcS
> I'd make that -r fwiw.
>
>
Thank you for your review.
In this case, I think they have the same effect.

Best Regards,
Chen Qi


