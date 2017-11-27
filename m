Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1100F78308
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 15:35:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 07:35:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,465,1505804400"; 
   d="scan'208";a="6796917"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga003.jf.intel.com with ESMTP; 27 Nov 2017 07:35:17 -0800
Date: Mon, 27 Nov 2017 09:44:46 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <20171127094446.5e33c347@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <5352b394-5e08-2bec-2248-3b4ba7ea85b9@linaro.org>
References: <1511552846-1887-1-git-send-email-andrey.konovalov@linaro.org>
	<3c7c379d-44d8-162a-d941-a7d13ba48460@linaro.org>
	<20171124143425.2751a5e3@lsandov1-mobl2.zpn.intel.com>
	<5352b394-5e08-2bec-2248-3b4ba7ea85b9@linaro.org>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [rocko][PATCH] weston: add patch to set pitch correctly for subsampled textures
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
X-List-Received-Date: Mon, 27 Nov 2017 15:35:17 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 25 Nov 2017 22:59:36 +0300
Andrey Konovalov <andrey.konovalov@linaro.org> wrote:

> On 24.11.2017 23:34, Leonardo Sandoval wrote:
> > On Fri, 24 Nov 2017 22:58:20 +0300
> > Andrey Konovalov <andrey.konovalov@linaro.org> wrote:
> >   
> >> This exact patch also applies to pyro.
> >> Should I send the separate "[OE-core][pyro][PATCH] weston: add patch to set pitch correctly for subsampled textures" email,
> >> or just asking to merge it into pyro as well is enough?  
> > 
> > better if you send another patch with that subject so the non-master maintainer can pick it up.  
> 
> OK, have just sent the pyro version of this patch.
> 
> Looks like it confuses the patchwork system a bit:

Right. Past weeks there were some issues for those series that were intended for non-master branches. This is a new enhancement and now is working as expected.


> > This is a system generated Comment: Patch 146165 was automatically marked as superseded by patch 146166.  
> To be clear: the same patch should be applied to both pyro and rocko. Patch 146165 was posted for rocko (with [rocko] in the subject line),
> and patch 146166 is for pyro (has [pyro] in the subject line).

Perfect, thanks for this extra work.

> 
> Thanks,
> Andrey
> 

