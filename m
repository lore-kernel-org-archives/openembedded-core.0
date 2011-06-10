Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1QUs0c-0002p0-0R
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 05:03:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5A1lIsM002365
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Jun 2011 18:47:18 -0700 (PDT)
Received: from [128.224.162.220] (128.224.162.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 9 Jun 2011 18:47:18 -0700
Message-ID: <4DF17779.6050004@windriver.com>
Date: Fri, 10 Jun 2011 09:46:33 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <4DE850E8.2050701@windriver.com> <4DF14BE9.7080704@intel.com>
In-Reply-To: <4DF14BE9.7080704@intel.com>
X-Mailman-Approved-At: Fri, 10 Jun 2011 08:44:50 +0200
Cc: "Purdie, Richard" <richard.purdie@intel.com>, 'Patches and discussions
	about the oe-core layer' <openembedded-core@lists.openembedded.org>
Subject: Re: [Yocto] The design document for ccache-native
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
X-List-Received-Date: Fri, 10 Jun 2011 03:03:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2011 06:40 AM, Saul Wold wrote:
> On 06/02/2011 08:11 PM, wenzong fan wrote:
>> Hi Folks,
>>
>> Please help me to review the design document for ccache-native, and
>> I also have two questions about it, any answers or suggestions are
>> appreciated.
>>
>> * Feature name: ccache-native
>>     Priority: P3; M2
>>     Owner: Wenzong Fan
>>     Summary: Integrate ccache-native to yocto
>>
>> * Description:
>> Bitbake supports the 'CCACHE Mechanism', but 'ccache' hasn't been
>> included by poky/yocto, just add it as a native tool.
>>
>> * Usage:
>> Build ccache as a native tool by default and enable it for speeding
>> target packages build.
>>
>> * Implementation:
>> 1) Copy bb file from OE upstream to:
>>       meta/recipes-devtools/ccache/
>>
>> 2) Update bb file to get the latest ccache_3.1.5 and split the single
>> bb file to:
>>       'ccache_3.1.5.bb', 'ccache.inc'
>>
>> 3) Enable ccache in the native tools building.
>>
> You will need to have it be a dependency pretty early on in the build.
> Additionally, this is a bit a new part to this task, we want to have 
> the default CCACHE_DIR for the build default to a directory in TMPDIR 
> instead of the user's home directory.  This will mean setting an 
> environment variable somewhere early also.
>
>
>> * Questions:
>> 1) Do we want to add it as a target package? And which images should
>> include it?
> Yes, it should be included as part of any SDK image, to do this you 
> would add it to the task-core-sdk list.
>
>> 2) How to add it into native tools build list and build it by default?
>>
> You use BBCLASSEXTEND = "native" in the recipe, that will give you the 
> native for free.

Sorry for the confusions, actually I want to know how can I enable the 
ccache in native tools build, I think you have given the answers in 
'Implementation #3'.

Thanks a lot.

Wenzong
>
>>
>> Thanks
>> Wenzong
>>
>
>



