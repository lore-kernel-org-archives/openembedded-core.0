Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZPEY-0002wC-7Q
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 17:20:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MFHEKs004263
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 08:17:14 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 22 Jun 2011 08:17:13 -0700
Message-ID: <4E020779.7080107@windriver.com>
Date: Wed, 22 Jun 2011 10:17:13 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308732995.git.dongxiao.xu@intel.com>	<d7c256ba838d05c85c6e7c2569f0a6c7b276ab17.1308732995.git.dongxiao.xu@intel.com>	<4E01FFDA.3050905@gmail.com>
	<1308754043.21613.88.camel@phil-desktop>
In-Reply-To: <1308754043.21613.88.camel@phil-desktop>
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Wed, 22 Jun 2011 15:20:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/22/11 9:47 AM, Phil Blundell wrote:
> On Wed, 2011-06-22 at 07:44 -0700, Khem Raj wrote:
>> On 06/22/2011 02:01 AM, Dongxiao Xu wrote:
>>> *libc's do_package will cost a lot of time due to the locale handing,
>>> which may delay the other recipe's do_package task and affect the build
>>> performance.
>>
>> you could also move the locale generation into a task of its own instead 
>> of new recipe
> 
> It'd be hard to get the dependencies to work out right if you did that,
> though.  I think a new recipe probably is the right answer.

And in the case of libc, the locales need to be done -after- the
populate_sysroot, or we don't get the parallelism improvement.

--Mark

> p.
> 
> [ .... 100000 quoted lines snipped ... ]
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



