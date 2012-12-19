Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Ming.Liu@windriver.com>) id 1Tl8wb-0002p7-7R
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 02:59:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBJ1iqp3001651
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Dec 2012 17:44:52 -0800 (PST)
Received: from [128.224.162.133] (128.224.162.133) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 18 Dec 2012 17:44:51 -0800
Message-ID: <50D11C10.5090204@windriver.com>
Date: Wed, 19 Dec 2012 09:44:48 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1355811791-4681-1-git-send-email-ming.liu@windriver.com>
	<CAJTo0LYDMxZ+2u_mpTevCD6cCX3OZgxs2ABxGauhuNDc+hzSSg@mail.gmail.com>
	<50D0C461.7010901@linux.intel.com>
In-Reply-To: <50D0C461.7010901@linux.intel.com>
X-Originating-IP: [128.224.162.133]
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 19 Dec 2012 01:59:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/2012 03:30 AM, Saul Wold wrote:
> On 12/18/2012 03:23 AM, Burton, Ross wrote:
>> On 18 December 2012 06:23, Ming Liu <ming.liu@windriver.com> wrote:
>>> /etc/init.d/urandom fails to start/stop because it tries to save
>>> random-seed into /var/lib/urandom folder which does not exist in the
>>> file system.
>>>
>>> Fixed by adding /var/lib/urandom into volatiles.
>>
>> Doesn't this mean that the persistent state of urandom will be saved
>> to a ramdisk?
>>
>> Mixing up persistent and transient state in /var is exactly why /run
>> exists, and why we should switch to support /run as soon as
>> possible...
>>
> Sorry, this was my suggestion, It actually is creating 
> /var/lib/urandom which should be a persistent sub-dir of /var
>
> I was bouncing back and for about it being in the the recipe's 
> do_install vs  populate volaties file, I did not see any other 
> /var/lib/<dir> being created so I leaned toward this solution.  This 
> was on the list a week or so ago, we could go back to itbeing created 
> in the do_install()

OK, so I will resend the patch creating it in do_install() as V3 since 
it's a bit long time ago.

the best,
thank you

>
> Sau!
>
>
>> Ross
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>
>



