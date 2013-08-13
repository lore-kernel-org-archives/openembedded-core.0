Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6E0C6B516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 17:58:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7DHwmFH021780
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2013 10:58:48 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 10:58:48 -0700
Message-ID: <520A73D7.9030508@windriver.com>
Date: Tue, 13 Aug 2013 12:58:47 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Laszlo Papp <lpapp@kde.org>
References: <1376413879-9809-1-git-send-email-sgw@linux.intel.com>
	<CAOMwXhP2nK2kjwseLjH0G-Wc9u20cOms-TWbF7zpYrya-GX8=w@mail.gmail.com>
	<CAOMwXhNFwVwt4G_v-SMMph=J3zvv=Z6Jh=LvEKZGVO=_zpChrg@mail.gmail.com>
	<520A6DDC.5060609@windriver.com>
	<CAOMwXhMnojFEXBG0H02CH4B7DTMiFQeJMOt9bvuGbCjWmh-2NA@mail.gmail.com>
In-Reply-To: <CAOMwXhMnojFEXBG0H02CH4B7DTMiFQeJMOt9bvuGbCjWmh-2NA@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] meta-skeleton: Add busybox config fragment example
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
X-List-Received-Date: Tue, 13 Aug 2013 17:58:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/13 12:40 PM, Laszlo Papp wrote:
> On Tue, Aug 13, 2013 at 6:33 PM, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
>
>     On 8/13/13 12:23 PM, Laszlo Papp wrote:
>
>         s/which files/which lines/
>
>
>     The kernel configuration mechanism has a tool that will combine the original
>     configuration, and any listed configuration fragments (.cfg files).  It will
>     combine these, and then filter them in such a way that last-in wins.
>
>     See the Yocto Project Linux Kernel Development manual, section 2.2.3:
>
>     http://www.yoctoproject.org/__docs/current/kernel-dev/__kernel-dev.html#changing-the-__configuration
>     <http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration>
>
>
> Could you please clarify how that is related to my question? What I wanna
> understand is: I set something in the config as I wish, and then the bitbake
> file is getting chopped respectively like with "ifdef/elif" etc in C/C++, but
> this time inside the python script defined in the bitbake file.

You asked: How will this know which lines exactly to disregard in the busybox 
include file (".inc")?

My answer is that, according to the quoted documentation, the tooling, as 
described in the above URL, does this as a last-in processing, based on the 
filename(s) of the SRC_URI components.

> I am well aware of that you can customize the defconfig, but my question was
> about the python function.

Specifically for the busybox package, the python fragement "find_cfgs(d):" 
located in the busybox.inc file finds the .cfg files, and collects them into a 
list.  They are then processed by the 'merge_config.sh' script that is called as 
part of the do_configure task.

I believe the merge_config script is provided as part of the linux-libc-headers 
or linux-yocto package, but I may be incorrect on that.

--Mark

