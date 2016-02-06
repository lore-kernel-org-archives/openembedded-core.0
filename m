Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id E6DD0731C3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 20:41:12 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id F8hA1s0040BmcFC018hBra; Sat, 06 Feb 2016 20:41:12 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=Rr04V3SK c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=jFJIQSaiL_oA:10 a=89xGLPYzVUEAh91_EyYA:9 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1aS9fK-0006Ng-Db; Sat, 06 Feb 2016 20:41:10 +0000
Date: Sat, 6 Feb 2016 20:41:10 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160206204110.GA21969@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202161726.GC2607@jama>
	<CA+chaQdGzUm96SViWvLW8xinxSLrjZbZxi843A282geN+T5Ffw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQdGzUm96SViWvLW8xinxSLrjZbZxi843A282geN+T5Ffw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Sat, 06 Feb 2016 20:41:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Saturday 06 February 2016 at 18:32:18 +0100, Martin Jansa wrote:
> Last world build with this change included (not the other fixes for
> oe-core sent later) shows:

Thanks for testing. I've been testing some of meta-oe myself today too.

> Summary: 30 tasks failed:
[result reordered to simplify the comments]

> virtual:native:/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/pigz/pigz_2.3.3.bb,
> /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb,
> /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/dmidecode/dmidecode_3.0.bb,
> /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/stat/stat_3.3.bb,
> /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/ed/ed_1.9.bb,
> /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb,
> /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/pigz/pigz_2.3.3.bb,
> /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb,
> /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb,

Patches sent on Friday 5th for all of the above.

> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb,

I've not seen a failure on that one in my testing. It built for qemuarm64 successfully

> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/mg/mg_20110905.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/ckermit/ckermit_302.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb,

I found these and have patches ready to submit. Presumably I should send
them to openembedded-devel?

I also found the following failures which appear to be fixed by using the
old value of EXTRA_OEMAKE but they may just be non-deterministic recipes:

 wmiconfig
 system-setup-keyboard

I also ran into a number of other build failures that weren't fixed by
changing EXTRA_OEMAKE, but I suspect that at least some of them were
because I was foolish enough to test with qemuarm64. :)
 
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb,
> /home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-support/invensense/invensense_git.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/soci/soci_3.2.2.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb,
> virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-support/pimd/pimd_2.1.8.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-irc/znc/znc_git.bb,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb,

I haven't reproduced these because I didn't have those layers enabled. I've
now enabled them all and I'll set another build going.

Thanks!

Mike.

