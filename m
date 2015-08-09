Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E363E7646B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 23:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t79NTqWX006812; Mon, 10 Aug 2015 00:29:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id km47xEqZhsNY; Mon, 10 Aug 2015 00:29:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t79NTZjN006806
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 10 Aug 2015 00:29:48 +0100
Message-ID: <1439162974.30467.156.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 09 Aug 2015 16:29:34 -0700
In-Reply-To: <7FCE78C2-85DC-44BF-8C64-7912AB432468@gmail.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
	<cover.1438956967.git.alexander.kanavin@linux.intel.com>
	<45936f059111b38f8850d5972db1ea1485dee82a.1438956967.git.alexander.kanavin@linux.intel.com>
	<7FCE78C2-85DC-44BF-8C64-7912AB432468@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/7] gptfdisk: update to 1.0.0
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
X-List-Received-Date: Sun, 09 Aug 2015 23:29:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2015-08-08 at 12:48 -0700, Khem Raj wrote:
> > On Aug 7, 2015, at 7:28 AM, Alexander Kanavin <alexander.kanavin@linux.intel.com> wrote:
> > 
> > Also, use tarballs instead of git for fetching source code.
> > git repository does not have version tags, so upstream version check
> > cannot be performed.
> > 
> > Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> > ---
> > .../recipes-devtools/fdisk/{gptfdisk_git.bb => gptfdisk_1.0.0.bb} | 8 +++-----
> > 1 file changed, 3 insertions(+), 5 deletions(-)
> > rename meta/recipes-devtools/fdisk/{gptfdisk_git.bb => gptfdisk_1.0.0.bb} (75%)
> > 
> > diff --git a/meta/recipes-devtools/fdisk/gptfdisk_git.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
> > similarity index 75%
> > rename from meta/recipes-devtools/fdisk/gptfdisk_git.bb
> > rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
> > index 477c1d9..f4b0e32 100644
> > --- a/meta/recipes-devtools/fdisk/gptfdisk_git.bb
> > +++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
> > @@ -5,11 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> > 
> > DEPENDS = "util-linux popt ncurses"
> > 
> > -PV = "0.8.10+git${SRCPV}”
> 
> its always preferable to have PV contain SRCPV for recipes using SCM based fetch mechanism. Don’t drop it

There has been discussion about this in other threads and the conclusion
reached is that where there is a specific version being selected, having
PV of that specific version is a good thing. With "1.0.0+gitXXX" its
unclear if its really 1.0.0 or not.

Cheers,

Richard




