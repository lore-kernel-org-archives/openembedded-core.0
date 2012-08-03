Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1SxMTB-0004Ps-HF
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 20:19:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q73I7lGr025368
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Aug 2012 11:07:47 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Fri, 3 Aug 2012 11:07:47 -0700
Message-ID: <501C1369.2030508@windriver.com>
Date: Fri, 3 Aug 2012 14:07:37 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <501BFFD9.6060108@windriver.com> <501C0E2C.50108@windriver.com>
In-Reply-To: <501C0E2C.50108@windriver.com>
X-Originating-IP: [128.224.147.210]
Subject: Re: how to fix WARNING: QA Issue: libpam: installed in the base_prefix, requires a shared library under exec_prefix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2012 18:19:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-03 01:45 PM, Mark Hatle wrote:
> On 8/3/12 11:44 AM, Yao Zhao wrote:
>> Hi all,
>>
>> Any suggestion to fix these kinds of QA warnings?
>>
>> libpam is referencing /usr/lib/libcrack from /lib/security.
>>
>> I tried to fix cracklib to install to /lib but cracklib is using other
>> libraries from /usr/lib, I am afraid that I am touching a chain, so any
>> good ideas?
>
> Historically I'm used to cracklib being in /lib... but I also don't 
> remember a huge chain of additional libraries.
>
libcrack is depending on libz and libz is in usr/lib too.
Seems libz didn't depend another.

What exactly reason that this is a serious problem? Is this a standard?
It is quite possible that a lib library depending on usr/lib then .....
Do we have a one-shot cure?

yao
> It may be worth identifying the chain and seeing if we can break it, 
> or at least reduce it in some fairly easy way.
>
> --Mark
>
>> thanks,
>> yao
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




