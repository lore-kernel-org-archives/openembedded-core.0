Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 87588758E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 01:45:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5A1jXFV021701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jun 2015 18:45:33 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 18:45:33 -0700
Message-ID: <557796BB.8090502@windriver.com>
Date: Wed, 10 Jun 2015 09:45:31 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
	<4a0a666e39c7a9a7a608a07bed7aa1d082018514.1433842738.git.liezhi.yang@windriver.com>
	<CAJTo0LYX4=vyLko7jJgdsTonCV6b6Obaq-HVCuKDcjkrj2JNeA@mail.gmail.com>
In-Reply-To: <CAJTo0LYX4=vyLko7jJgdsTonCV6b6Obaq-HVCuKDcjkrj2JNeA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/12] blktrace: 1.0.5 -> 1.1.0
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
X-List-Received-Date: Wed, 10 Jun 2015 01:45:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Sorry, I updated it in the repo (and tested it works):

   git://git.openembedded.org/openembedded-core-contrib rbt/PU

diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb 
b/meta/recipes-kernel/blktrace/blktrace_git.bb
index ef9f737..5b0be42 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -4,10 +4,9 @@ LIC_FILES_CHKSUM = 
"file://COPYING;md5=393a5ca445f6965873eca0259a17f833"

  DEPENDS = "libaio"

-SRCREV = "d6918c8832793b4205ed3bfede78c2f915c23385"
+SRCREV = "43fc870ce04e963def45dfc0d1ed4ea21ef10d4b"

-PR = "r6"
-PV = "1.0.5+git${SRCPV}"
+PV = "1.1.0+git${SRCPV}"

  SRC_URI = "git://git.kernel.dk/blktrace.git \
             file://ldflags.patch"

// Robert

On 06/10/2015 12:50 AM, Burton, Ross wrote:
>
> On 9 June 2015 at 15:51, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>       SRCREV = "d6918c8832793b4205ed3bfede78c2f915c23385"
>
>     -PR = "r6"
>     -PV = "1.0.5+git${SRCPV}"
>     +PV = "1.1.0+git${SRCPV}"
>
>
> You forgot to change SRCREV :)
>
> Ross

