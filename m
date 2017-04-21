Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 66BE3605BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 09:53:52 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id D46D520A0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 05:53:53 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute5.internal (MEProxy); Fri, 21 Apr 2017 05:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=Fq4oyc0W1AtxBfc6d7ATS7p1jHMoW9xsovrPnJ3bttQ=; b=e2FcNlwT
	vO8X8nDAdL/4c5rOfiENc7RMu55+q54q1XRq8BnqPdztlV7fDdycjGOGngdd2lpT
	+aEhNK8t0xJeW44UXF0Nd4tGtxJNT1T/wSYSJ1kcilCKKXabTUqtkhXiFbt/15NT
	vziq5g58MsZ5/XXJ7GVx9i2Y+zGV8jYehhHAEs5GTRYX+EUaqln+RUcn5Ljnerp2
	77XK3bgXBRJlz9TkW39vgP0fPnV5QfOFrvPmfOCIFMYzBgfJx7MvfB0mkdU1faBy
	woiQY2iYX0z9KHA619F9CWypuph+qSvL1WWwaR6GQBwgkOVhHsiHrzX2MDToKIrS
	PY8GiguxgyrVWw==
X-ME-Sender: <xms:sdb5WEM_pBPRvzOv5xptTjy8kFvIAcKYyXOc-W9mxa-zNGZOSJ-Mwg>
X-Sasl-enc: AYJp4KoTof4UlxwaSNjdleEqXe15ZJXb/51lA0g3D4w0 1492768433
Received: from laptop (unknown [192.40.95.18])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4BF2D240AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 05:53:53 -0400 (EDT)
Message-ID: <1492768432.2475.1.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 12:53:52 +0300
In-Reply-To: <CA+rFJSHDqvsg23XXSQfk0XUpj+0bmcULM_EjddD0NwS9ZZC37Q@mail.gmail.com>
References: <CA+rFJSHcJbmnrtA0jqXXscj7LpV3GR6EcGeBWCGdSPbZeES+SA@mail.gmail.com>
	<1492694665.22019.2.camel@iki.fi>
	<CA+rFJSHDqvsg23XXSQfk0XUpj+0bmcULM_EjddD0NwS9ZZC37Q@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: PulseAudio with WebRTC echo cancellation (aec): support for webrtc-audio-processing package
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
X-List-Received-Date: Fri, 21 Apr 2017 09:53:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-04-20 at 22:14 +0200, Koenraad Verheyden wrote:
> I am not familiar with the organization of the various recipes. I
> mentioned oe-core since the original message was posted there.
> Meta-oe seems more suitable indeed.
> 
> How much work would it be to make a recipe for this?
> I need it for a short-term project and am not in a position to further
> support it afterwards.

Writing the recipe should be fairly simple. I can do that at some
point, but if you want it fast, write the recipe yourself. I volunteer
to maintain it.

-- 
Tanu

https://www.patreon.com/tanuk

