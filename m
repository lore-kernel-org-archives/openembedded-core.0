Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DEE677226D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 07:39:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4D7dSOS006202
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 May 2015 00:39:28 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 13 May 2015 00:39:27 -0700
Message-ID: <5552FFAD.4070306@windriver.com>
Date: Wed, 13 May 2015 15:39:25 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Ashfield, Bruce"
	<Bruce.Ashfield@windriver.com>
References: <1431350446.30971.56.camel@linuxfoundation.org>
In-Reply-To: <1431350446.30971.56.camel@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto and gcc 5.x
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 May 2015 07:39:29 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


I think that I met another problem when MACHINE = qemuarm64 with gcc5:
linux-yocto_3.19.bb:

/tmp/ccWk2lM2.s: Assembler messages:
/tmp/ccWk2lM2.s:42: Error: .err encountered
/tmp/ccWk2lM2.s:43: Error: .err encountered
/tmp/ccWk2lM2.s:44: Error: .err encountered
/tmp/ccWk2lM2.s:103: Error: .err encountered
/tmp/ccWk2lM2.s:104: Error: .err encountered
/tmp/ccWk2lM2.s:105: Error: .err encountered
make[3]: *** [arch/arm64/kernel/psci.o] Error 1
make[3]: *** Waiting for unfinished jobs....
   CC      mm/mmzone.o
   CC      mm/vmstat.o
   CC      mm/backing-dev.o
   CC      net/socket.o
make[2]: *** [arch/arm64/kernel] Error 2
make[2]: *** Waiting for unfinished jobs....

// Robert

On 05/11/2015 09:20 PM, Richard Purdie wrote:
> Hi Bruce,
>
> One of the things we're looking at in 1.9 is gcc 5.x support by default.
> One of the areas this has significant impact is on the kernels,
> linux-yocto in particular. I'm starting to see a potential problem here
> since the kernels don't appear to work well with gcc 5.x:
>
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=1426e31f0bcd19f066931d2ecbdec3752b14e88e&limit=150&order_by=RECIPE
>
> (this is a test build I ran just to see how bad things were).
>
> Are we going to be in a position to get 5.x support backported into 3.14
> (and maybe 3.10)? Or was we going to have to wait for later versions?
>
> Cheers,
>
> Richard
>
>
>

