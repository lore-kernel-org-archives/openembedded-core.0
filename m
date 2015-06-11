Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B9E6758F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 01:17:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B1Hblo017017
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Jun 2015 18:17:37 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 10 Jun 2015 18:17:37 -0700
Message-ID: <5578E1AF.7060704@windriver.com>
Date: Thu, 11 Jun 2015 09:17:35 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1433840650.git.liezhi.yang@windriver.com>
	<3dad7b58e258a4fb34e78dc8a3145efe2525f6e2.1433840650.git.liezhi.yang@windriver.com>
	<CAJTo0LbWKgtFa0zvr7GVeKgN+ZAb643RhicforGSz_BBpO1AxQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbWKgtFa0zvr7GVeKgN+ZAb643RhicforGSz_BBpO1AxQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libpostproc: fix installed-vs-shipped
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
X-List-Received-Date: Thu, 11 Jun 2015 01:17:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 06/10/2015 06:59 PM, Burton, Ross wrote:
> On 9 June 2015 at 10:04, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     When MACHINE=qemux86-64 and enable multilib:
>     ERROR: QA Issue: libpostproc: Files/directories were installed but not
>     shipped in any package:
>        /usr/lib
>        /usr/lib/libpostproc.so.52.3.0
>        /usr/lib/libpostproc.so
>        /usr/lib/libpostproc.so.52
>        /usr/lib/.debug
>        /usr/lib/.debug/libpostproc.so.52.3.0
>     Please set FILES such that these items are packaged. Alternatively if they
>     are unneeded, avoid installing them or delete them within do_install.
>     [installed-vs-shipped]
>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>
>
> This commit log tells us in exact detail that there was a QA error when multilib
> is enabled, but never mentions what the actual problem is or what the fix is.  A
> more useful commit would be something like:
>
> "libpostproc: pass correct libdir
>
> Pass the right libdir to configure as otherwise it assumes $prefix/lib which may
> be wrong"

Thanks, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/2fixes

     libpostproc: pass correct libdir

     When MACHINE=qemux86-64 and enable multilib:
     ERROR: QA Issue: libpostproc: Files/directories were installed but not 
shipped in any package:
       /usr/lib
       /usr/lib/libpostproc.so.52.3.0
       /usr/lib/libpostproc.so
       /usr/lib/libpostproc.so.52
       /usr/lib/.debug
       /usr/lib/.debug/libpostproc.so.52.3.0
     Please set FILES such that these items are packaged. Alternatively if they 
are unneeded, avoid installing them or delete them within do_install. 
[installed-vs-shipped]

     Pass the right libdir to configure as otherwise it assumes $prefix/lib
     which may be wrong.

// Robert


>
> Ross

