Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2926162252
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 11:18:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Sep 2014 04:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,456,1406617200"; d="scan'208";a="597247164"
Received: from svgunawa-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.16])
	by orsmga002.jf.intel.com with ESMTP; 03 Sep 2014 04:18:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
Date: Wed, 03 Sep 2014 12:18:22 +0100
Message-ID: <128162541.C4CYxaNuW2@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-201.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <CADwFkYe-T3MdkwmwwfW8nb6UsxUxbsSNbznGfJ54+Uz3ud5=+Q@mail.gmail.com>
References: <CADwFkYe-T3MdkwmwwfW8nb6UsxUxbsSNbznGfJ54+Uz3ud5=+Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: libav
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
X-List-Received-Date: Wed, 03 Sep 2014 11:19:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 September 2014 07:05:18 Yi Qingliang wrote:
> why there are two versions libav in oe-core? what's the difference?
> why the opencv will use the 0.8.x version, but not 9.x version?
> does it should use the higher version?

Upstream libav changed its API in 9.x, and some software has not been updated 
to handle this change. When we get rid of everything that depends on libav 0.8 
we can drop it, but until then we are stuck with it. Note that if you need to 
select the version of libav to be built you would do that by setting e.g.  
PREFERRED_VERSION_libav = "9.%"
 
> libav 0.8.x has warning:
> 
> WARNING: QA Issue: ELF binary
> '/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0
> /packages-split/libswscale/usr/lib/libswscale.so.2.1.0' has relocations in
> .text [textrel]
> WARNING: QA Issue: ELF binary
> '/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0
> /packages-split/libpostproc/usr/lib/libpostproc.so.52.0.0' has relocations
> in .text [textrel]
> WARNING: QA Issue: ELF binary
> '/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0
> /packages-split/libavutil/usr/lib/libavutil.so.51.22.2' has relocations in
> .text [textrel]
> WARNING: QA Issue: ELF binary
> '/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0
> /packages-split/libavformat/usr/lib/libavformat.so.53.21.1' has relocations
> in .text [textrel]
> WARNING: QA Issue: ELF binary
> '/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0
> /packages-split/libavfilter/usr/lib/libavfilter.so.2.15.0' has relocations
> in .text [textrel]
> WARNING: QA Issue: ELF binary
> '/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0
> /packages-split/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations
> in .text [textrel]
> WARNING: QA Issue: ELF binary
> '/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0
> /packages-split/libavcodec/usr/lib/libavcodec.so.53.35.0' has relocations in
> .text [textrel]

Which architecture are you building for when you get these?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

