Return-Path: <rpurdie@rpsys.net>
X-Greylist: delayed 819 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 23 Aug 2014 17:42:00 UTC
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD8862252
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Aug 2014 17:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7NHSKpP022613; Sat, 23 Aug 2014 18:28:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WjczgnDUTE5y; Sat, 23 Aug 2014 18:28:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7NHSEhC022610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 23 Aug 2014 18:28:16 +0100
Message-ID: <1408814895.5457.36.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Sat, 23 Aug 2014 18:28:15 +0100
In-Reply-To: <cover.1408326458.git.Qi.Chen@windriver.com>
References: <cover.1408326458.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 00/10] upgrade systemd to 215 and other misc fixes
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
X-List-Received-Date: Sat, 23 Aug 2014 17:42:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-08-18 at 09:51 +0800, Chen Qi wrote:
> The following changes since commit 4321c553d5ae816e566234e981a0815bba046d39:
> 
>   SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 17:44:09 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-misc-fixes
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-misc-fixes
> 
> Chen Qi (10):
>   systemd: upgrade to 215
>   systemd: add PACKAGECONFIG for 'elfutils'
>   systemd: make runlevel work in non-runlevel targets
>   update-rc.d: fix logic in populate_packages_updatercd
>   alsa-state: fix pkg_postinst and set INHIBIT_UPDATERCD_BBCLASS
>   keymaps: fix for systemd
>   systemd: add kbd-keymaps to RRECOMMENDS of systemd-vconsole-setup
>   v86d: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in
>     DISTRO_FEATURES
>   systemd: add support for executing scripts under /etc/rcS.d
>   dhcp: add dhcpd.service

Testing with this patchset included resulted in:

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/6/steps/Running%20Sanity%20Tests_2/logs/stdio

Could you have a look into this and see if we can figure out why some of
these start failing please?

Cheers,

Richard




