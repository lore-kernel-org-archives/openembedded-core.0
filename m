Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1U8SQP-0004VR-LK
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 10:26:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1L9AWZM022820
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Feb 2013 01:10:32 -0800 (PST)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 21 Feb 2013 01:10:30 -0800
Message-ID: <5125E484.1090905@windriver.com>
Date: Thu, 21 Feb 2013 17:10:28 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <1361394588-30527-1-git-send-email-farrah.rashid@windriver.com>
	<5125C921.2030407@linux.intel.com>
	<CAC1BbcQ-5Jh-k_1nBd0O3DXCa6EuuVBdkgmj2cPhYFSOjGH1BQ@mail.gmail.com>
In-Reply-To: <CAC1BbcQ-5Jh-k_1nBd0O3DXCa6EuuVBdkgmj2cPhYFSOjGH1BQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Fix tcp-wrappers for sshd
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
X-List-Received-Date: Thu, 21 Feb 2013 09:26:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/21/2013 03:50 PM, Bernhard Reutner-Fischer wrote:
> On 21 February 2013 08:13, Saul Wold <sgw@linux.intel.com> wrote:
>> On 02/20/2013 01:09 PM, farrah rashid wrote:
>>>
>>> farrah rashid (2):
>>>     tcp-wrappers: remove size_t.patch
>>>     tcp-wrappers: add socklen_t.patch
>>>
>>>    .../tcp-wrappers/tcp-wrappers-7.6/size_t.patch     |   44
>>> ---------------
>>>    .../tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch  |   59
>>> ++++++++++++++++++++
>>>    .../tcp-wrappers/tcp-wrappers_7.6.bb               |    4 +-
>>>    3 files changed, 61 insertions(+), 46 deletions(-)
>>>    delete mode 100644
>>> meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch
>>>    create mode 100644
>>> meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
>>>
>>
>> This must be for Danny, please mark that in the patch in the future.
>
> socklen_t is also needed on !GLIBC hosts since a long time now (IIRC
> it was even in SUSv2).
> I would just use most of the syndicated patches from debian/patches/ from
> http://ftp.de.debian.org/debian/pool/main/t/tcp-wrappers/tcp-wrappers_7.6.q-24.debian.tar.xz
> YMMV.
>



size_t.patch has been removed in 6c418ec278335c93692c2e19ec0b7b84b471e2b9,

In fact, size_t.patch has introduced a bug in ppc64.


-Roy




> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

-- 
Best Reagrds,
Roy | RongQing Li


