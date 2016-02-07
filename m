Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 3130E60291
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Feb 2016 22:07:42 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id Fa7h1s0020BmcFC01a7i1B; Sun, 07 Feb 2016 22:07:42 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=Rr04V3SK c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=jFJIQSaiL_oA:10 a=Z9Q0CMfSg_PPwYXyIUwA:9 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1aSXUb-0007pJ-8y; Sun, 07 Feb 2016 22:07:41 +0000
Date: Sun, 7 Feb 2016 22:07:41 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160207220741.GA12339@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202161726.GC2607@jama>
	<CA+chaQdGzUm96SViWvLW8xinxSLrjZbZxi843A282geN+T5Ffw@mail.gmail.com>
	<20160206204110.GA21969@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20160206204110.GA21969@mcrowe.com>
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
X-List-Received-Date: Sun, 07 Feb 2016 22:07:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Further to my previous response, I've tried another build with qemuarm this
time and more layers enabled.

> On Saturday 06 February 2016 at 18:32:18 +0100, Martin Jansa wrote:
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb,
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb,
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb,
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-support/pimd/pimd_2.1.8.bb,

These recipes all appear to require EXTRA_OEMAKE = "-e MAKEFLAGS=". I have
patches ready to post.

I also saw similar failures with vsftpd and vpnc which you didn't see for
some reason. I have patches ready for those too.

> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.bb,
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/soci/soci_3.2.2.bb,
> > virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb,
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb,
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-irc/znc/znc_git.bb,

These recipes all compiled successfully for me with EXTRA_OEMAKE = "".
Perhaps they are non-deterministic or they failed for you for other reasons?

> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb,

This recipe doesn't appear to call oe_runmake. It failed to compile for me
even after explicitly setting EXTRA_OEMAKE back to "-e MAKEFLAGS=".

> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb,

This recipe fails to compile for me too but it doesn't seem to be related
to EXTRA_OEMAKE. I think it can't find the kernel headers it needs which
may be due to an error in my configuration.

> > /home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-support/invensense/invensense_git.bb,

I haven't yet tried meta-android.

Thanks.

Mike.

