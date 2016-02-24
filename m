Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 49EB677296
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 13:30:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 24 Feb 2016 05:31:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,493,1449561600"; d="scan'208";a="53918531"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2016 05:31:01 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
	<665b18beb51e5fbcfb033bdda22d7ba85b50f903.1455107972.git.alexander.kanavin@linux.intel.com>
	<CA+chaQe460XR_hNRMS3MyUh5KGMWjykiQKnVOh58FAg2zk0WVQ@mail.gmail.com>
	<56CDA358.8070108@linux.intel.com> <20160224131654.GF7560@jama>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56CDAFF0.7090109@linux.intel.com>
Date: Wed, 24 Feb 2016 15:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160224131654.GF7560@jama>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] ffmpeg: update to 2.8.6
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
X-List-Received-Date: Wed, 24 Feb 2016 13:31:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2016 03:16 PM, Martin Jansa wrote:

> The distro needs to set ARM_INSTRUCTION_SET to "thumb" in order to enable
> actually using this TUNE_FEATURE.
>
> With recent improvements in tune files you should clearly see that
> default qemuarm builds are using TUNE_PKGARCH without "t" in it which
> means that "thumb" isn't enabled.

Should we actually test this on autobuilders then? The change passed 
them fine, even though it shouldn't have.

Alex


