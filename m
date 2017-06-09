Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2D778290
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 16:38:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 1A74320791;
	Fri,  9 Jun 2017 12:38:31 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Fri, 09 Jun 2017 12:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=VtCZXdNXCawU9ymfr5H1rpeBsk2lJObJ1ZkHj8RCYM0=; b=fv/Ltt2d
	mHliSHkHIp1zaiw9hfXcuikTAYZGl9iAL/ege392/dJqN29cSeOue2GEZfNgfBjF
	BJtLjU7UifxdKaHOMcOUSgdhzA5x9abx8NJHayFUDs7S8NuhO2ZKvZr5p9XI0L35
	NwzY5IRY7WL11xXtv5qh9sLReowWoC9dwbggyoi8RZeo6w6Iwoiwc0B6/hYDOXsq
	iv/nzXdRANut+hzPMboOeoXt0R2ee/jxQWkrJuI/B5EF5SrCumAJRnmGxW5HYRyW
	ZU2/31TQQ9rFAaM0Nwp8W78gq3WH+2hf/ONrwGx253KZodLNaXhzqYHmwI6ovjLV
	aKEnJZtVIFO/Gg==
X-ME-Sender: <xms:B886WcMLvNoBKS5Nkv2mnvwXUhKuNGLnjKw4odSVRtVRUR2FrBQfQA>
X-Sasl-enc: AUXJlfYWO3hb470sXLb9CnzR1SZBz8iKipkouGb99wmZ 1497026310
Received: from laptop (unknown [192.40.95.36])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4DB477E850;
	Fri,  9 Jun 2017 12:38:30 -0400 (EDT)
Message-ID: <1497026309.2435.5.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 09 Jun 2017 19:38:29 +0300
In-Reply-To: <CAMKF1srdVU0p-e4gPJx5rNEhk4aQdsiELuz+-1AsD_tgG6b_Gw@mail.gmail.com>
References: <cover.1496979431.git.raj.khem@gmail.com>
	<c0e598696af9be3f567751a8641effb08431a7d2.1496979431.git.raj.khem@gmail.com>
	<CAJTo0La6u=Tzzsow5ZYwqmWHY8RzyvgVqT=J4J9UpKy8uKbb9A@mail.gmail.com>
	<CAMKF1srdVU0p-e4gPJx5rNEhk4aQdsiELuz+-1AsD_tgG6b_Gw@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] pulseaudio: disable PIE flags when hardened flags are enabled
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
X-List-Received-Date: Fri, 09 Jun 2017 16:38:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-09 at 13:07 +0000, Khem Raj wrote:
> On Fri, Jun 9, 2017 at 5:56 AM Burton, Ross <ross.burton@intel.com> wrote:
> 
> > 
> > On 9 June 2017 at 04:41, Khem Raj <raj.khem@gmail.com> wrote:
> > 
> > > +SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
> > > 
> > 
> > These tend to go into security-flags.inc, not the recipe.
> > 
> 
> I know that's been the case but I think having a global file is error prone
> its better to have it in recipe context since it can get attention at
> upgrade time to test if this has been fixed in new release etc

Do you mean that there's some bug in pulseaudio, and this is a
workaround for it? Is the bug that there are textrels? Ross saw
textrels in pulseaudio before (see the discussion starting at [1]), but
I was unable to reproduce that. If you give instructions for
reproducing the problem, I'll see if I can fix pulseaudio (until then
I'm fine with having a workaround).

[1] http://lists.openembedded.org/pipermail/openembedded-core/2017-February/133215.html

-- 
Tanu

https://www.patreon.com/tanuk

