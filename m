Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B026B7790C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jun 2017 14:15:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v54EFS8l019643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 4 Jun 2017 15:15:29 +0100
Message-ID: <1496585728.6630.165.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 04 Jun 2017 15:15:28 +0100
In-Reply-To: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 04 Jun 2017 15:15:29 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Sun, 04 Jun 2017 14:15:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-06-01 at 18:15 +0300, Alexander Kanavin wrote:
> These two patches add multi-threaded features to RPM to speed up the
> do_package_write_rpm task.
> 
> Specifically:
> 
> 1) Multi-threaded xz compressor is used instead of default single-
> threaded gz. This has the most
> dramatic effect when a recipe produces a smaller number of large-
> sized packages.
> 
> 2) Packages creation is run in multiple threads via thread pools.
> This is most beneficial when
> a recipe produces a large amount of small packages.
> 
> The following changes since commit
> bd063fa288b49b6e3ea77982d0ccc46610feb1ad:
> 
>   tune-mips32*.inc: use consistent comments across all three .inc
> files (2017-05-30 10:15:20 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib akanavin/parallel-rpm
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/p
> arallel-rpm

https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/1
163/steps/BuildImages/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/build
s/1203/steps/BuildImages/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/1
112/steps/BuildImages/logs/stdio

I suspect the same issue causing failures in multiple places.

Cheers,

Richard


