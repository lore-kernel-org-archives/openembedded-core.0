Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3563670101
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 07:27:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 22 Jan 2017 23:27:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,273,1477983600"; d="scan'208";a="812134262"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2017 23:27:11 -0800
Message-ID: <1485156431.41148.10.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Sun, 22 Jan 2017 23:27:11 -0800
In-Reply-To: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 00/12] UEFI + Secure Boot + qemu
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
X-List-Received-Date: Mon, 23 Jan 2017 07:27:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-01-20 at 15:12 +0100, Patrick Ohly wrote:
> There seems to be a consensus that supporting UEFI in OE-core for qemu
> would be valuable, and there have been some (stalled) attempts to add
> it. For reference, see:
>    [OE-core] [PATCH V3 0/3] Add UEFI firmware for qemux86*
>    [OE-core] Add ovmf-native to make qemu-native/runqemu support boot
> UEFI image?
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=5654
>    https://github.com/01org/luv-yocto/issues/38
> 
> This patch set includes the necessary recipes (ovmf from meta-luv,
> acpica from
> meta-oe), some improvements to them (in particular, enabling Secure
> Boot), and changes to runqemu to make it easier to boot with UEFI. A
> special image recipes builds an image which can be used to lock down a
> virtual machine by enrolling the "normal" pre-installed certificates.
> 
> In contrast to the first version of this patch series, one can now use
> both a single OVMF firmware file as well as set up persistent
> variables for a virtual machine by using two files.
> 
> Eduardo promised to add automated testing for this once it is in
> OE-core.
> As it stands now, ovmf-shell-image and ovmf without Secure Boot
> enabled
> should at least be part of a world build.
> 
> As discussed on this list, Ricardo and Fathi volunteered to help with
> maintaining the ovmf and acpica recipes in OE-core.
> 
> Beware that "git am --keep-cr" must be used to import the ovmf patches
> correctly.

This patchset looks good to me. I only had one comment/question in patch
5.

If relevant,

Acked-by Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

Thanks and BR,
Ricardo


