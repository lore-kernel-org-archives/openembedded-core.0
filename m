Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EDAE060017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 18:51:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 05 Aug 2015 11:51:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,619,1432623600"; d="scan'208";a="762686039"
Received: from ranerica-desk01.sc.intel.com (HELO [10.3.52.73]) ([10.3.52.73])
	by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2015 11:51:43 -0700
Message-ID: <1438800686.10814.103.camel@ranerica-desk01>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 05 Aug 2015 11:51:26 -0700
In-Reply-To: <1436575263-22445-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
References: <1436575263-22445-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: Re: [PATCH] bootimg.bbclass:iso: determine the -iso-level only if there is a rootfs
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
X-List-Received-Date: Wed, 05 Aug 2015 18:51:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2015-07-10 at 17:41 -0700, Ricardo Neri wrote:
> It may be possible that some bootable images do not use a rootfs; this
> may be the case if the bootable image utilize only an initrd for all
> its
> needs.
> 
> If there is not rootfs, the size calculation will fail. Furthermore,
> given
> that the iso9660 conformance level is determined using the size of
> rootfs,
> it makes sense to not make the calculation if there is not such
> rootfs.

I wanted to know if there is any comments or feedback for this patch.

Thanks and BR,
Ricardo



