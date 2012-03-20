Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S9xwy-0006Mz-8C
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 13:14:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2KC5ARj020227
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Mar 2012 05:05:10 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 20 Mar 2012 05:05:10 -0700
Message-ID: <4F687274.5080608@windriver.com>
Date: Tue, 20 Mar 2012 20:05:08 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4F684301.5060307@windriver.com> <1757423.DE0kMhjxZk@helios>
In-Reply-To: <1757423.DE0kMhjxZk@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Why qemu-config RDPENDS on distcc ?
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
X-List-Received-Date: Tue, 20 Mar 2012 12:14:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 03/20/2012 05:43 PM, Paul Eggleton wrote:
> On Tuesday 20 March 2012 16:42:41 Robert Yang wrote:
>> I'm just curious that qemu-config RDPENDS on distcc:
>>
>> meta/recipes-bsp/qemu-config/qemu-config.bb:RDEPENDS_${PN} = "distcc ..."
>>
>> And there are 4 processes named "distcc" running after boot the target
>> with "runqemu qemux86".
>>
>> We have distcc on the target, but no gcc or g++, can we remove it from
>> qemu-config's RDEPENDS?
>
> I think the idea was that if you wanted to do compilation on the emulated
> target, having distcc would let you do it with much better performance. I
> agree it seems that it's not particularly useful if you're never going to do
> any compilation on the target though.
>

Thanks for your reply, so may I send a pull request to remove it from
qemu-config's RDPENDS?

// Robert

> Cheers,
> Paul
>


