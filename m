Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DD29D6AC38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 08:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3U83B08010855; Thu, 30 Apr 2015 09:03:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JUKPXxwarJ8I; Thu, 30 Apr 2015 09:03:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3U82s1P010852
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Apr 2015 09:03:06 +0100
Message-ID: <1430380974.19130.51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rongqing.li@windriver.com
Date: Thu, 30 Apr 2015 09:02:54 +0100
In-Reply-To: <1430297966-25315-1-git-send-email-rongqing.li@windriver.com>
References: <1430297966-25315-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: upgrade to 9.10.2
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
X-List-Received-Date: Thu, 30 Apr 2015 08:03:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-04-29 at 16:59 +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> 1. Remove seven unneeded CVE patches, and five patches in them were
> not already used
> 2. 9.10.2 fixed the CVE-2015-1349
> 3. Remove bind-subdirs-run-serially.patch and cross-build-fix.patch,
> similar fixes are merged into 9.10.2
> 4. update the dont-test-on-host.patch
> 5. update the Copyright file checksum, since the date in it has been changed.
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com>

If you apply this patch, then run "bitbake dhcp" it fails. This is what
it did last time it was submitted too.

Cheers,

Richard


