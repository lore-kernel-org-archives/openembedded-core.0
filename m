Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6921C719CA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Oct 2016 11:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u99Bg1pV030679; Sun, 9 Oct 2016 12:42:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3GnsvmKymVz5; Sun,  9 Oct 2016 12:42:23 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u99BgKVd030709
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 9 Oct 2016 12:42:21 +0100
Message-ID: <1476013339.30475.679.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stephano Cetola <stephano.cetola@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 09 Oct 2016 12:42:19 +0100
In-Reply-To: <20161007030947.12602-2-stephano.cetola@linux.intel.com>
References: <20161007030947.12602-1-stephano.cetola@linux.intel.com>
	<20161007030947.12602-2-stephano.cetola@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH V2] subprocess: remove strings and migrate to direct arrays
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
X-List-Received-Date: Sun, 09 Oct 2016 11:44:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-10-06 at 20:09 -0700, Stephano Cetola wrote:
> When using subprocess call and check_output, it is better to use
> arrays
> rather than strings when possible to avoid whitespace and quoting
> problems.
> 
> [ YOCTO #9342 ]
> 
> Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> ---
>  meta/lib/oe/distro_check.py    |   2 +-
>  meta/lib/oe/package.py         |  13 +--
>  meta/lib/oe/package_manager.py | 218 ++++++++++++++++++++-----------
> ----------
>  3 files changed, 114 insertions(+), 119 deletions(-)

This triggered a lot of errors on the autobuilder:

http://autobuilder.yocto.io:8010/builders/build-appliance/builds/70
http://autobuilder.yocto.io:8010/builders/nightly-x86/builds/75
http://autobuilder.yocto.io:8010/builders/nightly-x86-64/builds/73
http://autobuilder.yocto.io:8010/builders/nightly-x86-64-lsb/builds/72
http://autobuilder.yocto.io:8010/builders/nightly-x86-lsb/builds/73
http://autobuilder.yocto.io:8010/builders/nightly-wic/builds/73


