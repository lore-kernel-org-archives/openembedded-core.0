Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4F4C1752AA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 11:41:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5GBfvc8019567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 16 Jun 2018 12:41:59 +0100
Message-ID: <8c2971b00d4256f1a87aaea117aa6c5d1284e4b2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ben Levinsky <ben.levinsky@xilinx.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2018 12:41:57 +0100
In-Reply-To: <1529081923-11864-1-git-send-email-ben.levinsky@xilinx.com>
References: <1529081923-11864-1-git-send-email-ben.levinsky@xilinx.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] runqemu: Allow the user to specity DTB
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
X-List-Received-Date: Sat, 16 Jun 2018 11:41:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-15 at 09:58 -0700, Ben Levinsky wrote:
> In some cirsumstances the user doesn't want to supply a kernel,
> rootFS
> to QEMU, but only a DTB.
> 
> Allow users to specify dtb for supply via the QB_DTB option
> to QEMU.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
>  scripts/runqemu | 3 +++
>  1 file changed, 3 insertions(+)
> 
This patch doesn't seem to apply against the master branch. I went
looking in history and see:

http://git.yoctoproject.org/cgit.cgi/poky/commit/scripts/runqemu?id=fae2e2f42de8212e90f75ac0035ffb65db10bb6c

which looks to do something similar. Perhaps you really need that patch
backporting to some other branch? Could you check out the situation
with master please.

Cheers,

Richard

