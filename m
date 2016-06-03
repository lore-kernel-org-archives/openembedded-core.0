Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 06DC4774E1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 06:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u536m2tC020140; Fri, 3 Jun 2016 07:48:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HhdpICYzu75Y; Fri,  3 Jun 2016 07:48:02 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u536lxOE020126
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Jun 2016 07:48:00 +0100
Message-ID: <1464936479.13979.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 03 Jun 2016 07:47:59 +0100
In-Reply-To: <1464899019-2487-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1464892387-696-1-git-send-email-alejandro.delcastillo@ni.com>
	<1464899019-2487-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] opkg-utils: update SRCREV
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
X-List-Received-Date: Fri, 03 Jun 2016 06:48:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-06-02 at 15:23 -0500, Alejandro del Castillo wrote:
> Drop patches now included in newer SRCREV. Update HOMEPAGE and PV
> version to better align with opkg. Current revision include:
> 
> * Python 3 compatibility
> * Improved error handling
> 
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  ...re-do-find-ls-code-to-not-fail-on-filenam.patch | 56 ------------
> ----------
>  .../opkg-build-Exit-when-fail-to-list-files.patch  | 45 ------------
> -----
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 10 ++--
>  3 files changed, 4 insertions(+), 107 deletions(-)
>  delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001
> -opkg-build-re-do-find-ls-code-to-not-fail-on-filenam.patch
>  delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/opkg
> -build-Exit-when-fail-to-list-files.patch

Sadly this failed on the autobuilder under testing:

https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/7
87/steps/BuildImages/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib

Cheers,

Richard

