Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U8MCC-0006nE-RS
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 03:47:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1L2VRPM018740
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Feb 2013 18:31:27 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 20 Feb 2013 18:31:27 -0800
Message-ID: <512586FE.8010100@windriver.com>
Date: Thu, 21 Feb 2013 10:31:26 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <cover.1361338900.git.Qi.Chen@windriver.com>
	<fc06c499d04a1cf82c2d426c17cd2331a6bf718d.1361338900.git.Qi.Chen@windriver.com>
	<CAC1BbcTWjtDiLeDa3970HAL5Za+9iA7sqfs6XsDqahEC4A49gg@mail.gmail.com>
In-Reply-To: <CAC1BbcTWjtDiLeDa3970HAL5Za+9iA7sqfs6XsDqahEC4A49gg@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 5/5] populate-volatile.sh: remove trailing whitespaces
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
X-List-Received-Date: Thu, 21 Feb 2013 02:47:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/20/2013 10:19 PM, Bernhard Reutner-Fischer wrote:
> On 20 February 2013 06:55,  <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Remove trailing whitespaces.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../initscripts-1.0/populate-volatile.sh           |    6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
>> index 24daeb4..d7937b4 100755
>> --- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
>> @@ -48,9 +48,9 @@ create_file() {
>>   }
>>
>>   mk_dir() {
>> -       EXEC="
>> -       mkdir -p \"$1\";
>> -       chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
>> +       EXEC="
>> +       mkdir -p \"$1\";
>> +       chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
>>          chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
>>
>>          test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
> Don't you need ${ROOT_DIR}/etc/volatile.cache.build here (and
> everywhere else if there are other cases), too?
>
>
Actually no.

The cache is only enabled when ROOT_DIR is "/".
That is, the cache is disabled if populate-volatile.sh is run at rootfs 
time.

Best Regards,
Chen Qi


