Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DA00E72D78
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2015 18:52:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 14 Mar 2015 11:46:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,401,1422950400"; d="scan'208";a="665301062"
Received: from feifeich-mobl.amr.corp.intel.com (HELO [10.252.141.167])
	([10.252.141.167])
	by orsmga001.jf.intel.com with ESMTP; 14 Mar 2015 11:52:32 -0700
Message-ID: <55048379.4070800@linux.intel.com>
Date: Sat, 14 Mar 2015 12:52:41 -0600
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1426328088.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1426328088.git.anibal.limon@linux.intel.com>
Subject: Re: [PATCH 0/5] license: Add support for handle INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Sat, 14 Mar 2015 18:52:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry i forget to put test result url.

Cheers,
     alimon

On 14/03/15 04:45, Aníbal Limón wrote:
> The next changes was made to implement INCOMPATIBLE_LICENSE handling in manifest
> creation this implies to rewrite license_manifest_creation from shell to python.
>
> Tests was made to guarantee compatibility and can be found at,
https://bugzilla.yoctoproject.org/attachment.cgi?id=2443
> The last two patches are to avoid warnings in manifest creation due that these
> recipes don't collect licenses before.
>
> The following changes since commit 7f30749fe026e9ceb75d73b89271145a45a60763:
>
>    oeqa/parselogs: Skip hda opcode errors (2015-03-12 12:50:24 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib alimon/license-rebase
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/license-rebase
>
> Aníbal Limón (5):
>    license_class: Reimplemented manifest creation in python
>    license_class: Generalize license_ok function
>    license: Add support for handle INCOMPATIBLE_LICENSE in manifest
>      creation
>    packagegroups: Add LIC_FILES_CHKSUM to avoid warnings in manifest
>      creation
>    glibc/glibc-collateral.inc: Add LIC_FILES_CHKSUM to avoid warnings in
>      manifest creation
>
>   meta/classes/license.bbclass                       | 190 +++++++++++----------
>   meta/lib/oe/license.py                             |  84 +++++++++
>   meta/recipes-core/glibc/glibc-collateral.inc       |   2 +
>   .../packagegroups/packagegroup-base.bb             |   1 +
>   .../packagegroups/packagegroup-core-boot.bb        |   1 +
>   .../packagegroup-core-buildessential.bb            |   1 +
>   .../packagegroup-core-eclipse-debug.bb             |   1 +
>   .../packagegroups/packagegroup-core-nfs.bb         |   1 +
>   .../packagegroups/packagegroup-core-sdk.bb         |   1 +
>   .../packagegroup-core-ssh-dropbear.bb              |   1 +
>   .../packagegroups/packagegroup-core-ssh-openssh.bb |   1 +
>   .../packagegroup-core-standalone-sdk-target.bb     |   1 +
>   .../packagegroups/packagegroup-core-tools-debug.bb |   1 +
>   .../packagegroup-core-tools-profile.bb             |   1 +
>   .../packagegroups/packagegroup-cross-canadian.bb   |   1 +
>   .../packagegroups/packagegroup-self-hosted.bb      |   1 +
>   .../packagegroup-core-device-devel.bb              |   1 +
>   .../packagegroup-core-full-cmdline.bb              |   1 +
>   .../packagegroups/packagegroup-core-lsb.bb         |   1 +
>   .../packagegroups/packagegroup-core-clutter.bb     |   1 +
>   .../packagegroups/packagegroup-core-directfb.bb    |   1 +
>   .../packagegroups/packagegroup-core-x11-base.bb    |   1 +
>   .../packagegroups/packagegroup-core-x11-xserver.bb |   1 +
>   .../packagegroups/packagegroup-core-x11.bb         |   1 +
>   .../packagegroups/packagegroup-core-qt.bb          |   1 +
>   .../packagegroups/packagegroup-core-qt4e.bb        |   1 +
>   .../packagegroup-qt-toolchain-target.inc           |   1 +
>   .../packagegroups/packagegroup-core-x11-sato.bb    |   1 +
>   28 files changed, 212 insertions(+), 89 deletions(-)
>


