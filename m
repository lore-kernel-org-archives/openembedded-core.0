Return-Path: <jsbronder@cold-front.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7A8786CD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 15:59:46 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 582C120DC5;
	Wed,  7 Mar 2018 10:59:48 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Wed, 07 Mar 2018 10:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=mimenFiDw4chqZThVNaod/YIwKjZgpey9JRCfiClxAs=; b=rZyna
	QhUdeGzG1NYOuyofNxga8m4kvj1Q8BFL3ybGXftkwtm7WuSoddrwdSLcpQSzx0BZ
	uqQ2iDJj6NzSU82Ecf1/5fWSc5A+m9b+Xq2ByKiGNiIUfXvfooD9Aonid+U/lCGe
	VMhuS4s5Z3EIHU1nRFcKdfy8BAxJBG2AubO6mk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=mimenFiDw4chqZThVNaod/YIwKjZg
	pey9JRCfiClxAs=; b=Gj63A8Khhw+yBIQpHbf5HhL8pmUiggZV29bQkI7yDf/eB
	xlDCZtDbjZkyvebJNrBySqgG/TG8y3xEXx/LWW7/+MKaAcy6pQbfvjXoc3Av0gMG
	iG/VD7JMb2prj2DSgDV4hNe64bDilKCvvg+wZFCI7B7anJaB0JYGPbQ07YIB989v
	L7w62kSqMs4DwNj/u8FTU10hh7ESjq0Zrove6sfW3ej4QJox5N9Od5hZlF+a8B/U
	UFBNnP1ZXEmqkvfJ8B5ZzKFIcpq/aA1VXAxhXFCr5/5LMVcJSY4jJ7euKXw6UJEi
	5duRzwJjjEfdRDTQsLHzoycyV0uMIxCABpZdJnYWA==
X-ME-Sender: <xms:dAygWkywMP_WwgCyXpIKd-kRPgySYbsyNujTQhSHItQOglnNIp_Yqw>
Received: from localhost (cold-front.org [173.230.129.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 155E0247A1;
	Wed,  7 Mar 2018 10:59:48 -0500 (EST)
Date: Wed, 7 Mar 2018 10:59:47 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180307155947.GN23655@lasswell>
References: <20180302220921.21176-1-jsbronder@cold-front.org>
	<21925259-562a-78b6-8616-9345bcfee525@gmail.com>
MIME-Version: 1.0
In-Reply-To: <21925259-562a-78b6-8616-9345bcfee525@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: ccache: update to 3.4.1
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
X-List-Received-Date: Wed, 07 Mar 2018 15:59:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 02/03/18 19:14 -0800, Khem Raj wrote:
> On 3/2/18 2:09 PM, Justin Bronder wrote:
> > https://ccache.samba.org/releasenotes.html#_ccache_3_4_1
> > 
> > License-Update: copyright years and file paths updated
> > 
> > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > ---
> >  meta/recipes-devtools/ccache/ccache_3.3.5.bb | 12 ------------
> >  meta/recipes-devtools/ccache/ccache_3.4.1.bb | 12 ++++++++++++
> >  2 files changed, 12 insertions(+), 12 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/ccache/ccache_3.3.5.bb
> >  create mode 100644 meta/recipes-devtools/ccache/ccache_3.4.1.bb
> > 
> > diff --git a/meta/recipes-devtools/ccache/ccache_3.3.5.bb b/meta/recipes-devtools/ccache/ccache_3.3.5.bb
> > deleted file mode 100644
> > index 929f0f1276..0000000000
> > --- a/meta/recipes-devtools/ccache/ccache_3.3.5.bb
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -require ccache.inc
> > -
> > -LICENSE = "GPLv3+"
> > -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=dae379a85bb6e9d594773e0aa64876f6"
> > -
> > -SRC_URI[md5sum] = "eee58db7cce892febddb989308dc568f"
> > -SRC_URI[sha256sum] = "190576a6e938760ec8113523e6fd380141117303e90766cc4802e770422b30c6"
> > -
> > -SRC_URI += " \
> > -            file://0002-dev.mk.in-fix-file-name-too-long.patch \
> > -            file://Revert-Create-man-page-in-the-make-install-from-git-.patch \
> > -"
> > diff --git a/meta/recipes-devtools/ccache/ccache_3.4.1.bb b/meta/recipes-devtools/ccache/ccache_3.4.1.bb
> > new file mode 100644
> > index 0000000000..e3bf74e9c6
> > --- /dev/null
> > +++ b/meta/recipes-devtools/ccache/ccache_3.4.1.bb
> > @@ -0,0 +1,12 @@
> > +require ccache.inc
> > +
> > +LICENSE = "GPLv3+"
> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fa0d99234a05c3a32d380379d5d064a"
> 
> 
> it seems checksum changed. So please add a short description what
> changed in license terms.

Was the included License-Update tag not enough?  It really is just an update to
the years and dealing with some files moving around in the repo.

> 
> Secondly, please use options to detect renames to git format-patch so we
> can get better diffs for review
> 
> you can make this default behaviour by adding
> 
> [diff]
>         renames = copies
> 
> to ~/.gitconfig

Thanks, will do.

-- 
Justin Bronder

