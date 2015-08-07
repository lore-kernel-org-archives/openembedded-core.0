Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BECA275BC6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 11:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t77B1e7N020176; Fri, 7 Aug 2015 12:01:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XqtWpJY8TuuR; Fri,  7 Aug 2015 12:01:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t77B1OLv020155
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 7 Aug 2015 12:01:37 +0100
Message-ID: <1438945283.30467.32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Fri, 07 Aug 2015 06:01:23 -0500
In-Reply-To: <6a9899fa17063139292c39c162444d1a1356ccce.1438619216.git.alexander.kanavin@linux.intel.com>
References: <cover.1438619216.git.alexander.kanavin@linux.intel.com>
	<6a9899fa17063139292c39c162444d1a1356ccce.1438619216.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] fotowall: update SRC_URI to use github instead of qt-apps.org
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
X-List-Received-Date: Fri, 07 Aug 2015 11:01:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-08-03 at 19:29 +0300, Alexander Kanavin wrote:
> GitHub is where upstream development is happening, so we are more likely
> to find out about new releases from there
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-qt/qt-apps/fotowall_0.9.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Also fails on patch application:

https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/83/steps/BuildImages/logs/stdio

so are these really the same version?

Cheers,

Richard


