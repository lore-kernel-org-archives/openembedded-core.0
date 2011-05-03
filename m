Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QHJVS-0001WI-Nu
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 19:35:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p43HWqlp011878
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 May 2011 10:32:52 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 3 May 2011 10:32:51 -0700
Message-ID: <4DC03C43.8080507@windriver.com>
Date: Tue, 3 May 2011 12:32:51 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <BANLkTi=f-GL8RbJLCAikFTtkON5C9NDvDw@mail.gmail.com>	<4DBF4F26.90404@intel.com>
	<BANLkTimUw9+kWHwdw5dZ0=kUZuNSsorsdA@mail.gmail.com>
In-Reply-To: <BANLkTimUw9+kWHwdw5dZ0=kUZuNSsorsdA@mail.gmail.com>
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
X-List-Received-Date: Tue, 03 May 2011 17:35:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/3/11 12:27 PM, Khem Raj wrote:
> On Mon, May 2, 2011 at 5:41 PM, Zhai, Edwin <edwin.zhai@intel.com> wrote:
>> Did you installed Nvidia proprietary driver? Any error mesg from the runqemu
>> script?
> 
> yes I did and I think that could be a culprit but then why would it
> work with nfs boot.
> there is no useful message from script it just collapses

The script tries to detect the nvidia drivers.  If it finds them is supposed to
issue a warning.  Sounds like your system might not have a version that it knows
how to detect.

>> I can't figure out one case that nfs root works and ext3 image doesn't...

Good question, I don't know.  In my experience both NFS and ext3 root crashes
with the nvidia drivers.  I have a patch to the version of QEMU I use that
disables all of GL to work around the problem.

I believe it's mhatle/qemu on poky-contrib... but it hasn't been updated for a
while now.

--Mark

>>
>>
>> Khem Raj wrote:
>>>
>>> Hi
>>>
>>> I am seeing qemu segfaulting when booting ext3 image. The same rootfs
>>> boots fine over nfs. It does not give any useful message
>>> as to what happened. I am using the runqemu script. Same used to work
>>> fine 3 weeks back. I tried to blame compilers but the behavior
>>> is same irrespective of gcc version I use or even eglibc/uclibc
>>>
>>> Its on x86_64/ubuntu 11.04 host.
>>>
>>> Anyone experiencing it ? bisecting can be a long excercise for this.
>>>
>>> Thanks
>>> -Khem
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



