Return-Path: <lizhijian@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 97FC86BD6D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 05:55:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,989,1367942400"; 
   d="scan'208";a="8350680"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 30 Aug 2013 13:52:35 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r7U5tf1E010326;
	Fri, 30 Aug 2013 13:55:41 +0800
Received: from [127.0.0.1] ([10.167.226.56])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013083013534201-1088637 ;
	Fri, 30 Aug 2013 13:53:42 +0800 
Message-ID: <522033C9.7050804@cn.fujitsu.com>
Date: Fri, 30 Aug 2013 13:55:21 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
Organization: fnst-ulinux
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <521EA7EC.80302@cn.fujitsu.com> <521EEFB1.4040809@windriver.com>
In-Reply-To: <521EEFB1.4040809@windriver.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/08/30 13:53:42,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/08/30 13:53:42,
	Serialize complete at 2013/08/30 13:53:42
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
X-List-Received-Date: Fri, 30 Aug 2013 05:55:46 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-8859-1; format=flowed

libxml2 is built successfully with option  of  --with-catalog,and xmlcatalog
work well

Maybe I would  send a patch to fix it.

Thanks
Li

at 2013-8-29 14:52, Robert Yang wrote:
>
> I took a look at the libxml's git log, didn't see the explicit reason
> that why use the --without-catalog, so it seems reasonable to use the
> --with-catalog which will make the xmlcatalog work (if it can be built
> well with the option.)
>
> // Robert
>
> On 08/29/2013 09:46 AM, Li Zhijian wrote:
>> Hi,
>>
>> I had build libxml and executed xmlcatalog
>> It shows follow messages
>> # xmlcatalog --help
>> libxml was not compiled with catalog and output support
>>
>> meta/recipes-core/libxml/libxml2.inc: 32
>> EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
>>
>> Is it reasonable to add --without-catalog EXTRA_OECONF ?
>>
>> Thanks
>>
>> Best regards.
>> Li Zhijian
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>
>


-- 
Best regards.
Li Zhijian (8555)



