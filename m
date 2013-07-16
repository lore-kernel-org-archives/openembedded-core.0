Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0469B6B082
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 09:06:44 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6G9Ei92032334; Tue, 16 Jul 2013 10:15:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NHCGb2VWT-C5; Tue, 16 Jul 2013 10:15:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6G9F3Ng032446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 16 Jul 2013 10:15:05 +0100
Message-ID: <1373965583.29233.68.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 16 Jul 2013 10:06:23 +0100
In-Reply-To: <cover.1373900913.git.sgw@linux.intel.com>
References: <cover.1373900913.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/15] Ready to Pull
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
X-List-Received-Date: Tue, 16 Jul 2013 09:06:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-07-15 at 08:12 -0700, Saul Wold wrote:
> Richard,
> 
> Here is a set of changes, mostly OE-QA change with a a few
> package updates and a LSB fix.
> 
> Thanks
> 	Sau!
> 
> The following changes since commit 43c28375f97161e618fa54349c65be2058c33c53:
> 
>   distrodata.bbaclass: change in git and svn package reporting (2013-07-12 10:12:13 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Alexandru Palalau (1):
>   lib/oeqa/runtime: add tests for syslog and df
> 
> Chen Qi (1):
>   core-image-lsb.bb: add 'package-management' to IMAGE_FEATURES
> 
> Saul Wold (3):
>   libidn: upgrade to 1.28
>   mc: upgrade to 4.8.9
>   initscripts: Update to 9.48
> 
> Stefan Stanacar (10):
>   lib/oeqa/runtime/dmesg.py: whitelist dmesg message for systemd net
>     interface name
>   lib/oeqa/utils/sshcontrol.py: fix passing command to subprocess
>   testimage.bbclass, lib/oeqa/utils/qemurunner.py: make boot timeout
>     configurable and increase it
>   lib/oeqa/runtime/multilib.py: use readelf instead of file
>   lib/oeqa/oetest.py: provide a ps command for all tests
>   classes/testimage.bbclass: use a copy of rootfs for tests
>   testimage.bbclass, lib/oeqa: add headers and comments
>   lib/oeqa: fix dependecy check
>   lib/oeqa/runtime/df.py: limit output to /
>   lib/oeqa/runtime/syslog.py: fix restart in case of systemd

I pulled this but the numbers don't add up, there are only 13 commits in
the branch, not 15.

Cheers,

Richard


