Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Randy.MacLeod@windriver.com>) id 1TMRxM-0003bz-Np
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 01:14:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9BKS4Rm008779
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 13:28:04 -0700 (PDT)
Received: from [128.224.146.247] (128.224.146.247) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 11 Oct 2012 13:28:04 -0700
Message-ID: <50772BD3.7040809@windriver.com>
Date: Thu, 11 Oct 2012 16:28:03 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1348004325-30668-1-git-send-email-andy.ross@windriver.com>
	<1348004325-30668-2-git-send-email-andy.ross@windriver.com>
	<1348004325-30668-3-git-send-email-andy.ross@windriver.com>
	<5058F4C5.9030903@linux.intel.com> <5058F6C1.8080701@windriver.com>
In-Reply-To: <5058F6C1.8080701@windriver.com>
X-Originating-IP: [128.224.146.247]
Subject: Re: [PATCH 2/2] udev-extraconf: Don't mount root filesystem under /media
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
X-List-Received-Date: Thu, 11 Oct 2012 23:14:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-09-18 06:33 PM, Andy Ross wrote:
> On 09/18/2012 03:25 PM, Saul Wold wrote:
>> How much bigger does this make the busybox image?
>
> These binaries are manually stripped and not prelinked, but probably
> close enough:
>
> -rwxr-xr-x. 1 andy andy 557312 Sep 18 15:30 busybox-r0
> -rwxr-xr-x. 1 andy andy 561696 Sep 18 15:30 busybox-r1
>
> So 4k or 0.8%, basically.
>
> Andy
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

Any news on this being added? I know there's a 1.3 release to get out
so I'm just wondering if we should expect silence then
a flurry of merges after 1.3 is declared in the couple of weeks.

Thanks,
-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350


