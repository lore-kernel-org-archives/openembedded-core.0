Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0649773D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 22:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8IMVf5m019063; Fri, 18 Sep 2015 23:31:41 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AMIRtQC8TTNs; Fri, 18 Sep 2015 23:31:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8IMVPtZ019057
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 18 Sep 2015 23:31:37 +0100
Message-ID: <1442615485.12435.64.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Joya <alejandro.joya.cruz@intel.com>
Date: Fri, 18 Sep 2015 23:31:25 +0100
In-Reply-To: <cover.1442610201.git.alejandro.joya.cruz@intel.com>
References: <cover.1442610201.git.alejandro.joya.cruz@intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/3] Dynamic common utilities
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
X-List-Received-Date: Fri, 18 Sep 2015 22:31:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-09-18 at 16:09 -0500, Alejandro Joya wrote:
> It provide a virtual reference for the common utilities.
> it replace of the lock to busybox, it will be simple exchange between other
> common utilities like gnu core utils or toybox among others.
> 
> In order to enable its required to fill at the distro conf or local.conf
>
> VIRTUAL-RUNTIME_login_manager ?= "busybox"
> PREFERRED_PROVIDER_virtual/base-utils?= "busybox"
> PREFERRED_RPROVIDER_virtual/base-utils?= "busybox"
> VIRTUAL-RUNTIME_base-utils?= "busybox"
> VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"

As I understand it, you don't actually define defaults anywhere. This
means OE would break "out the box" which isn't acceptable and that alone
means I can't merge this.

Secondly, the virtual/xxx namespace is *only* for DEPENDS/PROVIDES, not
RDEPENDS or PACKAGE_INSTALL. For runtime packages, you need to use
${VIRTUAL-RUNTIME_base-utils}.

Cheers,

Richard


