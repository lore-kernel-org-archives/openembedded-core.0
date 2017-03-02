Return-Path: <alexandre.belloni@free-electrons.com>
X-Greylist: delayed 404 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Mar 2017 10:06:02 UTC
Received: from mail.free-electrons.com (mail.free-electrons.com [62.4.15.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6391A7302A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 10:06:02 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id 4D56120766; Thu,  2 Mar 2017 10:59:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [88.191.26.124])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 25800203CE;
	Thu,  2 Mar 2017 10:59:08 +0100 (CET)
Date: Thu, 2 Mar 2017 10:59:08 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Mike Crowe <mac@mcrowe.com>
Message-ID: <20170302095908.l5n4l4nwjgpih5f4@piout.net>
References: <1483558126-13685-1-git-send-email-mac@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <1483558126-13685-1-git-send-email-mac@mcrowe.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mtd-utils: Upgrade to 2.0.0
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
X-List-Received-Date: Thu, 02 Mar 2017 10:06:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On 04/01/2017 at 19:28:46 +0000, Mike Crowe wrote:
> Upstream has started using automake which means that the recipe must now
> inherit from autotools and pkgconfig.
> 
> The source tree has been reorganised too which requires the paths in the
> patches to be modified. None of the patches appear to have been applied
> upstream.
> 

They haven't been applied because they have never been submitted
upstream (despite being tagged with "Upstream-Status: Pending")


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

