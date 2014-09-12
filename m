Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 71C6A65E2B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 10:25:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8CAPmJD012809
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Sep 2014 03:25:48 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 12 Sep 2014 03:25:47 -0700
Message-ID: <5412CA29.1090001@windriver.com>
Date: Fri, 12 Sep 2014 18:25:45 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1410507789-9307-1-git-send-email-kai.kang@windriver.com>
	<CAJTo0La9+9YnJPPaCNXp_7H+_ejYVuOgKb8QRNkV0q3hdZRnAw@mail.gmail.com>
In-Reply-To: <CAJTo0La9+9YnJPPaCNXp_7H+_ejYVuOgKb8QRNkV0q3hdZRnAw@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: Joe Slater <jslater@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add machine qemuarm64
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
X-List-Received-Date: Fri, 12 Sep 2014 10:25:51 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年09月12日 18:22, Burton, Ross wrote:
> On 12 September 2014 08:43, Kai Kang <kai.kang@windriver.com> wrote:
>> There are some packages fail to build with qemuarm64, I will send pathches
>> for them in another series.
> I can't build a kernel with MACHINE=qemuarm64:
>
> |   LINK    vmlinux
> |   LD      vmlinux.o
> | aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory
> | aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory
> | make[2]: *** [vmlinux] Error 1
> | make[1]: *** [sub-make] Error 2
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /data/poky-master/tmp/work/qemuarm64-poky-linux/linux-yocto/3.14.17+gitAUTOINC+a94680bfeb_b85edae6fd-r0/temp/log.do_compile.24366)
> ERROR: Task 81 (/home/ross/Yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.14.bb,
> do_compile) failed with exit code '1'
>
> I can email build logs if you'd wish.

Thanks for try. I just thought to send the patch of gcc  to upstream  
first then fill the Upstream-Status. I'll send it now.
Sorry for trouble.

--Kai


>
> Ross
>
>


-- 
Regards,
Neil | Kai Kang


