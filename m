Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id C44657FC1B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 08:02:54 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id DCA8221F41;
	Tue,  7 Jan 2020 03:02:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Tue, 07 Jan 2020 03:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=EkTOWxFbXJ+DDHbHt00ZsONwdhduF/wgX3idp6zSm
	pE=; b=UYgE698f2YSmkKV0tn04vYXEzMpknY6OdTVrNYKcBundWknqJwuseMi1a
	0+zrKuz9XoLfJprkvLY0QjoMGMI76Q32i/r7xePewS6Xl2Naj6wcoZFexMfY3k3U
	6Lk3ASp5Zu5Ia5lTFmycyj1m8bRLSMIvVBLJQafQQc66hKzhwULE9abpDnPwsVOY
	fDhELCM8lITOYOLdUCUZVMZnBTuzHZ705+QBlxK3O0GPmt6k2/JhCzSfb09di+Cy
	hsRp6SR/PW7+lveq1CAGQO6QcgeY3thV58ElnAcHIKu3RCYfbmZiB405PNSNHXJL
	/hLmw06uOM4mddc5XjBLu67KD/3JA==
X-ME-Sender: <xms:LzsUXgRPopOvkbTM3Syyoc-v07Bf6engB90L6hTpGoee9jvZ9guQKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehuddgudduiecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
	enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghn
	uhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinhepfh
	hrvggvuggvshhkthhophdrohhrghdplhhisggvrhgrphgrhidrtghomhdpphgrthhrvgho
	nhdrtghomhenucfkphepudeliedrvdeggedrudeluddrjeegnecurfgrrhgrmhepmhgrih
	hlfhhrohhmpehtrghnuhhksehikhhirdhfihenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:LzsUXuXTWbrpXMkEW2xgEVo4K3tmhgchzwkzeFBTEPPL44rfD3-0Tg>
	<xmx:LzsUXvAEmE1EkNMFRC-f9NZRGCZ_y6gydmU79lJ4-831D-DXu8Cwug>
	<xmx:LzsUXtvOoiflHS9QlFYesKFat__ediv5IiI9x_Q0EoMKMhD7tmw6CA>
	<xmx:LzsUXvRq3B-X1oRE8Rk7yZ8BdvBvdw2Cmc0njo-5KRBu_XPe0YogEQ>
Received: from laptop (unknown [196.244.191.74])
	by mail.messagingengine.com (Postfix) with ESMTPA id EE69E3060741;
	Tue,  7 Jan 2020 03:02:54 -0500 (EST)
Message-ID: <73cc9e97266e2f24fb8dec8083fa93554b9f1b96.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 07 Jan 2020 10:02:51 +0200
In-Reply-To: <bad795b8-f508-265a-a6a4-52f6d908e4dd@intel.com>
References: <20191121140624.36423-1-tanuk@iki.fi>
	<bad795b8-f508-265a-a6a4-52f6d908e4dd@intel.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH] pulseaudio: 12.2 -> 13.0
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
X-List-Received-Date: Tue, 07 Jan 2020 08:02:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-02 at 21:32 +0000, Ross Burton wrote:
> On 21/11/2019 14:06, Tanu Kaskinen wrote:
> > Release notes:
> > https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/13.0/
> 
> I note that this release adds a meson.build so if anyone is interested 
> in porting another recipe to meson...

I'm starting to look into this.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


