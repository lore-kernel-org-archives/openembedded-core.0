Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q1iBQ-0001kV-O3
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 17:42:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2LGeLOV009145
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Mar 2011 09:40:21 -0700 (PDT)
Received: from Macintosh-5.local (172.25.34.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 21 Mar 2011 09:40:20 -0700
Message-ID: <4D877F71.3000405@windriver.com>
Date: Mon, 21 Mar 2011 11:40:17 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1300355683.git.sgw@linux.intel.com>	<1300384055.30423.2078.camel@rex>
	<20110321062422.GB5575@denix.org> <1300722688.30423.3745.camel@rex>
In-Reply-To: <1300722688.30423.3745.camel@rex>
X-Originating-IP: [172.25.34.4]
Cc: poky@yoctoproject.org, Patches, discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/7] Non-GPLv3 Changes & a dependency Fix
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
X-List-Received-Date: Mon, 21 Mar 2011 16:42:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 3/21/11 10:51 AM, Richard Purdie wrote:
> On Mon, 2011-03-21 at 02:24 -0400, Denys Dmytriyenko wrote:
>> On Thu, Mar 17, 2011 at 05:47:35PM +0000, Richard Purdie wrote:
>>> On Thu, 2011-03-17 at 02:58 -0700, Saul Wold wrote:
>>>> From: Saul Wold <sgw@linux.intel.com>
>>>>
>>>> This set of changes enables both poky-image-minimal and poky-image-basic
>>>> to build non-gplv3 core image. These are bound for bernard
>>>>
>>>> There is also a fix for the gnome-vfs dependency on ACL. This is
>>>> a potential build stopper and should be considered for bernard
>>>>
>>>> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>>>>   Branch: sgw/non-gplv3
>>>>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/non-gplv3
>>>>
>>>> Thanks,
>>>>     Saul Wold <sgw@linux.intel.com>
>>>> ---
>>>>
>>>>
>>>> Saul Wold (7):
>>>>   util-linux: Setup for GPLv2 Recipe
>>>
>>> I don't like this patch at all, there are some typos in it and some
>>> other issues. Too risky for bernard for sure. I'm leaving it for now.
>>
>> FYI, in Arago I had to repackage util-linux-ng source tarball w/o lscpu pieces 
>> to completely avoid GPLv3, instead of removing them on the fly... In case when 
>> said source tarball needs to be mirrored or distributed with the build.
> 
> The main point is to ensure the runtime is GPLv3 free. With those files
> removed, that is the case. If you share a mirror with some GPLv3 code in
> it, it has a very different effect licensing wise compared to v3
> binaries on a system. I'm not a lawyer though and I'd be interested to
> know if you've heard a different interpretation of the license?
> 
>> And, BTW, there is one more little script under GPLv3 - tests/ts/lscpu/lscpu
> 
> As Nitin replied, I thought that was removed already?

I think it's important to keep in mind that the responsibilities for
redistribution/repackaging really are up to the end user (of OE-core) and their
lawyer's interpretation of the license.

As Richard mentioned, our goal is specifically to keep any code (that we know
of) that is GPLv3/LGPLv3 off of the target system via the exclude license
feature.  (Which can also be used to target other license types.)

Source distribution and such is still the responsibility of the (OE-core)
end-user and their lawyers to determine.  What we did might be good enough, and
might not..

--Mark

> Cheers,
> 
> Richard
> 
> 
> 
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky



