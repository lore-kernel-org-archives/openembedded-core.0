Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1USpmv-0002qw-Pz
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 16:26:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3IE8dgl010966
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 07:08:39 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 18 Apr 2013 07:08:38 -0700
Message-ID: <516FFE5F.7040901@windriver.com>
Date: Thu, 18 Apr 2013 09:08:31 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1304180833040.10184@oneiric>
In-Reply-To: <alpine.DEB.2.02.1304180833040.10184@oneiric>
Subject: Re: tweaking insane.bbclass to handle MIPS SEAD-3?
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
X-List-Received-Date: Thu, 18 Apr 2013 14:26:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/13 7:38 AM, Robert P. J. Day wrote:
>
>    students from a class of mine last year are currently playing with a
> MIPS SEAD-3:
>
> http://www.mips.com/products/development-kits/mips-sead-3/
>
> and asked for some assistance getting oe/yocto to build for that kit.
> they started with the routerstation pro content, and just wanted to
> reproduce the same rootfs to run on the SEAD-3 (they would use the
> provided u-boot and kernel for now). the biggest issue was changing
> the endianness of the build.
>
>    got an email this morning, they have a working rootfs, i asked for
> details on everything they had to do, but for now, here's the final
> issue they dealt with:
>
> "Attached rootfs created for RS Pro, but with mips32el (little endian
> config) and soft floating point. I had to comment out the endianess
> check Python code from the insane.bbclass file to get the build to
> work."

I'm interested in what changes are required.  Both mips and mipsel are defined 
in the insane class.  If you define 'mips', but end up building little endian, 
you WILL get errors.  But if the arch is defined as mipsel, then no errors 
should be generated.

If the arch is 'mips32' and 'mips32el' then those are simply not defined at this 
point.  But before defining them, what is the difference between mips and mips32?

(I have no experience with this particular board, so I don't know what the 
actual gcc configuration is for building functional software.)

>    so if someone wants to adjust insane.bbclass to recognize and handle
> a SEAD-3, go for it. i'll post full details when i get them in case
> there was anything else relevant.
>
> rday
>



