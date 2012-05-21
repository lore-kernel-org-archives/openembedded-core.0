Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SWV37-0004A4-9B
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 18:01:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4LFpPgd025320
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 08:51:25 -0700 (PDT)
Received: from msp-dhcp32.wrs.com (172.25.34.32) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 21 May 2012 08:51:23 -0700
Message-ID: <4FBA6479.1040105@windriver.com>
Date: Mon, 21 May 2012 10:51:21 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1337570904.git.raj.khem@gmail.com>
	<1337588501.11345.605.camel@ted>
In-Reply-To: <1337588501.11345.605.camel@ted>
Subject: Re: [RFC][PATCH 00/14] mips64 support and sh4 support
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
X-List-Received-Date: Mon, 21 May 2012 16:01:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/12 3:21 AM, Richard Purdie wrote:
> On Sun, 2012-05-20 at 20:35 -0700, Khem Raj wrote:
>> This patchset adds required bits into metadata for having
>> mips64/n64 support. I have tested the core-image-sato and core-image-minimal
>> builds and boots on qemumips64 and runs gcc regression testsuite.
>> It needs linux-yocto-dev kernel for now which can be obtained from
>> poky-extra repo. Additionally systemd-image on angstrom-next builds and boots
>> fine on qemumips64 as well.

> We need to figure out what it means to add new qemu machines like this
> to OE-Core. I'm not against it however I can't offer the Yocto Project's
> resources to test them at this point as we're haven't budgeted for it.
>
> The above patches make sense regardless so I've merged them except the
> final two machine files. I'd like to hold off adding those until the
> system builds and runs with our default kernel and qemu recipes.
> Hopefully this lets you develop without having a huge queue of patches.
>
> In the meantime we need to figure out the resource concern for testing.
> Is there a commercial interest in these new machines from anyone who
> could perhaps help with the resource issue?

 From a commercial interest standpoint, I don't know if there is any with SH4. 
For the company I work for, SH has been so minor that we likely wouldn't 
consider it significant enough to spend effort on.

However, MIPS64 is completely different.  There are numerous MIPS64 processors 
and such, and I strongly advocate OE (and Yocto Project) support for MIPS64.

One thing to note, it should be possible to use the MIPS64 QEMU to replace the 
"qemumips" configuration already in OE-core.  Then the qemumips64 can be used to 
validation, mips (o32), mips64 (n64) and eventually mips64 (n32) binaries once 
they are available.  This would also be a good target to validation complex 
multilib sets on.

--Mark

> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



