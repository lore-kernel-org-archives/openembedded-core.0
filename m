Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B4DBD71979
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 23:33:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 28 Dec 2016 15:33:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,423,1477983600"; d="scan'208";a="207662095"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by fmsmga004.fm.intel.com with ESMTP; 28 Dec 2016 15:33:37 -0800
Message-ID: <1482968017.106950.76.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Wed, 28 Dec 2016 15:33:37 -0800
In-Reply-To: <66377b2510edebf997b04812ff93c9ef0bb3c47f.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<66377b2510edebf997b04812ff93c9ef0bb3c47f.1482324587.git.patrick.ohly@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/9] runqemu: support UEFI with OVMF firmware
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
X-List-Received-Date: Wed, 28 Dec 2016 23:33:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-21 at 14:11 +0100, Patrick Ohly wrote:
> +        # File name of a OVMF BIOS file, to be added with -drive
> if=pflash.
> +        # Found in the same places as the rootfs, with or without one
> of
> +        # these suffices: qcow2, bin.
> +        # Setting one also adds "-vga std" because that is all that
> +        # OVMF supports.
> +        self.ovmf_bios = ''

runqemu has the options biosdir and biosfilename. Although the log for
these options was lost when the script was migrated to python, the
motivation of adding these options was to use OVMF. It uses the -L and
-bios options of qemu. To my knowledge, the only custom bios at the
moment is OVMF. Thus, you would ponder either removing or tweaking these
options with your approach; which makes more sense to me.

Thanks and BR,
Ricardo


