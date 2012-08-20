Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T3XXy-0001yd-Ka
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 21:21:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7KJ9sfl009803
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 12:09:54 -0700 (PDT)
Received: from msp-dhcp10.wrs.com (172.25.34.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 20 Aug 2012 12:09:54 -0700
Message-ID: <50328B7D.70001@windriver.com>
Date: Mon, 20 Aug 2012 14:09:49 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1343959047-24613-1-git-send-email-sen.zhang@windriver.com>
	<502D3306.2050100@linux.intel.com>
In-Reply-To: <502D3306.2050100@linux.intel.com>
Subject: Re: [PATCH] libxpm-native: add dependency on gettext-native
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
X-List-Received-Date: Mon, 20 Aug 2012 19:21:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/16/12 12:51 PM, Saul Wold wrote:
> On 08/02/2012 06:57 PM, Jesse Zhang wrote:
>> libxpm needs xgettext. There can be failures if gettext doesn't get built first
>> and it's not available from the host.
>>
>> The target version doesn't have issues since it will get the dependency
>> indirectly.
>>
>> Jesse Zhang (1):
>>     libxpm-native: add dependency on gettext-native
>>
>>    meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb |    3 ++-
>>    1 files changed, 2 insertions(+), 1 deletions(-)
>>
> Merged into OE-Core

I'm not finding this patch in the git repository.  I don't think it was actually 
merged.

--Mark

> Thanks
> 	Sau!
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



