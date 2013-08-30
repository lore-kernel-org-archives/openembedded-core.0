Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF966BD64
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 08:17:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7U8HLlN023752
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Aug 2013 01:17:21 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 30 Aug 2013 01:17:21 -0700
Message-ID: <522054F2.3020306@windriver.com>
Date: Fri, 30 Aug 2013 16:16:50 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Li Zhijian <lizhijian@cn.fujitsu.com>
References: <521EA7EC.80302@cn.fujitsu.com> <521EEFB1.4040809@windriver.com>
	<522033C9.7050804@cn.fujitsu.com>
In-Reply-To: <522033C9.7050804@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Question] libxml: How about add --with-catalog to EXTRA_OECONF ?
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
X-List-Received-Date: Fri, 30 Aug 2013 08:17:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/30/2013 01:55 PM, Li Zhijian wrote:
> libxml2 is built successfully with option  of  --with-catalog,and xmlcatalog
> work well
>
> Maybe I would  send a patch to fix it.
>

Yes, that would be great, thanks.

// Robert

> Thanks
> Li
>
> at 2013-8-29 14:52, Robert Yang wrote:
>>
>> I took a look at the libxml's git log, didn't see the explicit reason
>> that why use the --without-catalog, so it seems reasonable to use the
>> --with-catalog which will make the xmlcatalog work (if it can be built
>> well with the option.)
>>
>> // Robert
>>
>> On 08/29/2013 09:46 AM, Li Zhijian wrote:
>>> Hi,
>>>
>>> I had build libxml and executed xmlcatalog
>>> It shows follow messages
>>> # xmlcatalog --help
>>> libxml was not compiled with catalog and output support
>>>
>>> meta/recipes-core/libxml/libxml2.inc: 32
>>> EXTRA_OECONF = "--without-python --without-debug --without-legacy
>>> --without-catalog --without-docbook --with-c14n --without-lzma
>>> --with-fexceptions"
>>>
>>> Is it reasonable to add --without-catalog EXTRA_OECONF ?
>>>
>>> Thanks
>>>
>>> Best regards.
>>> Li Zhijian
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>
>>
>
>

