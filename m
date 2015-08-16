Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3E671606E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 13:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7GDAmTu021095; Sun, 16 Aug 2015 14:10:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HYtiMY5nvXEh; Sun, 16 Aug 2015 14:10:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7GDAWnU021086
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 16 Aug 2015 14:10:43 +0100
Message-ID: <1439730631.1218.25.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Sun, 16 Aug 2015 14:10:31 +0100
In-Reply-To: <993511190b981cc8f6dfbffca61b5d8c56a891a4.1439548737.git.alexander.kanavin@linux.intel.com>
References: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
	<993511190b981cc8f6dfbffca61b5d8c56a891a4.1439548737.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] rpm: update to 5.4.15
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
X-List-Received-Date: Sun, 16 Aug 2015 13:10:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-14 at 13:43 +0300, Alexander Kanavin wrote:
> This update also requires that db is updated to 6.1 version.
> 
> Patch updates:
> 
> - verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch has been merged to upstream
> 
> - rpm-macros.in-disable-external-key-server.patch, rpm-lua-fix-print.patch and
> rpm-db5-or-db6.patch have been ported to the new upstream release. A better explanation
> for when db5 is preferred has been provided.
> 
> - rpm-payload-use-hashed-inode.patch - a portion of this patch is now in upstream, so
> that portion has been removed from the patch
> 
> - rpm-db5-or-db6.patch has been dropped from the latest-cvs recipe. That recipe
> is intended for tracking upstream developments, and for that use case it shouldn't
> matter that db6 is under AGPLv3.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Not sure what this was tested with but a simple "bitbake
core-image-minimal" breaks after this (and the db) change with licensing
failures.

The autobuilder exploded with failures like:

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/430/steps/BuildImages_1/logs/stdio

which are due to the installed manifest file listing installed packages
being empty.

Cheers,

Richard




