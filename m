Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1SwkfA-0001X1-B3
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 03:57:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q721jeH3006912
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2012 18:45:40 -0700 (PDT)
Received: from [128.224.162.182] (128.224.162.182) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 1 Aug 2012 18:45:39 -0700
Message-ID: <5019DBC2.6040005@windriver.com>
Date: Thu, 2 Aug 2012 09:45:38 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1343821674.git.wenzong.fan@windriver.com>
	<f0327f027aad26e2b31f4eca789e20b24881b50f.1343821674.git.wenzong.fan@windriver.com>
	<26353882.Yjs6pOGhmz@helios>
In-Reply-To: <26353882.Yjs6pOGhmz@helios>
Cc: wfan@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] qt4: fix qt4-native build failure on SLED-11
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
X-List-Received-Date: Thu, 02 Aug 2012 01:57:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2012 08:36 PM, Paul Eggleton wrote:
> On Wednesday 01 August 2012 19:50:02 wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>
>> This issue is that with C++ compiler process an old version of kernel
>> header file, coincidently that file has a variable named 'new':
>>
>> * 'embedded/qkbdtty_qws.cpp' include 'linux/vt.h';
>> * '/usr/include/linux/vt.h' has below code on SLED-11.x:
>>      + unsigned int new;
>>
>> On mostly hosts it has been changed to: new ->  newev.
>>
>> [YOCTO #2845]
>>
>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>
> Could you please add the description and signed-off-by to the inner patch as
> well?

Ok, I have added those infos and sent patch v2.

Thanks
Wenzong

>
> Thanks,
> Paul
>


