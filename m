Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5112C6FFD3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 03:12:05 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP; 27 Dec 2016 19:12:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,420,1477983600"; d="scan'208";a="43903570"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by orsmga004.jf.intel.com with ESMTP; 27 Dec 2016 19:12:07 -0800
Message-ID: <1482894727.106950.48.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Tue, 27 Dec 2016 19:12:07 -0800
In-Reply-To: <ce57b729e9ac830d808040b7e3ff1fc128475420.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<ce57b729e9ac830d808040b7e3ff1fc128475420.1482324587.git.patrick.ohly@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/9] ovmf: deploy firmware in image directory
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
X-List-Received-Date: Wed, 28 Dec 2016 03:12:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-21 at 14:11 +0100, Patrick Ohly wrote:
> When used with '-drive if=pflash', qemu will store UEFI variables
> inside the firmware image file. That is unexpected for a file located
> in
> the sysroot, which should be read-only, while it is normal for image
> files in the deploy/images directory. Therefore that directory is a
> better place for use with runqemu.
> 
> The name was chose so that "runqemu ovmf" can be used as shorthand for
> "runqemu <full path>/ovmf.qcow2" by treating "ovmf" as the base name
> of the BIOS file. "ovmf_secboot.qcow2" is meant to be used for the
> Secure Boot enabled BIOS. qcow2 is used because it is needed for
> "savevm" snapshots of a virtual machine.
> 
> Alternatively, OVMF_CODE.fd (read-only) and OVMF_VARS.fd (read/write)
> could be used. That would then allow updating the firmware of an
> existing machine without wiping out the variables set
> earlier. Configuring that in qemu would be more complicated, so for
> now the simpler approach with combined code and variable store is
> used.

This looks good to me!


