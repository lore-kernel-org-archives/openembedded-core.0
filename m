Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SEAiy-0007OF-Nq
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 04:41:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q312VoK8017835
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 31 Mar 2012 19:31:50 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sat, 31 Mar 2012 19:31:50 -0700
Message-ID: <4F77BE14.6000304@windriver.com>
Date: Sun, 1 Apr 2012 10:31:48 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
	<2905489.oBl1N3jSJA@helios>
In-Reply-To: <2905489.oBl1N3jSJA@helios>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Sun, 01 Apr 2012 02:41:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/01/2012 08:47 AM, Paul Eggleton wrote:
> On Thursday 02 February 2012 12:50:16 Samuel Stirtzel wrote:
>> There are other CMake configure pitfalls (all cross compiling scripts
>> in kdelibs are commented out) but it seems that at least the most of
>> them showed already during build time.
>
> Unfortunately when I tried to build kdelibs4 I got the following:
>
> | cd /home/paul/poky/poky/build-kde/tmp/work/i586-poky-
> linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e96d2ed61fc-
> r0/git/build/kjs&&  /home/paul/poky/poky/build-kde/tmp/sysroots/x86_64-
> linux/usr/bin/icemaker /home/paul/poky/poky/build-kde/tmp/work/i586-poky-
> linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e96d2ed61fc-
> r0/git/kjs/bytecode
> | /bin/sh: /home/paul/poky/poky/build-kde/tmp/sysroots/x86_64-
> linux/usr/bin/icemaker: No such file or directory
> | make[2]: *** [kjs/opcodes.h] Error 127
> | make[2]: Leaving directory `/home/paul/poky/poky/build-kde/tmp/work/i586-
> poky-linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e96d2ed61fc-
> r0/git/build'
>

This is a known issue, there is an work around, it seems that the MACHINE is 
qemux86, and host is x86_64, we can:

cp 
tmp/work/i586-poky-linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e96d2ed61fc-r0/git/build/bin/icemaker 
tmp/sysroots/x86_64-linux/usr/bin/icemaker

The problem is that we don't have a kdelibs4-native, and it seems it is not
easy to add it.

// Robert

> Any ideas? Is this a PARALLEL_MAKE issue?
>
> Cheers,
> Paul
>


