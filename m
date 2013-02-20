Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U84Ar-0002hj-Qn
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 08:33:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1K7GrAH028850
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Feb 2013 23:16:53 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 19 Feb 2013 23:16:51 -0800
Message-ID: <51247864.7000205@windriver.com>
Date: Wed, 20 Feb 2013 15:16:52 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <cover.1361338900.git.Qi.Chen@windriver.com>
	<5ef28960f6e00cda4b04bbe53399053704921d2d.1361338900.git.Qi.Chen@windriver.com>
	<13cf6700102.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <13cf6700102.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 4/5] populate-volatile.sh: improve the handling of link config items
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
X-List-Received-Date: Wed, 20 Feb 2013 07:33:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/20/2013 03:10 PM, Bernhard Reutner-Fischer wrote:
> On 20 February 2013 06:55:33 <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Previously, if there's a link config item in the config file like
>>
>>         l root root 1777 /tmp /var/tmp
>>
>> and /tmp has existed, the symlink will not be created correctly.
>>
>> Another example is the /run directory. If /run directory has been
>> created by some recipe or script before populate-volatile.sh runs,
>> the symlink of /run to /var/run will not be created correctly.
>>
>> This patch ensures that the system creates symlinks exactly as the
>> config file tells it.
>
> This one also has bugs in background handling, it seems.

What's the bug?

> Can't you massage stderr redirection when setting EXIT instead?

Could you please be more specific?

>>
>> [YOCTO #3404]
>> [YOCTO #3406]
>>
>
>
> Sent with AquaMail for Android
> http://www.aqua-mail.com
>
>
>
>



