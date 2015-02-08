Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EDFA665C98
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 07:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t187qhTA005446; Sun, 8 Feb 2015 07:52:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MalVNUg_20WI; Sun,  8 Feb 2015 07:52:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t187qT2N005435
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 8 Feb 2015 07:52:41 GMT
Message-ID: <1423381949.20217.22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai Kang <kai.kang@windriver.com>
Date: Sun, 08 Feb 2015 07:52:29 +0000
In-Reply-To: <1423032042-8373-1-git-send-email-kai.kang@windriver.com>
References: <1423032042-8373-1-git-send-email-kai.kang@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: upgrade to version 9.10.1
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
X-List-Received-Date: Sun, 08 Feb 2015 07:52:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-02-04 at 14:40 +0800, Kai Kang wrote:
> Upgrade bind to version 9.10.1.
> 
> * remove bind9_9_5-CVE-2014-8500.patch which is merged and documented in file CHANGES
> * remove cross-build-fix.patch which is fixed by upstream
> * update dont-test-on-host.patch
> * add backported bind-fix-autoheader-2.69.patch to fix configure error
> * remove unrecognised configure options --with-export-includedir
>   --enable-exportlib and --with-export-libdir
> * add runtime dependency procps which is required by init script
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../bind/bind/bind-fix-autoheader-2.69.patch       |  48 +
>  .../bind/bind/bind9_9_5-CVE-2014-8500.patch        | 990 ---------------------
>  .../bind/bind/cross-build-fix.patch                |  21 -
>  .../bind/bind/dont-test-on-host.patch              |  11 +-
>  .../bind/{bind_9.9.5.bb => bind_9.10.1.bb}         |  17 +-
>  5 files changed, 64 insertions(+), 1023 deletions(-)
>  create mode 100644 meta/recipes-connectivity/bind/bind/bind-fix-autoheader-2.69.patch
>  delete mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2014-8500.patch
>  delete mode 100644 meta/recipes-connectivity/bind/bind/cross-build-fix.patch
>  rename meta/recipes-connectivity/bind/{bind_9.9.5.bb => bind_9.10.1.bb} (86%)

This causes a build failure in dhcp:

http://errors.yoctoproject.org/Errors/Search/Args/?items=10&query=31984ee6f39d6ef74c1b5257f204cdea4d031fe4
and
http://errors.yoctoproject.org/Errors/Search/Args/?items=10&query=36b3cb431a0dd06b898b5f1d50bc22a60ffd14f7

Cheers,

Richard


