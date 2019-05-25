Return-Path: <tanuk@iki.fi>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id 0CCD67D714
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 16:29:55 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 04D7520E7B;
	Sat, 25 May 2019 12:29:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Sat, 25 May 2019 12:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=bjdKAwYj+hZygyIWm8tQB4eKLrG+1yOtavBa8mQsQ
	tU=; b=WD/qxDYd2+/bChlm3fmmggFwvmBun2vySD5BcV/6V0l7t+RlQhwOntxvX
	o7tvTyMMTO48ouwr3/atKFYQn2MPx/4hgs6qEdZFfRbwdZkPVzAShrx2a1OevMaU
	YMj4eAJdSyk3EtYHPurKNtMREwObwaT4okuJeMHUAUs8At1EuL6D29hLH24QLfaN
	q933hLXS/3wPQJWju2Ojr98Pi+HogFIEhHsxJ9yXl2AFVFlV1AWEThT8X17BMmrA
	lmu/nAl0oyl/pfpI0l2L6C3S5o5Ttdfezk0CRAhY3UjVgVE6KFEvvRqMXGvEJ292
	tGFJeSmRZBHcsf1MX1K9S+Gj5Hs4g==
X-ME-Sender: <xms:hG3pXAxpQ2CUR9SMq_pB8Mo80vU1ZoGFOsAZZpeqnZuSfRUAjtWAaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedguddtgecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
	enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghn
	uhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinheplh
	hisggvrhgrphgrhidrtghomhdpphgrthhrvghonhdrtghomhenucfkphepudelvddrgedt
	rdelhedrfeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfih
	enucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:hG3pXCqCyhStf1UXpHo1ZwI2_mFSfIE9nBQ4BELizE9qLX4WD9UwTQ>
	<xmx:hG3pXExOhQhZiRoFhnkXf_9rHqpOUQSNJZAECV3Yh9O9kvQQcU7RrQ>
	<xmx:hG3pXLv8C7C9389tkykmS01l2asMhBk_9a6lGo6ddzacArowO-KChQ>
	<xmx:hG3pXM8py_-giwg6LPCQCSEEJgx3k2HwhV0M30gfl6KQL1nQ81hCHg>
Received: from laptop (unknown [192.40.95.37])
	by mail.messagingengine.com (Postfix) with ESMTPA id 58B558005B;
	Sat, 25 May 2019 12:29:55 -0400 (EDT)
Message-ID: <614a8e67ded0ff9bfda92635daba3f905915dfd3.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 25 May 2019 19:29:46 +0300
In-Reply-To: <CAJTo0LZJMyAFw_6jD0ZJjQUqQQ2CnbL_RptF4DXA5BJBNP8uCw@mail.gmail.com>
References: <1558679856-10339-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LbEXnKfSfOtpj3QVL9xsjsQJTuiZAGarPEFNz4v7q7_8w@mail.gmail.com>
	<CALatG=5SSBOa_TyQh8vY-iYshvp6+XHCS-Lg7tHCg_-qSay2YQ@mail.gmail.com>
	<a59002825b793658afa2606f0d110d70a08e2384.camel@linuxfoundation.org>
	<d06ff93257184dae284426f6d8f52672f351f1af.camel@iki.fi>
	<CAJTo0LZJMyAFw_6jD0ZJjQUqQQ2CnbL_RptF4DXA5BJBNP8uCw@mail.gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ming Liu <liu.ming50@gmail.com>
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
X-List-Received-Date: Sat, 25 May 2019 16:29:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-05-25 at 17:04 +0100, Burton, Ross wrote:
> In related news I've been meaning to gut the alsa-utils recipe as
> that's the last recipe that actually depends on gtk2.

You mean alsa-tools, not alsa-utils, right? I won't object removing
alsa-tools from OE Core.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


