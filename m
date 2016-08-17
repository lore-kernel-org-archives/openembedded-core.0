Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 71DEA6E660
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 16:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7HGmAB0017269; Wed, 17 Aug 2016 17:48:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nA1S8vE_D2do; Wed, 17 Aug 2016 17:48:10 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7HGm49r017263
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Aug 2016 17:48:05 +0100
Message-ID: <1471452484.20391.228.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <jslater@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2016 17:48:04 +0100
In-Reply-To: <1471302293-16339-1-git-send-email-jslater@windriver.com>
References: <1471302293-16339-1-git-send-email-jslater@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] systemd-compat-units: pkg_postinst() does not work
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
X-List-Received-Date: Wed, 17 Aug 2016 16:48:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-08-15 at 16:04 -0700, Joe Slater wrote:
> The test for various files is wrong and will always be
> true, even if init.d does not exist.
> 
> Exit if init.d does not exist, and correctly test for
> file existence otherwise.
> 
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd-compat-units.bb |   19 +++++++++++
> --------
>  1 file changed, 11 insertions(+), 8 deletions(-)

This appears to break non-systemd world builds:

https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/builds/239/steps/BuildImages/logs/stdio

We probably need to make it depend on the systemd DISTRO_FEATURE. I
appreciate its a side effect of your patch rather than a direct cause.

Cheers,

Richard

