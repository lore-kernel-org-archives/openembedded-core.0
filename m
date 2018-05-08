Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9826FFC8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 04:41:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 May 2018 21:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,377,1520924400"; d="scan'208";a="52383229"
Received: from weizhan5-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.129.147])
	by fmsmga004.fm.intel.com with ESMTP; 07 May 2018 21:41:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Cal Sullivan <california.l.sullivan@intel.com>,
	Patrick Ohly <patrick.ohly@intel.com>, Ross Burton <ross.burton@intel.com>
Date: Tue, 08 May 2018 15:39:18 +1200
Message-ID: <7787493.mkkD0rIuAZ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: read-only-rootfs and EFI configuration
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
X-List-Received-Date: Tue, 08 May 2018 04:41:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi folks,

So I was looking at the following commit today:

  http://cgit.openembedded.org/openembedded-core/commit/?id=cfc09de06ecc12bb42181004689e881c75072665

Given we've just moved the creation of the configuration to its own recipe 
(grub-bootconf or systemd-bootconf depending on the bootloader selected)
doesn't that now pose a problem for the effectiveness of this change given
that it's setting it at the image level? Let me know if I'm missing something.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



