Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1295065CBA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 11:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VB0COn018370; Wed, 31 Aug 2016 12:00:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rH_O9tQ8YJX7; Wed, 31 Aug 2016 12:00:20 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VB0Hlt018376
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 31 Aug 2016 12:00:18 +0100
Message-ID: <1472641217.29583.81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 31 Aug 2016 12:00:17 +0100
In-Reply-To: <cover.1472574514.git.bruce.ashfield@windriver.com>
References: <cover.1472574514.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] linux-yocto: v4.8 + fixes + configuration updates + RFC
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
X-List-Received-Date: Wed, 31 Aug 2016 11:00:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Just to update I have:

* Put a runqemu patch in master-next that works with new and old 
  kernels to handle the dtb issue
* Updated the musl patches in libc-headers
* Updated lttng-* to avoid build failures with 4.8
* Switched the default qemu kernel 4.4 -> 4.8 in poky so we get 
  testing of 4.8

I'm waiting on the next build so see what issues remain from here.

Cheers,

Richard

