Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QHJrl-0001kU-NW
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 19:58:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p43Hts15015613
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 May 2011 10:55:54 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 3 May 2011 10:55:54 -0700
Message-ID: <4DC041A9.5020108@windriver.com>
Date: Tue, 3 May 2011 12:55:53 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <BANLkTi=f-GL8RbJLCAikFTtkON5C9NDvDw@mail.gmail.com>	<4DBF4F26.90404@intel.com>	<BANLkTimUw9+kWHwdw5dZ0=kUZuNSsorsdA@mail.gmail.com>	<4DC03C43.8080507@windriver.com>
	<20110503174732.GA5436@sakrah.homelinux.org>
In-Reply-To: <20110503174732.GA5436@sakrah.homelinux.org>
Subject: Re: qemu segfaulting when booting ext3 image
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
X-List-Received-Date: Tue, 03 May 2011 17:58:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/3/11 12:47 PM, Khem Raj wrote:
> On (03/05/11 12:32), Mark Hatle wrote:
>>>> I can't figure out one case that nfs root works and ext3 image doesn't...
>>
>> Good question, I don't know.  In my experience both NFS and ext3 root crashes
>> with the nvidia drivers.  I have a patch to the version of QEMU I use that
>> disables all of GL to work around the problem.
> 
> just pass "<-nographic>" to the script
> 
>>
>> I believe it's mhatle/qemu on poky-contrib... but it hasn't been updated for a
>> while now.

-nographic was not enough as the libGL system was still be initialized, and that
for me is where the crash occurred..

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



