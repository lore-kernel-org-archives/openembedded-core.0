Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 387 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 May 2019 19:06:08 UTC
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 0E82C7E508
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 19:06:08 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id EB38821C47;
	Fri, 24 May 2019 14:59:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Fri, 24 May 2019 14:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=78w2IJM5cQIsvxPMCeMAesM3vTwGGWQKQ7Ahw8wwz
	PM=; b=fGimiILCY7rY+hwcnbToY6kQtpU2BenvEwiP8HSOTc7EzKG8yM8pr33BJ
	0Z6g1JhehjiLX4wF8B5WV9+rgV1F9tMnthJ3LxbN0u6R8exs4oTGsC++2+BCrcRI
	LcA6YSJO/qKf4nvqglVNO9jpH4Brx2mKUS2oO8WD9isZRSEptTiCipMEkrrwvLXx
	Gu8dRnw6ccSfykh59mNJgn3HkNOzni/7J5dxuCHORXk7svkRcUPa6KqmiwXyDz5j
	6pn3eD0DWHA7LqCva+Ihk0ddKAH3k8CuwL59nkLPMangkv9TQCqnurWB0A/Ogcsj
	zZ+bMXxiqkLqI4iYwS1rsnTLDZBtw==
X-ME-Sender: <xms:Gz_oXH33_HgwtFqwwleBTY-L3zVZe9K_Ce7j5j5FDHMEFtsumCkxnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduiedgudefhecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
	enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghn
	uhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinheplh
	hisggvrhgrphgrhidrtghomhdpohhpvghnvghmsggvugguvggurdhorhhgpdhprghtrhgv
	ohhnrdgtohhmnecukfhppeduledvrdegtddrleehrdefjeenucfrrghrrghmpehmrghilh
	hfrhhomhepthgrnhhukhesihhkihdrfhhinecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Gz_oXJFk6tHrPamdYWlt2MG-HKM5W827z15bKmPeL7VC4Tq5qSIFKw>
	<xmx:Gz_oXDga10bmfQL6_jDGx6jQR9XckPFUnk7CpGcz_kk8nQAGLFkXig>
	<xmx:Gz_oXLgEjGl7jRb8Qq5i7SKTbVHxrZtkFqpyKRC-QrmRsrdQ3tyuHQ>
	<xmx:Gz_oXEZnmxnngCihy9mWmhqT7M1U9r9vv80CmQbDykBuZ2IUlGPyBA>
Received: from laptop (unknown [192.40.95.37])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0A938380083;
	Fri, 24 May 2019 14:59:37 -0400 (EDT)
Message-ID: <d06ff93257184dae284426f6d8f52672f351f1af.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Ming Liu
	<liu.ming50@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 May 2019 21:59:29 +0300
In-Reply-To: <a59002825b793658afa2606f0d110d70a08e2384.camel@linuxfoundation.org>
References: <1558679856-10339-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LbEXnKfSfOtpj3QVL9xsjsQJTuiZAGarPEFNz4v7q7_8w@mail.gmail.com>
	<CALatG=5SSBOa_TyQh8vY-iYshvp6+XHCS-Lg7tHCg_-qSay2YQ@mail.gmail.com>
	<a59002825b793658afa2606f0d110d70a08e2384.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] alsa-utils: fix multilib names
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
X-List-Received-Date: Fri, 24 May 2019 19:06:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-05-24 at 18:18 +0100, Richard Purdie wrote:
> On Fri, 2019-05-24 at 15:19 +0200, Ming Liu wrote:
> > Wouldn't that break the alsa-utils-scripts? Since ALSA_UTILS_PKGS is
> > being depended by both alsa-utils and alsa-utils-scripts.
> > 
> > I did that in V1, but as Richard Purdie pointed out, it will break
> > the alsa-utils-scripts build.
> 
> I was about to say we should refactor these recipes and create a common
> inc file.
> 
> Looking at the justification in alsa-utils (avoid a bash dependency),
> that is a runtime issue, not a build time one. We should merge these
> recipes and ensure the packaging remains the same.
> 
> We can then avoid some of these problems, use PN and have a simpler
> recipe. These changes should be done in multiple commits, one per
> change as usual.
> 
> Is there any reason I'm missing not to do this?

I'm not sure if you already found the original commit[1] that
introduced this split. The commit message is:

    alsa-utils: Move alsaconf to its own recipe
    
    18575b082a4042376fd1575465e69562dea04ddc added bash as a dependency of
    alsa-utils-alsaconf so that the script interpreter will be available at
    run time.  However, this has the undesirable side effect of making bash
    be a build dependency for alsa-utils and, for those folks who don't need
    alsaconf but do want some other part of alsa-utils, this cure is worse
    than the original disease.
    
    Fix this by moving alsaconf to a separate recipe so that the bash
    dependency only applies when alsaconf is specifically requested.
    
    Signed-off-by: Phil Blundell <philb@gnu.org>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>

I can't really judge if that justification makes sense. If the
justification is valid, maybe there's a better solution for avoiding
the build dependency on bash for those people who don't need the
scripts?

[1] http://cgit.openembedded.org/openembedded-core/commit/?id=7317c8055cf3af8912a66badb3074f0a60f75ec2

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


