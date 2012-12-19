Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Tl9Uq-0003vh-U2
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 03:35:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBJ2KJkl026667
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 18:20:19 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 18 Dec 2012 18:20:17 -0800
Message-ID: <50D12475.3050204@windriver.com>
Date: Wed, 19 Dec 2012 10:20:37 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1355811791-4681-1-git-send-email-ming.liu@windriver.com>
	<CAJTo0LYDMxZ+2u_mpTevCD6cCX3OZgxs2ABxGauhuNDc+hzSSg@mail.gmail.com>
In-Reply-To: <CAJTo0LYDMxZ+2u_mpTevCD6cCX3OZgxs2ABxGauhuNDc+hzSSg@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Subject: Re: [PATCH V2] initscripts: add urandom directory into volatiles
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
X-List-Received-Date: Wed, 19 Dec 2012 02:35:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/2012 07:23 PM, Burton, Ross wrote:
> On 18 December 2012 06:23, Ming Liu<ming.liu@windriver.com>  wrote:
>> /etc/init.d/urandom fails to start/stop because it tries to save
>> random-seed into /var/lib/urandom folder which does not exist in the
>> file system.
>>
>> Fixed by adding /var/lib/urandom into volatiles.
> Doesn't this mean that the persistent state of urandom will be saved
> to a ramdisk?
>
> Mixing up persistent and transient state in /var is exactly why /run
> exists, and why we should switch to support /run as soon as
> possible...
FWIW, there's bug about /run directory support -- 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3181.

Cheers,
Chen Qi
> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



