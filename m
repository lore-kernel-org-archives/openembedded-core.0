Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Michel.Thebeau@windriver.com>) id 1UPYBW-0005TY-1q
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 15:02:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r39CiaaT026823
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Apr 2013 05:44:38 -0700 (PDT)
Received: from [128.224.146.59] (128.224.146.59) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 9 Apr 2013 05:44:36 -0700
Message-ID: <51640D33.1000703@windriver.com>
Date: Tue, 9 Apr 2013 08:44:35 -0400
From: Michel Thebeau <michel.thebeau@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1365454473.12407.51.camel@ted>
	<1365456279-30162-1-git-send-email-michel.thebeau@windriver.com>
	<51633682.2030305@windriver.com> <1365457704.12407.63.camel@ted>
In-Reply-To: <1365457704.12407.63.camel@ted>
Cc: Bruce.Ashfield@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] kernel.bbclass: do_strip: allow recipes to strip the kernel
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
X-List-Received-Date: Tue, 09 Apr 2013 13:02:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



On 13-04-08 05:48 PM, Richard Purdie wrote:
> On Mon, 2013-04-08 at 17:28 -0400, Michel Thebeau wrote:
>>
>> On 13-04-08 05:24 PM, michel.thebeau@windriver.com wrote:
>>> From: Michel Thebeau <michel.thebeau@windriver.com>
>>>
>>> Allow recipes to specify sections to be stripped from the kernel output
>>> using KERNEL_IMAGE_STRIP.  For example:
>>>
>>> KERNEL_IMAGE_STRIP = ".comment .unwanted"
>>
>> s/KERNEL_IMAGE_STRIP/KERNEL_IMAGE_STRIP_EXTRA_SECTIONS
>>
>> Throughout
> 
> So are you resending this with the appropriate changes, tested? It looks
> much better this way to me than the first version anyway, thanks.
> 

Yes, I will update this patch to address the same comments given for the
first version and retest before sending it out.

Thanks Richard,

M

> Richard
> 
> 
> 


