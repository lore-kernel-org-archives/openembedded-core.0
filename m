Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D2237834A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 07:47:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6U7lpRp005266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 30 Jul 2017 08:47:52 +0100
Message-ID: <1501400871.22282.210.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wei.tee.ng@intel.com, openembedded-core@lists.openembedded.org
Date: Sun, 30 Jul 2017 08:47:51 +0100
In-Reply-To: <7845bc41803435479389182bed1dfb5d410df24a.1500848692.git.wei.tee.ng@intel.com>
References: <cover.1500848692.git.wei.tee.ng@intel.com>
	<7845bc41803435479389182bed1dfb5d410df24a.1500848692.git.wei.tee.ng@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 30 Jul 2017 08:47:52 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: saul.wold@intel.com
Subject: Re: [PATCH 3/3] core-image-minimal-initramfs: use initramfs-framework by default
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
X-List-Received-Date: Sun, 30 Jul 2017 07:47:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2017-07-23 at 16:51 -0700, wei.tee.ng@intel.com wrote:
> From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
> 
> Use the initramfs-framework for initialization by default due to
> the modularity and expansibility.
> 
> [YOCTO #10987]
> 
> Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
> ---
>  meta/recipes-core/images/core-image-minimal-initramfs.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I'm afraid I had to revert this change:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=fab2219af4a6566124
cf95d1d2648d4729391baf

because it was causing oe-selftest failures as shown here:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/415/st
eps/Running%20oe-selftest/logs/stdio

Cheers,

Richard

