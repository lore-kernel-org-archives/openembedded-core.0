Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F399078448
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 21:43:28 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6LLhLrU004451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 21 Jul 2017 22:43:24 +0100
Message-ID: <1500673401.22282.109.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wei.tee.ng@intel.com, openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 22:43:21 +0100
In-Reply-To: <cover.1500229225.git.wei.tee.ng@intel.com>
References: <cover.1500229225.git.wei.tee.ng@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 21 Jul 2017 22:43:24 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: saul.wold@intel.com
Subject: Re: [poky][master][PATCH v2 0/1] initramfs-framework: include install-efi module in recipe for installation
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
X-List-Received-Date: Fri, 21 Jul 2017 21:43:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Sun, 2017-07-16 at 12:29 -0700, wei.tee.ng@intel.com wrote:
> From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
> 
> This patch is to enable the installation mechanism in initramfs-
> framework.
> It used the existing init-install-efi.sh script in the initrdscript
> and 
> install a new module named initramfs-module-install-efi in the
> recipe.
> 
> I put all the changes as a single commit. This version 2 had renamed
> the
> existing init-install-efi.sh to install-efi.sh and package name
> changed
> to install-efi.
> 
> This patch shall encounter a patchtest failure as it is depends on a
> patch which have been sent to the mailing list and waiting for
> acceptance. The dependency patch can be found in here:
> http://lists.openembedded.org/pipermail/openembedded-core/2017-July/1
> 39570.html
> 
> This changes has been verified with build test, boot up test and
> installation test on Minnowboard Max platform.
> 
> Please review and provide feedback if you have any.
> The patches are targeted for merging into poky master branch.

I think the RDEPENDS in this patch cause problems when added to an
allarch recipe. You can see this issue by running:

oe-selftest -r sstatetests.SStateTests.test_sstate_allarch_samesigs

(it failed on the autobuilder:
https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/399/st
eps/Running%20oe-selftest/logs/stdio)

We need to resolve this before the two initramfs-framework patches can
be merged.

Cheers,

Richard



