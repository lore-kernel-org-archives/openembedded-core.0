Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1StsUt-0004TI-Am
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 05:43:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6P3VJEo011894
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jul 2012 20:31:19 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 24 Jul 2012 20:31:18 -0700
Message-ID: <500F6884.9070600@windriver.com>
Date: Wed, 25 Jul 2012 11:31:16 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343124846.git.liezhi.yang@windriver.com>
	<7affb352c173c353df0b69002f3ca0f5ee0502cf.1343124846.git.liezhi.yang@windriver.com>
	<1343126992.22222.11.camel@ted>
In-Reply-To: <1343126992.22222.11.camel@ted>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] package-index: inherit pythonnative
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
X-List-Received-Date: Wed, 25 Jul 2012 03:43:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 07/24/2012 06:49 PM, Richard Purdie wrote:
> On Tue, 2012-07-24 at 18:19 +0800, Robert Yang wrote:
>> The native python binary has been moved from usr/bin/python to
>> usr/bin/python-native/python, the recipe which needs python-native
>> should "inherit pythonnative", otherwise there would be errors when the
>> python script runs.
>>
>> [YOCTO #2822]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-core/meta/package-index.bb |    2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> Which part of this recipe needs python-native? Shouldn't scripts which
> need pythonnative be using the path to the python interpreter
> explicitly?
>

It is the poky/scripts/rpm-createsolvedb.py which needs python-native,
I think that if we want to use /path/to/python-native/python to run
rpm-createsolvedb.py or create a wrapper for it, we should put the
rpm-createsolvedb.py into a recipe. So I just inherit pythonnative
in package-index.bb to make it work. I wonder whether this will cause
something wrong, please?

// Robert

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



