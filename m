Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2408665CBF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 08:47:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6M8lVwZ009924
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Jul 2016 01:47:31 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 22 Jul 2016 01:47:30 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1468935802.git.liezhi.yang@windriver.com>
	<e6dc6baf0f850853605319815acc19cb14de189c.1468935802.git.liezhi.yang@windriver.com>
	<CAJTo0LbWf5q40LQmEZQxPF0wLNVmoi=J7HXjtJNwCxgMU2WtOQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5791DDA1.1070707@windriver.com>
Date: Fri, 22 Jul 2016 16:47:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbWf5q40LQmEZQxPF0wLNVmoi=J7HXjtJNwCxgMU2WtOQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] e2fsprogs: 1.43 -> 1.43.1
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
X-List-Received-Date: Fri, 22 Jul 2016 08:47:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 07/22/2016 05:40 AM, Burton, Ross wrote:
>
> On 19 July 2016 at 14:44, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     There is a new confgure option --enable-hardening:
>
>     http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.43.1
>     <http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.43.1>
>
>     Enable it by default, for target. The native can't be built with it:
>     | checking for uuid_generate in -luuid... no
>     | configure: error: external uuid library not found
>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>
>
> This isn't generating any translations:

Sorry, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/pu

It was because the newest po/Makefile.in.in uses @mkdir_p@. If confiure.ac
uses AM_INIT_AUTOMAKE(), the AC_SUBST(mkdir_p) would run automatically, but
e2fsprogs doesn't have Makefile.am, so it can't use that. Manualy run
AC_SUBST(mkdir_p) to fix the problem.

// Robert

>
> packages/corei7-64-poky-linux/e2fsprogs: PACKAGES: removed "e2fsprogs-locale-sv
> e2fsprogs-locale-ca e2fsprogs-locale-es e2fsprogs-locale-it e2fsprogs-locale-de
> e2fsprogs-locale-eo e2fsprogs-locale-uk e2fsprogs-locale-nl e2fsprogs-locale-cs
> e2fsprogs-locale-fr e2fsprogs-locale-pl e2fsprogs-locale-da e2fsprogs-locale-tr
> e2fsprogs-locale-vi e2fsprogs-locale-zh-cn e2fsprogs-locale-id" added
> "e2fsprogs-locale"
>
> A fragment of the do_install log:
>
> make[1]: Entering directory
> '/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/build/po'
> /bin/sh: 6: @mkdir_p@: not found
> /usr/bin/install: cannot create regular file
> ‘/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/locale/ca/LC_MESSAGES/e2fsprogs.mo’:
> No such file or directory
> installing ../../git/po/ca.gmo as
> /data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/locale/ca/LC_MESSAGES/e2fsprogs.mo
> /bin/sh: 6: @mkdir_p@: not found
> /usr/bin/install: cannot create regular file
> ‘/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/locale/cs/LC_MESSAGES/e2fsprogs.mo’:
> No such file or directory
> installing ../../git/po/cs.gmo as
> /data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/locale/cs/LC_MESSAGES/e2fsprogs.mo
> /bin/sh: 6: @mkdir_p@: not found
> /usr/bin/install: cannot create regular file
> ‘/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/locale/da/LC_MESSAGES/e2fsprogs.mo’:
> No such file or directory
>
> This again. :(
>
> Ross

