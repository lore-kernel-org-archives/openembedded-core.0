Return-Path: <jsbronder@cold-front.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id A1187719C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 22:11:46 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id BB57C20DA6;
	Fri,  2 Mar 2018 17:11:47 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Fri, 02 Mar 2018 17:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=Si367MK4OvEaiPhbSMeueN7tziG6D/g6uAPvzGw83yw=; b=pI5vy
	qVXjgxX71D+mlU8OMa05pDIsh1mUHlevLgyhTDKEaq8VCCVSdd6TTzcr1Q7MdvF6
	xZvhlOXALlma0yOe/pEuaLj+MjPvGR+ZQ/l/s6RzmiRrltKlPFF6eUYkrKZro7+c
	E/H5JfLsQazPVH5aM63EV0jSkW9i6T5hYhefvU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=Si367MK4OvEaiPhbSMeueN7tziG6D
	/g6uAPvzGw83yw=; b=PNMnC53IkOgKYldxk9FkzMxyuNVknxRCIw27NOgHm2iMl
	G8ryHNqAHLcuxrumE5ISjmSR3Bypc8Xl3snH9/1xi4Hk5s6EnDcDMghftkkgdX0J
	HK++3uOgIVHftb00Ew1yHLBb6mmUPaTZm1z8G4D9ZMh+pZ2IneV2wG49forhPu5o
	MHswmc7r3zUZkdxn01UjBC4N5d4WQUudnDfJPo82LCM8SkwBU1wWtoGuwQOX4D7R
	Tq9iWTnAMT7nOYLNvaU4MYauaUHYZRdMOZeC68zM22SnnBo0vkXSlbH1xX7z8h2Y
	wx32ziJrYF0vfVWArmJD+oXO/+tWyySvwnyCTJevQ==
X-ME-Sender: <xms:I8yZWhu6vG8e4P8ATe0fg_voGuSHcHRwnbCk8Qc0LPzOtn0rrrfOuA>
Received: from localhost (cold-front.org [173.230.129.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7E2AF24733;
	Fri,  2 Mar 2018 17:11:47 -0500 (EST)
Date: Fri, 2 Mar 2018 17:11:47 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20180302221147.GM23655@lasswell>
References: <20180302215817.20179-1-jsbronder@cold-front.org>
	<20180302220637.GT2786@denix.org>
MIME-Version: 1.0
In-Reply-To: <20180302220637.GT2786@denix.org>
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
X-List-Received-Date: Fri, 02 Mar 2018 22:11:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 02/03/18 17:06 -0500, Denys Dmytriyenko wrote:
> On Fri, Mar 02, 2018 at 04:58:17PM -0500, Justin Bronder wrote:
> > https://ccache.samba.org/releasenotes.html#_ccache_3_4_1
> > 
> > License-Update: copyright years and file paths updated
> > 
> > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > ---
> >  meta/recipes-devtools/ccache/ccache_3.3.4.bb | 12 ------------
> >  meta/recipes-devtools/ccache/ccache_3.4.1.bb | 12 ++++++++++++
> 
> Please use -C/-M (--find-copies/--find-renames) flags to simplify review.

Sorry, I will do so in the future.

Note that I did just send a v2 fixing the patchtest failure prior to seeing this
email.

-- 
Justin Bronder

