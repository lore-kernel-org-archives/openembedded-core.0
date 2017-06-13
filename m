Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id B57F278305
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 16:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DDC3A20B7D;
	Tue, 13 Jun 2017 16:52:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UUvWdZCrpyCP; Tue, 13 Jun 2017 16:52:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C392E207AF;
	Tue, 13 Jun 2017 16:52:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8903A1624FD; Tue, 13 Jun 2017 12:52:39 -0400 (EDT)
Date: Tue, 13 Jun 2017 12:52:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170613165239.GD28053@denix.org>
References: <1497035621-66174-1-git-send-email-denis@denix.org>
	<20170612182311.GU28053@denix.org>
	<1497359042.3942.23.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1497359042.3942.23.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: upgrade to 2.30
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
X-List-Received-Date: Tue, 13 Jun 2017 16:52:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2017 at 02:04:02PM +0100, Richard Purdie wrote:
> On Mon, 2017-06-12 at 14:23 -0400, Denys Dmytriyenko wrote:
> > Ping. Any comments, issues?
> 
> https://autobuilder.yocto.io/builders/build-appliance/builds/306/steps/BuildImages_1/logs/stdio
> 
> 
> ERROR: util-linux-2.30-r0 do_install_ptest_base: Function failed: do_install_ptest_base (log file is located at /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/core2-64-poky-linux/util-linux/2.30-r0/temp/log.do_install_ptest_base.48825)
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/core2-64-poky-linux/util-linux/2.30-r0/temp/log.do_install_ptest_base.48825
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
> | DEBUG: Executing shell function do_install_ptest_base
> | cp: cannot stat '/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/core2-64-poky-linux/util-linux/2.30-r0/util-linux-2.30/tests/ts/tailf': No such file or directory
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_install_ptest_base (log file is located at /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/core2-64-poky-linux/util-linux/2.30-r0/temp/log.do_install_ptest_base.48825)
> NOTE: recipe util-linux-2.30-r0: task do_install_ptest_base: Failed

Thanks. v2 sent.

-- 
Denys

