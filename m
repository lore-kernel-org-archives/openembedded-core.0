Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 613AE719B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 15:51:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u93Fpt5g029960
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 3 Oct 2016 08:51:55 -0700
Received: from server.local (128.224.21.129) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 3 Oct 2016 08:51:55 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1475473494.git.bruce.ashfield@windriver.com>
	<CAJTo0LacaDPQawfsK45GTwOVPohsxQN+e2FtZjEYvT91Ruxb5g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <d5b8ad07-09f4-bb3e-46ed-3a93df33ba76@windriver.com>
Date: Mon, 3 Oct 2016 11:51:54 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LacaDPQawfsK45GTwOVPohsxQN+e2FtZjEYvT91Ruxb5g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated (and hopefully final) pull request
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
X-List-Received-Date: Mon, 03 Oct 2016 15:51:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-03 11:45 AM, Burton, Ross wrote:
>
> On 3 October 2016 at 06:54, Bruce Ashfield <bruce.ashfield@windriver.com
> <mailto:bruce.ashfield@windriver.com>> wrote:
>
>     The big thing to note about this update .. is that the libc-headers bump
>     to the 4.8 final tarball picked up some uapi headers that broke the
>     build
>     of ppp. I never would have thought it was possible, but it happened.
>
>
> | In file included from
> /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/include/linux/if_tunnel.h:6:0,
> |                  from iptunnel.c:39:
> |
> /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/include/linux/ip.h:85:8:
> error: redefinition of 'struct iphdr'
> |  struct iphdr {
> |         ^~~~~
> | In file included from iptunnel.c:29:0:
> |
> /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/include/netinet/ip.h:44:8:
> note: originally defined here
> |  struct iphdr
> |         ^~~~~
> | <builtin>: recipe for target 'iptunnel.o' failed
> | make: *** [iptunnel.o] Error 1
> | ERROR: Function failed: do_compile (log file is located at
> /data/poky-master/tmp-glibc/work/corei7-64-poky-linux/net-tools/1.60-26-r0/temp/log.do_compile.27643)
>
> Looks like net-tools is broken by something else too.

I'm out of the office in about one hour. So someone else is
going to have to pick up the libc-headers fix.

Cheers,

Bruce

>
> Ross


