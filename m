Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F03B78308
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 13:04:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5DD42Z5013752
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 13 Jun 2017 14:04:03 +0100
Message-ID: <1497359042.3942.23.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:04:02 +0100
In-Reply-To: <20170612182311.GU28053@denix.org>
References: <1497035621-66174-1-git-send-email-denis@denix.org>
	<20170612182311.GU28053@denix.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 13 Jun 2017 14:04:03 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
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
X-List-Received-Date: Tue, 13 Jun 2017 13:04:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-06-12 at 14:23 -0400, Denys Dmytriyenko wrote:
> Ping. Any comments, issues?

https://autobuilder.yocto.io/builders/build-appliance/builds/306/steps/BuildImages_1/logs/stdio


ERROR: util-linux-2.30-r0 do_install_ptest_base: Function failed: do_install_ptest_base (log file is located at /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/core2-64-poky-linux/util-linux/2.30-r0/temp/log.do_install_ptest_base.48825)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/core2-64-poky-linux/util-linux/2.30-r0/temp/log.do_install_ptest_base.48825
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function do_install_ptest_base
| cp: cannot stat '/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/core2-64-poky-linux/util-linux/2.30-r0/util-linux-2.30/tests/ts/tailf': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install_ptest_base (log file is located at /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/core2-64-poky-linux/util-linux/2.30-r0/temp/log.do_install_ptest_base.48825)
NOTE: recipe util-linux-2.30-r0: task do_install_ptest_base: Failed

Cheers,

Richard

