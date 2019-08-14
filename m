Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46A376D548
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 01:59:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7E1x2s6027830
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 18:59:02 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 13 Aug 2019 18:59:01 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1565674414-112937-1-git-send-email-hongzhi.song@windriver.com>
	<CADkTA4PCeER9wP28NOaUtKEFBLKmqUfda7Cz+M0q2cgp5DiYew@mail.gmail.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <abef39b8-e8b0-db67-70e7-da17666d1056@windriver.com>
Date: Wed, 14 Aug 2019 09:58:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PCeER9wP28NOaUtKEFBLKmqUfda7Cz+M0q2cgp5DiYew@mail.gmail.com>
X-Originating-IP: [128.224.162.188]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: cp Documentation/ to sdk kernel
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
X-List-Received-Date: Wed, 14 Aug 2019 01:59:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 8/13/19 8:27 PM, Bruce Ashfield wrote:
>
>
> On Tue, Aug 13, 2019 at 1:35 AM Hongzhi.Song 
> <hongzhi.song@windriver.com <mailto:hongzhi.song@windriver.com>> wrote:
>
>     A new patch let kernel source Documentation/Kconfig in top Kconfig
>     So kernel-devsrc should include Documentation/ too.
>     Otherwise "make scripts" will fails.
>
>     patch:
>     commit b1663d7e3a7961fc45262fd68a89253f2803036c
>     Author: Mauro Carvalho Chehab <mchehab+samsung@kernel.org
>     <mailto:mchehab%2Bsamsung@kernel.org>>
>     Date:   Tue Jun 4 09:26:27 2019 -0300
>
>         docs: Kbuild/Makefile: allow check for missing docs at build time
>
>         While this doesn't make sense for production Kernels, in order to
>         avoid regressions when documents are touched, let's add a
>         check target at the make file.
>
>         Signed-off-by: Mauro Carvalho Chehab
>     <mchehab+samsung@kernel.org <mailto:mchehab%2Bsamsung@kernel.org>>
>         Signed-off-by: Jonathan Corbet <corbet@lwn.net
>     <mailto:corbet@lwn.net>>
>
>     Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com
>     <mailto:hongzhi.song@windriver.com>>
>     ---
>      meta/recipes-kernel/linux/kernel-devsrc.bb
>     <http://kernel-devsrc.bb> | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
>     <http://kernel-devsrc.bb>
>     b/meta/recipes-kernel/linux/kernel-devsrc.bb <http://kernel-devsrc.bb>
>     index 5ec5929..a874e06 100644
>     --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>     <http://kernel-devsrc.bb>
>     +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>     <http://kernel-devsrc.bb>
>     @@ -65,7 +65,7 @@ do_install() {
>          )
>
>          # then drop all but the needed Makefiles/Kconfig files
>     -    rm -rf $kerneldir/build/Documentation
>     +    #rm -rf $kerneldir/build/Documentation
>
>
> In the spirit of keeping kernel-devsrc as small as possible (I have 
> another patch pending if you really want the full kernel source), this 
> should only keep the Documentation/ files that are required to pass 
> the check, not keep all of Documentation.


If you have a better patch, I am pleasure to accept it.

Thanks,

--Hongzhi


> Bruce
>
>          rm -rf $kerneldir/build/scripts
>          rm -rf $kerneldir/build/include
>
>     -- 
>     2.8.1
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

