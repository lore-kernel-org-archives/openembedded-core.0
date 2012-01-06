Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RjCuR-0002jd-F7
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 17:44:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q06GbQpn020956
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 08:37:26 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 6 Jan 2012 08:37:26 -0800
Message-ID: <4F072345.9050602@windriver.com>
Date: Fri, 6 Jan 2012 10:37:25 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1325840092.git.dongxiao.xu@intel.com>
	<1325867267.14746.8.camel@ted>
In-Reply-To: <1325867267.14746.8.camel@ted>
Subject: Re: [PATCH 0/7][PULL] Hob2 related oe-core changes
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
X-List-Received-Date: Fri, 06 Jan 2012 16:44:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/12 10:27 AM, Richard Purdie wrote:
> On Fri, 2012-01-06 at 17:04 +0800, Dongxiao Xu wrote:
>> Hi Richard,
>>
>> This pull request is the hob2 related oe-core changes.
>> Please help to review and pull.
>>
>> Note that this pull request has dependency on the hob related bitbake changes.
>>
>> Thanks,
>> Dongxiao
>>
>> The following changes since commit 4a85312568a6bb052cc511c15b4ae842ff7f8e59:
>>    Richard Purdie (1):
>>          image-mklibs/package_ipk: Remove bashisms
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib dxu4/hob-oecore-changes
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob-oecore-changes
>>
>> Dongxiao Xu (6):
>>    bblayers.conf.sample: Use ?= to set BBLAYERS
>>    image.bbclass: Use ?= to set LINGUAS_INSTALL
>
> I merged these.
>
>>    packageinfo.bbclass: add a new bbclass to pass package information
>
> I still have quite a strong dislike of this code, its rather nasty to
> require this and I wish we could come up with a less ugly way to collect
> up this information.
>
>>    hob.bb: Add a empty image template
>>    hob-toolchain: add a new recipe hob-toolchain
>>    layers: add a new folder to put user added layers
>
> I don't like these three. They're horribly hob specific and IMO
> shouldn't be in the general metadata. If there is no way to avoid them,
> they should perhaps go into a meta-hob layer directory to keep them
> separate from the rest of the system.
>
> I'm still puzzled how the layers directory helps. We deliberately
> support generic layer locations so forcing the user to place them in a
> particular place seems like a bit of a backwards step? :/.

I think the layer directory is useful for distributions based on oe-core.  But I 
agree, it seems wrong to have it in OE-core itself -- unless there is a strong 
demand from the users of a "standard place" to put layers in their tree.  (So 
far I've not heard such a request.)

--Mark

> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



