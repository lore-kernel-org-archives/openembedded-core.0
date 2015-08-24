Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D8A071633
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 06:50:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7O6oNSR000377
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Aug 2015 23:50:24 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 23 Aug 2015 23:50:23 -0700
Message-ID: <55DABEAD.7020102@windriver.com>
Date: Mon, 24 Aug 2015 14:50:21 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1440144361-16138-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LYOCmMy_5L8qWxSfTveeevZkPZrYAjHMj4r_DViX1H+SQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYOCmMy_5L8qWxSfTveeevZkPZrYAjHMj4r_DViX1H+SQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: fix the check
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
X-List-Received-Date: Mon, 24 Aug 2015 06:50:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年08月21日 21:26, Burton, Ross wrote:
>
> On 21 August 2015 at 09:06, <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     +       if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" =
>     "1" ] && grep -q install-python_ext ${S}/tools/perf/Makefile; then
>
>
> So now of course Python gets installed, but not packaged:
>
> ERROR: QA Issue: perf: Files/directories were installed but not shipped
> in any package:
>    /home
>    /home/pokybuild
>    /home/pokybuild/yocto-autobuilder
>    /home/pokybuild/yocto-autobuilder/yocto-worker
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb
>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf.so
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf-0.1-py2.7.egg-info
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install. [installed-vs-shipped]
>
> Ross

Hi Ross:

which branch do you use to test this patch?

since the install-python_ext is moved from Makefile to
Makefile.perf from linux v3.13, and this patch is not working
and I can not reproduce this issue of installing the target
file to native dir


-- 
Best Reagrds,
Roy | RongQing Li

