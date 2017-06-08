Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0C67813F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 14:25:26 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 08 Jun 2017 07:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="95965090"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga004.jf.intel.com with ESMTP; 08 Jun 2017 07:25:27 -0700
Message-ID: <1496932456.26945.157.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 08 Jun 2017 09:34:16 -0500
In-Reply-To: <CAJTo0LbgJFFBPoF=CsOEYauBn1_uDX66hh1zvE5Xw81BiRmR4A@mail.gmail.com>
References: <1496777398-4493-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
	<CAJTo0LbgJFFBPoF=CsOEYauBn1_uDX66hh1zvE5Xw81BiRmR4A@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] oeqa/selftest: Adds verification for the integrity compressed images
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
X-List-Received-Date: Thu, 08 Jun 2017 14:25:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-08 at 11:51 +0100, Burton, Ross wrote:
> 
> On 6 June 2017 at 20:29, Francisco Pedraza
> <francisco.j.pedraza.gonzalez@intel.com> wrote:
>         Added verification for images compression divided in 3 steps.
>         1. Add IMAGE_FSTYPES += "[type(s)]" to ~/conf/local.conf
>         2. Build a "core-image-minimal" using this configuration.
>         3. Verify that the image compressed file is present in rootfs
>         directory.
>         YOCTO[#10745]
> 
> Still fails on the main AB:
> 
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/911/steps/Running%20oe-selftest/logs/stdio
> 

perhaps the fails are expected as commented on 

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10745#c9






> 
> Ross
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



