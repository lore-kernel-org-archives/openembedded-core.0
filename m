Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A7D0071C42
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 07:51:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 May 2017 00:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,328,1491289200"; d="scan'208";a="1146957623"
Received: from bdinkley-mobl.amr.corp.intel.com (HELO [10.252.8.149])
	([10.252.8.149])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2017 00:51:21 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1494505033.git.ed.bartosh@linux.intel.com>
	<20d8bc6e700a6acdb839015c5f2ce1a295a19e2a.1494505033.git.ed.bartosh@linux.intel.com>
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Message-ID: <81e6f11f-12d7-926b-235f-bb98c9be304e@linux.intel.com>
Date: Fri, 12 May 2017 10:51:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20d8bc6e700a6acdb839015c5f2ce1a295a19e2a.1494505033.git.ed.bartosh@linux.intel.com>
Subject: Re: [PATCH v2 2/5] image_types_wic: add do_populate_bootfs task
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
X-List-Received-Date: Fri, 12 May 2017 07:51:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ed,


On 11/05/17 15:21, Ed Bartosh wrote:
> +        d.setVar("APPEND", "root=PARTUUID=%s" % partuuid)
> +        bb.build.exec_func('build_efi_cfg', d)

The rootfs wic allows you to build multiple rootfs'es in the image. With
that, it'd be good to be able to set PARTUUIDs for each of the rootfs
partitions and so that the bootloader LABELs give the options to boot
from those.

> +}
> +
> +addtask do_populate_bootfs after do_image before do_image_wic

What if user needed the artifacts on rootfs too. For example IMAGE_ROOTFS
could be used as is to prepare sw updates (meta-swupd or ostree).

-- Mikko

